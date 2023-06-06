--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
  -- General
  QUESTMAP_COMPLETED = "已完成",
  QUESTMAP_UNCOMPLETED = "未完成",
  QUESTMAP_HIDDEN = "已手动隐藏",
  QUESTMAP_STARTED = "已开始",
  QUESTMAP_GUILD = "公会",
  QUESTMAP_DAILY = "日常",
  QUESTMAP_SKILL = "技能点",
  QUESTMAP_CADWELL = "卡德威尔",
  QUESTMAP_COMPANION = "Companion",
  QUESTMAP_DUNGEON = "副本",
  QUESTMAP_HOLIDAY = "节日",
  QUESTMAP_WEEKLY = "周常",
  QUESTMAP_ZONESTORY = "地区主线",
  QUESTMAP_PROLOGUE = "序章",
  QUESTMAP_PLEDGES = "契约",

  QUESTMAP_HIDE = "隐藏任务",
  QUESTMAP_UNHIDE = "取消隐藏",

  QUESTMAP_MSG_HIDDEN = "已隐藏任务",
  QUESTMAP_MSG_UNHIDDEN = "任务解除隐藏",
  QUESTMAP_MSG_HIDDEN_P = "已隐藏多个任务",
  QUESTMAP_MSG_UNHIDDEN_P = "多个任务已解除隐藏",

  QUESTMAP_QUESTS = "任务",
  QUESTMAP_QUEST_SUBFILTER = "筛选器",

  QUESTMAP_SLASH_USAGE = "请在指令后添加参数：\n '隐藏' - 隐藏当前地图所有任务\n '取消隐藏' - 取消隐藏当前地图所有任务",
  QUESTMAP_SLASH_MAPINFO = "请先打开地图",

  QUESTMAP_LIB_REQUIRED = "未安装",

  -- Settings menu
  QUESTMAP_NORMAL_ICON_SET = "图标设定",
  QUESTMAP_STORY_ICON_SET = "Story Icon set",
  QUESTMAP_SKILLPOINT_ICON_SET = "Skill Point Icon set",
  QUESTMAP_CADWELL_ICON_SET = "Cadwell Icon set",
  QUESTMAP_COMPANION_ICON_SET = "Companion Icon set",

  QUESTMAP_MENU_PIN_SIZE = "地图标点大小",
  QUESTMAP_MENU_PIN_SIZE_TT = "决定地图上的标记点大小 (默认：" .. QuestMap.settings_default.pinSize .. ")",

  QUESTMAP_MENU_PIN_LVL = "地图标记级别",
  QUESTMAP_MENU_PIN_LVL_TT = "决定绘制标记时使用的标记级别 (默认：" .. QuestMap.settings_default.pinLevel .. ")",

  QUESTMAP_MENU_DISP_MSG = "隐藏或取消隐藏任务时的聊天框提示",
  QUESTMAP_MENU_DISP_MSG_TT = "启用或停用聊天框的通知信息",

  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG = "开关隐藏与取消隐藏选项",
  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT = "启用或停用点击标记点时显示隐藏或取消隐藏任务的选项",

  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG = "开关显示已完成任务列表的选项",
  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT = "启用或停用当点击堆叠状态下的标记点时是否显示已完成任务列表",

  QUESTMAP_MENU_HIDDEN_QUESTS_T = "手动隐藏任务",
  QUESTMAP_MENU_HIDDEN_QUESTS_1 = "点击标记点时可以隐藏或取消隐藏对应任务。 (要查看隐藏的任务标记点，激活地图右边的地图标记筛选器)",
  QUESTMAP_MENU_HIDDEN_QUESTS_2 = "为了一次隐藏或取消隐藏当前地图的所有任务，你可以在聊天框输入指令 '/qm hide' 或是 '/qm unhide'",
  QUESTMAP_MENU_HIDDEN_QUESTS_B = "如果想要取消所有手动隐藏过的任务，你可以使用这个按钮：",

  QUESTMAP_MENU_RESET_HIDDEN = "重置隐藏标记",
  QUESTMAP_MENU_RESET_HIDDEN_TT = "重置手动隐藏的标记点",
  QUESTMAP_MENU_RESET_HIDDEN_W = "无法完成！",

  QUESTMAP_MENU_RESET_NOTE = "注意：点击下方的'" .. GetString(SI_OPTIONS_DEFAULTS) .. "' 不会重置手动隐藏的任务标记",

  QUESTMAP_MENU_SHOW_SUFFIX = "附加显示提示",
  QUESTMAP_MENU_SHOW_SUFFIX_TT = "切换是否显示提示，依个人习惯设定，可适用于色盲",

  -- Uncompleted quest pin text
  QUESTMAP_UNCOMPLETED_PIN_COLOR = "未完成任务的标记颜色",
  QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC = "更改未完成任务的标记颜色",

  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR = "未完成任务工具的提示颜色",
  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC = "更改未完成任务的提示颜色",

  -- Completed quest pin text
  QUESTMAP_COMPLETED_PIN_COLOR = "已完成任务的标记颜色",
  QUESTMAP_COMPLETED_PIN_COLOR_DESC = "更改已完成任务的标记颜色",

  QUESTMAP_COMPLETED_TOOLTIP_COLOR = "已完成任务的提示颜色",
  QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC = "更改已完成任务的提示颜色",

  -- Hidden quest pin text
  QUESTMAP_HIDDEN_PIN_COLOR = "已隐藏任务的标记颜色",
  QUESTMAP_HIDDEN_PIN_COLOR_DESC = "已隐藏任务的标记颜色",

  QUESTMAP_HIDDEN_TOOLTIP_COLOR = "已隐藏任务的提示颜色",
  QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC = "已隐藏任务的提示颜色",

  -- Started quest pin text
  QUESTMAP_STARTED_PIN_COLOR = "已开始任务的标记颜色",
  QUESTMAP_STARTED_PIN_COLOR_DESC = "更改已开始任务的标记颜色",

  QUESTMAP_STARTED_TOOLTIP_COLOR = "已开始任务的提示颜色",
  QUESTMAP_STARTED_TOOLTIP_COLOR_DESC = "更改已开始任务的提示颜色",

  -- Guild quest pin text
  QUESTMAP_GUILD_PIN_COLOR = "公会任务标记颜色",
  QUESTMAP_GUILD_PIN_COLOR_DESC = "更改公会任务标记颜色",

  QUESTMAP_GUILD_TOOLTIP_COLOR = "公会任务提示颜色",
  QUESTMAP_GUILD_TOOLTIP_COLOR_DESC = "更改公会任务提示颜色",

  -- Daily quest pin text
  QUESTMAP_DAILY_PIN_COLOR = "日常任务标记颜色",
  QUESTMAP_DAILY_PIN_COLOR_DESC = "更改日常任务标记颜色",

  QUESTMAP_DAILY_TOOLTIP_COLOR = "日常任务提示颜色",
  QUESTMAP_DAILY_TOOLTIP_COLOR_DESC = "更改日常任务提示颜色",

  -- Weekly Duration quest pin text
  QUESTMAP_WEEKLY_PIN_COLOR = "周常任务标记颜色",
  QUESTMAP_WEEKLY_PIN_COLOR_DESC = "更改周常任务标记颜色",

  QUESTMAP_WEEKLY_TOOLTIP_COLOR = "周常任务提示颜色",
  QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC = "更改周常任务提示颜色",

  -- Holiday quest pin text
  QUESTMAP_HOLIDAY_PIN_COLOR = "节日任务标记颜色",
  QUESTMAP_HOLIDAY_PIN_COLOR_DESC = "更改节日任务标记颜色",

  QUESTMAP_HOLIDAY_TOOLTIP_COLOR = "节日任务提示颜色",
  QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC = "更改节日任务提示颜色",

  -- Cadwell quest pin text
  QUESTMAP_CADWELL_PIN_COLOR = "卡德威尔任务标记颜色",
  QUESTMAP_CADWELL_PIN_COLOR_DESC = "更改卡德威尔任务标记颜色",

  QUESTMAP_CADWELL_TOOLTIP_COLOR = "卡德威尔任务提示颜色",
  QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC = "更改卡德威尔任务提示颜色",

  -- Skill quest pin text
  QUESTMAP_SKILL_PIN_COLOR = "技能点任务标记颜色",
  QUESTMAP_SKILL_PIN_COLOR_DESC = "更改技能点任务标记颜色",

  QUESTMAP_SKILL_TOOLTIP_COLOR = "技能点任务提示颜色",
  QUESTMAP_SKILL_TOOLTIP_COLOR_DESC = "更改技能点任务提示颜色",

  -- Dungeon quest pin text
  QUESTMAP_DUNGEON_PIN_COLOR = "副本任务标记颜色",
  QUESTMAP_DUNGEON_PIN_COLOR_DESC = "更改副本任务标记颜色",

  QUESTMAP_DUNGEON_TOOLTIP_COLOR = "副本任务提示颜色",
  QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC = "更改副本任务提示颜色",

  -- Zonestory quest pin text
  QUESTMAP_ZONESTORY_PIN_COLOR = "地区主线标记颜色",
  QUESTMAP_ZONESTORY_PIN_COLOR_DESC = "更改地区主线标记颜色",

  QUESTMAP_ZONESTORY_TOOLTIP_COLOR = "地区主线提示颜色",
  QUESTMAP_ZONESTORY_TOOLTIP_COLOR_DESC = "更改地区主线提示颜色",

  -- Prologue quest pin text
  QUESTMAP_PROLOGUE_PIN_COLOR = "序章任务标记颜色",
  QUESTMAP_PROLOGUE_PIN_COLOR_DESC = "更改序章任务标记颜色",

  QUESTMAP_PROLOGUE_TOOLTIP_COLOR = "序章任务提示颜色",
  QUESTMAP_PROLOGUE_TOOLTIP_COLOR_DESC = "更改序章任务提示颜色",

  -- Pledges quest pin text
  QUESTMAP_PLEDGES_PIN_COLOR = "契约任务标记颜色",
  QUESTMAP_PLEDGES_PIN_COLOR_DESC = "更改契约任务标记颜色",

  QUESTMAP_PLEDGES_TOOLTIP_COLOR = "契约任务提示颜色",
  QUESTMAP_PLEDGES_TOOLTIP_COLOR_DESC = "更改契约任务提示颜色",

  QUESTMAP_ICON_SETS_HEADER = "Quest Icon Sets",
  QUESTMAP_SETTINGS_HEADER = "Map Pin Settings",
  QUESTMAP_PIN_COLOR_HEADER = "Map Pin Color Settings",
  QUESTMAP_RESET_HIDDEN_HEADER = "Reset Hidden Map Pins",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end
