RaidNotifier = RaidNotifier or {}
RaidNotifier.MA = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.MA.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
end

function RaidNotifier.MA.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier

	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.maelstrom

	if (result == ACTION_RESULT_BEGIN) then
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		if (tType == COMBAT_UNIT_TYPE_PLAYER) then
			if (buffsDebuffs.stage7_poison[abilityId]) then 
				if settings.stage7_poison then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAELSTROM_STAGE7_POISON), "maelstrom", "stage7_poison", 15)
				end
			elseif (buffsDebuffs.stage9_synergy == abilityId) then
				if settings.stage9_synergy then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAELSTROM_STAGE9_SYNERGY), "maelstrom", "stage9_synergy", 15)
				end
			end
		end
	end
end
