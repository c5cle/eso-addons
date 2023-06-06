RaidNotifier = RaidNotifier or {}
RaidNotifier.AA = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.AA.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
end

function RaidNotifier.AA.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end		

	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.archive
	if (result == ACTION_RESULT_BEGIN) then
		-- Lightning Storm Atronach
		if (buffsDebuffs.stormatro_impendingstorm == abilityId) then
			if settings.stormatro_impendingstorm then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_STORMATRO_IMPENDINGSTORM), "archive", "stormatro_impendingstorm")
			end
		elseif (buffsDebuffs.stormatro_lightningstorm == abilityId) then
			if settings.stormatro_lightningstorm then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_STORMATRO_LIGHTNINGSTORM), "archive", "stormatro_lightningstorm")
			end
		-- Foundation Stone Atronach
		elseif (buffsDebuffs.stoneatro_boulderstorm == abilityId) then
			if settings.stoneatro_boulderstorm then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_STONEATRO_BOULDERSTORM), "archive", "stoneatro_boulderstorm", 8)
			end
		elseif (buffsDebuffs.stoneatro_bigquake == abilityId) then
			if settings.stoneatro_bigquake then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_STONEATRO_BIGQUAKE), "archive", "stoneatro_bigquake", 8)
			end
		-- Celestial Mage
		elseif (buffsDebuffs.mage_conjure_axe[abilityId]) then
			if settings.mage_conjure_axe then
				
			end
		elseif (buffsDebuffs.mage_conjure_reflection[abilityId]) then
			if settings.mage_conjure_reflection then
				--self.tempVars.minions.archive.reflections[tUnitId] = {
				--	uId = tUnitId,
				--	health    = 1000000,
				--	maxHealth = 1000000,
				--	name = "Conjured Reflection",
				--}
			end
		-- Overchargers, Overcharged
		elseif (buffsDebuffs.overcharged == abilityId) then
			if settings.overcharge >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_OVERCHARGE), "archive", "overcharge")
				elseif (tName ~= "" and settings.overcharge == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_OVERCHARGE_OTHER), tName), "archive", "overcharge")
				end
			end
		-- Overchargers, Call Lightning
		elseif (buffsDebuffs.call_lightning == abilityId) then
			if settings.call_lightning >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_CALL_LIGHTNING), "archive", "call_lightning")
				elseif (tName ~= "" and settings.call_lightning == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_ARCHIVE_CALL_LIGHTNING_OTHER), tName), "archive", "call_lightning")
				end
			end
		end		
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
			if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
		end
	end
end
