local LCCC = LibCodesCommonCode
local Internal = LibCharacterKnowledgeInternal
local Public = LibCharacterKnowledge


--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

-- Item categories
Public.ITEM_CATEGORY_NONE = 0
Public.ITEM_CATEGORY_RECIPE = 1
Public.ITEM_CATEGORY_PLAN = 2
Public.ITEM_CATEGORY_MOTIF = 3
Public.ITEM_CATEGORIES = {
	[Public.ITEM_CATEGORY_RECIPE] = Internal.CategoryLabels[Internal.CATEGORY_RECIPE],
	[Public.ITEM_CATEGORY_PLAN] = Internal.CategoryLabels[Internal.CATEGORY_PLAN],
	[Public.ITEM_CATEGORY_MOTIF] = Internal.CategoryLabels[Internal.CATEGORY_MOTIF],
}

-- Knowledge state
Public.KNOWLEDGE_INVALID = Internal.KNOWLEDGE_INVALID -- Not a recipe, plan, or motif
Public.KNOWLEDGE_NODATA = Internal.KNOWLEDGE_NODATA -- No data for this character
Public.KNOWLEDGE_KNOWN = Internal.KNOWLEDGE_KNOWN
Public.KNOWLEDGE_UNKNOWN = Internal.KNOWLEDGE_UNKNOWN

-- Callback events
Public.EVENT_INITIALIZED = 1
Public.EVENT_UPDATE_REFRESH = 2


--------------------------------------------------------------------------------
-- Public Functions
--------------------------------------------------------------------------------

function Public.GetServerList( )
	-- Get the list of valid servers, with the current server always in the first index
	return LCCC.GetSortedKeys(Internal.characters, Internal.server)
end

function Public.GetCharacterList( server )
	if (not server) then server = Internal.server end

	-- Get and cache the list of enabled characters
	if (not Internal.cachedCharLists[server]) then
		local results = { }

		if (Internal.characters[server]) then
			local charIds = { }
			for id in pairs(Internal.characters[server]) do
				if (Internal.IsCharacterEnabled(server, id)) then
					table.insert(charIds, id)
				end
			end
			Internal.Sort(server, charIds, true)

			for _, id in ipairs(charIds) do
				local data = Internal.characters[server][id]
				table.insert(results, {
					id = id,
					account = data.account,
					name = data.name,
				})
			end
		end

		Internal.cachedCharLists[server] = results
	end

	return Internal.cachedCharLists[server]
end

Public.GetItemLinkFromItemId = Internal.GetItemLink

function Public.GetItemName( item )
	if (type(item) == "number") then
		item = Public.GetItemLinkFromItemId(item)
	elseif (type(item) ~= "string") then
		return ""
	end
	return zo_strformat("<<t:1>>", GetItemLinkName(item))
end

function Public.GetItemCategory( item )
	local category = Internal.GetItemCategoryAndQuality(item)

	if (category) then
		local translate = {
			[Internal.CATEGORY_RECIPE] = Public.ITEM_CATEGORY_RECIPE,
			[Internal.CATEGORY_PLAN] = Public.ITEM_CATEGORY_PLAN,
			[Internal.CATEGORY_MOTIF] = Public.ITEM_CATEGORY_MOTIF,
		}
		return translate[category]
	else
		return Public.ITEM_CATEGORY_NONE
	end
end

function Public.GetItemKnowledgeForCharacter( item, server, charId )
	if (not server) then server = Internal.server end
	if (not charId) then charId = Internal.charId end
	local category = Internal.GetItemCategoryAndQuality(item)
	return Internal.GetItemKnowledge(server, charId, category, Internal.TranslateItem(item))
end

function Public.GetItemKnowledgeList( item, server, includedCharIds )
	local results = { }

	local category, quality = Internal.GetItemCategoryAndQuality(item)

	if (category) then
		if (not server) then server = Internal.server end
		local itemId, itemLink, styleId = Internal.TranslateItem(item)

		-- Get the data for each qualified character
		for _, character in ipairs(Public.GetCharacterList(server)) do
			if (Internal.GetEffectiveParameterValue(server, character.id, category) > quality or (includedCharIds and includedCharIds[character.id])) then
				table.insert(results, {
					id = character.id,
					account = character.account,
					name = character.name,
					knowledge = Internal.GetItemKnowledge(server, character.id, category, itemId, itemLink, styleId),
				})
			end
		end
	end

	return results
end

function Public.IsKnowledgeUsable( knowledge )
	return knowledge == Public.KNOWLEDGE_KNOWN or knowledge == Public.KNOWLEDGE_UNKNOWN
end

function Public.GetItemIdsForCategory( category )
	category = category and Internal.Categories[category]

	if (category) then
		local ids = Internal.idsPublic[category]
		if (not ids) then
			ids = { }
			local blacklist = Internal.InvalidIds
			for _, id in ipairs(Internal.ids[category]) do
				if (not blacklist[id]) then
					table.insert(ids, id)
				end
			end
			Internal.idsPublic[category] = ids
		end
		return ids
	else
		return { }
	end
end

Public.GetMotifStyles = Internal.GetStyleIds

function Public.GetStyleAndChapterFromMotif( item )
	return Internal.GetMotifStyleAndChapter(Internal.TranslateItem(item))
end

Public.GetMotifItemsFromStyle = Internal.GetStyleMotifItems

function Public.GetMotifChapterNames( )
	-- Get a list of the the IDs and names of possible motif chapter types, sorted by chapter name
	if (not Internal.chapters) then
		Internal.chapters = { }

		for i = 1, ITEM_STYLE_CHAPTER_MAX_VALUE do
			table.insert(Internal.chapters, {
				id = i,
				name = zo_strformat("<<m:1>>", GetString("SI_ITEMSTYLECHAPTER", i), 2),
			})
		end

		-- Sort by chapter name, rather than ID, to match the base-game UI
		table.sort(Internal.chapters, function( a, b )
			return a.name < b.name
		end)
	end

	return Internal.chapters
end

function Public.GetMotifStyleQuality( styleId )
	return Internal.GetStyleQuality(styleId) + 2
end

function Public.GetMotifKnowledgeForCharacter( styleId, chapterId, ... )
	if (not chapterId) then chapterId = ITEM_STYLE_CHAPTER_ALL end

	local items = Public.GetMotifItemsFromStyle(styleId)

	if (type(items) == "table") then
		if (chapterId == ITEM_STYLE_CHAPTER_ALL or not items.chapters[chapterId]) then
			return Public.GetItemKnowledgeForCharacter(items.books[1], ...)
		else
			return Public.GetItemKnowledgeForCharacter(items.chapters[chapterId], ...)
		end
	else
		return Internal.KNOWLEDGE_INVALID
	end
end

function Public.GetLastScanTime( server, charId )
	if (not server) then server = Internal.server end
	if (not charId) then charId = Internal.charId end
	local timestamp = Internal.characters[server] and Internal.characters[server][charId] and Internal.characters[server][charId].timestamp
	return timestamp or 0
end


--------------------------------------------------------------------------------
-- Callbacks
--------------------------------------------------------------------------------

Internal.callbacks = {
	[Public.EVENT_INITIALIZED] = { },
	[Public.EVENT_UPDATE_REFRESH] = { },
}

function Public.RegisterForCallback( name, eventCode, callback )
	if (type(name) == "string" and type(eventCode) == "number" and type(callback) == "function" and Internal.callbacks[eventCode]) then
		Internal.callbacks[eventCode][name] = callback
		return true
	end
	return false
end

function Public.UnregisterForCallback( name, eventCode )
	if (type(name) == "string" and type(eventCode) == "number" and Internal.callbacks[eventCode]) then
		Internal.callbacks[eventCode][name] = nil
		return true
	end
	return false
end

function Internal.FireCallbacks( eventCode, ... )
	for _, callback in pairs(Internal.callbacks[eventCode]) do
		callback(eventCode, ...)
	end
end
