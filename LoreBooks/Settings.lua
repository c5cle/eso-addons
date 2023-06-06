local LoreBooks = _G["LoreBooks"]
local internal = _G["LoreBooks_Internal"]

local LAM = LibAddonMenu2
local LMP = LibMapPins

local db
local defaults = {      --default settings for saved variables
  compassMaxDistance = 0.04,
  pinTexture = {
    type = 1,
    size = 26,
    level = 40,
  },
  pinGrayscale = true,
  pinTextureEidetic = 1,
  pinGrayscaleEidetic = true,
  filters = {
    [internal.PINS_COMPASS_EIDETIC] = false,
    [internal.PINS_COMPASS] = true,
    [internal.PINS_UNKNOWN] = true,
    [internal.PINS_COLLECTED] = false,
    [internal.PINS_EIDETIC] = false,
    [internal.PINS_EIDETIC_COLLECTED] = false,
    [internal.PINS_BOOKSHELF] = true,
    [internal.PINS_COMPASS_BOOKSHELF] = false,

  },
  shareData = true,
  postmailData = "",
  postmailFirstInsert = GetTimeStamp(),
  booksCollected = {},
  unlockEidetic = false,
  steps = {},
  immersiveMode = 1,
  questTools = {},
  showClickMenu = true,
  showDungeonTag = true,
  showQuestName = true,
}

function LoreBooks:GetSettings()
  return db
end

function LoreBooks:CreateSettings()

  db = ZO_SavedVars:NewAccountWide("LBooks_SavedVariables", internal.SAVEDVARIABLES_VERSION, nil, defaults)

  local panelData = {
    type = "panel",
    name = GetString(LBOOKS_TITLE),
    displayName = ZO_HIGHLIGHT_TEXT:Colorize(GetString(LBOOKS_TITLE)),
    author = internal.ADDON_AUTHOR,
    version = internal.ADDON_VERSION,
    slashCommand = "/lorebooks",
    registerForRefresh = true,
    registerForDefaults = true,
    website = internal.ADDON_WEBSITE,
  }
  LAM:RegisterAddonPanel(internal.ADDON_PANEL, panelData)

  local pinTexturesValues = {
    [1] = internal.PIN_ICON_REAL,
    [2] = internal.PIN_ICON_SET1,
    [3] = internal.PIN_ICON_SET2,
    [4] = internal.PIN_ICON_ESOHEAD,
  }
  local pinTexturesList = {
    [1] = GetString(LBOOKS_PIN_TEXTURE1),
    [2] = GetString(LBOOKS_PIN_TEXTURE2),
    [3] = GetString(LBOOKS_PIN_TEXTURE3),
    [4] = GetString(LBOOKS_PIN_TEXTURE4),
  }
  local pinTextures = internal.PIN_TEXTURES

  local CreateIcons, unknownIcon, collectedIcon, unknownIconEidetic, collectedIconEidetic
  CreateIcons = function(panel)
    if panel == LoreBooksPanel then
      unknownIcon = WINDOW_MANAGER:CreateControl(nil, panel.controlsToRefresh[1], CT_TEXTURE)
      unknownIcon:SetAnchor(RIGHT, panel.controlsToRefresh[1].combobox, LEFT, -10, 0)
      unknownIcon:SetTexture(pinTextures[db.pinTexture.type][2])
      unknownIcon:SetDimensions(db.pinTexture.size, db.pinTexture.size)
      collectedIcon = WINDOW_MANAGER:CreateControl(nil, panel.controlsToRefresh[1], CT_TEXTURE)
      collectedIcon:SetAnchor(RIGHT, unknownIcon, LEFT, -5, 0)
      collectedIcon:SetTexture(pinTextures[db.pinTexture.type][1])
      collectedIcon:SetDimensions(db.pinTexture.size, db.pinTexture.size)
      collectedIcon:SetDesaturation((db.pinTexture.type == internal.PIN_ICON_REAL) and 1 or 0)

      unknownIconEidetic = WINDOW_MANAGER:CreateControl(nil, panel.controlsToRefresh[3], CT_TEXTURE)
      unknownIconEidetic:SetAnchor(RIGHT, panel.controlsToRefresh[3].combobox, LEFT, -10, 0)
      unknownIconEidetic:SetTexture(pinTextures[db.pinTextureEidetic][2])
      unknownIconEidetic:SetDimensions(db.pinTexture.size, db.pinTexture.size)
      collectedIconEidetic = WINDOW_MANAGER:CreateControl(nil, panel.controlsToRefresh[3], CT_TEXTURE)
      collectedIconEidetic:SetAnchor(RIGHT, unknownIconEidetic, LEFT, -5, 0)
      collectedIconEidetic:SetTexture(pinTextures[db.pinTextureEidetic][1])
      collectedIconEidetic:SetDimensions(db.pinTexture.size, db.pinTexture.size)
      collectedIconEidetic:SetDesaturation((db.pinTextureEidetic == internal.PIN_ICON_REAL) and 1 or 0)

      CALLBACK_MANAGER:UnregisterCallback("LAM-PanelControlsCreated", CreateIcons)
    end
  end
  CALLBACK_MANAGER:RegisterCallback("LAM-PanelControlsCreated", CreateIcons)

  local immersiveChoices = {
    [1] = GetString(LBOOKS_IMMERSIVE_CHOICE1),
    [2] = GetString(LBOOKS_IMMERSIVE_CHOICE2),
    [3] = GetString(LBOOKS_IMMERSIVE_CHOICE3),
    [4] = GetString(LBOOKS_IMMERSIVE_CHOICE4),
    [5] = GetString(LBOOKS_IMMERSIVE_CHOICE5),
  }

  local function SetLayoutKeyAndRefresh(pin, key, value)
    LMP:SetLayoutKey(pin, key, value)
    LMP:RefreshPins(pin)
  end

  local optionsTable = { }
  optionsTable[#optionsTable + 1] = {
    type = "dropdown",
    name = GetString(LBOOKS_PIN_TEXTURE),
    tooltip = GetString(LBOOKS_PIN_TEXTURE_DESC),
    choices = pinTexturesList,
    choicesValues = pinTexturesValues,
    getFunc = function() return db.pinTexture.type end,
    setFunc = function(value)
      db.pinTexture.type = value
      unknownIcon:SetTexture(pinTextures[value][2])
      collectedIcon:SetDesaturation(value == defaults.pinTexture.type and 1 or 0)
      collectedIcon:SetTexture(pinTextures[value][1])
      LMP:RefreshPins(internal.PINS_UNKNOWN)
      LMP:RefreshPins(internal.PINS_COLLECTED)
      COMPASS_PINS.pinLayouts[internal.PINS_COMPASS].texture = pinTextures[value][2]
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS)
    end,
    default = defaults.pinTexture.type,
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_PIN_GRAYSCALE),
    tooltip = GetString(LBOOKS_PIN_GRAYSCALE_DESC),
    getFunc = function() return db.pinGrayscale end,
    setFunc = function(value) db.pinGrayscale = value end,
    disabled = function() return db.pinTexture.type ~= internal.PIN_ICON_REAL end,
    default = defaults.pinGrayscale,
  }
  optionsTable[#optionsTable + 1] = {
    type = "dropdown",
    name = zo_strformat(LBOOKS_PIN_TEXTURE_EIDETIC, GetLoreCategoryInfo(3)),
    tooltip = GetString(LBOOKS_PIN_TEXTURE_DESC),
    choices = pinTexturesList,
    choicesValues = pinTexturesValues,
    getFunc = function() return db.pinTextureEidetic end,
    setFunc = function(value)
      db.pinTextureEidetic = value
      unknownIconEidetic:SetTexture(pinTextures[value][2])
      collectedIconEidetic:SetDesaturation(value == defaults.pinTextureEidetic and 1 or 0)
      collectedIconEidetic:SetTexture(pinTextures[value][1])
      LMP:RefreshPins(internal.PINS_EIDETIC)
      LMP:RefreshPins(internal.PINS_EIDETIC_COLLECTED)
      COMPASS_PINS.pinLayouts[internal.PINS_COMPASS_EIDETIC].texture = pinTextures[value][2]
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS_EIDETIC)
    end,
    default = defaults.pinTextureEidetic,
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_PIN_GRAYSCALE),
    tooltip = GetString(LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC),
    getFunc = function() return db.pinGrayscaleEidetic end,
    setFunc = function(value) db.pinGrayscaleEidetic = value end,
    disabled = function() return db.pinTextureEidetic ~= internal.PIN_ICON_REAL end,
    default = defaults.pinGrayscaleEidetic,
  }
  optionsTable[#optionsTable + 1] = {
    type = "slider",
    name = GetString(LBOOKS_PIN_SIZE),
    tooltip = GetString(LBOOKS_PIN_SIZE_DESC),
    min = 10,
    max = 70,
    step = 1,
    getFunc = function() return db.pinTexture.size end,
    setFunc = function(size)
      db.pinTexture.size = size
      unknownIcon:SetDimensions(size, size)
      collectedIcon:SetDimensions(size, size)
      SetLayoutKeyAndRefresh(internal.PINS_UNKNOWN, "size", size)
      SetLayoutKeyAndRefresh(internal.PINS_COLLECTED, "size", size)
      SetLayoutKeyAndRefresh(internal.PINS_EIDETIC, "size", size)
      SetLayoutKeyAndRefresh(internal.PINS_EIDETIC_COLLECTED, "size", size)
    end,
    disabled = function() return not (db.filters[internal.PINS_UNKNOWN] or db.filters[internal.PINS_COLLECTED] or db.filters[internal.PINS_EIDETIC] or db.filters[internal.PINS_EIDETIC_COLLECTED] or db.filters[internal.PINS_BOOKSHELF]) end,
    default = defaults.pinTexture.size
  }
  optionsTable[#optionsTable + 1] = {
    type = "slider",
    name = GetString(LBOOKS_PIN_LAYER),
    tooltip = GetString(LBOOKS_PIN_LAYER_DESC),
    min = 10,
    max = 200,
    step = 5,
    getFunc = function() return db.pinTexture.level end,
    setFunc = function(level)
      db.pinTexture.level = level
      SetLayoutKeyAndRefresh(internal.PINS_UNKNOWN, "level", level)
      SetLayoutKeyAndRefresh(internal.PINS_COLLECTED, "level", level)
      SetLayoutKeyAndRefresh(internal.PINS_EIDETIC, "level", level)
      SetLayoutKeyAndRefresh(internal.PINS_EIDETIC_COLLECTED, "level", level)
    end,
    disabled = function() return not (db.filters[internal.PINS_UNKNOWN] or db.filters[internal.PINS_COLLECTED] or db.filters[internal.PINS_EIDETIC] or db.filters[internal.PINS_EIDETIC_COLLECTED] or db.filters[internal.PINS_BOOKSHELF]) end,
    default = defaults.pinTexture.level,
  }
  -- add Dungeon tag or zonename
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_DUNGEON_TAG_MENU),
    tooltip = GetString(LBOOKS_DUNGEON_TAG_MENU_DESC),
    getFunc = function() return db.showDungeonTag end,
    setFunc = function(state) db.showDungeonTag = state end,
    default = defaults.showDungeonTag,
  }
  -- add Quest Name and Location
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_QUESTINFO_MENU),
    tooltip = GetString(LBOOKS_QUESTINFO_MENU_DESC),
    getFunc = function() return db.showQuestName end,
    setFunc = function(state) db.showQuestName = state end,
    default = defaults.showQuestName,
  }
  optionsTable[#optionsTable + 1] = { -- disable clicl menu
    type = "checkbox",
    name = GetString(LBOOKS_PIN_CLICK_MENU),
    tooltip = GetString(LBOOKS_PIN_CLICK_MENU_DESC),
    getFunc = function() return db.showClickMenu end,
    setFunc = function(state)
      db.showClickMenu = state
    end,
    default = defaults.showClickMenu,
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_UNKNOWN),
    tooltip = GetString(LBOOKS_UNKNOWN_DESC),
    getFunc = function() return db.filters[internal.PINS_UNKNOWN] end,
    setFunc = function(state)
      db.filters[internal.PINS_UNKNOWN] = state
      LMP:SetEnabled(internal.PINS_UNKNOWN, state)
    end,
    default = defaults.filters[internal.PINS_UNKNOWN],
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_COLLECTED),
    tooltip = GetString(LBOOKS_COLLECTED_DESC),
    getFunc = function() return db.filters[internal.PINS_COLLECTED] end,
    setFunc = function(state)
      db.filters[internal.PINS_COLLECTED] = state
      LMP:SetEnabled(internal.PINS_COLLECTED, state)
    end,
    default = defaults.filters[internal.PINS_COLLECTED]
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_EIDETIC),
    tooltip = GetString(LBOOKS_EIDETIC_DESC),
    getFunc = function() return db.filters[internal.PINS_EIDETIC] end,
    setFunc = function(state)
      db.filters[internal.PINS_EIDETIC] = state
      LMP:SetEnabled(internal.PINS_EIDETIC, state)
    end,
    default = defaults.filters[internal.PINS_EIDETIC]
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_EIDETIC_COLLECTED),
    tooltip = GetString(LBOOKS_EIDETIC_COLLECTED_DESC),
    getFunc = function() return db.filters[internal.PINS_EIDETIC_COLLECTED] end,
    setFunc = function(state)
      db.filters[internal.PINS_EIDETIC_COLLECTED] = state
      LMP:SetEnabled(internal.PINS_EIDETIC_COLLECTED, state)
    end,
    default = defaults.filters[internal.PINS_EIDETIC_COLLECTED]
  }
  optionsTable[#optionsTable + 1] = { -- Bookshelf
    type = "checkbox",
    name = GetString(LBOOKS_BOOKSHELF_NAME),
    tooltip = GetString(LBOOKS_BOOKSHELF_DESC),
    getFunc = function() return db.filters[internal.PINS_BOOKSHELF] end,
    setFunc = function(state)
      db.filters[internal.PINS_BOOKSHELF] = state
      LMP:SetEnabled(internal.PINS_BOOKSHELF, state)
    end,
    default = defaults.filters[internal.PINS_BOOKSHELF]
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_COMPASS_UNKNOWN),
    tooltip = GetString(LBOOKS_COMPASS_UNKNOWN_DESC),
    getFunc = function() return db.filters[internal.PINS_COMPASS] end,
    setFunc = function(state)
      db.filters[internal.PINS_COMPASS] = state
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS)
    end,
    default = defaults.filters[internal.PINS_COMPASS],
  }
  optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(LBOOKS_COMPASS_EIDETIC),
    tooltip = GetString(LBOOKS_COMPASS_EIDETIC_DESC),
    getFunc = function() return db.filters[internal.PINS_COMPASS_EIDETIC] end,
    setFunc = function(state)
      db.filters[internal.PINS_COMPASS_EIDETIC] = state
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS_EIDETIC)
    end,
    default = defaults.filters[internal.PINS_COMPASS_EIDETIC],
  }
  optionsTable[#optionsTable + 1] = { -- Bookshelf
    type = "checkbox",
    name = GetString(LBOOKS_COMPASS_BOOKSHELF_NAME),
    tooltip = GetString(LBOOKS_COMPASS_BOOKSHELF_DESC),
    getFunc = function() return db.filters[internal.PINS_COMPASS_BOOKSHELF] end,
    setFunc = function(state)
      db.filters[internal.PINS_COMPASS_BOOKSHELF] = state
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS_BOOKSHELF)
    end,
    default = defaults.filters[internal.PINS_COMPASS_BOOKSHELF],
  }
  optionsTable[#optionsTable + 1] = {
    type = "slider",
    name = GetString(LBOOKS_COMPASS_DIST),
    tooltip = GetString(LBOOKS_COMPASS_DIST_DESC),
    min = 1,
    max = 100,
    step = 1,
    getFunc = function() return db.compassMaxDistance * 1000 end,
    setFunc = function(maxDistance)
      db.compassMaxDistance = maxDistance / 1000
      COMPASS_PINS.pinLayouts[internal.PINS_COMPASS].maxDistance = maxDistance / 1000
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS)
      COMPASS_PINS.pinLayouts[internal.PINS_COMPASS_EIDETIC].maxDistance = maxDistance / 1000
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS_EIDETIC)
      COMPASS_PINS.pinLayouts[internal.PINS_COMPASS_BOOKSHELF].maxDistance = maxDistance / 1000
      COMPASS_PINS:RefreshPins(internal.PINS_COMPASS_BOOKSHELF)
    end,
    disabled = function() return not (db.filters[internal.PINS_COMPASS] or db.filters[internal.PINS_COMPASS_EIDETIC] or db.filters[internal.PINS_COMPASS_BOOKSHELF]) end,
    default = defaults.compassMaxDistance * 1000,
  }
  optionsTable[#optionsTable + 1] = {
    type = "dropdown",
    name = GetString(LBOOKS_IMMERSIVE),
    tooltip = GetString(LBOOKS_IMMERSIVE_DESC),
    choices = immersiveChoices,
    getFunc = function() return immersiveChoices[db.immersiveMode] end,
    setFunc = function(selected)
      for index, name in ipairs(immersiveChoices) do
        if name == selected then
          db.immersiveMode = index
          break
        end
      end
    end,
    default = immersiveChoices[defaults.immersiveMode],
  }
  --[[
  {
    type = "checkbox",
    name = GetString(LBOOKS_UNLOCK_EIDETIC),
    tooltip = function()
      if LoreBooks.CanEmulateLibrary() then
        return GetString(LBOOKS_UNLOCK_EIDETIC_DESC)
      else
        return GetString(LBOOKS_UNLOCK_EIDETIC_WARNING)
      end
    end,
    getFunc = function() return db.unlockEidetic end,
    setFunc = function(state)
      db.unlockEidetic = state
      LORE_LIBRARY:BuildCategoryList()
    end,
    default = defaults.unlockEidetic,
    disabled = function() return not LoreBooks.CanEmulateLibrary() end,
  },
  {
    type = "checkbox",
    name = GetString(LBOOKS_USE_QUEST_BOOKS),
    tooltip = GetString(LBOOKS_USE_QUEST_BOOKS_DESC),
    getFunc = function() return db.useQuestBooks end,
    setFunc = function(state)
      db.useQuestBooks = state
      LoreBooks.ToggleUseQuestBooks()
    end,
    default = defaults.useQuestBooks,
  },
  {
    type = "checkbox",
    name = GetString(LBOOKS_SHARE_DATA),
    tooltip = GetString(LBOOKS_SHARE_DATA_DESC),
    getFunc = function() return db.shareData end,
    setFunc = function(state)
      db.shareData = state
      LoreBooks.ToggleShareData()
    end,
    default = defaults.shareData,
    disabled = GetWorldName() ~= "EU Megaserver" or not internal.SUPPORTED_LANG[lang],
  },
  --]]
  LAM:RegisterOptionControls(internal.ADDON_PANEL, optionsTable)

end