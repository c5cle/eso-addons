----------------------------------------
-- Utility functions
----------------------------------------

-- Prefix for Potion
-- GetPrefixForPotion(string itemLink)
-- Crafted item level is tied to required crafting level
-- Looted item level is tied to your character level when you find them
-- Returns: string prefix
function EnglishTooltips.GetPrefixForPotion(itemLink)
	local potionPrefix = {
		[1] = "Sip of",
		[7] = "Tincture of",
		[12] = "Serum of",
		[16] = "Dram of",
		[21] = "Effusion of",
		[26] = "Potion of",
		[31] = "Draught of",
		[36] = "Solution of",
		[41] = "Philter of",
		[46] = "Elixir of",
		[100] = "Panacea of",
		[150] = "Distilate of",
		[200] = "Essence of",
	}

	local prefix = ""
	local requiedLevel = GetItemLinkRequiredLevel(itemLink)+GetItemLinkRequiredChampionPoints(itemLink)
	
	local i = 1
	for k, _ in pairs(potionPrefix) do
		if tonumber(k) <= requiedLevel then
			i = math.max(i, tonumber(k))
		end
	end
	prefix = potionPrefix[i]

	return prefix
end

-- Affix for Poison
-- GetAffixForPoison(string itemLink)
-- Crafted item level is tied to required crafting level
-- Looted item level is tied to your character level when you find them
-- Returns: string affix
function EnglishTooltips.GetAffixForPoison(itemLink)
	local poisonAffix = {
		[1] = "I",
		[10] = "II",
		[20] = "III",
		[30] = "IV",
		[40] = "V",
		[60] = "VI",
		[100] = "VII",
		[150] = "VIII",
		[200] = "IX",
	}

	local affix = ""
	local requiedLevel = GetItemLinkRequiredLevel(itemLink)+GetItemLinkRequiredChampionPoints(itemLink)
	
	local i = 1
	for k, _ in pairs(poisonAffix) do
		if tonumber(k) <= requiedLevel then
			i = math.max(i, tonumber(k))
		end
	end
	affix = poisonAffix[i]
	
	return affix
end

-- GetPrefixForGlyph(itemLink)
-- Returns: string prefix
function EnglishTooltips.GetPrefixForGlyph(itemLink)
	local glyphPrefix = {
		[1] = "Trifling",
		[5] = "Inferior",
		[10] = "Petty",
		[15] = "Slight",
		[20] = "Minor",
		[25] = "Lesser",
		[30] = "Moderate",
		[35] = "Average",
		[40] = "Strong",
		[60] = "Major",
		[80] = "Greater",
		[100] = "Grand",
		[120] = "Splendid",
		[150] = "Monumental",
		[200] = "Superb",
		[210] = "Truly Superb",
	}
	
	local prefix = ""
	local requiedLevel = GetItemLinkRequiredLevel(itemLink)+GetItemLinkRequiredChampionPoints(itemLink)
	
	local i = 1
	for k, _ in pairs(glyphPrefix) do
		if tonumber(k) <= requiedLevel then
			i = math.max(i, tonumber(k))
		end
	end
	prefix = glyphPrefix[i]

	return prefix
end

-- GetPrefixForWeapon(string itemLink)
-- Returns: string prefix
function EnglishTooltips.GetPrefixForWeapon(itemLink)
	local weaponPrefix = {
		[CRAFTING_TYPE_BLACKSMITHING] = 
		{
			[1] = "Iron",
			[16] = "Steel",
			[26] = "Orichalc",
			[36] = "Dwarwen",
			[46] = "Ebon",
			[60] = "Calcinium",
			[90] = "Galatite",
			[120] = "Quicksilver",
			[140] = "Voidsteel",
			[200] = "Rubedite",
		},
		[CRAFTING_TYPE_WOODWORKING] = 
		{
			[1] = "Maple",
			[16] = "Oak",
			[26] = "Beech",
			[36] = "Hickory",
			[46] = "Yew",
			[60] = "Birch",
			[90] = "Ash",
			[120] = "Mahogany",
			[140] = "Nightwood",
			[200] = "Ruby Ash",
		},
	}
	
	local prefix = ""
	local requiedLevel = GetItemLinkRequiredLevel(itemLink)+GetItemLinkRequiredChampionPoints(itemLink)
	local weaponType = GetItemLinkWeaponType(itemLink)
	
	if (weaponType == WEAPONTYPE_AXE) or
		(weaponType == WEAPONTYPE_DAGGER) or
		(weaponType == WEAPONTYPE_SWORD) or
		(weaponType == WEAPONTYPE_HAMMER) or 
		(weaponType == WEAPONTYPE_TWO_HANDED_AXE) or
		(weaponType == WEAPONTYPE_TWO_HANDED_SWORD) or
		(weaponType == WEAPONTYPE_TWO_HANDED_HAMMER) then
			local i = 1
			for k, _ in pairs(weaponPrefix[CRAFTING_TYPE_BLACKSMITHING]) do
				if tonumber(k) <= requiedLevel then
					i = math.max(i, tonumber(k))
				end
			end
			prefix = weaponPrefix[CRAFTING_TYPE_BLACKSMITHING][i]
		
	elseif (weaponType == WEAPONTYPE_BOW) or
		(weaponType == WEAPONTYPE_HEALING_STAFF) or
		(weaponType == WEAPONTYPE_FIRE_STAFF) or
		(weaponType == WEAPONTYPE_FROST_STAFF) or
		(weaponType == WEAPONTYPE_LIGHTNING_STAFF) or
		(weaponType == WEAPONTYPE_SHIELD) then
			local i = 1
			for k, _ in pairs(weaponPrefix[CRAFTING_TYPE_WOODWORKING]) do
				if tonumber(k) <= requiedLevel then
					i = math.max(i, tonumber(k))
				end
			end
			prefix = weaponPrefix[CRAFTING_TYPE_WOODWORKING][i]
	end
	
	return prefix
end
	
-- GetPrefixForArmor(string itemLink)
-- Returns: string prefix
function EnglishTooltips.GetPrefixForArmor(itemLink)
	local armorPrefix = {
		[ARMORTYPE_NONE] = {
			[1] = "Pewter",
			[26] = "Copper",
			[60] = "Silver",
			[130] = "Electrum",
			[200] = "Platinum",
		},
		[ARMORTYPE_LIGHT] = {
			[1] = "Homespun",
			[16] = "Linen",
			[26] = "Cotton",
			[36] = "Spidersilk",
			[46] = "Ebonthread",
			[60] = "Kresh",
			[90] = "Ironthread",
			[120] = "Silverweave",
			[140] = "Shadowspun",
			[200] = "Ancestor Silk",
		},
		[ARMORTYPE_MEDIUM] = {
			[1] = "Rawhide",
			[16] = "Hide",
			[26] = "Leather",
			[36] = "Full-Leather",
			[46] = "Fell",
			[60] = "Brigandine",
			[90] = "Ironhide",
			[120] = "Suberb",
			[140] = "Shadowhide",
			[200] = "Rubedo Leather",
		},
		[ARMORTYPE_HEAVY] = {
			[1] = "Iron",
			[16] = "Steel",
			[26] = "Orichalc",
			[36] = "Dwarwen",
			[46] = "Ebon",
			[60] = "Calcinium",
			[90] = "Galatite",
			[120] = "Quicksilver",
			[140] = "Voidsteel",
			[200] = "Rubedite",
		},
	}

	local prefix = ""
	local requiedLevel = GetItemLinkRequiredLevel(itemLink)+GetItemLinkRequiredChampionPoints(itemLink)
	local armorType = GetItemLinkArmorType(itemLink)

	local i = 1
	for k, _ in pairs(armorPrefix[armorType]) do
		if tonumber(k) <= requiedLevel then
			i = math.max(i, tonumber(k))
		end
	end
	prefix = armorPrefix[armorType][i]
			
	return prefix
end

-- The names of the enchants and the enchants category name are different, so we specify them directly
function EnglishTooltips.GetEnchantmentNameByItemLink(itemLink)
	local enchantmentsList = {
		[ENCHANTMENT_SEARCH_CATEGORY_ABSORB_HEALTH] = "Life Drain",
		[ENCHANTMENT_SEARCH_CATEGORY_ABSORB_MAGICKA] = "Absorb Magicka",
		[ENCHANTMENT_SEARCH_CATEGORY_ABSORB_STAMINA] = "Absorb Stamina",
		[ENCHANTMENT_SEARCH_CATEGORY_BEFOULED_WEAPON] = "Befouled Weapon",
		[ENCHANTMENT_SEARCH_CATEGORY_INCREASE_SPELL_DAMAGE] = "Spell Damage",
		[ENCHANTMENT_SEARCH_CATEGORY_BERSERKER] = "Weapon Damage",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_POTION_COOLDOWN] = "Alchemical Amplification",
		[ENCHANTMENT_SEARCH_CATEGORY_PRISMATIC_ONSLAUGHT] = "Prismatic Onslaught",
		[ENCHANTMENT_SEARCH_CATEGORY_PRISMATIC_DEFENSE] = "Multi-Effect",
		[ENCHANTMENT_SEARCH_CATEGORY_CHARGED_WEAPON] = "Charged Weapon",
		[ENCHANTMENT_SEARCH_CATEGORY_DAMAGE_HEALTH] = "Decrease Health",
		[ENCHANTMENT_SEARCH_CATEGORY_DAMAGE_SHIELD] = "Hardening",
		[ENCHANTMENT_SEARCH_CATEGORY_DECREASE_PHYSICAL_DAMAGE] = "Physical Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_DECREASE_SPELL_DAMAGE] = "Spell Damage",
		[ENCHANTMENT_SEARCH_CATEGORY_DISEASE_RESISTANT] = "Disease Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_FIERY_WEAPON] = "Fiery Weapon",
		[ENCHANTMENT_SEARCH_CATEGORY_FIRE_RESISTANT] = "Flame Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_FROST_RESISTANT] = "Frost Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_FROZEN_WEAPON] = "Frozen Weapon",
		[ENCHANTMENT_SEARCH_CATEGORY_HEALTH] = "Maximum Health",
		[ENCHANTMENT_SEARCH_CATEGORY_HEALTH_REGEN] = "Health Recovery",
		[ENCHANTMENT_SEARCH_CATEGORY_INCREASE_BASH_DAMAGE] = "Basing",
		[ENCHANTMENT_SEARCH_CATEGORY_INCREASE_PHYSICAL_DAMAGE] = "Weapon Damage",
		[ENCHANTMENT_SEARCH_CATEGORY_INCREASE_POTION_EFFECTIVENESS] = "Alchemical Amplification",
		[ENCHANTMENT_SEARCH_CATEGORY_MAGICKA] = "Maximum Magicka",
		[ENCHANTMENT_SEARCH_CATEGORY_MAGICKA_REGEN] = "Magicka Recovery",
		[ENCHANTMENT_SEARCH_CATEGORY_POISONED_WEAPON] = "Poisoned Weapon",
		[ENCHANTMENT_SEARCH_CATEGORY_POISON_RESISTANT] = "Poison Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_ARMOR] = "Crusher",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_BLOCK_AND_BASH] = "Bracing",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_FEAT_COST] = "Reduce Stamina Cost",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_POWER] = "Weakening",
		[ENCHANTMENT_SEARCH_CATEGORY_REDUCE_SPELL_COST] = "Reduce Spell Cost",
		[ENCHANTMENT_SEARCH_CATEGORY_SHOCK_RESISTANT] = "Shock Resistance",
		[ENCHANTMENT_SEARCH_CATEGORY_STAMINA] = "Maximum Stamina",
		[ENCHANTMENT_SEARCH_CATEGORY_STAMINA_REGEN] = "Stamina Recovery",
	}
	
	local enchantId = GetEnchantSearchCategoryType(GetItemLinkFinalEnchantId(itemLink))
	return enchantmentsList[enchantId]		-- "Absorb Magicka"
end

-- Update database
function EnglishTooltips.Update()
	EnglishTooltips.savedVars.Data.Abilities = {}
	EnglishTooltips.savedVars.Data.Traits = {}
	EnglishTooltips.savedVars.Data.Items =  {}
	EnglishTooltips.savedVars.Data.Sets = {}

	-- Abilities
    for skillType = 1, SKILL_TYPE_MAX_VALUE do
		for skillLineIndex = 1, GetNumSkillLines(skillType) do
			for skillIndex = 1, GetNumSkillAbilities(skillType, skillLineIndex) do
				local _, _, _, passive = GetSkillAbilityInfo(skillType, skillLineIndex, skillIndex)
				
				if passive then
					for rank = 1, GetNumPassiveSkillRanks(skillType, skillLineIndex, skillIndex) do
						local abilityId = GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, MORPH_SLOT_BASE, rank)
						EnglishTooltips.savedVars.Data.Abilities[abilityId] = GetAbilityName(abilityId)
					end
				else
					for morphChoice = 0, 2 do
						local abilityId = GetSpecificSkillAbilityInfo(skillType, skillLineIndex, skillIndex, morphChoice, 1)
						EnglishTooltips.savedVars.Data.Abilities[abilityId] = GetAbilityName(abilityId)
					end
				end
				
			end
		end
	end
	
	-- Champion Abilities
	for disciplineIndex = 1, GetNumChampionDisciplines() do
		for skillIndex = 1, GetNumChampionDisciplineSkills(disciplineIndex) do
			EnglishTooltips.savedVars.Data.Abilities[GetChampionAbilityId(GetChampionSkillId(disciplineIndex, skillIndex))] = 
				GetChampionSkillName(GetChampionSkillId(disciplineIndex, skillIndex))
		end
	end
	
	-- Traits
	for traitType = 1, 100 do
		local traitName = GetString("SI_ITEMTRAITTYPE", traitType)
		
		if traitName and traitName ~= "" then
			EnglishTooltips.savedVars.Data.Traits[traitType] = traitName
		end
	end

	-- Items
	for itemId = 1, 300000 do
		local itemLink = ZO_LinkHandler_CreateLink('', nil, ITEM_LINK_TYPE, itemId, 364, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		local itemName = GetItemLinkName(itemLink)
		
		if itemName and itemName ~= "" and not string.match(itemName, "_") then
			local itemType = GetItemLinkItemType(itemLink)
			local hasSet, setName, _, _, _, setId = GetItemLinkSetInfo(itemLink)

			if EnglishTooltips.savedVars.Data.Items[itemType] == nil then
				EnglishTooltips.savedVars.Data.Items[itemType] = {}
			end

			if not hasSet then
				if itemType == ITEMTYPE_ARMOR then
					itemName = string.gsub(itemName, "Platinum", "%%s")
					itemName = string.gsub(itemName, "Ancestor Silk", "%%s")
					itemName = string.gsub(itemName, "Rubedo Leather", "%%s")
					itemName = string.gsub(itemName, "Rubedite", "%%s")
					
				elseif itemType == ITEMTYPE_WEAPON then
					itemName = string.gsub(itemName, "Rubedite", "%%s")
					itemName = string.gsub(itemName, "Ruby Ash", "%%s")
					
				elseif itemType == ITEMTYPE_GLYPH_WEAPON or itemType == ITEMTYPE_GLYPH_ARMOR or itemType == ITEMTYPE_GLYPH_JEWELRY then
					itemName = string.gsub(itemName, "Truly Superb", "%%s")
					
				elseif itemType == ITEMTYPE_POTION then
					itemName = string.gsub(itemName, "Essence of", "%%s")
					
				elseif itemType == ITEMTYPE_POISON then
					itemName = string.gsub(itemName, "IX", "%%s")
				end
			else
				EnglishTooltips.savedVars.Data.Sets[setId] = setName
			end
			
			EnglishTooltips.savedVars.Data.Items[itemType][itemId] = ZO_CachedStrFormat("<<z:1>>", itemName)
		end
	end
	
end
