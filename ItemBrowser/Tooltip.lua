local LCCC = LibCodesCommonCode
local LMAS = LibMultiAccountSets
local LEJ = LibExtendedJournal
local ItemBrowser = ItemBrowser

-- Ensure LMAS is 3.0 or newer
if (LMAS and not LMAS.GetServerAndAccountList) then LMAS = nil end


--------------------------------------------------------------------------------
-- ItemBrowser.AddTooltipExtension
--------------------------------------------------------------------------------

local FLAG_SHOW_HEADER   = 0x01
local FLAG_SHOW_PIECES   = 0x02
local FLAG_SHOW_ACCOUNTS = 0x04
local FLAG_FULL_PIECES   = 0x08
local FLAG_OTHER_SERVER  = 0x10
local FLAG_BROWSER_ITEM  = 0x0B -- FLAG_SHOW_HEADER | FLAG_SHOW_PIECES | FLAG_FULL_PIECES
local MASK_HIDE_ACCOUNTS = 0xFB -- ~FLAG_SHOW_ACCOUNTS

local ItemCategories = {
	GAMEPAD_ITEM_CATEGORY_LIGHT_ARMOR,
	GAMEPAD_ITEM_CATEGORY_MEDIUM_ARMOR,
	GAMEPAD_ITEM_CATEGORY_HEAVY_ARMOR,
	GAMEPAD_ITEM_CATEGORY_JEWELRY,
	GAMEPAD_ITEM_CATEGORY_WEAPONS,
}

local FilterTypeToCategory = {
	[EQUIPMENT_FILTER_TYPE_BOW] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
	[EQUIPMENT_FILTER_TYPE_DESTRO_STAFF] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
	[EQUIPMENT_FILTER_TYPE_HEAVY] = GAMEPAD_ITEM_CATEGORY_HEAVY_ARMOR,
	[EQUIPMENT_FILTER_TYPE_LIGHT] = GAMEPAD_ITEM_CATEGORY_LIGHT_ARMOR,
	[EQUIPMENT_FILTER_TYPE_MEDIUM] = GAMEPAD_ITEM_CATEGORY_MEDIUM_ARMOR,
	[EQUIPMENT_FILTER_TYPE_NECK] = GAMEPAD_ITEM_CATEGORY_JEWELRY,
	[EQUIPMENT_FILTER_TYPE_ONE_HANDED] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
	[EQUIPMENT_FILTER_TYPE_RESTO_STAFF] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
	[EQUIPMENT_FILTER_TYPE_RING] = GAMEPAD_ITEM_CATEGORY_JEWELRY,
	[EQUIPMENT_FILTER_TYPE_SHIELD] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
	[EQUIPMENT_FILTER_TYPE_TWO_HANDED] = GAMEPAD_ITEM_CATEGORY_WEAPONS,
}

local function GetItemSlotName( itemLink, isWeapon )
	if (isWeapon) then
		local weaponType = GetItemLinkWeaponType(itemLink)
		local prefix = "SI_WEAPONTYPE"
		if (weaponType == WEAPONTYPE_TWO_HANDED_SWORD or weaponType == WEAPONTYPE_TWO_HANDED_AXE or weaponType == WEAPONTYPE_TWO_HANDED_HAMMER) then
			-- Strangely, SI_WEAPONTYPE does not provide unique names for 2-handed weapons
			prefix = "SI_ITEMBROWSER_WEAPONTYPE"
		end
		return GetString(prefix, weaponType)
	else
		return GetString("SI_EQUIPTYPE", GetItemLinkEquipType(itemLink))
	end
end

local function MixColors( color1, color2 )
	local h1, s1, l1 = ConvertRGBToHSL(LCCC.Int24ToRGB(color1))
	local h2, s2, l2 = ConvertRGBToHSL(LCCC.Int24ToRGB(color2))
	if (zo_abs(h1 - h2) > 0.5) then h1 = h1 + 1 end
	return LCCC.RGBToInt24(LCCC.HSLToRGB((h1 + h2) / 2, (s1 + s2) / 2, (l1 + l2) / 2))
end

local function AddTooltipExtensionToUndauntedCoffer( tooltip, itemLink )
	local colors = ItemBrowser.vars.tooltipColors.pieces

	LEJ.TooltipExtensionInitialize(true)

	for i = 1, 2 do
		local _, setName, _, _, maxEquipped, setId = GetItemLinkContainerSetInfo(itemLink, i)

		-- Abort if it doesn't look like this is an undaunted shoulder coffer
		if (maxEquipped ~= 2) then return end

		local results = { }

		for j = 1, GetNumItemSetCollectionPieces(setId) do
			local pieceId, slot = GetItemSetCollectionPieceInfo(setId, j)
			local itemLink = GetItemSetCollectionPieceItemLink(pieceId, LINK_STYLE_DEFAULT, ITEM_TRAIT_TYPE_NONE)

			if (GetItemLinkEquipType(itemLink) == EQUIP_TYPE_SHOULDERS) then
				table.insert(results, string.format(
					"|c%06X%s|r",
					IsItemSetCollectionSlotUnlocked(setId, slot) and colors.unlocked or colors.locked,
					GetString("SI_ARMORTYPE", GetItemLinkArmorType(itemLink))
				))
			end
		end

		LEJ.TooltipExtensionAddSection(
			zo_strformat("<<C:1>>: <<2>>", setName, ItemBrowser.FormatTransmuteCost(GetItemReconstructionCurrencyOptionCost(setId, CURT_CHAOTIC_CREATIA))),
			table.concat(results, ", ")
		)
	end

	LEJ.TooltipExtensionFinalize(tooltip)
end

function ItemBrowser.AddTooltipExtension( tooltip, itemLink, account, flags, itemSource, server )
	-- Setting the server parameter should disable FLAG_SHOW_ACCOUNTS
	if (server) then
		flags = BitAnd(flags, MASK_HIDE_ACCOUNTS)
		if (server ~= LCCC.GetServerName()) then
			flags = BitOr(flags, FLAG_OTHER_SERVER)
		end
	end

	local valid, setId
	local container = GetItemLinkNumContainerSetIds(itemLink)

	if (container == 2) then
		-- Special handling for 5-key undaunted shoulder coffers
		return AddTooltipExtensionToUndauntedCoffer(tooltip, itemLink)
	elseif (container == 1) then
		flags = BitAnd(flags, BitOr(FLAG_SHOW_HEADER, FLAG_SHOW_PIECES))
		valid = true
		setId = select(6, GetItemLinkContainerSetInfo(itemLink, 1))
	else
		-- Invalid means that this is an uncollectible item belonging to a collectible set
		valid = IsItemLinkSetCollectionPiece(itemLink)
		setId = select(6, GetItemLinkSetInfo(itemLink))
	end

	-- Abort if this is not a collectible set
	local setSize = GetNumItemSetCollectionPieces(setId)
	if (setSize < 1) then return end

	-- Wrappers for LibMultiAccountSets
	local IsSlotUnlocked = IsItemSetCollectionSlotUnlocked
	local CountUnlockedSlots = GetNumItemSetCollectionSlotsUnlocked
	local GetCurrencyCost = GetItemReconstructionCurrencyOptionCost
	if (LMAS) then
		IsSlotUnlocked = function(...) return LMAS.IsItemSetCollectionSlotUnlockedForAccountEx(server, account, ...) end
		CountUnlockedSlots = function(...) return LMAS.GetNumItemSetCollectionSlotsUnlockedForAccountEx(server, account, ...) end
		GetCurrencyCost = function(...) return LMAS.GetItemReconstructionCurrencyOptionCostForAccountEx(server, account, ...) end
	end

	-- Component: status header
	if (BitAnd(flags, FLAG_SHOW_HEADER) == FLAG_SHOW_HEADER) then
		local unlocked = CountUnlockedSlots(setId)
		LEJ.TooltipExtensionInitialize(
			true,
			string.format("%d/%d (%d%%)", unlocked, setSize, 100 * unlocked / setSize),
			ItemBrowser.FormatTransmuteCost(GetCurrencyCost(setId, CURT_CHAOTIC_CREATIA))
		)
	else
		LEJ.TooltipExtensionInitialize(false)
	end

	-- Component: set piece knowledge
	if (BitAnd(flags, FLAG_SHOW_PIECES) == FLAG_SHOW_PIECES and valid) then
		local colors = ItemBrowser.vars.tooltipColors.pieces
		local showAllPieces = ItemBrowser.vars.externalTooltips.showPieces ~= 2 or BitAnd(flags, FLAG_FULL_PIECES) == FLAG_FULL_PIECES

		local results = { }
		for _, category in ipairs(ItemCategories) do
			results[category] = { }
		end

		for i = 1, setSize do
			local pieceId, slot = GetItemSetCollectionPieceInfo(setId, i)
			local category = FilterTypeToCategory[GetEquipmentFilterTypeForItemSetCollectionSlot(slot)]

			if (category) then
				local itemLink = GetItemSetCollectionPieceItemLink(pieceId, LINK_STYLE_DEFAULT, ITEM_TRAIT_TYPE_NONE)
				local unlocked = IsSlotUnlocked(setId, slot)

				if (showAllPieces or not unlocked) then
					table.insert(results[category], string.format(
						"|c%06X%s|r",
						unlocked and colors.unlocked or colors.locked,
						GetItemSlotName(itemLink, category == GAMEPAD_ITEM_CATEGORY_WEAPONS)
					))
				end
			end
		end

		for _, category in ipairs(ItemCategories) do
			if (#results[category] > 0) then
				local header = GetString("SI_GAMEPADITEMCATEGORY", category)
				if (not showAllPieces) then
					header = string.format("%s (%s)", header, GetString(SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_LOCKED))
				end
				LEJ.TooltipExtensionAddSection(header, table.concat(results[category], ", "))
			end
		end
	end

	-- Component: antiquity fragments for mythics
	if ((account == nil or account == GetDisplayName()) and BitAnd(flags, FLAG_OTHER_SERVER) ~= FLAG_OTHER_SERVER and valid) then
		local antiquitySetId = ItemBrowser.GetItemAntiquitySetId(itemLink)
		if (antiquitySetId ~= 0) then
			-- Initialize colors
			local colorDug = ItemBrowser.vars.tooltipColors.pieces.unlocked
			local colorNoLead = ItemBrowser.vars.tooltipColors.pieces.locked
			local colorHaveLead = MixColors(colorDug, colorNoLead)

			local results = { }
			local noLeads = 0

			for i = 1, GetNumAntiquitySetAntiquities(antiquitySetId) do
				local antiquityId = GetAntiquitySetAntiquityId(antiquitySetId, i)
				local color

				if (DoesAntiquityNeedCombination(antiquityId)) then
					color = colorDug
				elseif (DoesAntiquityHaveLead(antiquityId)) then
					color = colorHaveLead
				else
					color = colorNoLead
					noLeads = noLeads + 1
				end

				table.insert(results, string.format("|c%06X%s|r", color, zo_strformat("<<C:1>>", GetAntiquityName(antiquityId))))
			end

			-- Show the section only if the player has progress to show or the item is uncollected
			if (noLeads < #results or not IsItemSetCollectionPieceUnlocked(GetItemLinkItemId(itemLink))) then
				LEJ.TooltipExtensionAddSection(GetString(SI_ANTIQUITY_FRAGMENTS), table.concat(results, ", "))
			end
		end
	end

	-- Component: account knowledge
	if (LMAS and BitAnd(flags, FLAG_SHOW_ACCOUNTS) == FLAG_SHOW_ACCOUNTS and valid) then
		local accounts = LMAS.GetServerAndAccountList(true)[1].accounts

		if (#accounts > 1) then
			local colors = ItemBrowser.vars.tooltipColors.accounts
			local results = { }

			local status = LMAS.GetItemCollectionAndTradabilityStatus(accounts, itemLink, itemSource)

			for _, account in ipairs(accounts) do
				local result
 				if (status[account] == LMAS.ITEM_UNCOLLECTED_NOTRADE) then
					result = string.format("|c%06X|l0:0:0:50%%:2:%06X|l%s|l|r", colors.locked, colors.locked, account)
				else
					result = string.format("|c%06X%s|r", colors[(status[account] == LMAS.ITEM_COLLECTED) and "unlocked" or "locked"], account)
				end
				table.insert(results, result)
			end
			LEJ.TooltipExtensionAddSection(GetString(SI_ITEMBROWSER_TT_HEADER_ACCTS), table.concat(results, ", "))
		end
	end

	-- Special handling for uncollectible (discontinued) items
	if (not valid) then
		LEJ.TooltipExtensionAddSection(GetString(SI_ITEMBROWSER_TT_INVALID_HEAD), GetString("SI_ITEMBROWSER_TT_INVALID_MSG", (GetItemLinkItemId(itemLink) < 167300) and 1 or 2))
	end

	LEJ.TooltipExtensionFinalize(tooltip, BitAnd(flags, FLAG_SHOW_HEADER) == FLAG_SHOW_HEADER)
end


--------------------------------------------------------------------------------
-- ItemBrowser.HookExternalTooltips
--------------------------------------------------------------------------------

local AreExternalTooltipsHooked = false

function ItemBrowser.HookExternalTooltips( )
	if (AreExternalTooltipsHooked or not ItemBrowser.vars.externalTooltips.enableExtension) then return end
	AreExternalTooltipsHooked = true

	local TooltipHook = function( control, functionName, linkFunction, flagMask, sourceParams )
		ZO_PostHook(control, functionName, function( self, ... )
			if (ItemBrowser.vars.externalTooltips.enableExtension) then
				local flags = FLAG_SHOW_HEADER
				if (ItemBrowser.vars.externalTooltips.showPieces > 0) then
					flags = BitOr(flags, FLAG_SHOW_PIECES)
				end
				if (ItemBrowser.vars.externalTooltips.showAccounts > 0) then
					flags = BitOr(flags, FLAG_SHOW_ACCOUNTS)
				end
				if (flagMask) then
					flags = BitAnd(flags, flagMask)
				end
				local itemSource
				if (sourceParams) then
					itemSource = { }
					for i, param in ipairs(sourceParams) do
						itemSource[param] = select(i, ...)
					end
				end
				ItemBrowser.AddTooltipExtension(control, linkFunction(...), nil, flags, itemSource)
			end
		end)
	end

	local ItemLinkPassthrough = function( itemLink )
		return itemLink
	end

	TooltipHook(PopupTooltip, "SetLink", ItemLinkPassthrough)
	TooltipHook(ItemTooltip, "SetLink", ItemLinkPassthrough)
	TooltipHook(ItemTooltip, "SetWornItem", function(slot, bagId) return GetItemLink(bagId, slot) end)
	TooltipHook(ItemTooltip, "SetBagItem", GetItemLink, nil, { "bagId", "slotIndex" })
	TooltipHook(ItemTooltip, "SetTradeItem", GetTradeItemLink, nil, { "who", "tradeIndex" })
	TooltipHook(ItemTooltip, "SetBuybackItem", GetBuybackItemLink)
	TooltipHook(ItemTooltip, "SetStoreItem", GetStoreItemLink)
	TooltipHook(ItemTooltip, "SetAttachedMailItem", GetAttachedItemLink)
	TooltipHook(ItemTooltip, "SetLootItem", GetLootItemLink, nil, { "lootId" })
	TooltipHook(ItemTooltip, "SetReward", GetItemRewardItemLink)
	TooltipHook(ItemTooltip, "SetQuestReward", GetQuestRewardItemLink)
	TooltipHook(ItemTooltip, "SetTradingHouseItem", GetTradingHouseSearchResultItemLink)
	TooltipHook(ItemTooltip, "SetTradingHouseListing", GetTradingHouseListingItemLink)
	TooltipHook(ItemTooltip, "SetItemSetCollectionPieceLink", ItemLinkPassthrough, FLAG_SHOW_ACCOUNTS)
end

LCCC.RunAfterInitialLoadscreen(ItemBrowser.HookExternalTooltips)
