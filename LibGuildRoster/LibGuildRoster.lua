local LIB_ID = "LibGuildRoster"

assert(not _G[LIB_ID], LIB_ID .. " is already loaded")

local lib = ZO_CallbackObject:New()
_G[LIB_ID] = lib

--!! TESTING
-- local logger = LibDebugLogger(LIB_ID)
-- logger:SetEnabled(true)
--!! End TESTING

local SUPER_GRM_SetupEntry
local SUPER_GRM_BuildMasterList

-- --------------------
-- Private Methods
-- --------------------
local function getHeader( name )
  local guildRosterHeaders = ZO_GuildRoster:GetNamedChild("Headers")
  return guildRosterHeaders:GetNamedChild( name )
end

local function ArrangeColumnLayout()

  local width = lib.props.extended.roster_width
  local columnHiddenCount = 0

  for i, column in ipairs(lib._columns) do

    if (column.guildConditional and not column.approvedGuildMap[GUILD_ROSTER_MANAGER.guildId]) or column.isDisabled then

      column.headerControl:SetWidth(1)
      column.headerControl:SetAlpha(0)

      columnHiddenCount = columnHiddenCount + 1

      if i > 1 then
        column.headerControl:ClearAnchors()
        column.headerControl:SetAnchor(LEFT, getHeader(column.props.header.anchorKey), RIGHT, 0, 0)
      end

      for index = 1, ZO_GuildRosterListContents:GetNumChildren() do

        local row = ZO_GuildRosterListContents:GetChild(index)
        local cell = row:GetNamedChild(column.key)

        if cell then
          cell:SetWidth(1)
          cell:SetAlpha(0)
          cell:SetMouseEnabled(false)

          if i > 1 then
            cell:ClearAnchors()
            cell:SetAnchor(LEFT, row:GetNamedChild(column.props.row.anchorKey), RIGHT, 0, 0)
          end
        end

      end

      width = width - column.props.width

    else

      if column.guildConditional or not column.isDisabled then

        column.headerControl:SetWidth(column.props.width)
        column.headerControl:SetAlpha(1)

        if i > 1 then
          column.headerControl:ClearAnchors()
          column.headerControl:SetAnchor(LEFT, getHeader(column.props.header.anchorKey), RIGHT, column.props.offset.x, 0)
        end

        for index = ZO_GuildRosterListContents:GetNumChildren(),1,-1  do

          local row = ZO_GuildRosterListContents:GetChild(index)
          local cell = row:GetNamedChild(column.key)

          if cell then
            cell:SetWidth(column.props.width)
            cell:SetAlpha(1)

            if i > 1 then
              cell:ClearAnchors()
              cell:SetAnchor(LEFT, row:GetNamedChild(column.props.row.anchorKey), RIGHT, column.props.offset.x, 0)
            end

          end

        end

      end

    end

  end

  if width < lib.props.original.roster_width then
    width = lib.props.original.roster_width + 36
  end

  if columnHiddenCount == #lib._columns then
    width = lib.props.original.roster_width + 36
  end

  ZO_GuildRoster:SetWidth( width )

  local bg_width = (width) + (width/13)

  return width, bg_width

end

function lib:SetGuildBackground( extend )

  ZO_SharedRightBackgroundLeft:ClearAnchors()

  if extend then

    local _,BG_width = ArrangeColumnLayout()

    ZO_SharedRightBackgroundLeft:SetWidth(BG_width)
    ZO_SharedRightBackgroundLeft:SetAnchor(TOPRIGHT,ZO_SharedRightBackground,TOPRIGHT,45,self.props.original.BG_offsetY)

  else

    ZO_SharedRightBackgroundLeft:SetWidth(self.props.original.BG_width)
    ZO_SharedRightBackgroundLeft:SetAnchor(TOPLEFT,ZO_SharedRightBackground,TOPLEFT,self.props.original.BG_offsetX,self.props.original.BG_offsetY)

  end

end

function lib:OnRosterReady( callback )

  self._callbacks[#self._callbacks + 1] = callback

end

local Column = ZO_Object:Subclass()

function Column:New( settings )

    local obj = ZO_Object.New(self)

    obj.key = tostring(settings.key)
    obj.filterKey = string.lower(obj.key:gsub(' ',''))
    obj.isDisabled = settings.disabled or false

    obj.GetRowData = settings.row.data or false

    if not settings.header then
      settings.header = {
        align = TEXT_ALIGN_LEFT,
        title = settings.key,
        tooltip = false
      }
    end

    if settings.guildFilter and #settings.guildFilter >= 1 then
      obj.guildConditional = true
      obj.approvedGuildMap = {}

      for i = 1, #settings.guildFilter do
        obj.approvedGuildMap[settings.guildFilter[i]] = true
      end
    else
      obj.guildConditional = false
    end

    obj.props = {
      width = (settings.width or 100),
      offset = {
        x = 0,
        y = 0
      },
      header = {
        align = (settings.header.align or TEXT_ALIGN_LEFT),
        title = settings.header.title,
        tooltip = (settings.header.tooltip or false)
      },
      row = {
        align = (settings.row.align or TEXT_ALIGN_LEFT),
        mouseEnabled = (settings.row.mouseEnabled or false),
        OnMouseEnter = (settings.row.OnMouseEnter or false),
        OnMouseExit = (settings.row.OnMouseExit or false),
        format = (settings.row.format or false)
      },
      beforeList = (settings.beforeList or false),
      afterList = (settings.afterList or false)
    }

    return obj
end

local function setupZoHeading( index )

  local column = lib._columns[index]
  local keyName = column.key
  local filterKey = column.filterKey
  local headers = ZO_GuildRosterHeaders
  local columnHeading = CreateControlFromVirtual('ZO_GuildRosterHeaders'..keyName, headers, 'ZO_SortHeader')
  local anchorControl = headers:GetNamedChild('Level')
  local offsetX = 30
  
  column.props.offset.x = offsetX

  if index > 1 then
    anchorControl = headers:GetNamedChild(lib._columns[index-1].key)
    lib._columns[index].props.header.anchorKey = lib._columns[index-1].key
  else
    column.props.offset.x = 55
    offsetX = column.props.offset.x + 15
    column.props.header.anchorKey = 'Level'
  end

  columnHeading:SetDimensions(column.props.width, anchorControl:GetHeight())
  columnHeading:SetAnchor(LEFT, anchorControl, RIGHT, offsetX, 0)

  if column.props.header.tooltip then

    columnHeading.data = {
      tooltipText = column.props.header.tooltip
    }

    columnHeading:SetHandler('OnMouseEnter', ZO_Options_OnMouseEnter)
    columnHeading:SetHandler('OnMouseExit', ZO_Options_OnMouseExit)
    columnHeading:SetMouseEnabled(true)

  end

  ZO_SortHeader_Initialize(columnHeading, column.props.header.title, keyName, ZO_SORT_ORDER_DOWN, column.props.header.align, "ZoFontGameLargeBold")
  GUILD_ROSTER_KEYBOARD.sortHeaderGroup:AddHeader( columnHeading )

  local extendedRosterWidth = (column.props.width+column.props.offset.x) + ZO_GuildRoster:GetWidth()

  if index == 1 then
    extendedRosterWidth = extendedRosterWidth - 20
  end

  ZO_GuildRosterHideOffline:ClearAnchors()
  ZO_GuildRosterHideOffline:SetAnchor(RIGHT, ZO_GuildRosterSearch, LEFT, -120, 0)

  ZO_GuildRoster:SetWidth( extendedRosterWidth )

  lib.props.extended.roster_width = extendedRosterWidth
  lib.props.extended.BG_width = (extendedRosterWidth) + ((extendedRosterWidth) / 13)

  column.headerControl = columnHeading

  GUILD_ROSTER_ENTRY_SORT_KEYS[keyName] = {tiebreaker = "displayName"}

end

local function GetRawValue( column, data, i )

  if not data[column.key] then

    if column.GetRowData then
    
      data[column.key] = column.GetRowData( GUILD_ROSTER_MANAGER.guildId, data, i )
    
    elseif lib._bulkTasks[column.key] then
      
      data = lib._bulkTasks[column.key]( GUILD_ROSTER_MANAGER.guildId, data, i )

    end

  end

  return data

end

local function BuildMasterList(self)

  SUPER_GRM_BuildMasterList(self)

  local data

  for i = 1, #self.masterList do

    data = self.masterList[i]

    for index, column in ipairs(lib._columns) do

      if column.guildConditional then
        if column.approvedGuildMap[GUILD_ROSTER_MANAGER.guildId] then
          
          self.masterList[i] = GetRawValue( column, data, i )

        else
          data[column.key] = ''
        end
      else
        self.masterList[i] = GetRawValue( column, data, i )
      end

    end

  end

end

local function RenderRowCell( data, column, rowCell )

  local value = data[column.key]

  if column.props.row.format then
    value = column.props.row.format(value)
  end

  rowCell:SetText(value)

  if column.props.row.mouseEnabled then
    rowCell:SetMouseEnabled( column.props.row.mouseEnabled( GUILD_ROSTER_MANAGER.guildId, data, data[column.key]) )
  end

end

local function SetupEntry(self, control, data, selected)
    
    SUPER_GRM_SetupEntry(self, control, data, selected)

    local anchorControl = control:GetNamedChild("Level")

    if #lib._columns >= 1 then
      for i,column in ipairs(lib._columns) do

        if i > 1 then
          anchorControl = control:GetNamedChild(lib._columns[i-1].key)
          column.props.row.anchorKey = lib._columns[i-1].key
        else
          column.props.row.anchorKey = 'Level'
        end

        local rowCell = control:GetNamedChild(column.key)

        if not rowCell then

          local lastColumnHeight = anchorControl:GetHeight()

          rowCell = CreateControlFromVirtual(control:GetName() .. column.key, control, "ZO_KeyboardGuildRosterRowLabel")
          rowCell:SetDimensions(column.props.width, lastColumnHeight)
          rowCell:SetAnchor(LEFT, anchorControl, RIGHT, lib._columns[i].props.offset.x, 0)
          rowCell:SetHorizontalAlignment(lib._columns[i].props.row.align)
          rowCell:SetVerticalAlignment(TEXT_ALIGN_CENTER)
          rowCell:SetMouseEnabled(false)

          if control:GetName() == 'ZO_GuildRosterList1Row20' then
            ArrangeColumnLayout()
          end

          if column.props.row.OnMouseEnter then
            rowCell:SetHandler("OnMouseEnter", function(ctx) 

                local row = ctx:GetParent()
                local data = ZO_ScrollList_GetData(row)
                
                if data.hasCharacter then
                  column.props.row.OnMouseEnter( GUILD_ROSTER_MANAGER.guildId, data, ctx )
                end

                GUILD_ROSTER_KEYBOARD:EnterRow(row)

            end)
          end

          if column.props.row.OnMouseExit then
            rowCell:SetHandler("OnMouseExit", function(ctx) 

                local row = ctx:GetParent()
                local data = ZO_ScrollList_GetData(row)

                column.props.row.OnMouseExit( GUILD_ROSTER_MANAGER.guildId, data, ctx )

                GUILD_ROSTER_KEYBOARD:ExitRow(row)

            end)
          end

        end

        if data[column.key] and not column.isDisabled then

          if column.guildConditional and column.approvedGuildMap[GUILD_ROSTER_MANAGER.guildId] then

            RenderRowCell( data, column, rowCell )

          elseif not column.guildConditional then

            RenderRowCell( data, column, rowCell )

          end

        end

      end

    end

end

function lib:Initialize()
  
  self._activated = false
  self._columns = {}
  self._callbacks = {}
  self._bulkTasks = {}

  local _, _, _, _, originalBG_OffsetX, originalBG_OffsetY = ZO_SharedRightBackgroundLeft:GetAnchor()

  lib.props = {
    original = {
      BG_width = ZO_SharedRightBackgroundLeft:GetWidth(),
      BG_offsetY = originalBG_OffsetY,
      BG_offsetX = originalBG_OffsetX,
      roster_width = ZO_GuildRoster:GetWidth(),
    }
  }

  lib.props.extended = {}
  ZO_DeepTableCopy(lib.props.extended, lib.props.original)

end

function lib:addEvents()

    SUPER_GRM_SetupEntry = GUILD_ROSTER_MANAGER.SetupEntry
    SUPER_GRM_BuildMasterList = GUILD_ROSTER_MANAGER.BuildMasterList
    GUILD_ROSTER_MANAGER.SetupEntry = SetupEntry
    GUILD_ROSTER_MANAGER.BuildMasterList = BuildMasterList

    local tmp = _G['GUILD_ROSTER_MANAGER']['RefreshData']

    _G['GUILD_ROSTER_MANAGER']['RefreshData'] = function(...)

      for index, column in ipairs(lib._columns) do
        if column.props.beforeList then column.props.beforeList('new') end
      end

      tmp(...)

      for index, column in ipairs(lib._columns) do
        if column.props.afterList then column.props.afterList('new') end
      end

    end


    SCENE_MANAGER.scenes.guildRoster:RegisterCallback("StateChange", function(oldState, newState)

      if(newState == "showing" or newState == "shown") then

        lib:SetGuildBackground( true )

      elseif(newState == "hiding") then

        lib:SetGuildBackground( false )

      end

    end)

    ZO_PreHook(GUILD_ROSTER_MANAGER, "OnGuildIdChanged", function(self)

      lib:SetGuildBackground( SCENE_MANAGER.currentScene and SCENE_MANAGER.currentScene.name == 'guildRoster' )

    end)
    
    if SCENE_MANAGER.currentScene then

      lib:SetGuildBackground( SCENE_MANAGER.currentScene.name == 'guildRoster' )

    end

end

-- --------------------
-- Public Methods
-- --------------------
function lib:AddColumn( settings )

  local column = Column:New( settings )
  local index = #lib._columns + 1

  if settings.priority then
    table.insert(lib._columns, settings.priority, column)
  else
    lib._columns[index] = column
  end
  
  return column

end

function lib:Refresh()

  GUILD_ROSTER_MANAGER:RefreshData()

end

function lib:SetBulkData( manifest, callback )

  for i = 1, #manifest do
    
    lib._bulkTasks[manifest[i].key] = callback
  
  end

end

function Column:SetGuildFilter( manifest )

  if manifest and #manifest >= 1 then

    self.guildConditional = true
    self.approvedGuildMap = {}

    for i = 1, #manifest do
      self.approvedGuildMap[manifest[i]] = true
    end

  else

    self.guildConditional = false
    self.approvedGuildMap = {}

  end

end

function Column:UpdateRowData( callback )

  self.GetRowData = callback

end

function Column:GetHeader()

  return self.headerControl

end

function Column:IsDisabled( value )

  self.isDisabled = value

end
-- --------------------
-- Event Callbacks
-- --------------------
local function LGR_OnPlayerActivated( eventCode )

  zo_callLater(function()

    if #lib._columns > 0 then  
      if not lib._activated then
        lib:addEvents()
        lib._activated = true
      end

      for i = 1, #lib._columns do
        setupZoHeading( i )
      end

      GUILD_ROSTER_MANAGER:RefreshData()

      for i = 1, #lib._callbacks do
        lib._callbacks[i]()
      end

    end

  end,1000)

  EVENT_MANAGER:UnregisterForEvent(LIB_ID, eventCode)

end

local function LGR_OnAddOnLoaded( eventCode, addOnName )
  
  if addOnName == LIB_ID then

    lib:Initialize()

    EVENT_MANAGER:RegisterForEvent(LIB_ID, EVENT_PLAYER_ACTIVATED, LGR_OnPlayerActivated)
    EVENT_MANAGER:UnregisterForEvent(LIB_ID, eventCode)
  end
end
-- --------------------
-- Attach Listeners
-- --------------------
EVENT_MANAGER:RegisterForEvent(LIB_ID, EVENT_ADD_ON_LOADED, LGR_OnAddOnLoaded)