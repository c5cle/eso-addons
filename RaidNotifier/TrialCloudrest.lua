RaidNotifier = RaidNotifier or {}
RaidNotifier.CR = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

local data = {}

function RaidNotifier.CR.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
	
	data = {}
	data.spearCounter = 0
	data.portalCounter = 0
end

--function RaidNotifier.CR.OnBossesChanged()
--	local bossCount, bossAlive, bossFull = RaidNotifier:GetNumBosses(true)

	-- reset if: 	
	--	1) there are no bosses	
	--	2) all bosses are dead	
	--	3) all bosses are at full health
--	if bossCount == 0 or bossAlive == 0 or bossFull == bossCount then
--		dbg("clear data before")
--		if (not IsUnitInCombat("player")) then
--			dbg("clear data")
--			data.spearCounter = 0
--			data.portalCounter = 0
--		end
--	end
--end

function RaidNotifier.CR.OnCombatStateChanged(inCombat)
	if (inCombat) then
		local bossCount, bossAlive, bossFull = RaidNotifier:GetNumBosses(true)
		if bossCount == 0 or bossAlive == 0 or bossFull == bossCount then
			data.spearCounter = 0
			data.portalCounter = 0
		end
	end
end

function RaidNotifier.CR.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.cloudrest
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end

	if result == ACTION_RESULT_BEGIN then
		if buffsDebuffs.hoarfrost[abilityId] then
			local track = buffsDebuffs.hoarfrost[abilityId]
			data.hoarfrost = data.hoarfrost or {}
			data.hoarfrost[track] =
			{
				count = 0, -- will be incremented to 1 once it's actually added to the player
				unitId = tUnitId,
				ms = GetGameTimeMilliseconds(),
			}
			dbg("Begin hoarfrost(%d) track #%d for %s(%s) %d", abilityId, track, tName, tostring(tUnitId), hitValue)
			if (settings.hoarfrost >= 1) then
				local tmp = 0
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					-- TODO remove setting hoarfrost_countdown
					if settings.hoarfrost_countdown then
						self:StartCountdown(buffsDebuffs.hoarfrost_countdown + hitValue, GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_COUNTDOWN", tmp), "cloudrest", "hoarfrost", false)
					else
						self:AddAnnouncement(GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST", tmp), "cloudrest", "hoarfrost")
					end
				elseif (tName ~= "" and settings.hoarfrost > 1) then
					self:AddAnnouncement(zo_strformat(GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_OTHER", tmp), tName), "cloudrest", "hoarfrost")
				end
			end
		elseif abilityId == buffsDebuffs.tentacle_spawn then
			if (settings.tentacle_spawn == true and not (self.break_amulet and settings.break_amulet)) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_TENTACLE_SPAWN), "cloudrest", "tentacle_spawn")
			end
		elseif abilityId == buffsDebuffs.nocturnals_favor then
			if (settings.nocturnals_favor > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_NOCTURNALS_FAVOR), "cloudrest", "nocturnals_favor", false)
				end
			end
		elseif buffsDebuffs.heavy_attack[abilityId] == true then
			if (settings.heavy_attack >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_HEAVY_ATTACK), "cloudrest", "heavy_attack")
				elseif (tName ~= "" and settings.heavy_attack > 1) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_HEAVY_ATTACK_OTHER), tName), "cloudrest", "heavy_attack")
				end
			end
		elseif abilityId == buffsDebuffs.baneful_barb then
			if (settings.baneful_barb > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_BANEFUL_BARB), "cloudrest", "baneful_barb")
				elseif (tName ~= "" and settings.baneful_barb > 1) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_BANEFUL_BARB_OTHER), tName), "cloudrest", "baneful_barb")
				end
			end
		elseif abilityId == buffsDebuffs.shadow_realm_cast then
			--data.lastOlorimeSpearMs = 0
			data.spearCounter = 0
			if (settings.shadow_realm_cast) then
				--self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_SHADOW_REALM_CAST), "cloudrest", "shadow_realm_cast")
				self:StartCountdown(hitValue, zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_SHADOW_REALM_CAST), (data.portalCounter % 2) + 1), "cloudrest", "shadow_realm_cast", false)
			end
			data.portalCounter = data.portalCounter + 1			
		elseif abilityId == buffsDebuffs.sum_shadow_beads then
			if (settings.sum_shadow_beads == true and not (data.break_amulet and settings.break_amulet)) then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_SUM_SHADOW_BEADS), "cloudrest", "sum_shadow_beads")
			end
		elseif buffsDebuffs.roaring_flare[abilityId] then
			--if data.break_amulet then
			dbg("roaring flare [%d] -> %s %d", abilityId, tName or "nil", hitValue)
			--end
			if (settings.roaring_flare >= 1) then
				if (data.break_amulet and not data.targetedByFire_2) then -- first fire on execute
					-- lets merge both fires together
					data.targetedByFire_2 = tType == COMBAT_UNIT_TYPE_PLAYER and "you" or tName
					data.targetedByFireTime_2 = GetGameTimeMilliseconds()
					dbg("First fire - %s", data.targetedByFire_2)
					zo_callLater(function()
						if (data.targetedByFire_2) then -- this should not happen but if, then display only one fire
							dbg("This should not happen! Only one fire on execute?")
							if (tType == COMBAT_UNIT_TYPE_PLAYER) then
								self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE), "cloudrest", "roaring_flare")
							elseif (tName ~= "" and settings.roaring_flare > 1) then
								self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE_OTHER), tName), "cloudrest", "roaring_flare")
							end
							data.targetedByFire_2 = nil
							data.targetedByFireTime_2 = 0
						end
					end, 500)
				elseif (data.targetedByFire_2) then -- second fire on execute
					local targetedByFire_1 = tType == COMBAT_UNIT_TYPE_PLAYER and "you" or tName;
					dbg("Roaring Flare diff between both fires %d ms", data.targetedByFireTime_2 - GetGameTimeMilliseconds());
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE_2), data.targetedByFire_2, targetedByFire_1), "cloudrest", "roaring_flare")
					--self:StartCountdown(6500, zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE_2), data.targetedByFire_2, targetedByFire_1), "cloudrest", "roaring_flare", false)
					data.targetedByFire_2 = nil
					data.targetedByFireTime_2 = 0
				elseif (tType == COMBAT_UNIT_TYPE_PLAYER) then
					--self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE), "cloudrest", "roaring_flare")
					self:StartCountdown(6500, GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE), "cloudrest", "roaring_flare", false)
				elseif (tName ~= "" and settings.roaring_flare > 1) then
					if (settings.track_roaring_flare and not data.break_amulet) then
						local tUnitTag = self.UnitToTag(tUnitId)
						dbg("Tracking UnitTag: %s (%d)", tUnitTag, tUnitId)
						self:TrackPlayer(tUnitTag, buffsDebuffs.roaring_flare_countdown)
					end
					--self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE_OTHER), tName), "cloudrest", "roaring_flare")
					self:StartCountdown(6500, zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_ROARING_FLARE_OTHER), tName), "cloudrest", "roaring_flare", false)
				end
			end
		elseif abilityId == buffsDebuffs.shadow_splash and settings.shadow_splash == true then
			self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_SHADOW_SPLASH), "cloudrest", "shadow_splash")
		end
	elseif result == ACTION_RESULT_EFFECT_GAINED then
		if (abilityId == buffsDebuffs.start_cd_of_srealm) then
			data.break_amulet = false
			data.portalCounter = 0
		elseif (abilityId == buffsDebuffs.player_exit_srealm) then
			dbg("Exit ShadowRealm >> %s", tName)
		elseif (abilityId == buffsDebuffs.break_amulet) then
			dbg("Entering execute phase")
			data.break_amulet = true
		elseif abilityId == buffsDebuffs.chilling_comet then
			if (settings.chilling_comet == true) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_CHILLING_COMET), "cloudrest", "chilling_comet")
				end
			end		
		elseif (buffsDebuffs.malicious_strike[abilityId]) then
			if (settings.malicious_strike == true) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_MALICIOUS_STRIKE), "cloudrest", "malicious_strike", 1)
				end				
			end
		elseif buffsDebuffs.hoarfrost_new[abilityId] then
			if hitValue == 1 then 
				local track = buffsDebuffs.hoarfrost_new[abilityId]
				local d = data.hoarfrost[track]
				d.count = d.count + 1
				dbg("Increment hoarfrost track #%d to %d for %s(%s)", track, d.count, tName, tostring(tUnitId))
				if d.unitId ~= tUnitId or (GetGameTimeMilliseconds() - d.ms) > 3000 then -- filter out the first one since we already showed the notification for it during ACTION_RESULT_BEGIN
					if (settings.hoarfrost >= 1) then
						local tmp = d.count >= 3 and 1 or 0
						if (tType == COMBAT_UNIT_TYPE_PLAYER) then
							if settings.hoarfrost_countdown then
								self:StartCountdown(buffsDebuffs.hoarfrost_countdown, GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_COUNTDOWN", tmp), "cloudrest", "hoarfrost", false)
							else
								self:AddAnnouncement(GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST", tmp), "cloudrest", "hoarfrost")
							end
						elseif (tName ~= "" and settings.hoarfrost > 1) then
							self:AddAnnouncement(zo_strformat(GetString("RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_OTHER", tmp), tName), "cloudrest", "hoarfrost")
						end
					end
				end
			end
		elseif abilityId == buffsDebuffs.hoarfrost_shed then
			if (settings.hoarfrost_shed == true) then
				if (tName ~= "" and tType ~= COMBAT_UNIT_TYPE_PLAYER) then
					local count = 0
					for i, d in ipairs(data.hoarfrost) do
						if d.unitId == tUnitId then
							count = d.count
							dbg("Hoarfrost track #%d dropped by %s", i, tName)
						end
					end
					if count < 3 and not data.break_amulet then --disable this in execute for now, will have an option for it later
						self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_SHED_OTHER), tName), "cloudrest", "hoarfrost_shed")
					end
				end
			end
		elseif abilityId == buffsDebuffs.crushing_darkness then
			if (settings.crushing_darkness > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_CRUSHING_DARKNESS), "cloudrest", "crushing_darkness")
				end
			end
		elseif abilityId == buffsDebuffs.olorime_spears then
			data.spearCounter = data.spearCounter + 1
			if (settings.olorime_spears == true) then
				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_OLORIME_SPEARS), data.spearCounter), "cloudrest", "olorime_spears")
			end
		elseif abilityId == buffsDebuffs.olorime_spears_synergized then
			--dbg("Spear Synergized ")
			
		elseif abilityId == buffsDebuffs.hoarfrost_syn then
			if (settings.hoarfrost > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_HOARFROST_SYN), "cloudrest", "hoarfrost_syn", 5)
				end
			end
		end
	elseif result == ACTION_RESULT_EFFECT_GAINED_DURATION then
		if buffsDebuffs.shadow_world[abilityId] == true then
			dbg("Enter ShadowRealm >> %s", tName)
			if tType == COMBAT_UNIT_TYPE_PLAYER then
				dbg("Reset hoarfrost count for me")
				if data.hoarfrost then 
					if data.hoarfrost[1] then
						data.hoarfrost[1].count = 0
					end
					if data.hoarfrost[2] then
						data.hoarfrost[2].count = 0
					end
				end
			end
		elseif abilityId == buffsDebuffs.voltaic_overload then
			if (settings.voltaic_overload > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_VOLTAIC_OVERLOAD_CD), "cloudrest", "voltaic_overload", true)
				end
			end
		elseif buffsDebuffs.voltaic_current[abilityId] == true then
			if (settings.voltaic_overload > 0) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					--self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_VOLTAIC_CURRENT), "cloudrest", "voltaic_current")
					self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_VOLTAIC_CURRENT), "cloudrest", "voltaic_overload", true)
				end
			end
		end
	elseif result == ACTION_RESULT_EFFECT_FADED then
		-- when player die or overload just ended
		if abilityId == buffsDebuffs.voltaic_overload then
			--data.voltaic_overload = 0
			self.StopCountdown()
		--elseif abilityId == buffsDebuffs.olorime_spears_synergized then
		--	local now = GetGameTimeMilliseconds()
		--	dbg("Spear Synergized Done at %d", now)
		--	if data.lastOlorimeSpearMs > 0 then
		--		local diff = now - data.lastOlorimeSpearMs 
		--		local x, y = GetMapPlayerPosition(LUNIT:GetUnitTagForUnitId(tUnitId))
		--		dbg(" DiffMs: %d, Pos: %f / %f", diff, x, y)
		--	else
		--		local x, y = GetMapPlayerPosition(LUNIT:GetUnitTagForUnitId(tUnitId))
		--		dbg(" First spear, Pos: %f / %f", x, y)
		--	end
		--	data.lastOlorimeSpearMs = now
		end
		
--		elseif result == ACTION_RESULT_DAMAGE then
--			if buffsDebuffs.voltaic_overload_progress[abilityId] == true then
--				if (settings.voltaic_overload > 0 and data.voltaic_overload and data.voltaic_overload > 0) then
--					if (tType == COMBAT_UNIT_TYPE_PLAYER) then
--						self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_VOLTAIC_OVERLOAD), "cloudrest", "voltaic_overload", 2)
--					end
--				end
--			end
	end
end
