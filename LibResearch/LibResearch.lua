local libName, libVersion = "LibResearch", 42

if _G[libName] ~= nil then d("["..libName.."]This library was already loaded!") return end
local libResearch = {}
libResearch.name = libName
libResearch.version = libVersion

--Global
LIBRESEARCH_REASON_ALREADY_KNOWN	= "AlreadyKnown"
LIBRESEARCH_REASON_WRONG_ITEMTYPE 	= "WrongItemType"
LIBRESEARCH_REASON_ORNATE 			= "Ornate"
LIBRESEARCH_REASON_INTRICATE 		= "Intricate"
LIBRESEARCH_REASON_TRAITLESS 		= "Traitless"

--Crafting types
local BLACKSMITH 		= CRAFTING_TYPE_BLACKSMITHING
local CLOTHIER 			= CRAFTING_TYPE_CLOTHIER
local WOODWORK 			= CRAFTING_TYPE_WOODWORKING
local JEWELRY_CRAFTING 	= CRAFTING_TYPE_JEWELRYCRAFTING

local researchMap = {
	[BLACKSMITH] = {
		WEAPON = {
			[WEAPONTYPE_AXE] = 1,
			[WEAPONTYPE_HAMMER] = 2,
			[WEAPONTYPE_SWORD] = 3,
			[WEAPONTYPE_TWO_HANDED_AXE] = 4,
			[WEAPONTYPE_TWO_HANDED_HAMMER] = 5,
			[WEAPONTYPE_TWO_HANDED_SWORD] = 6,
			[WEAPONTYPE_DAGGER] = 7,
		},
		ARMOR = {
			[EQUIP_TYPE_CHEST] = 8,
			[EQUIP_TYPE_FEET] = 9,
			[EQUIP_TYPE_HAND] = 10,
			[EQUIP_TYPE_HEAD] = 11,
			[EQUIP_TYPE_LEGS] = 12,
			[EQUIP_TYPE_SHOULDERS] = 13,
			[EQUIP_TYPE_WAIST] = 14,
		},
	},
	--normal for light, +7 for medium
	[CLOTHIER] = {
		ARMOR =  {
			[EQUIP_TYPE_CHEST] = 1,
			[EQUIP_TYPE_FEET] = 2,
			[EQUIP_TYPE_HAND] = 3,
			[EQUIP_TYPE_HEAD] = 4,
			[EQUIP_TYPE_LEGS] = 5,
			[EQUIP_TYPE_SHOULDERS] = 6,
			[EQUIP_TYPE_WAIST] = 7,
		},
	},
	[WOODWORK] = {
		WEAPON = {
			[WEAPONTYPE_BOW] = 1,
			[WEAPONTYPE_FIRE_STAFF] = 2,
			[WEAPONTYPE_FROST_STAFF] = 3,
			[WEAPONTYPE_LIGHTNING_STAFF] = 4,
			[WEAPONTYPE_HEALING_STAFF] = 5,
		},
		ARMOR = {
			[EQUIP_TYPE_OFF_HAND] = 6,
		},
	},
	[JEWELRY_CRAFTING] = {
        ARMOR = {
            [EQUIP_TYPE_NECK] = 1,
            [EQUIP_TYPE_RING] = 2,
        },
	}
}

--Mapping of the itemTraitType to the traitIndex 1 ... 9
--  itemTraitType                   traitIndex (1..9)   itemTraitTypeValue
local ItemTraitType2TraitIndex = {
    --Weapons
    [ITEM_TRAIT_TYPE_WEAPON_POWERED]        = 1,        -- 1
    [ITEM_TRAIT_TYPE_WEAPON_CHARGED]        = 2,        -- 2
    [ITEM_TRAIT_TYPE_WEAPON_PRECISE]        = 3,        -- 3
    [ITEM_TRAIT_TYPE_WEAPON_INFUSED]        = 4,        -- 4
    [ITEM_TRAIT_TYPE_WEAPON_DEFENDING]      = 5,        -- 5
    [ITEM_TRAIT_TYPE_WEAPON_TRAINING]       = 6,        -- 6
    [ITEM_TRAIT_TYPE_WEAPON_SHARPENED]      = 7,        -- 7
    [ITEM_TRAIT_TYPE_WEAPON_WEIGHTED]       = 8,        -- 8 --> Old, removed from game and exchanged by ITEM_TRAIT_TYPE_WEAPON_DECISIVE
	[ITEM_TRAIT_TYPE_WEAPON_DECISIVE]       = 8,        -- 8
    [ITEM_TRAIT_TYPE_WEAPON_NIRNHONED]      = 9,        -- 26
    [ITEM_TRAIT_TYPE_WEAPON_INTRICATE]      = LIBRESEARCH_REASON_INTRICATE,        -- 9
    [ITEM_TRAIT_TYPE_WEAPON_ORNATE]         = LIBRESEARCH_REASON_ORNATE,        -- 10

    --Armor
    [ITEM_TRAIT_TYPE_ARMOR_STURDY]          = 1,        -- 11
    [ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE]    = 2,        -- 12
    [ITEM_TRAIT_TYPE_ARMOR_REINFORCED]      = 3,        -- 13
    [ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED]     = 4,        -- 14
    [ITEM_TRAIT_TYPE_ARMOR_TRAINING]        = 5,        -- 15
    [ITEM_TRAIT_TYPE_ARMOR_INFUSED]         = 6,        -- 16
    [ITEM_TRAIT_TYPE_ARMOR_EXPLORATION]     = 7,        -- 17 --> Old, removed from game and exchanged by ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS
    [ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS]      = 7,        -- 17
    [ITEM_TRAIT_TYPE_ARMOR_DIVINES]         = 8,        -- 18
    [ITEM_TRAIT_TYPE_ARMOR_NIRNHONED]       = 9,        -- 25
    [ITEM_TRAIT_TYPE_ARMOR_INTRICATE]       = LIBRESEARCH_REASON_INTRICATE,        -- 20
    [ITEM_TRAIT_TYPE_ARMOR_ORNATE]          = LIBRESEARCH_REASON_ORNATE,        -- 19

    --Jewelry
    [ITEM_TRAIT_TYPE_JEWELRY_ARCANE]        = 1,        -- 22
    [ITEM_TRAIT_TYPE_JEWELRY_HEALTHY]       = 2,        -- 21
    [ITEM_TRAIT_TYPE_JEWELRY_ROBUST]        = 3,        -- 23
    [ITEM_TRAIT_TYPE_JEWELRY_TRIUNE]        = 4,        -- 30
    [ITEM_TRAIT_TYPE_JEWELRY_INFUSED]       = 5,        -- 33
    [ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE]    = 6,        -- 32
    [ITEM_TRAIT_TYPE_JEWELRY_SWIFT]         = 7,        -- 28
    [ITEM_TRAIT_TYPE_JEWELRY_HARMONY]       = 8,        -- 29
    [ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY]  = 9,        -- 31
    [ITEM_TRAIT_TYPE_JEWELRY_INTRICATE]     = LIBRESEARCH_REASON_INTRICATE,        -- 27
    [ITEM_TRAIT_TYPE_JEWELRY_ORNATE]        = LIBRESEARCH_REASON_ORNATE,        -- 24
}

--[[----------------------------------------------------------------------------
	returns true if the character knows or is in the process of researching the
	supplied trait; else returns false.
	there are a few items, given to the character at the very beginning of the
	game, that are traited but unresearchable. these will present bugs when used
	with this function.
--]]----------------------------------------------------------------------------
function libResearch:WillCharacterKnowTrait(craftingSkillType, researchLineIndex, traitIndex)
	local _, _, knows = GetSmithingResearchLineTraitInfo(craftingSkillType, researchLineIndex, traitIndex)
	if knows then return true end
	local willKnow = GetSmithingResearchLineTraitTimes(craftingSkillType, researchLineIndex, traitIndex)
	if willKnow ~= nil then return true end
	return false
end

--[[----------------------------------------------------------------------------
	returns int traitKey, bool isResearchable, string reason
	traitKey will be 0 if item is ornate, intricate, or traitless
	if isResearchable, then reason will be nil otherwise, reason will be:
	"WrongItemType", "Ornate", "Intricate", "Traitless", or "AlreadyKnown"
--]]----------------------------------------------------------------------------
function libResearch:GetItemTraitResearchabilityInfo(itemLink)
	local itemType = GetItemLinkItemType(itemLink)
	if itemType ~= ITEMTYPE_ARMOR and itemType ~= ITEMTYPE_WEAPON then
		return 0, false, LIBRESEARCH_REASON_WRONG_ITEMTYPE
	end

	local craftingSkillType, researchLineIndex, traitIndex = self:GetItemResearchInfo(itemLink)

    local itemEquipType = GetItemLinkEquipType(itemLink)
	-- do this first to catch jewelry
	if traitIndex == LIBRESEARCH_REASON_ORNATE or traitIndex == LIBRESEARCH_REASON_INTRICATE then
		return 0, false, traitIndex
	end
	if researchLineIndex == -1 or craftingSkillType == -1 then
		return 0, false, LIBRESEARCH_REASON_WRONG_ITEMTYPE
	elseif traitIndex == -1 then
		return 0, false, LIBRESEARCH_REASON_TRAITLESS
	end
	if self:WillCharacterKnowTrait(craftingSkillType, researchLineIndex, traitIndex) then
		return self:GetTraitKey(craftingSkillType, researchLineIndex, traitIndex), false, LIBRESEARCH_REASON_ALREADY_KNOWN
	else
		return self:GetTraitKey(craftingSkillType, researchLineIndex, traitIndex), true
	end
end

--returns a trait key that is unique per researchable trait
function libResearch:GetTraitKey(craftingSkillType, researchLineIndex, traitIndex)
	return craftingSkillType * 10000 + researchLineIndex * 100 + traitIndex
end

--[[----------------------------------------------------------------------------
	returns the global enums CRAFTING_TYPE_BLACKSMITHING,
	CRAFTING_TYPE_CLOTHIER, CRAFTING_TYPE_WOODWORKING or CRAFTING_TYPE_JEWELRYCRAFTING
	if applicable. else return -1
--]]----------------------------------------------------------------------------
function libResearch:GetItemCraftingSkill(itemLink)
	local itemType = GetItemLinkItemType(itemLink)
	if itemType == ITEMTYPE_ARMOR then
        local equipType = GetItemLinkEquipType(itemLink)
        if equipType == EQUIP_TYPE_NECK or equipType == EQUIP_TYPE_RING then
            return JEWELRY_CRAFTING
        else
            local armorType = GetItemLinkArmorType(itemLink)
            if armorType == ARMORTYPE_HEAVY then
                return BLACKSMITH
            elseif armorType == ARMORTYPE_LIGHT or armorType == ARMORTYPE_MEDIUM then
                return CLOTHIER
            else
                return -1
            end
        end
	elseif itemType == ITEMTYPE_WEAPON then
		local weaponType = GetItemLinkWeaponType(itemLink)
		if weaponType == WEAPONTYPE_BOW
		  or weaponType == WEAPONTYPE_FIRE_STAFF
		  or weaponType == WEAPONTYPE_FROST_STAFF
		  or weaponType == WEAPONTYPE_HEALING_STAFF
		  or weaponType == WEAPONTYPE_LIGHTNING_STAFF
		  or weaponType == WEAPONTYPE_SHIELD then
			return WOODWORK
		elseif weaponType ~= WEAPONTYPE_NONE and weaponType ~= WEAPONTYPE_RUNE then
			return BLACKSMITH
		else
			return -1
		end
	end
    return -1
end

--[[----------------------------------------------------------------------------
	returns a trait index suitable for feeding to the global functions
	GetSmithingResearchLineTraitInfo() et. al. or returns -1 if no trait exists
--]]----------------------------------------------------------------------------
function libResearch:GetResearchTraitIndex(itemLink)
	local itemTraitType = GetItemLinkTraitInfo(itemLink)
    local traitIndex = ItemTraitType2TraitIndex[itemTraitType] or 0
    if type(traitIndex) == "number" then
        if not (traitIndex >= 1 and traitIndex <= 9) then
            return -1
        end
    end
	return traitIndex
end

--[[----------------------------------------------------------------------------
	returns an index that corresponds to the weapon or armor type within the
	given crafting skill or returns -1 if not applicable
--]]----------------------------------------------------------------------------
function libResearch:GetResearchLineIndex(itemLink)
	local craftingSkillType = libResearch:GetItemCraftingSkill(itemLink)
	local armorType = GetItemLinkArmorType(itemLink)
	local equipType = GetItemLinkEquipType(itemLink)
	local weaponType = GetItemLinkWeaponType(itemLink)

	if craftingSkillType ~= BLACKSMITH and craftingSkillType ~= WOODWORK and craftingSkillType ~= CLOTHIER and craftingSkillType ~= JEWELRY_CRAFTING then
		return -1
	end

	local researchLineIndex
	--if is armor (including shields and jewelry)
	if     armorType ~= ARMORTYPE_NONE or weaponType == WEAPONTYPE_SHIELD
        or equipType == EQUIP_TYPE_NECK or equipType == EQUIP_TYPE_RING then
        researchLineIndex = researchMap[craftingSkillType].ARMOR[equipType]
		if armorType == ARMORTYPE_MEDIUM then
			researchLineIndex = researchLineIndex + 7
		end
	--else is weapon or nothing
	else
		--check if actually is weapon first
		if weaponType == WEAPONTYPE_NONE then
			return -1
		end
		researchLineIndex = researchMap[craftingSkillType].WEAPON[weaponType]
	end

	return researchLineIndex or -1
end

--returns craftingSkill, researchLineIndex, traitIndex for the given item link
function libResearch:GetItemResearchInfo(itemLink)
	return self:GetItemCraftingSkill(itemLink), self:GetResearchLineIndex(itemLink), self:GetResearchTraitIndex(itemLink)
end

--[[----------------------------------------------------------------------------
	returns true if the craftingSkillType is one of the researchable crafts,
	false otherwise
--]]----------------------------------------------------------------------------
function libResearch:IsBigThreeCrafting(craftingSkillType)
	if craftingSkillType == BLACKSMITH or craftingSkillType == CLOTHIER or craftingSkillType == WOODWORK or craftingSkillType == JEWELRY_CRAFTING then
		return true
	end
	return false
end

function libResearch:GetResearchMap()
	return researchMap
end

function libResearch:GetTraitTypeToTraitIndex()
	return ItemTraitType2TraitIndex
end

LibResearch = libResearch
