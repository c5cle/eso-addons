--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]
local LMP = LibMapPins

local normalIconTexture
local storyIconTexture
local skillPointIconTexture
local cadwellIconTexture
local companionIconTexture

local normalIconSets = {}
local storyIconSets = {}
local skillPointIconSets = {}
local cadwellIconSets = {}
local companionIconSets = {}

for k, v in pairs(QuestMap.icon_sets) do
  table.insert(normalIconSets, k)
end
for k, v in pairs(QuestMap.icon_sets) do
  table.insert(storyIconSets, k)
end
for k, v in pairs(QuestMap.icon_sets) do
  table.insert(skillPointIconSets, k)
end
for k, v in pairs(QuestMap.cadwell_icon_sets) do
  table.insert(cadwellIconSets, k)
end
for k, v in pairs(QuestMap.companion_icon_sets) do
  table.insert(companionIconSets, k)
end

local panelData = {
  type = "panel",
  name = QuestMap.displayName,
  displayName = "|c70C0DE" .. QuestMap.displayName .. "|r",
  author = "|c70C0DECaptainBlagbird|r, |cff9b15Sharlikran|r",
  version = "3.15",
  slashCommand = "/questmap", --(optional) will register a keybind to open to this panel
  registerForRefresh = true, --boolean (optional) (will refresh all options controls when a setting is changed and when the panel is shown)
  registerForDefaults = true, --boolean (optional) (will set all options controls back to default values)
  resetFunc = function()
    -- Also reset pin filters. The only thing in the saved variables will be the hidden quests (QuestMap.settings.hiddenQuests)
    QuestMap.settings.pinFilters = QuestMap.settings_default.pinFilters
    QuestMap:RefreshPinFilters()
  end, --function (optional) if registerForDefaults is true, this custom function will run after settings are reset to defaults
}

local NORMAL_ICON_SET_MENU = 2
local STORY_ICON_SET_MENU = 3
local SKILLPOINT_ICON_SET_MENU = 4
local CADWELL_ICON_SET_MENU = 5
local COMPANION_ICON_SET_MENU = 6

local optionsTable = {}
optionsTable[#optionsTable + 1] = {
  type = "header",
  name = GetString(QUESTMAP_ICON_SETS_HEADER),
  width = "full",
}
optionsTable[NORMAL_ICON_SET_MENU] = {
  type = "dropdown",
  name = GetString(QUESTMAP_NORMAL_ICON_SET),
  choices = normalIconSets,
  getFunc = function() return QuestMap.settings.normalIconSet end,
  setFunc = function(value)
    QuestMap.settings.normalIconSet = value
    normalIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.normalIconSet])
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.settings_default.normalIconSet,
  width = "full",
}
optionsTable[STORY_ICON_SET_MENU] = {
  type = "dropdown",
  name = GetString(QUESTMAP_STORY_ICON_SET),
  choices = storyIconSets,
  getFunc = function() return QuestMap.settings.storyIconSet end,
  setFunc = function(value)
    QuestMap.settings.storyIconSet = value
    storyIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.storyIconSet])
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.settings_default.storyIconSet,
  width = "full",
}
optionsTable[SKILLPOINT_ICON_SET_MENU] = {
  type = "dropdown",
  name = GetString(QUESTMAP_SKILLPOINT_ICON_SET),
  choices = skillPointIconSets,
  getFunc = function() return QuestMap.settings.skillPointIconSet end,
  setFunc = function(value)
    QuestMap.settings.skillPointIconSet = value
    skillPointIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.skillPointIconSet])
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.settings_default.skillPointIconSet,
  width = "full",
}
optionsTable[CADWELL_ICON_SET_MENU] = {
  type = "dropdown",
  name = GetString(QUESTMAP_CADWELL_ICON_SET),
  choices = cadwellIconSets,
  getFunc = function() return QuestMap.settings.cadwellIconSet end,
  setFunc = function(value)
    QuestMap.settings.cadwellIconSet = value
    cadwellIconTexture:SetTexture(QuestMap.cadwell_icon_sets[QuestMap.settings.cadwellIconSet])
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.settings_default.cadwellIconSet,
  width = "full",
}
optionsTable[COMPANION_ICON_SET_MENU] = {
  type = "dropdown",
  name = GetString(QUESTMAP_COMPANION_ICON_SET),
  choices = companionIconSets,
  getFunc = function() return QuestMap.settings.companionIconSet end,
  setFunc = function(value)
    QuestMap.settings.companionIconSet = value
    companionIconTexture:SetTexture(QuestMap.companion_icon_sets[QuestMap.settings.companionIconSet])
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.settings_default.companionIconSet,
  width = "full",
}
optionsTable[#optionsTable + 1] = {
  type = "header",
  name = GetString(QUESTMAP_SETTINGS_HEADER),
  width = "full",
}
optionsTable[#optionsTable + 1] = {
  type = "slider",
  name = GetString(QUESTMAP_MENU_PIN_SIZE),
  tooltip = GetString(QUESTMAP_MENU_PIN_SIZE_TT),
  min = 5,
  max = 70,
  step = 1,
  getFunc = function() return QuestMap.settings.pinSize end,
  setFunc = function(value)
    QuestMap.settings.pinSize = value
    QuestMap:RefreshPinLayout()
  end,
  width = "full",
  default = QuestMap.settings_default.pinSize,
}
optionsTable[#optionsTable + 1] = {
  type = "slider",
  name = GetString(QUESTMAP_MENU_PIN_LVL),
  tooltip = GetString(QUESTMAP_MENU_PIN_LVL_TT),
  min = 10,
  max = 200,
  step = 1,
  getFunc = function() return QuestMap.settings.pinLevel end,
  setFunc = function(value)
    QuestMap.settings.pinLevel = value
    QuestMap:RefreshPinLayout()
  end,
  width = "full",
  default = QuestMap.settings_default.pinLevel,
}
-- shows message in chat
optionsTable[#optionsTable + 1] = {
  type = "checkbox",
  name = GetString(QUESTMAP_MENU_DISP_MSG),
  tooltip = GetString(QUESTMAP_MENU_DISP_MSG_TT),
  getFunc = function() return QuestMap.settings.displayClickMsg end,
  setFunc = function(value) QuestMap.settings.displayClickMsg = value end,
  default = QuestMap.settings_default.displayClickMsg,
  width = "full",
}
-- toggle option to show suffix
optionsTable[#optionsTable + 1] = {
  type = "checkbox",
  name = GetString(QUESTMAP_MENU_SHOW_SUFFIX),
  tooltip = GetString(QUESTMAP_MENU_SHOW_SUFFIX_TT),
  getFunc = function() return QuestMap.settings.displaySuffix end,
  setFunc = function(value)
    QuestMap.settings.displaySuffix = value
    QuestMap:RefreshPins()
  end,
  default = QuestMap.settings_default.displaySuffix,
  width = "full",
}
-- toggle option to hide pins
optionsTable[#optionsTable + 1] = {
  type = "checkbox",
  name = GetString(QUESTMAP_MENU_TOGGLE_HIDDEN_MSG),
  tooltip = GetString(QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT),
  getFunc = function() return QuestMap.settings.displayHideQuest end,
  setFunc = function(value) QuestMap.settings.displayHideQuest = value end,
  default = QuestMap.settings_default.displayHideQuest,
  width = "full",
}
-- toggle option to show quest list when pins are stacked
--[[
optionsTable[#optionsTable + 1] = {
    type = "checkbox",
    name = GetString(QUESTMAP_MENU_TOGGLE_COMPLETED_MSG),
    tooltip = GetString(QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT),
    getFunc = function() return QuestMap.settings.displayQuestList end,
    setFunc = function(value) QuestMap.settings.displayQuestList = value end,
    default = QuestMap.settings_default.displayQuestList,
    width = "full",
}
]]--
optionsTable[#optionsTable + 1] = {
  type = "header",
  name = GetString(QUESTMAP_PIN_COLOR_HEADER),
  width = "full",
}
-- Uncompleted pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_UNCOMPLETED_PIN_COLOR),
  tooltip = GetString(QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]),
}
-- Completed pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_COMPLETED_PIN_COLOR),
  tooltip = GetString(QUESTMAP_COMPLETED_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_COMPLETED]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_COMPLETED]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_COMPLETED)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_COMPLETED_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_COMPLETED]),
}
-- Hidden pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_HIDDEN_PIN_COLOR),
  tooltip = GetString(QUESTMAP_HIDDEN_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HIDDEN]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_HIDDEN]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_HIDDEN)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_HIDDEN_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HIDDEN]),
}
-- Started pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_STARTED_PIN_COLOR),
  tooltip = GetString(QUESTMAP_STARTED_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_STARTED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_STARTED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_STARTED]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_STARTED]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_STARTED)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_STARTED]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_STARTED_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_STARTED_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_STARTED]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_STARTED] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_STARTED]),
}
-- Guild pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_GUILD_PIN_COLOR),
  tooltip = GetString(QUESTMAP_GUILD_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_GUILD]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_GUILD] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_GUILD]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_GUILD]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_GUILD)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_GUILD]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_GUILD_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_GUILD_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_GUILD]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_GUILD] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_GUILD]),
}
-- Daily pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_DAILY_PIN_COLOR),
  tooltip = GetString(QUESTMAP_DAILY_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_DAILY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_DAILY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DAILY]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_DAILY]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_DAILY)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_DAILY]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_DAILY_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_DAILY_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DAILY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DAILY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DAILY]),
}
-- Skill pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_SKILL_PIN_COLOR),
  tooltip = GetString(QUESTMAP_SKILL_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_SKILL]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_SKILL] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_SKILL]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_SKILL]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_SKILL)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_SKILL]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_SKILL_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_SKILL_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_SKILL]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_SKILL] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_SKILL]),
}
-- Cadwell pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_CADWELL_PIN_COLOR),
  tooltip = GetString(QUESTMAP_CADWELL_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_CADWELL]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_CADWELL] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_CADWELL]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_CADWELL]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_CADWELL)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_CADWELL]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_CADWELL_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_CADWELL]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_CADWELL] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_CADWELL]),
}
----
-- Holiday pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_HOLIDAY_PIN_COLOR),
  tooltip = GetString(QUESTMAP_HOLIDAY_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HOLIDAY]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_HOLIDAY]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_HOLIDAY)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_HOLIDAY_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_HOLIDAY]),
}
-- PIN_TYPE_QUEST_WEEKLY Repeatable Duration pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_WEEKLY_PIN_COLOR),
  tooltip = GetString(QUESTMAP_WEEKLY_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_WEEKLY]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_WEEKLY]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_WEEKLY)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_WEEKLY_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_WEEKLY]),
}
-- Dungeon pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_DUNGEON_PIN_COLOR),
  tooltip = GetString(QUESTMAP_DUNGEON_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DUNGEON]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_DUNGEON]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_DUNGEON)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_DUNGEON_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_DUNGEON]),
}
-- Zone Story pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_ZONESTORY_PIN_COLOR),
  tooltip = GetString(QUESTMAP_ZONESTORY_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_ZONESTORY]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_ZONESTORY]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_ZONESTORY)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_ZONESTORY_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_ZONESTORY_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_ZONESTORY]),
}
-- Prologue pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_PROLOGUE_PIN_COLOR),
  tooltip = GetString(QUESTMAP_PROLOGUE_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PROLOGUE]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_PROLOGUE]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_PROLOGUE)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_PROLOGUE_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_PROLOGUE_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PROLOGUE]),
}
-- Pledges pins
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_PLEDGES_PIN_COLOR),
  tooltip = GetString(QUESTMAP_PLEDGES_PIN_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES] = QuestMap.create_color_table(r, g, b, a)
    QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PLEDGES]:SetRGBA(unpack(QuestMap.settings["pin_colors"][QuestMap.PIN_TYPE_QUEST_PLEDGES]))
    LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_PLEDGES)
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES]),
}
optionsTable[#optionsTable + 1] = {
  type = "colorpicker",
  name = GetString(QUESTMAP_PLEDGES_TOOLTIP_COLOR),
  tooltip = GetString(QUESTMAP_PLEDGES_TOOLTIP_COLOR_DESC),
  getFunc = function() return unpack(QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES]) end,
  setFunc = function(r, g, b, a)
    QuestMap.settings.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES] = QuestMap.create_color_table(r, g, b, a)
    QuestMap:RefreshPinLayout()
  end,
  default = QuestMap.create_color_table_rbga(QuestMap.settings_default.pin_tooltip_colors[QuestMap.PIN_TYPE_QUEST_PLEDGES]),
}
optionsTable[#optionsTable + 1] = {
  type = "header",
  name = GetString(QUESTMAP_RESET_HIDDEN_HEADER),
  width = "full",
}
optionsTable[#optionsTable + 1] = {
  type = "description",
  title = GetString(QUESTMAP_MENU_HIDDEN_QUESTS_T),
  text = GetString(QUESTMAP_MENU_HIDDEN_QUESTS_1),
  width = "full",
}
optionsTable[#optionsTable + 1] = {
  type = "description",
  title = "",
  text = GetString(QUESTMAP_MENU_HIDDEN_QUESTS_2),
  width = "full",
}
optionsTable[#optionsTable + 1] = {
  type = "description",
  title = "",
  text = GetString(QUESTMAP_MENU_HIDDEN_QUESTS_B),
  width = "half",
}
optionsTable[#optionsTable + 1] = {
  type = "button",
  name = GetString(QUESTMAP_MENU_RESET_HIDDEN),
  tooltip = GetString(QUESTMAP_MENU_RESET_HIDDEN_TT),
  func = function()
    QuestMap.settings.hiddenQuests = {}
    QuestMap:RefreshPinLayout()
  end,
  width = "half",
  warning = GetString(QUESTMAP_MENU_RESET_HIDDEN_W),
}
optionsTable[#optionsTable + 1] = {
  type = "description",
  title = "",
  text = GetString(QUESTMAP_MENU_RESET_NOTE),
  width = "full",
}

-- Create texture on first load of the Better Rally LAM panel
local function CreateTexture(panel)
  if panel == WINDOW_MANAGER:GetControlByName(QuestMap.idName, "_Options") then
    -- Create Normal Icon Texture control
    normalIconTexture = WINDOW_MANAGER:CreateControl(QuestMap.idName .. "_Normal_Icon_Texture", panel.controlsToRefresh[NORMAL_ICON_SET_MENU], CT_TEXTURE)
    normalIconTexture:SetAnchor(CENTER, panel.controlsToRefresh[NORMAL_ICON_SET_MENU].dropdown:GetControl(), LEFT, -32, 0)
    normalIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.normalIconSet])
    normalIconTexture:SetDimensions(32, 32)

    storyIconTexture = WINDOW_MANAGER:CreateControl(QuestMap.idName .. "_Story_Icon_Texture", panel.controlsToRefresh[STORY_ICON_SET_MENU], CT_TEXTURE)
    storyIconTexture:SetAnchor(CENTER, panel.controlsToRefresh[STORY_ICON_SET_MENU].dropdown:GetControl(), LEFT, -32, 0)
    storyIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.storyIconSet])
    storyIconTexture:SetDimensions(32, 32)

    skillPointIconTexture = WINDOW_MANAGER:CreateControl(QuestMap.idName .. "_Skillpoint_Icon_Texture", panel.controlsToRefresh[SKILLPOINT_ICON_SET_MENU], CT_TEXTURE)
    skillPointIconTexture:SetAnchor(CENTER, panel.controlsToRefresh[SKILLPOINT_ICON_SET_MENU].dropdown:GetControl(), LEFT, -32, 0)
    skillPointIconTexture:SetTexture(QuestMap.icon_sets[QuestMap.settings.skillPointIconSet])
    skillPointIconTexture:SetDimensions(32, 32)

    cadwellIconTexture = WINDOW_MANAGER:CreateControl(QuestMap.idName .. "_Cadwell_Icon_Texture", panel.controlsToRefresh[CADWELL_ICON_SET_MENU], CT_TEXTURE)
    cadwellIconTexture:SetAnchor(CENTER, panel.controlsToRefresh[CADWELL_ICON_SET_MENU].dropdown:GetControl(), LEFT, -32, 0)
    cadwellIconTexture:SetTexture(QuestMap.cadwell_icon_sets[QuestMap.settings.cadwellIconSet])
    cadwellIconTexture:SetDimensions(32, 32)

    companionIconTexture = WINDOW_MANAGER:CreateControl(QuestMap.idName .. "_Companion_Icon_Texture", panel.controlsToRefresh[COMPANION_ICON_SET_MENU], CT_TEXTURE)
    companionIconTexture:SetAnchor(CENTER, panel.controlsToRefresh[COMPANION_ICON_SET_MENU].dropdown:GetControl(), LEFT, -32, 0)
    companionIconTexture:SetTexture(QuestMap.companion_icon_sets[QuestMap.settings.companionIconSet])
    companionIconTexture:SetDimensions(32, 32)

    CALLBACK_MANAGER:UnregisterCallback("LAM-PanelControlsCreated", CreateTexture)
  end
end
CALLBACK_MANAGER:RegisterCallback("LAM-PanelControlsCreated", CreateTexture)

-- Wait until all addons are loaded
local function OnPlayerActivated(event)
  local LAM = LibAddonMenu2
  if LAM ~= nil then
    LAM:RegisterAddonPanel(QuestMap.idName .. "_Options", panelData)
    LAM:RegisterOptionControls(QuestMap.idName .. "_Options", optionsTable)
  end
  EVENT_MANAGER:UnregisterForEvent(QuestMap.idName .. "_Options", EVENT_PLAYER_ACTIVATED)
end
EVENT_MANAGER:RegisterForEvent(QuestMap.idName .. "_Options", EVENT_PLAYER_ACTIVATED, OnPlayerActivated)