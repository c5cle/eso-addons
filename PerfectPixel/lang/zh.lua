--Chinese translations for the addon PerfectPixel
local stringsEn = {
	--[LAM settings]
	PP_LAM_ACTIVATE                               = "开启",
	PP_LAM_COLOR                                  = "颜色",
	PP_LAM_EDGE_COLOR                             = "边缘颜色",
	PP_LAM_LIST_BG                                = "列表背景",
	--Window & list style
	PP_LAM_WINDOW_STYLE                           = "窗口样式",
	PP_LAM_LIST_STYLE                             = "列表样式",
	PP_LAM_LIST_STYLE_BACKDROP                    = "背景",
	PP_LAM_LIST_STYLE_EDGE                        = "边缘",
	PP_LAM_LIST_STYLE_LIST                        = "列表",
	PP_LAM_LIST_STYLE_INSETS                      = "小图",
	PP_LAM_LIST_STYLE_TILE_LAYING                 = "平铺放置",
	PP_LAM_LIST_STYLE_TILE_SIZE                   = "平铺大小",
	PP_LAM_LIST_STYLE_COLOR                       = "颜色",
	PP_LAM_LIST_STYLE_HIGHLIGHT_COLOR             = "高亮颜色",
	PP_LAM_LIST_STYLE_SELECTED_COLOR              = "选中颜色",
	PP_LAM_LIST_STYLE_THICKNESS                   = "厚度",
	PP_LAM_LIST_STYLE_FILE_WIDTH                  = "文件宽度",
	PP_LAM_LIST_STYLE_FILE_HEIGHT                 = "文件高度",
	PP_LAM_LIST_STYLE_STRETCH_TEXTURE_EDGE        = "拉伸纹理边缘",
	PP_LAM_LIST_STYLE_FADE_DISTANCE               = "淡入淡出距离",
	PP_LAM_LIST_STYLE_UNIFORM_CONTROL_HEIGHT      = "行高",
	PP_LAM_LIST_STYLE_CONTROL_HEIGHT              = "控制高度",
	--Other
	PP_LAM_OTHERS                                 = "其他",
	PP_LAM_DONOTINTERRUPT                         = "不要打断交互动作。",
	PP_LAM_BLUR_BG                                = "背景模糊",
	-- PP_LAM_FADE_SCENE_DURATION						= "Fade scene duration (ms)",
	--Reticle
	PP_LAM_RETICLE                                = "十字线",
	PP_LAM_RETICLE_HIDE_STEALTH                   = "隐藏 \"" .. GetString(SI_STEALTH_HIDDEN) .. "\" 文本",
	--Tabs
	PP_LAM_TABS                                   = "选项",
	PP_LAM_TABS_HIDE_MENU_BAR_LABEL               = "隐藏菜单栏标签",
	PP_LAM_TABS_HIDE_TOP_BAR_BG                   = "隐藏顶栏背景",
	--Tooltips
	PP_LAM_TOOLTIPS                               = "提示",
	PP_LAM_COMPARATIVE_TOOLTIPS                   = "比较提示 - 按住显示",
	PP_LAM_COMPARATIVE_TOOLTIPS_TT                =
	"只有当您按住指定的按钮时，才会显示比较提示。在控制菜单中指定一个按钮！",
	PP_LAM_COMPARATIVE_TOOLTIPS_BIND              = "比较提示",
	--Compass
	PP_LAM_COMPASS                                = "罗盘",
	PP_LAM_COMPASS_QUEST                          = "任务区域",
	PP_LAM_COMPASS_COMBAT                         = "战斗指示",
	--[LAM Scenes]
	--Inventory Scene
	PP_LAM_SCENE_INV                              = "库存",
	PP_LAM_SCENE_INV_NO_SPIN                      = "不要转动视角。",
	PP_LAM_SCENE_INV_NO_SPIN_TT                   = "如果预览功能出现问题，请禁用。",
	--SkillsScene
	PP_LAM_SCENE_SKILLS                           = "技能",
	PP_LAM_SCENE_SKILLS_SKILLS_TREE_UNWRAPPED     = "未展开技能树",
	PP_LAM_SCENE_SKILLS_SKILLS_TREE_BG            = "技能树背景",
	--Journal Scene
	PP_LAM_SCENE_JOURNAL                          = "日志",
	PP_LAM_SCENE_JOURNAL_QUEST_LARGE_LIST         = "大型任务列表",
	--World map
	PP_LAM_SCENE_WORLDMAP                         = "世界地图",
	PP_LAM_SCENE_WORLDMAP_LARGE                   = "大型地图",
	--GameMenuInGameScene
	PP_LAM_SCENE_GAME_MENU                        = "主菜单",
	PP_LAM_SCENE_GAME_MENU_ADDONS                 = "插件",
	--Performance Meter
	PP_LAM_SCENE_PERFORMANCE_METER                = "性能仪表",
	--CraftStations
	PP_LAM_CRAFT_STATIONS_PROVISIONER_SHOWTOOLTIP = "显示提醒",
	PP_LAM_TRANSPARENCY                           = "透明度",
	--Keybindstrip
	PP_LAM_KEYBINDSTRIP                           = "按键绑定",
	--Chat
	PP_LAM_SCENE_CHAT                             = GetString(SI_CHAT_TAB_GENERAL),
}

--Provide the English strings as addon global values
setmetatable(stringsZh, {__index = PP.stringsEn})

--Create the strings so they are available via function GetString(stringId) ingame
for stringId, stringValue in pairs(stringsZh) do
	ZO_CreateStringId(stringId, stringValue)
	SafeAddVersion(stringId, 1)
end
