RaidNotifier = RaidNotifier or {}
RaidNotifier.HOF = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

local data = {}

function RaidNotifier.HOF.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
	
	data = {}
	data.Minions = {}
end

function RaidNotifier.HOF.OnBossesChanged()
	local bossCount, bossAlive, bossFull = RaidNotifier:GetNumBosses(true)
	-- reset if: 	
	--	1) there are no bosses	
	--	2) all bosses are dead	
	--	3) all bosses are at full health	
	if bossCount == 0 or bossAlive == 0 or bossFull == bossCount then	
		data = {}
		data.Minions = {}
	end
end

function RaidNotifier.HOF.OnCombatStateChanged(inCombat)
	if (not inCombat) then
		dbg("Bosses changed, stop any active countdown")
		RaidNotifier:StopCountdown()
--		data = {}
--		data.Minions = {}
	end
end

function RaidNotifier.HOF.OnEffectChanged(eventCode, changeType, eSlot, eName, uTag, beginTime, endTime, stackCount, iconName, buffType, eType, aType, statusEffectType, uName, uId, abilityId, uType) 
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	
--	dbg("==>%s --> %d -> %d (%d)", uName, beginTime, endTime, stackCount)

	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.hallsFab
	if abilityId == buffsDebuffs.pinnacleBoss_scalded_debuff then
		if settings.pinnacleBoss_scalded == true then
			if (changeType == EFFECT_RESULT_FADED) then
				self:UpdateScaldedStacks(0)
			else
				self:UpdateScaldedStacks(stackCount, beginTime, endTime)
			end
		end
	elseif abilityId == buffsDebuffs.venom_injection then
		if settings.venom_injection then
			self:UpdateSphereVenom(changeType ~= EFFECT_RESULT_FADED, beginTime, endTime)
		end
	end
end

function RaidNotifier.HOF.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.hallsFab

	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end
	
	if (result == ACTION_RESULT_BEGIN) then
		if (abilityId == buffsDebuffs.taking_aim) then
			if (settings.taking_aim >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					if (settings.taking_aim == 1 and settings.taking_aim_dynamic > 0) then
						dbg("Taking Aim incoming from Sphere #%d, hitValue=%d", sUnitId, hitValue)
						data.taking_aim_index = self:StartCountdown(settings.taking_aim_dynamic == 2 and settings.taking_aim_duration or hitValue, GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_TAKING_AIM_SIMPLE), "hallsFab", "taking_aim")
						data.Minions.incomingSource = sUnitId
					else
						self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_TAKING_AIM), "hallsFab", "taking_aim")
					end
				elseif (tName ~= "" and settings.taking_aim == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_TAKING_AIM_OTHER), tName), "hallsFab", "taking_aim")
				end
			end
		elseif (buffsDebuffs.conduit_strike[abilityId] == true) then
			if (settings.conduit_strike == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_CONDUIT_STRIKE), "hallsFab", "conduit_strike")
			end
		elseif (abilityId == buffsDebuffs.pinnacleBoss_conduit_spawn) then
			if (settings.pinnacleBoss_conduit_spawn == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_CONDUIT_SPAWN), "hallsFab", "pinnacleBoss_conduit_spawn")
			end
		elseif (abilityId == buffsDebuffs.pinnacleBoss_conduit_drain) then
			if settings.pinnacleBoss_conduit_drain >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_CONDUIT_DRAIN), "hallsFab", "pinnacleBoss_conduit_drain")
				elseif (tName ~= "" and settings.pinnacleBoss_conduit_drain == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_CONDUIT_DRAIN_OTHER), tName), "hallsFab", "pinnacleBoss_conduit_drain")
				end
			end
		elseif (abilityId == buffsDebuffs.committee_fabricant_spawn) then --start of wave
			if (settings.committee_fabricant_spawn == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_FABRICANT_SPAWN), "hallsFab", "committee_fabricant_spawn", 4) -- rewrite it to use CountDown method like auras
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		if (abilityId == buffsDebuffs.draining_ballista) then
			if (settings.draining_ballista >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_DRAINING_BALLISTA), "hallsFab", "draining_ballista", 4) -- do we need this 4sec delay?
				elseif (tName ~= "" and settings.draining_ballista == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_DRAINING_BALLISTA_OTHER), tName), "hallsFab", "draining_ballista", 4)
				end
			end
		elseif (abilityId == buffsDebuffs.power_leech) then
			if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
				if (settings.power_leech == true) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_POWER_LEECH), "hallsFab", "power_leech")
				end
			end
		elseif (abilityId == buffsDebuffs.committee_overheat_aura or abilityId == buffsDebuffs.committee_overload_aura) then -- not checking for "committee_overcharge_aura" since it isn't involved in the swapping
			-- right we dont care that this occurs multiple times in a row
			if (settings.committee_overpower_auras == true) then
				data.committee_countdown_index = self:StartCountdown(settings.committee_overpower_auras_duration, GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_OVERPOWER_AURAS), "hallsFab", "committee_overpower_auras")
				if (self:IsDevMode() and settings.committee_overpower_auras_dynamic == true) then
					data.committee_overpower_auras_total = (data.committee_overpower_auras_total or 0) + 1
					data.committee_overheat_target = nil
					data.committee_overload_target = nil
				end
			end
		--elseif abilityId == buffsDebuffs.hunters_spawn_sphere then
		--	dbg("Spawn Sphere #%d (%d)", tUnitId, result)
		--	data.Minions[tUnitId] = abilityId -- to keep track of what spawned this minion
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED) then
		if (abilityId == buffsDebuffs.committee_reclaim_achieve) then
			if (settings.committee_reclaim_achieve == true) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_RECLAIM_ACHIEVE), "hallsFab", "committee_reclaim_achieve", 10)
			end
		elseif (abilityId == buffsDebuffs.committee_overheat or abilityId == buffsDebuffs.committee_overload) then
			if self:IsDevMode() then
				if (settings.committee_overpower_auras_dynamic == true) then
					if (RaidNotifier.Util.SafeInt(data.committee_countdown_index) > 0) then --only run while countdown is still happening
						local key = (abilityId == buffsDebuffs.committee_overload) and "committee_overload_target" or "committee_overheat_target"
						local lastTarget = data[key]
						data[key] = tUnitId
						if (lastTarget ~= nil and lastTarget ~= data[key]) then -- tanks have swapped?
							dbg("%s changed from %s to %s", key, self.UnitIdToString(lastTarget), self.UnitIdToString(tUnitId))
							local stopCountdown = false
							if (tType == COMBAT_UNIT_TYPE_PLAYER) then
								-- we are tanking and have just gotten aggro from the other boss, stop the timer??
								dbg("Stop countdown for us cuz we did our job as tank")
								stopCountdown = true
							else
								-- continue the timer until the other boss is switched too
								data.committee_overpower_auras_total = data.committee_overpower_auras_total - 1
								if (data.committee_overpower_auras_total <= 0) then
									dbg("Both bosses have been switched")
									stopCountdown = true
								end
							end
							if (stopCountdown) then
								dbg("Stopping countdown")
								self:StopCountdown(data.committee_countdown_index)
								data.committee_countdown_index = 0 -- don't set it to nil
							end
						end
					end
				end
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_FADED) then
		if (abilityId == buffsDebuffs.committee_overheat_aura or abilityId == buffsDebuffs.committee_overload_aura) then 
			if self:IsDevMode() then
				if (settings.committee_overpower_auras_dynamic == true) then
					self:StopCountdown(data.committee_countdown_index)
					data.committee_countdown_index = 0 -- don't set it to nil
					data.committee_overload_target = nil
					data.committee_overheat_target = nil
					data.committee_overpower_auras_total = 0
				end
			end
		end
	elseif (result == ACTION_RESULT_INTERRUPT) then
		--if data.Minions[tUnitId] == buffsDebuffs.hunters_spawn_sphere then
			if tUnitId == data.Minions.incomingSource then
				dbg("Sphere #%d was interrupted", tUnitId)
				data.Minions.incomingSource = nil
				self:StopCountdown(data.taking_aim_index)
				data.taking_aim_index = 0 -- don't set it to nil
			end
		--end
	elseif (result == ACTION_RESULT_DIED) then
		--if data.Minions[tUnitId] == buffsDebuffs.hunters_spawn_sphere then
			if tUnitId == data.Minions.incomingSource then
				dbg("Sphere #%d died", tUnitId)
				data.Minions.incomingSource = nil
				self:StopCountdown(data.taking_aim_index)
				data.taking_aim_index = 0 -- don't set it to nil
			end
			--data.Minions[tUnitId] = nil 
		--end
	end	
end
