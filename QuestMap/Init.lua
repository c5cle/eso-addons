--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

QuestMap = {}
QuestMap.displayName = "Quest Map"
QuestMap.idName = "QuestMap"

-------------------------------------------------
----- Logger Function                       -----
-------------------------------------------------
QuestMap.show_log = false
if LibDebugLogger then
  QuestMap.logger = LibDebugLogger.Create(QuestMap.idName)
end
local logger
local viewer
if DebugLogViewer then viewer = true else viewer = false end
if LibDebugLogger then logger = true else logger = false end

local function create_log(log_type, log_content)
  if not viewer and log_type == "Info" then
    CHAT_ROUTER:AddSystemMessage(log_content)
    return
  end
  if not QuestMap.show_log then return end
  if logger and log_type == "Debug" then
    QuestMap.logger:Debug(log_content)
  end
  if logger and log_type == "Info" then
    QuestMap.logger:Info(log_content)
  end
  if logger and log_type == "Verbose" then
    QuestMap.logger:Verbose(log_content)
  end
  if logger and log_type == "Warn" then
    QuestMap.logger:Warn(log_content)
  end
end

local function emit_message(log_type, text)
  if (text == "") then
    text = "[Empty String]"
  end
  create_log(log_type, text)
end

local function emit_table(log_type, t, indent, table_history)
  indent = indent or "."
  table_history = table_history or {}

  for k, v in pairs(t) do
    local vType = type(v)

    emit_message(log_type, indent .. "(" .. vType .. "): " .. tostring(k) .. " = " .. tostring(v))

    if (vType == "table") then
      if (table_history[v]) then
        emit_message(log_type, indent .. "Avoiding cycle on table...")
      else
        table_history[v] = true
        emit_table(log_type, v, indent .. "  ", table_history)
      end
    end
  end
end

function QuestMap:dm(log_type, ...)
  for i = 1, select("#", ...) do
    local value = select(i, ...)
    if (type(value) == "table") then
      emit_table(log_type, value)
    else
      emit_message(log_type, tostring(value))
    end
  end
end

-------------------------------------------------
----- Logger Function                       -----
-------------------------------------------------

-- Constatnts
QuestMap.PIN_TYPE_QUEST_UNCOMPLETED = "QuestMap_uncompleted"
QuestMap.PIN_TYPE_QUEST_COMPLETED = "QuestMap_completed"
QuestMap.PIN_TYPE_QUEST_HIDDEN = "QuestMap_hidden"
QuestMap.PIN_TYPE_QUEST_STARTED = "QuestMap_started"
QuestMap.PIN_TYPE_QUEST_GUILD = "QuestMap_guild"
QuestMap.PIN_TYPE_QUEST_DAILY = "QuestMap_daily"
QuestMap.PIN_TYPE_QUEST_WEEKLY = "QuestMap_weekly"
QuestMap.PIN_TYPE_QUEST_CADWELL = "QuestMap_cadwell"
QuestMap.PIN_TYPE_QUEST_COMPANION = "QuestMap_companion"
QuestMap.PIN_TYPE_QUEST_SKILL = "QuestMap_skill"
QuestMap.PIN_TYPE_QUEST_DUNGEON = "QuestMap_dungeon"
QuestMap.PIN_TYPE_QUEST_HOLIDAY = "QuestMap_holiday"
QuestMap.PIN_TYPE_QUEST_ZONESTORY = "QuestMap_zonestory"
QuestMap.PIN_TYPE_QUEST_PROLOGUE = "QuestMap_prologue"
QuestMap.PIN_TYPE_QUEST_PLEDGES = "QuestMap_pledges"

QuestMap.PIN_TYPE_QUEST_UNCOMPLETED_PVP = "QuestMap_uncompleted_pvp"
QuestMap.PIN_TYPE_QUEST_COMPLETED_PVP = "QuestMap_completed_pvp"
QuestMap.PIN_TYPE_QUEST_HIDDEN_PVP = "QuestMap_hidden_pvp"
QuestMap.PIN_TYPE_QUEST_STARTED_PVP = "QuestMap_started_pvp"
QuestMap.PIN_TYPE_QUEST_GUILD_PVP = "QuestMap_guild_pvp"
QuestMap.PIN_TYPE_QUEST_DAILY_PVP = "QuestMap_daily_pvp"
QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP = "QuestMap_weekly_pvp"
QuestMap.PIN_TYPE_QUEST_CADWELL_PVP = "QuestMap_cadwell_pvp"
QuestMap.PIN_TYPE_QUEST_COMPANION_PVP = "QuestMap_companion_pvp"
QuestMap.PIN_TYPE_QUEST_SKILL_PVP = "QuestMap_skill_pvp"
QuestMap.PIN_TYPE_QUEST_DUNGEON_PVP = "QuestMap_dungeon_pvp"
QuestMap.PIN_TYPE_QUEST_HOLIDAY_PVP = "QuestMap_holiday_pvp"
QuestMap.PIN_TYPE_QUEST_ZONESTORY_PVP = "QuestMap_zonestory_pvp"
QuestMap.PIN_TYPE_QUEST_PROLOGUE_PVP = "QuestMap_prologue_pvp"
QuestMap.PIN_TYPE_QUEST_PLEDGES_PVP = "QuestMap_pledges_pvp"

QuestMap.icon_sets = {
  Black = "esoui/art/compass/quest_icon.dds",
  BlackInverted = "QuestMap/icons/eso_inverted_uncompleted.dds",
  Bubble = "QuestMap/icons/dest_quest_3.dds",
  ESO = "QuestMap/icons/eso_completed.dds",
  ESOInverted = "QuestMap/icons/eso_inverted_completed.dds",
  Glow = "esoui/art/compass/quest_available_icon.dds",
  Outline = "QuestMap/icons/pin_quest_outline.dds",
  QuestMap = "QuestMap/icons/pinQuestCompleted.dds",
  StoryBlack = "/esoui/art/compass/zonestoryquest_icon.dds",
  StoryGlow = "/esoui/art/compass/zonestoryquest_available_icon.dds",
  StoryWhite = "/esoui/art/compass/zonestoryquest_icon_assisted.dds",
  Straight = "QuestMap/icons/dest_quest_1.dds",
  Tilted = "QuestMap/icons/dest_quest_2.dds",
}

QuestMap.cadwell_icon_sets = {
  Black = "esoui/art/compass/quest_icon.dds",
  BlackInverted = "QuestMap/icons/eso_inverted_uncompleted.dds",
  Bubble = "QuestMap/icons/dest_quest_3.dds",
  ESO = "QuestMap/icons/eso_completed.dds",
  ESOInverted = "QuestMap/icons/eso_inverted_completed.dds",
  Glow = "esoui/art/compass/quest_available_icon.dds",
  Outline = "QuestMap/icons/pin_quest_outline.dds",
  QuestMap = "QuestMap/icons/pinQuestCompleted.dds",
  StoryBlack = "/esoui/art/compass/zonestoryquest_icon.dds",
  StoryGlow = "/esoui/art/compass/zonestoryquest_available_icon.dds",
  StoryWhite = "/esoui/art/compass/zonestoryquest_icon_assisted.dds",
  Straight = "QuestMap/icons/dest_quest_1.dds",
  Tilted = "QuestMap/icons/dest_quest_2.dds",
  Cadwell = "QuestMap/icons/cadwells.dds",
}

QuestMap.companion_icon_sets = {
  Black = "esoui/art/compass/quest_icon.dds",
  BlackInverted = "QuestMap/icons/eso_inverted_uncompleted.dds",
  Bubble = "QuestMap/icons/dest_quest_3.dds",
  ESO = "QuestMap/icons/eso_completed.dds",
  ESOInverted = "QuestMap/icons/eso_inverted_completed.dds",
  Glow = "esoui/art/compass/quest_available_icon.dds",
  Outline = "QuestMap/icons/pin_quest_outline.dds",
  QuestMap = "QuestMap/icons/pinQuestCompleted.dds",
  StoryBlack = "/esoui/art/compass/zonestoryquest_icon.dds",
  StoryGlow = "/esoui/art/compass/zonestoryquest_available_icon.dds",
  StoryWhite = "/esoui/art/compass/zonestoryquest_icon_assisted.dds",
  Straight = "QuestMap/icons/dest_quest_1.dds",
  Tilted = "QuestMap/icons/dest_quest_2.dds",
  Companion = "QuestMap/icons/companions.dds",
}

function QuestMap.create_color_table(r, g, b, a)
  local c = {}

  if (type(r) == "string") then
    c[4], c[1], c[2], c[3] = ConvertHTMLColorToFloatValues(r)
  elseif (type(r) == "table") then
    local otherColorDef = r
    c[1] = otherColorDef[1] or otherColorDef.r or 1
    c[2] = otherColorDef[2] or otherColorDef.g or 1
    c[3] = otherColorDef[3] or otherColorDef.b or 1
    c[4] = otherColorDef[4] or otherColorDef.a or 1
  else
    c[1] = r or 1
    c[2] = g or 1
    c[3] = b or 1
    c[4] = a or 1
  end

  return c
end

function QuestMap.create_color_table_rbga(r, g, b, a)
  local c = {}

  if (type(r) == "string") then
    c.a, c.r, c.g, c.b = ConvertHTMLColorToFloatValues(r)
  elseif (type(r) == "table") then
    local otherColorDef = r
    c.r = otherColorDef[1] or otherColorDef.r or 1
    c.g = otherColorDef[2] or otherColorDef.g or 1
    c.b = otherColorDef[3] or otherColorDef.b or 1
    c.a = otherColorDef[4] or otherColorDef.a or 1
  else
    c.r = r or 1
    c.g = g or 1
    c.b = b or 1
    c.a = a or 1
  end

  return c
end

QuestMap.color_default = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, }

QuestMap.pin_color = {}
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_COMPLETED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HIDDEN] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_STARTED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_GUILD] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DAILY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_WEEKLY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_CADWELL] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_COMPANION] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_SKILL] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DUNGEON] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HOLIDAY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_ZONESTORY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PROLOGUE] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PLEDGES] = ZO_ColorDef:New(unpack(QuestMap.color_default))

QuestMap.tooltip_color = {}
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_COMPLETED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_HIDDEN] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_STARTED] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_GUILD] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_DAILY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_WEEKLY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_CADWELL] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_COMPANION] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_SKILL] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_DUNGEON] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_HOLIDAY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_ZONESTORY] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_PROLOGUE] = ZO_ColorDef:New(unpack(QuestMap.color_default))
QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_PLEDGES] = ZO_ColorDef:New(unpack(QuestMap.color_default))

QuestMap.QUEST_NAME_LAYOUT = {

  [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = {
    color_default = { [1] = 1, [2] = 0.9960784316, [3] = 0, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED],
    suffix = "(UC)",
  },
  [QuestMap.PIN_TYPE_QUEST_COMPLETED] = {
    color_default = { [1] = 0.9607843161, [2] = 0.5098039508, [3] = 0.1882352978, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_COMPLETED],
    suffix = "(CM)",
  },
  [QuestMap.PIN_TYPE_QUEST_HIDDEN] = {
    color_default = { [1] = 1, [2] = 0.9725490212, [3] = 0.7843137383, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_HIDDEN],
    suffix = "(HI)",
  },
  [QuestMap.PIN_TYPE_QUEST_STARTED] = {
    color_default = { [1] = 1, [2] = 0.1921568662, [3] = 1, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_STARTED],
    suffix = "(ST)",
  },
  [QuestMap.PIN_TYPE_QUEST_GUILD] = {
    color_default = { [1] = 0.1098039225, [2] = 0.9568627477, [3] = 1, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_GUILD],
    suffix = "(GD)",
  },
  [QuestMap.PIN_TYPE_QUEST_DAILY] = {
    color_default = { [1] = 0.1725490242, [2] = 0.9333333373, [3] = 0.1725490242, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_DAILY],
    suffix = "(DA)",
  },
  [QuestMap.PIN_TYPE_QUEST_WEEKLY] = {
    color_default = { [1] = 0.9411764741, [2] = 0.5882353187, [3] = 1, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_WEEKLY],
    suffix = "(WK)",
  },
  [QuestMap.PIN_TYPE_QUEST_CADWELL] = {
    color_default = { [1] = 0.8313725591, [2] = 0.6823529601, [3] = 0.2117647082, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_CADWELL],
    suffix = "(CW)",
  },
  [QuestMap.PIN_TYPE_QUEST_COMPANION] = {
    color_default = { [1] = 0.8313725591, [2] = 0.6823529601, [3] = 0.2117647082, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_COMPANION],
    suffix = "(CO)",
  },
  [QuestMap.PIN_TYPE_QUEST_SKILL] = {
    color_default = { [1] = 0.2588235438, [2] = 0.3882353008, [3] = 0.8470588326, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_SKILL],
    suffix = "(SK)",
  },
  [QuestMap.PIN_TYPE_QUEST_DUNGEON] = {
    color_default = { [1] = 0.5960784554, [2] = 0.3568627536, [3] = 1, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_DUNGEON],
    suffix = "(DN)",
  },
  [QuestMap.PIN_TYPE_QUEST_HOLIDAY] = {
    color_default = { [1] = 0.8705882430, [2] = 0.1176470593, [3] = 0.1450980455, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_HOLIDAY],
    suffix = "(HO)",
  },
  [QuestMap.PIN_TYPE_QUEST_ZONESTORY] = {
    color_default = { [1] = 0.6039215922, [2] = 0.3882353008, [3] = 0.1372549087, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_ZONESTORY],
    suffix = "(ZS)",
  },
  [QuestMap.PIN_TYPE_QUEST_PROLOGUE] = {
    color_default = { [1] = 0.6941176653, [2] = 0.6862745285, [3] = 0.7411764860, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_PROLOGUE],
    suffix = "(PR)",
  },
  [QuestMap.PIN_TYPE_QUEST_PLEDGES] = {
    color_default = { [1] = 1, [2] = 0.4078431427, [3] = 0.3803921640, [4] = 1, },
    color = QuestMap.tooltip_color[QuestMap.PIN_TYPE_QUEST_PLEDGES],
    suffix = "(UP)",
  },
}

QuestMap.settings_default = {
  ["iconSet"] = "QuestMap",
  ["normalIconSet"] = "QuestMap",
  ["storyIconSet"] = "StoryWhite",
  ["skillPointIconSet"] = "QuestMap",
  ["cadwellIconSet"] = "Cadwell",
  ["companionIconSet"] = "Companion",
  ["pinSize"] = 25,
  ["pinLevel"] = 120,
  ["hiddenQuests"] = {},
  ["pinFilters"] = {
    [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = true,
    [QuestMap.PIN_TYPE_QUEST_COMPLETED] = false,
    [QuestMap.PIN_TYPE_QUEST_HIDDEN] = false,
    [QuestMap.PIN_TYPE_QUEST_STARTED] = true,
    [QuestMap.PIN_TYPE_QUEST_GUILD] = false,
    [QuestMap.PIN_TYPE_QUEST_DAILY] = false,
    [QuestMap.PIN_TYPE_QUEST_WEEKLY] = false,
    [QuestMap.PIN_TYPE_QUEST_CADWELL] = false,
    [QuestMap.PIN_TYPE_QUEST_COMPANION] = false,
    [QuestMap.PIN_TYPE_QUEST_SKILL] = false,
    [QuestMap.PIN_TYPE_QUEST_DUNGEON] = false,
    [QuestMap.PIN_TYPE_QUEST_HOLIDAY] = false,
    [QuestMap.PIN_TYPE_QUEST_ZONESTORY] = true,
    [QuestMap.PIN_TYPE_QUEST_PROLOGUE] = true,
    [QuestMap.PIN_TYPE_QUEST_PLEDGES] = false,
    [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED_PVP] = true,
    [QuestMap.PIN_TYPE_QUEST_COMPLETED_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_HIDDEN_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_STARTED_PVP] = true,
    [QuestMap.PIN_TYPE_QUEST_GUILD_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_DAILY_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_CADWELL_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_COMPANION_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_SKILL_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_DUNGEON_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_HOLIDAY_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_ZONESTORY_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_PROLOGUE_PVP] = false,
    [QuestMap.PIN_TYPE_QUEST_PLEDGES_PVP] = false,
  },
  ["displayClickMsg"] = true,
  ["displayHideQuest"] = false,
  ["displaySuffix"] = false,
  ["displayQuestList"] = true,
  ["lastListArg"] = "uncompleted",
  ["pin_colors"] = {
    [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED].color_default,
    [QuestMap.PIN_TYPE_QUEST_COMPLETED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_COMPLETED].color_default,
    [QuestMap.PIN_TYPE_QUEST_HIDDEN] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_HIDDEN].color_default,
    [QuestMap.PIN_TYPE_QUEST_STARTED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_STARTED].color_default,
    [QuestMap.PIN_TYPE_QUEST_GUILD] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_GUILD].color_default,
    [QuestMap.PIN_TYPE_QUEST_DAILY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_DAILY].color_default,
    [QuestMap.PIN_TYPE_QUEST_WEEKLY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_WEEKLY].color_default,
    [QuestMap.PIN_TYPE_QUEST_CADWELL] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_CADWELL].color_default,
    [QuestMap.PIN_TYPE_QUEST_COMPANION] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_COMPANION].color_default,
    [QuestMap.PIN_TYPE_QUEST_SKILL] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_SKILL].color_default,
    [QuestMap.PIN_TYPE_QUEST_DUNGEON] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_DUNGEON].color_default,
    [QuestMap.PIN_TYPE_QUEST_HOLIDAY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_HOLIDAY].color_default,
    [QuestMap.PIN_TYPE_QUEST_ZONESTORY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_ZONESTORY].color_default,
    [QuestMap.PIN_TYPE_QUEST_PROLOGUE] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_PROLOGUE].color_default,
    [QuestMap.PIN_TYPE_QUEST_PLEDGES] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_PLEDGES].color_default,
  },
  ["pin_tooltip_colors"] = {
    [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED].color_default,
    [QuestMap.PIN_TYPE_QUEST_COMPLETED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_COMPLETED].color_default,
    [QuestMap.PIN_TYPE_QUEST_HIDDEN] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_HIDDEN].color_default,
    [QuestMap.PIN_TYPE_QUEST_STARTED] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_STARTED].color_default,
    [QuestMap.PIN_TYPE_QUEST_GUILD] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_GUILD].color_default,
    [QuestMap.PIN_TYPE_QUEST_DAILY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_DAILY].color_default,
    [QuestMap.PIN_TYPE_QUEST_WEEKLY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_WEEKLY].color_default,
    [QuestMap.PIN_TYPE_QUEST_CADWELL] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_CADWELL].color_default,
    [QuestMap.PIN_TYPE_QUEST_COMPANION] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_COMPANION].color_default,
    [QuestMap.PIN_TYPE_QUEST_SKILL] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_SKILL].color_default,
    [QuestMap.PIN_TYPE_QUEST_DUNGEON] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_DUNGEON].color_default,
    [QuestMap.PIN_TYPE_QUEST_HOLIDAY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_HOLIDAY].color_default,
    [QuestMap.PIN_TYPE_QUEST_ZONESTORY] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_ZONESTORY].color_default,
    [QuestMap.PIN_TYPE_QUEST_PROLOGUE] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_PROLOGUE].color_default,
    [QuestMap.PIN_TYPE_QUEST_PLEDGES] = QuestMap.QUEST_NAME_LAYOUT[QuestMap.PIN_TYPE_QUEST_PLEDGES].color_default,
  },
}
