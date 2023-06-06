local Srendarr		= _G['Srendarr'] -- grab addon table from global
local L				= Srendarr:GetLocale()

-- CONSTS --
local ABILITY_TYPE_CHANGEAPPEARANCE	= ABILITY_TYPE_CHANGEAPPEARANCE
local ABILITY_TYPE_AREAEFFECT		= ABILITY_TYPE_AREAEFFECT
local ABILITY_TYPE_NONE 			= ABILITY_TYPE_NONE
local BUFF_EFFECT_TYPE_BUFF			= BUFF_EFFECT_TYPE_BUFF
local BUFF_EFFECT_TYPE_DEBUFF		= BUFF_EFFECT_TYPE_DEBUFF
local GROUP_PLAYER_SHORT			= Srendarr.GROUP_PLAYER_SHORT
local GROUP_PLAYER_LONG				= Srendarr.GROUP_PLAYER_LONG
local GROUP_PLAYER_TOGGLED			= Srendarr.GROUP_PLAYER_TOGGLED
local GROUP_PLAYER_PASSIVE			= Srendarr.GROUP_PLAYER_PASSIVE
local GROUP_PLAYER_DEBUFF			= Srendarr.GROUP_PLAYER_DEBUFF
local GROUP_PLAYER_GROUND			= Srendarr.GROUP_PLAYER_GROUND
local GROUP_PLAYER_MAJOR			= Srendarr.GROUP_PLAYER_MAJOR
local GROUP_PLAYER_MINOR			= Srendarr.GROUP_PLAYER_MINOR
local GROUP_PLAYER_ENCHANT			= Srendarr.GROUP_PLAYER_ENCHANT
local GROUP_TARGET_BUFF				= Srendarr.GROUP_TARGET_BUFF
local GROUP_TARGET_DEBUFF			= Srendarr.GROUP_TARGET_DEBUFF
local GROUP_CDTRACKER				= Srendarr.GROUP_CDTRACKER
local GROUP_CDBAR					= Srendarr.GROUP_CDBAR
local AURA_TYPE_TIMED				= Srendarr.AURA_TYPE_TIMED
local AURA_TYPE_TOGGLED				= Srendarr.AURA_TYPE_TOGGLED
local AURA_TYPE_PASSIVE				= Srendarr.AURA_TYPE_PASSIVE
local DEBUFF_TYPE_PASSIVE			= Srendarr.DEBUFF_TYPE_PASSIVE
local DEBUFF_TYPE_TIMED				= Srendarr.DEBUFF_TYPE_TIMED
local STR_PROMBYID					= Srendarr.STR_PROMBYID

-- UPVALUES --
local GetGameTimeMillis				= GetGameTimeMilliseconds
local IsToggledAura					= Srendarr.IsToggledAura
local IsMajorEffect					= Srendarr.IsMajorEffect	-- technically only used for major|minor buffs on the player, major|minor debuffs
local IsMinorEffect					= Srendarr.IsMinorEffect	-- are filtered to the debuff grouping before being checked for
local IsEnchantProc					= Srendarr.IsEnchantProc
local IsAlternateAura				= Srendarr.IsAlternateAura
local auraLookup					= Srendarr.auraLookup
local filteredAuras					= Srendarr.filteredAuras
local GetAbilityName				= GetAbilityName
local ZOSName						= function (abilityID) return zo_strformat("<<t:1>>", GetAbilityName(abilityID)) end

-- FAKE AURA MULTI TRACKING --
local trackTargets					= {}
local fakeTargetsDB					= {}

-- RECENT AURAS -- 
Srendarr.recentPlayerBuffs			= {}
Srendarr.recentPlayerDebuffs		= {}
Srendarr.recentTargetBuffs			= {}
Srendarr.recentTargetDebuffs		= {}
Srendarr.recentGroundAOE			= {}

Srendarr.targetName = "" -- current target unit name if present (Phinix)

-- PROMINENT AURAS --
Srendarr.prominentIDs				= {}
local prominentPlayer				= {}
local prominentTarget				= {}
local prominentAOE					= {}

local groupBuffs					= {}
local groupDebuffs					= {}
local displayFrameRef				= {}
local debugAuras					= {}

local combatEventFilters			= {pA={},gB={},gD={}}

local playerName					= zo_strformat("<<t:1>>", GetUnitName('player'))
local shortBuffThreshold, passiveEffectsAsPassive, filterDisguisesOnPlayer, filterDisguisesOnTarget
local rAuraValues = {rPB = 0, rPD = 0, rTB = 0, rTD = 0, aAOE = 0} 
local Srendarr_APIVersion = GetAPIVersion()


-- ------------------------
-- HELPER FUNCTIONS
-- ------------------------
local displayFrameFake = {
	['AddAuraToDisplay'] = function()
 		-- do nothing : used to make the AuraHandler code more manageable, redirects unwanted auras to nil
	end,
}

local function addRecentAura(cTable, auraName, abilityId, unitTag, icon, type) -- keep a list of auras you have seen this session by target category
	local tName = (auraName == Srendarr.OffBalance.obN2) and Srendarr.OffBalance.obN1 or auraName
	local data = {name = tName, unit = unitTag, icon = icon, type = type}
	cTable[abilityId] = data
end


-- ------------------------
-- AURA HANDLER
-- ------------------------
local function AuraHandler(flagBurst, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, castByPlayer, stacks, isCooldown, isProminent, isSpecial)
	local alwaysIgnore					= Srendarr.alwaysIgnore
	local groupBuffBlacklist			= Srendarr.db.filtersGroup.groupBuffBlacklist
	local groupDebuffBlacklist			= Srendarr.db.filtersGroup.groupDebuffBlacklist
	local groupBuffsEnabled				= Srendarr.db.filtersGroup.groupBuffsEnabled
	local groupDebuffsEnabled			= Srendarr.db.filtersGroup.groupDebuffsEnabled
	local groupBuffOnlyPlayer			= Srendarr.db.filtersGroup.groupBuffOnlyPlayer
	local IsGroupUnit					= Srendarr.IsGroupUnit(unitTag)
	local abilityCooldowns				= Srendarr.abilityCooldowns
	local specialNames					= Srendarr.specialNames
	local alteredAuraIcons				= Srendarr.alteredAuraIcons
	local groupUnits					= Srendarr.groupUnits
	local nStacks = (stacks ~= nil) and stacks or 0
	local minTime = Srendarr.MIN_TIMER
	local pCast = (castByPlayer == 1 or castByPlayer == 31) and true or false

	auraName = zo_strformat("<<t:1>>", auraName)

	-- Global Blacklist
	if Srendarr.alwaysIgnore[abilityId] then return end

	if IsGroupUnit then -- handle blacklisted group auras (Phinix)
		if (effectType == BUFF_EFFECT_TYPE_DEBUFF) then
			if not groupDebuffsEnabled then return end
			local groupDebuff = (groupDebuffs[abilityId] ~= nil) and true or false 
			if (groupDebuffBlacklist and groupDebuff) or (not groupDebuffBlacklist and not groupDebuff) then
				return
			end
		elseif (effectType == BUFF_EFFECT_TYPE_BUFF) then
			if not groupBuffsEnabled then return end
			if groupBuffOnlyPlayer and (castByPlayer ~= 1 and castByPlayer ~= 31) then
				return
			end -- only show player-sourced group buffs when enabled (Phinix)
			local groupBuff = (groupBuffs[abilityId] ~= nil) and true or false 
			if (groupBuffBlacklist and groupBuff) or (not groupBuffBlacklist and not groupBuff) then
				return
			end
		end
	end

	if filteredAuras[unitTag] ~= nil then -- set filter state to abort quickly later if blacklisted and not a prominent aura
		if (filteredAuras[unitTag][abilityId]) then return end -- abort immediately if this is an ability we've filtered and not whitelisted
	end

	if (isSpecial) then -- allows Srendarr's non-game-tracked auras to appear on the group frame (Phinix)
		if groupUnits[unitTag] then
			if (auraLookup[unitTag][abilityId]) then
				auraLookup[unitTag][abilityId]:Update(start, finish, nStacks)
				return
			end
			local pAuraType -- make sure prominent auras use player set aura type color assignments (Phinix)
			if start == finish then
				pAuraType = (effectType == BUFF_EFFECT_TYPE_DEBUFF) and DEBUFF_TYPE_PASSIVE or (IsToggledAura(abilityId)) and AURA_TYPE_TOGGLED or AURA_TYPE_PASSIVE
			else
				pAuraType = (effectType == BUFF_EFFECT_TYPE_DEBUFF) and DEBUFF_TYPE_TIMED or AURA_TYPE_TIMED
			end
			local groupFrame = groupUnits[unitTag].index + ((pAuraType == DEBUFF_TYPE_PASSIVE or pAuraType == DEBUFF_TYPE_TIMED) and 24 or 0)
			displayFrameRef[groupFrame]:AddAuraToDisplay(flagBurst, groupFrame, pAuraType, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
		end
		return
	end

	if (isCooldown) then -- Send proc to cooldown tracker separate from ability tracking (Phinix)
		local cdID = abilityId+4000000
		local abID = abilityId+5000000

		if (castByPlayer == 1) then -- only track player's proc cooldowns to avoid giant mess (Phinix)
			if Srendarr.db.auraGroups[GROUP_CDTRACKER] ~= 0 then -- only process if frame is actually assigned/shown (Phinix)
				if filteredAuras['player'] ~= nil then
					if not filteredAuras['player'][cdID] then -- allows blacklisting individual set cooldowns by the displayed ID (offset by 4000000) (Phinix)
						displayFrameRef[GROUP_CDTRACKER]:AddAuraToDisplay(flagBurst, GROUP_CDTRACKER, AURA_TYPE_TIMED, auraName..' '..L.Group_Cooldown, 'player', start, start+abilityCooldowns[abilityId].CD, icon, effectType, abilityType, cdID, nStacks, false, true)
					end
				end
			end
		end
		if (not abilityCooldowns[abilityId].hT) then return end -- avoid sending non-timer procs to handler (Phinix)
		if specialNames[abilityId] ~= nil then auraName = specialNames[abilityId].name end -- Revert cooldown proc timer name to default buff name if ID added to specialNames (Phinix)
		if alteredAuraIcons[abilityId] ~= nil then icon = alteredAuraIcons[abilityId] end -- Change cooldown proc timer icon separate from the cooldown tracker icon (Phinix)
		if unitTag == 'reticleover' then effectType = BUFF_EFFECT_TYPE_DEBUFF end -- if timed effect is on target switch to debuff (Phinix)
	end

	-- Aura exists, update its data (assume would not exist unless passed filters earlier)
	if (auraLookup[unitTag][abilityId]) then
		if IsGroupUnit then
			if Srendarr.GroupEnabled then auraLookup[unitTag][abilityId]:Update(start, finish, nStacks) else return end
		else
			auraLookup[unitTag][abilityId]:Update(start, finish, nStacks)
		end
		return
	end

	if (start ~= finish and (finish - start) < minTime) then return end -- abort showing any timed auras with a duration of < minTime seconds

	if (isProminent) then -- Prominent aura detected, assign to appropriate window
		if abilityId ~= Srendarr.BahseiData.ID and abilityId ~= Srendarr.POrderData.ID then
			local function GetProminentValues() -- check if aura is set to prominent for a given target and type and set parameters (Phinix)
				local promData
				if unitTag == 'player' then
					promData = prominentPlayer[abilityId]
				elseif unitTag == 'reticleover' then
					promData = prominentTarget[abilityId]
				elseif unitTag == 'groundaoe' then
					promData = prominentAOE[abilityId]
				end
				if promData then
					return promData.type, promData.frame
				else
					return false, 0
				end
			end
			local pType, pFrame = GetProminentValues()
			if pFrame ~= 0 then -- let non-prominent 'fall through' for normal processing in case of wrongly classified as prominent auras (Phinix)
				if (unitTag ~= 'groundaoe') and (pType ~= effectType) then return end
	
				local pAuraType -- make sure prominent auras use player set aura type color assignments (Phinix)
				if start == finish then
					pAuraType = (pType == BUFF_EFFECT_TYPE_DEBUFF) and DEBUFF_TYPE_PASSIVE or (IsToggledAura(abilityId)) and AURA_TYPE_TOGGLED or AURA_TYPE_PASSIVE
				else
					pAuraType = (pType == BUFF_EFFECT_TYPE_DEBUFF) and DEBUFF_TYPE_TIMED or AURA_TYPE_TIMED
				end

				Srendarr.displayFrames[pFrame]:AddAuraToDisplay(flagBurst, pFrame, pAuraType, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				return
			end
		end
	end

	if (unitTag == 'reticleover') then -- new aura on target
		if (effectType == BUFF_EFFECT_TYPE_DEBUFF) then
			addRecentAura(Srendarr.recentTargetDebuffs, auraName, abilityId, L.DropAuraTargetTarget, icon, L.DropAuraClassDebuff)
			if (Srendarr.db.onlyTargetMajor) then -- only show Major target debuffs (Phinix)
				if (IsMajorEffect(abilityId)) then
					displayFrameRef[GROUP_TARGET_DEBUFF]:AddAuraToDisplay(flagBurst, GROUP_TARGET_DEBUFF, (start == finish) and DEBUFF_TYPE_PASSIVE or DEBUFF_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				end
			else
				-- debuff on target, check for it being a passive (not sure they can be, but just to be sure as things break with a 'timed' passive)
				displayFrameRef[GROUP_TARGET_DEBUFF]:AddAuraToDisplay(flagBurst, GROUP_TARGET_DEBUFF, (start == finish) and DEBUFF_TYPE_PASSIVE or DEBUFF_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
			end
		else
			addRecentAura(Srendarr.recentTargetBuffs, auraName, abilityId, L.DropAuraTargetTarget, icon, L.DropAuraClassBuff)
			-- buff on target, sort as passive, toggle or timed and add
			if (filterDisguisesOnTarget and abilityType == ABILITY_TYPE_CHANGEAPPEARANCE) then return end -- is a disguise and they are filtered

			if (start == finish) then -- toggled or passive
				displayFrameRef[GROUP_TARGET_BUFF]:AddAuraToDisplay(flagBurst, GROUP_TARGET_BUFF, (IsToggledAura(abilityId)) and AURA_TYPE_TOGGLED or AURA_TYPE_PASSIVE, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
			else -- timed buff
				displayFrameRef[GROUP_TARGET_BUFF]:AddAuraToDisplay(flagBurst, GROUP_TARGET_BUFF, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
			end
		end
	elseif (unitTag == 'player') then -- new aura on player
		if (effectType == BUFF_EFFECT_TYPE_DEBUFF) then
			addRecentAura(Srendarr.recentPlayerDebuffs, auraName, abilityId, L.DropAuraTargetPlayer, icon, L.DropAuraClassDebuff) -- catch recently seen auras (Phinix)
			-- debuff on player, check for it being a passive (not sure they can be, but just to be sure as things break with a 'timed' passive)
			displayFrameRef[GROUP_PLAYER_DEBUFF]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_DEBUFF, (start == finish) and DEBUFF_TYPE_PASSIVE or DEBUFF_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
		else
			addRecentAura(Srendarr.recentPlayerBuffs, auraName, abilityId, L.DropAuraTargetPlayer, icon, L.DropAuraClassBuff) -- catch recently seen auras (Phinix)

			-- buff on player, sort as passive, toggled or timed and add
			if (filterDisguisesOnPlayer and abilityType == ABILITY_TYPE_CHANGEAPPEARANCE) then return end -- is a disguise and they are filtered
	
			if (start == finish) then -- toggled or passive
				if (IsMajorEffect(abilityId) and not passiveEffectsAsPassive) then -- major buff on player
					displayFrameRef[GROUP_PLAYER_MAJOR]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_MAJOR, AURA_TYPE_PASSIVE, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				elseif (IsMinorEffect(abilityId) and not passiveEffectsAsPassive) then -- minor buff on player
					displayFrameRef[GROUP_PLAYER_MINOR]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_MINOR, AURA_TYPE_PASSIVE, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				elseif (IsToggledAura(abilityId)) then -- toggled
					displayFrameRef[GROUP_PLAYER_TOGGLED]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_TOGGLED, AURA_TYPE_TOGGLED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				else -- passive, including passive major and minor effects, not seperated out before
					displayFrameRef[GROUP_PLAYER_PASSIVE]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_PASSIVE, AURA_TYPE_PASSIVE, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				end
			else -- timed buff
				if (IsEnchantProc(abilityId)) then -- enchant proc on player
					displayFrameRef[GROUP_PLAYER_ENCHANT]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_ENCHANT, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				elseif (IsMajorEffect(abilityId)) then -- major buff on player
					displayFrameRef[GROUP_PLAYER_MAJOR]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_MAJOR, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				elseif (IsMinorEffect(abilityId)) then -- minor buff on player
					displayFrameRef[GROUP_PLAYER_MINOR]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_MINOR, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				elseif ((finish - start) > shortBuffThreshold) then -- is considered a long duration buff
					displayFrameRef[GROUP_PLAYER_LONG]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_LONG, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				else
					displayFrameRef[GROUP_PLAYER_SHORT]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_SHORT, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
				end
			end
		end
	elseif IsGroupUnit and groupUnits[unitTag] and Srendarr.GroupEnabled then -- new group aura detected, assign to appropriate window
		if (effectType == BUFF_EFFECT_TYPE_DEBUFF) then
			local groupDebuffDuration = Srendarr.db.filtersGroup.groupDebuffDuration
			local groupDebuffThreshold = Srendarr.db.filtersGroup.groupDebuffThreshold
			local duration = finish - start
			if (not groupDebuffDuration or duration <= groupDebuffThreshold) then -- filter group debuffs by duration
				local groupFrame = groupUnits[unitTag].index + 24
				displayFrameRef[groupFrame]:AddAuraToDisplay(flagBurst, groupFrame, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
			end
		elseif (effectType == BUFF_EFFECT_TYPE_BUFF) then
			if Srendarr.db.filtersGroup.groupBuffOnlyPlayer and castByPlayer ~= 31 then
				return
			end -- only show player-sourced group buffs when enabled (Phinix)
			local groupBuffDuration = Srendarr.db.filtersGroup.groupBuffDuration
			local groupBuffThreshold = Srendarr.db.filtersGroup.groupBuffThreshold
			local duration = finish - start
			if (not groupBuffDuration or duration <= groupBuffThreshold) then -- filter group buffs by duration
				local groupFrame = groupUnits[unitTag].index
				displayFrameRef[groupFrame]:AddAuraToDisplay(flagBurst, groupFrame, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
			end
		end
	elseif (unitTag == 'groundaoe') then -- new ground aoe cast by player (assume always timed)
		addRecentAura(Srendarr.recentGroundAOE, auraName, abilityId, L.DropAuraTargetAOE, icon, L.DropAuraTargetAOE) -- catch recently seen auras (Phinix)
		displayFrameRef[GROUP_PLAYER_GROUND]:AddAuraToDisplay(flagBurst, GROUP_PLAYER_GROUND, AURA_TYPE_TIMED, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, nStacks, false, pCast)
	end
	return
end

Srendarr.PassToAuraHandler = function(flagBurst, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, castByPlayer, stacks, isCooldown, isProminent)
	AuraHandler(flagBurst, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityId, castByPlayer, stacks, isCooldown, isProminent)
	return
end

Srendarr.PassToDisplayFrame = function(flagBurst, bar, bType, aName, unitTag, start, finish, icon, eType, aType, abilityId, stacks, isActionBar, isProminent, pCast)
	displayFrameRef[bar]:AddAuraToDisplay(flagBurst, bar, bType, aName, unitTag, start, finish, icon, eType, aType, abilityId, stacks, isActionBar, isProminent, pCast)
	return
end

function Srendarr:GetProminentTable(abilityId, unitTag)
	if not Srendarr.prominentIDs[abilityId] then return nil end

	if unitTag == 'player' and prominentPlayer[abilityId] ~= nil then
		return prominentPlayer
	elseif unitTag == 'reticleover' and prominentTarget[abilityId] ~= nil then
		return prominentTarget
	elseif unitTag == 'groundaoe' and prominentAOE[abilityId] ~= nil then
		return prominentAOE
	end
end

function Srendarr:RecentAuraClassifications() -- remove wrongly classified prominent assignments based on recently seen ID's (Phinix)
	local pDB = Srendarr.db.prominentDB

	local function VerifyID(mode,unit,name,id)
		local PB = Srendarr.recentPlayerBuffs
		local PD = Srendarr.recentPlayerDebuffs
		local TB = Srendarr.recentTargetBuffs
		local TD = Srendarr.recentTargetDebuffs
		local AOE = Srendarr.recentGroundAOE
		local data = (mode == 1) and pDB[STR_PROMBYID][unit][id] or pDB[unit][name][id]
		local tName = (name ~= nil) and "("..name..") " or ""
		local tTable = {[L.DropAuraClassBuff]=1,[L.DropAuraClassDebuff]=2,[L.DropAuraTargetAOE]=3}
		local tCheck = tonumber(data:sub(2,2))

		if PB[id] ~= nil and tTable[PB[id].type] ~= nil and tTable[PB[id].type] ~= tCheck then
			if mode == 1 then pDB[STR_PROMBYID][unit][id] = nil else pDB[unit][name][id] = nil end
			CHAT_SYSTEM:AddMessage(string.format('%s: ID %s %s%s %s', L.Srendarr, tostring(id), tName, L.Prominent_RemoveByRecent, PB[id].type))
		end
		if PD[id] ~= nil and tTable[PD[id].type] ~= nil and tTable[PD[id].type] ~= tCheck then
			if mode == 1 then pDB[STR_PROMBYID][unit][id] = nil else pDB[unit][name][id] = nil end
			CHAT_SYSTEM:AddMessage(string.format('%s: ID %s %s%s %s', L.Srendarr, tostring(id), tName, L.Prominent_RemoveByRecent, PD[id].type))
		end
		if TB[id] ~= nil and tTable[TB[id].type] ~= nil and tTable[TB[id].type] ~= tCheck then
			if mode == 1 then pDB[STR_PROMBYID][unit][id] = nil else pDB[unit][name][id] = nil end
			CHAT_SYSTEM:AddMessage(string.format('%s: ID %s %s%s %s', L.Srendarr, tostring(id), tName, L.Prominent_RemoveByRecent, TB[id].type))
		end
		if TD[id] ~= nil and tTable[TD[id].type] ~= nil and tTable[TD[id].type] ~= tCheck then
			if mode == 1 then pDB[STR_PROMBYID][unit][id] = nil else pDB[unit][name][id] = nil end
			CHAT_SYSTEM:AddMessage(string.format('%s: ID %s %s%s %s', L.Srendarr, tostring(id), tName, L.Prominent_RemoveByRecent, TD[id].type))
		end
		if AOE[id] ~= nil and tTable[AOE[id].type] ~= nil and tTable[AOE[id].type] ~= tCheck then
			if mode == 1 then pDB[STR_PROMBYID][unit][id] = nil else pDB[unit][name][id] = nil end
			CHAT_SYSTEM:AddMessage(string.format('%s: ID %s %s%s %s.', L.Srendarr, tostring(id), tName, L.Prominent_RemoveByRecent, AOE[id].type))
		end
	end

--	for k, v in pairs(pDB) do
--		if k == STR_PROMBYID then
--			if (pDB[k]['player'] ~= nil) then
--				for id, data in pairs(pDB[k]['player']) do
--					VerifyID(1,'player',nil,id)
--				end
--			end
--			if (pDB[k]['reticleover'] ~= nil) then
--				for id, data in pairs(pDB[k]['reticleover']) do
--					VerifyID(1,'reticleover',nil,id)
--				end
--			end
--			if (pDB[k]['groundaoe'] ~= nil) then
--				for id, data in pairs(pDB[k]['groundaoe']) do
--					VerifyID(1,'groundaoe',nil,id)
--				end
--			end
--		elseif k == 'player' then
--			for name, abilityIDs in pairs(v) do
--				for id, data in pairs(abilityIDs) do
--					VerifyID(2,'player',name,id)
--				end
--			end
--		elseif k == 'reticleover' then
--			for name, abilityIDs in pairs(v) do
--				for id, data in pairs(abilityIDs) do
--					VerifyID(2,'reticleover',name,id)
--				end
--			end
--		elseif k == 'groundaoe' then
--			for name, abilityIDs in pairs(v) do
--				for id, data in pairs(abilityIDs) do
--					VerifyID(2,'groundaoe',name,id)
--				end
--			end
--		end
--	end
end

function Srendarr:ConfigureAuraHandler()
	local fTDB = Srendarr.fakeTargetDebuffs

	for group, frameNum in pairs(self.db.auraGroups) do
		-- if a group is set to hidden, auras will be sent to a fake frame that does nothing (simplifies things)
		displayFrameRef[group] = (frameNum > 0) and self.displayFrames[frameNum] or displayFrameFake
	end

	shortBuffThreshold		= self.db.shortBuffThreshold
	passiveEffectsAsPassive	= self.db.passiveEffectsAsPassive
	filterDisguisesOnPlayer	= self.db.filtersPlayer.disguise
	filterDisguisesOnTarget	= self.db.filtersTarget.disguise

	for id in pairs(prominentPlayer) do
		prominentPlayer[id] = nil -- clean out player prominent
	end

	for id in pairs(prominentTarget) do
		prominentTarget[id] = nil -- clean out player prominent
	end

	for id in pairs(prominentAOE) do
		prominentAOE[id] = nil -- clean out AOE prominent
	end

	for id in pairs(self.prominentIDs) do
		self.prominentIDs[id] = nil -- clean out main prominent table
	end

	for k, v in pairs(self.db.prominentDB) do
		if k == STR_PROMBYID then 
			if self.db.prominentDB[k]['player'] ~= nil then
				for id, data in pairs(self.db.prominentDB[k]['player']) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					local frame = tonumber(data:sub(4,5))
					prominentPlayer[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
			if self.db.prominentDB[k]['reticleover'] ~= nil then
				for id, data in pairs(self.db.prominentDB[k]['reticleover']) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					if (oscast) and (type == BUFF_EFFECT_TYPE_DEBUFF) and fakeTargetsDB[id] ~= nil and fTDB[id] == nil then fakeTargetsDB[id] = nil end -- remove from fake aura lookup (Phinix)
					local frame = tonumber(data:sub(4,5))
					prominentTarget[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
			if self.db.prominentDB[k]['groundaoe'] ~= nil then
				for id, data in pairs(self.db.prominentDB[k]['groundaoe']) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					local frame = tonumber(data:sub(4,5))
					prominentAOE[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
		elseif k == 'player' then
			for _, abilityIDs in pairs(v) do
				for id, data in pairs(abilityIDs) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					local frame = tonumber(data:sub(4,5))
					prominentPlayer[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
		elseif k == 'reticleover' then
			for _, abilityIDs in pairs(v) do
				for id, data in pairs(abilityIDs) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					if (oscast) and (type == BUFF_EFFECT_TYPE_DEBUFF) and fakeTargetsDB[id] ~= nil and fTDB[id] == nil then fakeTargetsDB[id] = nil end -- remove from fake aura lookup (Phinix)
					local frame = tonumber(data:sub(4,5))
					prominentTarget[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
		elseif k == 'groundaoe' then
			for _, abilityIDs in pairs(v) do
				for id, data in pairs(abilityIDs) do
					local tCheck = tonumber(data:sub(2,2))
					local type = ((tCheck == 1) or (tCheck == 3)) and BUFF_EFFECT_TYPE_BUFF or BUFF_EFFECT_TYPE_DEBUFF
					local oscast = (tonumber(data:sub(3,3)) == 1) and true or false
					local frame = tonumber(data:sub(4,5))
					prominentAOE[id] = {type = type, oscast = oscast, frame = frame}
					self.prominentIDs[id] = true
				end
			end
		end
	end

	for id in pairs(groupBuffs) do
		groupBuffs[id] = nil -- clean out group auras list
	end

	for id in pairs(groupDebuffs) do
		groupDebuffs[id] = nil -- clean out group auras list
	end

	for _, abilityIds in pairs(self.db.groupBuffWhitelist) do
		for id in pairs(abilityIds) do
			groupBuffs[id] = true -- populate group list from saved database
			self.prominentIDs[id] = true
		end
	end

	for _, abilityIds in pairs(self.db.groupDebuffWhitelist) do
		for id in pairs(abilityIds) do
			groupDebuffs[id] = true -- populate group list from saved database
			self.prominentIDs[id] = true
		end
	end

	self:ConfigureOnTargetChanged() -- doing this here in order to register when prominent target buffs/debuffs are added (Phinix)
end


-- ------------------------
-- EVENT: EVENT_PLAYER_ACTIVATED, EVENT_PLAYER_ALIVE
do ------------------------
    local GetNumBuffs       	= GetNumBuffs
    local GetUnitBuffInfo   	= GetUnitBuffInfo
    local NUM_DISPLAY_FRAMES	= Srendarr.NUM_DISPLAY_FRAMES
	local auraLookup			= Srendarr.auraLookup
	local alternateAura			= Srendarr.alternateAura

	local function CheckGroupFunction()
		Srendarr.GroupEnabled = true

		-- JoGroup uses custom sorting which is currently not supported
		if JoGroup then
			Srendarr.GroupEnabled = false
		end

		-- Initialize group buff support if passes above checks
		if Srendarr.GroupEnabled then
			Srendarr.OnGroupChanged()
		end
	end

	Srendarr.OnPlayerActivatedAlive = function(keepAuras)
		local activeAuras = {}
		local sourceCast
		local numAuras
		local isProminent
		local skipOtherProminent
		local auraName, start, finish, icon, effectType, abilityType, abilityId, castByPlayer
		local equippedSets			= Srendarr.equippedSets
		local abilityBarSets		= Srendarr.abilityBarSets
		local abilityCooldowns		= Srendarr.abilityCooldowns

		local function CheckProminent(aId)
			if Srendarr.prominentIDs[aId] ~= nil then -- check here for prominent auras set to only show player cast (Phinix)
				if prominentPlayer[aId] ~= nil then
					return true
				end
			end
			return false
		end

		if not keepAuras then -- don't clear out auras when flag is passed true (Phinix)
			for _, auras in pairs(auraLookup) do -- iterate all aura lookups
				for id, aura in pairs(auras) do -- iterate all auras for each lookup
					if id ~= Srendarr.BahseiData.ID and id ~= Srendarr.POrderData.ID then -- check special cases handled by equip change script to never release here (Phinix)
						aura:Release(true)
					end
				end
			end
		end

		numAuras = GetNumBuffs('player')

		if numAuras > 0 then -- player has auras, scan and send to handle
			for i = 1, numAuras do
				auraName, start, finish, _, stacks, icon, _, effectType, abilityType, _, abilityId, _, castByPlayer = GetUnitBuffInfo('player', i)
				sourceCast = (castByPlayer) and 1 or 2
				isProminent = CheckProminent(abilityId)

				table.insert(activeAuras, abilityId, true)
	
				if Srendarr.db.consolidateEnabled == true then -- Handles multi-aura passive abilities like Restoring Aura
					if (IsAlternateAura(abilityId)) then -- Consolidate multi-aura passive abilities
						AuraHandler(true, alternateAura[abilityId].altName, 'player', start, finish, icon, effectType, abilityType, abilityId, sourceCast, stacks, nil, isProminent)
					else
						AuraHandler(true, zo_strformat("<<t:1>>", auraName), 'player', start, finish, icon, effectType, abilityType, abilityId, sourceCast, stacks, nil, isProminent)
					end
				else
					AuraHandler(true, zo_strformat("<<t:1>>", auraName), 'player', start, finish, icon, effectType, abilityType, abilityId, sourceCast, stacks, nil, isProminent)
				end
			end
		end

		for k, v in pairs(auraLookup['reticleover']) do -- clear target auras which no longer get end events when zoning
			v:Release()
		end

		if Srendarr.db.auraGroups[GROUP_CDBAR] ~= 0 then -- maintains the passive "ready" state auras for the active cooldown tracking bar (Phinix)
			for k, v in pairs(equippedSets) do
				if abilityBarSets[k] ~= nil then
					for i, cId in ipairs(abilityBarSets[k]) do
						if abilityCooldowns[cId] ~= nil then
							local abID = cId+5000000
							local currentTime = GetGameTimeMillis() / 1000
							local abName = (abilityCooldowns[cId].altName ~= nil) and abilityCooldowns[cId].altName or GetAbilityName(cId)
							local abIcon = (abilityCooldowns[cId].altIcon ~= nil) and abilityCooldowns[cId].altIcon or GetAbilityIcon(cId)
							if filteredAuras['player'] ~= nil then
								if not filteredAuras['player'][abID] then
									if not auraLookup['player'][abID] then
										displayFrameRef[GROUP_CDBAR]:AddAuraToDisplay(false, GROUP_CDBAR, AURA_TYPE_PASSIVE, abName, 'player', currentTime, currentTime, abIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abID, 0, true, true)
									end
								end
							end
						end
					end
				end
			end
		end

		-- special case for passive Major Gallop the game doesn't track on the player (Phinix)
		local MGpurchased, MGrank
		_, _, _, _, _, MGpurchased, _, MGrank = GetSkillAbilityInfo(SKILL_TYPE_AVA, 1, 6) -- name, texture, earnedRank, passive, ultimate, purchased, progressionIndex, rank

		if (MGpurchased) and MGrank >= 1 then
			isProminent = CheckProminent(abilityId)
			local currentTime = GetGameTimeMillis() / 1000
			AuraHandler(true, zo_strformat("<<t:1>>", GetAbilityName(63569)), 'player', currentTime, currentTime, GetAbilityIcon(63569), BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, 63569, 1, 1, nil, isProminent)
		end

		for x = 1, NUM_DISPLAY_FRAMES do
			Srendarr.displayFrames[x]:UpdateDisplay() -- update the display for all frames
		end

		zo_callLater(CheckGroupFunction, 1000)

		Srendarr:ConfigureOnCombatState()

		activeAuras = {}
	end
end


-- ------------------------
-- EVENT: EVENT_PLAYER_DEAD
do ------------------------
    local NUM_DISPLAY_FRAMES	= Srendarr.NUM_DISPLAY_FRAMES
    local auraLookup			= Srendarr.auraLookup

	Srendarr.OnPlayerDead = function()
		for _, auras in pairs(auraLookup) do -- iterate all aura lookups
			for _, aura in pairs(auras) do -- iterate all auras for each lookup
				aura:Release(true)
			end
		end

		for x = 1, NUM_DISPLAY_FRAMES do
			Srendarr.displayFrames[x]:UpdateDisplay() -- update the display for all frames
		end
	end
end


-- ------------------------
-- EVENT: EVENT_PLAYER_COMBAT_STATE
do -----------------------
    local NUM_DISPLAY_FRAMES	= Srendarr.NUM_DISPLAY_FRAMES
    local displayFramesScene	= Srendarr.displayFramesScene
	local displayFrames			= Srendarr.displayFrames

	local function cShow(frame)
		if not Srendarr.uiHidden then
			if frame ~= nil then
				if displayFrames[frame] ~= nil and displayFramesScene[frame] ~= nil then
					displayFramesScene[frame]:SetHiddenForReason('combatstate', false)
					displayFrames[frame]:SetHidden(false)
				end
			else
				for x = 1, NUM_DISPLAY_FRAMES do
					if displayFrames[x] ~= nil and displayFramesScene[x] ~= nil then
						displayFramesScene[x]:SetHiddenForReason('combatstate', false)
						displayFrames[x]:SetHidden(false)
					end
				end
			end
		end
	end

	local function OnCombatState(e, inCombat)
		if (not inCombat) then
			Srendarr:RecentAuraClassifications()
		end

		if not Srendarr.uiHidden then
			if (inCombat) or (Srendarr.SampleAurasActive) then
				cShow()
			else
				if (Srendarr.db.combatDisplayOnly) then
					local checkPassives = Srendarr.db.auraGroups[GROUP_PLAYER_PASSIVE]
					local checkCooldown = Srendarr.db.auraGroups[GROUP_CDBAR]
					local combatAlwaysPassives = Srendarr.db.combatAlwaysPassives
					for x = 1, NUM_DISPLAY_FRAMES do
						if displayFrames[x] ~= nil and displayFramesScene[x] ~= nil then
							if (x == tonumber(checkPassives)) and (combatAlwaysPassives) then
								cShow(x)
							elseif (x == tonumber(checkCooldown)) and (combatAlwaysPassives) then
								cShow(x)
							else
								displayFramesScene[x]:SetHiddenForReason('combatstate', true)
								displayFrames[x]:SetHidden(true)
							end
						end
					end
				else
					cShow()
				end
			end
		end
	end

	function Srendarr:ConfigureOnCombatState()
		if (self.db.combatDisplayOnly) then
			EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE, OnCombatState)

			OnCombatState(nil, IsUnitInCombat('player')) -- force an update
		else
			EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE)

			cShow()
		end
	end
end


-- ------------------------
-- EVENT: EVENT_CAMPAIGN_STATE_INITIALIZED, EVENT_CURRENT_CAMPAIGN_CHANGED, EVENT_BATTLEGROUND_STATE_CHANGED
do ------------------------
	local checkPVP = true
	local function CampaignStateLoop(pass) -- handle internal game delay in registering addon events after PVP campaign state changes (Phinix)
		if (checkPVP) then
			checkPVP = false
			if pass < Srendarr.db.numChecksPVP then
				if (SCENE_MANAGER:IsShowing('hudui')) or (SCENE_MANAGER:IsShowing('hud')) then
					pass = pass + 1
				end
				zo_callLater(function() Srendarr.OnPlayerActivatedAlive() end, 1000 + GetLatency())
				zo_callLater(function() checkPVP = true CampaignStateLoop(pass) end, 1000 + GetLatency())
			else
				checkPVP = true
			end
		end
	end
	EVENT_MANAGER:RegisterForEvent("Srendarr", EVENT_CAMPAIGN_STATE_INITIALIZED, function() CampaignStateLoop(0) end)
	EVENT_MANAGER:RegisterForEvent("Srendarr", EVENT_CURRENT_CAMPAIGN_CHANGED, function() CampaignStateLoop(0) end)
	EVENT_MANAGER:RegisterForEvent("Srendarr", EVENT_BATTLEGROUND_STATE_CHANGED, function() CampaignStateLoop(0) end)
end


-- ------------------------
-- EVENT: EVENT_ACTION_SLOT_ABILITY_USED
do ------------------------
	local GetGameTimeMillis		= GetGameTimeMilliseconds
	local GetLatency			= GetLatency
	local slotData				= Srendarr.slotData
	local fakeAuras				= Srendarr.fakeAuras
	local auraLookup			= Srendarr.auraLookup

	Srendarr.OnActionSlotAbilityUsed = function(e, slotID)
		local slotAbilityName, currentTime
		local abilityOffset
		local isProminent = false

		if (slotID < 3 or slotID > 8) then return end -- abort if not a main ability (or ultimate)

		slotAbilityName = zo_strformat("<<t:1>>", slotData[slotID].abilityName)

		if fakeAuras[slotAbilityName] == nil then return end -- no fake aura needed for this ability (majority case)

		local unit = fakeAuras[slotAbilityName].unitTag

		local slotAbility = (fakeAuras[slotAbilityName].abilityID ~= nil) and fakeAuras[slotAbilityName].abilityID or 0
  		currentTime = GetGameTimeMillis() / 1000

		if slotAbility ~= 0 and Srendarr.prominentIDs[slotAbility] ~= nil then
			if (unit == 'player' and prominentPlayer[slotAbility] ~= nil) or (unit == 'reticleover' and prominentTarget[slotAbility] ~= nil) or (unit == 'groundaoe' and prominentAOE[slotAbility] ~= nil) then
				isProminent = true
			end
		end

		AuraHandler(
			false,
			slotAbilityName,
			unit,
			currentTime,
			currentTime + fakeAuras[slotAbilityName].duration + (GetLatency() / 1000), -- + cooldown? GetSlotCooldownInfo(slotID)
			slotData[slotID].abilityIcon,
			BUFF_EFFECT_TYPE_BUFF,
			ABILITY_TYPE_NONE,
			slotAbility,
			1,
			nil,
			nil,
			isProminent
		)
	end

	function Srendarr:ConfigureOnActionSlotAbilityUsed()
		EVENT_MANAGER:RegisterForEvent(self.name, EVENT_ACTION_SLOT_ABILITY_USED,	Srendarr.OnActionSlotAbilityUsed)
	end
end


-- ------------------------
-- EVENT: EVENT_RETICLE_TARGET_CHANGED
do ------------------------
    local GetNumBuffs      				= GetNumBuffs
    local GetUnitBuffInfo  				= GetUnitBuffInfo
    local DoesUnitExist    				= DoesUnitExist
    local IsUnitDead					= IsUnitDead
	local alternateAura					= Srendarr.alternateAura
	local specialNames					= Srendarr.specialNames
	local abilityCooldowns				= Srendarr.abilityCooldowns
	local enchantProcs					= Srendarr.enchantProcs
	local debuffAuras					= Srendarr.debuffAuras
	local alteredAuraData				= Srendarr.alteredAuraData
	local fakeAuras						= Srendarr.fakeAuras
	local auraLookupReticle				= Srendarr.auraLookup['reticleover'] -- local ref for speed, this functions expensive
	local targetDisplayFrame1			= false -- local refs to frames displaying target auras (if any)
	local targetDisplayFrame2			= false -- local refs to frames displaying target auras (if any)
	local hideOnDead					= false

	local function GetUnitHasAbilityID(unit, abilityId)
		local numAuras = GetNumBuffs(unit)
		for i = 1, numAuras do
			local checkId
			_, _, _, _, _, _, _, _, _, _, checkId = GetUnitBuffInfo('reticleover', i)
			if checkId == abilityId then
				return true
			end
		end
		return false
	end

	local function OnTargetChanged()
		local numAuras
		local numTotal
		local onlyPlayerDebuffs			= Srendarr.db.filtersTarget.onlyPlayerDebuffs
		local targetBuff				= Srendarr.db.auraGroups[GROUP_TARGET_BUFF]
		local targetDebuff				= Srendarr.db.auraGroups[GROUP_TARGET_DEBUFF]
		targetDisplayFrame1 			= (targetBuff ~= 0) and Srendarr.displayFrames[targetBuff] or false
		targetDisplayFrame2 			= (targetDebuff ~= 0) and Srendarr.displayFrames[targetDebuff] or false

		if not SCENE_MANAGER:IsShowing('hudui') then
			for auraID, aura in pairs(auraLookupReticle) do
				aura:Release(true) -- old auras cleaned out
			end
		end

		if (DoesUnitExist('reticleover') and not (hideOnDead and IsUnitDead('reticleover'))) then -- have a target, scan for auras
			local unitName = zo_strformat("<<t:1>>",GetUnitName('reticleover'))
			local currentTime

			Srendarr.targetName = unitName

			local function ActiveFakes() -- check for active fake debuffs (Phinix)
				local total = 0
				currentTime = GetGameTimeMillis() / 1000
				for k,v in pairs(fakeTargetsDB) do
					if trackTargets[k] ~= nil and trackTargets[k][unitName] ~= nil then
						if trackTargets[k][unitName] < currentTime then
							trackTargets[k][unitName] = nil -- clear expired targets from cache
						else
							total = total + 1
						end
					end
				end
				return total
			end

			numAuras = GetNumBuffs('reticleover')
			numTotal = numAuras + ActiveFakes()

			if (numTotal > 0) then -- target has auras, scan and send to handler
				currentTime = GetGameTimeMillis() / 1000
				for k,v in pairs(fakeTargetsDB) do -- reassign still-existing fake debuffs on target (Phinix)
					if trackTargets[k] ~= nil and trackTargets[k][unitName] ~= nil then
						if trackTargets[k][unitName] > currentTime then
							AuraHandler(
								false,
								(specialNames[k] ~= nil) and specialNames[k].name or fakeTargetsDB[k].name,
								'reticleover',
								currentTime,
								trackTargets[k][unitName],
								fakeTargetsDB[k].icon,
								fakeTargetsDB[k].type,
								ABILITY_TYPE_NONE,
								k,
								1,
								nil,
								nil,
								(Srendarr.prominentIDs[k] ~= nil) and (prominentTarget[k] ~= nil) and true or false
							)
						end
					end
				end

				for i = 1, numAuras do
					local auraName, start, finish, stacks, icon, effectType, abilityType, abilityId, castByPlayer
					auraName, start, finish, _, stacks, icon, _, effectType, abilityType, _, abilityId, _, castByPlayer = GetUnitBuffInfo('reticleover', i)

					local hasPlayerCast = (trackTargets[abilityId] ~= nil and trackTargets[abilityId][unitName] ~= nil)

					if (castByPlayer) or (not hasPlayerCast) then -- maintain priority of player cast non-stacking auras (Phinix)

						local debuffSwitch = (debuffAuras[abilityId]) and BUFF_EFFECT_TYPE_DEBUFF or effectType -- fix for debuffs game tracks as buffs (Phinix)
						local isProminent = false
	
						local function ProcessAura(pCheck)
							local sourceCast = (castByPlayer) and 1 or 2
							local unitTag = 'reticleover'
	
							if (pCheck) then -- check here for prominent auras set to only show player cast (Phinix)
								if prominentTarget[abilityId] ~= nil then
									local pCast = prominentTarget[abilityId].oscast
									if (pCast) and (sourceCast ~= 1) then
										return
									else
										if trackTargets[abilityId] ~= nil and trackTargets[abilityId][unitName] ~= nil then
											trackTargets[abilityId][unitName] = finish -- update timer when player only aura is re-cast by player (Phinix)
										end
										isProminent = true
									end
								end
							end
	
							if (fakeAuras[ZOSName(abilityId)] ~= nil and alteredAuraData[abilityId] == nil) then
								unitTag = fakeAuras[ZOSName(abilityId)].unitTag
							end
	
							if abilityCooldowns[abilityId] ~= nil then -- keep cooldown tracking custom icon if applicable (Phinix)
								icon = (abilityCooldowns[abilityId].altIcon ~= nil) and abilityCooldowns[abilityId].altIcon or icon
							end

							if enchantProcs[abilityId] then -- use alternate icon for enchant procs option (Phinix)
								icon = (Srendarr.db.enchantAltIcons) and enchantProcs[abilityId].icon or icon
							end

							if filteredAuras[unitTag][abilityId] == nil then
								if (Srendarr.db.consolidateEnabled == true and IsAlternateAura(abilityId) == true) then -- handles multi-aura passive abilities like restoring aura (Phinix)
									AuraHandler(true, alternateAura[abilityId].altName, unitTag, start, finish, icon, debuffSwitch, abilityType, abilityId, sourceCast, stacks, nil, isProminent)
								else
									AuraHandler(true, (specialNames[abilityId] ~= nil) and specialNames[abilityId].name or zo_strformat("<<t:1>>", auraName), unitTag, start, finish, icon, debuffSwitch, abilityType, abilityId, sourceCast, stacks, nil, isProminent)
								end
							end
						end
	
						-- options to only show player's debuffs on target (Phinix)
						if alteredAuraData[abilityId] == nil or alteredAuraData[abilityId].unitTag == 'reticleover' then -- ignore swapped unitTag unless set to 'reticleover' to avoid duplicates (Phinix)
							if (Srendarr.prominentIDs[abilityId] ~= nil) and (prominentTarget[abilityId] ~= nil) then -- prominent auras have their own individual options now (Phinix)
								ProcessAura(true)
							elseif (castByPlayer) or (debuffSwitch ~= BUFF_EFFECT_TYPE_DEBUFF) then -- always process target buffs or debuffs cast by player
								ProcessAura(false)
							elseif (debuffSwitch == BUFF_EFFECT_TYPE_DEBUFF) and (targetDebuff ~= 0) then
								if (not onlyPlayerDebuffs) and ((IsMajorEffect(abilityId)) or (IsMinorEffect(abilityId))) then -- process non-stacking non-player debuffs if not assigned to prominent and not set to only show player's debuffs
									ProcessAura(false)
								end
							end
						end
					end
				end
			end
		else
			Srendarr.targetName = ""
		end

		local tFrames = {[targetBuff]=true,[targetDebuff]=true}
		for k, v in pairs(prominentTarget) do -- update frames other than below default target frames when prominent target aura is assigned (Phinix)
			local frame = v.frame
			if not tFrames[frame] and frame ~= 0 then
				Srendarr.displayFrames[frame]:UpdateDisplay()
			end
		end

		-- no matter what, update the display of the frames displaying targets auras
		if (targetDisplayFrame1) then targetDisplayFrame1:UpdateDisplay() end
		if (targetDisplayFrame2) then targetDisplayFrame2:UpdateDisplay() end
	end

	function Srendarr:ConfigureOnTargetChanged()
		-- figure out which frames currently display target auras
		local targetBuff	= self.db.auraGroups[GROUP_TARGET_BUFF]
		local targetDebuff	= self.db.auraGroups[GROUP_TARGET_DEBUFF]
		targetDisplayFrame1 = (targetBuff ~= 0) and self.displayFrames[targetBuff] or false
		targetDisplayFrame2 = (targetDebuff ~= 0) and self.displayFrames[targetDebuff] or false
		hideOnDead			= self.db.hideOnDeadTargets -- set whether to show auras on dead targets

		local hasPromTargets = false
		for k, v in pairs(prominentTarget) do
			local frame = v.frame
			if frame and frame ~= 0 then
				hasPromTargets = true
			end
		end

		if (targetDisplayFrame1 or targetDisplayFrame2 or hasPromTargets) then -- event configured and needed, start tracking
			EVENT_MANAGER:RegisterForEvent(self.name, EVENT_RETICLE_TARGET_CHANGED,	OnTargetChanged)
		else -- not needed (not displaying any target auras)
			EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_RETICLE_TARGET_CHANGED)
		end
	end

	Srendarr.PassReticleChange = function() OnTargetChanged() return end

	Srendarr.OnTargetChanged = OnTargetChanged
end


-- ------------------------
-- EVENT: EVENT_EFFECT_CHANGED
do ------------------------
	local EFFECT_RESULT_FADED			= EFFECT_RESULT_FADED
	local GetAbilityDescription			= GetAbilityDescription
	local crystalFragmentsPassive		= Srendarr.crystalFragmentsPassive -- special case for tracking fragments proc
	local fakeAuras						= Srendarr.fakeAuras
	local alternateAura					= Srendarr.alternateAura
	local debuffAuras					= Srendarr.debuffAuras
	local alteredAuraData				= Srendarr.alteredAuraData
	local specialNames					= Srendarr.specialNames
	local abilityCooldowns				= Srendarr.abilityCooldowns
	local specialProcs					= Srendarr.specialProcs
	local enchantProcs					= Srendarr.enchantProcs
	local sampleAuraData				= Srendarr.sampleAuraData
	local auraLookup					= Srendarr.auraLookup
	local IsGroupUnit					= Srendarr.IsGroupUnit
	local grimProcs						= Srendarr.grimProcs
	local grimBase						= Srendarr.grimBase
	local OffBalance					= Srendarr.OffBalance
	local releaseTriggers				= Srendarr.releaseTriggers
	local playerName					= Srendarr.playerName

	Srendarr.OnEffectChanged = function(e, change, slot, auraName, unitTag, start, finish, stack, icon, buffType, effectType, abilityType, statusType, unitName, unitId, abilityId, sourceType)
		local debuffSwitch
		local altDuration
		local fadedAura
		local sourceCast
		local nStacks
		local unitTagt
		local altAura, startA, finishA, effectTypeA, abilityTypeA
		local aName = zo_strformat("<<t:1>>", auraName)

		if aName == OffBalance.obN2 then aName = OffBalance.obN1 end

		if not abilityId then return end -- safety check
		if abilityCooldowns[abilityId] and abilityCooldowns[abilityId].cdE == 1 then return end -- avoid duplicating cooldown abilities tracked through combat events (Phinix)
		if specialProcs[abilityId] then return end -- avoid duplicating special procs tracked through combat events (Phinix)
		local unitIsGroup = false

		-- check if the aura is on either the player or a group member, or a target or ground aoe -- the description check filters a lot of extra auras attached to many ground effects
		if (unitTag == 'player' or unitTag == 'reticleover') then
			unitTagt = unitTag
		elseif IsGroupUnit(unitTag) then
			unitTagt = unitTag
			unitIsGroup = true
		elseif (abilityType == ABILITY_TYPE_AREAEFFECT and (GetAbilityDescription(abilityId) ~= '' or sampleAuraData[abilityId] ~= nil or abilityId == Srendarr.castBarID)) then
			unitTagt = 'groundaoe'
		else
			unitTagt = nil
		end

		if alteredAuraData[abilityId] and alteredAuraData[abilityId].unitTag ~= nil then -- swap unitTag to match aura behavior (Phinix)
			unitTagt = alteredAuraData[abilityId].unitTag
		end
		if not unitTagt then return end -- don't care about this unit and isn't a ground aoe, abort

		local fName = zo_strformat("<<t:1>>",unitName)
		local isProminent = false
		local pCast = false

		-- possible sourceType values:
		--	COMBAT_UNIT_TYPE_NONE			= 0
		--	COMBAT_UNIT_TYPE_PLAYER			= 1
		--	COMBAT_UNIT_TYPE_PLAYER_PET		= 2
		--	COMBAT_UNIT_TYPE_GROUP			= 3
		--	COMBAT_UNIT_TYPE_TARGET_DUMMY	= 4
		--	COMBAT_UNIT_TYPE_OTHER			= 5

		if specialNames[abilityId] ~= nil then aName = specialNames[abilityId].name end -- handle renaming auras as required (Phinix)
		debuffSwitch = (debuffAuras[abilityId]) and BUFF_EFFECT_TYPE_DEBUFF or effectType -- fix for debuffs game tracks as buffs (Phinix)

		local function playerSource(val) local check = ((val == 1) or (val == 31)) and true or false return check end
		sourceCast = (sourceType == 1 or sourceType == 2) and 1 or 2 -- separate into player cast, not player cast, and group cast for easy offset grouping (Phinix)
		if (unitIsGroup) then sourceCast = (sourceCast == 1) and 31 or 32 end -- differentiate group auras for later filtering (Phinix)
		if (unitTagt == 'groundaoe') and (not playerSource(sourceCast)) then return end -- only track AOE created by the player
		if (sourceCast == 1 and (not alteredAuraData[abilityId] and fakeAuras[ZOSName(abilityId)] ~= nil)) then return end -- ignore game default tracking of player bar abilities we've modified (Phinix)

		local function releaseFaded(rUnit, rAbility, fast, aoe) -- release current proc if present to reset timer (Phinix)
			if rUnit and auraLookup[rUnit] and auraLookup[rUnit][rAbility] then
				local rAura = auraLookup[rUnit][rAbility]
				if rAura then
					if (fast) then
						rAura:Release()
					else
						if (rAura.auraType == AURA_TYPE_TIMED) or (rAura.auraType == DEBUFF_TYPE_TIMED) then
							if (aoe) then
								if rAura.abilityType == ABILITY_TYPE_AREAEFFECT then return end -- gtaoes expire internally (repeated casting, only one timer)
							end
							rAura:SetExpired()
						else
							rAura:Release()
						end
					end
				end
			end
		end

-----------------------------------------------------------------------------------------------------------------------------------------------
-- handle auras assigned to prominent frames (Phinix)
-----------------------------------------------------------------------------------------------------------------------------------------------
		local function GetProminentTable(unit, aId)
			local tTable
			if unit == 'player' and prominentPlayer[aId] ~= nil then
				tTable = prominentPlayer
			elseif unit == 'reticleover' and prominentTarget[aId] ~= nil then
				tTable = prominentTarget
			elseif unit == 'groundaoe' and prominentAOE[aId] ~= nil then
				tTable = prominentAOE
			end
			return tTable
		end
		if Srendarr.prominentIDs[abilityId] ~= nil then -- check here for prominent auras set to only show player cast (Phinix)
			local pTable = GetProminentTable(unitTagt, abilityId)
			if pTable ~= nil then
				if pTable[abilityId] ~= nil then
					pCast = pTable[abilityId].oscast
					if (pCast) and (sourceCast ~= 1) and (change ~= EFFECT_RESULT_FADED) then
						return
					else
						isProminent = true
					end
				end
			end
		end

-----------------------------------------------------------------------------------------------------------------------------------------------
-- handle event based on change type (Phinix)
-----------------------------------------------------------------------------------------------------------------------------------------------
		if change == EFFECT_RESULT_FADED then -- aura has faded

			fadedAura = auraLookup[unitTagt][abilityId]

			if fadedAura ~= nil then

				if grimProcs[abilityId] then -- Grim Focus (Phinix)
					if fadedAura.isPlaying then
						fadedAura.loopTexture:SetHidden(true)
						fadedAura.loop:Stop()
						fadedAura.isPlaying = false
					end
					fadedAura:Release()
					return
				end

				------------------------------------------------------------------------------------------------------------------------------------------------------
				-- for only tracking player auras based on config (Phinix)
				------------------------------------------------------------------------------------------------------------------------------------------------------
				if not playerSource(sourceCast) then -- release aura when cleansed regardless of player only setting (Phinix)
				--	if (not trackTargets[abilityId] or not trackTargets[abilityId][fName]) or ((IsMajorEffect(abilityId)) or (IsMinorEffect(abilityId))) then
					if ((IsMajorEffect(abilityId)) or (IsMinorEffect(abilityId))) then
						if (DoesUnitExist(unitTagt)) then
							local numAuras = GetNumBuffs(unitTagt)
							local wasCleansed = true
							local idCheck
							for i = 1, numAuras do
								_, _, _, _, _, _, _, _, _, _, idCheck = GetUnitBuffInfo(unitTagt, i)
								if idCheck == abilityId then
									wasCleansed = false
									break
								end
							end
							if (wasCleansed) then
								if (fadedAura.auraType == AURA_TYPE_TIMED) or (fadedAura.auraType == DEBUFF_TYPE_TIMED) then
									fadedAura:SetExpired()
								else
									fadedAura:Release()
								end
								if trackTargets[abilityId] and trackTargets[abilityId][fName] then trackTargets[abilityId][fName] = nil end
								if fakeTargetsDB[abilityId] and not Srendarr.fakeTargetDebuffs[abilityId] then fakeTargetsDB[abilityId] = nil end
							end
						end
					end
					return
				else
					if trackTargets[abilityId] and trackTargets[abilityId][fName] then trackTargets[abilityId][fName] = nil end
					if fakeTargetsDB[abilityId] and not Srendarr.fakeTargetDebuffs[abilityId] then fakeTargetsDB[abilityId] = nil end
				end
				------------------------------------------------------------------------------------------------------------------------------------------------------

				if alteredAuraData[abilityId] == nil then -- aura exists, tell it to expire if timed, or aaa otherwise
					releaseFaded(unitTagt, abilityId, false, true)
				end
			end

			if (abilityId == crystalFragmentsPassive and sourceType == 1) then -- special case for tracking fragments proc
				Srendarr:OnCrystalFragmentsProc(false)
			end
		else -- aura has been gained or changed, dispatch to handler

			if releaseTriggers[abilityId] then
				local releaseOffset = releaseTriggers[abilityId].release
				releaseFaded('player', releaseOffset, false, false)
			end

			-- ignore normal buff proc on Screaming Cliff Racer when empowered buff is active as it does not replace it (Phinix)
			if abilityId == 87663 and auraLookup['player'][178330] then return end

			altDuration = (alteredAuraData[abilityId] ~= nil and alteredAuraData[abilityId].duration ~= nil) and start + alteredAuraData[abilityId].duration or finish -- fix rare cases game reports wrong duration for an aura (Phinix)
			nStacks = (stack ~= nil) and stack or 0 -- used to add stacks to name of auras that have them (Phinix)

			-- special case for Screaming Cliff Racer fake stacks to show multiplier when Off-Balance (Phinix)
			if abilityId == 87663 then nStacks = 1 elseif abilityId == 178330 then nStacks = 4 end

			local mIcon = icon

			if enchantProcs[abilityId] then -- use alternate icon for enchant procs option (Phinix)
				mIcon = (Srendarr.db.enchantAltIcons) and enchantProcs[abilityId].icon or mIcon
			end

			if grimBase[abilityId] and not grimBase[abilityId].isRelease and unitTagt == 'player' then -- Grim Focus (Phinix)
				if grimBase[abilityId].isAlt ~= nil then -- base Grim Focus has alt stack building IDs
					local checkID = grimBase[abilityId].isAlt
					local numAuras = GetNumBuffs('player')
					for i = 1, numAuras do
						local _, _, _, _, tStacks, _, _, _, _, _, tAbilityId = GetUnitBuffInfo('player', i)
						if tAbilityId == checkID then
							mIcon = (tStacks < 5) and grimBase[checkID].icon or '/esoui/art/icons/ability_rogue_058.dds'
							Srendarr.db.grimTracker[abilityId] = tStacks
						end
					end
				else
					local modID = grimBase[abilityId].modID
					mIcon = (nStacks < 5) and grimBase[abilityId].icon or '/esoui/art/icons/ability_rogue_058.dds'
					Srendarr.db.grimTracker[modID] = nStacks
					abilityId = modID
				end
			end
 
			if aName == OffBalance.obN1 then -- special case to proc fake Off Balance Immunity aura (Phinix)
				local fOBImmunityID = OffBalance.ID
				local obCD = OffBalance.CD
				local fTable = GetProminentTable(unitTagt, fOBImmunityID)
				local fProminent = ((Srendarr.prominentIDs[fOBImmunityID] ~= nil) and (fTable ~= nil and fTable[fOBImmunityID] ~= nil)) and true or false
				local timeOffset = GetAbilityDuration(abilityId) / 1000
				local fAuraName = zo_strformat("<<t:1>>", GetAbilityName(OffBalance.nameID))
				local currentTime = GetGameTimeMillis() / 1000
	
				if (not auraLookup[unitTagt][fOBImmunityID]) or (auraLookup[unitTagt][fOBImmunityID] and auraLookup[unitTagt][fOBImmunityID].finish - currentTime <= 1) then
					if unitTagt == 'reticleover' then -- multi-target tracking for Off Balance Immunity (Phinix)
						trackTargets[fOBImmunityID] = trackTargets[fOBImmunityID] or {}
						trackTargets[fOBImmunityID] [fName] = currentTime + obCD + timeOffset -- simply unit name tracking, more is not possible
						fakeTargetsDB[fOBImmunityID] = {duration = obCD + timeOffset, icon = OffBalance.icon, type = BUFF_EFFECT_TYPE_BUFF, name = fAuraName}
					end
					if auraLookup[unitTagt][fOBImmunityID] then
						auraLookup[unitTagt][fOBImmunityID]:Update(currentTime, currentTime + obCD + timeOffset, nil, true)
					else
						AuraHandler(false, fAuraName, unitTagt, currentTime, currentTime + obCD + timeOffset, OffBalance.icon, BUFF_EFFECT_TYPE_BUFF, abilityType, fOBImmunityID, sourceCast, stack, nil, fProminent)
					end
				else
					return
				end
			end

			------------------------------------------------------------------------------------------------------------------------------------------------------
			-- for only tracking player auras based on config (Phinix)
			------------------------------------------------------------------------------------------------------------------------------------------------------
			local function addFakes(aId)
				if auraLookup['reticleover'][aId] then
					auraLookup['reticleover'][aId]:Update(start, finish, stack, true)
				end
				local modTime = altDuration - GetGameTimeMillis() / 1000
				trackTargets[aId] = trackTargets[aId] or {}
				trackTargets[aId] [fName] = altDuration -- simply unit name tracking, more is not possible
				fakeTargetsDB[aId] = {duration = modTime, icon = mIcon, type = debuffSwitch, name = aName} -- dynamically add to fake target debuff table in order to keep player only timer on non-stacking auras when looking away and back at targets (Phinix)
			end
			if unitTagt == 'reticleover' then -- handle maintaining player only timer when looking away and back at targets with non-stacking Prominent auras (Phinix)
				if playerSource(sourceCast) then
					if start ~= altDuration then -- only track prominent auras that actually have a timer duration to avoid problems
						addFakes(abilityId)
					end
				else -- may never hit this section depending on if event sends casts by others (Phinix)
					if ((isProminent) and (pCast)) or ((not isProminent) and (Srendarr.db.filtersTarget.onlyPlayerDebuffs)) then
						return
					else
					--	if (start ~= altDuration) and (IsMajorEffect(abilityId)) or (IsMinorEffect(abilityId)) then -- only track non-stacking auras from others to avoid useless confusing mess (Phinix)
						if start ~= altDuration then
							addFakes(abilityId)
						end
					end
				end
			end
			------------------------------------------------------------------------------------------------------------------------------------------------------

			if change == EFFECT_RESULT_GAINED then -- handle cooldowns that proc on the player with a game-tracked event here instead of EVENT_COMBAT_EVENT to avoid desyncs (Phinix)

				if abilityCooldowns[abilityId] then
					local equippedSets = Srendarr.equippedSets
					if equippedSets[abilityCooldowns[abilityId].s1] or equippedSets[abilityCooldowns[abilityId].s2] then -- only look at cooldown status for sets you actually have equipped (Phinix)
						local cdID = abilityId+4000000
						local abID = abilityId+5000000
						releaseFaded('player', cdID, false, false) -- release cooldown if present to avoid desync (Phinix)

						local aName = (abilityCooldowns[abilityId].altName ~= nil) and abilityCooldowns[abilityId].altName or aName
						local dbTime = (abilityCooldowns[abilityId].altTime ~= nil) and abilityCooldowns[abilityId].altTime or GetAbilityDuration(abilityId) / 1000
						local dbTag = (abilityCooldowns[abilityId].unitTag ~= nil) and abilityCooldowns[abilityId].unitTag or unitTagt
						local dbIcon = (abilityCooldowns[abilityId].altIcon ~= nil) and abilityCooldowns[abilityId].altIcon or GetAbilityIcon(abilityId)
						local currentTime = GetGameTimeMillis() / 1000
						stopTime = (dbTime == 0) and currentTime or currentTime + dbTime + (GetLatency() / 1000) -- use duration 0 to indicate this is a toggle/passive not timer

						if auraLookup['player'][abID] then -- handles switching passive "ready" state cooldowns on the active tracking bar to countdown timers (Phinix)
							auraLookup['player'][abID].loopTexture:SetHidden(true)
							auraLookup['player'][abID].loop:Stop()
							auraLookup['player'][abID].isPlaying = false
							auraLookup['player'][abID]:Release()
							displayFrameRef[GROUP_CDBAR]:AddAuraToDisplay(false, GROUP_CDBAR, AURA_TYPE_TIMED, aName, 'player', currentTime, currentTime + abilityCooldowns[abilityId].CD, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abID, 0, true, true)
						end
						AuraHandler(false, aName, dbTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abilityId, 1, nStacks, true, isProminent)
						return
					end
				end
			end

		--	releaseFaded(unitTagt, abilityId, true, false)
			if (Srendarr.db.consolidateEnabled and IsAlternateAura(abilityId)) then -- handles multi-aura passive abilities like Restoring Aura (Phinix)
				AuraHandler(false, alternateAura[abilityId].altName, unitTagt, start, altDuration, mIcon, debuffSwitch, abilityType, abilityId, sourceCast, nStacks, nil, isProminent)
			else
				AuraHandler(false, aName, unitTagt, start, altDuration, mIcon, debuffSwitch, abilityType, abilityId, sourceCast, nStacks, nil, isProminent)
			end

			if (abilityId == crystalFragmentsPassive and sourceType == 1 and not Srendarr.crystalFragmentsProc) then -- special case for tracking fragments proc
				Srendarr:OnCrystalFragmentsProc(true)
			end
		end
	end
end


-- ------------------------
-- EVENT: EVENT_COMBAT_EVENT
do ------------------------
	local TYPE_ENCHANT				= Srendarr.TYPE_ENCHANT
	local TYPE_SPECIAL				= Srendarr.TYPE_SPECIAL
	local TYPE_COOLDOWN				= Srendarr.TYPE_COOLDOWN
	local TYPE_RELEASE				= Srendarr.TYPE_RELEASE
	local TYPE_TARGET_DEBUFF		= Srendarr.TYPE_TARGET_DEBUFF
	local TYPE_TARGET_AURA			= Srendarr.TYPE_TARGET_AURA
	local TYPE_ALT_COMBAT			= Srendarr.TYPE_ALT_COMBAT
	local GetGameTimeMillis			= GetGameTimeMilliseconds
	local GetLatency				= GetLatency
	local enchantProcs				= Srendarr.enchantProcs
	local specialProcs				= Srendarr.specialProcs
	local specialNames				= Srendarr.specialNames
	local releaseTriggers			= Srendarr.releaseTriggers
	local fakeTargetDebuffs			= Srendarr.fakeTargetDebuffs
	local stackingAuras				= Srendarr.stackingAuras
	local abilityCooldowns			= Srendarr.abilityCooldowns
	local auraLookup				= Srendarr.auraLookup
	local grimProcs					= Srendarr.grimProcs
	local grimBase					= Srendarr.grimBase
	local OffBalance				= Srendarr.OffBalance

	local function EventToChat(e, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, elog, sUnitId, tUnitId, abilityId)
		if (aName ~= "" and aName ~= nil) or Srendarr.db.showNoNames then
			if Srendarr.db.onlyPlayerDebug and sName ~= playerName then return end
			if sName == playerName then sName = "Player" end
			if tName == playerName then tName = "Player" end
			if not Srendarr.db.disableSpamControl and debugAuras[abilityId] ~= "ignore" then debugAuras[abilityId] = "flood" end
			if not Srendarr.db.showVerboseDebug then
				d(tostring(abilityId)..": "..aName.." --> [S] "..sName.."  [T] "..tName.." - "..tostring(result))
			else
				d(aName.." ("..tostring(abilityId)..")")
				d("event: "..e.." || result: "..result.." || isError: "..tostring(isError).." || aName: "..aName.." || aGraphic: "..tostring(aGraphic).." || aActionSlotType: "..tostring(aActionSlotType).." || sName: "..sName.." || sType: "..tostring(sType).." || tName: "..tName.." || tType: "..tostring(tType).." || hitValue: "..tostring(hitValue).." || pType: "..tostring(pType).." || dType: "..tostring(dType).." || log: "..tostring(elog).." || sUnitId: "..tostring(sUnitId).." || tUnitId: "..tostring(tUnitId).." || abilityId: "..tostring(abilityId))
				d("Icon: "..GetAbilityIcon(abilityId))
				d("=========================================================")
			end
		end
	end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Process EVENT_COMBAT_EVENT based on passed classifications and values (Phinix)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local function ProcessEvent(aName, sName, groupType, unitTag, groupTag, sType, tName, abilityId, eType, result, isCooldown, checkProminent) -- (Phinix)
		local sourceCast
		local currentTime
		local stopTime
		local dbTag = (groupType == 0) and unitTag or (groupType == 1) and unitTag or groupTag
		local dbIcon
		local expired
		local dbTime = 0

		if eType == TYPE_ENCHANT then -- enchantProcs[abilityId] ~= nil
			dbTime = enchantProcs[abilityId].duration
			dbIcon = (Srendarr.db.enchantAltIcons) and enchantProcs[abilityId].icon or GetAbilityIcon(abilityId)
		elseif eType == TYPE_SPECIAL then -- specialProcs[abilityId] ~= nil
			dbTime = (specialProcs[abilityId].altTime ~= nil) and specialProcs[abilityId].altTime or GetAbilityDuration(abilityId) / 1000
			dbTag = (specialProcs[abilityId].unitTag) ~= nil and specialProcs[abilityId].unitTag or dbTag
			dbIcon = (specialProcs[abilityId].altIcon ~= nil) and specialProcs[abilityId].altIcon or GetAbilityIcon(abilityId)
			aName = (specialProcs[abilityId].altName ~= nil) and specialProcs[abilityId].altName or aName
			if dbTag == 'reticleover' then eType = TYPE_TARGET_AURA end
		elseif eType == TYPE_COOLDOWN then -- abilityCooldowns[abilityId] ~= nil
			dbTime = (abilityCooldowns[abilityId].altTime ~= nil) and abilityCooldowns[abilityId].altTime or GetAbilityDuration(abilityId) / 1000
			dbTag = (abilityCooldowns[abilityId].unitTag) ~= nil and abilityCooldowns[abilityId].unitTag or dbTag
			dbIcon = (abilityCooldowns[abilityId].altIcon ~= nil) and abilityCooldowns[abilityId].altIcon or GetAbilityIcon(abilityId)
			aName = (abilityCooldowns[abilityId].altName ~= nil) and abilityCooldowns[abilityId].altName or aName
		elseif eType == TYPE_TARGET_DEBUFF then
			dbTag = 'reticleover'
			dbIcon = fakeTargetsDB[abilityId].icon
			dbTime = fakeTargetsDB[abilityId].duration
		end

		if dbTag == nil then return end

		local isProminent = false
		local playerGroup = false
		local pCast = false
		local isMajor
		local isMinor

		sourceCast = (sType == 1 or sType == 2) and 1 or 2

		if (groupType == 1) and (groupTag ~= nil) then -- make sure group frame gets player's fake (non-game-tracked) auras (Phinix)
			if dbTag == 'player' then playerGroup = true end
		end

		local function GetProminentTable(unit, aId)
			local tTable
			if unit == 'player' and prominentPlayer[aId] ~= nil then
				tTable = prominentPlayer
			elseif unit == 'reticleover' and prominentTarget[aId] ~= nil then
				tTable = prominentTarget
			elseif unit == 'groundaoe' and prominentAOE[aId] ~= nil then
				tTable = prominentAOE
			end
			return tTable
		end
		if checkProminent then -- check here for prominent auras set to only show player cast (Phinix)
			local pTable = GetProminentTable(dbTag, abilityId)
			if pTable ~= nil then
				if pTable[abilityId] ~= nil then
					pCast = pTable[abilityId].oscast
					if (pCast) and (sourceCast ~= 1) and (result ~= ACTION_RESULT_EFFECT_FADED) then
						return
					else
						isProminent = true
					end
				end
			else
				if playerGroup then
					if prominentPlayer[abilityId] ~= nil then
						isProminent = true
					end
				end
			end
		end

		if eType == TYPE_SPECIAL and aName == OffBalance.obN1 then -- special case to proc fake Off Balance Immunity aura (Phinix)
			local fOBImmunityID = OffBalance.ID
			local obCD = OffBalance.CD
			local fTable = (groupType ~= 2) and GetProminentTable(dbTag, fOBImmunityID) or nil
			local aType = (pTable == prominentAOE) and ABILITY_TYPE_AREAEFFECT or ABILITY_TYPE_NONE
			local fProminent = ((Srendarr.prominentIDs[fOBImmunityID] ~= nil) and (fTable ~= nil and fTable[fOBImmunityID] ~= nil)) and true or false
			local timeOffset = GetAbilityDuration(abilityId) / 1000
			local fAuraName = zo_strformat("<<t:1>>", GetAbilityName(OffBalance.nameID))
			currentTime = GetGameTimeMillis() / 1000

			if (not auraLookup[dbTag][fOBImmunityID]) or (auraLookup[dbTag][fOBImmunityID] and auraLookup[dbTag][fOBImmunityID].finish - currentTime <= 1) then
				if dbTag == 'reticleover' then -- multi-target tracking for Off Balance Immunity (Phinix)
					trackTargets[fOBImmunityID] = trackTargets[fOBImmunityID] or {}
					trackTargets[fOBImmunityID] [tName] = currentTime + obCD + timeOffset -- simply unit name tracking, more is not possible
					fakeTargetsDB[fOBImmunityID] = {duration = obCD + timeOffset, icon = OffBalance.icon, type = BUFF_EFFECT_TYPE_BUFF, name = fAuraName}
				end
				if auraLookup[dbTag][fOBImmunityID] then
					auraLookup[dbTag][fOBImmunityID]:Update(currentTime, currentTime + obCD + timeOffset, nil, true)
				else
					AuraHandler(false, fAuraName, dbTag, currentTime, currentTime + obCD + timeOffset, OffBalance.icon, BUFF_EFFECT_TYPE_BUFF, aType, fOBImmunityID, sourceCast, stack, nil, fProminent)
					if playerGroup then
						AuraHandler(false, fAuraName, groupTag, currentTime, currentTime + obCD + timeOffset, OffBalance.icon, BUFF_EFFECT_TYPE_BUFF, aType, fOBImmunityID, sourceCast, stack, nil, false, playerGroup)
					end
				end
			else
				return
			end
		end

		if eType == TYPE_RELEASE then -- release event for tracked proc so remove aura (releaseTriggers[abilityId] ~= nil)
			local releaseOffset = releaseTriggers[abilityId].release
			local modID

			if dbTag ~= 'player' then return end

			if grimBase[abilityId] then -- Grim Focus (Phinix)
				modID = grimBase[abilityId].modID
				Srendarr.db.grimTracker[modID] = 0
				if modID then
					if (auraLookup['player'][modID]) then
						local modAura = auraLookup['player'][modID]
						local modName = modAura.auraName
						local modStart = modAura.start
						local modFinish = modAura.finish
						if grimProcs[modID] ~= nil then
							if modAura.isPlaying then
								modAura.loopTexture:SetHidden(true)
								modAura.loop:Stop()
								modAura.isPlaying = false
							end
						end
						modAura:Release()
						local modIcon = GetAbilityIcon(modID)
						local modProminent = (Srendarr.prominentIDs[modID] ~= nil and prominentPlayer[modID] ~= nil)
						AuraHandler(false, modName, 'player', modStart, modFinish, modIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, modID, 1, 0, nil, modProminent)
					end
				end
			end

			if stackingAuras[releaseOffset] then
				if auraLookup[dbTag][releaseOffset] then
					auraLookup[dbTag][releaseOffset]:Update(start, finish, stackingAuras[releaseOffset].start, true)
				end
				return
			end

			local specialRelease = {[86009] = true, [86015] = true, [86019] = true, [178020] = true, [178028] = true, [146919] = true} -- only release when result is type gained (Phinix)
			local aTypes = {'player', 'groundaoe', 'reticleover'} -- Handle release events for multiple unit tag types (at least one set -Essence Thief
			for _, aType in pairs(aTypes) do -- has a mechanic that requires 'groundaoe' to allow canceling the spawned effect timer early when collecting the pool.) (Phinix)
				if auraLookup[aType][releaseOffset] then
					if specialRelease[abilityId] then
						if (result == ACTION_RESULT_EFFECT_GAINED or result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
							expired = auraLookup[aType][releaseOffset]
							if expired ~= nil then expired:Release() end
						end
					else
						expired = auraLookup[aType][releaseOffset]
						if expired ~= nil then expired:Release() end
					end
				end
			end

		elseif eType == TYPE_SPECIAL and sName == "" and specialProcs[abilityId].bar and dbTag == 'player' then -- tracked ability removed from bar so remove aura (specialProcs[abilityId] ~= nil)
			expired = auraLookup['player'][abilityId]
			if expired ~= nil then expired:Release() end

	-- adding a custom "invisible proc" aura (meaning an aura that doesn't show on the character sheet)

		elseif eType == TYPE_TARGET_DEBUFF then -- new invisible debuff

			if sName ~= "" then
				if tName == "" then return end
				currentTime = GetGameTimeMillis() / 1000
				stopTime = (dbTime == 0) and currentTime or currentTime + dbTime + (GetLatency() / 1000)

				if tName == playerName then
					sourceCast = 2
					dbTag = 'player'
				else
					if (groupType == 2) and groupTag ~= nil then -- handle fake debuff procs for non-player group members (Phinix)
						AuraHandler(false, aName, groupTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_DEBUFF, ABILITY_TYPE_NONE, abilityId, (sourceCast == 1) and 31 or 32, nil, false, false, true)
						return
					end

					if sourceCast ~= 1 and sName ~= playerName then return end -- only show player's fake debuffs on the target 
					-- same additional check needed for player-only auras, for the reasons described below. (Phinix)
					sourceCast = 1
					dbTag = 'reticleover'

					trackTargets[abilityId] = trackTargets[abilityId] or {}
					trackTargets[abilityId] [tName] = stopTime -- simply unit name tracking, more is not possible

					if (isProminent) and (stopTime ~= currentTime) then -- handle maintaining player only timer when looking away and back at targets with non-stacking Prominent auras (Phinix)
						fakeTargetsDB[abilityId] = {duration = stopTime - currentTime, icon = dbIcon, type = BUFF_EFFECT_TYPE_DEBUFF, name = aName} -- dynamically add to fake target debuff table in order to keep player only timer on non-stacking auras when looking away and back at targets (Phinix)
					end
				end
				AuraHandler(false, aName, dbTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_DEBUFF, ABILITY_TYPE_NONE, abilityId, sourceCast, nil, false, isProminent)
				if playerGroup then
					AuraHandler(false, aName, groupTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_DEBUFF, ABILITY_TYPE_NONE, abilityId, sourceCast, nil, false, false, true)
				end
			end
		else -- New invisible proc

			currentTime = GetGameTimeMillis() / 1000
			stopTime = (dbTime == 0) and currentTime or currentTime + dbTime + (GetLatency() / 1000) -- use duration 0 to indicate this is a toggle/passive not timer

			if (groupType == 2) and groupTag ~= nil then -- handle fake buff procs for non-player group members (Phinix)
				AuraHandler(false, aName, groupTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abilityId, (sourceCast == 1) and 31 or 32, nil, false, false, true)
				return
			end

			if sourceCast ~= 1 and tName ~= playerName then return end -- player's fake buff section
		-- game seems to report wrong values for sets like Whitestrake so additional ~= playerName check needed to prevent seeing other's effects (Phinix)
		-- playerName is populated and formatted once when Srendarr is loaded and re-used thereafter so there should be negligible performance impact.

			if (isCooldown) then
				local cdID = abilityId+4000000
				local abID = abilityId+5000000

				if auraLookup['player'][abID] then -- handles switching passive "ready" state cooldowns on the active tracking bar to countdown timers (Phinix)
					auraLookup['player'][abID].loopTexture:SetHidden(true)
					auraLookup['player'][abID].loop:Stop()
					auraLookup['player'][abID].isPlaying = false
					auraLookup['player'][abID]:Release()
					displayFrameRef[GROUP_CDBAR]:AddAuraToDisplay(false, GROUP_CDBAR, AURA_TYPE_TIMED, aName, 'player', currentTime, currentTime + abilityCooldowns[abilityId].CD, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abID, 0, true, true)
				end

				if (auraLookup['player'][cdID]) then -- avoid duplicates and desyncs (Phinix)
					auraLookup['player'][cdID]:Release()
				end
			end
			AuraHandler(false, aName, dbTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abilityId, 1, nil, isCooldown, isProminent)
			if playerGroup and not grimBase[abilityId] then
				AuraHandler(false, aName, groupTag, currentTime, stopTime, dbIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abilityId, 1, nil, false, false, true)
			end
		end
	end

	Srendarr.CombatDebug = function(e, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, elog, sUnitId, tUnitId, abilityId)
	-- Debug mode for tracking new auras. Type /sdbclear or reloadui to reset (Phinix)
		if Srendarr.db.disableSpamControl == true and Srendarr.db.manualDebug == false then
			EventToChat(e, result, isError, zo_strformat("<<t:1>>",aName), aGraphic, aActionSlotType, zo_strformat("<<t:1>>",sName), sType, tName, zo_strformat("<<t:1>>",tType), hitValue, pType, dType, elog, sUnitId, tUnitId, abilityId)
		else
			if debugAuras[abilityId] ~= "flood" then
				EventToChat(e, result, isError, zo_strformat("<<t:1>>",aName), aGraphic, aActionSlotType, zo_strformat("<<t:1>>",sName), sType, zo_strformat("<<t:1>>",tName), tType, hitValue, pType, dType, elog, sUnitId, tUnitId, abilityId)
			end
		end
	end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Actual event data received by registering EVENT_COMBAT_EVENT (Phinix)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Srendarr.OnCombatEvent = function(e, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, elog, sUnitId, tUnitId, abilityId)
		if tName == '' then return end -- no information to accurately identify target sent by game (Phinix)

		local equippedSets = Srendarr.equippedSets
		local validResults = {
			[ACTION_RESULT_EFFECT_GAINED] = true,
			[ACTION_RESULT_EFFECT_GAINED_DURATION] = true,
			[ACTION_RESULT_POWER_ENERGIZE] = true,
			[ACTION_RESULT_HEAL] = true,
			[ACTION_RESULT_CRITICAL_HEAL] = true,
			[ACTION_RESULT_DAMAGE] = true,
			[ACTION_RESULT_CRITICAL_DAMAGE] = true,
		}
		local function releaseFaded(rUnit, rAbility, fast) -- release current proc if present to reset timer (Phinix)
			if rUnit and auraLookup[rUnit] and auraLookup[rUnit][rAbility] then
				local rAura = auraLookup[rUnit][rAbility]
				if rAura then
					if (fast) then
						rAura:Release()
					else
						if (rAura.auraType == AURA_TYPE_TIMED) or (rAura.auraType == DEBUFF_TYPE_TIMED) then
							rAura:SetExpired()
						else
							rAura:Release()
						end
					end
				end
			end
		end

	-- Special database for name-swapping custom auras the game doesn't track or name correctly (Phinix)
		aName = (specialNames[abilityId] ~= nil) and specialNames[abilityId].name or zo_strformat("<<t:1>>",aName)

		if aName == OffBalance.obN2 then aName = OffBalance.obN1 end

		sName = zo_strformat("<<t:1>>",sName)
		tName = zo_strformat("<<t:1>>",tName)
		local unitTag
		local groupTag
		local groupType = 0
		local isGrouped = Srendarr.IsPlayerGrouped

		if sName == playerName then
			unitTag = 'player'
			if isGrouped then
				groupTag = GetLocalPlayerGroupUnitTag()
				groupType = 1
			end
		else
			if (Srendarr.targetName ~= "" and sName == Srendarr.targetName) then
				unitTag = 'reticleover'
			end
			if Srendarr.groupNames[sName] ~= nil then
				groupTag = Srendarr.groupNames[sName]
				groupType = 2
			end
		end

		local checkProminent = Srendarr.prominentIDs[abilityId] ~= nil
		local isFaded = result == ACTION_RESULT_EFFECT_FADED -- obey fade time if event result is faded aura otherwise clear aura instantly (Phinix)

	-- Cascading check for valid combat event conditions for speed (Phinix)
		if releaseTriggers[abilityId] ~= nil then ---------------------------------------------------------------------------------------------------------------------------------------------- Release Trigger
			if not unitTag and not groupTag then return end
			ProcessEvent(aName, sName, groupType, unitTag, groupTag, sType, tName, abilityId, TYPE_RELEASE, result, false, false)
		end

		if enchantProcs[abilityId] ~= nil then ------------------------------------------------------------------------------------------------------------------------------------------------- Enchant Proc
			if not unitTag and not groupTag then return end
			releaseFaded(unitTag, abilityId, not isFaded)
			releaseFaded(groupTag, abilityId, not isFaded)
			if (isFaded) then return end -- if aura has faded remove custom proc (Phinix)
			ProcessEvent(aName, sName, groupType, unitTag, groupTag, sType, tName, abilityId, TYPE_ENCHANT, result, false, checkProminent)
		elseif fakeTargetsDB[abilityId] ~= nil then -------------------------------------------------------------------------------------------------------------------------------------------- Target Debuff
			if not unitTag and not groupTag then return end
			releaseFaded(unitTag, abilityId, not isFaded)
			releaseFaded(groupTag, abilityId, not isFaded)
			if (isFaded) then return end -- if aura has faded remove custom proc (Phinix)
			ProcessEvent(aName, sName, groupType, unitTag, groupTag, sType, tName, abilityId, TYPE_TARGET_DEBUFF, result, false, checkProminent)
		elseif specialProcs[abilityId] ~= nil then --------------------------------------------------------------------------------------------------------------------------------------------- Special Proc
			if not unitTag and not groupTag and not specialProcs[abilityId].unitTag then return end

		--	d(tostring(abilityId).." - "..tostring(result)) -- uncomment for debug events which need to be added to validResults (Phinix)
		--  https://wiki.esoui.com/Constant_Values#ACTION_RESULT_ABILITY_ON_COOLDOWN

			local tTag = (specialProcs[abilityId].unitTag ~= nil) and specialProcs[abilityId].unitTag or unitTag
			releaseFaded(tTag, abilityId, not isFaded)
			releaseFaded(groupTag, abilityId, not isFaded)
			if (isFaded) then return end -- if aura has faded remove custom proc (Phinix)
			if specialProcs[abilityId].iH ~= nil then
				if result ~= specialProcs[abilityId].iH then return end -- prevent resetting cooldown timer when game sends multiple event updates to same initial ID (Phinix)
			else
				if not validResults[result] then return end
			end
			ProcessEvent(aName, sName, groupType, tTag, groupTag, sType, tName, abilityId, TYPE_SPECIAL, result, false, checkProminent)
		elseif abilityCooldowns[abilityId] ~= nil then------------------------------------------------------------------------------------------------------------------------------------------ Ability Cooldown
			if not unitTag and not groupTag and not abilityCooldowns[abilityId].unitTag then return end

			if abilityCooldowns[abilityId].cdE == 1 then -- only process cooldown events that require EVENT_COMBAT_EVENT to avoid desyncs (Phinix)

				if not abilityCooldowns[abilityId].unitTag and unitTag ~= 'player' then -- Group frame proc effects (Phinix)
					if not groupTag then return end
					if not abilityCooldowns[abilityId].hT then return end
					releaseFaded(groupTag, abilityId, not isFaded)
					if (isFaded) then return end -- if aura has faded remove custom proc (Phinix)
					if not validResults[result] then return end
					ProcessEvent(aName, sName, groupType, nil, groupTag, sType, tName, abilityId, TYPE_COOLDOWN, result, false, false)
				else
					if equippedSets[abilityCooldowns[abilityId].s1] or equippedSets[abilityCooldowns[abilityId].s2] then -- only look at cooldown status for sets you actually have equipped (Phinix)
						local sourceCast = (sType == 1 or sType == 2) and 1 or 2
						if sourceCast ~= 1 and sName ~= playerName then return end -- only show player's cooldowns (Phinix)

					--	d(tostring(abilityId).." - "..tostring(result))  -- uncomment for debug events which need to be added to validResults (Phinix)
					--  https://wiki.esoui.com/Constant_Values#ACTION_RESULT_ABILITY_ON_COOLDOWN
	
						local tTag = (abilityCooldowns[abilityId].unitTag ~= nil) and abilityCooldowns[abilityId].unitTag or unitTag
						releaseFaded(tTag, abilityId, not isFaded)
						releaseFaded(groupTag, abilityId, not isFaded)
						if (isFaded) then return end -- if aura has faded remove custom proc (Phinix)
						if abilityCooldowns[abilityId].iH ~= nil then
							if result ~= abilityCooldowns[abilityId].iH then return end -- prevent resetting cooldown timer when game sends multiple event updates to same initial ID (Phinix)
						else
							if not validResults[result] then return end
						end
						ProcessEvent(aName, sName, groupType, tTag, groupTag, sType, tName, abilityId, TYPE_COOLDOWN, result, true, checkProminent)
					else
						return
					end
				end
			else
				return
			end
		else
			return
		end
	end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Register event and handle configuration (Phinix)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Srendarr:ConfigureCombatDebug() -- Only register for unfiltered event data if debug set to show combat events (Phinix)
		if Srendarr.db.showCombatEvents == true then
			EVENT_MANAGER:RegisterForEvent('Srendarr_CombatDebug', EVENT_COMBAT_EVENT, Srendarr.CombatDebug)
		else
			EVENT_MANAGER:UnregisterForEvent('Srendarr_CombatDebug', EVENT_COMBAT_EVENT)
		end
	end

	function Srendarr:ConfigureOnCombatEvent()
		local baseFilters = {}

	-- Since this event fires VERY often and is only used for a preset database of abilityIDs, use filters to improve performance (Phinix)
		for abilityID, _ in pairs(releaseTriggers) do
			if not releaseTriggers[abilityID].nCE then
				baseFilters[abilityID] = true
				EVENT_MANAGER:RegisterForEvent('Srendarr_Release_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
				EVENT_MANAGER:AddFilterForEvent('Srendarr_Release_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
			end
		end
		for abilityID, _ in pairs(enchantProcs) do
			baseFilters[abilityID] = true
			EVENT_MANAGER:RegisterForEvent('Srendarr_Enchants_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
			EVENT_MANAGER:AddFilterForEvent('Srendarr_Enchants_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
		end
		for abilityID, _ in pairs(fakeTargetDebuffs) do
			baseFilters[abilityID] = true
			EVENT_MANAGER:RegisterForEvent('Srendarr_FakeDebuff_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
			EVENT_MANAGER:AddFilterForEvent('Srendarr_FakeDebuff_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
		end
		for abilityID, _ in pairs(specialProcs) do
			baseFilters[abilityID] = true
			EVENT_MANAGER:RegisterForEvent('Srendarr_FakeBuff_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
			EVENT_MANAGER:AddFilterForEvent('Srendarr_FakeBuff_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
		end
		for abilityID, _ in pairs(abilityCooldowns) do
			if abilityCooldowns[abilityID].cdE == 1 then
				baseFilters[abilityID] = true
				EVENT_MANAGER:RegisterForEvent('Srendarr_Cooldowns_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
				EVENT_MANAGER:AddFilterForEvent('Srendarr_Cooldowns_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
			end
		end

	-- player custom filter input from Expert mode prominent by ID or group buff/debuff by ID entries (Phinix)
		if Srendarr.db.prominentDB ~= nil and Srendarr.db.prominentDB[Srendarr.STR_PROMBYID] ~= nil then
			for k, _ in pairs(combatEventFilters.pA) do EVENT_MANAGER:UnregisterForEvent('Srendarr_ExpertByID_' ..tostring(k), EVENT_COMBAT_EVENT) end
			combatEventFilters.pA = {} -- unregister old entries when aura is added/removed by ID (Phinix)
			for k, v in pairs(Srendarr.db.prominentDB[Srendarr.STR_PROMBYID]) do
				for abilityID, _ in pairs(v) do
					if not baseFilters[abilityID] then combatEventFilters.pA[abilityID] = true end -- track current entry registration (Phinix)
					EVENT_MANAGER:RegisterForEvent('Srendarr_ExpertByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
					EVENT_MANAGER:AddFilterForEvent('Srendarr_ExpertByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
				end
			end
		end
		if Srendarr.db.groupBuffWhitelist ~= nil and Srendarr.db.groupBuffWhitelist[Srendarr.STR_GROUPBUFFBYID] ~= nil then
			for k, _ in pairs(combatEventFilters.gB) do EVENT_MANAGER:UnregisterForEvent('Srendarr_GroupBuffByID_' ..tostring(k), EVENT_COMBAT_EVENT) end
			combatEventFilters.gB = {} -- unregister old entries when aura is added/removed by ID (Phinix)
			for abilityID, _ in pairs(Srendarr.db.groupBuffWhitelist[Srendarr.STR_GROUPBUFFBYID]) do
				if not baseFilters[abilityID] then combatEventFilters.gB[abilityID] = true end -- track current entry registration (Phinix)
				EVENT_MANAGER:RegisterForEvent('Srendarr_GroupBuffByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
				EVENT_MANAGER:AddFilterForEvent('Srendarr_GroupBuffByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
			end
		end
		if Srendarr.db.groupDebuffWhitelist ~= nil and Srendarr.db.groupDebuffWhitelist[Srendarr.STR_GROUPDEBUFFBYID] ~= nil then
			for k, _ in pairs(combatEventFilters.gD) do EVENT_MANAGER:UnregisterForEvent('Srendarr_GroupDebuffByID_' ..tostring(k), EVENT_COMBAT_EVENT) end
			combatEventFilters.gD = {} -- unregister old entries when aura is added/removed by ID (Phinix)
			for abilityID, _ in pairs(Srendarr.db.groupDebuffWhitelist[Srendarr.STR_GROUPDEBUFFBYID]) do
				if not baseFilters[abilityID] then combatEventFilters.gD[abilityID] = true end -- track current entry registration (Phinix)
				EVENT_MANAGER:RegisterForEvent('Srendarr_GroupDebuffByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, Srendarr.OnCombatEvent)
				EVENT_MANAGER:AddFilterForEvent('Srendarr_GroupDebuffByID_' ..tostring(abilityID), EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, abilityID)
			end
		end
	end
end


-- ------------------------
-- DEBUG FUNCTIONS
-- ------------------------
local function ClearDebug()
	debugAuras = {}
end

local function dbAdd(option)
	option = tostring(option):gsub("%D",'')
	if option ~= "" then
		debugAuras[tonumber(option)] = "flood"
		d('Hiding '..option)
	end
end

local function dbRemove(option)
	option = tostring(option):gsub("%D",'')
	if option ~= "" then
		if debugAuras[tonumber(option)] ~= nil then
			debugAuras[tonumber(option)] = nil
			d('Showing next '..option)
		end
	end
end

local function dbIgnore(option)
	option = tostring(option):gsub("%D",'')
	if option ~= "" then
		debugAuras[tonumber(option)] = "ignore"
		d('Always showing '..option)
	end
end


-- ------------------------
-- INITIALIZATION
-- ------------------------
function Srendarr:InitializeAuraControl()
	-- setup debug system (Phinix)
	SLASH_COMMANDS['/sdbclear']		= ClearDebug
	SLASH_COMMANDS['/sdbadd']		= function(option) dbAdd(option) end
	SLASH_COMMANDS['/sdbremove']	= function(option) dbRemove(option) end
	SLASH_COMMANDS['/sdbignore']	= function(option) dbIgnore(option) end
	
	EVENT_MANAGER:RegisterForEvent(self.name,	EVENT_PLAYER_ACTIVATED,					Srendarr.OnPlayerActivatedAlive) -- same action for both events
	EVENT_MANAGER:RegisterForEvent(self.name,	EVENT_PLAYER_ALIVE,						Srendarr.OnPlayerActivatedAlive) -- same action for both events
	EVENT_MANAGER:RegisterForEvent(self.name,	EVENT_PLAYER_DEAD,						Srendarr.OnPlayerDead)
	EVENT_MANAGER:RegisterForEvent(self.name,	EVENT_EFFECT_CHANGED,					Srendarr.OnEffectChanged)

	for k, v in pairs(Srendarr.fakeTargetDebuffs) do
		fakeTargetsDB[k] = v -- setup temp DB to compare base fake target debuffs to current dynamic list (Phinix)
	end

	self:ConfigureOnCombatState()			-- EVENT_PLAYER_COMBAT_STATE
--	self:ConfigureOnTargetChanged()			-- EVENT_RETICLE_TARGET_CHANGED
	self:ConfigureOnActionSlotAbilityUsed()	-- EVENT_ACTION_SLOT_ABILITY_USED
	self:ConfigureOnCombatEvent()			-- EVENT_COMBAT_EVENT
	self:ConfigureCombatDebug()				-- EVENT_COMBAT_EVENT

	self:ConfigureAuraHandler()
end
