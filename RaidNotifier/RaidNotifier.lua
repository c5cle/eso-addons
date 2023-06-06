RaidNotifier = RaidNotifier or {}
RaidNotifier.Util = RaidNotifier.Util or {}

local RaidNotifier = RaidNotifier

RaidNotifier.Name           = "RaidNotifier"
RaidNotifier.DisplayName    = "Raid Notifier"
RaidNotifier.Version        = "2.24.1"
RaidNotifier.Author         = "|c009ad6Kyoma, Memus, Woeler, silentgecko|r"
RaidNotifier.SV_Name        = "RNVars"
RaidNotifier.SV_Version     = 4

-- Constants for easy reading
RAID_HEL_RA_CITADEL         = 1
RAID_AETHERIAN_ARCHIVE      = 2
RAID_SANCTUM_OPHIDIA        = 3
RAID_DRAGONSTAR_ARENA       = 4
RAID_MAW_OF_LORKHAJ         = 5
RAID_MAELSTROM_ARENA        = 6
RAID_HALLS_OF_FABRICATION   = 7
RAID_ASYLUM_SANCTORIUM      = 8
RAID_CLOUDREST              = 9
RAID_BLACKROSE_PRISON       = 10
RAID_SUNSPIRE               = 11
RAID_KYNES_AEGIS            = 12
RAID_ROCKGROVE              = 13
RAID_DREADSAIL_REEF         = 14

-- Debugging
local function p() end
local function dbg() end
local function dlog() end

local ENABLE_DEBUG_LOG = false

function RaidNotifier:IsDevMode()
	return self.Vars.dbg.devMode == true
end

-- Locale
local L

RaidNotifier.ActionResults =
{
	ACTION_RESULT_DAMAGE,
	ACTION_RESULT_BEGIN,
	ACTION_RESULT_BEGIN_CHANNEL,
	ACTION_RESULT_EFFECT_GAINED,
	ACTION_RESULT_EFFECT_GAINED_DURATION,
	ACTION_RESULT_EFFECT_FADED,
	ACTION_RESULT_INTERRUPT,
	ACTION_RESULT_DIED,
	--ACTION_RESULT_DIED_XP, -- only interested in spawns/minions, which don't give exp??
}

local ALERT_PRIORITY_HIGHEST = 5
local ALERT_PRIORITY_HIGH    = 4
local ALERT_PRIORITY_NORMAL  = 3
local ALERT_PRIORITY_LOW     = 2
local ALERT_PRIORITY_LOWEST  = 1

------------------------------------
-- -- NOTIFICATION SYSTEM & SOUNDS
do ---------------------------------

	local lastAnnounceIndex = 0
	local lastNotifyTimes = {}
	local function GetKey(r, s)
		return (r.."_"..s)
	end

	local DEFAULT_SOUND = "Default_Sound"
	local Sounds =
	{
		{name = "-Default-", 				 id = DEFAULT_SOUND},
		{name = "-None-", 					 id = SOUNDS.NO_SOUND},
		{name = "Add Guild Member", 		 id = SOUNDS.GUILD_ROSTER_ADDED},
		{name = "Book Acquired", 			 id = SOUNDS.BOOK_ACQUIRED},
		{name = "Book Collection Completed", id = SOUNDS.BOOK_COLLECTION_COMPLETED},
		{name = "Champion Point Committed",  id = SOUNDS.CHAMPION_POINTS_COMMITTED},
		{name = "Champion Point Gained", 	 id = SOUNDS.CHAMPION_POINT_GAINED},
		{name = "Dark Fissure Closed", 		 id = SOUNDS.SKILL_XP_DARK_FISSURE_CLOSED},
		{name = "Duel Start",				 id = SOUNDS.DUEL_START},
		{name = "Emperor Coronated", 		 id = SOUNDS.EMPEROR_CORONATED_ALDMERI},
		{name = "Gate Closed", 				 id = SOUNDS.AVA_GATE_CLOSED},
		{name = "Justice State Changed",	 id = SOUNDS.JUSTICE_STATE_CHANGED},
		{name = "Morph Ability", 			 id = SOUNDS.ABILITY_MORPH_PURCHASED},
		{name = "Objective Complete", 		 id = SOUNDS.OBJECTIVE_COMPLETED},
		{name = "Quest Abandoned", 			 id = SOUNDS.QUEST_ABANDONED},
		{name = "Quest Accepted",			 id = SOUNDS.QUEST_ACCEPTED},
		{name = "Quest Complete", 			 id = SOUNDS.QUEST_COMPLETED},
		{name = "Quickslot Empty", 			 id = SOUNDS.QUICKSLOT_USE_EMPTY},
		{name = "Quickslot Open", 			 id = SOUNDS.QUICKSLOT_OPEN},
		{name = "Remove Guild Member", 		 id = SOUNDS.GUILD_ROSTER_REMOVED},
		{name = "Skill Added", 				 id = SOUNDS.SKILL_LINE_ADDED},
		{name = "Skill Leveled", 			 id = SOUNDS.SKILL_LINE_LEVELED_UP},
		{name = "Stat Purchase", 			 id = SOUNDS.STATS_PURCHASE},
		{name = "Synergy Ready", 			 id = SOUNDS.ABILITY_SYNERGY_READY},
		{name = "TelVar Multiplier Max",	 id = SOUNDS.TELVAR_MULTIPLIERMAX},
	}

	function RaidNotifier:GetSounds()
		return Sounds
	end
	function RaidNotifier:GetSoundName(soundId, category, setting)
		if soundId == nil then
			soundId = self:GetSoundValue(category, setting)
		end
		for _, entry in ipairs(self:GetSounds()) do
			if soundId == entry.id then return entry.name end
		end
		return ""
	end
	function RaidNotifier:GetSoundValue(category, setting)
		return self.Vars.sounds[GetKey(category, setting)] or DEFAULT_SOUND
	end
	function RaidNotifier:SetSoundValue(category, setting, value)
		self.Vars.sounds[GetKey(category, setting)] = value
	end

	function RaidNotifier:GetLastNotify(category, setting)
		local key = GetKey(category, setting)
		return lastNotifyTimes[key] or 0
	end
	function RaidNotifier:SetLastNotify(category, setting, value)
		local key = GetKey(category, setting)
		lastNotifyTimes[key] = value
	end

	local CSA  = CENTER_SCREEN_ANNOUNCE
	local LCSA = LibStub:GetLibrary("LibCSA")

	function RaidNotifier:AddAnnouncement(text, category, setting, interval)

		local duration = 3000
		local soundId = self:GetSoundValue(category, setting)
		if soundId == DEFAULT_SOUND then --
			soundId = self.Vars.general.default_sound
		end

		if not text or text == "" then
			p("Invalid text for '%s -> %s'", category, setting)
			return
		end

		if (interval) then
			local currentTime = GetTimeStamp()
			if (interval > GetDiffBetweenTimeStamps(currentTime, self:GetLastNotify(category, setting))) then
				return
			end
			self:SetLastNotify(category, setting, currentTime)
		end

		if (self.Vars.general.use_center_screen_announce > 0 and not LCSA:HasActiveCountdown()) then
			--CSA:AddMessage(EVENT_BROADCAST, CSA_CATEGORY_SMALL_TEXT, soundId, text, nil, nil, nil, nil, nil, duration)
			local params = CSA:CreateMessageParams(self.Vars.general.use_center_screen_announce, soundId)
			params:SetCSAType(CENTER_SCREEN_ANNOUNCE_TYPE_RAID_TRIAL)
			params:SetText(text)
			params:SetLifespanMS(duration)
			CSA:AddMessageWithParams(params)
			CSA.nextUpdateTimeSeconds = 0
		else
			local pool = RaidNotifier.NotificationsPool.GetInstance()
			pool:Add(text, duration)
			if soundId ~= nil then PlaySound(soundId) end
		end
	end

	-- called when messageParams are applied to the line
	local orgTextScale, orgCountdownScale, orgCountdownColor
	local function SetupCallback(line, messageParams, doReset)
		-- store original instead of hardcoding them (at this point they haven't been modified by us yet)
		if not orgTextScale then
			orgTextScale = line.textControl:GetScale()
		end
		if not orgCountdownScale then
			orgCountdownScale = line.countdownControl:GetScale()
		end
		if not orgCountdownColor then
			orgCountdownColor = {line.countdownControl:GetColor()}
		end
		local settings = RaidNotifier.Vars.countdown
		if doReset then -- we MUST make sure to reset anything that might have been changed by us
			line.textControl:SetScale(orgTextScale)
			line.countdownControl:SetScale(orgCountdownScale)
		else
			line.textControl:SetScale(settings.textScale / 100)
			line.countdownControl:SetScale(settings.timerScale / 100)
		end
		-- always reset this in case countdown was terminated before reaching zero (see below)
		line.countdownControl:SetColor(orgCountdownColor[1], orgCountdownColor[2], orgCountdownColor[3])
	end

	local countdownInProgress = false
	function RaidNotifier:IsCountdownInProgress()
		return countdownInProgress
	end

	local function CountdownCallback(line, countdownS)
		-- set color to orange on 2 and red  on 1 and 0
		local settings = RaidNotifier.Vars.countdown
		if settings.useColor then
			if line.currentCountdownTimeS == 2 then
				line.countdownControl:SetColor(0.9, 0.5, 0, 1)
			elseif line.currentCountdownTimeS == 1 then
				line.countdownControl:SetColor(1, 0, 0, 1)
			elseif line.currentCountdownTimeS < 0 then
				line.countdownControl:SetColor(1, 1, 1, 1)
				countdownInProgress = false
			end
		elseif line.currentCountdownTimeS < 0 then
			countdownInProgress = false
		end
	end

	function RaidNotifier:StartCountdown(timer, text, category, setting, important, interval)
		local soundId = self:GetSoundValue(category, setting)
		if soundId == DEFAULT_SOUND then --
			soundId = self.Vars.general.default_sound
		end

		if not text or text == "" then
			p("Invalid text for '%s -> %s'", category, setting)
			return
		end
		if (interval) then
			local currentTime = GetTimeStamp()
			if (interval > GetDiffBetweenTimeStamps(currentTime, self:GetLastNotify(category, setting))) then
				return
			end
			self:SetLastNotify(category, setting, currentTime)
		end

		important = important and important or important == nil -- default countdown

		local countdownId = 0
		if not self:IsCountdownInProgress() and self.Vars.general.use_center_screen_announce > 0 or important then
			countdownId = LCSA:CreateCountdown(timer, soundId, nil, text, nil, SetupCallback, CountdownCallback)
		else
			local pool = RaidNotifier.NotificationsPool.GetInstance()
			countdownId = pool:Add(text, timer, true)
			if soundId ~= nil then PlaySound(soundId) end
		end
		if countdownId > 0 then
			countdownInProgress = true
		end
		return countdownId
	end

	function RaidNotifier:StopCountdown(countdownIndex)
		LCSA:EndCountdown(countdownIndex)
--		if self.Vars.general.use_center_screen_announce == 0 and not important then
			local pool = RaidNotifier.NotificationsPool.GetInstance()
			pool:Stop(countdownIndex)
--		end
		countdownInProgress = false
	end

end


-- ----------------------
-- -- ULTIMATE EXCHANGE
do ----------------------

	local window = nil

	local LGS = LibStub("LibGroupSocket", true)
	local ultimateHandler = LGS and LGS:GetHandler(LGS.MESSAGE_TYPE_ULTIMATE)
	RNUltimateHandler = ultimateHandler -- debug
	local ultimateAbilityId = 40223  -- Aggressive Warhorn Rank IV
	local ultimateGroupId   = 29     -- hardcoded for now
	local ultimates = {}

	function RaidNotifier.OnUltimateReceived(unitTag, ultimateCurrent, ultimateCost) --, ultimateGroupId, isSelf)
		local self     = RaidNotifier
		local userName = GetUnitDisplayName(unitTag)
		ultimates[userName] =
		{
			userName = userName,
			name     = GetUnitName(unitTag),
			role     = GetGroupMemberSelectedRole(unitTag),
			current  = ultimateCurrent,
			percent  = math.floor((ultimateCurrent / ultimateCost) * 100), --round it down?
		}
		self:UpdateUltimates()
	end

	function RaidNotifier:UpdateUltimates()
		local settings = self.Vars.ultimate
		if settings.hidden or GetGroupSize() == 0 then return end

		local sortedUlti = {}
		for userName, data in pairs(ultimates) do
			if (data.role == LFG_ROLE_DPS and settings.showDps or data.role == LFG_ROLE_HEAL and settings.showHealers or data.role == LFG_ROLE_TANK and settings.showTanks) then
				table.insert(sortedUlti, data)
			end
		end
		table.sort(sortedUlti, function(a, b) return a.percent > b.percent end)

		self:UpdateUltimateWindow(sortedUlti) --ignore mode
	end

	local function ToggleLibGroupSocket(enabled)
		local settings = RaidNotifier.Vars.ultimate
		if settings.enabled then
			local button = ZO_GroupMenu_Keyboard_LibGroupSocketToggle
			if not button then -- wait for button
				zo_callLater(function() ToggleLibGroupSocket(enabled) end, 1000)
			else
				ZO_CheckButton_SetCheckState(button, enabled)
				button:toggleFunction(enabled)
			end
		end
	end

	local listening = false
	function RaidNotifier:RegisterForUltimateChanges()
		local settings = self.Vars.ultimate
		if not settings.enabled then return end

		if not ultimateHandler then return end

		if listening then return end
		listening = true
		dbg("RegisterForUltimateChanges")

		self:SetElementHidden("ultimate", "ulti_window", settings.hidden)

		ultimates = {}
		if ultimateHandler.SetUltimateGroupId then
			ultimateHandler:SetUltimateGroupId(ultimateGroupId)
		end
		ultimateHandler:RegisterForUltimateChanges(self.OnUltimateReceived)
		ultimateHandler:Refresh()
		ToggleLibGroupSocket(true) -- force LibGroupSocket to send data

		local function OnWeaponPairChanged()
			--get dynamic ultimate cost, should work with any cost reduction passives & sets
			if settings.override_cost > 0 then
				ultimateHandler:SetUltimateCost(settings.override_cost)
			else
				ultimateHandler:SetUltimateCost(GetAbilityCost(ultimateAbilityId))
			end
		end
		OnWeaponPairChanged()
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_WEAPON_PAIR_LOCK_CHANGED, OnWeaponPairChanged)

		local function OnGroupUpdate()
			local groupSize = GetGroupSize()
			if (groupSize == 0) then
				self:SetElementHidden("ultimate", "ulti_window", true)
				ToggleLibGroupSocket(false)
			else
				self:SetElementHidden("ultimate", "ulti_window", settings.hidden)
				ToggleLibGroupSocket(true)
			end
			local newMembers = {}
			for i=1, groupSize do
				local userName = GetUnitDisplayName("group"..i)
				if userName and userName ~= "" then
					newMembers[userName] = IsUnitOnline("group"..i)
				end
			end
			for userName, data in pairs(ultimates) do
				if not newMembers[userName] then
					ultimates[userName] = nil
				end
			end
			zo_callLater(function() self:UpdateUltimates() end, 200) -- slight delay
		end
		OnGroupUpdate()
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_GROUP_MEMBER_JOINED, OnGroupUpdate)
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_GROUP_MEMBER_LEFT,   OnGroupUpdate)
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_GROUP_UPDATE,        OnGroupUpdate)
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_GROUP_MEMBER_CONNECTED_STATUS , OnGroupUpdate)

		local function OnRolesChanged(_, unitTag, dps, healer, tank)
			local userName = GetUnitDisplayName(unitTag)
			if ultimates[userName] then
				ultimates[userName].roles = {dps, healer, tank}
			end
			self:UpdateUltimates()
		end
		EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_GROUP_MEMBER_ROLES_CHANGED, OnRolesChanged)
	end

	function RaidNotifier:UnregisterForUltimateChanges()
		if not ultimateHandler then return end

		if not listening then return end
		listening = false
		dbg("UnregisterForUltimateChanges")

		self:SetElementHidden("ultimate", "ulti_window", true)

		ultimateHandler:UnregisterForUltimateChanges(self.OnUltimateReceived)
		ToggleLibGroupSocket(false) -- force LibGroupSocket to send data

		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_WEAPON_PAIR_LOCK_CHANGED)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_GROUP_MEMBER_JOINED)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_GROUP_MEMBER_LEFT)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_GROUP_UPDATE)
		--EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_UNIT_FRAME_UPDATE)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_GROUP_MEMBER_CONNECTED_STATUS)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_GROUP_MEMBER_ROLES_CHANGED)
	end

	function RaidNotifier:ToggleUltimateExchange()
		--local settings = self.Vars.ultimate
		if listening then
			p("Disable Ultimate Exchange")
			self:UnregisterForUltimateChanges()
		else
			p("Enable Ultimate Exchange")
			self:RegisterForUltimateChanges()
		end
		self:UpdateUltimates()
	end

	SLASH_COMMANDS["/rnulti"] = function(str)
		local args = {zo_strsplit(" ", str)}

		local self     = RaidNotifier
		local settings = self.Vars.ultimate
		if (args == nil or #args == 0) then
			settings.hidden = not settings.hidden
			p("%s Ultimate Exchange", settings.hidden and "Hide" or "Show")
		elseif (args[1] == "show") then
			p("Show Ultimate Exchange")
			settings.hidden = false
		elseif (args[1] == "hide") then
			p("Hide Ultimate Exchange")
			settings.hidden = true
		elseif (args[1] == "enable" or args[1] == "on" or args[1] =="1") then
			p("Enable Ultimate Exchange")
			settings.enabled = true
			settings.hidden = false
			self:RegisterForUltimateChanges()
			self:UpdateUltimates()
		elseif (args[1] == "disable" or args[1] == "off" or args[1] == "0") then
			p("Disable Ultimate Exchange")
			settings.enabled = false
			self:UnregisterForUltimateChanges()
		elseif (args[1] == "refresh") then
			ultimates = {}
			if ultimateHandler then
				ultimateHandler:Refresh()
			end
		elseif (args[1] == "debug") then
			if ultimateHandler then
				ultimateHandler:SetDebug(tonumber(args[2]))
			end
		elseif (args[1] == "clear") then
			if ultimateHandler then
				ultimateHandler:ResetResources()
			end
		elseif (args[1] == "cost") then
			if (#args == 2) then
				if (tonumber(args[2]) ~= nil) then
					settings.override_cost = tonumber(args[2])
				elseif (args[2] == "auto") then -- maybe use GetSlotBoundId to grab slotted ability instead?
					settings.override_cost = GetSlotAbilityCost(ACTION_BAR_ULTIMATE_SLOT_INDEX + 1)
				else
					p("Trying to set override cost to unsupported value (%s)", args[2])
					return
				end
				-- cost will be sent to others on next bar swap
				if (settings.override_cost > 0) then
					p("Enabled ultimate cost is now " .. settings.override_cost)
				else
					p("Disabled ultimate cost override")
				end
			end
		else
			p("Unknown subcommand (%s)", args[1])
		end
	end

end


-- ----------------------
-- -- INITIALIZE EVENTS
do ----------------------

	local Utils  = RaidNotifier.Utils

	local function ToggleVanityPets(disable)
		local settings = RaidNotifier.Vars.general
		if settings.vanity_pets then
			if disable then
				settings.last_pet = GetActiveCollectibleByType(COLLECTIBLE_CATEGORY_TYPE_VANITY_PET)
				if settings.last_pet > 0 then
					UseCollectible(settings.last_pet)
				end
			elseif (settings.last_pet and settings.last_pet > 0) then
				UseCollectible(settings.last_pet)
				settings.last_pet = 0
			end
		end
	end

	local blackList = {
		[43752] = true, -- Soul Summons / Seelenbeschwörung
		[21263] = true, -- Ayleid Health Bonus
		[92232] = true, -- Pelinals Wildheit
		[64210] = true, -- erhöhter Erfahrungsgewinn
		[66776] = true, -- erhöhter Erfahrungsgewinn
		[77123] = true, -- Jubiläums-Erfahrungsbonus 2017
		[85501] = true, -- erhöhter Erfahrungsgewinn
		[85502] = true, -- erhöhter Erfahrungsgewinn
		[85503] = true, -- erhöhter Erfahrungsgewinn
		[86755] = true, -- Feiertags-Erfahrungsbonus
		[88445] = true, -- erhöhter Erfahrungsgewinn
		[89683] = true, -- erhöhter Erfahrungsgewinn
		[91369] = true, -- erhöhter Erfahrungsgewinn der Narrenpastete
	}

	local function GetActiveFoodBuff(abilityId)
		if blackList[abilityId] ~= nil then
			return false
		end
		if DoesAbilityExist(abilityId) then
			if GetAbilityTargetDescription(abilityId) ~= GetString(SI_TARGETTYPE2)
			or GetAbilityEffectDescription(abilityId) ~= ""
			or GetAbilityRadius(abilityId) > 0
			or GetAbilityAngleDistance(abilityId) > 0
			or GetAbilityDuration(abilityId) < 600000 then
				return false
			end
			local cost = GetAbilityCost(abilityId)
			local channeled, castTime = GetAbilityCastInfo(abilityId)
			local minRangeCM, maxRangeCM = GetAbilityRange(abilityId)
			if cost > 0 or channeled or castTime > 0 or minRangeCM > 0 or maxRangeCM > 0 or GetAbilityDescription(abilityId) == "" then
				return false
			end
			return true
		end
	end

	local function CheckFoodBuffs()
		local self = RaidNotifier
		local settings = self.Vars.general
		if not settings.buffFood_reminder then return end

		local buffFoodFound = false
		local numBuffs = GetNumBuffs("player")
		if numBuffs > 0 then
			for i = 1, numBuffs do
				local name, _, finish, _, _, _, _, _, _, _, abilityId, canClickOff = GetUnitBuffInfo("player", i)
				if GetActiveFoodBuff(abilityId) and canClickOff then
					buffFoodFound = true
					local bufffood_remaining = finish - (GetGameTimeMilliseconds() / 1000)
					local formatedTime       = ZO_FormatTime(bufffood_remaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_SECONDS)

					-- new set interval
					if bufffood_remaining <= 600 then
						self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_GENERAL_BUFFFOOD_MINUTES), name, formatedTime), "general", "buffFood_reminder", settings.buffFood_reminder_interval)
					end
				end
			end
		end
		-- no bufffood found, alert every interval
		if buffFoodFound == false then
			self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_GENERAL_NO_BUFFFOOD), "general", "buffFood_reminder", settings.buffFood_reminder_interval)
		end
	end

	-- These should remain the same throughout updates
	local RaidZoneIds =
	{
		[RAID_HEL_RA_CITADEL]        = 636,
		[RAID_AETHERIAN_ARCHIVE]     = 638,
		[RAID_SANCTUM_OPHIDIA]       = 639,
		[RAID_DRAGONSTAR_ARENA]      = 635,
		[RAID_MAW_OF_LORKHAJ]        = 725,
		[RAID_MAELSTROM_ARENA]       = 677,
		[RAID_HALLS_OF_FABRICATION]  = 975,
		[RAID_ASYLUM_SANCTORIUM]     = 1000,
		[RAID_CLOUDREST]             = 1051,
		[RAID_BLACKROSE_PRISON]      = 1082,
		[RAID_SUNSPIRE]              = 1121,
		[RAID_KYNES_AEGIS]           = 1196,
		[RAID_ROCKGROVE]             = 1263,
		[RAID_DREADSAIL_REEF]        = 1344,
	}

	local RaidZones = {}
	for raidId, zoneId in pairs(RaidZoneIds) do
		RaidZones[GetZoneNameById(zoneId)] = raidId
	end
	local function GetRaidZoneName(raidId)
		return GetZoneNameById(RaidZoneIds[raidId])
	end
	function RaidNotifier:GetRaidIdFromCurrentZone()
		return self.raidZoneId or 0
	end
	function RaidNotifier:IsInRaidZone()
		return self:GetRaidIdFromCurrentZone() > 0
	end
	function RaidNotifier:GetRaidDescription(raidId)
		return GetZoneDescriptionById(RaidZoneIds[raidId])
	end

	local eventIndex = 0
	local eventName = RaidNotifier.Name .. "_CombatEvent"
	function RaidNotifier:RegisterForCombatEvent(handler, filterType, filterData)
		eventIndex = eventIndex + 1
		EVENT_MANAGER:RegisterForEvent(eventName..eventIndex, EVENT_COMBAT_EVENT, handler)
		if filterType and filterData then
			EVENT_MANAGER:AddFilterForEvent(eventName..eventIndex, EVENT_COMBAT_EVENT, filterType, filterData)
		end
	end
	function RaidNotifier:UnregisterForCombatEvent(index)
		EVENT_MANAGER:UnregisterForEvent(eventName..index, EVENT_COMBAT_EVENT)
	end
	function RaidNotifier:UnregisterAllCombatEvents()
		for i=1, eventIndex do
			self:UnregisterForCombatEvent(i)
		end
		eventIndex = 0
	end

	local listening = false
	function RaidNotifier:RegisterEvents(raidId)
		if listening then return end

		self.raidId = raidId or self:GetRaidIdFromCurrentZone()
		self.raidDifficulty = GetCurrentZoneDungeonDifficulty()
		if (self.raidId > 0) then
			dbg("Register for %s (%s)", GetRaidZoneName(self.raidId), GetString("SI_DUNGEONDIFFICULTY", self.raidDifficulty))

			local trial = self.Trial[self.raidId]
			local combatStateChangedCallback

			if (trial) then
				trial.Initialize()
				local combatEventCallback = trial.OnCombatEvent
				local bossesChangedCallback = trial.OnBossesChanged
				local effectChangedCallback = trial.OnEffectChanged
				combatStateChangedCallback = trial.OnCombatStateChanged

				local abilityList = {}
				local function RegisterForAbility(abId)
					if not abilityList[abId] then
						abilityList[abId] = true
						self:RegisterForCombatEvent(combatEventCallback, REGISTER_FILTER_ABILITY_ID, abId)
					end
				end

				-- The main juicy events we want, registered seperately for better performance
				-- TODO: Remove (some of) this debugging when releasing it
				-- TODO: Also add filter for action result but will require re-organizing BuffsDebuffs.lua
				dbg("----------------------------------------------")
				dbg(" Gathering Abilities for Raid")
				local raidData = self.BuffsDebuffs[self.raidId]
				for k,v in pairs(raidData) do
					if type(v) == "number" then
						if v > 10000 then
							dbg("Found ability #%d (%s)", v, k)
							RegisterForAbility(v)
						else
							dbg("Ignoring %s (%s)", tostring(v), k)
						end
					elseif type(v) == "table" then
						for l,w in pairs(v) do
							if type(l) == "number" and l > 10000 then
								dbg("Found ability #%d (%s)", l, k)
								RegisterForAbility(l)
							else
								dbg("Ignoring %s (%s)", l, k)
							end
						end
					else
						dbg("Ignoring %s (%s)", tostring(v), k)
					end
				end
				dbg("----------------------------------------------")

				if (effectChangedCallback) then
					EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_EFFECT_CHANGED, effectChangedCallback)

					-- Better to introduce more flexible way of filtering EVENT_EFFECT_CHANGED, but let's start with this
					if (self.raidId == RAID_HALLS_OF_FABRICATION) then
						EVENT_MANAGER:AddFilterForEvent(self.Name, EVENT_EFFECT_CHANGED, REGISTER_FILTER_UNIT_TAG, "player")
					end
					if (self.raidId == RAID_MAW_OF_LORKHAJ) then
						EVENT_MANAGER:AddFilterForEvent(self.Name, EVENT_EFFECT_CHANGED, REGISTER_FILTER_ABILITY_ID, self.BuffsDebuffs[RAID_MAW_OF_LORKHAJ].rakkhat_hulk_armorweakened)
					end
					if (self.raidId == RAID_ROCKGROVE) then
						EVENT_MANAGER:AddFilterForEvent(self.Name, EVENT_EFFECT_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, "group")
					end
				end
				if (bossesChangedCallback) then
					EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_BOSSES_CHANGED, bossesChangedCallback)
				end

				-- In case of initializing while already at a boss
				if (bossesChangedCallback) then
					bossesChangedCallback()
				end
			end

			local function OnCombatStateChanged(_, inCombat)
				local settings = self.Vars.general
				if (inCombat) then
					if (combatStateChangedCallback) then
						dbg("InCombat")
						combatStateChangedCallback(inCombat)
					end
					if (settings.no_assistants and GetActiveCollectibleByType(COLLECTIBLE_CATEGORY_TYPE_ASSISTANT) > 0) then
						UseCollectible(GetActiveCollectibleByType(COLLECTIBLE_CATEGORY_TYPE_ASSISTANT))
					end
				else
					if (combatStateChangedCallback) then
						zo_callLater(function()
							if (not IsUnitInCombat("player")) then
								dbg("not InCombat")
								combatStateChangedCallback(inCombat)
							end
						end, 3000);
					end
				end
			end

			EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_PLAYER_COMBAT_STATE, OnCombatStateChanged)

			--self:AddFragment()
			listening = true

			-- Ultimate exchanging
			self:RegisterForUltimateChanges()

			-- Food buffs
			EVENT_MANAGER:RegisterForUpdate(self.Name .. "Food", 2000, CheckFoodBuffs)

			-- Disable pets if that setting is set
			ToggleVanityPets(true)
		end
	end

	function RaidNotifier:UnregisterEvents()
		if not listening then return end

		dbg("Unregister for %s (%s)", GetRaidZoneName(self.raidId), GetString("SI_DUNGEONDIFFICULTY", self.raidDifficulty))
		self:UnregisterAllCombatEvents()
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_EFFECT_CHANGED)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_BOSSES_CHANGED)
		EVENT_MANAGER:UnregisterForEvent(self.Name, EVENT_PLAYER_COMBAT_STATE)

		local trial = self.Trial[self.raidId]

		-- Remove custom handlers which may have been assigned inside the trial "class"
		if trial and type(trial.Shutdown) == "function" then
			trial.Shutdown()
		end

		--self:RemoveFragment()
		self:HideAllElements()
		listening = false
		self.raidId = 0
		self.raidDifficulty = 0

		-- Ultimate exchanging
		self:UnregisterForUltimateChanges()

		-- Food buffs
		EVENT_MANAGER:UnregisterForUpdate(self.Name .. "Food")

		-- Re-enable pets
		ToggleVanityPets(false)
	end

	function RaidNotifier:Initialize()
		self.Vars = ZO_SavedVars:NewAccountWide(self.SV_Name, self.SV_Version, nil, self:GetDefaults())
		if (not self.Vars.useAccountWide) then -- not using global settings, generate (or load) character specific settings
			self.Vars = ZO_SavedVars:New(self.SV_Name, self.SV_Version, nil, self:GetDefaults())
		end

		-- tiny functions
		p = function(msg, ...)
			d("[RaidNotifier] "..msg:format(...))
		end
		self.p = p
		dbg = function(msg, ...)
			if self.Vars.dbg.enabled then
				p(msg, ...)
			end
			if ENABLE_DEBUG_LOG then
				dlog(msg, ...)
			end
		end
		self.dbg = dbg

		if ENABLE_DEBUG_LOG then
			if not RN_DEBUG_LOG then
				RN_DEBUG_LOG = {}
			end
			table.insert(RN_DEBUG_LOG, {})
			local curLog = RN_DEBUG_LOG[#RN_DEBUG_LOG]
			dlog = function(msg, ...)
				local time = string.format("%s:%03d ", GetTimeString(), GetGameTimeMilliseconds() % 1000)
				table.insert(curLog, string.format("%s -> %s", time, msg:format(...)))
			end
		else
			dlog = dbg
			RN_DEBUG_LOG = nil
		end

		self:CreateSettingsMenu()

		L = self:GetLocale()

		-- Init debug
		self:ToggleDebugTracker(self.Vars.dbg.tracker or self.Vars.dbg.units)

		-- UI Elements
		self:InitializeUltimateWindow("UltimateWindow")
		self:InitializeStatusDisplay("StatusDisplay")
		self:InitializeGlyphWindow("GlyphWindow", self.Vars.mawLorkhaj.zhaj_glyphs_invert)
		self:InitializeArrowDisplay("ArrowDisplay")
		self.AnnouncementUIManager:Initialize(RaidNotifierUICenterAnnounce)
		RaidNotifier.NotificationsPool.GetInstance():SetScale(self.Vars.general.notifications_scale / 100);
		RaidNotifier.NotificationsPool.GetInstance():SetPrecise(self.Vars.countdown.timerPrecise)

		-- Bindings
		ZO_CreateStringId("SI_BINDING_NAME_RAIDNOTIFIER_TOGGLE_ULTI", L.Binding_ToggleUltimateExchange)

		-- Always add fragment now
		self:AddFragment()

		-- These aren't needed anymore since we now start & stop Raid Notifier solely based on being in the raid zone
	    --EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_RAID_TRIAL_STARTED,  function(...) self:RegisterEvents() end)
		--EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_RAID_TRIAL_COMPLETE, function(...) self:UnregisterEvents() end)
		self.raidId = 0
		self.raidDifficulty = 0
		-- Monitor zone changes to account for teleporting out of a trial, also for teleporting back in
		local function OnZoneChanged()
			-- Not using GetMapName() because that changes while looking at the map
			self.raidZoneId = RaidZones[GetUnitZone("player")]

			if self:IsInRaidZone() then
				if self.raidId ~= self:GetRaidIdFromCurrentZone() then
					if self.raidId > 0 then
						self:UnregisterEvents()
					end
					self:RegisterEvents()
				end
			elseif self.raidId > 0 then
				self:UnregisterEvents()
			end
		end
		OnZoneChanged()
		--EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_ZONE_CHANGED, OnZoneChanged) -- Doesn't fire after zoning and not always when subzoning
		--EVENT_MANAGER:RegisterForEvent(self.Name, EVENT_CURRENT_SUBZONE_LIST_CHANGED, OnZoneChanged) -- Better than above but still not perfect
		CALLBACK_MANAGER:RegisterCallback("OnWorldMapChanged", OnZoneChanged) -- might as well listen to this since that code is executed anyways

		-- Change vitality bonus announcement to not conflict with our own
		local LCSA = LibStub:GetLibrary("LibCSA")
		LCSA:HookHandler(EVENT_RAID_REVIVE_COUNTER_UPDATE, function(messageParams, currentCount, countDelta)
			if messageParams then
				messageParams:SetCategory(CSA_CATEGORY_SMALL_TEXT)
			end
			return messageParams
		end)

	end

end

do
	local bossCount, bossAlive, bossFull
	function RaidNotifier:GetNumBosses(fresh)
		if (not bossCount or fresh) then
			bossCount = 0
			bossAlive = 0
			bossFull = 0

			local health, maxHealth
			for i = 1, MAX_BOSSES do
				if DoesUnitExist("boss"..i) then
					bossCount = bossCount + 1
					health, maxHealth = GetUnitPower("boss"..i, POWERTYPE_HEALTH)
					if health > 0 then
						bossAlive = bossAlive + 1
						if health >= maxHealth then
							bossFull = bossFull + 1
						end
					end
				end
			end
		end
		return bossCount, bossAlive, bossFull
	end
end

do ---------------------------

	local LUNIT = LibUnits2
	local Util  = RaidNotifier.Util

	function RaidNotifier.UnitIdToString(id)
		local name = RaidNotifier.Vars.general.useDisplayName and LUNIT.GetDisplayNameForUnitId(id) or LUNIT.GetNameForUnitId(id)
		if name == "" then
			name = "#"..id
		end
		return name
	end

	function RaidNotifier.UnitToTag(id)
		return LUNIT.GetUnitTagForUnitId(id)
	end

	RaidNotifier.AA = RaidNotifier.AA or {}
	RaidNotifier.HRC = RaidNotifier.HRC or {}
	RaidNotifier.SO = RaidNotifier.SO or {}
	RaidNotifier.DSA = RaidNotifier.DSA or {}
	RaidNotifier.MOL = RaidNotifier.MOL or {}
	RaidNotifier.MA = RaidNotifier.MA or {}
	RaidNotifier.HOF = RaidNotifier.HOF or {}
	RaidNotifier.AS = RaidNotifier.AS or {}
	RaidNotifier.CR = RaidNotifier.CR or {}
	RaidNotifier.SS = RaidNotifier.SS or {}
	RaidNotifier.KA = RaidNotifier.KA or {}
	RaidNotifier.RG = RaidNotifier.RG or {}
	RaidNotifier.DSR = RaidNotifier.DSR or {}

	RaidNotifier.Trial =
	{
		[RAID_AETHERIAN_ARCHIVE]     = RaidNotifier.AA,
		[RAID_HEL_RA_CITADEL]        = RaidNotifier.HRC,
		[RAID_SANCTUM_OPHIDIA]       = RaidNotifier.SO,
		[RAID_DRAGONSTAR_ARENA]      = RaidNotifier.DSA,
		[RAID_MAW_OF_LORKHAJ]        = RaidNotifier.MOL,
		[RAID_MAELSTROM_ARENA]       = RaidNotifier.MA,
		[RAID_HALLS_OF_FABRICATION]  = RaidNotifier.HOF,
		[RAID_ASYLUM_SANCTORIUM]     = RaidNotifier.AS,
		[RAID_CLOUDREST]             = RaidNotifier.CR,
		[RAID_SUNSPIRE]	             = RaidNotifier.SS,
		[RAID_KYNES_AEGIS]           = RaidNotifier.KA,
		[RAID_ROCKGROVE]             = RaidNotifier.RG,
		[RAID_DREADSAIL_REEF]        = RaidNotifier.DSR,
	}

	-------------------
	---- Debugging ----
	-------------------
	local debugList    = {}
	for _, result in ipairs(RaidNotifier.ActionResults) do
		debugList[result] = {}
	end
	local debugMsg = "[%d] %s (%d)%s%s => %d"

	local trackedUnits = {}
	local trackedAbilities = {}

	local function OnCombatDebugEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)

		local self   = RaidNotifier

--		if abilityId < 80000 then
--			return
		if sType == COMBAT_UNIT_TYPE_PLAYER then
			return
		elseif self.blacklist and self.blacklist[abilityId] then
			return
		end

		if self.Vars.dbg.units then
			local function CheckUnit(id, name, type)
				if id > 0 and not trackedUnits[id] then
					trackedUnits[id] = true
					local count = trackedAbilities[abilityId] or 0
					if count < 10 then -- only report first few units from the same ability
						if LUNIT.GetNameForUnitId(id) == "" then -- not a known unit like group members or bosses
							trackedAbilities[abilityId] = (trackedAbilities[abilityId] or 0) + 1
							df("Found new unit #%d, %s (%d, %s)", id, tName, abilityId, GetAbilityName(abilityId))
						end
					end
				end
			end
			CheckUnit(tUnitId, tName, tType)
		end

		--self.Vars.dbg.blacklist = self.Vars.dbg.blacklist or {}
		--self.Vars.dbg.blacklist[abilityId] = true

		--if (self.Vars.dbg.tracker and debugList[result] ~= nil) then
		debugList[result] = debugList[result] or {}
		if (self.Vars.dbg.tracker) then
			local function FormatUnit(prefix, uType, uName, uId)
				if uId == 0 then
					return ""
				else
					uName = uName ~= "" and uName or LUNIT.GetNameForUnitId(uId)
					if uName ~= "" then
						return zo_strformat("<<1>><<t:2>>", prefix, uName)
					else
						return zo_strformat("<<1>><<2>>/<<3>>", prefix, uType, uId)
					end
				end
			end

			if (not debugList[result][abilityId]) or (not self.Vars.dbg.spamControl) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER and (sType == COMBAT_UNIT_TYPE_OTHER or sType == COMBAT_UNIT_TYPE_NONE) or (not self.Vars.dbg.myEnemyOnly)) then
					local source = FormatUnit(", [S] ", sType, sName, sUnitId)
					local target = FormatUnit(", [T] ", tType, tName, tUnitId)
					local ability = (aName ~= "" and aName ~= nil) and aName or GetAbilityName(abilityId)

					debugList[result][abilityId] = self.Vars.dbg.spamControl
					dlog(debugMsg, result, ability, abilityId, source, target, hitValue)
				end
			end
		end
	end

	local debugEventName = RaidNotifier.Name .. "_CombatEventDebug"
	function RaidNotifier:ToggleDebugTracker(enabled)
		EVENT_MANAGER:UnregisterForEvent(debugEventName, EVENT_COMBAT_EVENT)
		if enabled then
			EVENT_MANAGER:RegisterForEvent(debugEventName, EVENT_COMBAT_EVENT, OnCombatDebugEvent)
		end
	end

	function RaidNotifier:InvokeNotificationsDebug(mainCountdownDuration, addMoreCountdowns)
		if (addMoreCountdowns) then
			self:StartCountdown(mainCountdownDuration, GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_TAKING_AIM_SIMPLE), "hallsFab", "taking_aim", not self:IsCountdownInProgress())
		end
		self:StartCountdown(mainCountdownDuration, GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_TAKING_AIM_SIMPLE), "hallsFab", "taking_aim", false)
		self:AddAnnouncement("Next Notification", "cloudrest", "olorime_spears2")
		zo_callLater(function()
			self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_CHILLING_COMET), "cloudrest", "chilling_comet")
			zo_callLater(function()
				if (addMoreCountdowns) then
					self:StartCountdown(6000, "Test countdown", "hallsFab", "test", false)
				else
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_OLORIME_SPEARS), 1), "cloudrest", "olorime_spears")
				end
				zo_callLater(function()
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_CLOUDREST_TENTACLE_SPAWN), "cloudrest", "tentacle_spawn")
					zo_callLater(function()
						self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_HALLSFAB_POWER_LEECH), "hallsFab", "power_leech")
					end, 1500)
				end, 500)
			end, 500)
		end, 1000)
	end

	-- Fast debug toggle
	SLASH_COMMANDS["/rndebug"] = function(str)
		local args = {zo_strsplit(" ", str)}

		local self     = RaidNotifier
		local settings = self.Vars.dbg

		if (args[1] == "track") then
			settings.tracker = Util.GetArgValue(args[2], settings.tracker)
			p("%s Debug Tracker", settings.tracker and "Enabled" or "Disabled")
			self:ToggleDebugTracker(settings.tracker or settings.units)
		elseif (args[1] == "units") then
			settings.units = Util.GetArgValue(args[2], settings.units)
			p("%s Debug Units", settings.units and "Enabled" or "Disabled")
			self:ToggleDebugTracker(settings.units or settings.tracker)
		elseif (args[1] == "spam") then
			settings.spamControl = Util.GetArgValue(args[2], settings.spamControl)
			p("%s Spam Control", settings.spamControl and "Enabled" or "Disabled")
		elseif (args[1] == "arrow") then
			p("Arrow test")
			local masterList = GROUP_LIST_MANAGER:GetMasterList()
			if (#masterList == 0) then
				p("Group is empty")
			else
				self:TrackPlayer(masterList[1].unitTag, 20000)
			end
		elseif (args[1] == "notifications") then
			self:InvokeNotificationsDebug(8500, args[2] ~= nil)
		elseif (args[1] == "enemy") then
			settings.myEnemyOnly = Util.GetArgValue(args[2], settings.myEnemyOnly)
			p("%s My Enemy Only", settings.myEnemyOnly and "Enabled" or "Disabled")
		elseif (args[1] == "clear") then
			local result = tonumber(args[2])
			if result ~= nil then
				p("Clearing debug list [%d]", result)
				debugList[result] = {}
			else
				p("Clearing all debug lists")
				for _, result in ipairs(debugResults) do
					debugList[result] = {}
				end
			end
		elseif (Util.GetArgValue(args[1]) ~= nil) then
			settings.enabled = Util.GetArgValue(args[1], settings.enabled)
			p("%s Debugging", settings.enabled and "Enabled" or "Disabled")
		end
	end

end

-- ----------------------------
-- EVENT: EVENT_ADD_ON_LOADED
-- ----------------------------
local function OnAddonLoaded(_, addonName)
	if addonName ~= RaidNotifier.Name then return end
	EVENT_MANAGER:UnregisterForEvent(RaidNotifier.Name, EVENT_ADD_ON_LOADED)
	RaidNotifier:Initialize()
end
EVENT_MANAGER:RegisterForEvent(RaidNotifier.Name, EVENT_ADD_ON_LOADED, OnAddonLoaded)
