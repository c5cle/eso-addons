local LCCC = LibCodesCommonCode

if (LibCharacterKnowledge) then return end
local Public = { }
LibCharacterKnowledge = Public


--------------------------------------------------------------------------------
-- Internal Components
--------------------------------------------------------------------------------

local Internal = {
	name = "LibCharacterKnowledge",

	CATEGORY_RECIPE = "recipes",
	CATEGORY_PLAN = "plans",
	CATEGORY_MOTIF = "motifs",
	CATEGORY_NONE = false,
	CATEGORY_INVALID = nil,

	QUALITY_LOW = 1,
	QUALITY_MEDIUM = 2,
	QUALITY_HIGH = 3,

	KNOWLEDGE_INVALID = -1,
	KNOWLEDGE_NODATA = 0,
	KNOWLEDGE_KNOWN = 1,
	KNOWLEDGE_UNKNOWN = 2,

	PRIORITY_CLASSES = 13,

	-- Data format parameters
	FORMAT_VERSION = 1,
	ENCODE_BITS = 6, -- 6-bit encoding
	FIELD_BITS = 30, -- Encoding block size for character knowledge
	FIELD_BYTES = 5, -- FIELD_BITS / ENCODE_BITS

	scanThrottle = 200, -- 0.2s

	server = LCCC.GetServerName(),
	userId = GetDisplayName(),
	charId = GetCurrentCharacterId(),

	ids = { },
	idsPublic = { },
	caches = { },
	cachedCharLists = { },
	initialized = false,

	diagnostics = { },
}
LibCharacterKnowledgeInternal = Internal

LCCC.RunAfterInitialLoadscreen(function( )
	zo_callLater(Internal.Initialize, Internal.scanThrottle)
end)


--------------------------------------------------------------------------------
-- Diagnostics
--------------------------------------------------------------------------------

local Diagnostics = Internal.diagnostics

function Diagnostics.Stopwatch( start )
	local tick = GetGameTimeMilliseconds()
	if (start) then
		Diagnostics.times = { }
	else
		table.insert(Diagnostics.times, tick - Diagnostics.tick)
	end
	Diagnostics.tick = tick
end

function Diagnostics.LogTime( name )
	Diagnostics.Stopwatch()

	if (not Diagnostics.vars[name]) then
		Diagnostics.vars[name] = { next = 1 }
	end
	local history = Diagnostics.vars[name]

	if (#Diagnostics.times == 1) then
		history[history.next] = string.format("%dms", Diagnostics.times[1])
	else
		local total = 0
		for _, time in ipairs(Diagnostics.times) do
			total = total + time
		end
		history[history.next] = string.format("%dms (%s)", total, table.concat(Diagnostics.times, "/"))
	end

	history.next = history.next % 4 + 1
end


--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

Internal.Categories = {
	Internal.CATEGORY_RECIPE,
	Internal.CATEGORY_PLAN,
	Internal.CATEGORY_MOTIF,
}

Internal.KnowFunctions = {
	[Internal.CATEGORY_RECIPE] = IsItemLinkRecipeKnown,
	[Internal.CATEGORY_PLAN] = IsItemLinkRecipeKnown,
	[Internal.CATEGORY_MOTIF] = IsItemLinkBookKnown,
}

Internal.CategoryLabels = {
	[Internal.CATEGORY_RECIPE] = zo_strformat("<<1>>", GetString("SI_ITEMTYPE", ITEMTYPE_RECIPE)),
	[Internal.CATEGORY_PLAN] = zo_strformat("<<1>>", GetString("SI_PROVISIONERSPECIALINGREDIENTTYPE_TRADINGHOUSERECIPECATEGORY", PROVISIONER_SPECIAL_INGREDIENT_TYPE_FURNISHING)),
	[Internal.CATEGORY_MOTIF] = zo_strformat("<<1>>", GetString("SI_ITEMTYPE", ITEMTYPE_RACIAL_STYLE_MOTIF)),
}

Internal.ItemQualityTranslation = {
	[ITEM_FUNCTIONAL_QUALITY_TRASH]     = Internal.QUALITY_LOW,
	[ITEM_FUNCTIONAL_QUALITY_NORMAL]    = Internal.QUALITY_LOW,
	[ITEM_FUNCTIONAL_QUALITY_MAGIC]     = Internal.QUALITY_LOW,
	[ITEM_FUNCTIONAL_QUALITY_ARCANE]    = Internal.QUALITY_MEDIUM,
	[ITEM_FUNCTIONAL_QUALITY_ARTIFACT]  = Internal.QUALITY_HIGH,
	[ITEM_FUNCTIONAL_QUALITY_LEGENDARY] = Internal.QUALITY_HIGH,
}

function Internal.Msg( text )
	CHAT_ROUTER:AddSystemMessage(text)
end

function Internal.MsgTag( text )
	CHAT_ROUTER:AddSystemMessage(string.format("[%s] %s", Internal.name, text))
end

function Internal.GetItemLink( itemId, linkStyle )
	return string.format("|H%d:item:%d:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", linkStyle or LINK_STYLE_DEFAULT, itemId)
end

function Internal.TranslateItem( item )
	-- Return: itemId, itemLink, styleId
	local itemId, itemLink, styleId = 0, ""

	if (type(item) == "number") then
		itemId, itemLink = item, Internal.GetItemLink(item)
	elseif (type(item) == "string") then
		itemId, itemLink = GetItemLinkItemId(item), item
	elseif (type(item) == "table") then
		if (type(item.styleId) == "number") then
			styleId = item.styleId
			local data = Internal.GetStyleMotifItems(styleId)
			if (data) then
				if (type(item.chapterId) == "number" and item.chapterId ~= ITEM_STYLE_CHAPTER_ALL) then
					itemId = data.chapters[item.chapterId] or itemId
				else
					itemId = data.books[1] or itemId
				end
			end
		end
		if (type(item.itemId) == "number") then itemId = item.itemId end
		if (type(item.itemLink) == "string") then itemLink = item.itemLink end
		if (itemId == 0 and itemLink ~= "") then
			itemId = Internal.GetItemLink(itemLink)
		elseif (itemId ~= 0 and itemLink == "") then
			itemLink = GetItemLinkItemId(itemId)
		end
	end

	return itemId, itemLink, styleId
end

function Internal.GetItemCategoryAndQuality( item )
	local itemId, itemLink, styleId = Internal.TranslateItem(item)
	local itemType, specializedItemType = GetItemLinkItemType(itemLink)

	if (itemType == ITEMTYPE_NONE) then
		if (styleId) then
			return Internal.CATEGORY_MOTIF, Internal.GetStyleQuality(styleId)
		else
			return Internal.CATEGORY_INVALID
		end
	elseif (itemType == ITEMTYPE_RECIPE) then
		local quality = Internal.ItemQualityTranslation[GetItemLinkFunctionalQuality(itemLink)]
		if (specializedItemType == SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_FOOD or specializedItemType == SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_DRINK) then
			return Internal.CATEGORY_RECIPE, quality
		else
			return Internal.CATEGORY_PLAN, quality
		end
	elseif (itemType == ITEMTYPE_RACIAL_STYLE_MOTIF) then
		styleId = Internal.GetMotifStyleAndChapter(itemId)
		return Internal.CATEGORY_MOTIF, Internal.GetStyleQuality(styleId)
	else
		return Internal.CATEGORY_NONE
	end
end

function Internal.GetMasterListParam( key )
	if (Internal.vars.masterList and type(Internal.vars.masterList[key]) == "number") then
		return Internal.vars.masterList[key]
	else
		return -1
	end
end

function Internal.CanSave( account )
	if (not account) then account = Internal.userId end
	if (Internal.vars.noSave and Internal.vars.noSave[zo_strlower(account)]) then
		return false
	else
		return true
	end
end

function Internal.GetCaches( server, charId )
	if (not Internal.caches[server]) then
		Internal.caches[server] = { }
	end
	if (not Internal.caches[server][charId]) then
		Internal.caches[server][charId] = { }
	end
	return Internal.caches[server][charId]
end

function Internal.GetKnowledge( server, charId, category )
	if (not server) then server = Internal.server end

	-- Read the encoded bitfield data and expand it into a cached table suitable for active use
	local caches = Internal.GetCaches(server, charId)
	if (not caches[category]) then
		caches[category] = { }
		local char = Internal.characters[server] and Internal.characters[server][charId]
		if (char and char[category]) then
			local encoded = LCCC.Unchunk(char[category])
			local field = 0

			-- Since the cache is sparsely populated with only known items, this
			-- prevents the cache from being completely empty
			caches[category][Internal.ids[category][1]] = false

			for i, id in ipairs(Internal.ids[category]) do
				local j = (i - 1) % Internal.FIELD_BITS + 1
				if (j == 1) then
					-- Start of a new field
					local k = zo_ceil(i / Internal.ENCODE_BITS)
					field = LCCC.Decode(zo_strsub(encoded, k, k + Internal.FIELD_BYTES - 1))
				end
				local bit = BitLShift(1, Internal.FIELD_BITS - j)
				if (BitAnd(field, bit) == bit) then
					caches[category][id] = true
				end
			end
		end
	end
	return caches[category]
end

function Internal.GetItemKnowledge( server, charId, category, itemId, itemLink, styleId )
	if (itemId == 0 and styleId) then
		local data = Internal.GetStyleMotifItems(styleId)
		if (data and #data.chapters > 0) then
			for _, chapter in ipairs(data.chapters) do
				local result = Internal.GetItemKnowledge(server, charId, category, Internal.TranslateItem(chapter))
				if (result ~= Internal.KNOWLEDGE_KNOWN) then
					return result
				end
			end
			return Internal.KNOWLEDGE_KNOWN
		else
			return Internal.KNOWLEDGE_INVALID
		end
	elseif (category) then
		local fallback = Internal.KNOWLEDGE_NODATA

		-- Use direct determination if possible since there is a scan delay when
		-- learning new items
		if ((not server or server == Internal.server) and charId == Internal.charId) then
			if (Internal.KnowFunctions[category](itemLink)) then
				return Internal.KNOWLEDGE_KNOWN
			elseif (category ~= Internal.CATEGORY_MOTIF) then
				return Internal.KNOWLEDGE_UNKNOWN
			else
				-- The motif book bug makes the unknown status unreliable
				fallback = Internal.KNOWLEDGE_UNKNOWN
			end
		end

		-- Use internal data for all other scenarios
		local cache = Internal.GetKnowledge(server, charId, category)
		if (next(cache) == nil) then
			return fallback
		elseif (cache[itemId] == true) then
			return Internal.KNOWLEDGE_KNOWN
		else
			return Internal.KNOWLEDGE_UNKNOWN
		end
	else
		-- CATEGORY_NONE is false and CATEGORY_INVALID is nil
		return Internal.KNOWLEDGE_INVALID
	end
end

local function IsSet( value )
	return value ~= nil and value ~= 0
end

function Internal.IsCharacterEnabled( server, charId )
	local result
	local char = Internal.characters[server] and Internal.characters[server][charId]
	if (char) then
		result = char.settings and char.settings.enabled
		if (not IsSet(result)) then
			local account = Internal.accounts[server] and Internal.accounts[server][char.account]
			result = account and account.enabled
		end
	end
	return not (result == 2)
end

function Internal.GetEffectiveParameterValue( server, charId, param )
	local char = Internal.characters[server] and Internal.characters[server][charId]
	if (char) then
		if (char.settings and IsSet(char.settings[param])) then
			return char.settings[param]
		elseif (Internal.accounts[server]) then
			local account = Internal.accounts[server][char.account] or Internal.accounts[server].defaults
			if (account and IsSet(account[param])) then
				return account[param]
			end
		end
	end
	return Internal.vars.defaults[param]
end

function Internal.Sort( server, charIds, usePriority )
	-- The default sort algorithm gets confused by the long numeric sequences in character IDs, so it's necessary to break it down
	local prep = function( charId )
		local SPLIT = 8
		local length = zo_strlen(charId)
		local result = {
			zo_strsub(charId, 1, length - SPLIT),
			zo_strsub(charId, length - SPLIT + 1, length),
		}
		return table.concat(result, "_")
	end

	if (usePriority) then
		table.sort(charIds, function( a, b )
			pa = Internal.GetEffectiveParameterValue(server, a, "priority")
			pb = Internal.GetEffectiveParameterValue(server, b, "priority")
			if (pa == pb) then
				return prep(a) < prep(b)
			else
				return pa < pb
			end
		end)
	else
		table.sort(charIds, function( a, b )
			return prep(a) < prep(b)
		end)
	end
end

function Internal.NotifyRefresh( invalidateCharacterList )
	if (invalidateCharacterList) then
		Internal.cachedCharLists = { }
	end
	Internal.FireCallbacks(Public.EVENT_UPDATE_REFRESH, invalidateCharacterList)
end


--------------------------------------------------------------------------------
-- Motif Associations
--------------------------------------------------------------------------------

function Internal.LoadMotifData( )
	Internal.motifAssociations = {
		motifs = { },
		styles = { },
		styleIds = { },
	}
	local data = Internal.motifAssociations
	local blacklist = Internal.InvalidIds

	-- Associate style and chapter IDs with motif item IDs
	local FIELD_ITEM_ID = 3 -- 18 bits: 0-17 = itemId
	local FIELD_PAYLOAD = 2 -- 12 bits: 0-3 = chapterId, 4-11 = styleId

	local encoded = LCCC.Unchunk(Internal.MotifData)
	local length = zo_strlen(encoded)
	local i, j = 1
	while (i < length) do
		j = i + FIELD_ITEM_ID
		local itemId = LCCC.Decode(zo_strsub(encoded, i, j - 1))
		i = j

		j = i + FIELD_PAYLOAD
		local payload = LCCC.Decode(zo_strsub(encoded, i, j - 1))
		i = j

		local chapterId = BitAnd(payload, 0xF)
		local styleId = BitRShift(payload, 4)

		data.motifs[itemId] = { styleId, chapterId }

		if (not blacklist[itemId]) then
			if (not data.styles[styleId]) then
				data.styles[styleId] = {
					books = { },
					chapters = { },
				}
			end

			if (chapterId == ITEM_STYLE_CHAPTER_ALL) then
				table.insert(data.styles[styleId].books, itemId)
			else
				data.styles[styleId].chapters[chapterId] = itemId
			end
		end
	end

	-- Associate motif numbers and crown-exclusive status with style IDs
	local FIELD_METADATA = 3 -- 18 bits: 0-7 = styleId, 8-15 = number, 16 = crown, 17 = unused

	encoded = Internal.MotifData.metadata
	length = zo_strlen(encoded)
	i = 1
	while (i < length) do
		j = i + FIELD_METADATA
		local payload = LCCC.Decode(zo_strsub(encoded, i, j - 1))
		i = j

		local style = data.styles[BitAnd(payload, 0xFF)]
		style.number = BitAnd(BitRShift(payload, 8), 0xFF)
		style.crown = BitRShift(payload, 16) == 1
	end

	-- Build list of valid style IDs, omitting ones that were mined from a future patch and are not active in the current patch
	for styleId, style in pairs(data.styles) do
		if (Internal.GetItemCategoryAndQuality(style.books[1] or style.chapters[ITEM_STYLE_CHAPTER_CHESTS]) == Internal.CATEGORY_MOTIF) then
			table.insert(data.styleIds, styleId)
		end
	end
	table.sort(data.styleIds)
end

function Internal.GetMotifStyleAndChapter( itemId, _, styleId )
	-- Returns styleId, chapterId
	local data = Internal.motifAssociations
	if (data and data.motifs[itemId]) then
		return unpack(data.motifs[itemId])
	elseif (data and styleId) then
		return styleId, ITEM_STYLE_CHAPTER_ALL
	else
		return 0, 0
	end
end

function Internal.GetStyleIds( )
	local data = Internal.motifAssociations
	return data and data.styleIds
end

function Internal.GetStyleMotifItems( styleId )
	local data = Internal.motifAssociations
	return data and data.styles[styleId]
end

function Internal.GetStyleQuality( styleId )
	return Internal.StyleQuality[styleId] or Internal.QUALITY_HIGH
end


--------------------------------------------------------------------------------
-- Initialization: Master List
--------------------------------------------------------------------------------

function Internal.Initialize( )
	Diagnostics.Stopwatch(true)

	-- Schedule the settings panel initialization
	Public.RegisterForCallback(Internal.name, Public.EVENT_INITIALIZED, Internal.RegisterSettingsPanel)

	-- Initialize data store
	if (not LibCharacterKnowledgeData or LibCharacterKnowledgeData.formatVersion ~= Internal.FORMAT_VERSION) then
		LibCharacterKnowledgeData = {
			formatVersion = Internal.FORMAT_VERSION,
		}
	end
	Internal.vars = LibCharacterKnowledgeData

	-- Diagnostics
	if (not Internal.vars.diagnostics) then
		Internal.vars.diagnostics = { }
	end
	Diagnostics.vars = Internal.vars.diagnostics

	-- Default settings
	if (not Internal.vars.defaults) then
		Internal.vars.defaults = {
			[Internal.CATEGORY_RECIPE] = 4,
			[Internal.CATEGORY_PLAN] = 4,
			[Internal.CATEGORY_MOTIF] = 4,
			priority = zo_ceil(Internal.PRIORITY_CLASSES / 2),
		}
	end

	-- Initialize account and character sections
	for _, key in ipairs({ "accounts", "characters" }) do
		if (not Internal.vars[key]) then
			Internal.vars[key] = { }
		end
		if (not Internal.vars[key][Internal.server]) then
			Internal.vars[key][Internal.server] = { }
		end
		Internal[key] = Internal.vars[key]
	end

	-- Load motif associations
	Internal.LoadMotifData()

	-- Initialize the master list
	Diagnostics.Stopwatch()
	if (Internal.GetMasterListParam("api") > 0 and Internal.GetMasterListParam("fieldSize") > 0) then
		Internal.ReadMasterList()
	else
		Internal.Datamine()
	end
end

function Internal.ReadMasterList( )
	local fieldSize = Internal.GetMasterListParam("fieldSize")

	for _, category in ipairs(Internal.Categories) do
		local encoded = LCCC.Unchunk(Internal.vars.masterList[category])
		local length = zo_strlen(encoded)
		local decoded = { }
		local i, j = 1
		while (i < length) do
			j = i + fieldSize
			table.insert(decoded, LCCC.Decode(zo_strsub(encoded, i, j - 1)))
			i = j
		end
		Internal.ids[category] = decoded
	end

	if (Internal.GetMasterListParam("api") == GetAPIVersion()) then
		Internal.InitializeCharacterData()
	else
		Internal.MigrateData("start")
	end
end

function Internal.WriteMasterList( maxId )
	local fieldSize = zo_ceil(math.log(maxId) / math.log(64))

	Internal.vars.masterList = {
		api = GetAPIVersion(),
		fieldSize = fieldSize,
	}

	Diagnostics.vars.masterList = { }

	for _, category in ipairs(Internal.Categories) do
		local encoded = { }
		for _, id in ipairs(Internal.ids[category]) do
			table.insert(encoded, LCCC.Encode(id, fieldSize))
		end
		Internal.vars.masterList[category] = LCCC.Chunk(table.concat(encoded, ""))
		Diagnostics.vars.masterList[category] = #encoded
	end

	Internal.MsgTag(GetString(SI_LCK_SCAN_COMPLETE))
	Internal.MigrateData("flush")
	Internal.InitializeCharacterData()
end

function Internal.Datamine( )
	Internal.MsgTag(GetString(SI_LCK_SCAN_START))

	local BLOCK_SIZE = 10000 -- Block size

	for _, category in ipairs(Internal.Categories) do
		Internal.ids[category] = { }
	end

	local startId = 1
	local invalidCount = 0
	local lastValidId = 0

	EVENT_MANAGER:RegisterForUpdate(Internal.name, Internal.scanThrottle, function( )
		local stopId = startId + BLOCK_SIZE
		for i = startId, stopId - 1 do
			local category = Internal.GetItemCategoryAndQuality(i)
			if (category == Internal.CATEGORY_INVALID) then
				invalidCount = invalidCount + 1
				if (invalidCount == BLOCK_SIZE) then
					-- Conclude the scan when we see a very large number of consecutive invalid items (highest observed: 4515)
					EVENT_MANAGER:UnregisterForUpdate(Internal.name)
					return Internal.WriteMasterList(lastValidId)
				end
			else
				invalidCount = 0
				lastValidId = i
				if (category ~= Internal.CATEGORY_NONE) then
					table.insert(Internal.ids[category], i)
				end
			end
		end
		startId = stopId
	end)
end

function Internal.MigrateData( phase )
	if (phase == "start") then
		-- Start the data migration by decoding all knowledge data into cache using the old master list
		for server, characters in pairs(Internal.characters) do
			for id, data in pairs(characters) do
				for _, category in ipairs(Internal.Categories) do
					if (data[category]) then
						Internal.GetKnowledge(server, id, category)
					end
				end
			end
		end
		-- Build a new master list
		Internal.Datamine()
	elseif (phase == "flush") then
		-- Re-encode and flush the knowledge data from cache using the new master list
		-- Note: The only scenario in which cache is populated at this point is if data is being migrated
		for server, characters in pairs(Internal.caches) do
			for id, data in pairs(characters) do
				for _, category in ipairs(Internal.Categories) do
					if (data[category]) then
						Internal.ScanAndEncodeKnowledgeCategory(server, id, category, data[category])
					end
				end
			end
		end
	end
end


--------------------------------------------------------------------------------
-- Initialization: Accounts and Characters
--------------------------------------------------------------------------------

function Internal.InitializeCharacterData( )
	Diagnostics.Stopwatch()

	local charactersLocal = Internal.characters[Internal.server]
	local exists = { }

	-- Create entries for every character on the account
	if (Internal.CanSave()) then
		for i = 1, GetNumCharacters() do
			local name, _, _, _, _, _, id = GetCharacterInfo(i)
			if (not charactersLocal[id]) then
				charactersLocal[id] = { }
			end
			charactersLocal[id].account = Internal.userId
			charactersLocal[id].name = zo_strformat("<<1>>", name)
			exists[id] = true
		end
	end

	-- Delete characters that no longer exist or are on the no-save list
	for id, data in pairs(charactersLocal) do
		if ((data.account == Internal.userId and not exists[id]) or not Internal.CanSave(data.account)) then
			charactersLocal[id] = nil
		end
	end

	-- Initial scan
	Internal.ScanKnowledge()

	-- Listen for changes
	EVENT_MANAGER:RegisterForEvent(Internal.name, EVENT_MULTIPLE_RECIPES_LEARNED, Internal.RefreshKnowledge)
	EVENT_MANAGER:RegisterForEvent(Internal.name, EVENT_RECIPE_LEARNED, Internal.RefreshKnowledge)
	EVENT_MANAGER:RegisterForEvent(Internal.name, EVENT_STYLE_LEARNED, Internal.RefreshKnowledge)
end

function Internal.RefreshKnowledge( )
	EVENT_MANAGER:UnregisterForUpdate(Internal.name)
	EVENT_MANAGER:RegisterForUpdate(
		Internal.name,
		Internal.scanThrottle,
		function( )
			EVENT_MANAGER:UnregisterForUpdate(Internal.name)
			Internal.ScanKnowledge()
		end
	)
end


--------------------------------------------------------------------------------
-- Scanning and Encoding
--------------------------------------------------------------------------------

function Internal.ScanKnowledge( )
	if (Internal.initialized) then
		Diagnostics.Stopwatch(true)
	end

	if (Internal.CanSave()) then
		local caches = Internal.GetCaches(Internal.server, Internal.charId)
		for _, category in ipairs(Internal.Categories) do
			caches[category] = Internal.ScanAndEncodeKnowledgeCategory(Internal.server, Internal.charId, category)
		end
		Internal.characters[Internal.server][Internal.charId].timestamp = GetTimeStamp()
	end

	if (not Internal.initialized) then
		Internal.initialized = true
		Diagnostics.Stopwatch()
		Internal.FireCallbacks(Public.EVENT_INITIALIZED)
		Diagnostics.LogTime("initialization")
	else
		Internal.NotifyRefresh(false)
		Diagnostics.LogTime("refresh")
	end
end

function Internal.ScanAndEncodeKnowledgeCategory( server, charId, category, cache )
	-- Scan knowledge, if not pre-supplied
	if (not cache) then
		cache = { }

		-- Since the cache is sparsely populated with only known items, this
		-- prevents the cache from being completely empty
		cache[Internal.ids[category][1]] = false

		for _, id in ipairs(Internal.ids[category]) do
			if (Internal.KnowFunctions[category](Internal.GetItemLink(id))) then
				cache[id] = true
			end
		end

		if (category == Internal.CATEGORY_MOTIF) then
			Internal.FixIncorrectMotifBookKnowledge(cache)
		end
	end

	-- Encode into bitfields
	local bitfield = 0
	local bitfields = { }

	for i, id in ipairs(Internal.ids[category]) do
		bitfield = BitLShift(bitfield, 1)

		if (cache[id]) then
			bitfield = bitfield + 1
		end

		if (i % Internal.FIELD_BITS == 0) then
			table.insert(bitfields, LCCC.Encode(bitfield, Internal.FIELD_BYTES))
			bitfield = 0
		end
	end

	local remainder = #Internal.ids[category] % Internal.FIELD_BITS
	if (remainder > 0) then
		table.insert(bitfields, LCCC.Encode(BitLShift(bitfield, Internal.FIELD_BITS - remainder), Internal.FIELD_BYTES))
	end

	Internal.characters[server][charId][category] = LCCC.Chunk(table.concat(bitfields, ""))

	return cache
end

function Internal.FixIncorrectMotifBookKnowledge( cache )
	-- There is a rare bug where IsItemLinkBookKnown will incorrectly report a
	-- book as unknown, so this attempts to work around the problem by looking
	-- at chapter knowledge.

	local overrides = { }

	for _, styleId in ipairs(Internal.GetStyleIds()) do
		local data = Internal.GetStyleMotifItems(styleId)
		if (#data.chapters > 0) then
			local complete = true
			for _, itemId in ipairs(data.chapters) do
				if (not cache[itemId]) then
					complete = false
					break
				end
			end

			if (complete) then
				for _, itemId in ipairs(data.books) do
					if (not cache[itemId]) then
						cache[itemId] = true
						table.insert(overrides, itemId)
					end
				end
			end
		end
	end

	if (#overrides > 0) then
		if (not Diagnostics.vars.bookCorrections) then
			Diagnostics.vars.bookCorrections = { }
		end
		Diagnostics.vars.bookCorrections[Internal.charId] = table.concat(overrides, ",")
	end
end
