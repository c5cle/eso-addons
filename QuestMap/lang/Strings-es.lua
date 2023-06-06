--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
  -- General
  QUESTMAP_COMPLETED = "Completadas",
  QUESTMAP_UNCOMPLETED = "No completadas",
  QUESTMAP_HIDDEN = "Ocultadas manualmente",
  QUESTMAP_STARTED = "Comenzadas",
  QUESTMAP_GUILD = "Gremio",
  QUESTMAP_DAILY = "Diarias",
  QUESTMAP_SKILL = "Da punto de habilidad",
  QUESTMAP_CADWELL = "De Cadwell",
  QUESTMAP_COMPANION = "Companion",
  QUESTMAP_DUNGEON = "Mazmorra",
  QUESTMAP_HOLIDAY = "Festividades",
  QUESTMAP_WEEKLY = "Semanal",
  QUESTMAP_ZONESTORY = "Historia de zona",
  QUESTMAP_PROLOGUE = "Prologue",
  QUESTMAP_PLEDGES = "Pledges",

  QUESTMAP_HIDE = "Ocultar misión",
  QUESTMAP_UNHIDE = "Mostrar misión",

  QUESTMAP_MSG_HIDDEN = "Se ha ocultado la misión",
  QUESTMAP_MSG_UNHIDDEN = "Se mostrará la misión",
  QUESTMAP_MSG_HIDDEN_P = "Se han ocultado las misiones",
  QUESTMAP_MSG_UNHIDDEN_P = "Se mostrarán las misiones",

  QUESTMAP_QUESTS = "Misiones",
  QUESTMAP_QUEST_SUBFILTER = "Subfiltro",

  QUESTMAP_SLASH_USAGE = "Por favor, coloca un argumento tras el comando:\n 'hide' - Ocultará todas las misiones en el mapa actual.\n 'unhide' - Mostrará todas las misiones en el mapa actual.",
  QUESTMAP_SLASH_MAPINFO = "Por favor, abre tu mapa primero.",

  QUESTMAP_LIB_REQUIRED = "no instalado.",

  -- Settings menu
  QUESTMAP_NORMAL_ICON_SET = "Icono",
  QUESTMAP_STORY_ICON_SET = "Story Icon set",
  QUESTMAP_SKILLPOINT_ICON_SET = "Skill Point Icon set",
  QUESTMAP_CADWELL_ICON_SET = "Cadwell Icon set",
  QUESTMAP_COMPANION_ICON_SET = "Companion Icon set",

  QUESTMAP_MENU_PIN_SIZE = "Tamaño del marcador",
  QUESTMAP_MENU_PIN_SIZE_TT = "Define el tamaño del marcador en el mapa. (Por defecto: " .. QuestMap.settings_default.pinSize .. ")",

  QUESTMAP_MENU_PIN_LVL = "Nivel del marcador",
  QUESTMAP_MENU_PIN_LVL_TT = "Define el nivel de los marcadores en el mapa para que aparezcan sobre o por debajo de otros marcadores en la misma ubicación. (Por defecto: " .. QuestMap.settings_default.pinLevel .. ")",

  QUESTMAP_MENU_DISP_MSG = "Alternar notificaciones en el chat",
  QUESTMAP_MENU_DISP_MSG_TT = "Activa o desactiva las notificaciones en la ventana de chat al mostrar u ocultar los marcadores de misión.",

  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG = "Alternar hacer clic para mostrar u ocultar misiones",
  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT = "Activa o desactiva la opción de mostrar u ocultar misiones al hacer clic en un marcador.",

  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG = "Alternar opción de mostrar misiones completadas",
  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT = "Activa o desactiva la opción de mostrar cuando haces clic sobre un marcador de misión completada que esté sobre otros marcadores.",

  QUESTMAP_MENU_HIDDEN_QUESTS_T = "Ocultar misiones manualmente",
  QUESTMAP_MENU_HIDDEN_QUESTS_1 = "Puedes mostrar u ocultar marcadores de misión manualmente haciendo clic en ellos. (Para ver los marcadores ocultos, deberán ser activados desde el menú de filtros a la derecha del mapa.)",
  QUESTMAP_MENU_HIDDEN_QUESTS_2 = "Para mostrar u ocultar todos los marcadores en un mapa a la vez, puedes usar los comandos '/qm hide' o '/qm unhide'. en el chat",
  QUESTMAP_MENU_HIDDEN_QUESTS_B = "Si quieres que se muestren TODOS los marcadores de misión ocultados manualmente, basta con pulsar este botón:",

  QUESTMAP_MENU_RESET_HIDDEN = "Reiniciar marcadores",
  QUESTMAP_MENU_RESET_HIDDEN_TT = "Se volverán a mostrar todos los marcadores ocultados manualmente.",
  QUESTMAP_MENU_RESET_HIDDEN_W = "¡Esta acción no puede revertirse!",

  QUESTMAP_MENU_RESET_NOTE = "Nota: Hacer clic en '" .. GetString(SI_OPTIONS_DEFAULTS) .. "', al fondo, no reiniciará los marcadores ocultados manualmente.",

  QUESTMAP_MENU_SHOW_SUFFIX = "Alternar sufijos en la ventana de información",
  QUESTMAP_MENU_SHOW_SUFFIX_TT = "Muestra u oculta los sufijos en las ventanas de información de los marcadores por preferencia personal o como accesibilidad para daltónicos.",

  -- Uncompleted quest pin text
  QUESTMAP_UNCOMPLETED_PIN_COLOR = "Color de marcador de misiones no completadas",
  QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones no completadas.",

  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR = "Color del texto de inf. de misiones no completadas",
  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones no completadas.",

  -- Completed quest pin text
  QUESTMAP_COMPLETED_PIN_COLOR = "Color de marcador de misiones completadas",
  QUESTMAP_COMPLETED_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones completadas",

  QUESTMAP_COMPLETED_TOOLTIP_COLOR = "Color del texto de inf. de misiones completadas",
  QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones completadas.",

  -- Hidden quest pin text
  QUESTMAP_HIDDEN_PIN_COLOR = "Color de marcador de misiones ocultas",
  QUESTMAP_HIDDEN_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones ocultas.",

  QUESTMAP_HIDDEN_TOOLTIP_COLOR = "Color del texto de misiones ocultas",
  QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC = "Cambia el color de los marcadores de misiones ocultas.",

  -- Started quest pin text
  QUESTMAP_STARTED_PIN_COLOR = "Color de marcador de misiones comenzadas",
  QUESTMAP_STARTED_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones comenzadas.",

  QUESTMAP_STARTED_TOOLTIP_COLOR = "Color del texto de inf. de misiones comenzadas",
  QUESTMAP_STARTED_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones comenzadas.",

  -- Guild quest pin text
  QUESTMAP_GUILD_PIN_COLOR = "Color de marcador de misiones de gremio",
  QUESTMAP_GUILD_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de gremio.",

  QUESTMAP_GUILD_TOOLTIP_COLOR = "Color del texto de inf. de misiones de gremio",
  QUESTMAP_GUILD_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de gremio.",

  -- Daily quest pin text
  QUESTMAP_DAILY_PIN_COLOR = "Color de marcador de misiones diarias",
  QUESTMAP_DAILY_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones diarias.",

  QUESTMAP_DAILY_TOOLTIP_COLOR = "Color del texto de inf. de misiones diarias",
  QUESTMAP_DAILY_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones diarias.",

  -- Weekly Duration quest pin text
  QUESTMAP_WEEKLY_PIN_COLOR = "Color de marcador de misiones semanales",
  QUESTMAP_WEEKLY_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones semanales.",

  QUESTMAP_WEEKLY_TOOLTIP_COLOR = "Color del texto de inf. de misiones semanales",
  QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones semanales.",

  -- Holiday quest pin text
  QUESTMAP_HOLIDAY_PIN_COLOR = "Color de marcador de misiones de evento",
  QUESTMAP_HOLIDAY_PIN_COLOR_DESC = "Cambia el color de los marcadores de eventos festivos.",

  QUESTMAP_HOLIDAY_TOOLTIP_COLOR = "Color del texto de inf. de misiones de evento",
  QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de eventos festivos.",

  -- Cadwell quest pin text
  QUESTMAP_CADWELL_PIN_COLOR = "Color de marcador de misiones de Cadwell",
  QUESTMAP_CADWELL_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de Cadwell.",

  QUESTMAP_CADWELL_TOOLTIP_COLOR = "Color del texto de inf. de misiones de Cadwell",
  QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de Cadwell.",

  -- Skill quest pin text
  QUESTMAP_SKILL_PIN_COLOR = "Color de marcador de misiones que dan puntos de habilidad",
  QUESTMAP_SKILL_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones que otorgan puntos de habilidad.",

  QUESTMAP_SKILL_TOOLTIP_COLOR = "Color del texto de inf. de misiones que dan puntos de habilidad",
  QUESTMAP_SKILL_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones que otorgan puntos de habilidad.",

  -- Dungeon quest pin text
  QUESTMAP_DUNGEON_PIN_COLOR = "Color de marcador de misiones de mazmorra.",
  QUESTMAP_DUNGEON_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de mazmorras.",

  QUESTMAP_DUNGEON_TOOLTIP_COLOR = "Color del texto de inf. de misiones de mazmorra",
  QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de mazmorras.",

  -- Zonestory quest pin text
  QUESTMAP_ZONESTORY_PIN_COLOR = "Color de marcador de misiones de historia de zona",
  QUESTMAP_ZONESTORY_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de historia de zona.",

  QUESTMAP_ZONESTORY_TOOLTIP_COLOR = "Color del texto de inf. de misiones de zona",
  QUESTMAP_ZONESTORY_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de historia de zona.",

  -- Prologue quest pin text
  QUESTMAP_PROLOGUE_PIN_COLOR = "Color de marcador de misiones de prólogo",
  QUESTMAP_PROLOGUE_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de prólogo.",

  QUESTMAP_PROLOGUE_TOOLTIP_COLOR = "Color del texto de inf. de misiones de prólogo",
  QUESTMAP_PROLOGUE_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de prólogo.",

  -- Pledges quest pin text
  QUESTMAP_PLEDGES_PIN_COLOR = "Color de marcador de misiones de compromisos",
  QUESTMAP_PLEDGES_PIN_COLOR_DESC = "Cambia el color de los marcadores de misiones de compromisos.",

  QUESTMAP_PLEDGES_TOOLTIP_COLOR = "Color del texto de inf. de misiones de compromisos",
  QUESTMAP_PLEDGES_TOOLTIP_COLOR_DESC = "Cambia el color del texto en las ventanas de información de misiones de compromisos.",

  QUESTMAP_ICON_SETS_HEADER = "Quest Icon Sets",
  QUESTMAP_SETTINGS_HEADER = "Map Pin Settings",
  QUESTMAP_PIN_COLOR_HEADER = "Map Pin Color Settings",
  QUESTMAP_RESET_HIDDEN_HEADER = "Reset Hidden Map Pins",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end
