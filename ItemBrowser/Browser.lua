local LCCC = LibCodesCommonCode
local LMAS = LibMultiAccountSets
local LEJ = LibExtendedJournal
local ItemBrowser = ItemBrowser

-- Ensure LMAS is 3.0 or newer
if (LMAS and not LMAS.GetServerAndAccountList) then LMAS = nil end


--------------------------------------------------------------------------------
-- Extended Journal
--------------------------------------------------------------------------------

local TAB_NAME = "ItemBrowser"
local FRAME = ItemBrowserFrame
local DATA_TYPE = 1
local SORT_TYPE = 1

local Initialized = 0
local Dirtiness = 0
local ContextMenuItems = { }

function ItemBrowser.InitializeBrowser( )
	LEJ.RegisterTab(TAB_NAME, {
		name = SI_ITEMBROWSER_TITLE,
		order = 200,
		iconPrefix = "/esoui/art/collections/collections_tabicon_itemsets_",
		control = FRAME,
		settingsPanel = ItemBrowser.settingsPanel,
		binding = "ITEMBROWSER",
		slashCommands = { "/itembrowser", "/ib" },
		callbackShow = function( )
			ItemBrowser.LazyInitializeBrowser()
			ItemBrowser.RefreshBrowser(true)
		end,
	})
end

function ItemBrowser.LazyInitializeBrowser( )
	if (Initialized == 0) then
		Initialized = 1

		-- For the current zone filter
		ItemBrowser.zoneId = GetZoneId(GetUnitZoneIndex("player"))

		-- Colors used in the browser
		ItemBrowser.colors = {
			health  = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_HEALTH)),
			magicka = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_MAGICKA)),
			stamina = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER, POWERTYPE_STAMINA)),
			violet  = GetItemQualityColor(ITEM_DISPLAY_QUALITY_ARTIFACT),
			gold    = GetItemQualityColor(ITEM_DISPLAY_QUALITY_LEGENDARY),
			mythic  = GetItemQualityColor(ITEM_DISPLAY_QUALITY_MYTHIC_OVERRIDE),
			brown   = ZO_ColorDef:New("885533"),
			teal    = ZO_ColorDef:New("66CCCC"),
			pink    = ZO_ColorDef:New("FF99CC"),
		}

		-- Define alliance-specific styles
		local allianceStyles = {
			[ALLIANCE_NONE]                = ITEMSTYLE_NONE,
			[ALLIANCE_ALDMERI_DOMINION]    = ITEMSTYLE_ALLIANCE_ALDMERI,
			[ALLIANCE_EBONHEART_PACT]      = ITEMSTYLE_ALLIANCE_EBONHEART,
			[ALLIANCE_DAGGERFALL_COVENANT] = ITEMSTYLE_ALLIANCE_DAGGERFALL,
		}
		ItemBrowser.allianceStyle = allianceStyles[GetUnitAlliance("player")]

		-- For multi-style items, such as crafted items, just pick a style matching the player's race
		ItemBrowser.multiStyle = GetUnitRaceId("player")
		if (ItemBrowser.multiStyle == 10) then ItemBrowser.multiStyle = ITEMSTYLE_RACIAL_IMPERIAL end

		-- Instantiate the browser
		ItemBrowser.list = ItemBrowserList:New(FRAME, ContextMenuItems)

		-- Listen for changes
		if (LMAS) then
			LMAS.RegisterForCallback(ItemBrowser.name, LMAS.EVENT_COLLECTION_UPDATED, ItemBrowser.RefreshCollections)
		else
			EVENT_MANAGER:RegisterForEvent(ItemBrowser.name, EVENT_ITEM_SET_COLLECTIONS_UPDATED, ItemBrowser.RefreshCollections)
			EVENT_MANAGER:RegisterForEvent(ItemBrowser.name, EVENT_ITEM_SET_COLLECTION_UPDATED, ItemBrowser.RefreshCollections)
		end

		-- Keep the current zone filter updated
		LCCC.MonitorZoneChanges(ItemBrowser.name, function( zoneId )
			ItemBrowser.zoneId = zoneId
			if (Dirtiness == 0) then
				Dirtiness = 1
			end
			ItemBrowser.RefreshBrowser()
		end)

		Initialized = 2
	end
end

function ItemBrowser.RefreshBrowser( noActiveCheck )
	if (Initialized > 1 and Dirtiness > 0 and (noActiveCheck or LEJ.IsTabActive(TAB_NAME))) then
		if (Dirtiness == 1) then
			ItemBrowser.list:RefreshFilters()
		else
			ItemBrowser.list:RefreshCollectionCount()
		end
		Dirtiness = 0
	end
end

function ItemBrowser.RefreshCollections( )
	Dirtiness = 2
	ItemBrowser.RefreshBrowser()
end


--------------------------------------------------------------------------------
-- Register Context Menu
--------------------------------------------------------------------------------

function ItemBrowser.RegisterContextMenuItem( func )
	table.insert(ContextMenuItems, func)
end

ItemBrowser.RegisterContextMenuItem(function( data )
	return SI_ITEM_ACTION_LINK_TO_CHAT, function( )
		ZO_LinkHandler_InsertLink(data.itemLink:gsub(":0(:0:%d+:0|h|h)$", ":1%1", 1))
	end
end)

ItemBrowser.RegisterContextMenuItem(function( data )
	local setId, label, mode = data.setId
	if (not ItemBrowser.vars.favorites[setId]) then
		label, mode = SI_ITEMBROWSER_FAVORITE_ADD, true
	else
		label, mode = SI_ITEMBROWSER_FAVORITE_REMOVE, nil
	end

	return label, function( )
		ItemBrowser.vars.favorites[setId] = mode
		ItemBrowser.list:RefreshFilters()
	end
end)


--------------------------------------------------------------------------------
-- LibMultiAccountSets Support
--------------------------------------------------------------------------------

local SelectedServer, SelectedAccount
local CountUnlockedSlots = GetNumItemSetCollectionSlotsUnlocked
local GetCurrencyCost = GetItemReconstructionCurrencyOptionCost
if (LMAS) then
	CountUnlockedSlots = function(...) return LMAS.GetNumItemSetCollectionSlotsUnlockedForAccountEx(SelectedServer, SelectedAccount, ...) end
	GetCurrencyCost = function(...) return LMAS.GetItemReconstructionCurrencyOptionCostForAccountEx(SelectedServer, SelectedAccount, ...) end
	SelectedServer = LCCC.GetServerName()
end


--------------------------------------------------------------------------------
-- Private/Local Functions
--------------------------------------------------------------------------------

local function MakeItemLink( id, flags, ext )
	local quality = 364
	local crafted = 0
	local health = 10000

	if (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.crafted)) then
		quality = 370
		crafted = 1
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.jewelry)) then
		health = 0
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.weapon) and not ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.shield)) then
		health = 500
	end

	local style = ITEMSTYLE_NONE

	if (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.allianceStyle)) then
		style = ItemBrowser.allianceStyle
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.multiStyle)) then
		style = ItemBrowser.multiStyle
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.manualStyle)) then
		style = ext
	end

	local itemLink = string.format("|H1:item:%d:%d:50:0:0:0:0:0:0:0:0:0:0:0:0:%d:%d:0:0:%d:0|h|h", id, quality, style, crafted, health)

	if (crafted == 1) then
		-- Attach an enchantment to crafted gear

		local enchantments = {
			[ARMORTYPE_NONE]   = 0,
			[ARMORTYPE_HEAVY]  = 26580,
			[ARMORTYPE_LIGHT]  = 26582,
			[ARMORTYPE_MEDIUM] = 26588,
		}

		itemLink = itemLink:gsub("370:50:0:0:0", string.format("370:50:%d:370:50", enchantments[GetItemLinkArmorType(itemLink)]))
	end

	return itemLink
end

local function GetSetBonuses( itemLink, numBonuses )
	local bonuses = { }
	for i = 1, numBonuses do
		bonuses[i] = select(2, GetItemLinkSetBonusInfo(itemLink, false, i))
	end
	return bonuses
end

local function CreateEntryFromRaw( rawEntry )
	local id = rawEntry[1]
	local flags = rawEntry[2]

	local itemLink = MakeItemLink(id, flags, rawEntry[4])
	local subname, itemType, color
	local zoneType = { }

	local _, name, bonuses, _, _, setId = GetItemLinkSetInfo(itemLink)
	name = zo_strformat("<<C:1>>", name)
	subname = rawEntry.alt or ""

	local setSize, setFound, progress
	setSize = GetNumItemSetCollectionPieces(setId)
	if (setSize > 0) then
		setFound = CountUnlockedSlots(setId)
		if (ItemBrowser.vars.usePercentage) then
			progress = setFound / setSize
		else
			progress = 100 - (GetCurrencyCost(setId, CURT_CHAOTIC_CREATIA) or 100)
		end
	else
		setFound = 0
		progress = (ItemBrowser.vars.usePercentage) and 2 or 200
	end

	if (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.crafted)) then
		itemType = string.format("%s (%d)", GetString(SI_ITEMBROWSER_TYPE_CRAFTED), rawEntry[4])
		color = ItemBrowser.colors.pink
		zoneType[0] = true
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.mythic)) then
		itemType = GetString("SI_ITEMDISPLAYQUALITY", ITEM_DISPLAY_QUALITY_MYTHIC_OVERRIDE)
		color = ItemBrowser.colors.mythic
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.jewelry)) then
		itemType = GetString("SI_GAMEPADITEMCATEGORY", GAMEPAD_ITEM_CATEGORY_JEWELRY)
		color = ItemBrowser.colors.violet
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.monster)) then
		itemType = GetString(SI_ITEMBROWSER_TYPE_MONSTER)
		color = ItemBrowser.colors.brown
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.weapon)) then
		subname = zo_strformat("<<t:1>>", GetItemLinkName(itemLink))
		itemType = zo_strformat("<<C:1>>", GetString("SI_ITEMTYPE", ITEMTYPE_WEAPON))
		color = ItemBrowser.colors.gold
	elseif (ItemBrowser.CheckFlag(flags, ItemBrowser.data.flags.mixedWeights)) then
		itemType = GetString("SI_DYEHUECATEGORY", DYE_HUE_CATEGORY_MIXED)
		color = ItemBrowser.colors.teal
	else
		armorType = GetItemLinkArmorType(itemLink)

		local armorColors = {
			[ARMORTYPE_NONE]   = ZO_DEFAULT_TEXT,
			[ARMORTYPE_HEAVY]  = ItemBrowser.colors.health,
			[ARMORTYPE_LIGHT]  = ItemBrowser.colors.magicka,
			[ARMORTYPE_MEDIUM] = ItemBrowser.colors.stamina,
		}

		itemType = zo_strformat("<<C:1>>", GetString("SI_ARMORTYPE", armorType))
		color = armorColors[armorType]
	end

	local sources, zoneIds = { }, { }
	for _, source in ipairs(rawEntry[3]) do
		if (type(source) == "number") then
			table.insert(sources, ItemBrowser.GetZoneNameById(source))
			zoneIds[source] = true
			zoneType[ItemBrowser.data.zoneClassification[source]] = true
		elseif (type(source) == "table") then
			local subSources = { }
			for _, subSource in ipairs(source) do
				table.insert(subSources, ItemBrowser.GetZoneNameById(subSource))
			end
			sources[#sources] = string.format("%s (%s)", sources[#sources], table.concat(subSources, ", "))
		end
	end

	zoneType[(GetItemLinkBindType(itemLink) == BIND_TYPE_ON_EQUIP) and 6 or 7] = true

	return {
		type = SORT_TYPE,
		name = name,
		subname = subname,
		itemType = itemType,
		source = table.concat(sources, ", "),
		zoneIds = zoneIds,
		zoneType = zoneType,
		color = color,
		bonuses = bonuses,
		itemLink = itemLink,
		setId = setId,
		setSize = setSize,
		setFound = setFound,
		progress = progress,
	}
end


--------------------------------------------------------------------------------
-- ItemBrowserList
--------------------------------------------------------------------------------

ItemBrowserList = ExtendedJournalSortFilterList:Subclass()
local ItemBrowserList = ItemBrowserList

function ItemBrowserList:Setup( )
	ZO_ScrollList_AddDataType(self.list, DATA_TYPE, "ItemBrowserListRow", 30, function(...) self:SetupItemRow(...) end)
	ZO_ScrollList_EnableHighlight(self.list, "ZO_ThinListHighlight")
	self:SetAlternateRowBackgrounds(true)

	self.masterList = { }

	local sortKeys = {
		["name"]     = { caseInsensitive = true },
		["itemType"] = { caseInsensitive = true, tiebreaker = "name", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["source"]   = { caseInsensitive = true, tiebreaker = "itemType", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["progress"] = { isNumeric = true, tiebreaker = "setSize" },
		["setSize"]  = { isNumeric = true, tiebreaker = "name", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
	}

	self.currentSortKey = "name"
	self.currentSortOrder = ZO_SORT_ORDER_UP
	self.sortHeaderGroup:SelectAndResetSortForKey(self.currentSortKey)
	self.sortFunction = function( listEntry1, listEntry2 )
		return ZO_TableOrderingFunction(listEntry1.data, listEntry2.data, self.currentSortKey, sortKeys, self.currentSortOrder)
	end

	self.filterDrop = ZO_ComboBox_ObjectFromContainer(self.frame:GetNamedChild("FilterDrop"))
	self:InitializeComboBox(self.filterDrop, { prefix = "SI_ITEMBROWSER_FILTERDROP", max = 12 }, ItemBrowser.vars.filterId)

	self.searchDrop = ZO_ComboBox_ObjectFromContainer(self.frame:GetNamedChild("SearchDrop"))
	self:InitializeComboBox(self.searchDrop, { prefix = "SI_ITEMBROWSER_SEARCHDROP", max = 2 })

	self.searchBox = self.frame:GetNamedChild("SearchBox")
	self.searchBox:SetHandler("OnTextChanged", function() self:RefreshFilters() end)
	self.search = self:InitializeSearch(SORT_TYPE)

	if (LMAS) then
		local servers = LMAS.GetServerAndAccountList(true)

		if (#servers > 1 or #servers[1].accounts > 1) then
			local control = self.frame:GetNamedChild("AccountDrop")
			control:GetNamedChild("Caption"):SetText(GetString(SI_ITEMBROWSER_ACCOUNT_LABEL))
			control:SetHidden(false)
			self.accountDrop = ZO_ComboBox_ObjectFromContainer(control)

			if (#servers > 1) then
				local control = self.frame:GetNamedChild("ServerDrop")
				control:GetNamedChild("Caption"):SetText(GetString(SI_LEJ_SERVER))
				control:SetHidden(false)
				self.serverDrop = ZO_ComboBox_ObjectFromContainer(control)
				self:InitializeComboBox(self.serverDrop, { list = servers, key = "server" }, nil, true, function( comboBox, entryText, entry, selectionChanged )
					SelectedServer = entryText
					self:RefreshAccountList()
				end)
			else
				self:RefreshAccountList()
			end
		end
	end

	self:RefreshData()
end

function ItemBrowserList:BuildMasterList( )
	self.masterList = { }
	for _, item in ipairs(ItemBrowser.data.items) do
		table.insert(self.masterList, CreateEntryFromRaw(item))
	end
end

function ItemBrowserList:FilterScrollList( )
	--[[ Sourcing Filter
	All Categories	: filterId = 1
	Collectible		: filterId = 2
	Crafted			: filterId = 3, zoneType = 0
	Overland		: filterId = 4, zoneType = 1
	PvP				: filterId = 5, zoneType = 2
	Dungeons		: filterId = 6, zoneType = 3
	Trials			: filterId = 7, zoneType = 4
	Antiquities		: filterId = 8, zoneType = 5
	Bind On Equip	: filterId = 9, zoneType = 6
	Bind On Pickup	: filterId = 10, zoneType = 7
	Current Zone	: filterId = 11
	--]]

	local scrollData = ZO_ScrollList_GetDataList(self.list)
	ZO_ClearNumericallyIndexedTable(scrollData)

	self.searchType = self.searchDrop:GetSelectedItemData().id
	local filterId = self.filterDrop:GetSelectedItemData().id
	ItemBrowser.vars.filterId = filterId

	local searchInput = self.searchBox:GetText()

	-- Pre-check for the current zone ID; all of the "main" gear zones
	-- should have a valid zoneClassification, so if we can't match
	-- our current zone ID or our parent zone ID to a zoneClassification,
	-- then there's no point in checking against the zone IDs for each set
	local zoneId = 0
	if (filterId == 11) then
		zoneId = ItemBrowser.zoneId
		if (not ItemBrowser.data.zoneClassification[zoneId]) then
			zoneId = GetParentZoneId(zoneId)
			if (not ItemBrowser.data.zoneClassification[zoneId]) then
				zoneId = 0
			end
		end
	end

	local totalCollectibles = 0
	local foundCollectibles = 0

	for _, data in ipairs(self.masterList) do
		if ( (filterId == 1 or (filterId == 2 and data.setSize > 0) or (filterId == 12 and ItemBrowser.vars.favorites[data.setId]) or (data.zoneType[filterId - 3] and not (filterId > 3 and filterId < 9 and data.zoneType[0])) or (zoneId > 0 and data.zoneIds[zoneId])) and
		     (searchInput == "" or self:CheckForMatch(data, searchInput)) ) then
			table.insert(scrollData, ZO_ScrollList_CreateDataEntry(DATA_TYPE, data))
			if (data.setSize > 0) then
				totalCollectibles = totalCollectibles + data.setSize
				foundCollectibles = foundCollectibles + data.setFound
			end
		end
	end

	self.frame:GetNamedChild("CollectedCount"):SetText((totalCollectibles > 0) and string.format(GetString(SI_ITEMBROWSER_COLLECTED_COUNT), foundCollectibles, totalCollectibles, 100 * foundCollectibles / totalCollectibles) or "")

	if (#scrollData ~= #self.masterList) then
		self.frame:GetNamedChild("Counter"):SetText(string.format("%d / %d", #scrollData, #self.masterList))
	else
		self.frame:GetNamedChild("Counter"):SetText(string.format("%d", #self.masterList))
	end
end

function ItemBrowserList:SetupItemRow( control, data )
	local cell, cell2

	cell = control:GetNamedChild("Name")
	cell.normalColor = ZO_DEFAULT_TEXT
	cell:SetText(data.name)

	cell = control:GetNamedChild("Type")
	cell.nonRecolorable = true
	cell:SetColor(data.color:UnpackRGBA())
	cell:SetText(data.itemType)

	cell = control:GetNamedChild("Source")
	cell.normalColor = ZO_DEFAULT_TEXT
	cell:SetText(data.source)

	cell = control:GetNamedChild("Collected")
	cell2 = control:GetNamedChild("CollectedCount")
	if (data.setSize > 0) then
		local color = 0

		if (ItemBrowser.vars.usePercentage) then
			local progress = data.progress
			if (progress == 0) then
				color = 0xCC0000CC
			elseif (progress > 0 and progress < 0.5) then
				color = 0xFFCC0099
			elseif (progress >= 0.5 and progress < 0.75) then
				color = 0xFFFF00CC
			elseif (progress >= 0.75 and progress < 1) then
				color = 0xCCFF00CC
			elseif (progress == 1) then
				color = 0x00FF00CC
			end
			cell:SetText(string.format("%d%%", 100 * progress))
		else
			local progress = 100 - data.progress
			if (progress > 75) then
				color = 0xCC0000CC
			elseif (progress > 50 and progress <= 75) then
				color = 0xFFCC0099
			elseif (progress > 35 and progress <= 50) then
				color = 0xFFFF00CC
			elseif (progress > 25 and progress <= 35) then
				color = 0xCCFF00CC
			elseif (progress == 25) then
				color = 0x00FF00CC
			end
			cell:SetText(ItemBrowser.FormatTransmuteCost(progress))
		end

		cell.nonRecolorable = true
		cell:SetColor(LCCC.Int32ToRGBA(color))

		cell2.nonRecolorable = true
		cell2:SetColor(LCCC.Int32ToRGBA(0xFFFFFF66))
		cell2:SetText(string.format("%d/%d", data.setFound, data.setSize))
	else
		cell:SetText("")
		cell2:SetText("")
	end

	self:SetupRow(control, data)
end

function ItemBrowserList:RefreshCollectionCount( )
	if (Initialized < 2) then return end

	for _, data in ipairs(self.masterList) do
		if (data.setSize > 0) then
			data.setFound = CountUnlockedSlots(data.setId)
			if (ItemBrowser.vars.usePercentage) then
				data.progress = data.setFound / data.setSize
			else
				data.progress = 100 - (GetCurrencyCost(data.setId, CURT_CHAOTIC_CREATIA) or 100)
			end
		end
	end

	self:RefreshFilters()
end

function ItemBrowserList:OrderedSearch( haystack, needles )
	-- A search for "spell damage" should match "Spell and Weapon Damage" but
	-- not "damage from enemy spells", so search term order must be considered

	haystack = haystack:lower()
	needles = needles:lower()

	local i = 0

	for needle in needles:gmatch("%S+") do
		i = haystack:find(needle, i + 1, true)
		if (not i) then return false end
	end

	return true
end

function ItemBrowserList:SearchSetBonuses( bonuses, searchInput )
	local curpos = 1
	local delim
	local exclude = false

	repeat
		local found = false

		delim = searchInput:find("[+,-]", curpos)
		if (not delim) then delim = 0 end

		local searchQuery = searchInput:sub(curpos, delim - 1)

		if (searchQuery:find("%S+")) then
			for _, bonus in ipairs(bonuses) do
				if (self:OrderedSearch(bonus, searchQuery)) then
					found = true
					break
				end
			end

			if (found == exclude) then return false end
		end

		curpos = delim + 1
		if (delim ~= 0) then exclude = searchInput:sub(delim, delim) == "-" end
	until delim == 0

	return true
end

function ItemBrowserList:CheckForMatch( data, searchInput )
	local curpos = 1
	local delim

	repeat
		delim = searchInput:find("|", curpos)
		if (not delim) then delim = 0 end

		local searchFragment = searchInput:sub(curpos, delim - 1)

		-- Allow empty query if it is the only (i.e., first and last) query
		if (searchFragment:find("%S+") or (curpos == 1 and delim == 0)) then
			if (self.searchType == 1) then
				if (self.search:IsMatch(searchFragment, data)) then return true end
			elseif (self.searchType == 2) then
				if (type(data.bonuses) == "number") then
					-- Lazy initialization of set bonus data
					data.bonuses = GetSetBonuses(data.itemLink, data.bonuses)
				end
				if (self:SearchSetBonuses(data.bonuses, searchFragment)) then return true end
			end
		end

		curpos = delim + 1
	until delim == 0

	return false
end

function ItemBrowserList:ProcessItemEntry( stringSearch, data, searchTerm, cache )
	if (searchTerm == "+") then
		return data.setSize == data.setFound
	elseif (searchTerm == "-") then
		return data.setSize > data.setFound
	end

	if ( zo_plainstrfind(data.name:lower(), searchTerm) or
	     zo_plainstrfind(data.subname:lower(), searchTerm) or
	     zo_plainstrfind(data.itemType:lower(), searchTerm) or
	     zo_plainstrfind(data.source:lower(), searchTerm) ) then
		return true
	end

	return false
end

function ItemBrowserList:RefreshAccountList( )
	local accounts
	for _, server in ipairs(LMAS.GetServerAndAccountList(true)) do
		if (SelectedServer == server.server or not accounts) then
			accounts = server.accounts
		end
	end

	-- Try to keep the same account selected when changing servers
	local initialIndex
	for i, account in ipairs(accounts) do
		if (SelectedAccount == account) then
			initialIndex = i
		end
	end

	self:InitializeComboBox(self.accountDrop, { list = accounts }, initialIndex, true, function( comboBox, entryText, entry, selectionChanged )
		SelectedAccount = entryText
		self:RefreshCollectionCount()
	end)
end


--------------------------------------------------------------------------------
-- XML Handlers
--------------------------------------------------------------------------------

local Tooltip = ItemTooltip

function ItemBrowserListRow_OnMouseEnter( control )
	local data = ZO_ScrollList_GetData(control)
	ItemBrowser.list:Row_OnMouseEnter(control)

	local itemLink = data.itemLink
	Tooltip = LEJ.ItemTooltip(itemLink)
	ItemBrowser.AddTooltipExtension(Tooltip, itemLink, SelectedAccount, 0x0B, nil, SelectedServer) -- See FLAG_BROWSER_ITEM in Tooltip.lua
end

function ItemBrowserListRow_OnMouseExit( control )
	ItemBrowser.list:Row_OnMouseExit(control)

	ClearTooltip(Tooltip)
end

function ItemBrowserListRow_OnMouseUp( ... )
	ItemBrowser.list:Row_OnMouseUp(...)
end
