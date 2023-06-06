local LibTreasure = LibTreasure
local data = LibTreasure.data
local icons = LibTreasure.icons


-- Get the data from all saved items data
-- @return *table* itemsData
function LibTreasure_GetAllItemsData()
	return data.ITEMS_DATA
end

-- Get the data of an item in the database
-- @param *number* itemId
-- @return *table:nilable* itemData
function LibTreasure_GetItemIdData(itemId)
	local itemData = data.ITEMS_DATA
	return itemData and itemData[itemId] or nil
end

-- Get the data from a specific mapId
-- @param *number* mapId
-- @return *table:nilable* mapIdData
function LibTreasure_GetMapIdData(mapId)
	local mapIdData = data.MAP_ID_DATA
	return mapIdData and mapIdData[mapId] or nil
end

-- Get the data from a texture name
-- @param *string* textureName
-- @return *table:nilable* textureData
function LibTreasure_GetTextureData(textureName)
	local textureData = data.TEXTURE_NAME_DATA
	return textureData and textureData[textureName] or nil
end

-- Get the itemId of a bookId
-- @param *number* bookId
-- @return *table:nilable* itemId
function LibTreasure_GetBookIdItemId(bookId)
	local bookId = data.BOOK_ID
	return bookId and bookId[bookId] or nil
end

-- Get all icons
-- @return *table* icons
function LibTreasure_GetIcons()
	return icons
end

-- Add more icons to the icon picker setting windows
-- @param *string* path
function LibTreasure_AddIcon(path)
	table.insert(icons, path)
end