RaidNotifier = RaidNotifier or {}
RaidNotifier.AS = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

local data = {}

function RaidNotifier.AS.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg

	data = {}
end

function RaidNotifier.AS.Shutdown()
	-- In case of zoning out during the battle "OnCombatStateChanged" handler may be unregistered before it'll be called
	-- outside the combat; so we have to manually unregister handler for interval check here
	EVENT_MANAGER:UnregisterForUpdate(RaidNotifier.Name .. "_IntervalCheck")
end

local function OnIntervalCheck()
	local self = RaidNotifier
	local raidId = RaidNotifier.raidId
	local buffsDebuffs = RaidNotifier.BuffsDebuffs[raidId]	
	local settings = self.Vars.asylum
	
	if (settings.olms_gusts_of_steam and settings.olms_gusts_of_steam_slider > 0) then
		local health, maxHealth = GetUnitPower("boss1", POWERTYPE_HEALTH) -- It's always Olms in AS
		-- Precautious check in case of situation when the fight is finished already but the combat state check didn't fire yet
		-- (as we have 3 seconds delay for that currently)
		if (health == 0 or maxHealth == 0) then
			return
		end
		local healthPercent = health * 100 / maxHealth
		if (data.olmsHealthChecked == nil) then
			data.olmsHealthChecked = healthPercent
		end
		for _, jumpPercent in pairs(buffsDebuffs.olms_phasesHealth) do
			if (jumpPercent < data.olmsHealthChecked and healthPercent <= (jumpPercent + settings.olms_gusts_of_steam_slider)) then
				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_PRE_GUSTS_OF_STEAM), settings.olms_gusts_of_steam_slider), "asylum", "olms_gusts_of_steam")
				data.olmsHealthChecked = jumpPercent
				break
			end
		end
	end
end

function RaidNotifier.AS.OnCombatStateChanged(inCombat)
	local self = RaidNotifier
	if (inCombat) then
		-- At the start of the fight we want to clear all previous fight data collected
		data = {}
		EVENT_MANAGER:RegisterForUpdate(self.Name .. "_IntervalCheck", 1000, OnIntervalCheck);
		dbg("start interval check")
	else
		EVENT_MANAGER:UnregisterForUpdate(self.Name .. "_IntervalCheck")
		dbg("stopped interval check")
	end
end

function RaidNotifier.AS.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.asylum
		
	--if buffsDebuffs.interest_list[abilityId] then
	--	dbg("[%d] #%d %s (%d)", result, abilityId, GetAbilityName(abilityId), tUnitId)
	--end
	
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end		

	if result == ACTION_RESULT_BEGIN then
		if abilityId == buffsDebuffs.llothis_defiling_blast and hitValue == 2000 then
			if settings.llothis_defiling_blast >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_DEFILING_BLAST), "asylum", "llothis_defiling_blast")
				elseif (tName ~= "" and settings.llothis_defiling_blast == 2 ) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_DEFILING_BLAST_OTHER), tName), "asylum", "llothis_defiling_blast")
				end
			end
		elseif abilityId == buffsDebuffs.olms_exhaustive_charges then
			if settings.olms_exhaustive_charges then 
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_EXHAUSTIVE_CHARGES), "asylum", "olms_exhaustive_charges", 5)
			end
		elseif abilityId == buffsDebuffs.olms_storm_the_heavens then
			if settings.olms_storm_the_heavens then 
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_STORM_THE_HEAVENS), "asylum", "olms_storm_the_heavens", 5)
			end
		elseif abilityId == buffsDebuffs.olms_gusts_of_steam then
			if settings.olms_gusts_of_steam then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_GUSTS_OF_STEAM), "asylum", "olms_gusts_of_steam", 10)
			end
		elseif abilityId == buffsDebuffs.olms_trial_by_fire then
			if settings.olms_trial_by_fire then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_TRIAL_BY_FIRE), "asylum", "olms_trial_by_fire", 5)
			end
		elseif abilityId == buffsDebuffs.llothis_soul_stained_corruption then
			if settings.llothis_soul_stained_corruption then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_SOUL_STAINED_CORRUPTION), "asylum", "llothis_soul_stained_corruption", 5)
			end
		elseif abilityId == buffsDebuffs.felms_teleport_strike then
			if settings.felms_teleport_strike >= 1 then
				--dbg("Teleport Strike %s", tName)
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_TELEPORT_STRIKE), "asylum", "felms_teleport_strike", 10)
				elseif (tName ~= "" and settings.felms_teleport_strike == 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_TELEPORT_STRIKE_OTHER), tName), "asylum", "felms_teleport_strike")
				end
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED) then
		if abilityId == buffsDebuffs.boss_spawn then
			-- This one is tricky as it triggers each time a boss or minion spawns, thus without context it's not very useful.
			-- Ways to use this:
			--    Single occurance: Protector spawns (before it reaches its target location) or miniboss appears. Always a protector when 
			--                      phase 2, then ~10 seconds later the Llothis boss. Also around ~25 seconds later for the Felms boss.
			--    Triple occurance: Those fancy fire robo-spiders we just ignore. Always when phase 3 starts
			--
			if self:IsDevMode() and data.lastPhaseTimeMs then -- only once phase2 has started
				local curTimeMs = GetGameTimeMilliseconds()
				-- only do callLater if timeMs is different from last
				data.ignoreSpawn = false
				if  curTimeMs - (data.lastBossSpawnTimeMs or 0) < 100 then
					data.ignoreSpawn = true
				else
					zo_callLater(function()
						if data.lastBossSpawnTimeMs and not data.ignoreSpawn then 
							local isProtector = true
							if data.nextSpawnIsProtector then
								data.nextSpawnIsProtector = false
							elseif data.nextSpawnIsLlothis then
								data.nextSpawnIsLlothis = false
								-- nothing should have spawned since the first protector
								local diff = curTimeMs - data.lastPhaseTimeMs
								if diff <= 20000 then -- small window for it to spawn, in case it's only +Felms
									--data.bossLlothisId = tUnitId -- should always be accurate at this point
									--dbg("Found Llothis Boss: %d", tUnitId)
									isProtector = false
								else
									--dbg("Missed our window for Llothis")
								end
							--elseif data.nextSpawnIsFelms then
							--	-- either the Felms boss or another protector spawned, hence we keep a 'backup'
							--	local diff = curTimeMs - data.lastPhaseTimeMs
							--	if diff <= 25000 then -- small window for it to spawn, in case it's only +Llothis (normal is ~15 seconds??)
							--		if data.bossFelmsId then
							--			data.bossFelmsIdBackup = tUnitId 
							--			dbg("Found Felms Boss BACKUP: %d after %d ms", tUnitId, diff)
							--		else
							--			data.bossFelmsId = tUnitId 
							--			dbg("Found Felms Boss: %d after %d ms", tUnitId, diff)
							--		end
							--		isProtector = false
							--	else
							--		dbg("Missed our window for Felms")
							--	end
							--	if data.nextSpawnIsFelmsBackup then
							--		data.nextSpawnIsFelmsBackup = false
							--	else
							--		data.nextSpawnIsFelms = false
							--		data.nextSpawnIsFelmsBackup = true
							--	end
							end
							if isProtector then
								data.latestProtectorId = tUnitId
								--dbg("Protector about to spawn #%d", tUnitId)
								if settings.olms_protector_spawn then 
									self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_PROTECTOR_SPAWN), "asylum", "olms_protector_spawn")
								end
							end
						end
					end, 100) -- tiny delay
				end
				data.lastBossSpawnTimeMs = curTimeMs
			end
			--]]
		elseif abilityId == buffsDebuffs.olms_protector_spawn then
			--[[
			if self:IsDevMode() then
				-- verify that our latest protector id matches
				if tUnitId ~= data.latestProtectorId then
					dbg("Mismatch in protector id: %s vs %s", tostring(data.latestProtectorId), tostring(tUnitId))
					-- make sure our Felms id is correct
					--if data.bossFelmsId == tUnitId then
						dbg("We mistakenly gave Felms the protector id, try and fix it with backup: %s", tostring(data.latestProtectorId))
						data.bossFelmsId = data.latestProtectorId
					--end
				end
				data.latestProtectorId = nil
			end
			--]]
			--if settings.olms_protector_spawn == true then
			--	self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_ASYLUM_PROTECTOR_ACTIVE), "asylum", "olms_protector_spawn")
			--end
		elseif abilityId == buffsDebuffs.olms_boss_enrage then
			--[[
			if tUnitId == data.bossFelmsId then
				dbg("Felms enraged at %d", GetTime())
			elseif tUnitId == data.bossLlothisId then
				dbg("Llothis enraged %d", GetTime())
			else
				dbg("Unknown unit %d enraged at %d", tUnitId, GetTime())
			end
			--]]
		elseif abilityId == buffsDebuffs.olms_phase2 then
			--dbg("Phase2")
			data.lastPhaseTimeMs = GetGameTimeMilliseconds()
			data.nextSpawnIsProtector = true
			data.nextSpawnIsLlothis = true
		elseif abilityId == buffsDebuffs.olms_phase3 then
			--dbg("Phase3")
			data.lastPhaseTimeMs = GetGameTimeMilliseconds()
			data.nextSpawnIsFelms = true
		elseif abilityId == buffsDebuffs.olms_phase4 then
			--dbg("Phase4")
		elseif abilityId == buffsDebuffs.olms_phase5 then
			--dbg("Phase5")
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
	
	elseif (result == ACTION_RESULT_EFFECT_FADED) then
		--if abilityId == buffsDebuffs.olms_protector_spawn then
		--	-- It died, new protectors spawn ~9s later (coincidence?)
           --
		--elseif abilityId == buffsDebuffs.olms_boss_dormant then
		--	if tUnitId == data.bossFelmsId then
		--		dbg("Felms woke up at %d", GetTime())
		--	elseif tUnitId == data.bossLlothisId then
		--		dbg("Llothis woke up at %d", GetTime())
		--	else
		--		dbg("Unknown unit %d woke up at", tUnitId, GetTime())
		--	end
		--
		--end
	end
end
