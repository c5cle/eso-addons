--[[
Author: Ayantir
Filename: ru.lua
Version: 3
Translate: Ankou_RMV
]]--

local strings = {

	SI_BINDING_NAME_SUPERSTAR_SHOW_PANEL			= "Открыть SuperStar",

	SUPERSTAR_RESPECFAV_SP								= "Применить навыки",
	SUPERSTAR_RESPECFAV_CP								= "Применить очки героя",
	SUPERSTAR_SAVEFAV										= "Сохранить в избранное",
	SUPERSTAR_VIEWFAV										= "Смотреть навыки",
	SUPERSTAR_VIEWHASH									= "Смотреть билд",
    SUPERSTAR_UPDATEHASH                                = "Обновить билд",
	SUPERSTAR_REMFAV										= "Удалить билд",
	SUPERSTAR_FAVNAME										= "Название билда",

	SUPERSTAR_CSA_RESPECDONE_TITLE					= "Изменение билда завершено",
	SUPERSTAR_CSA_RESPECDONE_POINTS					= "Очков затрачено: <<1>>",
	SUPERSTAR_CSA_RESPEC_INPROGRESS					= "Изменение билда в процессе",
	SUPERSTAR_CSA_RESPEC_TIME							= "Эта операция займет примерно <<1>> <<1[minutes/minute/minutes/минут]>>",

	SUPERSTAR_RESPEC_SPTITLE							= "Вы хотите применить |cFF0000навыки|r из билда : <<1>>",
	SUPERSTAR_RESPEC_CPTITLE							= "Вы хотите применить |cFF0000очки героя|r из билда : <<1>>",

	SUPERSTAR_RESPEC_ERROR1								= "Невозможно изменить навыки, у вас другой класс",
	SUPERSTAR_RESPEC_ERROR2								= "Невозможно изменить навыки, не хватает очков",
	SUPERSTAR_RESPEC_ERROR3								= "Внимание: Заданная раса в этом билде отличается от вашей, расовые навыки не будут применены",
	SUPERSTAR_RESPEC_ERROR5								= "Невозможно изменить очки героя, вы еще не являетесь героем",
	SUPERSTAR_RESPEC_ERROR6								= "Невозможно изменить очки героя, не хватает очков",

	SUPERSTAR_RESPEC_SKILLLINES_MISSING				= "Внимание: Выбранное древо навыков не разблокировано, и не может быть применено",
	SUPERSTAR_RESPEC_CPREQUIRED						= "Этот билд применит <<1>> очков героя",

	SUPERSTAR_RESPEC_INPROGRESS1						= "Классовые навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS2						= "Оружейные навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS3						= "Доспешные навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS4						= "Общие навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS5						= "Гильдейские навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS6						= "Военные навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS7						= "Расовые навыки применены",
	SUPERSTAR_RESPEC_INPROGRESS8						= "Ремесленые навыки применены",

	SUPERSTAR_IMPORT_MENU_TITLE						= "Импорт",
	SUPERSTAR_FAVORITES_MENU_TITLE					= "Избранное",
	SUPERSTAR_RESPEC_MENU_TITLE						= "Изменения",

	SUPERSTAR_DIALOG_SPRESPEC_TITLE					= "Применить очки навыков",
	SUPERSTAR_DIALOG_SPRESPEC_TEXT					= "Применить очки навыков из выбранного билда ?",

	SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TITLE		= "Сбросить Билдер Навыков",
	SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TEXT		= "Вы хотите Сбросить Билдер Навыков в котором содержатся характеристики и/или Очки Героя.\n\nЭто сбросит их значения.\n\nЕсли вы хотите изменить навык, нажмите правой кнопкой мыши на его иконке.",

	SUPERSTAR_DIALOG_CPRESPEC_NOCOST_TEXT			= "Вы хотите изменить Очки Героя.\n\nЭто изменение будет бесплатным.",

	SUPERSTAR_SCENE_SKILL_RACE_LABEL					= "Раса",

	SUPERSTAR_XML_CUSTOMIZABLE							= "Изменяемый",
	SUPERSTAR_XML_GRANTED								= "Получено",
	SUPERSTAR_XML_TOTAL									= "Всего",
	SUPERSTAR_XML_BUTTON_FAV							= "В избранное",
	SUPERSTAR_XML_BUTTON_REINIT						= "Сбросить",
	SUPERSTAR_XML_BUTTON_EXPORT						= "Экспорт",
	SUPERSTAR_XML_NEWBUILD								= "Новый билд :",
	SUPERSTAR_XML_BUTTON_RESPEC						= "Применить",
	SUPERSTAR_XML_BUTTON_START						= "Начать",
	SUPERSTAR_XML_IMPORT_EXPLAIN						= "Импортируйте билды в этом меню\n\nБилды могут содержать очки героя, навыков и характеристик.",
	SUPERSTAR_XML_FAVORITES_EXPLAIN					= "Избранное позволяет вам просматривать и быстро применять ваши билды.\n\nОбратите внимание, что вы можете изменить ваши очки героя из SuperStar, но характеристики и очки навыков необходимо сбросить в Святилище обновления находящееся в столице вашей фракции, либо с помощью кронных свитков.",

	SUPERSTAR_XML_SKILLPOINTS							= "Очки Навыков",
	SUPERSTAR_XML_CHAMPIONPOINTS						= "Очки Героя",

	SUPERSTAR_XML_DMG										= "Урон",
	SUPERSTAR_XML_CRIT									= "Крит / %",
	SUPERSTAR_XML_PENE									= "Пробивание",
	SUPERSTAR_XML_RESIST									= "Сопр / %",

	--SUPERSTAR_MAELSTROM_WEAPON							= "Вихрь",
	SUPERSTAR_DESC_ENCHANT_MAX							= " Максимум",

	SUPERSTAR_DESC_ENCHANT_SEC							= " секунд",
	SUPERSTAR_DESC_ENCHANT_SEC_SHORT					= " сек",

	SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG				= "Магический урон",
	SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG_SHORT		= "Маг ур.",

	SUPERSTAR_DESC_ENCHANT_BASH						= "удар",
	SUPERSTAR_DESC_ENCHANT_BASH_SHORT				= "удар",

	SUPERSTAR_DESC_ENCHANT_REDUCE						= " и снижает",
	SUPERSTAR_DESC_ENCHANT_REDUCE_SHORT				= " и",

	SUPERSTAR_IMPORT_ATTR_DISABLED					= "Вкл. характеристики",
	SUPERSTAR_IMPORT_ATTR_ENABLED						= "Искл. характеристики",
	SUPERSTAR_IMPORT_SP_DISABLED						= "Вкл. Очки навыков",
	SUPERSTAR_IMPORT_SP_ENABLED						= "Искл. Очки навыков",
	SUPERSTAR_IMPORT_CP_DISABLED						= "Вкл. Очки героя",
	SUPERSTAR_IMPORT_CP_ENABLED						= "Искл. Очки героя",
	SUPERSTAR_IMPORT_BUILD_OK							= "Смотреть навыки этого билда",
	SUPERSTAR_IMPORT_BUILD_NO_SKILLS					= "Этот билд не имеет навыков",
	SUPERSTAR_IMPORT_BUILD_NOK							= "Билд некорректный, проверьте хеш-данные",
	SUPERSTAR_IMPORT_BUILD_LABEL						= "Импорт билда: вставьте хеш-данные ниже",
	SUPERSTAR_IMPORT_MYBUILD							= "Мой билд",

	--SUPERSTAR_XML_SWITCH_PLACEHOLDER					= "Смените оружие для отображения",

	SUPERSTAR_XML_FAVORITES_HEADER_NAME		= "Название",
	SUPERSTAR_XML_FAVORITES_HEADER_CP		= "ОГ",
	SUPERSTAR_XML_FAVORITES_HEADER_SP		= "ОН",
	SUPERSTAR_XML_FAVORITES_HEADER_ATTR		= "Хар",

	SUPERSTAR_EQUIP_SET_BONUS			= "Набор",

}

for stringId, stringValue in pairs(strings) do
	ZO_CreateStringId(stringId, stringValue)
	SafeAddVersion(stringId, 1)
end
