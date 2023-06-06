local RaidNotifier = RaidNotifier
local Util = RaidNotifier.Util
local NotificationsPool = RaidNotifier.NotificationsPool

local tinsert	 			= table.insert
local tremove				= table.remove
local tsort				= table.sort

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
RAID_SUNSPIRE				= 11
RAID_KYNES_AEGIS			= 12
RAID_ROCKGROVE              = 13
RAID_DREADSAIL_REEF         = 14

-- ------------------
-- DEFAULT SETTINGS
do ------------------

	-- local DEFAULT_SOUND = "Default_Sound" -- will remain as the actual value
	-- local DEFAULT_PRIORITY = 3
	-- local ALL_ROLES =
	-- {
		-- [1] = true, -- Damage
		-- [2] = true, -- Healer
		-- [3] = true, -- Tank
	-- }

	-- local defaults =
	-- {
		-- useAccountWide = true, --very special setting!!

		-- general =
		-- { -- no need for advanced settings
			-- buffFood_reminder           = true,
			-- buffFood_reminder_interval  = 60,
			-- use_center_screen_announce  = true,
			-- vanity_pets                 = true,
			-- no_assistants               = true,
			-- last_pet                    = 0,
			-- default_sound               = SOUNDS.CHAMPION_POINTS_COMMITTED,
		-- },
		-- ultimate =
		-- { -- no need for advanced settings
			-- enabled                     = false,
			-- hidden                      = false,
			-- useColor                    = true,
			-- useDisplayName              = false,
			-- showHealers                 = true,
			-- showTanks                   = true,
			-- showDps                     = false,
			-- ulti_window                 = {100, 600},
			-- override_cost               = 0,
		-- },

		-- helra =
		-- {
			-- warrior_stoneform           = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
		-- },
		-- archive =
		-- {
			-- stormatro_impendingstorm    = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- stormatro_lightningstorm    = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- stoneatro_boulderstorm      = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- stoneatro_bigquake          = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- overcharge                  = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- call_lightning              = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
		-- },
		-- sanctumOphidia =
		-- {
			-- magicka_deto                = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- serpent_poison              = {value = 1, --[[Normal]]     sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- serpent_world_shaper        = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- mantikora_quake             = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- troll_boulder               = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- troll_poison                = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- overcharge                  = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- call_lightning              = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
		-- },
		-- dragonstar =
		-- {
			-- general_taking_aim          = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- general_crystal_blast       = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- arena2_crushing_shock       = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- arena6_drain_resource       = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- arena7_unstable_core        = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- arena8_ice_charge           = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- arena8_fire_charge          = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
		-- },
		-- mawLorkhaj =
		-- {
			-- twinBoss_aspects            = {value = 2, --[[Normal]]     sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- rakkhat_unstablevoid        = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- rakkhat_threshingwings      = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- rakkhat_darknessfalls       = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- rakkhat_darkbarrage         = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- rakkhat_lunarbastion1       = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- rakkhat_lunarbastion2       = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- suneater_eclipse            = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- zhaj_gripoflorkhaj          = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- zhaj_glyphs                 = {value = 1, --[[Normal]]     position = {100, 400}},
		-- },
		-- maelstrom =
		-- {
			-- stage7_poison               = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- stage9_synergy              = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
		-- },
		-- hallsFab =
		-- {
			-- conduit_strike              = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- taking_aim                  = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- draining_ballista           = {value = 1, --[[Self]]       sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- power_leech                 = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- pinnacleBoss_conduit_spawn  = {value = true,               sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- pinnacleBoss_conduit_drain  = {value = 0, --[[Off]]        sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY,    roles = ALL_ROLES},
			-- pinnacleBoss_scalded        = {value = true,               position = {100, 400}},
			-- committee_auras             = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- committee_auras_dynamic     = {value = false,              }, -- TODO: combine with "committee_auras" as dropdown once fully tested
			-- committee_fabricant_spawn   = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
			-- committee_reclaim_achieve   = {value = false,              sound = DEFAULT_SOUND,    priority = DEFAULT_PRIORITY},
		-- },

		-- dbg =
		-- { -- no need for advanced settings
			-- enable                      = false,
			-- notify                      = false,
			-- tracker                     = false,
			-- spamControl                 = true,
			-- verbose                     = false,
			-- myEnemyOnly                 = false,
			-- devMode                     = false,
		-- },
	-- }

	local defaults = {
		dLog = {},
		useAccountWide = true,
		general = {
			buffFood_reminder = true,
			buffFood_reminder_interval = 60,
			use_center_screen_announce = CSA_CATEGORY_SMALL_TEXT,
			notifications_scale = 100,
			vanity_pets = true,
			no_assistants = true,
			useDisplayName = false,
			last_pet = 0,
			status_display  = {100, 400, CENTER},
			unlock_status_icon = false,
			default_sound   = SOUNDS.CHAMPION_POINTS_COMMITTED,
			announcement_position = {0, -120, CENTER},
		},
		ultimate = {
			enabled         = false,
			hidden          = false,
			useColor        = true,
			useDisplayName  = false,
			showHealers     = true,
			showTanks       = true,
			showDps         = false,
			ulti_window     = {100, 600},
			override_cost   = 0,
		},
		countdown = {
			timerScale      = 100,
			textScale       = 100,
			timerPrecise	= 10, -- 1sec
			useColor        = false,
		},
		sounds = {
		},
		helra = {
			yokeda_meteor     = 1, -- "Self"
			warrior_stoneform = 1, -- "Self"
		},
		archive = {
			stormatro_impendingstorm = false,
			stormatro_lightningstorm = false,
			stoneatro_boulderstorm = false,
			stoneatro_bigquake     = false,
			overcharge        = 0, --"Off"
			call_lightning    = 1, --"Self"
		},
		sanctumOphidia = {
			magicka_deto          = true,
			serpent_poison        = 1, --"Normal"
			serpent_world_shaper  = true,
			--mantikora_spear   = 1, --"Self"
			mantikora_quake   = false,
			troll_boulder     = 0, --"Off"
			troll_poison      = 0, --"Off"
			overcharge        = 0, --"Off"
			call_lightning    = 1, --"Self"
		},
		dragonstar = {
			general_taking_aim     = false,
			general_crystal_blast  = true,
			arena2_crushing_shock  = true,
			arena6_drain_resource  = 1, --"Self"
			arena7_unstable_core   = true,
			arena8_ice_charge      = 1, --"Self"
			arena8_fire_charge     = 1, --"Self"
		},
		mawLorkhaj = {
			twinBoss_aspects = 2,     -- "Normal"
			twinBoss_aspects_status = false,
			rakkhat_unstablevoid = 1, -- "Self"
			rakkhat_unstablevoid_countdown = false,
			rakkhat_threshingwings = true,
			rakkhat_darknessfalls = false,
			rakkhat_darkbarrage = false,
			rakkhat_lunarbastion1 = 0, -- "Off"
			rakkhat_lunarbastion2 = 0, -- "Off"
			hulk_armorweakened = false,
			suneater_eclipse = 1, -- "Self"
			shattering_strike = 0, -- "Off"
			zhaj_gripoflorkhaj = true,
			zhaj_glyphs = false,
			zhaj_glyph_window = {100, 400},
			zhaj_glyphs_invert = false,
		},
		maelstrom = {
			stage7_poison  = true,
			stage9_synergy = true,
		},
		hallsFab = {
			conduit_strike        = true,
			taking_aim            = 1, -- "Self"
			taking_aim_dynamic    = 1, -- "Normal"
			taking_aim_duration   = 5000,
			draining_ballista     = 1, -- "Self"
			power_leech           = false,
			venom_injection       = false,

			pinnacleBoss_conduit_spawn   = true,
			pinnacleBoss_conduit_drain   = 0, -- "Off"
			pinnacleBoss_scalded         = true,
			pinnacleBoss_scalded_display = {100, 400},

			committee_overpower_auras = false,
			committee_overpower_auras_dynamic = false,
			committee_overpower_auras_duration = 9000,
			committee_fabricant_spawn = false,
			committee_reclaim_achieve = false,
		},
		asylum = {
			llothis_defiling_blast = 1, -- "Self"
			llothis_soul_stained_corruption = false,
			felms_teleport_strike = 1, -- "Self"
			olms_gusts_of_steam = true,
			olms_storm_the_heavens = true,
			olms_exhaustive_charges = false,
			olms_protector_spawn = true,
			olms_trial_by_fire = true,
			olms_gusts_of_steam_slider = 0,
		},
		cloudrest = {
			olorime_spears = false,
			sum_shadow_beads = false,
			shadow_realm_cast = false,
			malicious_strike = false,
			hoarfrost = 0, -- "Off"
			hoarfrost_shed = true,
			hoarfrost_countdown = true,
			heavy_attack = 0, -- "Off"
			chilling_comet = true,
			baneful_barb = 0, -- "Off"
			roaring_flare = 2, -- "Full"
			track_roaring_flare = false,
			voltaic_overload = 1, -- "Self"
			voltaic_overload_time = 10000, -- "Self"
			nocturnals_favor = 0, -- "Off"
			crushing_darkness = 1, -- "Self"
			tentacle_spawn = false,
			break_amulet = false,
			shadow_splash = false,
		},
		sunspire = {
			chilling_comet = 1, -- "Self"
			breath = 1, -- "Self"
			frozen_tomb = true,
			focus_fire = 1, -- "Self"
			cataclism = true,
			molten_meteor = 1, -- "Self"
			sweeping_breath = true,
			thrash = true,
			mark_for_death = 0, -- "Self"
			time_breach = false,
			negate_field = 1, -- "Self"
			shock_bolt = true,
		},
		kynesAegis = {
			tidebreaker_crashing_wall = false,
			bitter_knight_sanguine_prison = false,
			bloodknight_blood_fountain = false,
			yandir_totem_spawn = 0, -- "Off"
			yandir_fireshaman_meteor = 0, -- "Off"
			vrol_firemage_meteor = 0, -- "Off"
			falgravn_ichor_eruption = false,
			falgravn_ichor_eruption_time_before = 3,
		},
		rockgrove = {
			sulxan_reaver_sundering_strike = 0, -- "Off"
			sulxan_soulweaver_astral_shield = false,
			sulxan_soulweaver_soul_remnant = false,
			prime_meteor = false,
			havocrel_barbarian_hasted_assault = false,
			oaxiltso_savage_blitz = false,
			oaxiltso_noxious_sludge = 0, -- "Off"
			oaxiltso_annihilator_cinder_cleave = 0, -- "Off"
			bahsei_embrace_of_death = 0, -- "Off"
		},
		dreadsailReef = {
			dome_activation = false,
			imminent_debuffs = false,
			brothers_heavy_attack = 0, -- "Off"
			reef_guardian_reef_heart = false,
			reef_guardian_reef_heart_result = false,
			taleria_rapid_deluge = 0, -- "Off"
		},
		dbg = {
			enable = false,
			notify = false,
			tracker = false,
			spamControl = true,
			verbose = false,
			myEnemyOnly = false,
			devMode = false,
		},
	}

	function RaidNotifier:GetSetting(settings, category, key)
		if key ~= nil then
			return settings[category] and settings[category][key]
		else -- we passed the category itself already
			return settings[category]
		end

	end

	function RaidNotifier:GetDefaults()
		return defaults
	end
end

-- ------------------------
-- PROFILE FUNCTIONS
-- ------------------------
local profileGuard			= false
local profileCopyList		= {}
local profileDeleteList		= {}
local profileCopyToCopy, profileDeleteToDelete, profileDeleteDropRef
local function CopyProfile()
	local usingGlobal	= RNVars.Default[GetDisplayName()]['$AccountWide'].useAccountWide
	local destProfile	= (usingGlobal) and '$AccountWide' or GetUnitName('player')
	local sourceData, destData

	for account, accountData in pairs(RNVars.Default) do
		for profile, data in pairs(accountData) do
			if (profile == profileCopyToCopy) then
				sourceData = data -- get source data to copy
			end

			if (profile == destProfile) then
				destData = data -- get destination to copy to
			end
		end
	end

	if (not sourceData or not destData) then -- something went wrong, abort
		--CHAT_SYSTEM:AddMessage(strformat('%s: %s', "[RaidNotifier]", "Cannot copy profile."))
	else
		Util.CopyTable(sourceData, destData)
		ReloadUI()
	end
end

local function DeleteProfile()
	for account, accountData in pairs(RNVars.Default) do
		for profile, data in pairs(accountData) do
			if (profile == profileDeleteToDelete) then -- found unwanted profile
				accountData[profile] = nil
				break
			end
		end
	end

	for i, profile in ipairs(profileDeleteList) do
		if (profile == profileDeleteToDelete) then
			tremove(profileDeleteList, i)
			break
		end
	end

	profileDeleteToDelete = false
	profileDeleteDropRef:UpdateChoices()
	profileDeleteDropRef:UpdateValue()
end

local function PopulateProfileLists()
	local usingGlobal	= RNVars.Default[GetDisplayName()]["$AccountWide"].useAccountWide
	local currentPlayer	= GetUnitName("player")
	local version		= RaidNotifier.SV_Version

	for account, accountData in pairs(RNVars.Default) do
		for profile, data in pairs(accountData) do
			if (data.version == version) then -- only populate current DB version
				if (usingGlobal) then
					if (profile ~= "$AccountWide") then
						tinsert(profileCopyList, profile) -- don't add accountwide to copy selection
						tinsert(profileDeleteList, profile) -- don't add accountwide to delete selection
					end
				else
					if (profile ~= currentPlayer) then
						tinsert(profileCopyList, profile) -- don't add current player to copy selection

						if (profile ~= "$AccountWide") then
							tinsert(profileDeleteList, profile) -- don't add accountwide or current player to delete selection
						end
					end
				end
			end
		end
	end

	tsort(profileCopyList)
	tsort(profileDeleteList)
end


function RaidNotifier:CreateSettingsMenu()

	PopulateProfileLists()

	local defaults = self:GetDefaults()
	local savedVars = self.Vars

	local L = self:GetLocale()

	self:TryUpgradeSettings()

	local LAM = LibAddonMenu2
	self.panelData = {
		type = "panel",
		name = self.DisplayName,
		author = self.Author,
		version = self.Version,
		registerForRefresh = true,
		registerForDefaults = true,
	}

	local off_self_all = {
		L.Settings_General_Choices_Off,
		L.Settings_General_Choices_Self,
		L.Settings_General_Choices_All,
	}
	local choices = {
		mawLorkhaj = {
			twinBoss_aspects = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Minimal,
				L.Settings_General_Choices_Normal,
				L.Settings_General_Choices_Full,
			},
			shattering_strike = off_self_all,
			rakkhat_unstablevoid = off_self_all,
			rakkhat_lunarbastion1 = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Self,
				L.Settings_General_Choices_Other,
				L.Settings_General_Choices_All,
			},
			rakkhat_lunarbastion2 = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Self,
				L.Settings_General_Choices_Other,
				L.Settings_General_Choices_All,
			},
			suneater_eclipse = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Self,
				L.Settings_General_Choices_Near,
				L.Settings_General_Choices_All,
			},
		},
		sanctumOphidia = {
			mantikora_spear = off_self_all,
			serpent_poison = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Normal,
				L.Settings_General_Choices_Full,
			},
			troll_boulder  = off_self_all,
			troll_poison   = off_self_all,
			overcharge     = off_self_all,
			call_lightning = off_self_all,
		},
		helra = {
			yokeda_meteor = off_self_all,
			warrior_stoneform = off_self_all,
		},
		archive = {
			overcharge     = off_self_all,
			call_lightning = off_self_all,
		},
		dragonstar = {
			arena6_drain_resource = off_self_all,
			arena8_ice_charge = off_self_all,
			arena8_fire_charge = off_self_all,
		},
		hallsFab = {
			pinnacleBoss_conduit_drain = off_self_all,
			taking_aim = off_self_all,
			taking_aim_dynamic = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Normal,
				L.Settings_General_Choices_Custom,
			},
			draining_ballista = off_self_all,
		},
		asylum = {
			llothis_defiling_blast = off_self_all,
			felms_teleport_strike = off_self_all,
			olms_eruption = off_self_all,
		},
		cloudrest = {
			hoarfrost = off_self_all,
			heavy_attack = off_self_all,
			roaring_flare = off_self_all,
			crushing_darkness = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Self,
			},
			voltaic_overload = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_Self,
			},
			baneful_barb = off_self_all,
			nocturnals_favor = {
				 L.Settings_General_Choices_Off,
				 L.Settings_General_Choices_Self,
			}
		},
		sunspire = {
			chilling_comet = off_self_all,
			breath = off_self_all,
			focus_fire = off_self_all,
			molten_meteor = off_self_all,
			mark_for_death = off_self_all,
			negate_field = {
				 L.Settings_General_Choices_Off,
				 L.Settings_General_Choices_Self,
			}
		},
		kynesAegis = {
			yandir_totem_spawn = {
				L.Settings_General_Choices_Off,
				L.Settings_General_Choices_OnlyChaurusTotem,
				L.Settings_General_Choices_All,
			},
			yandir_fireshaman_meteor = off_self_all,
			vrol_firemage_meteor = off_self_all,
		},
		rockgrove = {
			sulxan_reaver_sundering_strike = off_self_all,
			oaxiltso_noxious_sludge = off_self_all,
			oaxiltso_annihilator_cinder_cleave = off_self_all,
			bahsei_embrace_of_death = off_self_all,
		},
		dreadsailReef = {
			brothers_heavy_attack = off_self_all,
			taleria_rapid_deluge = off_self_all,
		},
	}

	-- quick get/set value functions
	local function getValue(category, key)
		local setting = savedVars[category][key]
		if type(setting) == "table" then
			return setting.value
		else
			return setting
		end
	end
	local function setValue(category, key, value)
		local setting = savedVars[category][key]
		if type(setting) == "table" and type(value) ~= "table" then
			setting.value = value
		else
			savedVars[category][key] = value
		end
	end

	local index = 0
	local optionsTable = {}
	local subTable     = nil
	local function MakeControlEntry(data, category, key)

		if (category ~= nil and key ~= nil) then
			-- for the majority of the settings
			data.category = category
			data.key      = key

			-- build simple table with zero-based values for choices
			if data.choices and not data.choicesValues then
				data.choicesValues = {}
				for i=1, #data.choices do
					tinsert(data.choicesValues, i-1)
				end
			end

			-- setup default value
			local default = self:GetSetting(defaults, category, key)
			data.default = default
			if type(default) == "table" then
				data.default = default.value -- the rest is handled in our dialog
				-- setup reference if it supports sounds or roles
				if (default.sound ~= nil or default.roles ~= nil) then
					index = index + 1
					data.reference = "RNSettingCtrl"..index
				end
			elseif not data.noAlert then
				index = index + 1
				data.reference = "RNSettingCtrl"..index
			end

			-- add get/set functions if they were not provided
			if not data.getFunc then
				data.getFunc = function() return getValue(data.category, data.key) end
			end
			if not data.setFunc then
				data.setFunc = function(value) setValue(data.category, data.key, value) end
			end

		end

		-- add to appropriate table
		if subTable ~= nil and data.type ~= "submenu" then
			tinsert(subTable, data)
		else
			tinsert(optionsTable, data)
		end
	end

	local function MakeSubmenu(title, description)
		subTable = {}
		MakeControlEntry({
			type = "submenu",
			name = title,
			controls = subTable,
		})
		MakeControlEntry({
			type = "description",
			text = description,
		})
		MakeControlEntry({
			type = "divider",
			alpha = 1,
		})
	end

	MakeControlEntry({
		type = "description",
		text = L.Description,
	})

	MakeControlEntry({
		type = "header",
		name = L.Settings_General_Header,
	})
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_General_Center_Screen_Announce,
		tooltip = L.Settings_General_Center_Screen_Announce_TT,
		setFunc = function(value)
			savedVars.general.use_center_screen_announce = value

			if (value == 0) then
				self.AnnouncementUIManager:SetupCustomState()
			else
				self.AnnouncementUIManager:SetupCSAState()
			end
		end,
		choices = {
			L.Settings_General_Choices_Small_Announcement,
			--L.Settings_General_Choices_Large_Announcement,
			L.Settings_General_Choices_Major_Announcement,
			L.Settings_General_Choices_Custom_Announcement,
		}, choicesValues = {
			CSA_CATEGORY_SMALL_TEXT,
			--CSA_CATEGORY_LARGE_TEXT,
			CSA_CATEGORY_MAJOR_TEXT,
			0,
		},
		noAlert = true,
	}, "general", "use_center_screen_announce")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_General_NotificationsScale,
		tooltip = L.Settings_General_NotificationsScale_TT,
		getFunc = function() return savedVars.general.notifications_scale end,
		setFunc = function(value)
			NotificationsPool.GetInstance():SetScale(value/100)
			savedVars.general.notifications_scale = value
		end,
		min = 70, max = 150, step = 5,
		noAlert = true,
		disabled = function() return savedVars.general.use_center_screen_announce ~= 0 end,
	}, "general", "notifications_scale")
	MakeControlEntry({
		type = "button",
		name = L.Settings_General_Notifications_Showcase,
		func = function(btn)
			-- Clear all previous notifications to make a clean showcase
			self:StopCountdown()
			SCENE_MANAGER:Hide("gameMenuInGame")
			-- This 1 sec delay is not only for nice experience, but also for preventing instant-casting notifications
			-- to be overlapped
			-- It seems that some time is needed after hiding settings before notifications will be counted as not hidden
			-- by Control:IsHidden() (that's why they're stacking one atop another)
			zo_callLater(function() self:InvokeNotificationsDebug(15500, false) end, 1000)
		end,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_General_Bufffood_Reminder,
		tooltip = L.Settings_General_Bufffood_Reminder_TT,
	}, "general", "buffFood_reminder")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_General_Bufffood_Reminder_Interval,
		tooltip = L.Settings_General_Bufffood_Reminder_Interval_TT,
		min = 30, max = 120, step = 5,
		noAlert = true,
	}, "general", "buffFood_reminder_interval")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_General_Vanity_Pets,
		tooltip = L.Settings_General_Vanity_Pets_TT,
		noAlert = true,
	}, "general", "vanity_pets")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_General_No_Assistants,
		tooltip = L.Settings_General_No_Assistants_TT,
		noAlert = true,
	}, "general", "no_assistants")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_General_UseDisplayName,
		tooltip = L.Settings_General_UseDisplayName_TT,
		noAlert = true,
	}, "general", "useDisplayName")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_General_Unlock_Status_Icon,
		setFunc = function(value)
				if (value) then
					RaidNotifier:UpdateTwinAspect("tolunar")
				else
					RaidNotifier:UpdateTwinAspect("none")
				end
			end,
		tooltip = L.Settings_General_Unlock_Status_Icon_TT,
		noAlert = true,
	}, "general", "unlock_status_icon")

	local c, cV = Util.UnboxTable(self:GetSounds(), {"name", "id"})
	table.remove(c, 1)   table.remove(cV, 1) -- remove "-Default-"
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_General_Default_Sound,
		tooltip = L.Settings_General_Default_Sound_TT,
		choices = c, choicesValues = cV,
		noAlert = true,
		scrollable = true,
	}, "general", "default_sound")

	-- moved here for easier access
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Debug_DevMode,
		tooltip = L.Settings_Debug_DevMode_TT,
		getFunc = function() return savedVars.dbg.devMode end,
		setFunc = function(value)   savedVars.dbg.devMode = value end,
	})


	MakeSubmenu(L.Settings_Ultimate_Header, L.Settings_Ultimate_Description)
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_Enabled,
		tooltip = L.Settings_Ultimate_Enabled_TT,
		getFunc = function() return savedVars.ultimate.enabled end,
		setFunc = function(value)
				savedVars.ultimate.enabled = value
				if self.raidId > 0 then
					if value then
						self:RegisterForUltimateChanges()
					else
						self:UnregisterForUltimateChanges()
					end
				end
			end,
		default = false,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_Hidden,
		tooltip = L.Settings_Ultimate_Hidden_TT,
		getFunc = function() return savedVars.ultimate.hidden end,
		setFunc = function(value)
				savedVars.ultimate.hidden = value
				self:SetElementHidden("ultimate", "ulti_window", value)
			end,
		default = false,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_UseColor,
		tooltip = L.Settings_Ultimate_UseColor_TT,
		getFunc = function() return savedVars.ultimate.useColor end,
		setFunc = function(value)
				savedVars.ultimate.useColor = value
				self:UpdateUltimates()
			end,
		default = true,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_UseDisplayName,
		tooltip = L.Settings_Ultimate_UseDisplayName_TT,
		getFunc = function() return savedVars.ultimate.useDisplayName end,
		setFunc = function(value)
				savedVars.ultimate.useDisplayName = value
				self:UpdateUltimates()
			end,
		default = false,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_ShowHealers,
		tooltip = L.Settings_Ultimate_ShowHealers_TT,
		getFunc = function() return savedVars.ultimate.showHealers end,
		setFunc = function(value)
				savedVars.ultimate.showHealers = value
				self:UpdateUltimates()
			end,
		default = true,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_ShowTanks,
		tooltip = L.Settings_Ultimate_ShowTanks_TT,
		getFunc = function() return savedVars.ultimate.showTanks end,
		setFunc = function(value)
				savedVars.ultimate.showTanks = value
				self:UpdateUltimates()
			end,
		default = true,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Ultimate_ShowDps,
		tooltip = L.Settings_Ultimate_ShowDps_TT,
		getFunc = function() return savedVars.ultimate.showDps end,
		setFunc = function(value)
				savedVars.ultimate.showDps = value
				self:UpdateUltimates()
			end,
		default = false,
	})
	MakeControlEntry({
		type = "slider",
		min = 0, max = 250,
		name = L.Settings_Ultimate_OverrideCost,
		tooltip = L.Settings_Ultimate_OverrideCost_TT,
		getFunc = function() return savedVars.ultimate.override_cost end,
		setFunc = function(value) savedVars.ultimate.override_cost = value end,
		default = 0,
	})
	subTable = nil --end submenu


	MakeSubmenu(L.Settings_Countdown_Header, L.Settings_Countdown_Description)
	MakeControlEntry({
		type = "slider",
		name = L.Settings_Countdown_TimerScale,
		tooltip = L.Settings_Countdown_TimerScale_TT,
		min = 80, max = 150, step = 5,
		noAlert = true,
	}, "countdown", "timerScale")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_Countdown_TextScale,
		tooltip = L.Settings_Countdown_TextScale_TT,
		min = 80, max = 150, step = 5,
		noAlert = true,
	}, "countdown", "textScale")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Countdown_TimerPrecise,
		tooltip = L.Settings_Countdown_TimerPrecise_TT,
		choices = {
			L.Settings_General_Choices_1s,
			L.Settings_General_Choices_500ms,
			L.Settings_General_Choices_200ms,
		}, choicesValues = {
			10,
			5,
			2,
		},
		getFunc = function()
			return savedVars.countdown.timerPrecise
		end,
		setFunc = function(value)
			savedVars.countdown.timerPrecise = value
			NotificationsPool.GetInstance():SetPrecise(value)
			ReloadUI()
		end,
		noAlert = true,
	}, "countdown", "timerPrecise")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Countdown_UseColors,
		tooltip = L.Settings_Countdown_UseColors_TT,
		noAlert = true,
	}, "countdown", "useColor")
	subTable = nil --end submenu


	MakeSubmenu(L.Settings_Profile_Header, L.Settings_Profile_Description)
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Profile_UseGlobal,
		tooltip = RAIDNOTIFIER_SETTINGS_PROFILE_USEGLOBAL_TT,
		warning = L.Settings_Profile_UseGlobal_Warning,
		getFunc = function()
			return RNVars.Default[GetDisplayName()]["$AccountWide"].useAccountWide
		end,
		setFunc = function(value)
			RNVars.Default[GetDisplayName()]["$AccountWide"].useAccountWide = value
			ReloadUI()
		end,
		default = true,
	})
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Profile_Copy,
		tooltip = L.Settings_Profile_Copy_TT,
		choices = profileCopyList,
		getFunc = function()
			if (#profileCopyList >= 1) then -- there are entries, set first as default
				profileCopyToCopy = profileCopyList[1]
				return profileCopyList[1]
			end
		end,
		setFunc = function(value)
			profileCopyToCopy = value
		end,
		disabled = function() return not profileGuard end,
	})
	MakeControlEntry({
		type = "button",
		name = L.Settings_Profile_CopyButton,
		warning = L.Settings_Profile_CopyButton,
		func = function(btn)  CopyProfile() end,
		disabled = function() return not profileGuard end,
	})
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Profile_Delete,
		tooltip = L.Settings_Profile_Delete_TT,
		choices = profileDeleteList,
		getFunc = function()
			if (#profileDeleteList >= 1) then
				if (not profileDeleteToDelete) then -- nothing selected yet, return first
					profileDeleteToDelete = profileDeleteList[1]
					return profileDeleteList[1]
				else
					return profileDeleteToDelete
				end
			end
		end,
		setFunc = function(value)
			profileDeleteToDelete = value
		end,
		disabled = function() return not profileGuard end,
		reference = "RNSettingDeleteDropRef",
	})
	MakeControlEntry({
		type = "button",
		name = L.Settings_Profile_DeleteButton,
		func = function(btn)  DeleteProfile() end,
		disabled = function() return not profileGuard end,
	})
	MakeControlEntry({type = "divider", alpha = 1})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Profile_Guard,
		getFunc = function() return profileGuard end,
		setFunc = function(value)   profileGuard = value end,
	})
	subTable = nil --end submenu


	MakeControlEntry({
		type = "header",
		name = L.Settings_Trials_Header
	})
	MakeControlEntry({
		type = "description",
		text = L.Settings_Trials_Description
	})

	-- Hel Ra Citadel
	MakeSubmenu(L.Settings_HelRa_Header, RaidNotifier:GetRaidDescription(RAID_HEL_RA_CITADEL))
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HelRa_Yokeda_Meteor,
		tooltip = L.Settings_HelRa_Yokeda_Meteor_TT,
		choices = choices.helra.yokeda_meteor,
	}, "helra", "yokeda_meteor")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HelRa_Warrior_StoneForm,
		tooltip = L.Settings_HelRa_Warrior_StoneForm_TT,
		choices = choices.helra.warrior_stoneform,
	}, "helra", "warrior_stoneform")
	subTable = nil --end submenu


	-- Aetherius Archive
	MakeSubmenu(L.Settings_Archive_Header, RaidNotifier:GetRaidDescription(RAID_AETHERIAN_ARCHIVE))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Archive_StormAtro_ImpendingStorm,
		tooltip = L.Settings_Archive_StormAtro_ImpendingStorm_TT,
	}, "archive", "stormatro_impendingstorm")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Archive_StormAtro_LightningStorm,
		tooltip = L.Settings_Archive_StormAtro_LightningStorm_TT,
	}, "archive", "stormatro_lightningstorm")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Archive_StoneAtro_BoulderStorm,
		tooltip = L.Settings_Archive_StoneAtro_BoulderStorm_TT,
	}, "archive", "stoneatro_boulderstorm")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Archive_StoneAtro_BigQuake,
		tooltip = L.Settings_Archive_StoneAtro_BigQuake_TT,
	}, "archive", "stoneatro_bigquake")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Archive_Overcharge,
		tooltip = L.Settings_Archive_Overcharge_TT,
		choices = choices.archive.overcharge,
	}, "archive", "overcharge")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Archive_Call_Lightning,
		tooltip = L.Settings_Archive_Call_Lightning_TT,
		choices = choices.archive.call_lightning,
	}, "archive", "call_lightning")
	subTable = nil --end submenu


	-- Sanctum Ophidia
	MakeSubmenu(L.Settings_Sanctum_Header, RaidNotifier:GetRaidDescription(RAID_SANCTUM_OPHIDIA))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sanctum_Mantikora_Quake,
		tooltip = L.Settings_Sanctum_Mantikora_Quake_TT,
	}, "sanctumOphidia", "mantikora_quake")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sanctum_Magicka_Detonation,
		tooltip = L.Settings_Sanctum_Magicka_Detonation_TT,
	}, "sanctumOphidia", "magicka_deto")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sanctum_Serpent_Poison,
		tooltip = L.Settings_Sanctum_Serpent_Poison_TT,
		choices = choices.sanctumOphidia.serpent_poison,
	}, "sanctumOphidia", "serpent_poison")
	MakeControlEntry({
	    type = "checkbox",
	    name = L.Settings_Sanctum_Serpent_World_Shaper,
	    tooltip = L.Settings_Sanctum_Serpent_World_Shaper_TT,
	}, "sanctumOphidia", "serpent_world_shaper")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sanctum_Troll_Boulder,
		tooltip = L.Settings_Sanctum_Troll_Boulder_TT,
		choices = choices.sanctumOphidia.troll_boulder,
	}, "sanctumOphidia", "troll_boulder")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sanctum_Troll_Poison,
		tooltip = L.Settings_Sanctum_Troll_Poison_TT,
		choices = choices.sanctumOphidia.troll_poison,
	}, "sanctumOphidia", "troll_poison")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sanctum_Overcharge,
		tooltip = L.Settings_Sanctum_Overcharge_TT,
		choices = choices.sanctumOphidia.overcharge,
	}, "sanctumOphidia", "overcharge")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sanctum_Call_Lightning,
		tooltip = L.Settings_Sanctum_Call_Lightning_TT,
		choices = choices.sanctumOphidia.call_lightning,
	}, "sanctumOphidia", "call_lightning")
	subTable = nil --end submenu


	-- Maw of Lorkhaj
	MakeSubmenu(L.Settings_MawLorkhaj_Header, RaidNotifier:GetRaidDescription(RAID_MAW_OF_LORKHAJ))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj,
		tooltip = L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT,
	}, "mawLorkhaj", "zhaj_gripoflorkhaj")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Zhaj_Glyphs,
		tooltip = L.Settings_MawLorkhaj_Zhaj_Glyphs_TT,
		getFunc = function() return savedVars.mawLorkhaj.zhaj_glyphs end,
		setFunc = function(value)
					savedVars.mawLorkhaj.zhaj_glyphs = value

					if self.raidId == RAID_MAW_OF_LORKHAJ then
					    -- Updating glyph window visibility state
					    self.MOL.OnBossesChanged()
					end
				end,
		noAlert = true,
	}, "mawLorkhaj", "zhaj_glyphs")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert,
		tooltip = L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT,
		getFunc = function() return savedVars.mawLorkhaj.zhaj_glyphs_invert end,
		setFunc = function(value)   savedVars.mawLorkhaj.zhaj_glyphs_invert = value; self:InvertGlyphs() end,
		disabled = function() return not savedVars.mawLorkhaj.zhaj_glyphs end,
		noAlert = true,
	}, "mawLorkhaj", "zhaj_glyphs_invert")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_MawLorkhaj_Twin_Aspects,
		tooltip = L.Settings_MawLorkhaj_Twin_Aspects_TT,
		choices = choices.mawLorkhaj.twinBoss_aspects,
	}, "mawLorkhaj", "twinBoss_aspects")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Twin_Aspects_Status,
		tooltip = L.Settings_MawLorkhaj_Twin_Aspects_Status_TT,
		noAlert = true,
	}, "mawLorkhaj", "twinBoss_aspects_status")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_MawLorkhaj_Rakkhat_Unstable_Void,
		tooltip = L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT,
		choices = choices.mawLorkhaj.rakkhat_unstablevoid,
	}, "mawLorkhaj", "rakkhat_unstablevoid")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown,
		tooltip = L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT,
		disabled = function() return savedVars.mawLorkhaj.rakkhat_unstablevoid ~= 1 end,
	}, "mawLorkhaj", "rakkhat_unstablevoid_countdown")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Rakkhat_ThreshingWings,
		tooltip = L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT,
	}, "mawLorkhaj", "rakkhat_threshingwings")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Rakkhat_DarknessFalls,
		tooltip = L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT,
	}, "mawLorkhaj", "rakkhat_darknessfalls")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Rakkhat_DarkBarrage,
		tooltip = L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT,
	}, "mawLorkhaj", "rakkhat_darkbarrage")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Hulk_ArmorWeakened,
		tooltip = L.Settings_MawLorkhaj_Hulk_ArmorWeakened_TT,
	}, "mawLorkhaj", "hulk_armorweakened")
--	MakeControlEntry({
--		type = "dropdown",
--		name = L.Settings_MawLorkhaj_Rakkhat_LunarBastion1,
--		tooltip = L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT,
--		choices = choices.mawLorkhaj.rakkhat_lunarbastion1,
--	}, "mawLorkhaj", "rakkhat_lunarbastion1")
--	MakeControlEntry({
--		type = "dropdown",
--		name = L.Settings_MawLorkhaj_Rakkhat_LunarBastion2,
--		tooltip = L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT,
--		choices = choices.mawLorkhaj.rakkhat_lunarbastion2,
--	}, "mawLorkhaj", "rakkhat_lunarbastion2")
        MakeControlEntry({
		type = "dropdown",
		name = L.Settings_MawLorkhaj_ShatteringStrike,
		tooltip = L.Settings_MawLorkhaj_ShatteringStrike_TT,
		choices = choices.mawLorkhaj.shattering_strike
	}, "mawLorkhaj", "shattering_strike")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_Shattered,
		tooltip = L.Settings_MawLorkhaj_Shattered_TT,
	}, "mawLorkhaj", "shattered")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_MawLorkhaj_Suneater_Eclipse,
		tooltip = L.Settings_MawLorkhaj_Suneater_Eclipse_TT,
		choices = choices.mawLorkhaj.suneater_eclipse,
	}, "mawLorkhaj", "suneater_eclipse")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_MawLorkhaj_MarkedForDeath,
		tooltip = L.Settings_MawLorkhaj_MarkedForDeath_TT,
	}, "mawLorkhaj", "markedfordeath")
	subTable = nil --end submenu


	-- Dragonstar Arena
	MakeSubmenu(L.Settings_Dragonstar_Header, RaidNotifier:GetRaidDescription(RAID_DRAGONSTAR_ARENA))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Dragonstar_General_Taking_Aim,
		tooltip = L.Settings_Dragonstar_General_Taking_Aim_TT,
	}, "dragonstar", "general_taking_aim")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Dragonstar_General_Crystal_Blast,
		tooltip = L.Settings_Dragonstar_General_Crystal_Blast_TT,
	}, "dragonstar", "general_crystal_blast")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Dragonstar_Arena2_Crushing_Shock,
		tooltip = L.Settings_Dragonstar_Arena2_Crushing_Shock_TT,
	}, "dragonstar", "arena2_crushing_shock")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Dragonstar_Arena6_Drain_Resource,
		tooltip = L.Settings_Dragonstar_Arena6_Drain_Resource_TT,
		choices = choices.dragonstar.arena6_drain_resource,
	}, "dragonstar", "arena6_drain_resource")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Dragonstar_Arena7_Unstable_Core,
		tooltip = L.Settings_Dragonstar_Arena7_Unstable_Core_TT,
	}, "dragonstar", "arena7_unstable_core")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Dragonstar_Arena8_Fire_Charge,
		tooltip = L.Settings_Dragonstar_Arena8_Fire_Charge_TT,
		choices = choices.dragonstar.arena8_fire_charge,
	}, "dragonstar", "arena8_fire_charge")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Dragonstar_Arena8_Ice_Charge,
		tooltip = L.Settings_Dragonstar_Arena8_Ice_Charge_TT,
		choices = choices.dragonstar.arena8_ice_charge,
	}, "dragonstar", "arena8_ice_charge")
	subTable = nil --end submenu


	-- Maelstrom Arena
	MakeSubmenu(L.Settings_Maelstrom_Header, RaidNotifier:GetRaidDescription(RAID_MAELSTROM_ARENA))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Maelstrom_Stage7_Poison,
		tooltip = L.Settings_Maelstrom_Stage7_Poison_TT,
	}, "maelstrom", "stage7_poison")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Maelstrom_Stage9_Synergy,
		tooltip = L.Settings_Maelstrom_Stage9_Synergy_TT,
	}, "maelstrom", "stage9_synergy")
	subTable = nil --end submenu


	-- Halls of Fabrication
	MakeSubmenu(L.Settings_HallsFab_Header, RaidNotifier:GetRaidDescription(RAID_HALLS_OF_FABRICATION))
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HallsFab_Taking_Aim,
		tooltip = L.Settings_HallsFab_Taking_Aim_TT,
		choices = choices.hallsFab.taking_aim,
	}, "hallsFab", "taking_aim")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HallsFab_Taking_Aim_Dynamic,
		tooltip = L.Settings_HallsFab_Taking_Aim_Dynamic_TT,
		choices = choices.hallsFab.taking_aim_dynamic,
		disabled = function() return savedVars.hallsFab.taking_aim ~= 1 end,
		noAlert = true,
	}, "hallsFab", "taking_aim_dynamic")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_HallsFab_Taking_Aim_Duration,
		tooltip = L.Settings_HallsFab_Taking_Aim_Duration_TT,
		min = 2000, max = 10000, step = 100,
		disabled = function() return savedVars.hallsFab.taking_aim ~= 1 or savedVars.hallsFab.taking_aim_dynamic ~= 2 end,
		noAlert = true,
	}, "hallsFab", "taking_aim_duration")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HallsFab_Draining_Ballista,
		tooltip = L.Settings_HallsFab_Draining_Ballista_TT,
		choices = choices.hallsFab.draining_ballista,
	}, "hallsFab", "draining_ballista")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Conduit_Strike,
		tooltip = L.Settings_HallsFab_Conduit_Strike_TT,
	}, "hallsFab", "conduit_strike")
   	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Power_Leech,
		tooltip = L.Settings_HallsFab_Power_Leech_TT,
	}, "hallsFab", "power_leech")
   	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Venom_Injection,
		tooltip = L.Settings_HallsFab_Venom_Injection_TT,
	}, "hallsFab", "venom_injection")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Scalded_Debuff,
		tooltip = L.Settings_HallsFab_Scalded_Debuff_TT,
		noAlert = true,
	}, "hallsFab", "pinnacleBoss_scalded")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Conduit_Spawn,
		tooltip = L.Settings_HallsFab_Conduit_Spawn_TT,
	}, "hallsFab", "pinnacleBoss_conduit_spawn")
  	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_HallsFab_Conduit_Drain,
		tooltip = L.Settings_HallsFab_Conduit_Drain_TT,
		choices = choices.hallsFab.pinnacleBoss_conduit_drain,
	}, "hallsFab", "pinnacleBoss_conduit_drain")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Overpower_Auras,
		tooltip = L.Settings_HallsFab_Overpower_Auras_TT,
	}, "hallsFab", "committee_overpower_auras")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_HallsFab_Overpower_Auras_Duration,
		tooltip = L.Settings_HallsFab_Overpower_Auras_Duration_TT,
		min = 3000, max = 10000, step = 100,
		disabled = function() return not savedVars.hallsFab.committee_overpower_auras end,
		noAlert = true,
	}, "hallsFab", "committee_overpower_auras_duration")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Overpower_Auras_Dynamic,
		tooltip = L.Settings_HallsFab_Overpower_Auras_Dynamic_TT,
		disabled = function() return not self:IsDevMode() or not savedVars.hallsFab.committee_overpower_auras end,
		warning = L.Settings_Debug_DevMode_Warning,
		noAlert = true,
	}, "hallsFab", "committee_overpower_auras_dynamic")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Fabricant_Spawn,
		tooltip = L.Settings_HallsFab_Fabricant_Spawn_TT,
	}, "hallsFab", "committee_fabricant_spawn")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_HallsFab_Reclaim_Achieve,
		tooltip = L.Settings_HallsFab_Reclaim_Achieve_TT,
	}, "hallsFab", "committee_reclaim_achieve")
	subTable = nil --end submenu


	-- Asylum Sanctorium
	MakeSubmenu(L.Settings_Asylum_Header, RaidNotifier:GetRaidDescription(RAID_ASYLUM_SANCTORIUM))
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Asylum_Defiling_Blast,
		tooltip = L.Settings_Asylum_Defiling_Blast_TT,
		choices = choices.asylum.llothis_defiling_blast,
	}, "asylum", "llothis_defiling_blast")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Soul_Stained_Corruption,
		tooltip = L.Settings_Asylum_Soul_Stained_Corruption_TT,
	}, "asylum", "llothis_soul_stained_corruption")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Asylum_Teleport_Strike,
		tooltip = L.Settings_Asylum_Teleport_Strike_TT,
		choices = choices.asylum.felms_teleport_strike,
	}, "asylum", "felms_teleport_strike")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Exhaustive_Charges,
		tooltip = L.Settings_Asylum_Exhaustive_Charges_TT,
	}, "asylum", "olms_exhaustive_charges")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Storm_The_Heavens,
		tooltip = L.Settings_Asylum_Storm_The_Heavens_TT,
	}, "asylum", "olms_storm_the_heavens")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Gusts_Of_Steam,
		tooltip = L.Settings_Asylum_Gusts_Of_Steam_TT,
	}, "asylum", "olms_gusts_of_steam")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_Asylum_Gusts_Of_Steam_Slider,
		tooltip = L.Settings_Asylum_Gusts_Of_Steam_Slider_TT,
		min = 0, max = 5, step = 1,
		noAlert = true,
	}, "asylum", "olms_gusts_of_steam_slider")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Protector_Spawn,
		tooltip = L.Settings_Asylum_Protector_Spawn_TT,
	}, "asylum", "olms_protector_spawn")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Asylum_Trial_By_Fire,
		tooltip = L.Settings_Asylum_Trial_By_Fire_TT,
	}, "asylum", "olms_trial_by_fire")
	subTable = nil --end submenu

	-- Cloudrest
	MakeSubmenu(L.Settings_Cloudrest_Header, RaidNotifier:GetRaidDescription(RAID_CLOUDREST))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Olorime_Spears,
		tooltip = L.Settings_Cloudrest_Olorime_Spears_TT,
	}, "cloudrest", "olorime_spears")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Shadow_Realm_Cast,
		tooltip = L.Settings_Cloudrest_Shadow_Realm_Cast_TT,
	}, "cloudrest", "shadow_realm_cast")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Hoarfrost,
		tooltip = L.Settings_Cloudrest_Hoarfrost_TT,
		choices = choices.cloudrest.hoarfrost,
	}, "cloudrest", "hoarfrost")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Hoarfrost_Countdown,
		tooltip = L.Settings_Cloudrest_Hoarfrost_Countdown_TT,
	}, "cloudrest", "hoarfrost_countdown")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Hoarfrost_Shed,
		tooltip = L.Settings_Cloudrest_Hoarfrost_Shed_TT,
	}, "cloudrest", "hoarfrost_shed")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Chilling_Comet,
		tooltip = L.Settings_Cloudrest_Chilling_Comet_TT,
	}, "cloudrest", "chilling_comet")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Roaring_Flare,
		tooltip = L.Settings_Cloudrest_Roaring_Flare_TT,
		choices = choices.cloudrest.roaring_flare,
	}, "cloudrest", "roaring_flare")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Track_Roaring_Flare,
		tooltip = L.Settings_Cloudrest_Track_Roaring_Flare_TT,
	}, "cloudrest", "track_roaring_flare")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Voltaic_Overload,
		tooltip = L.Settings_Cloudrest_Voltaic_Overload_TT,
		choices = choices.cloudrest.voltaic_overload,
	}, "cloudrest", "voltaic_overload")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Malicious_Strike,
		tooltip = L.Settings_Cloudrest_Malicious_Strike_TT,
	}, "cloudrest", "malicious_strike")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Heavy_Attack,
		tooltip = L.Settings_Cloudrest_Heavy_Attack_TT,
		choices = choices.cloudrest.heavy_attack,
	}, "cloudrest", "heavy_attack")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Baneful_Barb,
		tooltip = L.Settings_Cloudrest_Baneful_Barb_TT,
		choices = choices.cloudrest.baneful_barb,
	}, "cloudrest", "baneful_barb")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Break_Amulet,
		tooltip = L.Settings_Cloudrest_Break_Amulet_TT,
	}, "cloudrest", "break_amulet")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Sum_Shadow_Beads,
		tooltip = L.Settings_Cloudrest_Sum_Shadow_Beads_TT,
	}, "cloudrest", "sum_shadow_beads")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Tentacle_Spawn,
		tooltip = L.Settings_Cloudrest_Tentacle_Spawn_TT,
	}, "cloudrest", "tentacle_spawn")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Nocturnals_Favor,
		tooltip = L.Settings_Cloudrest_Nocturnals_Favor_TT,
		choices = choices.cloudrest.nocturnals_favor,
	}, "cloudrest", "nocturnals_favor")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Cloudrest_Crushing_Darkness,
		tooltip = L.Settings_Cloudrest_Crushing_Darkness_TT,
		choices = choices.cloudrest.crushing_darkness,
	}, "cloudrest", "crushing_darkness")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Cloudrest_Shadow_Splash,
		tooltip = L.Settings_Cloudrest_Shadow_Splash_TT,
	}, "cloudrest", "shadow_splash")
	subTable = nil --end submenu

	MakeSubmenu(L.Settings_Sunspire_Header, RaidNotifier:GetRaidDescription(RAID_SUNSPIRE))
        MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Chilling_Comet,
		tooltip = L.Settings_Sunspire_Chilling_Comet_TT,
		choices = choices.sunspire.chilling_comet,
	}, "sunspire", "chilling_comet")
    MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Breath,
		tooltip = L.Settings_Sunspire_Breath_TT,
		choices = choices.sunspire.breath,
	}, "sunspire", "breath")
    MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Frozen_Tomb,
		tooltip = L.Settings_Sunspire_Frozen_Tomb_TT,
	}, "sunspire", "frozen_tomb")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Focus_Fire,
		tooltip = L.Settings_Sunspire_Focus_Fire_TT,
		choices = choices.sunspire.focus_fire,
	}, "sunspire", "focus_fire")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Cataclism,
		tooltip = L.Settings_Sunspire_Cataclism_TT,
	}, "sunspire", "cataclism")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Molten_Meteor,
		tooltip = L.Settings_Sunspire_Molten_Meteor_TT,
		choices = choices.sunspire.molten_meteor,
	}, "sunspire", "molten_meteor")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Sweeping_Breath,
		tooltip = L.Settings_Sunspire_Sweeping_Breath_TT,
	}, "sunspire", "sweeping_breath")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Thrash,
		tooltip = L.Settings_Sunspire_Thrash_TT,
	}, "sunspire", "thrash")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Mark_For_Death,
		tooltip = L.Settings_Sunspire_Mark_For_Death_TT,
		choices = choices.sunspire.mark_for_death,
	}, "sunspire", "mark_for_death")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Time_Breach,
		tooltip = L.Settings_Sunspire_Time_Breach_TT,
	}, "sunspire", "time_breach")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Shock_Bolt,
		tooltip = L.Settings_Sunspire_Shock_Bolt_TT,
	}, "sunspire", "shock_bolt")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Sunspire_Apocalypse,
		tooltip = L.Settings_Sunspire_Apocalypse_TT,
	}, "sunspire", "translation_apocalypse")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Sunspire_Negate_Field,
		tooltip = L.Settings_Sunspire_Negate_Field_TT,
		choices = choices.sunspire.negate_field,
	}, "sunspire", "negate_field")
	subTable = nil

	-- Kyne's Aegis
	MakeSubmenu(L.Settings_KynesAegis_Header, RaidNotifier:GetRaidDescription(RAID_KYNES_AEGIS))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_KynesAegis_Crashing_Wall,
		tooltip = L.Settings_KynesAegis_Crashing_Wall_TT,
	}, "kynesAegis", "tidebreaker_crashing_wall")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_KynesAegis_Sanguine_Prison,
		tooltip = L.Settings_KynesAegis_Sanguine_Prison_TT,
	}, "kynesAegis", "bitter_knight_sanguine_prison")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_KynesAegis_Blood_Fountain,
		tooltip = L.Settings_KynesAegis_Blood_Fountain_TT,
	}, "kynesAegis", "bloodknight_blood_fountain")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_KynesAegis_Totem,
		tooltip = L.Settings_KynesAegis_Totem_TT,
		choices = choices.kynesAegis.yandir_totem_spawn,
	}, "kynesAegis", "yandir_totem_spawn")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_KynesAegis_Yandir_FireShaman_Meteor,
		tooltip = L.Settings_KynesAegis_Yandir_FireShaman_Meteor_TT,
		choices = choices.kynesAegis.yandir_fireshaman_meteor,
	}, "kynesAegis", "yandir_fireshaman_meteor")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_KynesAegis_Vrol_FireMage_Meteor,
		tooltip = L.Settings_KynesAegis_Vrol_FireMage_Meteor_TT,
		choices = choices.kynesAegis.vrol_firemage_meteor,
	}, "kynesAegis", "vrol_firemage_meteor")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_KynesAegis_Ichor_Eruption,
		tooltip = L.Settings_KynesAegis_Ichor_Eruption_TT,
	}, "kynesAegis", "falgravn_ichor_eruption")
	MakeControlEntry({
		type = "slider",
		name = L.Settings_KynesAegis_Ichor_Eruption_CD_Time,
		tooltip = L.Settings_KynesAegis_Ichor_Eruption_CD_Time_TT,
		min = 2,
		max = 30,
		step = 0.5,
		disabled = function()
			return savedVars.kynesAegis.falgravn_ichor_eruption == false;
		end,
		noAlert = true,
	}, "kynesAegis", "falgravn_ichor_eruption_time_before")
	subTable = nil --end submenu

	-- Rockgrove
	MakeSubmenu(L.Settings_Rockgrove_Header, RaidNotifier:GetRaidDescription(RAID_ROCKGROVE))
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Rockgrove_Sundering_Strike,
		tooltip = L.Settings_Rockgrove_Sundering_Strike_TT,
		choices = choices.rockgrove.sulxan_reaver_sundering_strike,
	}, "rockgrove", "sulxan_reaver_sundering_strike")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Rockgrove_Astral_Shield,
		tooltip = L.Settings_Rockgrove_Astral_Shield_TT,
	}, "rockgrove", "sulxan_soulweaver_astral_shield")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Rockgrove_Soul_Remnant,
		tooltip = L.Settings_Rockgrove_Soul_Remnant_TT,
	}, "rockgrove", "sulxan_soulweaver_soul_remnant")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Rockgrove_Prime_Meteor,
		tooltip = L.Settings_Rockgrove_Prime_Meteor_TT,
	}, "rockgrove", "prime_meteor")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Rockgrove_Hasted_Assault,
		tooltip = L.Settings_Rockgrove_Hasted_Assault_TT,
	}, "rockgrove", "havocrel_barbarian_hasted_assault")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Rockgrove_Savage_Blitz,
		tooltip = L.Settings_Rockgrove_Savage_Blitz_TT,
	}, "rockgrove", "oaxiltso_savage_blitz")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Rockgrove_Noxious_Sludge,
		tooltip = L.Settings_Rockgrove_Noxious_Sludge_TT,
		choices = choices.rockgrove.oaxiltso_noxious_sludge,
	}, "rockgrove", "oaxiltso_noxious_sludge")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Rockgrove_Cinder_Cleave,
		tooltip = L.Settings_Rockgrove_Cinder_Cleave_TT,
		choices = choices.rockgrove.oaxiltso_annihilator_cinder_cleave,
	}, "rockgrove", "oaxiltso_annihilator_cinder_cleave")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_Rockgrove_Embrace_Of_Death,
		tooltip = L.Settings_Rockgrove_Embrace_Of_Death_TT,
		choices = choices.rockgrove.bahsei_embrace_of_death,
		choicesTooltips = { false, false, L.Settings_Rockgrove_Embrace_Of_Death_TT_All },
	}, "rockgrove", "bahsei_embrace_of_death")
	subTable = nil --end submenu

	-- Dreadsail Reef
	MakeSubmenu(L.Settings_DreadsailReef_Header, RaidNotifier:GetRaidDescription(RAID_DREADSAIL_REEF))
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_DreadsailReef_Dome_Activation,
		tooltip = L.Settings_DreadsailReef_Dome_Activation_TT,
	}, "dreadsailReef", "dome_activation")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_DreadsailReef_Imminent_Debuffs,
		tooltip = L.Settings_DreadsailReef_Imminent_Debuffs_TT,
	}, "dreadsailReef", "imminent_debuffs")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_DreadsailReef_Brothers_Heavy_Attack,
		tooltip = L.Settings_DreadsailReef_Brothers_Heavy_Attack_TT,
		choices = choices.dreadsailReef.brothers_heavy_attack,
	}, "dreadsailReef", "brothers_heavy_attack")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_DreadsailReef_ReefGuardian_ReefHeart,
		tooltip = L.Settings_DreadsailReef_ReefGuardian_ReefHeart_TT,
	}, "dreadsailReef", "reef_guardian_reef_heart")
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_DreadsailReef_ReefHeart_Result,
		tooltip = L.Settings_DreadsailReef_ReefHeart_Result_TT,
		disabled = function()
			return savedVars.dreadsailReef.reef_guardian_reef_heart == false;
		end,
	}, "dreadsailReef", "reef_guardian_reef_heart_result")
	MakeControlEntry({
		type = "dropdown",
		name = L.Settings_DreadsailReef_Rapid_Deluge,
		tooltip = L.Settings_DreadsailReef_Rapid_Deluge_TT,
		choices = choices.dreadsailReef.taleria_rapid_deluge,
	}, "dreadsailReef", "taleria_rapid_deluge")
	subTable = nil --end submenu

	MakeControlEntry({
		type = "header",
		name = L.Settings_Debug_Header,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Debug,
		tooltip = L.Settings_Debug_TT,
		getFunc = function() return savedVars.dbg.enabled end,
		setFunc = function(value)   savedVars.dbg.enabled = value end,
	})
	MakeSubmenu(L.Settings_Debug_Tracker_Header, L.Settings_Debug_Tracker_Description)
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Debug_Tracker_Enabled,
		--tooltip = RAIDNOTIFIER_SETTINGS_DEBUG_TRACKER_ENABLED_TT, -- dont need tooltip for this
		getFunc = function() return savedVars.dbg.tracker end,
		setFunc = function(value)
				savedVars.dbg.tracker = value
				self:ToggleDebugTracker(savedVars.dbg.tracker)
			end,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Debug_Tracker_SpamControl,
		tooltip = L.Settings_Debug_Tracker_SpamControl_TT,
		getFunc = function() return savedVars.dbg.spamControl end,
		setFunc = function(value)   savedVars.dbg.spamControl = value end,
		disabled = function() return not savedVars.dbg.tracker end,
	})
	MakeControlEntry({
		type = "checkbox",
		name = L.Settings_Debug_Tracker_MyEnemyOnly,
		tooltip = L.Settings_Debug_Tracker_MyEnemyOnly_TT,
		getFunc = function() return savedVars.dbg.myEnemyOnly end,
		setFunc = function(value)   savedVars.dbg.myEnemyOnly = value end,
		disabled = function() return not savedVars.dbg.tracker end,
	})
	subTable = nil --end submenu



	self.optionsData = optionsTable
	LAM:RegisterAddonPanel("RaidNotifierPanel", self.panelData)
	LAM:RegisterOptionControls("RaidNotifierPanel", self.optionsData)


	--function RaidNotifier:GetSoundValue(category, key)
	--	local setting = self:GetSetting(savedVars, category, key)
	--	return setting.sound
	--end
	--function RaidNotifier:SetSoundValue(category, key, value)
	--	local setting = self:GetSetting(savedVars, category, key)
	--	setting.sound = value
	--end


	local function InitializeCustomDialog()
		local customControl = RaidNotifier_ConfigDialog

		local function SetupDialog(dialog, data)
			customControl.selectSound = customControl:GetNamedChild("SelectSound")
			customControl.selectedSoundID = self:GetSoundValue(data.category, data.key)
			customControl.selectSound.dropdown:SetSelectedItemText(self:GetSoundName(customControl.selectedSoundID))
		end

		local function OnDialogConfirm(dialog)
			self:SetSoundValue(dialog.data.category, dialog.data.key, dialog.selectedSoundID)
		end

	    ZO_Dialogs_RegisterCustomDialog("RAID_NOTIFIER_CONFIG_DIALOG",
		{
			customControl = customControl,
			title =
			{
				text = "Select Sound Dialog",
			},
			mainText =
			{
				text = "Chose the sound to use for this alert",
			},
			setup = SetupDialog,
			buttons =
			{
				{
					control = customControl:GetNamedChild("Confirm"),
					text = SI_DIALOG_CONFIRM,
					callback = OnDialogConfirm,
				},
				{
					control = customControl:GetNamedChild("Cancel"),
					text = SI_DIALOG_CANCEL,
				}
			}
		})

		local function OnSoundSelected(comboBox, entryText, entry)
			customControl.selectedSoundID = entry.id
			PlaySound(entry.id)
		end

		local function PopulateSoundDropdown(comboBox)

			comboBox:SetSortsItems(false)
			for _, entry in pairs(self:GetSounds()) do
				entry.callback = OnSoundSelected
				comboBox:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
			end
			comboBox:UpdateItems()
		end

		PopulateSoundDropdown(customControl:GetNamedChild("SelectSound").dropdown)
	end

	local function OnPanelCreation(panel)
		if panel:GetName() ~= "RaidNotifierPanel" then return end

		InitializeCustomDialog()

		--store reference
		profileDeleteDropRef = RNSettingDeleteDropRef

		local function GetConfigButtonTooltipText(control)
			return string.format("Sound: %s", self:GetSoundName(nil, control.data.category, control.data.key))
		end

		--loop through controls to add our Sound-Config-Button-Clicky-Thing (tm)
		for i = 1, index do
			local control = GetControl("RNSettingCtrl"..i)
			if (control) then
				--local setting = self:GetSetting(savedVars, control.data.category, control.data.key)
				--if (type(setting) == "table" and setting.sound ~= nil) then
				if (control and not control.data.noAlert) then
					control.soundBtn = WINDOW_MANAGER:CreateControlFromVirtual(nil, control, "RaidNotifier_ConfigButton")
					control.soundBtn:SetAnchor(RIGHT, control.combobox or control[control.data.type], LEFT, -1, 0)
					control.soundBtn:SetHandler("OnClicked", function()
							ZO_Dialogs_ShowDialog("RAID_NOTIFIER_CONFIG_DIALOG", control.data)
						end)
					control.soundBtn.data = {tooltipText=function() return GetConfigButtonTooltipText(control) end}
					control.soundBtn:SetHidden(false)

					-- re-anchor the warning control
					if control.warning then
						control.warning:ClearAnchors()
						control.warning:SetAnchor(RIGHT, control.soundBtn, LEFT, 5, 0)
					end
				end
			end
		end

	end
	CALLBACK_MANAGER:RegisterCallback("LAM-PanelControlsCreated", OnPanelCreation)

end

function RaidNotifier:TryUpgradeSettings()

	local defaults  = self:GetDefaults()
	local savedVars = self.Vars

	local version, lastVersion = self.Version, savedVars.addonVersion or "0"
	if lastVersion < "2.2.1" then
		-- change all alert sounds with CHAMPION_POINT_GAINED to DEFAULT_SOUND
		for key, sound in pairs(savedVars.sounds) do
			if sound == SOUNDS.CHAMPION_POINTS_COMMITTED then
				savedVars.sounds[key] = DEFAULT_SOUND
			end
		end
	elseif lastVersion == "2.2.1" then
		-- change "committee_overpower_auras_duration" to 9 seconds again since it was fixed in ESO v3.1.6
		savedVars.hallsFab.committee_overpower_auras_duration = 9000
	elseif lastVersion >= "2.3.2" and lastVersion < "2.3.4" then
		-- reset countdown scales since they are still 0-1 instead of 0-100
		savedVars.countdown.timerScale = 100
		savedVars.countdown.textScale = 100
	end

	if lastVersion > "0" and lastVersion < "2.3.6" then
		-- set taking_aim_duration to "Custom" if previous duration differs from the default
		if savedVars.hallsFab.taking_aim_duration ~= defaults.hallsFab.taking_aim_duration then
			savedVars.hallsFab.taking_aim_dynamic = 2 -- "Custom"
		end
	end
	savedVars.addonVersion = version

	-- now for generic type checks
	for category,content in pairs(defaults) do
		if type(content) == "table" then
			for key, default in pairs(content) do
				local value = savedVars[category][key]
				if type(value) ~= type(default) then --type mismatch
					if type(default) == "table" then -- advanced structure, try to preserve old value
						savedVars[category][key] = Util.CopyTable(default) -- store value
						if type(default.value) == type(value) then
							self.p("Converted '%s -> %s' and keeping old value: %s", category, key, tostring(value))
							savedVars[category][key].value = value
						else
							self.p("Converted '%s -> %s' and types mismatch, new value: %s", category, key, tostring(default.value))
						end
						-- try to preserve sound setting
						local soundId = savedVars.sounds[category.."_"..key]
						if soundId ~= nil then
							self.p("Preserved soundId '%s'", soundId)
							savedVars[category][key].sound = soundId
						end
					else
						savedVars[category][key] = default
						self.p("Mismatching type for '%s -> %s', new value: %s", category, key, tostring(default))
					end
				elseif type(default) == "table" then -- check for missing table entries
					--
				end
			end
		end
	end
end
