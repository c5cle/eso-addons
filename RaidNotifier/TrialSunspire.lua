RaidNotifier = RaidNotifier or {}
RaidNotifier.SS = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

local data = {}

function RaidNotifier.SS.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
	
	data = {}
	data.translation_apocalypse_id = 0
	data.frozen_tomb = 0
	data.last_frozen_tomb = 0
	data.time_breach_used = false
end

function RaidNotifier.SS.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.sunspire
	local pool = self.NotificationsPool.GetInstance()
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end
	
	--local time = string.format("%s:%03d ", GetTimeString(), GetGameTimeMilliseconds() % 1000)
	--d(string.format("%s [%d] %s(%d) %s => %s", time, result, GetAbilityName(abilityId), abilityId, tostring(hitValue), tName))

	if (result == ACTION_RESULT_BEGIN) then
		if (buffsDebuffs.door_protection_ice == abilityId) then
			data.frozen_tomb = 0
			data.last_frozen_tomb = 0
		elseif (buffsDebuffs.thrash == abilityId) then
			if (settings.thrash == true) then
				self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_THRASH), "sunspire", "thrash", false)
			end
		elseif (buffsDebuffs.mark_for_death == abilityId) then
			if (settings.mark_for_death == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_MARK_FOR_DEATH), "sunspire", "mark_for_death")
			end
		elseif (buffsDebuffs.time_shift == abilityId) then
			if (settings.time_breach == true) then
				self:StartCountdown(buffsDebuffs.time_breach_time, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_TIME_BREACH_COUNTDOWN), "sunspire", "time_breach", false)
			end
		elseif (buffsDebuffs.negate_field == abilityId) then
			if (settings.negate_field > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_NEGATE_FIELD), "sunspire", "negate_field")
				end
			end
		elseif (buffsDebuffs.frozen_tomb == abilityId) then
			local deadline_time = data.last_frozen_tomb + buffsDebuffs.frozen_tomb_wipe_time
			local now = GetGameTimeMilliseconds()
			if (deadline_time <= now) then
				data.frozen_tomb = 0
			end
			if (settings.frozen_tomb == true) then
				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_FROZEN_TOMB), data.frozen_tomb % 3 + 1), "sunspire", "frozen_tomb", 5)
			end
			data.frozen_tomb = data.frozen_tomb + 1
			data.last_frozen_tomb = now
		elseif (buffsDebuffs.sweeping_breath[abilityId]) then
			if (settings.sweeping_breath == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_SWEEPING_BREATH), "sunspire", "sweeping_breath", 5)	
			end
		elseif (buffsDebuffs.focus_fire == abilityId) then
			if (settings.focus_fire > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:StartCountdown(2200, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_FOCUS_FIRE), "sunspire", "focus_fire", false)
				elseif (tName ~= "" and settings.focus_fire > 1) then
					self:StartCountdown(2200, zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_FOCUS_FIRE_OTHER), tName), "sunspire", "focus_fire", false)
				end
			end
		elseif (buffsDebuffs.breath[abilityId]) then
			if (settings.breath > 0) then
				local abilityName = zo_strformat(SI_ABILITY_NAME, GetAbilityName(abilityId))
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_BREATH), abilityName), "sunspire", "breath", 5)
				elseif (tName ~= "" and settings.breath > 1) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_BREATH_OTHER), abilityName, tName), "sunspire", "breath", 5)
				end
			end
		elseif (buffsDebuffs.translation_apocalypse == abilityId) then
			dbg("Translation apocalypse %d", hitValue)
			if (settings.translation_apocalypse == true and hitValue < 3000) then
				self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_APOCALYPSE), "sunspire", "translation_apocalypse", false)
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED) then
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		if (buffsDebuffs.chilling_comet[abilityId]) then
			if (settings.chilling_comet > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_CHILLING_COMET), "sunspire", "chilling_comet")
				elseif (tName ~= "" and settings.chilling_comet > 1) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_CHILLING_COMET_OTHER), tName), "sunspire", "chilling_comet")
				end
			end
		elseif (buffsDebuffs.time_breach == abilityId) then
			if (settings.time_breach_time == true) then
				
			end
		elseif (buffsDebuffs.time_breach_use == abilityId) then
			if (tType == COMBAT_UNIT_TYPE_PLAYER) then
				dbg("Use Time Breach")
				data.time_breach_used = true
			end
		elseif (buffsDebuffs.shocking_bolt == abilityId) then
			dbg("Shocking bolt: %s %d", tName, hitValue)
--			if (settings.shock_bolt == true) then
--				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
--					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_SHOCK_BOLT), "sunspire", "shock_bolt")
--				elseif (tName ~= "") then
--					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_SHOCK_BOLT_OTHER), tName), "sunspire", "shock_bolt")
--				end
--			end			
		elseif (buffsDebuffs.translation_apocalypse == abilityId) then
			if (settings.translation_apocalypse == true) then
				data.translation_apocalypse_id = self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_APOCALYPSE_ENDS), "sunspire", "translation_apocalypse", false)
			end	
			dbg("Translation apocalypse ends in %d id: %d", hitValue, data.translation_apocalypse_id)
		elseif (buffsDebuffs.find_the_enemy == abilityId) then
			dbg("Find the enemy %d", hitValue)
			if (settings.shock_bolt == true) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:StartCountdown(hitValue + buffsDebuffs.shocking_bolt_delay, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_SHOCK_BOLT), "sunspire", "shock_bolt", false)
				end
			end	
		elseif (buffsDebuffs.return_to_reality == abilityId) then
			if (tType == COMBAT_UNIT_TYPE_PLAYER) then
				dbg("Return to reality")
				data.time_breach_used = false
			end
		elseif (buffsDebuffs.molten_meteor[abilityId]) then
			if (settings.molten_meteor > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_MOLTEN_METEOR), "sunspire", "molten_meteor", false)
				elseif (tName ~= "" and settings.molten_meteor > 1) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_MOLTEN_METEOR_OTHER), tName), "sunspire", "molten_meteor")
				end
			end			
		elseif (buffsDebuffs.cataclism == abilityId) then
			if (settings.cataclism == true) then
				self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_SUNSPIRE_CATACLISM), "sunspire", "cataclism", false)
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_FADED) then
		if (buffsDebuffs.translation_apocalypse == abilityId) then
			dbg("Translation apocalypse ends %d", data.translation_apocalypse_id)
			self:StopCountdown(data.translation_apocalypse_id)
			data.translation_apocalypse_id = 0
		end
	end
end
