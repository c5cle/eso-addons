-- Title: English Tooltips
-- Author: Crunatus
-- Description: Display english names in tooltips if you play in the different language

EnglishTooltips = {
    name = "EnglishTooltips",
    author = "Crunatus",
	version = "1.7.1",
	displayName = "中英名词显示工具",
	menuName = "中英名词显示工具",
	savedVars = {
		language = "",
		APIVersion = 0,
		isUpdateNeeded = false,
		isUpdateCompleted = false,
		Data = {
			Abilities = {},		-- Skills and Champion Abilities names
			Traits = {},			-- SI_ITEMTRAITTYPE
			Items =  {},			-- Full item name
			Sets = {},				-- Name of item set
		},
		tooltipformat = zo_strformat("<<Z:1>> (EN)", GetCVar("language.2")),
		onnewline = false,
		showequipment = true,
		equipmentsetinsteadname = false,
		equipmentenchantment = true,
		equipmentenchantcolor = false,
		equipmenttraits = true,
		showchampiontooltip = true,
		showabilitytooltip = true,
		showitemtype = {
			[ITEMTYPE_ARMOR] = true,
			[ITEMTYPE_WEAPON] = true,
			[ITEMTYPE_ARMOR_TRAIT] = false,	-- Materials
			[ITEMTYPE_WEAPON_TRAIT] = false,
			[ITEMTYPE_RAW_MATERIAL] = false,
			[ITEMTYPE_STYLE_MATERIAL] = false,
			[ITEMTYPE_BLACKSMITHING_BOOSTER] = false,
			[ITEMTYPE_BLACKSMITHING_MATERIAL] = false,
			[ITEMTYPE_BLACKSMITHING_RAW_MATERIAL] = false,
			[ITEMTYPE_CLOTHIER_BOOSTER] = false,
			[ITEMTYPE_CLOTHIER_MATERIAL] = false,
			[ITEMTYPE_CLOTHIER_RAW_MATERIAL] = false,
			[ITEMTYPE_ENCHANTING_RUNE_ASPECT] = false,
			[ITEMTYPE_ENCHANTING_RUNE_ESSENCE] = false,
			[ITEMTYPE_ENCHANTING_RUNE_POTENCY] = false,
			[ITEMTYPE_INGREDIENT] = false,
			[ITEMTYPE_REAGENT] = false,
			[ITEMTYPE_POISON_BASE] = false,
			[ITEMTYPE_POTION_BASE] = false,
			[ITEMTYPE_JEWELRYCRAFTING_BOOSTER] = false,
			[ITEMTYPE_JEWELRYCRAFTING_MATERIAL] = false,
			[ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER] = false,
			[ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL] = false,
			[ITEMTYPE_JEWELRY_RAW_TRAIT] = false,
			[ITEMTYPE_JEWELRY_TRAIT] = false,
			[ITEMTYPE_WOODWORKING_BOOSTER] = false,
			[ITEMTYPE_WOODWORKING_MATERIAL] = false,
			[ITEMTYPE_WOODWORKING_RAW_MATERIAL] = false,
			[ITEMTYPE_FURNISHING_MATERIAL] = false,
			[ITEMTYPE_GLYPH_ARMOR] = false,	-- Glyph
			[ITEMTYPE_GLYPH_JEWELRY] = false,
			[ITEMTYPE_GLYPH_WEAPON] = false,
			[ITEMTYPE_POISON] = false,		-- Consumable
			[ITEMTYPE_POTION] = false,
			[ITEMTYPE_FOOD] = false,		-- Food
			[ITEMTYPE_DRINK] = false,
			[ITEMTYPE_TROPHY] = false,		-- Trophy
			[ITEMTYPE_CONTAINER] = false,
			[ITEMTYPE_RACIAL_STYLE_MOTIF] = false,		-- Crafting Motifs
			[ITEMTYPE_FURNISHING] = false,			-- Furnishing
			[ITEMTYPE_RECIPE] = false,		-- Recipes
			[ITEMTYPE_MASTER_WRIT] = false, 		-- Master Writs
			[ITEMTYPE_SIEGE] = false,						-- PvP
			[ITEMTYPE_AVA_REPAIR] = false,
			[ITEMTYPE_RECALL_STONE] = false,			
			[ITEMTYPE_CROWN_ITEM] = false,			-- Crown Items
			[ITEMTYPE_CROWN_REPAIR] = false,
			[ITEMTYPE_COLLECTIBLE] = false,		-- Miscellaneous
			[ITEMTYPE_TOOL] = false,
			[ITEMTYPE_SOUL_GEM] = false,
			[ITEMTYPE_FISH] = false,
			[ITEMTYPE_LURE] = false,
			[ITEMTYPE_TREASURE] = false,
			[ITEMTYPE_TRASH] = false,
		},
		showmaterials = false,
		showglyphs = false,
		showconsumable = false,
		showfood = false,
		showtrophies = false,
		showmotifs = false,
		showfurnishings = false,
		showrecipes = false,
		showmasterwrits = false,
		showpvp = false,
		showcrownitems = false,
		showmiscellaneous = false,
	},
}

-- Local variables
local defaultTooltipItemName = GetString(SI_TOOLTIP_ITEM_NAME)	-- "<<C:1>>"
local defaultEnchantHeader = GetString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER)		--  "Enchantment"
local defaultEnchantHeaderMultiEffect = GetString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_MULTI_EFFECT)	-- "Multi-Effect Enchantment"
local defaultEnchantHeaderNamed = GetString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED)		--  "<<1>> Enchantment"
local defaultItemTraitWithIconHeader = GetString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER)	-- "<<1>> <<2>>"
local defaultAbilityTooltipName = GetString(SI_ABILITY_TOOLTIP_NAME)		-- "<<1>>"
local defaultAbilityNameAndRank = GetString(SI_ABILITY_NAME_AND_RANK)	-- "<<1>> <<R:2>>"

----------------------------------------
-- Item Tooltip
----------------------------------------
local function GetWornItemLink(equipSlot)
	return GetItemLink(BAG_WORN, equipSlot)
end

-- GetEnchantQuality(string itemLink)
-- Returns: number ITEM_QUALITY
local function GetEnchantQuality(itemLink)
	local itemType = GetItemLinkItemType(itemLink)
	if itemType == ITEMTYPE_ARMOR or itemType == ITEMTYPE_WEAPON then
		local itemId, itemIdSub, enchantSub = itemLink:match("|H[^:]+:item:([^:]+):([^:]+):[^:]+:[^:]+:([^:]+):")
	
		if (tonumber(enchantSub) ~= 0) then
			itemLink = ZO_LinkHandler_CreateLink('', nil, ITEM_LINK_TYPE, itemId, enchantSub, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 10000, 0)
		end
			
		local quality = GetItemLinkQuality(itemLink)
		return quality
	end
end

-- GetInfoByItemLink(string itemLink)
-- Returns information about the set if the itemlink provides is a set item
-- Returns: string itemName, string enchantName, string traitName
local function GetInfoByItemLink(itemLink)
	local itemName, enchantName, traitName
	local itemId = GetItemLinkItemId(itemLink)
	local itemType = GetItemLinkItemType(itemLink)
	local settings = EnglishTooltips.savedVars
	
	-- If the item is disabled in the settings, it is skipped
	if settings.showitemtype[itemType] then
		if settings.Data.Items[itemType] then
			itemName = settings.Data.Items[itemType][itemId]					-- "Blessed Thistle"
		end
		
		-- Something wrong, item not found in the database
		if itemName == nil then return end
		
		local hasSet, _, _, _, _, setId = GetItemLinkSetInfo(itemLink, false)
		
		if not hasSet then
			if itemType == ITEMTYPE_ARMOR then
				-- Add prefix for the Armor (Rawhide, Hide, ...)
				itemName = string.format(itemName, EnglishTooltips.GetPrefixForArmor(itemLink))
				
			elseif itemType == ITEMTYPE_WEAPON then
				-- Add prefix for the Weapon (Iron, Steel, ...)
				itemName = string.format(itemName, EnglishTooltips.GetPrefixForWeapon(itemLink))
				
			elseif itemType == ITEMTYPE_GLYPH_WEAPON or itemType == ITEMTYPE_GLYPH_ARMOR or itemType == ITEMTYPE_GLYPH_JEWELRY then
				-- Add prefix for the Glyph (Superb, Truly Superb, ...)
				itemName = string.format(itemName, EnglishTooltips.GetPrefixForGlyph(itemLink))
				
			elseif itemType == ITEMTYPE_POTION then
				-- Add prefix for the potion (Sip of, Tincture of, ...)
				itemName = string.format(itemName, EnglishTooltips.GetPrefixForPotion(itemLink))
				
			elseif itemType == ITEMTYPE_POISON then
				-- Add postfix for the poison (I, II, ...)
				itemName = string.format(itemName, EnglishTooltips.GetAffixForPoison(itemLink))
			end
		else
			-- Part of the set items
			local setName = settings.Data.Sets[setId]		-- "Elf Bane"
			itemName = (settings.equipmentsetinsteadname == true and settings.tooltipformat ~= "EN") and setName or itemName
		end

		enchantName = EnglishTooltips.GetEnchantmentNameByItemLink(itemLink)		-- "Absorb Magicka"
		if settings.showequipment == true and not settings.equipmentenchantment then
			enchantName = nil
		end
		
		local traitType = GetItemLinkTraitInfo(itemLink)
		traitName = settings.Data.Traits[traitType]		-- "Divines"
		if settings.showequipment == true and not settings.equipmenttraits then
			traitName = nil
		end
	end
	
	return itemName, enchantName, traitName
end

local function ModifyItemTooltip(itemLink, itemName, enchantName, traitName)
	local settings = EnglishTooltips.savedVars
	
	if itemName then
		if (settings.tooltipformat == "EN") then
			SafeAddString(SI_TOOLTIP_ITEM_NAME, string.format("%s", itemName), 2)
		else
			if settings.onnewline then
				SafeAddString(SI_TOOLTIP_ITEM_NAME, string.format("<<C:1>>\n(%s)", itemName), 2)
			else
				SafeAddString(SI_TOOLTIP_ITEM_NAME, string.format("<<C:1>> (%s)", itemName), 2)
			end
		end
	end

	if enchantName then
		local enchantquality = settings.equipmentenchantcolor and GetEnchantQuality(itemLink) or ITEM_QUALITY_NORMAL
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER, GetItemQualityColor(enchantquality):Colorize(defaultEnchantHeader), 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_MULTI_EFFECT, GetItemQualityColor(enchantquality):Colorize(defaultEnchantHeaderMultiEffect), 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, GetItemQualityColor(enchantquality):Colorize(defaultEnchantHeaderNamed), 2)
	
		if (settings.tooltipformat == "EN") then
			SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER, GetItemQualityColor(enchantquality):Colorize("Enchantment"), 2)
			SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_MULTI_EFFECT, GetItemQualityColor(enchantquality):Colorize("Multi-Effect Enchantment"), 2)
			SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, GetItemQualityColor(enchantquality):Colorize(string.format("%s Enchantment", enchantName)), 2)
		else
			if settings.onnewline then
				SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED,
					GetItemQualityColor(enchantquality):Colorize(string.format("%s\n(%s)", defaultEnchantHeaderNamed, enchantName)), 2)
			else
				SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED,
					GetItemQualityColor(enchantquality):Colorize(string.format("%s (%s)", defaultEnchantHeaderNamed, enchantName)), 2)
			end
		end
	end

	if traitName then
		if (settings.tooltipformat == "EN") then
			SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, string.format("<<1>> %s", traitName), 2)
		else
			if settings.onnewline then
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, string.format("<<1>> <<2>>\n(%s)", traitName), 2)
			else
				SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, string.format("<<1>> <<2>> (%s)", traitName), 2)
			end
		end
	end
end

----------------------------------------
-- Item Tooltip
----------------------------------------
local function ItemTooltipHook(tooltipControl, method, linkFunc)
	local previousMethod = tooltipControl[method]
	
	tooltipControl[method] = function(self, ...)
		local itemLink = linkFunc(...)
		local itemName, enchantName, traitName = GetInfoByItemLink(itemLink)

		if itemName then
			ModifyItemTooltip(itemLink, itemName, enchantName, traitName)
		end
		
		local result = previousMethod(self, ...)
		SafeAddString(SI_TOOLTIP_ITEM_NAME, defaultTooltipItemName, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER, defaultEnchantHeader, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_MULTI_EFFECT, defaultEnchantHeaderMultiEffect, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, defaultEnchantHeaderNamed, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, defaultItemTraitWithIconHeader, 2)
		
		return result
	end
end

-- Compare inventory's item with equipped sets 
local function ComparativeTooltipHook(tooltip, gameDataType, ...)
	if gameDataType == TOOLTIP_GAME_DATA_EQUIPPED_INFO then
		local itemLink = GetWornItemLink(...)
		local itemName, enchantName, traitName = GetInfoByItemLink(itemLink)
		
		if itemName then
			ModifyItemTooltip(itemLink, itemName, enchantName, traitName)
		end
		
	elseif gameDataType == TOOLTIP_GAME_DATA_STOLEN then
		SafeAddString(SI_TOOLTIP_ITEM_NAME, defaultTooltipItemName, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER, defaultEnchantHeader, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_MULTI_EFFECT, defaultEnchantHeaderMultiEffect, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ENCHANT_HEADER_NAMED, defaultEnchantHeaderNamed, 2)
		SafeAddString(SI_ITEM_FORMAT_STR_ITEM_TRAIT_WITH_ICON_HEADER, defaultItemTraitWithIconHeader, 2)
	end
end

----------------------------------------
-- Champion Ability Tooltip
----------------------------------------
local function ChampionTooltipHook(tooltipControl, method, linkFunc)
	local previousMethod = tooltipControl[method]
	
	tooltipControl[method] = function(self, ...)
		local settings = EnglishTooltips.savedVars
		
		if settings.showchampiontooltip then
			local abilityId = linkFunc(...)
			local abilityName = settings.Data.Abilities[abilityId]
			
			if abilityName then
				if settings.tooltipformat == "EN" then
					SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("%s", abilityName), 2)
				else
					if settings.onnewline then
						SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("<<1>>\n(%s)", abilityName), 2)
					else
						SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("<<1>> (%s)", abilityName), 2)
					end
				end
			end
		end
		
		local result = previousMethod(self, ...)
		SafeAddString(SI_ABILITY_TOOLTIP_NAME, defaultAbilityTooltipName, 2)
		return result
	end
end

----------------------------------------
-- Ability Tooltip
----------------------------------------
local function SkillTooltipHook(tooltipControl, method, linkFunc)
	local previousMethod = tooltipControl[method]
	
	tooltipControl[method] = function(self, ...)
		local settings = EnglishTooltips.savedVars
		
		if settings.showabilitytooltip then
			local abilityId = linkFunc(...)
			local abilityName = settings.Data.Abilities[abilityId]
			
			if abilityName then
				if settings.tooltipformat == "EN" then
					SafeAddString(SI_ABILITY_NAME_AND_RANK, string.format("%s <<R:2>>", abilityName), 2)
					SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("%s", abilityName), 2)
				else
					if settings.onnewline then
						SafeAddString(SI_ABILITY_NAME_AND_RANK, string.format("<<1>> <<R:2>>\n(%s)", abilityName), 2)
						SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("<<1>>\n(%s)", abilityName), 2)
					else
						SafeAddString(SI_ABILITY_NAME_AND_RANK, string.format("<<1>> <<R:2>> (%s)", abilityName), 2)
						SafeAddString(SI_ABILITY_TOOLTIP_NAME, string.format("<<1>> (%s)", abilityName), 2)
					end
				end
			end
		end
		
		local result = previousMethod(self, ...)
		SafeAddString(SI_ABILITY_NAME_AND_RANK, defaultAbilityNameAndRank, 2)
		SafeAddString(SI_ABILITY_TOOLTIP_NAME, defaultAbilityTooltipName, 2)
		return result
	end
end

local function Initialize()
	-- Armor, Weapons and Items tooltip
	ItemTooltipHook(ItemTooltip, "SetAttachedMailItem", GetAttachedItemLink)
	ItemTooltipHook(ItemTooltip, "SetBagItem", GetItemLink)
	ItemTooltipHook(ItemTooltip, "SetBuybackItem", GetBuybackItemLink)
	ItemTooltipHook(ItemTooltip, "SetLink", function(...) return ... end)
	ItemTooltipHook(ItemTooltip, "SetLootItem", GetLootItemLink)
	ItemTooltipHook(ItemTooltip, "SetStoreItem", GetStoreItemLink)
	ItemTooltipHook(ItemTooltip, "SetTradeItem", GetTradeItemLink)
    ItemTooltipHook(ItemTooltip, "SetTradingHouseItem", GetTradingHouseSearchResultItemLink)
    ItemTooltipHook(ItemTooltip, "SetTradingHouseListing", GetTradingHouseListingItemLink)	
	ItemTooltipHook(ItemTooltip, "SetWornItem", GetWornItemLink)
    ItemTooltipHook(ItemTooltip, "SetQuestReward", GetQuestRewardItemLink)
	ItemTooltipHook(PopupTooltip, "SetLink", function(...) return ... end)
	ItemTooltipHook(ItemTooltip, "SetItemUsingEnchantment", GetEnchantedItemResultingItemLink)
	ItemTooltipHook(ItemTooltip, "SetAction", GetSlotItemLink)
	ItemTooltipHook(ItemTooltip, "SetItemSetCollectionPieceLink", function(...) return ... end)
	
	ZO_PreHookHandler(ComparativeTooltip1, "OnAddGameData", ComparativeTooltipHook)
	ZO_PreHookHandler(ComparativeTooltip2, "OnAddGameData", ComparativeTooltipHook)
	
	-- Tooltip at the Craft Station
    ItemTooltipHook(ZO_AlchemyTopLevelTooltip, "SetPendingAlchemyItem", GetAlchemyResultingItemLink)
	ItemTooltipHook(ZO_EnchantingTopLevelTooltip, "SetPendingEnchantingItem", GetEnchantingResultingItemLink)
	ItemTooltipHook(ZO_ProvisionerTopLevelTooltip, "SetProvisionerResultItem", GetRecipeResultItemLink)
	ItemTooltipHook(ZO_SmithingTopLevelCreationPanelResultTooltip, "SetPendingSmithingItem", GetSmithingPatternResultLink)
	ItemTooltipHook(ZO_SmithingTopLevelImprovementPanelResultTooltip, "SetSmithingImprovementResult", GetSmithingImprovedItemLink)
	ItemTooltipHook(ZO_RetraitStation_KeyboardTopLevelRetraitPanelResultTooltip, "SetPendingRetraitItem", GetResultingItemLinkAfterRetrait)
	ItemTooltipHook(ZO_RetraitStation_KeyboardTopLevelRetraitPanelResultTooltip, "SetBagItem", GetItemLink)
	ItemTooltipHook(ZO_RetraitStation_KeyboardTopLevelReconstructPanelOptionsPreviewTooltip, "SetItemSetCollectionPieceLink", function(...) return ... end)
	ItemTooltipHook(ItemTooltip, "SetItemUsingEnchantment", GetEnchantedItemResultingItemLink)
	
	-- Champion Abilities tooltip
	ChampionTooltipHook(ChampionSkillTooltip, "SetChampionSkill", GetChampionAbilityId)

	-- Skills tooltip
	SkillTooltipHook(SkillTooltip, "SetActiveSkill", function(skillType, skillLineIndex, skillIndex, morphChoice)
		return GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, morphChoice, 1)
	end)
	
	SkillTooltipHook(SkillTooltip, "SetPassiveSkill", function(skillType, skillLineIndex, skillIndex)
		return GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, 0, 1)
	end)
	
	SkillTooltipHook(SkillTooltip, "SetSkillAbility", function(skillType, skillLineIndex, skillIndex)
		return GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, 0, 1)
	end)
	
	-- Third-party Compatibility
	
	-- Tamriel Trade Centre 3.34.241.84230 patch
	if TamrielTradeCentre then
		TamrielTradeCentre_ItemInfo = TamrielTradeCentre_ItemInfo or {}
		ZO_PreHook(TamrielTradeCentre_ItemInfo, "New", function() SafeAddString(SI_TOOLTIP_ITEM_NAME, defaultTooltipItemName, 2) end)
	
		TamrielTradeCentre_MasterWritInfo = TamrielTradeCentre_MasterWritInfo or {}
		ZO_PreHook(TamrielTradeCentre_MasterWritInfo, "New", function() SafeAddString(SI_TOOLTIP_ITEM_NAME, defaultTooltipItemName, 2) end)
	end
	
	-- Item Set Browser 4.0.1 Addon Tooltip
	if ItemBrowser then
		ItemTooltipHook(ExtendedJournalItemTooltip, "SetLink", function(...) return ... end)
	end

	-- Wish List Addon 2.95 Tooltip
	if WishList then
		ItemTooltipHook(WishListTooltip, "SetLink", function(...) return ... end)
	end

end

local function OnActivated(eventCode)
    EVENT_MANAGER:UnregisterForEvent(EnglishTooltips.name, EVENT_PLAYER_ACTIVATED)

	-- Update database, and save data
	if EnglishTooltips.savedVars.isUpdateNeeded then
		EnglishTooltips.Update()
		EnglishTooltips.savedVars.isUpdateNeeded = false
		EnglishTooltips.savedVars.isUpdateCompleted = true
		EnglishTooltips.savedVars.APIVersion = GetAPIVersion()
		ReloadUI("ingame")
	end
	
	-- Restore the original language after the update
	if EnglishTooltips.savedVars.isUpdateCompleted then
		EnglishTooltips.savedVars.isUpdateCompleted = false
		SetCVar("language.2", EnglishTooltips.savedVars.language)
	end

	-- Set default language in settings menu
	if EnglishTooltips.savedVars.tooltipformat ~= "EN" then
		EnglishTooltips.savedVars.tooltipformat = zo_strformat("<<Z:1>> (EN)", GetCVar("language.2"))
	end

	-- Check the version change
	if EnglishTooltips.savedVars.APIVersion ~= GetAPIVersion() then
		d(GetString(SI_ENGLISHTOOLTIPS_UPDATE_MSG))
	end
end

-- When player is ready, after everything has been loaded.
EVENT_MANAGER:RegisterForEvent(EnglishTooltips.name, EVENT_PLAYER_ACTIVATED, OnActivated)

local function OnLoaded(eventCode, addonName)
	if addonName == EnglishTooltips.name then
		EVENT_MANAGER:UnregisterForEvent(addonName, EVENT_ADD_ON_LOADED)
	
		-- Load saved variables
		EnglishTooltips.savedVars = ZO_SavedVars:NewAccountWide("EnglishTooltipsSavedVariables", 1, nil, EnglishTooltips.savedVars)
		
		-- Skip english
		if GetCVar("language.2") == "en" then
			return
		end
		
		-- Create options menu
		EnglishTooltips.OptionsMenu()

		Initialize()
	end
end

-- When any addon is loaded, but before UI (Chat) is loaded.
EVENT_MANAGER:RegisterForEvent(EnglishTooltips.name, EVENT_ADD_ON_LOADED, OnLoaded)
