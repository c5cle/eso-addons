--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
  -- General
  QUESTMAP_COMPLETED = "Ukończone",
  QUESTMAP_UNCOMPLETED = "Nieukończone",
  QUESTMAP_HIDDEN = "Ręcznie ukryte",
  QUESTMAP_STARTED = "Rozpoczęte",
  QUESTMAP_GUILD = "Guild",
  QUESTMAP_DAILY = "Dzienne",
  QUESTMAP_SKILL = "Punkt umiejętności",
  QUESTMAP_CADWELL = "Cadwell",
  QUESTMAP_COMPANION = "Companion",
  QUESTMAP_DUNGEON = "Dungeon",
  QUESTMAP_HOLIDAY = "Holiday",
  QUESTMAP_WEEKLY = "Weekly",
  QUESTMAP_ZONESTORY = "Zone Story",
  QUESTMAP_PROLOGUE = "Prologue",
  QUESTMAP_PLEDGES = "Pledges",

  QUESTMAP_HIDE = "Ukryj zadanie",
  QUESTMAP_UNHIDE = "Wyświetl zadanie",

  QUESTMAP_MSG_HIDDEN = "Zadanie ukryte",
  QUESTMAP_MSG_UNHIDDEN = "Zadanie widoczne",
  QUESTMAP_MSG_HIDDEN_P = "Zadania ukryte",
  QUESTMAP_MSG_UNHIDDEN_P = "Zadania widoczne",

  QUESTMAP_QUESTS = "Zadania",
  QUESTMAP_QUEST_SUBFILTER = "Podfiltr",

  QUESTMAP_SLASH_USAGE = "Po komendzie proszę wpisać argument:\n 'hide' - Ukrywa wszystkie zadania na obecnej mapie\n 'unhide' - Wyświetla wszystkie zadania na obecnej mapie",
  QUESTMAP_SLASH_MAPINFO = "Najpierw otwórz mapę.",

  QUESTMAP_LIB_REQUIRED = "Niezainstalowane.",

  -- Settings menu
  QUESTMAP_NORMAL_ICON_SET = "Kształt ikon",
  QUESTMAP_STORY_ICON_SET = "Story Icon set",
  QUESTMAP_SKILLPOINT_ICON_SET = "Skill Point Icon set",
  QUESTMAP_CADWELL_ICON_SET = "Cadwell Icon set",
  QUESTMAP_COMPANION_ICON_SET = "Companion Icon set",

  QUESTMAP_MENU_PIN_SIZE = "Wielkość znacznika na mapie",
  QUESTMAP_MENU_PIN_SIZE_TT = "Określa wielkość znaczników na mapie (domyślnie: " .. QuestMap.settings_default.pinSize .. ")",

  QUESTMAP_MENU_PIN_LVL = "Poziom znacznika na mapie",
  QUESTMAP_MENU_PIN_LVL_TT = "Określa na jakim poziomie umieszczane są znaczniki na mapie (domyślnie: " .. QuestMap.settings_default.pinLevel .. ")",

  QUESTMAP_MENU_DISP_MSG = "Powiadomienia na czacie o ukryciu lub wyświetleniu zadania",
  QUESTMAP_MENU_DISP_MSG_TT = "Włącza lub wyłącza powiadomienia na czacie, gdy znaczniki zostaną ukryte lub wyświetlone.",

  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG = "Przełączanie zadań na ukryte lub widoczne",
  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT = "Włącza lub wyłącza opcję ukrycia lub wyświetlenia zadania za pomocą kliknięcia na znacznik.",

  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG = "Przełączanie na widok listy ukończonych zadań",
  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT = "Włącza lub wyłącza opcję wyświetlania listy zadań po kliknięciu na znacznik ukończonego zadania - znaczniki są ułożone jeden na drugim.",

  QUESTMAP_MENU_HIDDEN_QUESTS_T = "Ręczne ukrywanie zadań",
  QUESTMAP_MENU_HIDDEN_QUESTS_1 = "Pozwala ręcznie ukrywać/wyświetlać znaczniki zadań za pomocą kliknięcia. (Aby zobaczyć znaczniki ukrytych zadań, włącz filtr znaczników po prawej stronie mapy.)",
  QUESTMAP_MENU_HIDDEN_QUESTS_2 = "Aby ukryć/wyświetlić wszystkie znaczniki zadań jednocześnie, możesz na czacie użyć komendy '/qm hide' lub 'qm unhide'.",
  QUESTMAP_MENU_HIDDEN_QUESTS_B = "Jeśli chcesz przywrócić WSZYSTKIE ręcznie ukryte znaczniki zadań, możesz skorzystać z tej opcji:",

  QUESTMAP_MENU_RESET_HIDDEN = "Zresetuj ukryte znaczniki",
  QUESTMAP_MENU_RESET_HIDDEN_TT = "Zresetuj ręcznie ukryte znaczniki",
  QUESTMAP_MENU_RESET_HIDDEN_W = "Nie można tego cofnąć!",

  QUESTMAP_MENU_RESET_NOTE = "Uwaga: Kliknięcie na poniższym  '" .. GetString(SI_OPTIONS_DEFAULTS) .. "' NIE zresetuje ręcznie ukrytych znaczników zadań.",

  QUESTMAP_MENU_SHOW_SUFFIX = "Wyświetlanie skrótu w oknie podpowiedzi",
  QUESTMAP_MENU_SHOW_SUFFIX_TT = "Wyświetla dodatkowe skróty w oknie podpowiedzi do znacznika zadania.",

  -- Uncompleted quest pin text
  QUESTMAP_UNCOMPLETED_PIN_COLOR = "Kolor znacznika zadań nieukończonych (UC)",
  QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań nieukończonych (UC)",

  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań nieukończonych (UC)",
  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań nieukończonych (UC)",

  -- Completed quest pin text
  QUESTMAP_COMPLETED_PIN_COLOR = "Kolor znacznika zadań ukończonych (CM)",
  QUESTMAP_COMPLETED_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań ukończonych (CM)",

  QUESTMAP_COMPLETED_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań ukończonych (CM)",
  QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań ukończonych (CM)",

  -- Hidden quest pin text
  QUESTMAP_HIDDEN_PIN_COLOR = "Kolor znacznika zadań ukrytych (HI)",
  QUESTMAP_HIDDEN_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań ukrytych (HI)",

  QUESTMAP_HIDDEN_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań ukrytych (HI)",
  QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań ukrytych (HI)",

  -- Started quest pin text
  QUESTMAP_STARTED_PIN_COLOR = "Kolor znacznika zadań rozpoczętych (ST)",
  QUESTMAP_STARTED_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań rozpoczętych (ST)",

  QUESTMAP_STARTED_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań rozpoczętych (ST)",
  QUESTMAP_STARTED_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań rozpoczętych (ST)",

  -- Guild quest pin text
  QUESTMAP_GUILD_PIN_COLOR = "Guild Quest Pin Color",
  QUESTMAP_GUILD_PIN_COLOR_DESC = "Change Guild Quest Pin Color",

  QUESTMAP_GUILD_TOOLTIP_COLOR = "Guild Quest Tooltip Color",
  QUESTMAP_GUILD_TOOLTIP_COLOR_DESC = "Change Guild Quest Tooltip Color",

  -- Daily quest pin text
  QUESTMAP_DAILY_PIN_COLOR = "Kolor znacznika zadań dziennych (DA)",
  QUESTMAP_DAILY_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań dziennych (DA)",

  QUESTMAP_DAILY_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań dziennych (DA)",
  QUESTMAP_DAILY_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań dziennych (DA)",

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
  QUESTMAP_CADWELL_PIN_COLOR = "Kolor znacznika zadań z Cadwellem (CW)",
  QUESTMAP_CADWELL_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań z Cadwellem (CW)",

  QUESTMAP_CADWELL_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań z Cadwellem (CW)",
  QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań z Cadwellem (CW)",

  -- Skill quest pin text
  QUESTMAP_SKILL_PIN_COLOR = "Kolor znacznika zadań z punktem umiejętności (SK)",
  QUESTMAP_SKILL_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań z punktem umiejętności (SK)",

  QUESTMAP_SKILL_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań z punktem umiejętności (SK)",
  QUESTMAP_SKILL_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań z punktem umiejętności (SK)",

  -- Dungeon quest pin text
  QUESTMAP_DUNGEON_PIN_COLOR = "Kolor znacznika zadań w lochach (DN)",
  QUESTMAP_DUNGEON_PIN_COLOR_DESC = "Zmiana koloru znacznika zadań w lochach (DN)",

  QUESTMAP_DUNGEON_TOOLTIP_COLOR = "Kolor okna podpowiedzi do zadań w lochach (DN)",
  QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC = "Zmiana koloru okna podpowiedzi do zadań w lochach (DN)",

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
