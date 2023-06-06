local LastSearchTimeStamp = nil
local IsStoreUIOpen = false
local MinSearchDelay = 5000
local SearchAdditionalDelay = 1000

local function UpdateScanButtonStatus()
	if (IsStoreUIOpen) then
		KEYBIND_STRIP:UpdateKeybindButton(TamrielTradeCentre.Buttons.StartScanButton)
	else
		KEYBIND_STRIP:RemoveKeybindButton(TamrielTradeCentre.Buttons.StartScanButton)
	end
end

local ScanStatus = {}
ScanStatus.SessionID = 0
function ScanStatus:Reset()
	self.IsScanning = false
	self.IsPaused = false
	self.GuildName = nil
	self.CurrentPage = -1
	self.IsFinishPending = false
	UpdateScanButtonStatus()
end

function ScanStatus:Start()
	self:Reset()
	self.SessionID = self.SessionID + 1

	local _, guildName = GetCurrentTradingHouseGuildDetails()
	if (guildName == nil or guildName == "") then
		return
	end

	self.IsScanning = true
	self.IsPaused = false
	self.GuildName = guildName
	self.CurrentPage = -1
	self.IsFinishPending = false
	UpdateScanButtonStatus()
end

function ScanStatus:Pause()
	self.IsScanning = false
	self.IsPaused = true
end

function ScanStatus:Resume()
	local _, guildName = GetCurrentTradingHouseGuildDetails()
	if (guildName == nil or guildName == "") then
		return
	end

	self.SessionID = self.SessionID + 1
	self.IsScanning = true
	self.IsPaused = false
end



local function CloseMsgBox()
	ZO_Dialogs_ReleaseDialog("TamrielTradeCentreDialog", false)
end

local function ShowMsgBox(title, msg, btnText, callback)
	local confirmDialog = 
	{
		title = { text = title },
		mainText = { text = msg },
		buttons = 
		{
			{
				text = btnText, 
				callback = callback
			}
		}
   }

   ZO_Dialogs_RegisterCustomDialog("TamrielTradeCentreDialog", confirmDialog)
   CloseMsgBox()
   ZO_Dialogs_ShowDialog("TamrielTradeCentreDialog")
end



local function OnTradingHouseClosed()
	IsStoreUIOpen = false
	if (ScanStatus.IsScanning) then
		ScanStatus:Pause()
	end

	UpdateScanButtonStatus()
end

local function GetScanDelay()
	return math.max(GetTradingHouseCooldownRemaining() + SearchAdditionalDelay, MinSearchDelay)
end

local function GuildListingScanLoop(sessionID)
	if (not ScanStatus.IsScanning or ScanStatus.SessionID ~= sessionID or ScanStatus.IsPaused) then
		TamrielTradeCentre:DebugWriteLine("Scan loop session = " .. sessionID .. " ended" )
		return
	end

	TamrielTradeCentre:DebugWriteLine("Scanning page " .. ScanStatus.CurrentPage + 1 .. " SessionID = " .. sessionID)
	d("Scanning page " .. ScanStatus.CurrentPage + 1) --TODO: remove once ZOS fix store UI bug
	ExecuteTradingHouseSearch(ScanStatus.CurrentPage + 1)

	local delay = GetScanDelay()
	zo_callLater(function()
					GuildListingScanLoop(sessionID)
				 end, delay)
end

local function StartGuildListingScanLoop()
	if (not ScanStatus.IsScanning) then
		return
	end

	if (not TamrielTradeCentre.Settings.EnableAutoRecordStoreEntries) then
		ShowMsgBox(GetString(TTC_ERROR), GetString(TTC_ERROR_AUTORECORDSEARCHRESULTNOTENABLED), SI_DIALOG_CONFIRM)
		ScanStatus:Reset()
		return
	end

	if (TamrielTradeCentre:GetCurrentKioskID() == nil) then
		ShowMsgBox(GetString(TTC_ERROR), GetString(TTC_ERROR_GUILDDOESNOTOWNKIOSK), SI_DIALOG_CONFIRM)
		ScanStatus:Reset()
		return
	end

	TRADING_HOUSE_SEARCH:ResetAllSearchData()

	ShowMsgBox(GetString(TTC_MSG_SCANINPROGRESS), 
			   GetString(TTC_MSG_SCANNINGALLLISTINGSINSTORE) .. "\n\nP.S. StoreUI won't update while scanning due to ZOS bug (please check chat box for progress)", --TODO: remove once ZOS fix store UI bug
			   SI_DIALOG_BUTTON_TEXT_QUIT_FORCE, 
			   function()
				   ShowMsgBox(GetString(TTC_MSG_SCANCANCELED), GetString(TTC_MSG_OPERATIONCANCELEDBYUSER), SI_DIALOG_CONFIRM)
			       ScanStatus:Reset()
			   end)

	TamrielTradeCentre:DebugWriteLine("Starting GuildListingScanLoop with SessionID = " .. ScanStatus.SessionID)
	GuildListingScanLoop(ScanStatus.SessionID)
end

function TamrielTradeCentre:StartNewGuildListingScan()
	if (ScanStatus.IsScanning or not IsStoreUIOpen) then --Bail if another scan is in progress
		return
	end

	ScanStatus:Start()
	StartGuildListingScanLoop()
end

local function UpdateGuildList()
	--Get a list of current guilds
	for i = 1, GetNumGuilds() do
		local guildId = GetGuildId(i)
		local guildName = GetGuildName(guildId)
		if (guildName ~= "") then
			if (TamrielTradeCentre.Guilds[guildName] == nil) then
				TamrielTradeCentre.Guilds[guildName] = {}
				TamrielTradeCentre.Guilds[guildName].ID = guildId
				TamrielTradeCentre.Guilds[guildName].LastScannedHistoryIndex = 0
				TamrielTradeCentre.Guilds[guildName].HasRequestedOldHistory = false
			end

			local savedVarGuildInfo = TamrielTradeCentre.Data.Guilds[guildName]
			if (savedVarGuildInfo ~= nil) then
				savedVarGuildInfo.KioskLocationID = TamrielTradeCentre:NPCNameToKioskID(GetGuildOwnedKioskInfo(guildId))
			end
		end
	end

	--Remove guilds from SavedVariable if the player is not in it anymore
	for key, value in pairs(TamrielTradeCentre.Data.Guilds) do
		if (TamrielTradeCentre.Guilds[key] == nil) then
			TamrielTradeCentre.Data.Guilds[key] = nil
		end
	end
end

local function OnTradingHouseOpened()
	IsStoreUIOpen = true
	if (not KEYBIND_STRIP:HasKeybindButton(TamrielTradeCentre.Buttons.StartScanButton)) then
		KEYBIND_STRIP:AddKeybindButton(TamrielTradeCentre.Buttons.StartScanButton)
	end

	TamrielTradeCentre:DebugWriteLine(TamrielTradeCentre:GetCurrentKioskID())

	if (ScanStatus.IsPaused) then
		local _, guildName = GetCurrentTradingHouseGuildDetails()
		if (guildName ~= "" and guildName ~= nil and guildName == ScanStatus.GuildName) then
			ScanStatus:Resume()
			StartGuildListingScanLoop()
			return
		end
	end

	UpdateGuildList()
end

--Full update on guild listing for current selected guild inside guild store interface
local function UpdateGuildListingData()
	local guildID, _, _ = GetCurrentTradingHouseGuildDetails()
	local guildName = GetGuildName(guildID)
	if (currentGuildID == 0 or guildName == "") then
		return
	end

	local numListing = GetNumTradingHouseListings()
	local newGuildData = {}
	newGuildData.KioskLocationID = TamrielTradeCentre:GetCurrentKioskID()
	newGuildData.Entries = {}
	for i = 1, numListing do
		local itemLink = GetTradingHouseListingItemLink(i)
		local _, _, _, stackCount, _, _, price, _, uid = GetTradingHouseListingItemInfo(i)
		if (itemLink == nil or stackCount == 0) then
			break
		end

		local listEntry = TamrielTradeCentre_ItemInfo:New(itemLink)
		listEntry.Amount = stackCount
		listEntry.TotalPrice = price
		listEntry.UID = Id64ToString(uid)

		newGuildData.Entries[i - 1] = listEntry
	end

	newGuildData.LastUpdate = GetTimeStamp()
	newGuildData.LastFullScan = GetTimeStamp()

	TamrielTradeCentre.Data.Guilds[guildName] = newGuildData
end

local function RemoveAllSimilarRecordedEntries(guildName, sellerName, uid)
	local uidString = Id64ToString(uid)

	local autoRecordEntries = TamrielTradeCentre.Data.AutoRecordEntries
	local recordedGuildData = autoRecordEntries.Guilds[guildName]

	if (recordedGuildData == nil) then
		TamrielTradeCentre:DebugWriteLine("Recorded guild data nil")
		return
	end

	local playerListings = recordedGuildData.PlayerListings[sellerName]
	if (playerListings == nil) then
		TamrielTradeCentre:DebugWriteLine("PlayerListings nil")
		return
	end

	local indexesToRemove = {}
	for index, listEntry in pairs(playerListings) do
		if (listEntry.UID == uidString) then
			table.insert(indexesToRemove, index)
		end
	end

	for _, index in pairs(indexesToRemove) do
		playerListings[index] = nil
		autoRecordEntries.Count = autoRecordEntries.Count - 1
	end
end

local function ProcessTradingHouseSearchResults()
	local autoRecordEntries = TamrielTradeCentre.Data.AutoRecordEntries
	local numItemsOnPage, currentPage, _ = GetTradingHouseSearchResultsInfo()
	TamrielTradeCentre:DebugWriteLine("numItemsOnPage = " .. numItemsOnPage)
	TamrielTradeCentre:DebugWriteLine("currentPage = " .. currentPage)

	if (numItemsOnPage == 0) then
		if (ScanStatus.IsScanning and currentPage == ScanStatus.CurrentPage + 1) then
			if (ScanStatus.IsFinishPending) then
				ShowMsgBox(GetString(TTC_MSG_TASKENDED), GetString(TTC_MSG_FULLGUILDLISTINGSSCANFINISHED), SI_DIALOG_CONFIRM)
				ScanStatus:Reset()
			else
				TamrielTradeCentre:DebugWriteLine("Setting IsFinishPending to true")
				ScanStatus.IsFinishPending = true
			end
		end

		return
	end

	if (ScanStatus.IsScanning and currentPage == ScanStatus.CurrentPage + 1) then
		ScanStatus.CurrentPage = currentPage
		ScanStatus.IsFinishPending = false
	end

	if (not TamrielTradeCentre.Settings.EnableAutoRecordStoreEntries) then
		return
	end

	if (autoRecordEntries.Count > TamrielTradeCentre.Settings.MaxAutoRecordStoreEntryCount) then
		d(GetString(TTC_MSG_MAXRECORDCOUNTREACHED))
		d(GetString(TTC_MSG_CLEARRECORDEDENTRIESINSTRUCTION))

		if (ScanStatus.IsScanning) then
			ScanStatus:Reset()
			ShowMsgBox(GetString(TTC_MSG_TASKENDED), GetString(TTC_ERROR_SCANENDEDDUETORECORDLIMITREACHED), SI_DIALOG_CONFIRM)
		end

		return
	end

	LastSearchTimeStamp = GetTimeStamp()
	local _, guildName = GetCurrentTradingHouseGuildDetails()

	local recordedGuildData = autoRecordEntries.Guilds[guildName]
	if (recordedGuildData == nil) then
		recordedGuildData = {}
		recordedGuildData.PlayerListings = {}
		autoRecordEntries.Guilds[guildName] = recordedGuildData
	end

	recordedGuildData.KioskLocationID = TamrielTradeCentre:GetCurrentKioskID()
	recordedGuildData.LastUpdate = GetTimeStamp()
	if (recordedGuildData.KioskLocationID == nil) then
		return
	end

	for i = 1, numItemsOnPage do
		local link = GetTradingHouseSearchResultItemLink(i)
		if (link == nil or link == "") then
			break
		end

		local _, _, _, stackCount, sellerName, timeRemaining, totalPrice, _, uid = GetTradingHouseSearchResultItemInfo(i)
		local newEntry = TamrielTradeCentre_AutoRecordEntry:New(link, stackCount, totalPrice, LastSearchTimeStamp + timeRemaining, uid)

		sellerName = sellerName:gsub("|c.*|r", "")

		local playerListings = recordedGuildData.PlayerListings[sellerName]
		if (playerListings == nil) then
			playerListings = {}
			recordedGuildData.PlayerListings[sellerName] = playerListings
		end

		RemoveAllSimilarRecordedEntries(guildName, sellerName, uid)

		table.insert(playerListings, newEntry)
		autoRecordEntries.Count = autoRecordEntries.Count + 1
	end
end


local function OnTradingHouseResponseReceived(eventCode, responseType, result)
	TamrielTradeCentre:DebugWriteLine("Trading house response type " .. responseType)
	if (responseType == TRADING_HOUSE_RESULT_LISTINGS_PENDING or responseType == TRADING_HOUSE_RESULT_CANCEL_SALE_PENDING or responseType == TRADING_HOUSE_RESULT_POST_PENDING) then
		UpdateGuildListingData()
	elseif (responseType == TRADING_HOUSE_RESULT_SEARCH_PENDING) then
		ProcessTradingHouseSearchResults()
	end
end

--[[
	Updates based on guild history
--]]

local function ScanStoreHistory(eventCode, guildId, category)
	if (category ~= GUILD_HISTORY_STORE) then
		return
	end

	local guildName = GetGuildName(guildId)
	local tempGuildInfo = TamrielTradeCentre.Guilds[guildName]
	local savedVarGuildInfo = TamrielTradeCentre.Data.Guilds[guildName]
	local numGuildEvents = GetNumGuildEvents(guildId, GUILD_HISTORY_STORE)
	if (savedVarGuildInfo == nil or savedVarGuildInfo.LastUpdate == nil) then
		TamrielTradeCentre:DebugWriteLine(string.format("Guild %s is not yet on saved variable record, skipping", guildName))
		return
	end

	for i = tempGuildInfo.LastScannedHistoryIndex + 1, numGuildEvents do
		local eventType, secSinceEvent, seller, _, amount, itemLink, price = GetGuildEventInfo(guildId, GUILD_HISTORY_STORE, i)
		if (eventType == GUILD_EVENT_ITEM_SOLD and seller == TamrielTradeCentre.PlayerID) then
			if (GetTimeStamp() - secSinceEvent - 1 > savedVarGuildInfo.LastUpdate) then
				--unrecorded sold, update list
				if (TamrielTradeCentre.Settings.EnableItemSoldNotification) then
					d(TamrielTradeCentre:StringFormatPOSIX(GetString(TTC_MSG_ITEMSOLDDETECTED), amount, itemLink, guildName))
				end

				for key, value in pairs(savedVarGuildInfo.Entries) do
					if (value.ItemLink == itemLink and value.Amount == amount and value.TotalPrice == price) then
						TamrielTradeCentre:DebugWriteLine("Matching record found, removing from trade list")
						savedVarGuildInfo.Entries[key] = nil
						break
					end
				end
			end
		end
	end

	TamrielTradeCentre:DebugWriteLine(string.format("Scanning guild %s store history completed. %s entries scanned", guildName, numGuildEvents - tempGuildInfo.LastScannedHistoryIndex - 1))
	tempGuildInfo.LastScannedHistoryIndex = numGuildEvents
	savedVarGuildInfo.LastUpdate = GetTimeStamp()
end

local function OnOldStoreHistoryRequested(eventCode, guildId, category)
	if (category ~= GUILD_HISTORY_STORE) then
		return
	end

	local guildName = GetGuildName(guildId)
	local lastEventIndex = GetNumGuildEvents(guildId, GUILD_HISTORY_STORE)
	local _, secSinceLastEvent = GetGuildEventInfo(guildId, GUILD_HISTORY_STORE, lastEventIndex)
	local savedVarGuildInfo = TamrielTradeCentre.Data.Guilds[guildName]

	--No need to request for old history if there is no data for that guild yet
	if (savedVarGuildInfo ~= nil and savedVarGuildInfo.LastUpdate ~= nil) then
		TamrielTradeCentre:DebugWriteLine(string.format("Guild - %s: %d sec since event requested, goal is %d", guildName, secSinceLastEvent, GetTimeStamp() - savedVarGuildInfo.LastUpdate - 1))
		if (GetTimeStamp() - secSinceLastEvent - 1 > savedVarGuildInfo.LastUpdate and secSinceLastEvent < 60 * 60 * 24 * 7) then
			if (DoesGuildHistoryCategoryHaveMoreEvents(guildId, GUILD_HISTORY_STORE)) then
				return
			end
		end	
	end

	--If we get here then it means we have finished requesting old histories
	TamrielTradeCentre:DebugWriteLine(string.format("Request history for %s completed", guildName))
	TamrielTradeCentre.Guilds[guildName].HasRequestedOldHistory = true
end

local function RequestAllOldStoreHistory()
	for i = 1, GetNumGuilds() do
		local guildId = GetGuildId(i)
		if (guildId ~= 0) then
			local guildName = GetGuildName(guildId)
			
			local guildRecord = TamrielTradeCentre.Guilds[guildName]
			if (guildRecord ~= nil and not guildRecord.HasRequestedOldHistory) then
				if (DoesGuildHistoryCategoryHaveMoreEvents(guildId, GUILD_HISTORY_STORE)) then
					RequestMoreGuildHistoryCategoryEvents(guildId, GUILD_HISTORY_STORE)
					TamrielTradeCentre:DebugWriteLine("History requested on guild " .. guildName)
					zo_callLater(RequestAllOldStoreHistory, 5 * SearchAdditionalDelay)
					return
				else
					guildRecord.HasRequestedOldHistory = true
					TamrielTradeCentre:DebugWriteLine("History requested to end on guild " .. guildName)
				end
			end
		end
	end

	--All old histories had been requested, register event handler for new requests
	TamrielTradeCentre:DebugWriteLine("Performing full event scan")
	for i = 1, GetNumGuilds() do
		local guildId = GetGuildId(i)
		if (guildId ~= 0) then
			ScanStoreHistory(nil, guildId, GUILD_HISTORY_STORE)
		end
	end

	EVENT_MANAGER:UnregisterForEvent(TamrielTradeCentre.AddonName, EVENT_GUILD_HISTORY_RESPONSE_RECEIVED)
	EVENT_MANAGER:RegisterForEvent(TamrielTradeCentre.AddonName, EVENT_GUILD_HISTORY_CATEGORY_UPDATED, ScanStoreHistory)
end

local function OnTradingHouseConfirmItemPurchase(eventCode, pendingPurchaseIndex) --fires before the confirm prompt shows up
	if (LastSearchTimeStamp == nil or pendingPurchaseIndex == nil) then
		return
	end

	local _, guildName = GetCurrentTradingHouseGuildDetails()

	local _, _, _, _, sellerName, _, _, _, uid = GetTradingHouseSearchResultItemInfo(pendingPurchaseIndex)
	sellerName = sellerName:gsub("|c.*|r", "")

	if (uid == nil or uid == "") then
		TamrielTradeCentre:DebugWriteLine("OnTradingHouseConfirmItemPurchase: UID is null")
		return
	end

	RemoveAllSimilarRecordedEntries(guildName, sellerName, uid)
end

function TamrielTradeCentre:CleanUpAutoRecordEntries()
	local now = GetTimeStamp()

	local autoRecordEntries = self.Data.AutoRecordEntries

	--Resets count just in case we had some sync problem
	autoRecordEntries.Count = 0
	for guildName, guildData in pairs(autoRecordEntries.Guilds) do
		local hasGuildData = false
		for playerID, listEntries in pairs(guildData.PlayerListings) do
			local hasPlayerData = false
			for id, listEntry in pairs(listEntries) do
				if (now - listEntry.DiscoverTime > 3600 * 6) then
					listEntries[id] = nil
				else
					autoRecordEntries.Count = autoRecordEntries.Count + 1
					hasGuildData = true
					hasPlayerData = true
				end
			end

			if (not hasPlayerData) then
				guildData.PlayerListings[playerID] = nil
			end
		end

		if (not hasGuildData) then
			autoRecordEntries.Guilds[guildName] = nil
		end
	end
end

function TamrielTradeCentre:GenerateDefaultSavedVar()
	local default = {}
	local naData = {}
	local euData = {}
	
	naData["Guilds"] = {}
	naData["AutoRecordEntries"] = {}
	naData["AutoRecordEntries"].Count = 0
	naData["AutoRecordEntries"].Guilds = {}
	naData["IsFirstExecute"] = true
	default["NAData"] = naData

	euData["Guilds"] = {}
	euData["AutoRecordEntries"] = {}
	euData["AutoRecordEntries"].Count = 0
	euData["AutoRecordEntries"].Guilds = {}
	euData["IsFirstExecute"] = true
	default["EUData"] = euData

	default["ActualVersion"] = 10
	local settings = {}
	
	settings.EnableItemSoldNotification = true
	settings.EnableItemToolTipPricing = true
	settings.EnableItemPriceToChatBtn = true
	settings.EnableItemSearchOnlineBtn = true
	settings.EnableItemPriceDetailOnlineBtn = true
	settings.EnableAutoRecordStoreEntries = true
	settings.EnableSelfEntriesUpload = true

	settings.EnablePriceToChatSuggested = true
	settings.EnablePriceToChatAggregate = false
	settings.EnablePriceToChatStat = true
	settings.EnablePriceToChatLastUpdate = false

	settings.EnableToolTipSuggested = true
	settings.EnableToolTipAggregate = true
	settings.EnableToolTipStat = true
	settings.EnableToolTipLastUpdate = true

	settings.MaxAutoRecordStoreEntryCount = 20000

	settings.AdditionalPriceToChatLang = {}

	default["Settings"] = settings
	return default
end

function TamrielTradeCentre:GetCurrentServerRegion()
	local serverRegion = nil
	local lastPlatform = GetCVar("LastPlatform")
	local lastRealm = GetCVar("LastRealm")
	if (lastPlatform == "Live") then
		serverRegion = "NA"
	elseif (lastPlatform == "Live-EU") then
		serverRegion = "EU"
	elseif (lastRealm:find("^NA") ~= nil) then
		serverRegion = "NA"
	elseif (lastRealm:find("^EU") ~= nil) then
		serverRegion = "EU"
	end

	return serverRegion
end

function TamrielTradeCentre:GetLangCode()
	local currentLangName = GetCVar("language.2")

	local langCode = nil
	if (currentLangName == "en") then
		langCode = "en-US"
	elseif (currentLangName == "fr") then
		langCode = "fr-FR"
	elseif (currentLangName == "de") then
		langCode = "de-DE"
	elseif (currentLangName == "ru") then
		langCode = "ru-RU"
	elseif (currentLangName == "zh") then
		langCode = "zh-CN"
	elseif (currentLangName == "jp") then
		langCode = "ja-JP"
	end

	return langCode
end

function TamrielTradeCentre:Init()
	self:DebugWriteLine("TTC Init")

	local clientCulture = string.lower(GetCVar("language.2"))
	if (clientCulture~= "en" and clientCulture ~= "de" and clientCulture ~= "fr" and clientCulture ~= "zh" and clientCulture ~= "ru" and clientCulture ~= "es" and clientCulture ~= "jp") then
		ShowMsgBox("Error", "Tamriel Trade Centre only supports English client at this time. We are planning on adding support for other languages soon", SI_DIALOG_ACCEPT)
		return
	end

	if (self.LoadItemLookUpTable == nil) then
		ShowMsgBox(GetString(TTC_ERROR), GetString(TTC_ERROR_ItemLookUpTableMissing), SI_DIALOG_CONFIRM)
		return
	end

	self:LoadItemLookUpTable()

	local default = self:GenerateDefaultSavedVar()
	local savedVars = ZO_SavedVars:NewAccountWide("TamrielTradeCentreVars", 3, nil, default)
	savedVars.ClientCulture = clientCulture
	
	self:UpgradeSavedVar(savedVars)

	local serverRegion = self:GetCurrentServerRegion()
	if (serverRegion == nil) then
		ShowMsgBox(GetString(TTC_ERROR), GetString(TTC_ERROR_UNABLETODETECTSERVERREGION), SI_DIALOG_CONFIRM)
		return
	elseif (serverRegion == "NA") then
		self.Data = savedVars.NAData
	else
		self.Data = savedVars.EUData
	end
	self.Settings = savedVars.Settings

	self.PlayerID = GetUnitDisplayName('player')
	self.Guilds = {}

	local FlagIsFirstExecute = function()
		self.Data.IsFirstExecute = false
	end

	if (self.Data.IsFirstExecute == nil or self.Data.IsFirstExecute) then
		ShowMsgBox(GetString(TTC_MSG_THANKSFORUSINGTTC), 
				   GetString(TTC_MSG_FIRSTLOADINFO), 
				   SI_DIALOG_ACCEPT,
				   FlagIsFirstExecute)
	end

	self:CleanUpAutoRecordEntries()
	UpdateGuildList()
	self:InitSettingMenu()

	ZO_CreateStringId("SI_BINDING_NAME_TTC_SCAN_START", GetString(TTC_SCANALLLISTINGS))
	ZO_CreateStringId("SI_BINDING_NAME_TTC_TOGGLE_PRICE_TOOLTIP", GetString(TTC_TOGGLEPRICETOOLTIP))

	self.Buttons = {}
	self.Buttons.StartScanButton = {
		name = GetString(TTC_SCANALLLISTINGS),
		keybind = "TTC_SCAN_START",
		callback = function()
					TamrielTradeCentre:StartNewGuildListingScan()
				   end,
		enabled = function()
					  return not ScanStatus.IsScanning
				  end,
		alignment = KEYBIND_STRIP_ALIGN_LEFT,
	}

	EVENT_MANAGER:RegisterForEvent(self.AddonName, EVENT_CLOSE_TRADING_HOUSE, OnTradingHouseClosed)
	EVENT_MANAGER:RegisterForEvent(self.AddonName, EVENT_TRADING_HOUSE_RESPONSE_RECEIVED, OnTradingHouseResponseReceived)
	EVENT_MANAGER:RegisterForEvent(self.AddonName, EVENT_OPEN_TRADING_HOUSE, OnTradingHouseOpened)
	EVENT_MANAGER:RegisterForEvent(self.AddonName, EVENT_GUILD_HISTORY_RESPONSE_RECEIVED, OnOldStoreHistoryRequested)
	EVENT_MANAGER:RegisterForEvent(self.AddonName, EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE, OnTradingHouseConfirmItemPurchase)

	RequestAllOldStoreHistory()

	TamrielTradeCentrePrice:Init()
end

local function OnAddOnLoaded(eventCode, addOnName)
    if(addOnName ~= TamrielTradeCentre.AddonName) then
		return
    end

	EVENT_MANAGER:UnregisterForEvent(TamrielTradeCentre.AddonName, EVENT_ADD_ON_LOADED)

	TamrielTradeCentre:Init()
end

EVENT_MANAGER:RegisterForEvent(TamrielTradeCentre.AddonName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)