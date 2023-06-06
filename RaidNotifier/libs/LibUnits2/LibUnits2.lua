local lib = {}
LibUnits2 = lib

local function Log(message, ...)
	--df("[LibUnits2] %s", message:format(...))
end
lib.Log = Log
lib.cm = ZO_CallbackObject:New()

local function OnEffectChanged(_, change, _, _, unitTag, _, _, _, _, _, _, _, _, unitName, unitId, abilityId)
	if change == EFFECT_RESULT_GAINED then
		if lib.unitIds[unitName] ~= unitId then
			if lib.units[unitId] then
				lib.Log("Unregistering [%s] for #%d", lib.units[unitId], unitId)
				lib.unitIds[ lib.units[unitId] ] = nil
			end
			lib.Log("Registering [%s] for #%d (%s)", unitName, unitId, unitTag)
		end
		lib.units[unitId] = unitName
		lib.unitIds[unitName] = unitId
		lib.unitTags.group[unitId] = unitTag
	end
end

local function OnBossEffectChanged(_, change, _, _, unitTag, _, _, _, _, _, _, _, _, unitName, unitId, abilityId)
	if change == EFFECT_RESULT_GAINED then
		--no need to check for existing id
		if not lib.units[unitId] then
			lib.Log("Registering [%s] for #%d (%s)", unitName, unitId, unitTag)
			lib.units[unitId] = unitName
			lib.unitIds[unitName] = unitId
			lib.unitTags.boss[unitId] = unitTag
		end
	end
end

function lib.RefreshUnits()
	--unassign all unit tags
	lib.unitTags.group = {}
	lib.displayNames = {}
	--link new unit tags
	for i=1, GetGroupSize() do
		local unitTag = GetGroupUnitTagByIndex(i)
		local unitName = GetRawUnitName(unitTag)
		local unitId = lib.unitIds[unitName]
		if unitId ~= nil then
			lib.unitTags.group[unitId] = unitTag
			lib.Log("Assigning (%s) to [%s] for #%d", unitTag, unitName, unitId)
		end
		lib.displayNames[unitName] = GetUnitDisplayName(unitTag)
	end
	--remove unowned
	for name, id in pairs(lib.unitIds) do
		if not lib.unitTags.group[id] then
			lib.Log("Removing [%s] for #%d", name, id)
			lib.units[id] = nil
			lib.unitIds[name] = nil
		end
	end
end

--------------------------------------------------------- Public ------------------------------------------------------

function lib.GetUnitIdForName(unitName)
	return lib.unitIds[unitName] or 0
end

function lib.GetUnitTagForUnitId(unitId)
	return lib.unitTags.group[unitId] or lib.unitTags.boss[unitId] or ""
end

function lib.GetNameForUnitId(unitId)
	return lib.units[unitId] or ""
end

function lib.GetDisplayNameForUnitId(unitId)
	return lib.displayNames[lib.GetNameForUnitId(unitId)] or ""
end

---------------------------------------------------- Initialization ---------------------------------------------------

local function Unload()
    EVENT_MANAGER:UnregisterForEvent("LibUnits2", EVENT_GROUP_MEMBER_JOINED)
    EVENT_MANAGER:UnregisterForEvent("LibUnits2", EVENT_GROUP_MEMBER_LEFT)
	EVENT_MANAGER:UnregisterForEvent("LibUnits2", EVENT_GROUP_UPDATE)
	EVENT_MANAGER:UnregisterForEvent("LibUnits2_EffectChangedGroup",  EVENT_EFFECT_CHANGED)
	EVENT_MANAGER:UnregisterForEvent("LibUnits2", EVENT_BOSSES_CHANGED)
	EVENT_MANAGER:UnregisterForEvent("LibUnits2_EffectChangedBoss",  EVENT_EFFECT_CHANGED)
end

local function Load()

	lib.units = {}
	lib.unitIds = {}
	lib.unitTags = {}
	lib.unitTags.group = {}
	lib.unitTags.boss = {}
	lib.displayNames = {}

	-- During group invitation, we can receive a lot of event spam at once on a single invite when the
	-- involved players are at the same location. Add a delay so we only refresh once in cases like this.
	lib.delayedRebuildCounter = 0
    local function DelayedRefreshData()
        lib.delayedRebuildCounter = lib.delayedRebuildCounter - 1
        if lib.delayedRebuildCounter == 0 then
            lib.RefreshUnits()
        end
    end
    local function RegisterDelayedRefresh()
        lib.delayedRebuildCounter = lib.delayedRebuildCounter + 1
        zo_callLater(DelayedRefreshData, 50)
    end
    local function RegisterDelayedRefreshOnUnitEvent(eventCode, unitTag)
        if ZO_Group_IsGroupUnitTag(unitTag) then
            RegisterDelayedRefresh()
        end
    end

    EVENT_MANAGER:RegisterForEvent("LibUnits2", EVENT_GROUP_MEMBER_JOINED, RegisterDelayedRefreshOnUnitEvent)
    EVENT_MANAGER:RegisterForEvent("LibUnits2", EVENT_GROUP_MEMBER_LEFT, RegisterDelayedRefreshOnUnitEvent)
	EVENT_MANAGER:RegisterForEvent("LibUnits2", EVENT_GROUP_UPDATE, RegisterDelayedRefresh)

	EVENT_MANAGER:RegisterForEvent("LibUnits2_EffectChangedGroup",  EVENT_EFFECT_CHANGED, OnEffectChanged)
	EVENT_MANAGER:AddFilterForEvent("LibUnits2_EffectChangedGroup", EVENT_EFFECT_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, "group")

	-- Track Bosses
	EVENT_MANAGER:RegisterForEvent("LibUnits2", EVENT_BOSSES_CHANGED, function() lib.unitTags.boss = {} end)
	-- Seperate handle for bosses, no specific ability to monitor
	EVENT_MANAGER:RegisterForEvent("LibUnits2_EffectChangedBoss",  EVENT_EFFECT_CHANGED, OnBossEffectChanged)
	EVENT_MANAGER:AddFilterForEvent("LibUnits2_EffectChangedBoss", EVENT_EFFECT_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, "boss")

	-- We'd like to have relevant data after reloading UI or relogging
	lib.RefreshUnits()

	lib.Unload = Unload
end

Load()
