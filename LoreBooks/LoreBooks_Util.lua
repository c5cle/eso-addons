local internal = _G["LoreBooks_Internal"]

-----
--- old unused
-----

local function Lorebooks_ShowLorebookMissingMapId()
  local categoryIndex
  local collectionIndex
  local bookIndex
  local bookTitle
  local name
  local bookId
  local mapId
  local mapIndex
  local zoneId
  local LoreBooks_bookData = ZO_DeepTableCopy(LoreBooks.bookData)
  for id, book in pairs(LoreBooks_bookData) do
    categoryIndex, collectionIndex, bookIndex = GetLoreBookIndicesFromBookId(id)
    if categoryIndex == 3 and collectionIndex and bookIndex then
      bookTitle, _, _, bookId = GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex)
      name, _, _, _, _, _, _ = GetLoreCollectionInfo(categoryIndex, collectionIndex)
      if book then
        if NonContiguousCount(book.e) > 0 then
          for _, data in pairs(LoreBooks_bookData[bookId].e) do
            if not data.md then
              --d(bookId)
              --d(data)
            end
          end -- end for
        end -- end if
      end
    end

  end
end

local function LoreBooks_ConvertMapInfoToMapId(booksData, bookId)
  local mapIndex = nil
  local zoneId = nil
  local mapId = nil
  if not booksData.md then
    local categoryIndex, collectionIndex, bookIndex = GetLoreBookIndicesFromBookId(bookId)
    local bookTitle, _, _, bookId = GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex)

    if booksData and booksData.mn and booksData.z then
      mapIndex = booksData.mn
      mapId = GetMapIdByIndex(mapIndex)
    elseif booksData and not booksData.mn and booksData.z then
      zoneId = booksData.z
      mapId = GetMapIdByZoneId(zoneId)
    end
  else
    mapId = booksData.md
  end

  booksData.md = mapId
  if not booksData.md then
    --d(bookTitle)
    d("D -----")
    d(bookId)
    d(booksData)
    return booksData
  end
  booksData.mn = nil
  return booksData
end

local function LoreBooks_NormalizeToMapId(booksData)
  local mapIndex = nil
  local zoneId = nil
  local mapId = nil

  if booksData and booksData.mn and booksData.z then
    mapIndex = booksData.mn
    mapId = GetMapIdByIndex(mapIndex)
  elseif booksData and not booksData.mn and booksData.z then
    zoneId = booksData.z
    mapId = GetMapIdByZoneId(zoneId)
  end
  if booksData and booksData.md then
    mapId = booksData.md
  end
  booksData.md = mapId
  return mapId
end

-----
--- used only to verify data, place in Lorebooks.lua
-----
local function GetLorebookNames()
  local categoryIndex
  local collectionIndex
  local bookIndex
  local bookTitle
  local bookId
  local mapIdFromZoneId
  local mapIdFromMapIndex
  local mapIdFromMapId
  local local_x
  local local_y
  local saveData = true
  local count = 0
  local count2 = 0
  local count3 = 0
  local bad = 0
  local isDungeon = false

  local allBookData = LoreBooks_GetBookData()
  local LoreBooks_bookData = ZO_DeepTableCopy(allBookData)
  for i = 1, 10000 do
    -- 45 zones by index
    local name, mapType, mapContentType, zoneIndex, description = GetMapInfoByIndex(i)
    local zoneNameByZoneIndex = GetZoneNameByIndex(zoneIndex)
    local zoneIdByZoneIndex = GetZoneId(zoneIndex)
    local mapIdByZoneId = GetMapIdByZoneId(zoneIdByZoneIndex)
    local mapTextureByMapId = GetMapTileTextureForMapId(mapIdByZoneId, 1)
    local mapTexture = string.lower(mapTextureByMapId)
    mapTexture = mapTexture:gsub("^.*/maps/", "")
    mapTexture = mapTexture:gsub("%.dds$", "")
    local mapNameByMapIndex = GetMapNameByIndex(i)
    categoryIndex, collectionIndex, bookIndex = GetLoreBookIndicesFromBookId(i)
    if categoryIndex == 3 and collectionIndex and bookIndex then
      bookTitle, _, _, bookId = GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex)
      name, _, _, _, _, _, _ = GetLoreCollectionInfo(categoryIndex, collectionIndex)
      if not LoreBooks_bookData[bookId] then LoreBooks_bookData[bookId] = {} end
      if LoreBooks_bookData[bookId] then
        if bookTitle then LoreBooks_bookData[bookId].n = bookTitle end
        if name then LoreBooks_bookData[bookId].cn = name end
        if not LoreBooks_bookData[bookId].e then
          LoreBooks_bookData[bookId].e = {}
          LoreBooks_bookData[bookId].c = false
        end
        LoreBooks_bookData[bookId].k = nil
        LoreBooks_bookData[bookId].qt = nil
        LoreBooks_bookData[bookId].qm = nil
        local newMapData = {}
        if LoreBooks_bookData[bookId].r and LoreBooks_bookData[bookId].m and NonContiguousCount(LoreBooks_bookData[bookId].m) > 1 then
          for mapIndex, numSeen in pairs(LoreBooks_bookData[bookId].m) do
            local mapId = GetMapIdByIndex(mapIndex)
            newMapData[mapId] = numSeen
          end
          LoreBooks_bookData[bookId].m = newMapData
        end -- good
        if LoreBooks_bookData[bookId].q then
          LoreBooks_bookData[bookId].m = nil
        end

        local newMapData = {}
        if NonContiguousCount(LoreBooks_bookData[bookId].e) > 0 then
          for _, data in pairs(LoreBooks_bookData[bookId].e) do
            mapIdFromZoneId = nil
            mapIdFromMapIndex = nil
            mapIdFromMapId = nil
            local_x = nil
            local_y = nil
            saveData = true
            isDungeon = false

            local badMapIndex = (data.mn and data.mn == 1 or data.mn and data.mn == 24)
            local validZoneId = data.z ~= 0
            if data.g then isDungeon = true end

            if data and data.z then
              local mapId = GetMapIdByZoneId(data.z)
              if mapId ~= 0 then mapIdFromZoneId = mapId end
            end
            if data and data.mn then
              local mapIndex = GetMapIndexByZoneId(data.z)
              data.mn = mapIndex
              local mapId = GetMapIdByZoneId(data.mn)
              if mapId ~= 0 then mapIdFromMapIndex = mapId end
            end
            if data and data.md then mapIdFromMapId = data.md end

            if data.x and data.y then
              local_x = data.x
              local_y = data.y
            end
            if not data.md and mapIdFromZoneId then
              data.pm = mapIdFromZoneId
            elseif not data.md and mapIdFromMapIndex then
              data.pm = mapIdFromMapIndex
            elseif not data.md and data.z and data.z ~= 0 then
              local zoneName = GetZoneNameById(data.z) or "[Empty String]"
              local theMapIndex = data.mn or "[No MapIndex]"
              if zoneName and LMD.mapNamesLookup[zoneName] then
                --[[
                for i = LMD.MAPINDEX_MIN, LMD.MAPINDEX_MAX do
                  if LMD.mapIndexData[i].zoneId == GetParentZoneId(data.z) then
                    --d("Works")
                  else
                    d("Nope")
                  end
                end
                ]]--
                data.pm = LMD.mapNamesLookup[zoneName]
                count = count + 1
              else
                --d(string.format("[LookUp] zoneName %s : zoneId: %s : mapIndex: %s : BookId : %s", zoneName, data.z, theMapIndex, bookId))
                --d(data)
                count2 = count2 + 1
                data.zt = data.z
              end
            elseif not data.md then
              --d("-----")
              --d(data)
              bad = bad + 1
              saveData = false
            end
            if data.md then
              data.pm = mapIdFromMapId
              count3 = count3 + 1
            end
            data.md = nil
            data.z = nil
            data.zx = nil
            data.zy = nil
            data.x = nil
            data.y = nil

            data.px = local_x
            data.py = local_y

            if data.px and data.py and saveData then
              table.insert(newMapData, data)
            end

          end -- end for
          LoreBooks_bookData[bookId].e = newMapData
        end -- end if

      end
    end
  end
  d(count) -- keep
  d(count2) -- keep
  d(count3) -- keep
  d(bad) -- keep
  LBooks_SavedVariables.names = LoreBooks_bookData
end

local function CheckLorebooks()
  local categoryIndex
  local collectionIndex
  local bookIndex
  local bookTitle
  local bookId

  local allBookData = LoreBooks_GetBookData()
  local LoreBooks_bookData = ZO_DeepTableCopy(allBookData)
  for i = 1, 10000 do
    categoryIndex, collectionIndex, bookIndex = GetLoreBookIndicesFromBookId(i)
    if categoryIndex == 3 and collectionIndex and bookIndex then
      bookTitle, _, _, bookId = GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex)
      if LoreBooks_bookData[bookId] then
        if NonContiguousCount(LoreBooks_bookData[bookId].e) < 1 and not LoreBooks_bookData[bookId].m and not LoreBooks_bookData[bookId].q then
          LoreBooks_bookData[bookId].c = false
        end
      end -- end if

    end
  end
  LBooks_SavedVariables.names = LoreBooks_bookData
end

local function LookForPinFive()
  local allShalidorData = LoreBooks_GetAllData()
  local built_table = {}
  for mapId, pinData in pairs(allShalidorData) do
    for index, pinInfo in pairs(pinData) do
      local pinFive = nil
      local pinSix = nil
      local count = #pinInfo
      -- if pinInfo and count >= 5 then pinFive = pinInfo[internal.SHALIDOR_MOREINFO] end no longer used, use ld
      if pinInfo and count >= 6 then pinSix = pinInfo[internal.SHALIDOR_ZONEID] end
      if pinFive == -1 then pinFive = nil end
      local locationDetails = pinInfo.ld
      if pinFive and not locationDetails then locationDetails = pinFive end
      if pinFive or pinSix or locationDetails then
        local stringInfo = string.format("{ %.3f, %.3f, %d, %d", pinInfo[1], pinInfo[2], pinInfo[3], pinInfo[4])
        if pinSix then stringInfo = stringInfo .. string.format(", %d", pinSix) end
        if locationDetails then stringInfo = stringInfo .. string.format(", ld = %s", locationDetails) end
        stringInfo = stringInfo .. " },"
        table.insert(built_table, stringInfo)
      end -- end
    end
  end
  LBooks_SavedVariables.newLorebooksData = built_table
end

function internal:is_empty_or_nil(t)
  if t == nil or t == "" then return true end
  return type(t) == "table" and ZO_IsTableEmpty(t) or false
end

local function VerifyAllBooks()
  local bookData = LoreBooks_GetBookData()
  local builtTable = {}
  for categoryIndex = 1, GetNumLoreCategories() do
    local categoryName, numCollections = GetLoreCategoryInfo(categoryIndex)
    for collectionIndex = 1, numCollections do
      local collectionName, _, _, totalBooksInCollection = GetLoreCollectionInfo(categoryIndex, collectionIndex)
      for bookIndex = 1, totalBooksInCollection do
        local bookName, icon, known, bookId = GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex)
        if categoryIndex == internal.LORE_LIBRARY_EIDETIC then
          builtTable[bookId] = string.format("&&&[%s] = { [%s] = false, [%s] = %s, [%s] = %s, [%s] = { }, }&&&", bookId, '"c"', '"cn"', "\"" .. collectionName .. "\"", '"n"', "\"" .. bookName .. "\"", '"e"')
          --[[
          local hasEntry = bookData[bookId] and (bookData[bookId].c ~= nil and bookData[bookId].c == true) and bookData[bookId].e
          local hasPopulatedEntry = false
          local hasEmptyEntry = bookData[bookId] and (bookData[bookId].c ~= nil and bookData[bookId].c == false) and internal:is_empty_or_nil(bookData[bookId].e)
          local hasRandom = bookData[bookId] and bookData[bookId].r and bookData[bookId].m
          local hasDataBookshelf = false
          if hasEntry then
            if not internal:is_empty_or_nil(bookData[bookId].e) and NonContiguousCount(bookData[bookId].e) > 0 then
              hasPopulatedEntry = true
            end
          end
          if hasRandom then
            if not internal:is_empty_or_nil(bookData[bookId].m) and NonContiguousCount(bookData[bookId].m) > 0 then
              hasDataBookshelf = true
            end
          end
          if hasDataBookshelf and not hasPopulatedEntry then
            --internal:dm("Debug", string.format("Has Bookshelf Data: %s", bookId))
          elseif hasEmptyEntry and not hasDataBookshelf then
            --internal:dm("Debug", string.format("Has Empty Entry: %s", bookId))
          elseif hasPopulatedEntry and not hasDataBookshelf then
            --internal:dm("Debug", string.format("Has Populated Entry: %s", bookId))
          elseif hasPopulatedEntry and hasDataBookshelf then
            --internal:dm("Debug", string.format("Has Both Populated Entry and Bookshelf Data: %s", bookId))
          else
            --internal:dm("Debug", string.format("Else: %s", bookId))
          end
          ]]--
        end -- end if categoryIndex
      end -- end bookIndex loop
    end -- end collectionIndex loop
  end -- end categoryIndex loop
  LBooks_SavedVariables["newLorebooksData"] = builtTable
end

-----
--- add to OnLoad
-----

-- SLASH_COMMANDS["/lbcheck"] = CheckLorebooks

-- SLASH_COMMANDS["/lbgetn"] = GetLorebookNames

-- SLASH_COMMANDS["/lbshow"] = ShowLorebookMissingMapId

--  SLASH_COMMANDS["/lbfive"] = function() LookForPinFive() end

--  SLASH_COMMANDS["/lbcheck"] = function() VerifyAllBooks() end
-----
--- end of verification routines
-----
