MuchSmarterAutoLootSettings                               = ZO_Object:Subclass()
MuchSmarterAutoLootSettings.db                            = nil
MuchSmarterAutoLootSettings.EVENT_TOGGLE_AUTOLOOT         = 'MUCHSMARTERAUTOLOOT_TOGGLE_AUTOLOOT'


local CBM = CALLBACK_MANAGER
local LAM2 = LibAddonMenu2
if ( not LAM2 ) then return end

function MuchSmarterAutoLootSettings:New( ... )
    local result = ZO_Object.New( self )
    result:Initialize( ... )
    return result
end

function MuchSmarterAutoLootSettings:Initialize( db )
    
	local panelData = 
	{
		type = "panel",
		name = GetString(MSAL_PANEL_NAME),
		displayName = GetString(MSAL_PANEL_DISPLAYNAME),
		author = "|c215895Lykeion|r",
		version = "|ccc922f2.10.2|r",
		slashCommand = "/msal",
		registerForRefresh = true,
		registerForDefaults = true,
	}
	local defaultChoices = {
	GetString(MSAL_ALWAYS_LOOT),
	GetString(MSAL_NEVER_LOOT),
	GetString(MSAL_PER_QUALITY_THRESHOLD),
	GetString(MSAL_PER_VALUE_THRESHOLD),
--	GetString(MSAL_PER_QUALITY_AND_VALUE)
	}
	local defaultChoicesValues = {
	"always loot", 
	"never loot", 
	"per quality threshold",
	"per value threshold", 
--	"per quality AND value"
	}
	
	local booleanChoices = {GetString(MSAL_ALWAYS_LOOT),GetString(MSAL_NEVER_LOOT)}
	local booleanChoicesValues = {"always loot", "never loot"}
	
	local setChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_UNCOLLECTED), GetString(MSAL_UNCOLLECTED_AND_JEWELRY), GetString(MSAL_UNCOLLECTED_AND_NON_JEWELRY),GetString(MSAL_ONLY_COLLECTED),GetString(MSAL_NEVER_LOOT)}
	local setChoicesValues = {"always loot", "only uncollected", "uncollected and jewelry", "uncollected and non-jewelry","only collected", "never loot"}
	
	local intricateChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_TYPE_BASED), GetString(MSAL_NEVER_LOOT)}
	local intricateChoicesValues = {"always loot", "type based", "never loot"}
	
	local treasureMapsChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_NON_BASE_ZONE), GetString(MSAL_NEVER_LOOT)}
	local treasureMapsChoicesValues = {"always loot", "only non-base-zone", "never loot"}
	
	local styleMaterialsChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_NON_RACIAL), GetString(MSAL_NEVER_LOOT)}
	local styleMaterialsChoicesValues = {"always loot", "only non-racial", "never loot"}
		
	local soulGemsChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_FILLED), GetString(MSAL_NEVER_LOOT)}
	local soulGemsChoicesValues = {"always loot", "only filled", "never loot"}
	
	local potionsChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_NON_BASTIAN), GetString(MSAL_NEVER_LOOT)}
	local potionsChoicesValues = {"always loot", "only non-bastian", "never loot"}
		
	local recipesChoices = {GetString(MSAL_ALWAYS_LOOT), GetString(MSAL_ONLY_UNKNOWN), GetString(MSAL_NEVER_LOOT)}
	local recipesChoicesValues = {"always loot", "only unknown", "never loot"}
	

	local optionsData = 
	{
	    {
            type = "description",
            text = GetString(MSAL_HELP_TITLE),
            width = "full"
        },
		{
			type = "checkbox",
			name = GetString(MSAL_ENABLE_MSAL),
			tooltip = GetString(MSAL_ENABLE_MSAL_TOOLTIP),
			keybind =  "UI_SHORTCUT_PRIMARY" , 
			getFunc = function() return db.enabled end,
			setFunc = function(value)
				db.enabled = value 
				if (value) then
					SetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_LOOT, 0)
				end
			end,
			default = true,
		},
		{
			type = "submenu",
			name = GetString(MSAL_GENERAL_SETTINGS),
			controls = {
				[1] = {
					type = "checkbox",
					name = GetString(MSAL_LOGIN_REMINDER),
					tooltip = GetString(MSAL_LOGIN_REMINDER_TOOLTIP),
					getFunc = function() return db.loginReminder end,
					setFunc = function(value) db.loginReminder = value end,
					default = true
				},
				[2] = {
					type = "checkbox",
					name = GetString(MSAL_SHOW_ITEM_LINKS),
					tooltip = GetString(MSAL_SHOW_ITEM_LINKS_TOOLTIP),
					getFunc = function() return db.printItems end,
					setFunc = function(value) db.printItems = value end,
					default = false,
				},
				[3] = {
					type = "checkbox",
					name = GetString(MSAL_CLOSE_LOOT_WINDOW),
					tooltip = GetString(MSAL_CLOSE_LOOT_WINDOW_TOOLTIP),
					getFunc = function() return db.closeLootWindow end,
					setFunc = function(value) db.closeLootWindow = value end,
					default = false,
				},
				[4] = {
					type = "checkbox",
					name = GetString(MSAL_LOOT_STOLEN_ITEMS),
					tooltip = GetString(MSAL_LOOT_STOLEN_ITEMS_TOOLTIP),
					getFunc = function() return db.lootStolen end,
					setFunc = function(value) db.lootStolen = value end,
					default = false
				},
				[5] = {
					type = "checkbox",
					name = GetString(MSAL_DEBUG),
					tooltip = GetString(MSAL_DEBUG_TOOLTIP),
					getFunc = function() return db.debugMode end,
					setFunc = function(value) db.debugMode = value end,
					default = false,
				},
--				[4] = {
--					type = "checkbox",
--					name = GetString(MSAL_ALLOW_ITEM_DESTRUCTION),
--					tooltip = GetString(MSAL_ALLOW_ITEM_DESTRUCTION_TOOLTIP),
--					getFunc = function() return db.allowDestroy end,
--					setFunc = function(value) db.allowDestroy = value; ReloadUI() end,
--					default = false,
--					warning = "Require Reload of UI"
--				},
			}
		},
		{
			type = "submenu",
			name = GetString(MSAL_GEAR_FILTERS),
			controls = {
				[1] = {
					type = "description",
					text = GetString(MSAL_HELP_GEAR),
					width = "full"
				},
				[2] = {
					type = "slider",
					name = GetString(MSAL_QUALITY_THRESHOLD),
					tooltip = GetString(MSAL_QUALITY_THRESHOLD_TOOLTIP),
					min = 1,
					max = 5,
					step = 1,
					getFunc = function() return db.minimumQuality end,
					setFunc = function(value) db.minimumQuality = value end,
					default = 1,
				},
				[3] = {
					type = "slider",
					name = GetString(MSAL_VALUE_THRESHOLD),
					tooltip = GetString(MSAL_VALUE_THRESHOLD_TOOLTIP),
					min = 0,
					max = 300,
					getFunc = function() return db.minimumValue end,
					setFunc = function(value) db.minimumValue = value end,
					default = 0,
				},
				[4] = {
					type = "checkbox",
					name = GetString(MSAL_AUTOBIND),
					tooltip = GetString(MSAL_AUTOBIND_TOOLTIP),
					getFunc = function() return db.autoBind end,
					setFunc = function(value) db.autoBind = value end,
					default = false,
				},
				[5] = {
					type = "dropdown",
					name = GetString(MSAL_SET_ITEMS),
					choices = setChoices,
					choicesValues = setChoicesValues,
					getFunc = function() return db.filters.set end,
					setFunc = function(value) db.filters.set = value end,
					default = "always loot",
				},
				[6] = {
					type = "dropdown",
					name = GetString(MSAL_UNRESEARCHED_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.unresearched end,
					setFunc = function(value) db.filters.unresearched = value end,
					default = "always loot",
				},
				[7] = {
					type = "dropdown",
					name = GetString(MSAL_ORNATE_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.ornate end,
					setFunc = function(value) db.filters.ornate = value end,
					default = "always loot",
				},
				[8] = {
					type = "dropdown",
					name = GetString(MSAL_INTRICATE_ITEMS),
					choices = intricateChoices,
					choicesValues = intricateChoicesValues,
					getFunc = function() return db.filters.intricate end,
					setFunc = function(value) db.filters.intricate = value end,
					default = "always loot",
				},
                [9] = {
                    type = "dropdown",
                    name = GetString(MSAL_CLOTHING_INTRICATE_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
                    getFunc = function() return db.filters.clothingIntricate end,
                    setFunc = function(value) db.filters.clothingIntricate = value end,
                    default = "always loot",
                    disabled = function() return not (db.filters.intricate == "type based") end,
                },
				[10] = {
                    type = "dropdown",
                    name = GetString(MSAL_BLACKSMITHING_INTRICATE_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
                    getFunc = function() return db.filters.blacksmithingIntricate end,
                    setFunc = function(value) db.filters.blacksmithingIntricate = value end,
                    default = "always loot",
                    disabled = function() return not (db.filters.intricate == "type based") end,
                },
				[11] = {
                    type = "dropdown",
                    name = GetString(MSAL_WOODWORKING_INTRICATE_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
                    getFunc = function() return db.filters.woodworkingIntricate end,
                    setFunc = function(value) db.filters.woodworkingIntricate = value end,
                    default = "always loot",
                    disabled = function() return not (db.filters.intricate == "type based") end,
                },
				[12] = {
                    type = "dropdown",
                    name = GetString(MSAL_JEWELRY_INTRICATE_ITEMS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
                    getFunc = function() return db.filters.jewelryIntricate end,
                    setFunc = function(value) db.filters.jewelryIntricate = value end,
                    default = "always loot",
                    disabled = function() return not (db.filters.intricate == "type based") end,
                },
				[13] = {
					type = "dropdown",
					name = GetString(MSAL_COMPANION_GEARS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.companionGears end,
					setFunc = function(value) db.filters.companionGears = value end,
					default = "always loot",
				},
				[14] = {
					type = "dropdown",
					name = GetString(MSAL_WEAPONS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.weapons end,
					setFunc = function(value) db.filters.weapons = value end,
					default = "never loot",
				},
				[15] = {
					type = "dropdown",
					name = GetString(MSAL_ARMORS),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.armors end,
					setFunc = function(value) db.filters.armors = value end,
					default = "never loot",
				},
				[16] = {
					type = "dropdown",
					name = GetString(MSAL_JEWELRY),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.jewelry end,
					setFunc = function(value) db.filters.jewelry = value end,
					default = "never loot",
				}
			}
		},
		{
			type = "submenu",
			name = GetString(MSAL_MATERIAL_FILTERS),
			controls = {
				[1] = {
					type = "description",
					text = GetString(MSAL_HELP_MATERIAL),
					width = "full"
				},
				[2] = {
					type = "checkbox",
					name = GetString(MSAL_ESOP_AUTOLOOT_STOLEN),
					tooltip = GetString(MSAL_ESOP_AUTOLOOT_STOLEN_TOOLTIP),
					getFunc = function() return db.esopAutolootStolen end,
					setFunc = function(value) db.esopAutolootStolen = value end,
					default = false,
					disabled = function() return not IsESOPlusSubscriber() end,
				},
				[3] = {
					type = "dropdown",
					name = GetString(MSAL_CRAFTING_MATERIALS),
					tooltip = GetString(MSAL_CRAFTING_MATERIALS_TOOLTIP),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.craftingMaterials end,
					setFunc = function(value) db.filters.craftingMaterials = value end,
					default = "never loot",
				},
				[4] = {
					type = "dropdown",
					name = GetString(MSAL_STYLE_MATERIALS),
					choices = styleMaterialsChoices,
					choicesValues = styleMaterialsChoicesValues,
					getFunc = function() return db.filters.styleMaterials end,
					setFunc = function(value) db.filters.styleMaterials = value end,
					default = "never loot",
				},
				[5] = {
					type = "dropdown",
					name = GetString(MSAL_TRAIT_MATERIALS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.traitMaterials end,
					setFunc = function(value) db.filters.traitMaterials = value end,
					default = "never loot",
				},
				[6] = {
					type = "dropdown",
					name = GetString(MSAL_ALCHEMY_REAGENTS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.alchemy end,
					setFunc = function(value) db.filters.alchemy = value end,
					default = "never loot",
				},
				[7] = {
					type = "dropdown",
					name = GetString(MSAL_COOKING_INGREDIENTS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.ingredients end,
					setFunc = function(value) db.filters.ingredients = value end,
					default = "never loot",
				},
				[8] = {
					type = "dropdown",
					name = GetString(MSAL_ENCHANTING_RUNES),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.runes end,
					setFunc = function(value) db.filters.runes = value end,
					default = "never loot",
				},
				[9] = {
					type = "dropdown",
					name = GetString(MSAL_FURNISHING_MATERIALS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.furnishingMaterials end,
					setFunc = function(value) db.filters.furnishingMaterials = value end,
					default = "never loot",
				}
			}
		},
		{
			type = "submenu",
			name = GetString(MSAL_CURRENCY_FILTERS),
			controls = {
				[1] = {
					type = "description",
					text = GetString(MSAL_HELP_CURRENCY),
					width = "full"
				},
				[2] = {
					type = "dropdown",
					name = GetString(MSAL_EVENT_TICKETS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.tickets end,
					setFunc = function(value) db.filters.tickets = value end,
					default = "always loot",
				},
				[3] = {
					type = "dropdown",
					name = GetString(MSAL_TRANSMUTE_CRYSTALS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.crystals end,
					setFunc = function(value) db.filters.crystals = value end,
					default = "always loot",
				},
				-- [18] = {
				-- 	type = "dropdown",
				-- 	name = "Needed Research",
				-- 	choices = {"always loot", "never loot", "per quality threshold", "per value threshold", "per quality OR value", "per quality AND value"},
				-- 	getFunc = function() return db.filters.neededResearch end,
				-- 	setFunc = function(value) db.filters.neededResearch = value end,
				-- 	default = "always loot",
				-- },

			}
		},
		{
			type = "submenu",
			name = GetString(MSAL_MISC_FILTERS),
			controls = {
				[1] = {
					type = "dropdown",
					name = GetString(MSAL_QUEST_ITEMS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.questItems end,
					setFunc = function(value) db.filters.questItems = value end,
					default = "always loot",
				},	
				[2] = {
					type = "dropdown",
					name = GetString(MSAL_CROWN_ITEMS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.crownItems end,
					setFunc = function(value) db.filters.crownItems = value end,
					default = "always loot",
				},				
				[3] = {
					type = "dropdown",
					name = GetString(MSAL_RECIPES),
					choices = recipesChoices,
					choicesValues = recipesChoicesValues,
					getFunc = function() return db.filters.recipes end,
					setFunc = function(value) db.filters.recipes = value end,
					default = "only unknown",
				},
				[4] = {
					type = "dropdown",
					name = GetString(MSAL_SOUL_GEMS),
					choices = soulGemsChoices,
					choicesValues = soulGemsChoicesValues,
					getFunc = function() return db.filters.soulGems end,
					setFunc = function(value) db.filters.soulGems = value end,
					default = "only filled",
				},
				[5] = {
					type = "dropdown",
					name = GetString(MSAL_TREASURE_MAPS),
					choices = treasureMapsChoices,
					choicesValues = treasureMapsChoicesValues,
					getFunc = function() return db.filters.treasureMaps end,
					setFunc = function(value) db.filters.treasureMaps = value end,
					default = "only non-base-zone",
				},
				[6] = {
					type = "dropdown",
					name = GetString(MSAL_LEADS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.leads end,
					setFunc = function(value) db.filters.leads = value end,
					default = "always loot",
				},
				[7] = {
					type = "dropdown",
					name = GetString(MSAL_GLYPHS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.glyphs end,
					setFunc = function(value) db.filters.glyphs = value end,
					default = "never loot",
				},
				[8] = {
					type = "dropdown",
					name = GetString(MSAL_FOOD_DRINK),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.foodAndDrink end,
					setFunc = function(value) db.filters.foodAndDrink = value end,
					default = "never loot",
				},
				[9] = {
					type = "dropdown",
					name = GetString(MSAL_POISONS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.poisons end,
					setFunc = function(value) db.filters.poisons = value end,
					default = "never loot",
				},
				[10] = {
					type = "dropdown",
					name = GetString(MSAL_POTIONS),
					choices = potionsChoices,
					choicesValues = potionsChoicesValues,
					getFunc = function() return db.filters.potions end,
					setFunc = function(value) db.filters.potions = value end,
					default = "never loot",
				},
				[11] = {
					type = "dropdown",
					name = GetString(MSAL_CONTAINERS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.containers end,
					setFunc = function(value) db.filters.containers = value end,
					default = "always loot",
				},
				[12] = {
					type = "dropdown",
					name = GetString(MSAL_FURNITURE),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.furniture end,
					setFunc = function(value) db.filters.furniture = value end,
					default = "never loot",
				},
				[13] = {
					type = "dropdown",
					name = GetString(MSAL_WRITS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.writs end,
					setFunc = function(value) db.filters.writs = value end,
					default = "never loot",
				},
				[14] = {
					type = "dropdown",
					name = GetString(MSAL_COLLECTIBLES),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.collectibles end,
					setFunc = function(value) db.filters.collectibles = value end,
					default = "never loot",
				},
				[15] = {
					type = "dropdown",
					name = GetString(MSAL_TREASURES),
					choices = defaultChoices,
					choicesValues = defaultChoicesValues,
					getFunc = function() return db.filters.treasures end,
					setFunc = function(value) db.filters.treasures = value end,
					default = "never loot",
				},
				[16] = {
					type = "dropdown",
					name = GetString(MSAL_ALLIANCE_WAR_CONSUMABLES),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.allianceWarConsumables end,
					setFunc = function(value) db.filters.allianceWarConsumables = value end,
					default = "never loot",
				},
				[17] = {
					type = "dropdown",
					name = GetString(MSAL_LOCKPICKS_TOOLS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.tools end,
					setFunc = function(value) db.filters.tools = value end,
					default = "never loot",
				},
				[18] = {
					type = "dropdown",
					name = GetString(MSAL_COSTUMES_DISGUISES),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.costumes end,
					setFunc = function(value) db.filters.costumes = value end,
					default = "never loot",
				},
				[19] = {
					type = "dropdown",
					name = GetString(MSAL_FISHING_BAITS),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.fishingBaits end,
					setFunc = function(value) db.filters.fishingBaits = value end,
					default = "never loot",
				},
				[20] = {
					type = "dropdown",
					name = GetString(MSAL_TRASH),
					choices = booleanChoices,
					choicesValues = booleanChoicesValues,
					getFunc = function() return db.filters.trash end,
					setFunc = function(value) db.filters.trash = value end,
					default = "never loot",
				}
				-- [18] = {
				-- 	type = "dropdown",
				-- 	name = "Needed Research",
				-- 	choices = {"always loot", "never loot", "per quality threshold", "per value threshold", "per quality OR value", "per quality AND value"},
				-- 	getFunc = function() return db.filters.neededResearch end,
				-- 	setFunc = function(value) db.filters.neededResearch = value end,
				-- 	default = "always loot",
				-- },

			}
		}
	}
	
	-- for those who don't have LibSavedVars you can still use MSAL, although LSV is strongly recommended
	local LSV = LibSavedVars
	if (LSV) then
		table.insert(optionsData, 3, db:GetLibAddonMenuAccountCheckbox())
	end
	
	LAM2:RegisterAddonPanel("MuchSmarterAutoLootOptions", panelData)
	LAM2:RegisterOptionControls("MuchSmarterAutoLootOptions", optionsData)
end

--function MuchSmarterAutoLootSettings:ToggleAutoLoot()
--    db.enabled = not db.enabled
--    CBM:FireCallbacks( self.EVENT_TOGGLE_AUTOLOOT )
--end
