RaidNotifier = RaidNotifier or {}
RaidNotifier.HRC = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.HRC.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
	
	data = {}
end

function RaidNotifier.HRC.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier

	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.helra
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end		
		
	if (result == ACTION_RESULT_BEGIN) then
		-- Warrior Stone Form
		--   This one needs a small trick: sometimes the Warrior will attempt to stone
		--   two people but only the last person actually gets trapped. But because it 
		--   is the last person that gets trapped and not the first we cannot use the
		--   normal interval code. So we add a delay and check if we got another alert
		--   before actually displaying it.
		if (abilityId == buffsDebuffs.warrior_stoneform) then
			dbg("BEGIN >> Warrior Stone Form on %s, hitValue: %d", tName, hitValue)
			if (settings.warrior_stoneform >= 1) then
				local lastIndex = self:GetLastNotify("helra", "warrior_stoneform") + 1
				self:SetLastNotify("helra", "warrior_stoneform", lastIndex)
				zo_callLater(function()
					if (lastIndex == self:GetLastNotify("helra", "warrior_stoneform")) then
						if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
							self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HELRA_WARRIOR_STONEFORM), "helra", "warrior_stoneform")
						elseif (tName ~= "" and settings.warrior_stoneform == 2) then
							self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_HELRA_WARRIOR_STONEFORM_OTHER), tName), "helra", "warrior_stoneform")
						end
					end
				end, 200)
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		if (abilityId == buffsDebuffs.warrior_stoneform) then
			dbg("GAINED_DURATION >> Warrior Stone Form on %s, hitValue: %d", tName, hitValue)
		elseif abilityId == buffsDebuffs.yokeda_meteor then
			if settings.yokeda_meteor > 0 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HELRA_YOKEDA_METEOR), "helra", "yokeda_meteor")
				elseif (tName ~= "" and settings.yokeda_meteor == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_HELRA_YOKEDA_METEOR_OTHER), tName), "helra", "yokeda_meteor")
				end
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED) then
		if (abilityId == buffsDebuffs.warrior_stoneform) then
			dbg("GAINED >> Warrior Stone Form on %s, hitValue: %d", tName, hitValue)
		end
	end
end
