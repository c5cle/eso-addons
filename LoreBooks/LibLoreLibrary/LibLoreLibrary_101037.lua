local LIB_IDENTIFIER = "LibLoreLibrary"

assert(not _G[LIB_IDENTIFIER], LIB_IDENTIFIER .. " is already loaded")

local lib = {}
_G[LIB_IDENTIFIER] = lib

local lang = GetCVar("Language.2")

local GetOriginalLoreCollectionInfo = GetLoreCollectionInfo

lib.locales = { "en", "es", "de", "fr", "ru", "br", "it", "pl", "zh" }
function lib:IsLanguageSupported(language)
  for _, l in ipairs(self.locales) do
    if language == l then
      return true
    end
  end
  return false
end

lib.data = {}
function lib:IsAPISupported(api)
  return self.data[api] ~= nil
end

function lib:Initialize()
  LibLoreLibrary_Settings = LibLoreLibrary_Settings or {
    version = 1,
    lang = lang,
  }
  self.APIVersion = GetAPIVersion()
  self.libraryData = self.data[self.APIVersion]

  LibLoreLibrary_Data = LibLoreLibrary_Data or {
    data = {},
    locales = {},
    isCollecting = false,
    langIdx = 0,
  }
  --
  if LibLoreLibrary_Data.isCollecting then
    zo_callLater(function() self:CollectLibraryData(false, LibLoreLibrary_Data.langIdx) end, 1000)
  elseif not self:IsEideticMemoryUnlocked() then
    self:EmulateLoreLibrary()
  end
end

function lib:GetNumKnownBooksInCollection(categoryIndex, collectionIndex, booksInCollection)
  local numKnownBooks = 0
  if categoryIndex and collectionIndex and booksInCollection then
    for bookIndex = 1, booksInCollection do
      local known = select(3, GetLoreBookInfo(categoryIndex, collectionIndex, bookIndex))
      if known then
        numKnownBooks = numKnownBooks + 1
      end
    end
  end
  return numKnownBooks
end

-- copy of GetLoreCollectionInfo
-- Returns: string name, string description, number numKnownBooks, number totalBooks, boolean hidden, textureName gamepadIcon, number collectionId
local function GetNewLoreCollectionInfo(categoryIndex, collectionIndex)
  if lib.libraryData[categoryIndex] and lib.libraryData[categoryIndex][collectionIndex] then
    local collectionData = lib.libraryData[categoryIndex][collectionIndex]
    return collectionData.n[lang], -- name
    collectionData.d[lang], -- description
    lib:GetNumKnownBooksInCollection(categoryIndex, collectionIndex, collectionData.t), -- numKnownBooks (TODO: cache this)
    collectionData.t, -- totalBooks
    collectionData.h, -- hidden
    collectionData.g, -- gamepadIcon
    collectionData.k  -- collectionId
  end
  return "", "", 0, 0, true, "/esoui/art/icons/icon_missing.dds", 0
end

function lib:IsEideticMemoryUnlocked()
  -- just try to grab any eidetic memory collection and check totalBooks > 0
  return select(4, GetOriginalLoreCollectionInfo(3, 1)) > 0
end

local isEmulating = false
function lib:IsEmulatingLoreLibrary()
  return isEmulating
end

function lib:EmulateLoreLibrary()
  if self:IsAPISupported(self.APIVersion) and self:IsLanguageSupported(lang) and not isEmulating then
    isEmulating = true
    GetLoreCollectionInfo = GetNewLoreCollectionInfo
  end
end

function lib:CollectLibraryData(currentOnly, langIdx)

  if not self:IsEideticMemoryUnlocked() then
    d("Cannot collect library data because eidetic memory isn't unlocked on this character")
    return
  end
  LibLoreLibrary_Data.data[self.APIVersion] = LibLoreLibrary_Data.data[self.APIVersion] or {}

  if currentOnly then
    LibLoreLibrary_Data.isCollecting = true
  elseif not langIdx then
    LibLoreLibrary_Data.isCollecting = true
    LibLoreLibrary_Data.oldLang = lang
    langIdx = 1
    SetCVar("language.2", self.locales[langIdx])
  end

  if LibLoreLibrary_Data.isCollecting then
    local libraryData = LibLoreLibrary_Data.data[self.APIVersion]
    for categoryIndex = 1, GetNumLoreCategories() do
      local categoryName, numCollections = GetLoreCategoryInfo(categoryIndex)
      for collectionIndex = 1, numCollections do
        local collectionName, description, numKnownBooks, totalBooks, hidden, gamepadIcon, collectionId = GetOriginalLoreCollectionInfo(categoryIndex, collectionIndex)
        if not libraryData[categoryIndex] then
          libraryData[categoryIndex] = {}
        end
        if not libraryData[categoryIndex][collectionIndex] then
          libraryData[categoryIndex][collectionIndex] = {
            t = totalBooks,
            h = hidden,
            g = gamepadIcon,
            n = {},
            d = {},
            k = collectionId,
          }
        end
        libraryData[categoryIndex][collectionIndex].n[lang] = collectionName
        libraryData[categoryIndex][collectionIndex].d[lang] = description
      end
    end

    if not currentOnly then
      langIdx = langIdx + 1
      if langIdx <= #self.locales then
        LibLoreLibrary_Data.langIdx = langIdx
        SetCVar("language.2", self.locales[langIdx])
      else
        LibLoreLibrary_Data.isCollecting = false
        LibLoreLibrary_Data.langIdx = nil
        SetCVar("language.2", LibLoreLibrary_Data.oldLang)
      end
    end
  end

end

local function OnLoad(eventCode, name)
  if name == LIB_IDENTIFIER then
    EVENT_MANAGER:UnregisterForEvent(LIB_IDENTIFIER, EVENT_ADD_ON_LOADED)
    lib:Initialize()
  end

end
EVENT_MANAGER:RegisterForEvent(LIB_IDENTIFIER, EVENT_ADD_ON_LOADED, OnLoad)