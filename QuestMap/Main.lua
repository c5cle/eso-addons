--[[

Quest Map
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

-- Libraries
local LMP = LibMapPins
local LMW = LibMsgWin
local GPS = LibGPS3
local LQD = LibQuestData
local SDLV = DebugLogViewer
local LMD = LibMapData

-- Constants
local PIN_PRIORITY_OFFSET = 1
local DAILY_REPEATABLE_PIN_OFFSET = 2

-- Local variables
local zoneQuests = {}

-------------------------------------------------
----- Helpers                               -----
-------------------------------------------------

local function is_in(search_value, search_table)
  for k, v in pairs(search_table) do
    if search_value == v then return true end
    if type(search_value) == "string" then
      if string.find(string.lower(v), string.lower(search_value)) then return true end
    end
  end
  return false
end

-------------------------------------------------
----- Quest Map                             -----
-------------------------------------------------

-- UI
local ListUI
if LMW ~= nil then
  ListUI = LMW:CreateMsgWindow(QuestMap.idName .. "_ListUI", " ")
  ListUI:SetAnchor(TOPLEFT, nil, nil, 50, 200)
  ListUI:SetDimensions(400, 600)
  ListUI:SetHidden(true)
  local btn = WINDOW_MANAGER:CreateControlFromVirtual(ListUI:GetName() .. "Close", ListUI, "ZO_CloseButton")
  btn:SetAnchor(TOPRIGHT, nil, nil, -7, 7)
  btn:SetHandler("OnClicked", function(self) self:GetParent():SetHidden(true) end)
end

-- Function to check for empty table
local function isEmpty(t)
  if next(t) == nil then
    return true
  else
    return false
  end
end

--[[
Function to print text when hiding quests to the chat window
including the addon name
]]--
local function p(s)
  if QuestMap.logger and SDLV then
    s = s:gsub("|cFFFFFF", "")
    temp_state = QuestMap.show_log
    QuestMap.show_log = true
    QuestMap:dm("Debug", s)
    QuestMap.show_log = temp_state
  else
    -- Add addon name to message
    s = "|c70C0DE[" .. QuestMap.displayName .. "]|r " .. s
    -- Replace regular color (yellow) with ESO golden in this string
    s = s:gsub("|r", "|cC5C29E")
    -- Replace newline character with newline + ESO golden (because newline resets color to default yellow)
    s = s:gsub("\n", "\n|cC5C29E")
    -- Display message
    CHAT_ROUTER:AddSystemMessage(s)
  end
end

-- Function to get the location/position of the player by slash command for reporting new quest givers / bugs
local function GetPlayerPos()
  -- Get location info and format coordinates
  local zone = LMP:GetZoneAndSubzone(true, false, true)
  local x, y = GetMapPlayerPosition("player")
  xpos, ypos = GPS:LocalToGlobal(x, y)
  -- x = string.format("%05.2f", x*100)
  -- y = string.format("%05.2f", y*100)
  p(zone)
  p("X: " .. x)
  p("Y: " .. y)
  p("xpos: " .. xpos)
  p("ypos: " .. ypos)
  -- Add to chat input field so it's copyable
  -- StartChatInput(zone.." @ "..x.."/"..y)
  -- ZO_ChatWindowTextEntryEditBox:SelectAll();
end

-- Function for displaying window with the quest list
local function DisplayListUI(arg)
  if ListUI == nil then return end

  -- Default option
  if arg == "" or arg == nil then arg = QuestMap.settings.lastListArg end

  -- Get currently displayed zone and subzone from texture
  local zone = LMP:GetZoneAndSubzone(true, false, true)
  -- Update quest list for current zone if the zone changed

  zoneQuests = LQD:get_quest_list(zone)

  -- Init variables and custom function that will be changed depending on input argument
  local title = GetString(QUESTMAP_QUESTS) .. ": "
  local list = {}
  local addQuestToList = function() end

  -- Define variables and function depending on input argument
  if arg == "uncompleted" then
    title = title .. GetString(QUESTMAP_UNCOMPLETED)
    -- Check the completedQuests list and only add not matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and not LQD.completed_quests[quest[LQD.quest_map_pin_index.quest_id]] then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "completed" then
    title = title .. GetString(QUESTMAP_COMPLETED)
    -- Check the completedQuests list and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD.completed_quests[quest[LQD.quest_map_pin_index.quest_id]] then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "hidden" then
    title = title .. GetString(QUESTMAP_HIDDEN)
    -- Check the hiddenQuests list in the saved variables and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and QuestMap.settings.hiddenQuests[quest[LQD.quest_map_pin_index.quest_id]] then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "started" then
    title = title .. GetString(QUESTMAP_STARTED)
    -- Check the startedQuests list in the saved variables and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD.started_quests[quest[LQD.quest_map_pin_index.quest_id]] then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "guild" then
    title = title .. GetString(QUESTMAP_GUILD)
    -- Check the startedQuests list in the saved variables and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD:get_quest_repeat(quest[LQD.quest_map_pin_index.quest_id]) == 1 then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "daily" then
    title = title .. GetString(QUESTMAP_DAILY)
    -- Check the startedQuests list in the saved variables and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD:get_quest_repeat(quest[LQD.quest_map_pin_index.quest_id]) == 2 then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "weekly" then
    title = title .. GetString(QUESTMAP_WEEKLY)
    -- Check the startedQuests list in the saved variables and only add matching quests
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD:get_quest_repeat(quest[LQD.quest_map_pin_index.quest_id]) == 3 then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "cadwell" then
    title = title .. GetString(QUESTMAP_CADWELL)
    -- Check if quest is a cadwell's almanac quest and only add it if true
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      local isCadwellQuest = LQD:is_cadwell_quest(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and isCadwellQuest then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  elseif arg == "skill" then
    title = title .. GetString(QUESTMAP_SKILL)
    -- Check if quest is a skill quest and only add it if true
    addQuestToList = function(quest)
      local name = GetQuestName(quest[LQD.quest_map_pin_index.quest_id])
      if name ~= "" and LQD.quest_rewards_skilpoint[quest[LQD.quest_map_pin_index.quest_id]] then
        list[quest[LQD.quest_map_pin_index.quest_id]] = name
      end
    end

  else
    -- Do nothing when argument invalid
    return
  end

  -- Save argument so the next time the slash command can be used without argument
  QuestMap.settings.lastListArg = arg

  -- Add zone quests to list with the custom function
  for _, quest in ipairs(zoneQuests) do addQuestToList(quest) end

  -- Change title and add quest titles from list to window
  title = title .. " (" .. ZO_WorldMap_GetMapTitle() .. ")"
  WINDOW_MANAGER:GetControlByName(ListUI:GetName(), "Label"):SetText(title)
  ListUI:ClearText()
  for id, questName in pairs(list) do
    ListUI:AddText(questName)
  end

  ListUI:SetHidden(false)
end

-- Function to refresh pins
function QuestMap:RefreshPins()
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_COMPLETED)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_HIDDEN)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_STARTED)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_GUILD)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_DAILY)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_WEEKLY)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_CADWELL)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_COMPANION)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_SKILL)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_DUNGEON)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_HOLIDAY)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_ZONESTORY)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_PROLOGUE)
  LMP:RefreshPins(QuestMap.PIN_TYPE_QUEST_PLEDGES)
end

-- Callback function which is called every time another map is viewed, creates quest pins
--[[
ZO_NORMAL_TEXT
ZO_HIGHLIGHT_TEXT
ZO_HINT_TEXT
]]--
local function FormatQuestName(questName, questNameLayoutType)
  --QuestMap:dm("Debug", "FormatQuestName")
  --QuestMap:dm("Debug", questNameLayoutType)
  local layout = QuestMap.QUEST_NAME_LAYOUT[questNameLayoutType]
  --QuestMap:dm("Debug", layout)
  local color = layout.color
  --QuestMap:dm("Debug", color)
  local suffix = layout.suffix
  local color_def = QuestMap.settings["pin_tooltip_colors"][questNameLayoutType]
  color:SetRGBA(unpack(color_def))
  if QuestMap.settings.displaySuffix then
    return color:Colorize(string.format("%s %s", questName, suffix))
  else
    return color:Colorize(string.format("%s", questName))
  end
end

local lastMapTexture = ""
local function UpdateZoneQuestData()
  --QuestMap:dm("Debug", "UpdateZoneQuestData")
  -- Get quest list for that zone from database
  if LMD.mapTexture ~= lastMapTexture then
    QuestMap:dm("Warn", "UpdateZoneQuestData")
    lastMapTexture = LMD.mapTexture
    zoneQuests = LQD:get_quest_list(LMD.mapTexture)
  end
  -- QuestMap:dm("Debug", "Data Update Not Needed")
end

local function MapCallbackQuestPins(pinType)
  QuestMap:dm("Debug", "MapCallbackQuestPins: " .. pinType)
  local hidden_quest
  local quest_flag

  if LMD.isWorld then
    --QuestMap:dm("Debug", "Tamriel or Aurbis reached, stopped")
    return
  end

  if not zoneQuests then
    QuestMap:dm("Debug", "zoneQuests in not set")
    return
  end

  UpdateZoneQuestData()

  -- Loop over both quests and create a map pin with the quest name
  for key, quest in pairs(zoneQuests) do
    local questId = quest[LQD.quest_map_pin_index.quest_id]
    -- Get quest name and only continue if string isn't empty
    local name = GetQuestName(questId)
    --QuestMap:dm("Debug", name)
    if name ~= "" then
      if quest[LQD.quest_map_pin_index.global_x] ~= -10 then
        quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y] = GPS:GlobalToLocal(quest[LQD.quest_map_pin_index.global_x], quest[LQD.quest_map_pin_index.global_y])
      end

      -- assign Quest ID
      -- Collect all the information about the quest first
      LQD:set_achievement_quests(questId)

      if QuestMap.settings.hiddenQuests[questId] ~= nil then
        hidden_quest = true
      else
        hidden_quest = false
      end
      --QuestMap:dm("Debug", name)
      --QuestMap:dm("Debug", quest_type)

      -- With the data collected pass it all to assign_quest_flag. The result should be one flag only
      quest_flag = LQD:assign_quest_flag(questId, hidden_quest)

      local pinInfo = { id = questId } -- pinName is defined later

      if pinType == QuestMap.PIN_TYPE_QUEST_COMPLETED then
        -- and (not skill_quest or not cadwell_quest) when skill point and cadwell not active
        if quest_flag == LQD.flag_completed_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_COMPLETED) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_COMPLETED)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_COMPLETED)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_COMPLETED, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_HIDDEN then
        if quest_flag == LQD.flag_hidden_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_HIDDEN) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_HIDDEN)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_HIDDEN)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_HIDDEN, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_STARTED then
        if quest_flag == LQD.flag_started_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_STARTED) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_STARTED)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_STARTED)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_STARTED, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_GUILD then
        if quest_flag == LQD.flag_guild_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_GUILD) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_GUILD)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_GUILD)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_GUILD, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_DAILY then
        if quest_flag == LQD.flag_daily_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_DAILY) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_DAILY)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_DAILY)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_DAILY, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_WEEKLY then
        if quest_flag == LQD.flag_weekly_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_WEEKLY) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_WEEKLY)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_WEEKLY)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_WEEKLY, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_HOLIDAY then
        if quest_flag == LQD.flag_holiday_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_HOLIDAY) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_HOLIDAY)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_HOLIDAY)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_HOLIDAY, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_ZONESTORY then
        if quest_flag == LQD.flag_zone_story_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_ZONESTORY) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_ZONESTORY)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_ZONESTORY)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_ZONESTORY, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_SKILL then
        if quest_flag == LQD.flag_skill_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_SKILL) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_SKILL)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_SKILL)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_SKILL, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_CADWELL then
        if quest_flag == LQD.flag_cadwell_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_CADWELL) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_CADWELL)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_CADWELL)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_CADWELL, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_COMPANION then
        if quest_flag == LQD.flag_companion_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_COMPANION) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_COMPANION)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_COMPANION)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_COMPANION, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_DUNGEON then
        if quest_flag == LQD.flag_dungeon_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_DUNGEON) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_DUNGEON)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_DUNGEON)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_DUNGEON, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_PROLOGUE then
        if quest_flag == LQD.flag_type_prologue then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_PROLOGUE) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_PROLOGUE)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_PROLOGUE)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_PROLOGUE, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_PLEDGES then
        if quest_flag == LQD.flag_type_pledge then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_PLEDGES) then
            --QuestMap:dm("Debug", QuestMap.PIN_TYPE_QUEST_PLEDGES)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_PLEDGES)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_PLEDGES, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end

      if pinType == QuestMap.PIN_TYPE_QUEST_UNCOMPLETED then
        if quest_flag == LQD.flag_uncompleted_quest then
          if LMP:IsEnabled(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED) then
            --QuestMap:dm("Debug", "Drawing Uncompleted Pin"..name)
            pinInfo.pinName = FormatQuestName(name, QuestMap.PIN_TYPE_QUEST_UNCOMPLETED)
            LMP:CreatePin(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, pinInfo, quest[LQD.quest_map_pin_index.local_x], quest[LQD.quest_map_pin_index.local_y])
          end
        end
      end
      --[[
      ]]--

      --QuestMap:dm("Debug", "Next Quest")

    end
  end
  --QuestMap:dm("Debug", "End --------------------")
end

function QuestMap:refresh_specific_layout(name_layout_type, pin_size, pin_level, pin_texture)
  local color_def = QuestMap.settings["pin_colors"][name_layout_type]

  LMP:SetLayoutKey(name_layout_type, "size", pin_size)
  LMP:SetLayoutKey(name_layout_type, "level", pin_level)
  LMP:SetLayoutKey(name_layout_type, "texture", pin_texture)
  QuestMap.pin_color[name_layout_type]:SetRGBA(unpack(color_def))
  LMP:RefreshPins(name_layout_type)
end
-- Function to refresh pin appearance (e.g. from settings menu)
function QuestMap:RefreshPinLayout()
  --QuestMap:dm("Debug", "RefreshPinLayout")

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + PIN_PRIORITY_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_COMPLETED, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_HIDDEN, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_STARTED, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + PIN_PRIORITY_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_GUILD, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_DAILY, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_WEEKLY, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_SKILL, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.icon_sets[QuestMap.settings.skillPointIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_CADWELL, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.cadwell_icon_sets[QuestMap.settings.cadwellIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_COMPANION, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.companion_icon_sets[QuestMap.settings.companionIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_DUNGEON, QuestMap.settings.pinSize, QuestMap.settings.pinLevel, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_HOLIDAY, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_ZONESTORY, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.storyIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_PROLOGUE, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])

  QuestMap:refresh_specific_layout(QuestMap.PIN_TYPE_QUEST_PLEDGES, QuestMap.settings.pinSize, QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET, QuestMap.icon_sets[QuestMap.settings.normalIconSet])
end

-- Function to refresh pin filters (e.g. from settings menu)
function QuestMap:RefreshPinFilters()
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_COMPLETED, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_COMPLETED])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_HIDDEN, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_HIDDEN])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_STARTED, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_STARTED])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_GUILD, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_GUILD])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_DAILY, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_DAILY])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_WEEKLY, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_WEEKLY])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_SKILL, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_SKILL])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_CADWELL, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_CADWELL])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_COMPANION, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_COMPANION])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_DUNGEON, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_DUNGEON])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_HOLIDAY, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_HOLIDAY])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_ZONESTORY, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_ZONESTORY])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_PROLOGUE, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_PROLOGUE])
  LMP:SetEnabled(QuestMap.PIN_TYPE_QUEST_PLEDGES, QuestMap.settings.pinFilters[QuestMap.PIN_TYPE_QUEST_PLEDGES])
end

-- Function to (un)hide all quests on the currently displayed map
local function SetQuestsInZoneHidden(str)
  usage = GetString(QUESTMAP_SLASH_USAGE)
  if type(str) ~= "string" then return end
  if ZO_WorldMap:IsHidden() then
    p(GetString(QUESTMAP_SLASH_MAPINFO));
    return
  end

  -- Trim whitespaces from input string
  argument = str:gsub("^%s*(.-)%s*$", "%1")
  -- Convert string to lower case
  argument = str:lower()

  if str ~= "unhide" and str ~= "hide" then
    p(usage);
    return
  end

  -- Get quest list for that zone from database
  local questlist = LQD:get_quest_list(LMD.mapTexture)

  if str == "unhide" then
    for _, quest in ipairs(questlist) do
      -- Remove from list that holds hidden quests
      QuestMap.settings.hiddenQuests[quest[LQD.quest_map_pin_index.quest_id]] = nil
    end
    if QuestMap.settings.displayClickMsg then p(GetString(QUESTMAP_MSG_UNHIDDEN_P) .. " @ |cFFFFFF" .. LMP:GetZoneAndSubzone(true, false, true)) end
  elseif str == "hide" then
    for _, quest in ipairs(questlist) do
      -- Hiding only necessary for uncompleted quests
      if not LQD.completed_quests[quest[LQD.quest_map_pin_index.quest_id]] then
        -- Add to list that holds hidden quests
        QuestMap.settings.hiddenQuests[quest[LQD.quest_map_pin_index.quest_id]] = GetQuestName(quest.id)
      end
    end
    if QuestMap.settings.displayClickMsg then p(GetString(QUESTMAP_MSG_HIDDEN_P) .. " @ |cFFFFFF" .. LMP:GetZoneAndSubzone(true, false, true)) end
  else
    p(usage)
    return
  end
end

local function on_quest_added(eventCode, journalIndex, questName, objectiveName)
  -- Get names of started quests from quest journal, get quest ID from lookup table
  for i = 1, GetNumJournalQuests() do
    if IsValidQuestIndex(i) then
      local name = GetJournalQuestName(i)
      local ids = LQD:get_questids_table(name)
      if ids ~= nil then
        -- Add all IDs for that quest name to list
        for _, id in ipairs(ids) do
          QuestMap.settings.hiddenQuests[id] = nil
        end
      end
    end
  end
  QuestMap:RefreshPins()
end
EVENT_MANAGER:RegisterForEvent(QuestMap.idName, EVENT_QUEST_ADDED, on_quest_added)

local function on_quest_removed(eventCode)
  QuestMap:RefreshPins()
end
EVENT_MANAGER:RegisterForEvent(QuestMap.idName, EVENT_QUEST_REMOVED, on_quest_removed)

-- Event handler function for EVENT_ADD_ON_LOADED
local function OnLoad(eventCode, addOnName)
  if addOnName ~= QuestMap.idName then return end
  QuestMap:dm("Debug", "OnAddOnLoaded")

  -- Set up SavedVariables table
  QuestMap.settings = ZO_SavedVars:NewAccountWide("QuestMap_SavedVariables", 5, nil, QuestMap.settings_default)

  -- Get saved variables table for current user/char directly (without metatable), so it is possible to use pairs()
  local sv = QuestMap_SavedVariables.Default[GetDisplayName()]["$AccountWide"]
  -- Clean up saved variables (from previous versions)
  for key, val in pairs(sv) do
    -- Delete key-value pair if the key can't also be found in the default settings (except for version)
    if key ~= "version" and QuestMap.settings_default[key] == nil then
      sv[key] = nil
    end
  end

  -- Get tootip of each individual pin
  local pinTooltipCreator = {
    creator = function(pin)
      local pinTag = select(2, pin:GetPinTypeAndTag())
      if IsInGamepadPreferredMode() then
        local InformationTooltip = ZO_MapLocationTooltip_Gamepad
        local baseSection = InformationTooltip.tooltip
        InformationTooltip:LayoutIconStringLine(baseSection, nil, QuestMap.idName, baseSection:GetStyle("mapLocationTooltipContentHeader"))
        InformationTooltip:LayoutIconStringLine(baseSection, nil, pinTag.pinName, baseSection:GetStyle("mapLocationTooltipContentName"))
      else
        SetTooltipText(InformationTooltip, pinTag.pinName)
      end
    end,
  }

  local pinLayout = {
    [QuestMap.PIN_TYPE_QUEST_UNCOMPLETED] = {
      level = QuestMap.settings.pinLevel + PIN_PRIORITY_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED]
    },
    [QuestMap.PIN_TYPE_QUEST_COMPLETED] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_COMPLETED]
    },
    [QuestMap.PIN_TYPE_QUEST_HIDDEN] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HIDDEN]
    },
    [QuestMap.PIN_TYPE_QUEST_STARTED] = {
      level = QuestMap.settings.pinLevel + PIN_PRIORITY_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_STARTED]
    },
    [QuestMap.PIN_TYPE_QUEST_GUILD] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_GUILD]
    },
    [QuestMap.PIN_TYPE_QUEST_DAILY] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DAILY]
    },
    [QuestMap.PIN_TYPE_QUEST_WEEKLY] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_WEEKLY]
    },
    [QuestMap.PIN_TYPE_QUEST_CADWELL] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.cadwell_icon_sets[QuestMap.settings.cadwellIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_CADWELL]
    },
    [QuestMap.PIN_TYPE_QUEST_COMPANION] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.companion_icon_sets[QuestMap.settings.companionIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_COMPANION]
    },
    [QuestMap.PIN_TYPE_QUEST_SKILL] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.icon_sets[QuestMap.settings.skillPointIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_SKILL]
    },
    [QuestMap.PIN_TYPE_QUEST_DUNGEON] = {
      level = QuestMap.settings.pinLevel,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_DUNGEON]
    },
    [QuestMap.PIN_TYPE_QUEST_HOLIDAY] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_HOLIDAY]
    },
    [QuestMap.PIN_TYPE_QUEST_ZONESTORY] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.storyIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_ZONESTORY]
    },
    [QuestMap.PIN_TYPE_QUEST_PROLOGUE] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PROLOGUE]
    },
    [QuestMap.PIN_TYPE_QUEST_PLEDGES] = {
      level = QuestMap.settings.pinLevel + DAILY_REPEATABLE_PIN_OFFSET,
      texture = QuestMap.icon_sets[QuestMap.settings.normalIconSet],
      size = QuestMap.settings.pinSize,
      tint = QuestMap.pin_color[QuestMap.PIN_TYPE_QUEST_PLEDGES]
    },
  }

  -- Add new pin types for quests
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_COMPLETED, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_COMPLETED) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_COMPLETED], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_UNCOMPLETED], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_HIDDEN, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_HIDDEN) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_HIDDEN], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_STARTED, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_STARTED) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_STARTED], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_GUILD, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_GUILD) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_GUILD], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_DAILY, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_DAILY) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_DAILY], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_DUNGEON, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_DUNGEON) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_DUNGEON], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_HOLIDAY, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_HOLIDAY) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_HOLIDAY], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_WEEKLY, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_WEEKLY) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_WEEKLY], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_ZONESTORY, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_ZONESTORY) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_ZONESTORY], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_PROLOGUE, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_PROLOGUE) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_PROLOGUE], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_PLEDGES, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_PLEDGES) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_PLEDGES], pinTooltipCreator)

  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_CADWELL, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_CADWELL) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_CADWELL], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_COMPANION, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_COMPANION) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_COMPANION], pinTooltipCreator)
  LMP:AddPinType(QuestMap.PIN_TYPE_QUEST_SKILL, function() MapCallbackQuestPins(QuestMap.PIN_TYPE_QUEST_SKILL) end, nil, pinLayout[QuestMap.PIN_TYPE_QUEST_SKILL], pinTooltipCreator)

  -- Add map filters
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_UNCOMPLETED) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, QuestMap.PIN_TYPE_QUEST_UNCOMPLETED_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_COMPLETED, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_COMPLETED) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_COMPLETED, QuestMap.PIN_TYPE_QUEST_COMPLETED_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_HIDDEN, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_HIDDEN) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_HIDDEN, QuestMap.PIN_TYPE_QUEST_HIDDEN_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_STARTED, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_STARTED) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_STARTED, QuestMap.PIN_TYPE_QUEST_STARTED_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_GUILD, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_GUILD) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_GUILD, QuestMap.PIN_TYPE_QUEST_GUILD_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_DAILY, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_DAILY) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_DAILY, QuestMap.PIN_TYPE_QUEST_DAILY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_SKILL, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_SKILL) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_SKILL, QuestMap.PIN_TYPE_QUEST_SKILL_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_CADWELL, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_CADWELL) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_CADWELL, QuestMap.PIN_TYPE_QUEST_CADWELL_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_COMPANION, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_COMPANION) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_COMPANION, QuestMap.PIN_TYPE_QUEST_COMPANION_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_DUNGEON, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_DUNGEON) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_DUNGEON, QuestMap.PIN_TYPE_QUEST_HOLIDAY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_HOLIDAY, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_HOLIDAY) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_HOLIDAY, QuestMap.PIN_TYPE_QUEST_HOLIDAY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_WEEKLY, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_WEEKLY) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_WEEKLY, QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_ZONESTORY, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_ZONESTORY) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_ZONESTORY, QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_PROLOGUE, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_PROLOGUE) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_PROLOGUE, QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP)
  LMP:AddPinFilter(QuestMap.PIN_TYPE_QUEST_PLEDGES, GetString(QUESTMAP_QUESTS) .. " (" .. GetString(QUESTMAP_PLEDGES) .. ")", true, QuestMap.settings.pinFilters, QuestMap.PIN_TYPE_QUEST_PLEDGES, QuestMap.PIN_TYPE_QUEST_WEEKLY_PVP)

  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_CADWELL, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_CADWELL, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_CADWELL, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_COMPANION, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_COMPANION, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_COMPANION, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_SKILL, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_SKILL, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_SKILL, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_HOLIDAY, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_HOLIDAY, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_HOLIDAY, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_ZONESTORY, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_ZONESTORY, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_ZONESTORY, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_GUILD, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_GUILD, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_GUILD, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PROLOGUE, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PROLOGUE, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PROLOGUE, "battleground", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PLEDGES, "pvp", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PLEDGES, "imperialPvP", true)
  LMP:SetPinFilterHidden(QuestMap.PIN_TYPE_QUEST_PLEDGES, "battleground", true)

  QuestMap:RefreshPinFilters()
  QuestMap:RefreshPinLayout()

  -- Add click action for pins
  LMP:SetClickHandlers(QuestMap.PIN_TYPE_QUEST_UNCOMPLETED, { [1] = { name = function(pin) return zo_strformat(GetString(QUESTMAP_HIDE) .. " |cFFFFFF<<1>>|r", GetQuestName(pin.m_PinTag.id)) end,
                                                                      show = function(pin) return QuestMap.settings.displayHideQuest end,
                                                                      duplicates = function(pin1, pin2) return pin1.m_PinTag.id == pin2.m_PinTag.id end,
                                                                      callback = function(pin)
                                                                        -- Add to table which holds all the hidden quests
                                                                        QuestMap.settings.hiddenQuests[pin.m_PinTag.id] = GetQuestName(pin.m_PinTag.id)
                                                                        if QuestMap.settings.displayClickMsg then p(GetString(QUESTMAP_MSG_HIDDEN) .. ": |cFFFFFF" .. GetQuestName(pin.m_PinTag.id)) end
                                                                        QuestMap:RefreshPins()
                                                                      end } })
  LMP:SetClickHandlers(QuestMap.PIN_TYPE_QUEST_ZONESTORY, { [1] = { name = function(pin) return zo_strformat(GetString(QUESTMAP_HIDE) .. " |cFFFFFF<<1>>|r", GetQuestName(pin.m_PinTag.id)) end,
                                                                    show = function(pin) return QuestMap.settings.displayHideQuest end,
                                                                    duplicates = function(pin1, pin2) return pin1.m_PinTag.id == pin2.m_PinTag.id end,
                                                                    callback = function(pin)
                                                                      -- Add to table which holds all the hidden quests
                                                                      QuestMap.settings.hiddenQuests[pin.m_PinTag.id] = GetQuestName(pin.m_PinTag.id)
                                                                      if QuestMap.settings.displayClickMsg then p(GetString(QUESTMAP_MSG_HIDDEN) .. ": |cFFFFFF" .. GetQuestName(pin.m_PinTag.id)) end
                                                                      QuestMap:RefreshPins()
                                                                    end } })
  LMP:SetClickHandlers(QuestMap.PIN_TYPE_QUEST_HIDDEN, { [1] = { name = function(pin) return zo_strformat(GetString(QUESTMAP_UNHIDE) .. " |cFFFFFF<<1>>|r", GetQuestName(pin.m_PinTag.id)) end,
                                                                 show = function(pin) return QuestMap.settings.displayHideQuest end,
                                                                 duplicates = function(pin1, pin2) return pin1.m_PinTag.id == pin2.m_PinTag.id end,
                                                                 callback = function(pin)
                                                                   -- Remove from table which holds all the hidden quests
                                                                   QuestMap.settings.hiddenQuests[pin.m_PinTag.id] = nil
                                                                   if QuestMap.settings.displayClickMsg then p(GetString(QUESTMAP_MSG_UNHIDDEN) .. ": |cFFFFFF" .. GetQuestName(pin.m_PinTag.id)) end
                                                                   QuestMap:RefreshPins()
                                                                 end } })

  -- Register slash commands and link function
  SLASH_COMMANDS["/qm"] = function(str)
    SetQuestsInZoneHidden(str)
    QuestMap:RefreshPins()
    -- If the list window was open, update it too by running the function again without argument
    if ListUI ~= nil and not ListUI:IsHidden() then
      DisplayListUI()
    end
  end
  if LMW == nil then
    SLASH_COMMANDS["/qmlist"] = function()
      p("LibMsgWin-1.0 " .. GetString(QUESTMAP_LIB_REQUIRED))
    end
  else
    SLASH_COMMANDS["/qmlist"] = DisplayListUI
  end
  SLASH_COMMANDS["/qmgetpos"] = GetPlayerPos

  EVENT_MANAGER:UnregisterForEvent(QuestMap.idName, EVENT_ADD_ON_LOADED)
end
EVENT_MANAGER:RegisterForEvent(QuestMap.idName, EVENT_ADD_ON_LOADED, OnLoad)
