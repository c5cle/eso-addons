--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local strings = {
  -- General
  QUESTMAP_COMPLETED = "Completas",
  QUESTMAP_UNCOMPLETED = "Não completas",
  QUESTMAP_HIDDEN = "Ocultas manualmente",
  QUESTMAP_STARTED = "Iniciada",
  QUESTMAP_GUILD = "Guild",
  QUESTMAP_DAILY = "Diarias",
  QUESTMAP_SKILL = "Ganha pontos de habilidade",
  QUESTMAP_CADWELL = "Cadwell",
  QUESTMAP_COMPANION = "Companion",
  QUESTMAP_DUNGEON = "Dungeon",
  QUESTMAP_HOLIDAY = "Festividade",
  QUESTMAP_WEEKLY = "Weekly",
  QUESTMAP_ZONESTORY = "Zone Story",
  QUESTMAP_PROLOGUE = "Prologue",
  QUESTMAP_PLEDGES = "Pledges",

  QUESTMAP_HIDE = "Ocultar missão",
  QUESTMAP_UNHIDE = "Mostrar missão",

  QUESTMAP_MSG_HIDDEN = "Missão foi escondida",
  QUESTMAP_MSG_UNHIDDEN = "Se mostrará la misión",
  QUESTMAP_MSG_HIDDEN_P = "Missões foram escondidas",
  QUESTMAP_MSG_UNHIDDEN_P = "As missões serão exibidas",

  QUESTMAP_QUESTS = "Missões",
  QUESTMAP_QUEST_SUBFILTER = "Subfiltro",

  QUESTMAP_SLASH_USAGE = "Por favor coloque um argumento após o comando:\n 'hide' - Ele irá esconder todas as missões no mapa atual.\n 'unhide' - Irá mostrar todas as missões no mapa atual.",
  QUESTMAP_SLASH_MAPINFO = "Por favor, abra seu mapa primeiro.",

  QUESTMAP_LIB_REQUIRED = "não instalado.",

  -- Settings menu
  QUESTMAP_NORMAL_ICON_SET = "Ícone",
  QUESTMAP_STORY_ICON_SET = "Story Icon set",
  QUESTMAP_SKILLPOINT_ICON_SET = "Skill Point Icon set",
  QUESTMAP_CADWELL_ICON_SET = "Cadwell Icon set",
  QUESTMAP_COMPANION_ICON_SET = "Companion Icon set",

  QUESTMAP_MENU_PIN_SIZE = "Tamanho do marcador",
  QUESTMAP_MENU_PIN_SIZE_TT = "Define o tamanho do marcador no mapa. (Por padrão: " .. QuestMap.settings_default.pinSize .. ")",

  QUESTMAP_MENU_PIN_LVL = "Nível do marcador",
  QUESTMAP_MENU_PIN_LVL_TT = "Define o nível de marcadores no mapa para aparecer acima ou abaixo de outros marcadores no mesmo local. (Por padrão: " .. QuestMap.settings_default.pinLevel .. ")",

  QUESTMAP_MENU_DISP_MSG = "Alternar notificações no bate-papo",
  QUESTMAP_MENU_DISP_MSG_TT = "Ativar ou desativar notificações na janela de bate-papo ao mostrar ou ocultar marcadores de missão.",

  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG = "Clique para mostrar ou ocultar as missões",
  QUESTMAP_MENU_TOGGLE_HIDDEN_MSG_TT = "Habilite ou desabilite a opção de mostrar ou ocultar missões ao clicar em um marcador.",

  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG = "Alternar opção para mostrar missões concluídas",
  QUESTMAP_MENU_TOGGLE_COMPLETED_MSG_TT = "Ative ou desative a opção de mostrar quando você clica em um marcador de missão concluída que está acima de outros marcadores.",

  QUESTMAP_MENU_HIDDEN_QUESTS_T = "Ocultar missões manualmente",
  QUESTMAP_MENU_HIDDEN_QUESTS_1 = "Você pode mostrar ou ocultar manualmente os marcadores de missão clicando neles. (Para ver os marcadores ocultos, eles devem ser ativados no menu de filtro à direita do mapa..)",
  QUESTMAP_MENU_HIDDEN_QUESTS_2 = "Para mostrar ou ocultar todos os marcadores em um mapa de uma vez, você pode usar os comandos '/qm hide' o '/qm unhide'. no chat",
  QUESTMAP_MENU_HIDDEN_QUESTS_B = "Se você quiser mostrar TODOS os marcadores de missão ocultos manualmente, basta pressionar este botão:",

  QUESTMAP_MENU_RESET_HIDDEN = "Reiniciar marcadores",
  QUESTMAP_MENU_RESET_HIDDEN_TT = "Todos os favoritos ocultos manualmente serão mostrados novamente.",
  QUESTMAP_MENU_RESET_HIDDEN_W = "Esta ação NÃO pode ser revertida!",

  QUESTMAP_MENU_RESET_NOTE = "Nota: Clique em '" .. GetString(SI_OPTIONS_DEFAULTS) .. "', na parte inferior, não redefinirá manualmente os favoritos ocultos.",

  QUESTMAP_MENU_SHOW_SUFFIX = "Alternar sufixos na janela de informações",
  QUESTMAP_MENU_SHOW_SUFFIX_TT = "Mostrar ou ocultar sufixos em janelas de informações de favoritos para preferência pessoal ou como acessibilidade para daltônicos.",

  -- Uncompleted quest pin text
  QUESTMAP_UNCOMPLETED_PIN_COLOR = "Cor dos marcadores para missões não concluídas",
  QUESTMAP_UNCOMPLETED_PIN_COLOR_DESC = "Muda a cor dos marcadores para missões não concluídas.",

  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR = "Cor do texto inf. missões não completadas",
  QUESTMAP_UNCOMPLETED_TOOLTIP_COLOR_DESC = "Mudar a cor do texto nas janelas de informação de missões não concluídas.",

  -- Completed quest pin text
  QUESTMAP_COMPLETED_PIN_COLOR = "Cor do marcador de missão concluída",
  QUESTMAP_COMPLETED_PIN_COLOR_DESC = "Mude a cor dos marcadores de missão concluídos",

  QUESTMAP_COMPLETED_TOOLTIP_COLOR = "Cor do texto inf. missões completadas",
  QUESTMAP_COMPLETED_TOOLTIP_COLOR_DESC = "Muda a cor do texto nas janelas de informação de missões concluídas.",

  -- Hidden quest pin text
  QUESTMAP_HIDDEN_PIN_COLOR = "Cor do marcador de missão oculta",
  QUESTMAP_HIDDEN_PIN_COLOR_DESC = "Mude a cor dos marcadores de missão escondidos.",

  QUESTMAP_HIDDEN_TOOLTIP_COLOR = "Cor do texto de missões ocultas",
  QUESTMAP_HIDDEN_TOOLTIP_COLOR_DESC = "Mude a cor dos marcadores de missão escondidos.",

  -- Started quest pin text
  QUESTMAP_STARTED_PIN_COLOR = "Cor do marcador de missão iniciada",
  QUESTMAP_STARTED_PIN_COLOR_DESC = "Mude a cor dos marcadores de missão iniciada.",

  QUESTMAP_STARTED_TOOLTIP_COLOR = "Cor do texto inf. missões começaram",
  QUESTMAP_STARTED_TOOLTIP_COLOR_DESC = "Muda a cor do texto nas janelas de informação das missões iniciadas.",

  -- Guild quest pin text
  QUESTMAP_GUILD_PIN_COLOR = "Guild Quest Pin Color",
  QUESTMAP_GUILD_PIN_COLOR_DESC = "Change Guild Quest Pin Color",

  QUESTMAP_GUILD_TOOLTIP_COLOR = "Guild Quest Tooltip Color",
  QUESTMAP_GUILD_TOOLTIP_COLOR_DESC = "Change Guild Quest Tooltip Color",

  -- Daily quest pin text
  QUESTMAP_DAILY_PIN_COLOR = "Cor do marcador da missão diária",
  QUESTMAP_DAILY_PIN_COLOR_DESC = "Mude a cor dos marcadores de missões diárias.",

  QUESTMAP_DAILY_TOOLTIP_COLOR = "Cor do texto inf. missões diárias",
  QUESTMAP_DAILY_TOOLTIP_COLOR_DESC = "Altere a cor do texto nas janelas de informações da missão diária.",

  -- Weekly Duration quest pin text
  QUESTMAP_WEEKLY_PIN_COLOR = "Weekly Quest Pin Color",
  QUESTMAP_WEEKLY_PIN_COLOR_DESC = "Change Weekly Quest Pin Color",

  QUESTMAP_WEEKLY_TOOLTIP_COLOR = "Weekly Quest Tooltip Color",
  QUESTMAP_WEEKLY_TOOLTIP_COLOR_DESC = "Change Weekly Quest Tooltip Color",

  -- Holiday quest pin text
  QUESTMAP_HOLIDAY_PIN_COLOR = "Cor do marcador da missão do evento",
  QUESTMAP_HOLIDAY_PIN_COLOR_DESC = "Altere a cor dos marcadores de eventos de festivos.",

  QUESTMAP_HOLIDAY_TOOLTIP_COLOR = "Cor do texto inf. de missões de eventos",
  QUESTMAP_HOLIDAY_TOOLTIP_COLOR_DESC = "Alterar a cor do texto nas janelas de informações da missão do evento festivos.",

  -- Cadwell quest pin text
  QUESTMAP_CADWELL_PIN_COLOR = "Cor do marcador de missão Caldwell.",
  QUESTMAP_CADWELL_PIN_COLOR_DESC = "Mude a cor dos marcadores de missão de Caldwell.",

  QUESTMAP_CADWELL_TOOLTIP_COLOR = "Cor do texto inf. Missões Caldwell",
  QUESTMAP_CADWELL_TOOLTIP_COLOR_DESC = "Altere a cor do texto nas janelas de informações da missão de Cadwell.",

  -- Skill quest pin text
  QUESTMAP_SKILL_PIN_COLOR = "Cor dos marcadores de missão que fornecem pontos de habilidade",
  QUESTMAP_SKILL_PIN_COLOR_DESC = "Altere a cor dos marcadores de missão que fornecem pontos de habilidade.",

  QUESTMAP_SKILL_TOOLTIP_COLOR = "Cor do texto inf. de missões que dão pontos de habilidade",
  QUESTMAP_SKILL_TOOLTIP_COLOR_DESC = "Altere a cor do texto nas janelas de informações da missão que atribuem pontos de habilidade.",

  -- Dungeon quest pin text
  QUESTMAP_DUNGEON_PIN_COLOR = "Cor do marcador da missão na masmorra.",
  QUESTMAP_DUNGEON_PIN_COLOR_DESC = "Mude a cor dos marcadores de missão da masmorra.",

  QUESTMAP_DUNGEON_TOOLTIP_COLOR = "Cor do texto inf. de missões de masmorra",
  QUESTMAP_DUNGEON_TOOLTIP_COLOR_DESC = "Altere a cor do texto nas janelas de informações das missões da masmorra.",

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
