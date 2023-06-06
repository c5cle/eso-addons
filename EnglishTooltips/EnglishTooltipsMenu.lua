-- Settings menu
function EnglishTooltips.OptionsMenu()
    local LAM = LibAddonMenu2
	
    local panelData = {
        type = "panel",
        name = EnglishTooltips.menuName,
        displayName = EnglishTooltips.displayName,
        author = EnglishTooltips.author,
		version = EnglishTooltips.version,
        registerForRefresh = true,
        registerForDefaults = true,
    }
    LAM:RegisterAddonPanel(EnglishTooltips.menuName, panelData)
	
    local optionsTable = {}
	
	table.insert(optionsTable, {
		type = "header",
		name = GetString(SI_AUDIO_OPTIONS_GENERAL),
	})
	
    table.insert(optionsTable, {
        type = "dropdown",
        name = GetString(SI_ENGLISHTOOLTIPS_TOOLTIP_FORMAT),
        choices = {zo_strformat("<<Z:1>> (EN)", GetCVar("language.2")), "EN"},
        getFunc = function() return EnglishTooltips.savedVars.tooltipformat end,
        setFunc = function(value) EnglishTooltips.savedVars.tooltipformat = value end,
		default = zo_strformat("<<Z:1>> (EN)", GetCVar("language.2")),
    })
	
	table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_TOOLTIP_NEW_LINE),
		getFunc = function() return EnglishTooltips.savedVars.onnewline end,
		setFunc = function(value) EnglishTooltips.savedVars.onnewline = value end,
		default = false,
    })
	
	table.insert(optionsTable, {
		type = "header",
		name = GetString(SI_CHAT_OPTIONS_FILTERS),
	})
	
	table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showequipment end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showequipment = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_ARMOR] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_WEAPON] = value
		end,
		default = true,
    })
	
    table.insert(optionsTable, {
		type = "checkbox",
		name = string.format("\t\t\t%s", GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_SETNAME)),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_SETNAME_DESC),
		getFunc = function() return EnglishTooltips.savedVars.equipmentsetinsteadname end,
		setFunc = function(value) EnglishTooltips.savedVars.equipmentsetinsteadname = value end,
		disabled = function() return EnglishTooltips.savedVars.tooltipformat == "EN" or not EnglishTooltips.savedVars.showequipment end,
		default = false,
    })
	
    table.insert(optionsTable, {
		type = "checkbox",
		name = string.format("\t\t\t%s", GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_ENCHANTMENT)),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_ENCHANTMENT_DESC),
		getFunc = function() return EnglishTooltips.savedVars.equipmentenchantment end,
		setFunc = function(value) EnglishTooltips.savedVars.equipmentenchantment = value end,
		disabled = function() return not EnglishTooltips.savedVars.showequipment end,
		default = false,
    })
	
    table.insert(optionsTable, {
		type = "checkbox",
		name = string.format("\t\t\t%s", GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_ENCHANTMENT_COLOR)),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_ENCHANTMENT_COLOR_DESC),
		getFunc = function() return EnglishTooltips.savedVars.equipmentenchantcolor end,
		setFunc = function(value) EnglishTooltips.savedVars.equipmentenchantcolor = value end,
		disabled = function() return not EnglishTooltips.savedVars.showequipment or not EnglishTooltips.savedVars.equipmentenchantment end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = string.format("\t\t\t%s", GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_TRAIT)),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_EQUIPMENT_TRAIT_DESC),
		getFunc = function() return EnglishTooltips.savedVars.equipmenttraits end,
		setFunc = function(value) EnglishTooltips.savedVars.equipmenttraits = value end,
		disabled = function() return not EnglishTooltips.savedVars.showequipment end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_CHAMPION_POINTS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_CHAMPION_POINTS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showchampiontooltip end,
		setFunc = function(value) EnglishTooltips.savedVars.showchampiontooltip = value end,
		default = true,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_ABILITIES),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_ABILITIES_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showabilitytooltip end,
		setFunc = function(value) EnglishTooltips.savedVars.showabilitytooltip = value end,
		default = true,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_MATERIALS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_MATERIALS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showmaterials end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showmaterials = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_ARMOR_TRAIT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_WEAPON_TRAIT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_RAW_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_STYLE_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_BLACKSMITHING_BOOSTER] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_BLACKSMITHING_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_BLACKSMITHING_RAW_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CLOTHIER_BOOSTER] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CLOTHIER_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CLOTHIER_RAW_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_ENCHANTING_RUNE_ASPECT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_ENCHANTING_RUNE_ESSENCE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_ENCHANTING_RUNE_POTENCY] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_INGREDIENT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_REAGENT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_POISON_BASE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_POTION_BASE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRYCRAFTING_BOOSTER] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRYCRAFTING_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRY_RAW_TRAIT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_JEWELRY_TRAIT] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_WOODWORKING_BOOSTER] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_WOODWORKING_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_WOODWORKING_RAW_MATERIAL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_FURNISHING_MATERIAL] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_GLYPH),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_GLYPH_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showglyphs end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showglyphs = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_GLYPH_ARMOR] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_GLYPH_JEWELRY] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_GLYPH_WEAPON] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_CONSUMABLE),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_CONSUMABLE_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showconsumable end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showconsumable = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_POISON] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_POTION] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_FOOD),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_FOOD_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showfood end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showfood = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_FOOD] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_DRINK] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_TROPHIES),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_TROPHIES_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showtrophies end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showtrophies = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_TROPHY] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CONTAINER] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_CRAFTING_MOTIFS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_CRAFTING_MOTIFS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showmotifs end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showmotifs = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_RACIAL_STYLE_MOTIF] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_FURNISHING),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_FURNISHING_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showfurnishings end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showfurnishings = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_FURNISHING] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_RECIPES),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_RECIPES_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showrecipes end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showrecipes = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_RECIPE] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_MASTER_WRITS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_MASTER_WRITS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showmasterwrits end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showmasterwrits = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_MASTER_WRIT] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_PVP),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_PVP_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showpvp end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showpvp = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_SIEGE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_AVA_REPAIR] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_RECALL_STONE] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_CROWN_ITEMS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_CROWN_ITEMS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showcrownitems end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showcrownitems = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CROWN_ITEM] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_CROWN_REPAIR] = value
		end,
		default = false,
    })

    table.insert(optionsTable, {
		type = "checkbox",
		name = GetString(SI_ENGLISHTOOLTIPS_MISCELLANEOUS),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_MISCELLANEOUS_DESC),
		getFunc = function() return EnglishTooltips.savedVars.showmiscellaneous end,
		setFunc = function(value)
			EnglishTooltips.savedVars.showmiscellaneous = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_COLLECTIBLE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_TOOL] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_SOUL_GEM] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_FISH] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_LURE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_TREASURE] = value
			EnglishTooltips.savedVars.showitemtype[ITEMTYPE_TRASH] = value
		end,
		default = false,
    })

	table.insert(optionsTable, {
		type = "header",
		name = GetString(SI_ENGLISHTOOLTIPS_UPDATE_BUTTON),
	})
 
 	table.insert(optionsTable, {
		type = "description",
		text = GetString(SI_ENGLISHTOOLTIPS_UPDATE_BUTTON_DESC),
		width = "half",
	})

	table.insert(optionsTable, {
		type = "button",
		name = GetString(SI_ENGLISHTOOLTIPS_UPDATE_BUTTON),
		tooltip = GetString(SI_ENGLISHTOOLTIPS_UPDATE_BUTTON_DESC),
        func = function()
			EnglishTooltips.savedVars.isUpdateNeeded = true
			EnglishTooltips.savedVars.isUpdateCompleted = false
			EnglishTooltips.savedVars.language = zo_strformat("<<z:1>>", GetCVar("language.2"))
			SetCVar("language.2", "en")
		end,
		warning = GetString(SI_ENGLISHTOOLTIPS_UPDATE_BUTTON_WARNING),
		width = "half",
    })

    LAM:RegisterOptionControls(EnglishTooltips.menuName, optionsTable)
end
