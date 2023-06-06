RaidNotifier = RaidNotifier or {}
RaidNotifier.SO = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.SO.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
	
	data = {}
end

function RaidNotifier.SO.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.sanctumOphidia
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end		

	--We're lucky that alot of things can be detected slightly before they hit the player
	if (result == ACTION_RESULT_BEGIN) then
		-- Serpent, Poison Phase
		if (buffsDebuffs.serpent_poison_teleport[abilityId]) then
			local phase = buffsDebuffs.serpent_poison_teleport[abilityId]
			if settings.serpent_poison == 2 or phase == 5 then --"Full" or final poison phase, use detailed text
				self:AddAnnouncement(GetString("RAIDNOTIFIER_ALERTS_SANCTUM_SERPENT_POISON", phase), "sanctumOphidia", "serpent_poison")
			elseif settings.serpent_poison == 1 then --"Normal", use plain text
				self:AddAnnouncement(GetString("RAIDNOTIFIER_ALERTS_SANCTUM_SERPENT_POISON", 0), "sanctumOphidia", "serpent_poison")
			end

		-- Serpent (Hardmode), World-Shaper
		elseif (abilityId == buffsDebuffs.serpent_world_shaper) then
			 --per start of eclipse tear, just add countdown and use interval to limit it to the first
			if (settings.serpent_world_shaper == true) then
				self:StartCountdown(buffsDebuffs.serpent_world_shaper_delay, GetString(RAIDNOTIFIER_ALERTS_SANCTUM_SERPENT_WORLD_SHAPER), "sanctumOphidia", "serpent_world_shaper", nil, 10)
			end

		-- Trolls, Spreading Poison
		elseif (buffsDebuffs.spreading_poison[abilityId]) then
			if settings.troll_poison >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_TROLL_POISON), "sanctumOphidia", "troll_poison")
				elseif (tName ~= "" and settings.troll_poison == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_TROLL_POISON_OTHER), tName), "sanctumOphidia", "troll_poison")
				end
			end

		-- Trolls, Boulder Toss
		elseif (buffsDebuffs.boulder_toss == abilityId) then
			if settings.troll_boulder >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_TROLL_BOULDER), "sanctumOphidia", "troll_boulder")
				elseif (tName ~= "" and settings.troll_boulder == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_TROLL_BOULDER_OTHER), tName), "sanctumOphidia", "troll_boulder")
				end
			end

		-- Overchargers, Overcharged
		elseif (buffsDebuffs.overcharged == abilityId) then
			if settings.overcharge >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_OVERCHARGE), "sanctumOphidia", "overcharge")
				elseif (tName ~= "" and settings.overcharge == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_OVERCHARGE_OTHER), tName), "sanctumOphidia", "overcharge")
				end
			end

		-- Overchargers, Call Lightning
		elseif (buffsDebuffs.call_lightning == abilityId) then
			if settings.call_lightning >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_CALL_LIGHTNING), "sanctumOphidia", "call_lightning")
				elseif (tName ~= "" and settings.call_lightning == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_CALL_LIGHTNING_OTHER), tName), "sanctumOphidia", "call_lightning")
				end
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
			
		-- TODO: Reintroduce simple alert when standing in a spear
		
		-- Mantikora Spear Throw Alert
		--    This one is a bit weird, the effect is added as soon as the red circle starts appearing (which is
		--    good). But this also means it may show multiple alerts, one for each of the people that are in the 
		--    target area. And since we'll always want the player to take priority we slightly delay the alert for
		--    other players and let the interval check handle the rest.
		--    The really nice thing is that we no longer have to support the "Near" option since you'll always be
		--    alerted if you'd end up inside the spear (excluding movement after it is thrown).
		--    UPDATE: Seems it simply always adds this ability to the three furthest people even if they are far
		--    away from each other.
		--if (abilityId == buffsDebuffs.mantikora_spear) then
		--	if settings.mantikora_spear >= 1 then
		--		df("Manti SpearThrow - %d/%d/%s", tType, tUnitId, tName)
		--		if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
		--			self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_MANTIKORA_SPEAR), 3000, SOUNDS.CHAMPION_POINTS_COMMITTED,
		--												5, "sanctumOphidia", "mantikora_spear")
		--		elseif (tName ~= "" and settings.mantikora_spear == 2) then
		--			zo_callLater(function()
		--				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_MANTIKORA_SPEAR_OTHER), tName), 3000, SOUNDS.CHAMPION_POINTS_COMMITTED,
		--													5, "sanctumOphidia", "mantikora_spear")
		--			end, 100)
		--		else
		--			--dbg("Manticora Spear on unknown player #"..tUnitId)
		--		end
		--	end
		--end
			
		if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
			-- Sanctum Serpent Magicka Detonation Alert
			if (abilityId == buffsDebuffs.serpent_magicka_deto) then
				if (settings.magicka_deto == true) then
					-- get current magicka percentage (only notify if the current magicka is over 15%)
					local current, maximum, _ = GetUnitPower("player", POWERTYPE_MAGICKA)
					local magickaPercentage   = zo_roundToNearest(current/maximum,0.01) * 100
					if magickaPercentage > 15 then
						self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_MAGICKA_DETONATION)), "sanctumOphidia", "magicka_deto", 5)
					end
				end
			end
					
			-- Mantikora Quake Alert
			if (abilityId == buffsDebuffs.mantikora_quake) then
				if (settings.mantikora_quake == true) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SANCTUM_MANTIKORA_QUAKE)), "sanctumOphidia", "mantikora_quake", 5)
				end
			end
		end
	end
end
