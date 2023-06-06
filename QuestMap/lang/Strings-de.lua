--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
  -- General
  QUESTMAP_COMPLETED = "Erledigt",
  QUESTMAP_UNCOMPLETED = "Unerledigt",
  QUESTMAP_HIDDEN = "Manuell ausgeblendet",
  QUESTMAP_STARTED = "Begonnen",
  QUESTMAP_GUILD = "Guild",
  QUESTMAP_DAILY = "Daily",
  QUESTMAP_SKILL = "Fertigkeitspunkt",
  QUESTMAP_CADWELL = "Cadwells Almanach",
  QUESTMAP_COMPANION = "Companion",
  QUESTMAP_DUNGEON = "Dungeon",
  QUESTMAP_HOLIDAY = "Holiday",
  QUESTMAP_WEEKLY = "Weekly",
  QUESTMAP_ZONESTORY = "Zone Story",
  QUESTMAP_PROLOGUE = "Prologue",
  QUESTMAP_PLEDGES = "Pledges",

  QUESTMAP_HIDE = "Quest ausblenden",
  QUESTMAP_UNHIDE = "Quest einblenden",

  QUESTMAP_MSG_HIDDEN = "Quest ausgeblendet",
  QUESTMAP_MSG_UNHIDDEN = "Quest eingeblendet",
  QUESTMAP_MSG_HIDDEN_P = "Quests ausgeblendet",
  QUESTMAP_MSG_UNHIDDEN_P = "Quests eingeblendet",

  QUESTMAP_QUESTS = "Quests",
  QUESTMAP_QUEST_SUBFILTER = "Subfilter",

  QUESTMAP_SLASH_USAGE = "Bitte verwende ein Argument nach dem Befehl:\n 'hide' - Alle quests in der aktuellen Karte ausblenden\n 'unhide' - Alle quests in der aktuellen Karte einblenden",
  QUESTMAP_SLASH_MAPINFO = "Bitte erst die Karte öffnen.",

  QUESTMAP_LIB_REQUIRED = "nicht installiert/aktiviert.",

  -- Settings menu
  QUESTMAP_NORMAL_ICON_SET = "Icon set",
  QUESTMAP_STORY_ICON_SET = "Story Icon set",
  QUESTMAP_SKILLPOINT_ICON_SET = "Skill Point Icon set",
  QUESTMAP_CADWELL_ICON_SET = "Cadwell Icon set",
  QUESTMAP_COMPANION_ICON_SET = "Companion Icon set",

  QUESTMAP_MENU_PIN_SIZE = "Grösse der Kartenmarkierung",
  QUESTMAP_MENU_PIN_SIZE_TT = "Definiert die Anzeigegrösse der Kartenmarkierungen (Standard: " .. QuestMap.settings_default.pinSize .. ")",

  QUESTMAP_MENU_PIN_LVL = "Ebene der Kartenmarkierung",
  QUESTMAP_MENU_PIN_LVL_TT = "Definiert auf welcher Ebene die Kartenmarkierungen gezeichnet werden (Standard: " .. QuestMap.settings_default.pinLevel .. ")",

  QUESTMAP_MENU_DISP_MSG = "Ein-/ausblende-Nachricht anzeigen",
  QUESTMAP_MENU_DISP_MSG_TT = "Ein-/ausschalten der Nachricht die angezeigt wird, wenn Markierungen ein-/ausgeblendet werden",

  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG = "Umschalt-Option, um Quests ein- oder auszublenden",
  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT = "Aktiviert oder deaktiviert die Option zum Ein- oder Ausblenden von Quests, wenn ein Quest-Pin angeklickt wird.",

  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG = "Schalter am Pin: Verstecke/Zeige erledigte Quest Liste",
  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT = "Aktiviert oder deaktiviert einen Schalter an den Karten Quest Pins von erledigten Quests, welche eine Quest Liste anzeigt oder versteckt, wenn du den Pin anklickst.",

  QUESTMAP_MENU_HIDDEN_QUESTS_T = "Quests manuell ausblenden",
  QUESTMAP_MENU_HIDDEN_QUESTS_1 = "Du kannst Questmarkierungen manuell ausblenden indem du sie anklickst. (Um ausgeblendete Questmarkierungen zu sehen, aktiviere den Filter für Kartenmarkierungen rechts neben der Karte.)",
  QUESTMAP_MENU_HIDDEN_QUESTS_2 = "Zum gleichzeitigen ein-/ausblenden aller Kartenmarkierung einer bestimmten Karte kannst du den Chat-Befehl '/qm hide' oder '/qm unhide' verwenden.",
  QUESTMAP_MENU_HIDDEN_QUESTS_B = "Willst du ALLE ausgeblendeten Markierungen zurücksetzen, dann benütze diese Schaltfläche:",

  QUESTMAP_MENU_RESET_HIDDEN = "Ausgebl. zurücksetzen",
  QUESTMAP_MENU_RESET_HIDDEN_TT = "Manuell ausgeblendete Markierungen zurücksetzen",
  QUESTMAP_MENU_RESET_HIDDEN_W = "Kann nicht rückgängig gemacht werden!",

  QUESTMAP_MENU_RESET_NOTE = "Hinweis: Unten auf '" .. GetString(SI_OPTIONS_DEFAULTS) .. "' klicken setzt die manuell ausgeblendeten Questmarkierungen NICHT zurück.",

  QUESTMAP_MENU_SHOW_SUFFIX = "Zeige Tooltip Anhang",
  QUESTMAP_MENU_SHOW_SUFFIX_TT = "Aktiviert den Quest Pin Tooltip Anhang Infotext, z.B. für Farbenblinde Benutzer oder auch aus persönlicher Vorliebe.\nDer Anhangstext enthält eine Information, ob die Quest unbekannt/angenommen/erledigt ist.",

  -- Uncompleted quest pin text
  QUESTMAP_UNCOMPLETED_PIN_COLOR = "Unerledigte Quest Pin Farbe",
  QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC = "Ändere die unerledigte Quest Pin Farbe",

  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR = "Unerledigte Quest Tooltip Farbe",
  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC = "Ändere die unerledigte Quest Tooltip Farbe",

  -- Completed quest pin text
  QUESTMAP_COMPLETED_PIN_COLOR = "Erledigte Quest Pin Farbe",
  QUESTMAP_COMPLETED_PIN_COLOR_DESC = "Ändere die erledigte Quest Pin Farbe",

  QUESTMAP_COMPLETED_TOOLTIP_COLOR = "Erledigte Quest Tooltip Farbe",
  QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC = "Ändere die erledigte Quest Tooltip Farbe",

  -- Hidden quest pin text
  QUESTMAP_HIDDEN_PIN_COLOR = "Versteckte Quest Pin Farbe",
  QUESTMAP_HIDDEN_PIN_COLOR_DESC = "Ändere die versteckte Quest Pin Farbe",

  QUESTMAP_HIDDEN_TOOLTIP_COLOR = "Versteckte Quest Tooltip Farbe",
  QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC = "Ändere die versteckte Quest Tooltip Farbe",

  -- Started quest pin text
  QUESTMAP_STARTED_PIN_COLOR = "Gestartete Quest Pin Farbe",
  QUESTMAP_STARTED_PIN_COLOR_DESC = "Ändere die gestartete Quest Pin Farbe",

  QUESTMAP_STARTED_TOOLTIP_COLOR = "Gestartete Quest Tooltip Farbe",
  QUESTMAP_STARTED_TOOLTIP_COLOR_DESC = "Ändere die gestartete Quest Tooltip Farbe",

  -- Guild quest pin text
  QUESTMAP_GUILD_PIN_COLOR = "Guild Quest Pin Color",
  QUESTMAP_GUILD_PIN_COLOR_DESC = "Change Guild Quest Pin Color",

  QUESTMAP_GUILD_TOOLTIP_COLOR = "Guild Quest Tooltip Color",
  QUESTMAP_GUILD_TOOLTIP_COLOR_DESC = "Change Guild Quest Tooltip Color",

  -- Daily quest pin text
  QUESTMAP_DAILY_PIN_COLOR = "Tägliche Quest Pin Farbe",
  QUESTMAP_DAILY_PIN_COLOR_DESC = "Ändere die tägliche Quest Pin Farbe",

  QUESTMAP_DAILY_TOOLTIP_COLOR = "Daily Quest Tooltip Farbe",
  QUESTMAP_DAILY_TOOLTIP_COLOR_DESC = "Ändere die tägliche Quest Tooltip Farbe",

  -- Weekly Duration quest pin text
  QUESTMAP_WEEKLY_PIN_COLOR = "Weekly Quest Pin Color",
  QUESTMAP_WEEKLY_PIN_COLOR_DESC = "Change Weekly Quest Pin Color",

  QUESTMAP_WEEKLY_TOOLTIP_COLOR = "Weekly Quest Tooltip Color",
  QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC = "Change Weekly Quest Tooltip Color",

  -- Holiday quest pin text
  QUESTMAP_HOLIDAY_PIN_COLOR = "Holiday Quest Pin Color",
  QUESTMAP_HOLIDAY_PIN_COLOR_DESC = "Change Holiday Quest Pin Color",

  QUESTMAP_HOLIDAY_TOOLTIP_COLOR = "Holiday Quest Tooltip Color",
  QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC = "Change Holiday Quest Tooltip Color",

  -- Cadwell quest pin text
  QUESTMAP_CADWELL_PIN_COLOR = "Cadwell Quest Pin Farbe",
  QUESTMAP_CADWELL_PIN_COLOR_DESC = "Ändere die Cadwell Quest Pin Farbe",

  QUESTMAP_CADWELL_TOOLTIP_COLOR = "Cadwell Quest Tooltip Farbe",
  QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC = "Ändere die Cadwell Quest Tooltip Farbe",

  -- Skill quest pin text
  QUESTMAP_SKILL_PIN_COLOR = "Fertigkeit Quest Pin Farbe",
  QUESTMAP_SKILL_PIN_COLOR_DESC = "Ändere die Fertigkeit Quest Pin Farbe",

  QUESTMAP_SKILL_TOOLTIP_COLOR = "Fertigkeit Quest Tooltip Farbe",
  QUESTMAP_SKILL_TOOLTIP_COLOR_DESC = "Ändere die Fertigkeit Quest Tooltip Farbe",

  -- Dungeon quest pin text
  QUESTMAP_DUNGEON_PIN_COLOR = "Verlies Quest Pin Farbe",
  QUESTMAP_DUNGEON_PIN_COLOR_DESC = "Ändere die Verlies Quest Pin Farbe",

  QUESTMAP_DUNGEON_TOOLTIP_COLOR = "Verlies Quest Tooltip Farbe",
  QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC = "Ändere die Verlies Quest Tooltip Farbe",

  -- Zonestory quest pin text
  QUESTMAP_ZONESTORY_PIN_COLOR = "Zonestory Quest Pin Color",
  QUESTMAP_ZONESTORY_PIN_COLOR_DESC = "Change Zonestory Quest Pin Color",

  QUESTMAP_ZONESTORY_TOOLTIP_COLOR = "Zonestory Quest Tooltip Color",
  QUESTMAP_ZONESTORY_TOOLTIP_COLOR_DESC = "Change Zonestory Quest Tooltip Color",

  -- Prologue quest pin text
  QUESTMAP_PROLOGUE_PIN_COLOR = "Prologue Quest Pin Color",
  QUESTMAP_PROLOGUE_PIN_COLOR_DESC = "Change Prologue Quest Pin Color",

  QUESTMAP_PROLOGUE_TOOLTIP_COLOR = "Prologue Quest Tooltip Color",
  QUESTMAP_PROLOGUE_TOOLTIP_COLOR_DESC = "Change Prologue Quest Tooltip Color",

  -- Pledges quest pin text
  QUESTMAP_PLEDGES_PIN_COLOR = "Pledges Quest Pin Color",
  QUESTMAP_PLEDGES_PIN_COLOR_DESC = "Change Pledges Quest Pin Color",

  QUESTMAP_PLEDGES_TOOLTIP_COLOR = "Pledges Quest Tooltip Color",
  QUESTMAP_PLEDGES_TOOLTIP_COLOR_DESC = "Change Pledges Quest Tooltip Color",

  QUESTMAP_ICON_SETS_HEADER = "Quest Icon Sets",
  QUESTMAP_SETTINGS_HEADER = "Map Pin Settings",
  QUESTMAP_PIN_COLOR_HEADER = "Map Pin Color Settings",
  QUESTMAP_RESET_HIDDEN_HEADER = "Reset Hidden Map Pins",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end
