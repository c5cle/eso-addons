RaidNotifier = RaidNotifier or {}
RaidNotifier.DSA = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.DSA.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
end

function RaidNotifier.DSA.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)

	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.dragonstar
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end		

	if (result == ACTION_RESULT_BEGIN) then
		-- General: Taking Aim
		if (abilityId == buffsDebuffs.general_taking_aim) then
			if (settings.general_taking_aim) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_GENERAL_TAKING_AIM), "dragonstar", "general_taking_aim")
				end
			end
		-- General: Crystal Blast
		elseif (abilityId == buffsDebuffs.general_crystal_blast) then
			if (settings.general_crystal_blast) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_GENERAL_CRYSTAL_BLAST), "dragonstar", "general_crystal_blast")
				end
			end
		-- Arena 2: Crushing Shock
		elseif (abilityId == buffsDebuffs.arena2_crushing_shock) then
			if (settings.arena2_crushing_shock) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA2_CRUSHING_SHOCK), "dragonstar", "arena2_crushing_shock")
				end
			end
		-- Arena 6: Drain Resource
		elseif (abilityId == buffsDebuffs.arena6_drain_resource) then
			if (settings.arena6_drain_resource >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA6_DRAIN_RESOURCE), "dragonstar", "arena6_drain_resource")
				elseif (tName ~= "" and settings.arena6_drain_resource >= 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA6_DRAIN_RESOURCE_OTHER), tName), "dragonstar", "arena6_drain_resource")
				end
			end
		-- Arena 8: Ice Charge
		elseif (abilityId == buffsDebuffs.arena8_ice_charge) then
			if (settings.arena8_ice_charge >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA8_ICE_CHARGE), "dragonstar", "arena8_ice_charge")
				elseif (tName ~= "" and settings.arena8_ice_charge >= 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA8_ICE_CHARGE_OTHER), tName), "dragonstar", "arena8_ice_charge")
				end
			end
		-- Arena 8: Fire Charge
		elseif (abilityId == buffsDebuffs.arena8_fire_charge) then
			if (settings.arena8_fire_charge >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA8_FIRE_CHARGE), "dragonstar", "arena8_fire_charge")
				elseif (tName ~= "" and settings.arena8_fire_charge >= 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA8_FIRE_CHARGE_OTHER), tName), "dragonstar", "arena8_fire_charge")
				end
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		-- Arena 7: Unstable Core (Eclipse)
		if (abilityId == buffsDebuffs.arena7_unstable_core) then
			if (settings.arena7_unstable_core) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_DRAGONSTAR_ARENA7_UNSTABLE_CORE), "dragonstar", "arena7_unstable_core")
				end
			end
		end
	end
end
