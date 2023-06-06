--[[
Author: Ayantir
Updated by Armodeniz
Filename: zh.lua
Version: 4
]]--

local strings = {

	SI_BINDING_NAME_SUPERSTAR_SHOW_PANEL			= "开关 SuperStar",
-- Scene Titles:
	SUPERSTAR_IMPORT_MENU_TITLE				= "角色模板导入",
	SUPERSTAR_FAVORITES_MENU_TITLE				= "角色模板收藏",
	SUPERSTAR_RESPEC_MENU_TITLE				= "角色模板重载",

-- Main Scene:
	SUPERSTAR_XML_SKILLPOINTS				= "技能点",
	SUPERSTAR_XML_CHAMPIONPOINTS				= "勇士点",

	SUPERSTAR_XML_DMG					= "伤害",
	SUPERSTAR_XML_CRIT					= "暴击率 / %",
	SUPERSTAR_XML_PENE					= "穿透",
	SUPERSTAR_XML_RESIST					= "抗性 / %",

	SUPERSTAR_EQUIP_SET_BONUS			        = "套装",

-- Skills Scene:
	SUPERSTAR_SCENE_SKILL_RACE_LABEL			= "种族",

	SUPERSTAR_XML_BUTTON_START				= "开始设计技能",

	SUPERSTAR_XML_BUTTON_FAV				= "加入收藏",
	SUPERSTAR_XML_BUTTON_REINIT				= "清空技能",

-- Import Scene:
	SUPERSTAR_XML_IMPORT_EXPLAIN				= "通过此页面可以导入他人的角色模板。\n\n角色模板包括勇士点、技能点以及属性点的分配方式。",

	SUPERSTAR_IMPORT_MYBUILD				= "我的当前角色哈希码",

	SUPERSTAR_IMPORT_ATTR_DISABLED				= "包含属性点",
	SUPERSTAR_IMPORT_ATTR_ENABLED				= "去除属性点",
	SUPERSTAR_IMPORT_SP_DISABLED				= "包含技能点",
	SUPERSTAR_IMPORT_SP_ENABLED				= "去除技能点",
	SUPERSTAR_IMPORT_CP_DISABLED				= "包含勇士点",
	SUPERSTAR_IMPORT_CP_ENABLED				= "去除勇士点",
	SUPERSTAR_IMPORT_BUILD_OK				= "查看此模板中的技能",
	SUPERSTAR_IMPORT_BUILD_NO_SKILLS			= "此模板中不含技能",
	SUPERSTAR_IMPORT_BUILD_NOK				= "哈希码出错，无法解读角色模板",
	SUPERSTAR_IMPORT_BUILD_LABEL				= "在此粘贴哈希码，来导入角色模板",

-- Favorite Scene:
	SUPERSTAR_XML_FAVORITES_EXPLAIN				= "角色模板收藏页面可以让你快速查看和载入之前做好的角色模板。\n\n请注意，你可以随时重载勇士点，但属性点和技能点必须在阵营主城或者章节区域主城中的祭坛上清除之后才能进行重载。",

	SUPERSTAR_XML_FAVORITES_HEADER_NAME			= "收藏名称",
	SUPERSTAR_XML_FAVORITES_HEADER_CP			= "勇士点",
	SUPERSTAR_XML_FAVORITES_HEADER_SP			= "技能点",
	SUPERSTAR_XML_FAVORITES_HEADER_ATTR			= "属性点",

	SUPERSTAR_VIEWFAV					= "查看技能",
	SUPERSTAR_RESPECFAV_SP					= "载入技能",
	SUPERSTAR_RESPECFAV_CP					= "载入勇士点",
	SUPERSTAR_VIEWHASH					= "查看哈希码",
	SUPERSTAR_REMFAV					= "删除此收藏",
	SUPERSTAR_UPDATEHASH					= "更新哈希码",

-- Respec Scene:
	SUPERSTAR_RESPEC_SPTITLE				= "将以 <<1>> 为模板，重新分配当前角色的|cFF0000技能点|r。",
	SUPERSTAR_RESPEC_CPTITLE				= "将以 <<1>> 为模板，重新分配当前角色的|cFF0000勇士点|r。",

	SUPERSTAR_RESPEC_SKILLLINES_MISSING			= "警告：因为尚未解锁，下列技能线无法载入",
	SUPERSTAR_RESPEC_CPREQUIRED				= "使用此模板将会载入 <<1>> 勇士点",

	SUPERSTAR_XML_BUTTON_RESPEC				= "重新分配",

	SUPERSTAR_RESPEC_ERROR1					= "无法重新分配技能点：职业不合",
	SUPERSTAR_RESPEC_ERROR2					= "无法重新分配技能点：技能点不足",
	SUPERSTAR_RESPEC_ERROR3					= "警告：模板种族与实际种族不合，载入时将忽略种族技能",
	SUPERSTAR_RESPEC_ERROR5					= "无法重新分配勇士点：你还不是勇士",
	SUPERSTAR_RESPEC_ERROR6					= "无法重新分配勇士点：勇士点不足",

	SUPERSTAR_RESPEC_INPROGRESS1				= "已分配职业技能",
	SUPERSTAR_RESPEC_INPROGRESS2				= "已分配武器技能",
	SUPERSTAR_RESPEC_INPROGRESS3				= "已分配护甲技能",
	SUPERSTAR_RESPEC_INPROGRESS4				= "已分配世界技能",
	SUPERSTAR_RESPEC_INPROGRESS5				= "已分配工会技能",
	SUPERSTAR_RESPEC_INPROGRESS6				= "已分配联盟技能",
	SUPERSTAR_RESPEC_INPROGRESS7				= "已分配种族技能",
	SUPERSTAR_RESPEC_INPROGRESS8				= "已分配交易技能",

	SUPERSTAR_CSA_RESPECDONE_TITLE				= "分配已完成",
	SUPERSTAR_CSA_RESPECDONE_POINTS				= "共分配了 <<1>> 点",
	SUPERSTAR_CSA_RESPEC_INPROGRESS				= "正在重新分配",
	SUPERSTAR_CSA_RESPEC_TIME				= "大概需要 <<1>> <<1[分钟/分钟/分钟]>>",

-- Companion Scene:
        SUPERSTAR_XML_NO_COMPANION                              = "当前未激活同伴",
-- Dialogs:
	SUPERSTAR_SAVEFAV					= "保存收藏",
	SUPERSTAR_FAVNAME					= "收藏名称",

	SUPERSTAR_DIALOG_SPRESPEC_TITLE				= "重新分配技能",
	SUPERSTAR_DIALOG_SPRESPEC_TEXT				= "确定要使用这个模板来重新分配技能吗？",

	SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TITLE		= "技能设计器重置",
	SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TEXT		= "当前的技能设计器中存储了勇士点和属性点，如果你选择重置，这些记录也都会被清空。\n\n如果你只是想修改某些技能，在技能图标上按鼠标右键就可以清除这个技能。",

	SUPERSTAR_DIALOG_CPRESPEC_NOCOST_TEXT			= "你将要重新分配勇士点。\n\n此次分配免费。",


--[[
	SUPERSTAR_XML_CUSTOMIZABLE				= "Customizable",
	SUPERSTAR_XML_GRANTED							= "Granted",
	SUPERSTAR_XML_TOTAL									= "Total",
	SUPERSTAR_XML_BUTTON_EXPORT						= "Export",
	SUPERSTAR_XML_NEWBUILD								= "New build :",
        ]]

	SUPERSTAR_DESC_ENCHANT_MAX							= " Maximum",

	SUPERSTAR_DESC_ENCHANT_SEC							= " seconds",
	SUPERSTAR_DESC_ENCHANT_SEC_SHORT					= " secs",

	SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG				= "Magic Damage",
	SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG_SHORT		= "Magic Dmg",

	SUPERSTAR_DESC_ENCHANT_BASH						= "bash",
	SUPERSTAR_DESC_ENCHANT_BASH_SHORT				= "bash",

	SUPERSTAR_DESC_ENCHANT_REDUCE						= " and reduce",
	SUPERSTAR_DESC_ENCHANT_REDUCE_SHORT				= " and",

}

for stringId, stringValue in pairs(strings) do
	ZO_CreateStringId(stringId, stringValue)
	SafeAddVersion(stringId, 1)
end
