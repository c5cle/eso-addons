local LCCC = LibCodesCommonCode

ItemBrowser = {
	name = "ItemBrowser",

	title = GetString(SI_ITEMBROWSER_TITLE),
	version = "4.4.8",
	url = "https://www.esoui.com/downloads/info1480.html",

	-- Default settings
	defaults = {
		filterId = 1,
		usePercentage = false,
		tooltipColors = {
			pieces = {
				unlocked = 0x00FF00,
				locked = 0xFF0000,
			},
			accounts = {
				unlocked = 0x3399FF,
				locked = 0x777766,
			},
		},
		externalTooltips = {
			enableExtension = true,
			showPieces = 1,
			showAccounts = 1,
		},
		favorites = { },
	},

	zoneId = 0,
}
local ItemBrowser = ItemBrowser

local function OnAddOnLoaded( eventCode, addonName )
	if (addonName ~= ItemBrowser.name) then return end

	EVENT_MANAGER:UnregisterForEvent(ItemBrowser.name, EVENT_ADD_ON_LOADED)

	ItemBrowser.vars = ZO_SavedVars:NewAccountWide("ItemBrowserSavedVariables", 1, nil, ItemBrowser.defaults, nil, "$InstallationWide")
	ItemBrowser.MigrateSettings()
	ItemBrowser.RegisterSettingsPanel()

	ItemBrowser.InitializeBrowser()
end

function ItemBrowser.CheckFlag( flags, flagToCheck )
	return BitAnd(flags, flagToCheck) == flagToCheck
end

function ItemBrowser.GetZoneNameById( zoneId )
	if (zoneId < -100) then
		return ItemBrowser.data.specialNames[zoneId]
	elseif (zoneId < 0) then
		return GetString("SI_ITEMBROWSER_SOURCE_SPECIAL", zoneId * -1)
	else
		return zo_strformat("<<C:1>>", GetZoneNameById(zoneId))
	end
end

function ItemBrowser.FormatTransmuteCost( cost )
	return string.format("%s%s", (cost and cost <= 75) and cost or "—", zo_iconFormatInheritColor("/esoui/art/currency/gamepad/gp_seedcrystal_mipmap.dds", 16, 16))
end

do
	local AntiquitySetItems

	local function GetAntiquitySetItems( )
		if (not AntiquitySetItems) then
			AntiquitySetItems = { }
			local antiquityId = GetNextAntiquityId()
			while (antiquityId) do
				local setId = GetAntiquitySetId(antiquityId)
				if (setId and setId ~= 0) then
					local itemId = GetItemRewardItemId(GetAntiquitySetRewardId(setId))
					if (itemId and itemId ~= 0) then
						AntiquitySetItems[itemId] = setId
					end
				end
				antiquityId = GetNextAntiquityId(antiquityId)
			end
		end
		return AntiquitySetItems
	end

	function ItemBrowser.GetItemAntiquitySetId( itemLink )
		return GetAntiquitySetItems()[GetItemLinkItemId(itemLink)] or 0
	end
end

function ItemBrowser.MigrateSettings( )
	-- Handle the changes made in version 3.1
	local ett = ItemBrowser.vars.externalTooltips
	if (type(ett.showPieces) == "boolean") then
		ett.showPieces = ett.showPieces and 1 or 0
		ett.showAccounts = ett.showAccounts and 1 or 0
	end
end

function ItemBrowser.RegisterSettingsPanel( )
	local LAM = LibAddonMenu2

	if (LAM) then
		local panelId = "ItemBrowserSettings"

		ItemBrowser.settingsPanel = LAM:RegisterAddonPanel(panelId, {
			type = "panel",
			name = ItemBrowser.title,
			version = ItemBrowser.version,
			author = "@code65536",
			website = ItemBrowser.url,
			donation = ItemBrowser.url .. "#donate",
			registerForRefresh = true,
		})

		local ttcp = ItemBrowser.vars.tooltipColors.pieces
		local ttca = ItemBrowser.vars.tooltipColors.accounts
		local UnpackRGB = LCCC.Int24ToRGB
		local PackRGB = LCCC.RGBToInt24

		LAM:RegisterOptionControls(panelId, {
			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_ITEMBROWSER_SECTION_GENERAL,
			},
			--------------------
			{
				type = "checkbox",
				name = SI_ITEMBROWSER_SETTING_PERCENT,
				getFunc = function() return ItemBrowser.vars.usePercentage end,
				setFunc = function( enabled )
					ItemBrowser.vars.usePercentage = enabled
					ItemBrowser.RefreshCollections()
				end,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_ITEMBROWSER_SECTION_TTCLR_P,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_UNLOCKED,
				getFunc = function() return UnpackRGB(ttcp.unlocked) end,
				setFunc = function(...) ttcp.unlocked = PackRGB(...) end,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_LOCKED,
				getFunc = function() return UnpackRGB(ttcp.locked) end,
				setFunc = function(...) ttcp.locked = PackRGB(...) end,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_ITEMBROWSER_SECTION_TTCLR_A,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_UNLOCKED,
				getFunc = function() return UnpackRGB(ttca.unlocked) end,
				setFunc = function(...) ttca.unlocked = PackRGB(...) end,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_LOCKED,
				getFunc = function() return UnpackRGB(ttca.locked) end,
				setFunc = function(...) ttca.locked = PackRGB(...) end,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_ITEMBROWSER_SECTION_TTEXT,
			},
			--------------------
			{
				type = "checkbox",
				name = SI_ITEMBROWSER_SETTING_TT,
				getFunc = function() return ItemBrowser.vars.externalTooltips.enableExtension end,
				setFunc = function( enabled )
					ItemBrowser.vars.externalTooltips.enableExtension = enabled
					if (enabled) then
						ItemBrowser.HookExternalTooltips()
					end
				end,
			},
			--------------------
			{
				type = "dropdown",
				name = SI_ITEMBROWSER_SETTING_TT_P,
				choices = { GetString(SI_CHECK_BUTTON_OFF), GetString(SI_CHECK_BUTTON_ON), GetString(SI_ITEM_FORMAT_STR_SET_COLLECTION_PIECE_LOCKED) },
				choicesValues = { 0, 1, 2 },
				getFunc = function() return ItemBrowser.vars.externalTooltips.showPieces end,
				setFunc = function(mode) ItemBrowser.vars.externalTooltips.showPieces = mode end,
				disabled = function() return not ItemBrowser.vars.externalTooltips.enableExtension end,
			},
			--------------------
			{
				type = "dropdown",
				name = SI_ITEMBROWSER_SETTING_TT_A,
				tooltip = SI_ITEMBROWSER_SETTING_TT_A_EX,
				choices = { GetString(SI_CHECK_BUTTON_OFF), GetString(SI_CHECK_BUTTON_ON) },
				choicesValues = { 0, 1 },
				getFunc = function() return ItemBrowser.vars.externalTooltips.showAccounts end,
				setFunc = function(mode) ItemBrowser.vars.externalTooltips.showAccounts = mode end,
				disabled = function() return not (LibMultiAccountSets and ItemBrowser.vars.externalTooltips.enableExtension) end,
			},
		})
	end
end

EVENT_MANAGER:RegisterForEvent(ItemBrowser.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
