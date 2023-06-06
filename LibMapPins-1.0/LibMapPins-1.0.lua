-------------------------------------------------------------------------------
-- LibMapPins-1.0
-------------------------------------------------------------------------------
--
-- Copyright (c) 2014, 2015 Ales Machat (Garkin)
--
-- Permission is hereby granted, free of charge, to any person
-- obtaining a copy of this software and associated documentation
-- files (the "Software"), to deal in the Software without
-- restriction, including without limitation the rights to use,
-- copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-- OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.
--
-------------------------------------------------------------------------------
local lib = {}

lib.name = "LibMapPins-1.0"
lib.version = 10038
lib.filters = {}
lib.pinManager = ZO_WorldMap_GetPinManager()

local function GetPinTypeId(pinType)
    local pinTypeId
    if type(pinType) == "string" then
        pinTypeId = _G[pinType]
    elseif type(pinType) == "number" then
        pinTypeId = pinType
    end
    return pinTypeId
end

local function GetPinTypeIdAndString(pinType)
    local pinTypeString, pinTypeId
    if type(pinType) == "string" then
        pinTypeString = pinType
        pinTypeId = _G[pinType]
    elseif type(pinType) == "number" then
        pinTypeId = pinType
        local pinData = lib.pinManager.customPins[pinTypeId]
        pinTypeString = pinData and pinData.pinTypeString or nil
    end
    return pinTypeId, pinTypeString
end

-------------------------------------------------------------------------------
-- Library Functions ----------------------------------------------------------
-------------------------------------------------------------------------------
-- Arguments used by most of the functions:
--
-- pinType:       either pinTypeId or pinTypeString, you can use both
-- pinTypeString: unique string name of your choice (it will be used as a name
--                for global variable)
-- pinTypeId:     unique number code for your pin type, return value from lib:AddPinType
--                ( local pinTypeId = _G[pinTypeString] )
-- pinLayoutData: table which can contain the following keys:
--    level =     number > 2, pins with higher level are drawn on the top of pins
--                with lower level.
--                Examples: Points of interest 50, quests 110, group members 130,
--                wayshrine 140, player 160.
--    texture =   string of function(pin). Function can return just one texture
--                or overlay, pulse and glow textures.
--    size =      texture will be resized to size*size, if not specified size is 20.
--    tint  =     ZO_ColorDef object or function(pin) which returns this object.
--                If defined, color of background texture is set to this color.
--    grayscale = true/false, could be function(pin). If defined and not false,
--                background texure will be converted to grayscale (https://en.wikipedia.org/wiki/Colorfulness)
--    insetX =    size of transparent texture border, used to handle mouse clicks
--    insetY =    dtto
--    minSize =   if not specified, default value is 18
--    minAreaSize = used for area pins
--    showsPinAndArea = true/false
--    isAnimated = true/false
--
-------------------------------------------------------------------------------
-- lib:AddPinType(pinTypeString, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
-------------------------------------------------------------------------------
-- Adds custom pin type
-- returns: pinTypeId
--
-- pinTypeString: string
-- pinTypeAddCallback: function(pinManager), will be called every time when map
--                is changed. It should create pins on the current map using the
--                lib:CreatePin(...) function.
-- pinTypeOnResizeCallback: (nilable) function(pinManager, mapWidth, mapHeight),
--                is called when map is resized (zoomed).
-- pinLayoutData:  (nilable) table, details above
-- pinTooltipCreator: (nilable) etiher string to display or table with the
--                following keys:
--    creator =   function(pin) that creates tooltip - or I should say function
--                that will be called when mouse is over the pin, it does not
--                need to create tooltip.
--    tooltip =   (nilable) tooltip mode,  number between 1 and 4. It is
--                defined in mappin.lua as follows:
--                ZO_MAP_TOOLTIP_MODE =
--                {
--                    INFORMATION = 1,
--                    KEEP = 2,
--                    MAP_LOCATION = 3,
--                }
--    hasTooltip = (optional), function(pin) which returns true/false to
--                enable/disable tooltip.
--    gamepadCategory = (nilable) string
--    gamepadCategoryId = (nilable) number, right now it uses one of:
--                local GAMEPAD_PIN_ORDERS = {
--                   DESTINATIONS = 10,
--                   AVA_KEEP = 20,
--                   AVA_OUTPOST = 21,
--                   AVA_RESOURCE = 22,
--                   AVA_GATE = 23,
--                   AVA_ARTIFACT = 24,
--                   AVA_IMPERIAL_CITY = 25,
--                   AVA_FORWARD_CAMP = 26,
--                   CRAFTING = 30,
--                   QUESTS = 40,
--                   PLAYERS = 50,
--                }
--    gamepadCategoryIcon = (nilable) texture path
--    gamepadEntryName = (nilable) string
--    gamepadSpacing = (nilable) boolean
--
-------------------------------------------------------------------------------
function lib:AddPinType(pinTypeString, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
    assert(type(pinTypeString) == "string", "Parameter pinTypeString is not a string.")
    assert(not _G[pinTypeString], "Parameter pinTypeString: " .. pinTypeString .. " already exists.")
    assert(type(pinTypeAddCallback) == "function", "Parameter pinTypeAddCallback is not a function.")

    if pinLayoutData == nil then
        pinLayoutData = { level = 40, texture = "EsoUI/Art/Inventory/newitem_icon.dds" }
    end

    if type(pinTooltipCreator) == "string" then
        local text = pinTooltipCreator
        pinTooltipCreator = {
            creator = function(pin)
                if IsInGamepadPreferredMode() then
                    local InformationTooltip = ZO_MapLocationTooltip_Gamepad
                    local baseSection = InformationTooltip.tooltip
                    InformationTooltip:LayoutIconStringLine(baseSection, nil, text, baseSection:GetStyle("mapLocationTooltipContentName"))
                else
                    SetTooltipText(InformationTooltip, text)
                end
            end,
            tooltip = ZO_MAP_TOOLTIP_MODE.INFORMATION,
        }
    elseif type(pinTooltipCreator) == "table" then
        if type(pinTooltipCreator.tooltip) ~= "number" then
            pinTooltipCreator.tooltip = ZO_MAP_TOOLTIP_MODE.INFORMATION
        end
    elseif pinTooltipCreator ~= nil then
        return
    end

    if type(pinLayoutData.color) == "table" then
        if pinLayoutData.tint == nil or pinLayoutData.tint.UnpackRGBA == nil then
            pinLayoutData.tint = ZO_ColorDef:New(unpack(pinLayoutData.color))
        end
    end

    self.pinManager:AddCustomPin(pinTypeString, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
    local pinTypeId = _G[pinTypeString]
    self.pinManager:SetCustomPinEnabled(pinTypeId, true)
    self.pinManager:RefreshCustomPins(pinTypeId)

    return pinTypeId
end

-------------------------------------------------------------------------------
-- lib:CreatePin(pinType, pinTag, locX, locY, areaRadius)
-------------------------------------------------------------------------------
-- create single pin on the current map, primary use is from pinTypeAddCallback
--
-- pinType:       pinTypeId or pinTypeString
-- pinTag:        can be anything, but I recommend using table or string with
--                additional pin details. You can use it later in code.
--                ( local pinTypeId, pinTag = pin:GetPinTypeAndTag() )
--                Argument pinTag is used as an id for functions
--                lib:RemoveCustomPin(...) and lib:FindCustomPin(...).
-- locX, locY:    normalized position on the current map
-- areaRadius:    (nilable)
-------------------------------------------------------------------------------
function lib:CreatePin(pinType, pinTag, locX, locY, areaRadius)
    if pinTag == nil or type(locX) ~= "number" or type(locY) ~= "number" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        local pinData = self.pinManager.customPins[pinTypeId]
        if pinData then
            local isEnabled = self:IsEnabled(pinTypeId)
            if isEnabled then
                self.pinManager:CreatePin(pinTypeId, pinTag, locX, locY, areaRadius)
            end
        end
    end
end

-------------------------------------------------------------------------------
-- lib:GetLayoutData(pinType)
-------------------------------------------------------------------------------
-- Gets reference to pinLayoutData table
-- returns: pinLayoutData
--
-- pinType:       pinTypeId or pinTypeString
-------------------------------------------------------------------------------
function lib:GetLayoutData(pinType)
    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        return ZO_MapPin.PIN_DATA[pinTypeId]
    end
end

-------------------------------------------------------------------------------
-- lib:GetLayoutKey(pinType, key)
-------------------------------------------------------------------------------
-- Gets a single key from pinLayoutData table
-- returns: pinLayoutData[key]
--
-- pinType:       pinTypeId or pinTypeString
-- key:           key name in pinLayoutData table
-------------------------------------------------------------------------------
function lib:GetLayoutKey(pinType, key)
    if type(key) ~= "string" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId and ZO_MapPin.PIN_DATA[pinTypeId] then
        return ZO_MapPin.PIN_DATA[pinTypeId][key]
    end
end

-------------------------------------------------------------------------------
-- lib:SetLayoutData(pinType, pinLayoutData)
-------------------------------------------------------------------------------
-- Replace whole pinLayoutData table
--
-- pinType:       pinTypeId or pinTypeString
-- pinLayoutData: table
-------------------------------------------------------------------------------
function lib:SetLayoutData(pinType, pinLayoutData)
    if type(pinLayoutData) ~= "table" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        pinLayoutData.level = pinLayoutData.level or 30
        pinLayoutData.texture = pinLayoutData.texture or "EsoUI/Art/Inventory/newitem_icon.dds"

        ZO_MapPin.PIN_DATA[pinTypeId] = {}
        for k,v in pairs(pinLayoutData) do
            ZO_MapPin.PIN_DATA[pinTypeId][k] = v
        end
    end
end

-------------------------------------------------------------------------------
-- lib:SetLayoutKey(pinType, key, data)
-------------------------------------------------------------------------------
-- change a single key in the pinLayoutData table
--
-- pinType:       pinTypeId or pinTypeString
-- key:           key name in pinLayoutData table
-- data:          data to be stored in pinLayoutData[key]
-------------------------------------------------------------------------------
function lib:SetLayoutKey(pinType, key, data)
    if type(key) ~= "string" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        ZO_MapPin.PIN_DATA[pinTypeId][key] = data
    end
end

-------------------------------------------------------------------------------
-- lib:SetClickHandlers(pinType, LMB_handler, RMB_handler)
-------------------------------------------------------------------------------
-- Adds click handlers for pins of given pinType, if handler is nil, any existing
-- handler will be removed.
--
-- pinType:       pinTypeId or pinTypeString
--
-- LMB_handler:   hadler for left mouse button
-- RMB_handler:   handler for right mouse button
--
-- handler = {
--    {
--       name        = string or function(pin) end --required
--       gamepadName = string or function(pin) end --required
--       callback    = function(pin) end           --required
--       show        = function(pin) end, (optional) default is true. Callback function
--                is called only when show returns true.
--       duplicates  = function(pin1, pin2) end, (optional) default is true.
--                What happens when mouse click hits more than one pin. If true,
--                pins are considered to be duplicates and just one callback
--                function is called.
--    },
-- }
-- One handler can have defined more actions, with different conditions in show
-- function. First action with true result from show function will be used.
-- handler = {
--    {name = "name1", callback = callback1, show = show1},
--    {name = "name2", callback = callback2, show = show2},
--     ...
-- }
-------------------------------------------------------------------------------
function lib:SetClickHandlers(pinType, LMB_handler, RMB_handler)
    local pinTypeId = GetPinTypeId(pinType)
    if LMB_handler and not LMB_handler.gamepadName then
      LMB_handler.gamepadName = LMB_handler.name
    end
    if RMB_handler and not RMB_handler.gamepadName then
      RMB_handler.gamepadName = RMB_handler.name
    end
    if pinTypeId then
        if type(LMB_handler) == "table" or LMB_handler == nil then
            ZO_MapPin.PIN_CLICK_HANDLERS[MOUSE_BUTTON_INDEX_LEFT][pinTypeId] = LMB_handler
        end
        if type(RMB_handler) == "table" or RMB_handler == nil then
            ZO_MapPin.PIN_CLICK_HANDLERS[MOUSE_BUTTON_INDEX_RIGHT][pinTypeId] = RMB_handler
        end
    end
end

-------------------------------------------------------------------------------
-- lib:RefreshPins(pinType)
-------------------------------------------------------------------------------
-- Refreshes pins. If pinType is nil, refreshes all custom pins
--
-- pinType:       pinTypeId or pinTypeString
-------------------------------------------------------------------------------
function lib:RefreshPins(pinType)
    local pinTypeId = GetPinTypeId(pinType)
    self.pinManager:RefreshCustomPins(pinTypeId)
end

-------------------------------------------------------------------------------
-- lib:RemoveCustomPin(pinType, pinTag)
-------------------------------------------------------------------------------
-- Removes custom pin. If pinTag is nil, all pins of the given pinType are removed.
--
-- pinType:       pinTypeId or pinTypeString
-- pinTag:        id assigned to the pin by function lib:CreatePin(...)
-------------------------------------------------------------------------------
function lib:RemoveCustomPin(pinType, pinTag)
    local pinTypeId, pinTypeString = GetPinTypeIdAndString(pinType)
    if pinTypeId and pinTypeString then
        self.pinManager:RemovePins(pinTypeString, pinTypeId, pinTag)
    end
end

-------------------------------------------------------------------------------
-- lib:FindCustomPin(pinType, pinTag)
-------------------------------------------------------------------------------
-- Returns pin.
--
-- pinType:       pinTypeId or pinTypeString
-- pinTag:        id assigned to the pin by function lib:CreatePin(...)
-------------------------------------------------------------------------------
function lib:FindCustomPin(pinType, pinTag)
    if pinTag == nil then return end

    local pinTypeId, pinTypeString = GetPinTypeIdAndString(pinType)
    if pinTypeId and pinTypeString then
        return self.pinManager:FindPin(pinTypeString, pinTypeId, pinTag)
    end
end

-------------------------------------------------------------------------------
-- lib:SetAddCallback(pinType, pinTypeAddCallback)
-------------------------------------------------------------------------------
-- Set add callback
--
-- pinType:       pinTypeId or pinTypeString
-- pinTypeAddCallback: function(pinManager)
-------------------------------------------------------------------------------
function lib:SetAddCallback(pinType, pinTypeAddCallback)
    if type(pinTypeAddCallback) ~= "function" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        self.pinManager.customPins[pinTypeId].layoutCallback = pinTypeAddCallback
    end
end

-------------------------------------------------------------------------------
-- lib:SetResizeCallback(pinType, pinTypeOnResizeCallback)
-------------------------------------------------------------------------------
-- Set OnResize callback
--
-- pinType:       pinTypeId or pinTypeString
-- pinTypeOnResizeCallback: function(pinManager, mapWidth, mapHeight)
-------------------------------------------------------------------------------
function lib:SetResizeCallback(pinType, pinTypeOnResizeCallback)
    if type(pinTypeOnResizeCallback) ~= "function" then return end

    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        self.pinManager.customPins[pinTypeId].resizeCallback = pinTypeOnResizeCallback
    end
end

-------------------------------------------------------------------------------
-- lib:IsEnabled(pinType)
-------------------------------------------------------------------------------
-- Checks if pins are enabled
-- returns: true/false
--
-- pinType:       pinTypeId or pinTypeString
-------------------------------------------------------------------------------
function lib:IsEnabled(pinType)
    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId then
        return self.pinManager:IsCustomPinEnabled(pinTypeId)
    end
end

-------------------------------------------------------------------------------
-- lib:SetEnabled(pinType, state)
-------------------------------------------------------------------------------
-- Set enabled/disabled state of the given pinType. It will also update state
-- of world map filter checkbox.
--
-- pinType:       pinTypeId or pinTypeString
-- state:         true/false, as false is considered nil, false or 0. All other
--                values are true.
-------------------------------------------------------------------------------
function lib:SetEnabled(pinType, state)
    local pinTypeId = GetPinTypeId(pinType)
    if pinTypeId == nil then return end

    local enabled
    if type(state) == "number" then
        enabled = state ~= 0
    else
        enabled = state and true or false
    end

    local needsRefresh = self.pinManager:IsCustomPinEnabled(pinTypeId) ~= enabled
    local filter = self.filters[pinTypeId]
    if filter then
        local mapFilterType = GetMapFilterType()
        if mapFilterType == MAP_FILTER_TYPE_STANDARD then
            ZO_CheckButton_SetCheckState(filter.pve, enabled)
        elseif mapFilterType == MAP_FILTER_TYPE_AVA_CYRODIIL then
            ZO_CheckButton_SetCheckState(filter.pvp, enabled)
        elseif mapFilterType == MAP_FILTER_TYPE_AVA_IMPERIAL then
            ZO_CheckButton_SetCheckState(filter.imperialPvP, enabled)
        elseif mapFilterType == MAP_FILTER_TYPE_BATTLEGROUND then
            ZO_CheckButton_SetCheckState(filter.battleground, enabled)
        end
    end

    self.pinManager:SetCustomPinEnabled(pinTypeId, enabled)

    if needsRefresh then
        self:RefreshPins(pinType)
    end
end

-------------------------------------------------------------------------------
-- lib:Enable(pinType)
-------------------------------------------------------------------------------
-- Enables pins of the given pinType
--
-- pinType:       pinTypeId or pinTypeString
-------------------------------------------------------------------------------
function lib:Enable(pinType)
    self:SetEnabled(pinType, true)
end

-------------------------------------------------------------------------------
-- lib:Disable(pinType)
-------------------------------------------------------------------------------
-- Disables pins of the given pinType
--
-- pinType:       pinTypeId or pinTypeString
-------------------------------------------------------------------------------
function lib:Disable(pinType)
    self:SetEnabled(pinType, false)
end

-------------------------------------------------------------------------------
-- lib:AddPinFilter(pinType, pinCheckboxText, separate, savedVars, savedVarsPveKey, savedVarsPvpKey, savedVarsImperialPvpKey)
-------------------------------------------------------------------------------
-- Adds filter checkboxes to the world map.
-- Returns: pveCheckbox, pvpCheckbox
-- (newly created checkbox controls for PvE and PvP context of the world map)
--
-- pinType:       pinTypeId or pinTypeString
-- pinCheckboxText: (nilable), description displayed next to the checkbox, if nil
--                pinCheckboxText = pinTypeString
-- separate:      (nilable), if false or nil, checkboxes for PvE and PvP context
--                will be linked together. If savedVars argument is nil, separate
--                is ignored and checkboxes will be linked together.
-- savedVars:     (nilable), table where you store filter settings
-- savedVarsPveKey: (nilable), key in the savedVars table where you store filter
--                state for PvE context. If savedVars table exists but this key
--                is nil, state will be stored in savedVars[pinTypeString].
-- savedVarsPvpKey: (nilable), key in the savedVars table where you store filter
--                state for PvP context, used only if separate is true. If separate
--                is true, savedVars exists but this argument is nil, state will
--                be stored in savedVars[pinTypeString .. "_pvp"].
-- savedVarsImperialPvpKey: (nilable), key in the savedVars table where you store
--                filter state for Imperial City PvP context, used only if separate
--                is true. If separate is true, savedVars exists but this argument
--                is nil, state will be stored in savedVars[pinTypeString .. "_imperialPvP"].
-- savedVarsBattlegroundKey: (nilable), key in the savedVars table where you store
--                filter state for Battleground PvP context, used only if separate
--                is true. If separate is true, savedVars exists but this argument
--                is nil, state will be stored in savedVars[pinTypeString .. "_battleground"].
-------------------------------------------------------------------------------
function lib:AddPinFilter(pinType, pinCheckboxText, separate, savedVars, savedVarsPveKey, savedVarsPvpKey, savedVarsImperialPvpKey, savedVarsBattlegroundKey)
    local pinTypeId, pinTypeString = GetPinTypeIdAndString(pinType)

    if pinTypeId == nil or self.filters[pinTypeId] then return end

    self.filters[pinTypeId] = {}
    local filter = self.filters[pinTypeId]

    if type(savedVars) == "table" then
        filter.vars = savedVars
        filter.pveKey = savedVarsPveKey or pinTypeString
        if separate then
            filter.pvpKey = savedVarsPvpKey or pinTypeString .. "_pvp"
            filter.imperialPvPKey = savedVarsImperialPvpKey or pinTypeString .. "_imperialPvP"
            filter.battlegroundKey = savedVarsBattlegroundKey or pinTypeString .. "_battleground"
        else
            filter.pvpKey = filter.pveKey
            filter.imperialPvPKey = filter.pveKey
            filter.battlegroundKey = filter.pveKey
        end
    end

    if type(pinCheckboxText) ~= "string" then
        pinCheckboxText = pinTypeString
    end

    local function AddCheckbox(panel, pinCheckboxText)
        local checkbox = panel.checkBoxPool:AcquireObject()
        ZO_CheckButton_SetLabelText(checkbox, pinCheckboxText)
        panel:AnchorControl(checkbox)
        return checkbox
    end

    filter.pve = AddCheckbox(WORLD_MAP_FILTERS.pvePanel, pinCheckboxText)
    filter.pvp = AddCheckbox(WORLD_MAP_FILTERS.pvpPanel, pinCheckboxText)
    filter.imperialPvP = AddCheckbox(WORLD_MAP_FILTERS.imperialPvPPanel, pinCheckboxText)
    filter.battleground = AddCheckbox(WORLD_MAP_FILTERS.battlegroundPanel, pinCheckboxText)

    if filter.vars ~= nil then
        ZO_CheckButton_SetToggleFunction(filter.pve,
            function(button, state)
                filter.vars[filter.pveKey] = state
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetToggleFunction(filter.pvp,
            function(button, state)
                filter.vars[filter.pvpKey] = state
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetToggleFunction(filter.imperialPvP,
            function(button, state)
                filter.vars[filter.imperialPvPKey] = state
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetToggleFunction(filter.battleground,
            function(button, state)
                filter.vars[filter.battlegroundKey] = state
                self:SetEnabled(pinTypeId, state)
            end)

        local mapFilterType = GetMapFilterType()
        if mapFilterType == MAP_FILTER_TYPE_STANDARD then
            self:SetEnabled(pinTypeId, filter.vars[filter.pveKey])
        elseif mapFilterType == MAP_FILTER_TYPE_AVA_CYRODIIL then
            self:SetEnabled(pinTypeId, filter.vars[filter.pvpKey])
        elseif mapFilterType == MAP_FILTER_TYPE_AVA_IMPERIAL then
            self:SetEnabled(pinTypeId, filter.vars[filter.imperialPvPKey])
        elseif mapFilterType == MAP_FILTER_TYPE_BATTLEGROUND then
            self:SetEnabled(pinTypeId, filter.vars[filter.battlegroundKey])
        end
    else
        ZO_CheckButton_SetToggleFunction(filter.pve,
            function(button, state)
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetCheckState(filter.pve, self:IsEnabled(pinTypeId))
        ZO_CheckButton_SetToggleFunction(filter.pvp,
            function(button, state)
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetCheckState(filter.pvp, self:IsEnabled(pinTypeId))
        ZO_CheckButton_SetToggleFunction(filter.imperialPvP,
            function(button, state)
                self:SetEnabled(pinTypeId, state)
            end)
        ZO_CheckButton_SetCheckState(filter.imperialPvP, self:IsEnabled(pinTypeId))
    end

    return filter.pve, filter.pvp, filter.imperialPvP, filter.battleground
end

-------------------------------------------------------------------------------
-- lib:AddPinFilter(pinType, context, hidden)
-------------------------------------------------------------------------------
-- Shows or hides the map filter checkbox for the given context
--
-- pinType:     pinTypeId or pinTypeString
-- context:     which instance of the filter: "pve", "pvp", "imperialPvP" or "battleground"
-- hidden:      true for hiding the filter, false for showing it
-------------------------------------------------------------------------------
function lib:SetPinFilterHidden(pinType, context, hidden)
    local pinTypeId, pinTypeString = GetPinTypeIdAndString(pinType)

	if pinTypeId and self.filters[pinTypeId] then
		local control = self.filters[pinTypeId][context]
		if control and control:IsControlHidden() ~= hidden then
			control:SetHidden(hidden)
			local _, point, relativeTo, relativePoint, offsetX, offsetY, restrain = control:GetAnchor(0)
			if hidden then
				control.oldOffsetY = offsetY
				offsetY = control:GetHeight() * -1
			else
				offsetY = control.oldOffsetY
			end
			control:ClearAnchors()
			control:SetAnchor(point, relativeTo, relativePoint, offsetX, offsetY, restrain)
		end
	end
end

-------------------------------------------------------------------------------
-- lib:GetZoneAndSubzone(alternative, bStripUIMap, bKeepMapNum)
-------------------------------------------------------------------------------
-- Returns zone and subzone derived from map texture.

-- You can select from 2 formats:
-- 1: "zone", "subzone"                     (that's what I use in my addons)
-- 2: "zone/subzone"                        (used by HarvestMap)
-- If 2nd argument is nil or false, function returns first format

-- Additionally if the third argument bKeepMapNBum is true you will preserve
-- the ending of the map texture.
-- 3: "zone/subzone_0" or "zone", "subzone_0" (used by Destinations)
-------------------------------------------------------------------------------
--[[ changed to cover these situations
    Reference https://wiki.esoui.com/Texture_List/ESO/art/maps

   "/art/maps/southernelsweyr/els_dragonguard_island05_base_8.dds",
   "/art/maps/murkmire/tsofeercavern01_1.dds",
   "/art/maps/housing/blackreachcrypts.base_0.dds",
   "/art/maps/housing/blackreachcrypts.base_1.dds",
   "Art/maps/skyrim/blackreach_base_0.dds",
   "Textures/maps/summerset/alinor_base.dds",
   "art/maps/murkmire/ui_map_tsofeercavern01_0.dds",
   "art/maps/elsweyr/jodesembrace1.base_0.dds",
]]--

local function mysplit(inputstr)
    local t = {}
    for str in string.gmatch(inputstr, "([^%/]+)") do
        table.insert(t, str)
    end
    return t
end

function lib:GetZoneAndSubzone(alternative, bStripUIMap, bKeepMapNum)
    local mapTexture = GetMapTileTexture():lower()
    mapTexture = mapTexture:gsub("^.*/maps/", "")
    if bStripUIMap == true then
        mapTexture = mapTexture:gsub("ui_map_", "")
    end
    mapTexture = mapTexture:gsub("%.dds$", "")
    if not bKeepMapNum then
        mapTexture = mapTexture:gsub("%d*$", "")
        mapTexture = mapTexture:gsub("_+$", "")
    end

    if alternative then
        return mapTexture
    end

    return unpack(mysplit(mapTexture))
end


-------------------------------------------------------------------------------
-- Callbacks ------------------------------------------------------------------
-------------------------------------------------------------------------------
--refresh checkbox state for world map filters
function lib.OnMapChanged()
    local context
    local mapFilterType = GetMapFilterType()
    if mapFilterType == MAP_FILTER_TYPE_STANDARD then
        context = "pve"
    elseif mapFilterType == MAP_FILTER_TYPE_AVA_CYRODIIL then
        context = "pvp"
    elseif mapFilterType == MAP_FILTER_TYPE_AVA_IMPERIAL then
        context = "imperialPvP"
    elseif mapFilterType == MAP_FILTER_TYPE_BATTLEGROUND then
        context = "battleground"
    end

    if lib.context ~= context then
        lib.context = context
        local filterKey = context .. "Key"
        for pinTypeId, filter in pairs(lib.filters) do
            if filter.vars then
                local state = filter.vars[filter[filterKey]]
                lib:SetEnabled(pinTypeId, state)
            else
                ZO_CheckButton_SetCheckState(filter[context], lib:IsEnabled(pinTypeId))
            end
        end
    end
end

CALLBACK_MANAGER:RegisterCallback("OnWorldMapChanged", lib.OnMapChanged)

-------------------------------------------------------------------------------
-- Hooks ----------------------------------------------------------------------
-------------------------------------------------------------------------------
-- support "grayscale" in pinLayoutData
-------------------------------------------------------------------------------
ZO_PostHook(ZO_MapPin, "SetData", function(self, pinType)
    local singlePinData = ZO_MapPin.PIN_DATA[pinType]
    if singlePinData then
        local grayscale = singlePinData.grayscale
        if grayscale ~= nil then
            self.backgroundControl:SetDesaturation((type(grayscale) == "function" and grayscale(self) or grayscale == true) and 1 or 0)
        end
    end
end)

ZO_PostHook(ZO_MapPin, "ClearData", function(self, ...)
    local control = self.backgroundControl
    if control then
        self.backgroundControl:SetDesaturation(0)
    end
end)

-------------------------------------------------------------------------------
-- Scrollbox for map filters
-------------------------------------------------------------------------------
local function OnLoad(code, addon)
    if addon:find("^ZO") then return end
    EVENT_MANAGER:UnregisterForEvent(lib.name, EVENT_ADD_ON_LOADED)

    if WORLD_MAP_FILTERS.pvePanel.checkBoxPool then
        WORLD_MAP_FILTERS.pvePanel.checkBoxPool.parent = ZO_WorldMapFiltersPvEContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvEContainer", ZO_WorldMapFiltersPvE, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.pvePanel.checkBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.pvePanel.checkBoxPool.parent)
        end
        if ZO_WorldMapFiltersPvECheckBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersPvECheckBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.pvePanel.control then
                ZO_WorldMapFiltersPvECheckBox1:SetAnchor(point, ZO_WorldMapFiltersPvEContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if WORLD_MAP_FILTERS.pvePanel.comboBoxPool then
        WORLD_MAP_FILTERS.pvePanel.comboBoxPool.parent = ZO_WorldMapFiltersPvEContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvEContainer", ZO_WorldMapFiltersPvE, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.pvePanel.comboBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.pvePanel.comboBoxPool.parent)
        end
        if ZO_WorldMapFiltersPvEComboBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersPvEComboBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.pvePanel.control then
                ZO_WorldMapFiltersPvEComboBox1:SetAnchor(point, ZO_WorldMapFiltersPvEContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if ZO_WorldMapFiltersPvEContainer then
        ZO_WorldMapFiltersPvEContainer:SetAnchorFill()
    end

    if WORLD_MAP_FILTERS.pvpPanel.checkBoxPool then
        WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.parent = ZO_WorldMapFiltersPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvPContainer", ZO_WorldMapFiltersPvP, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.parent)
        end
        if ZO_WorldMapFiltersPvPCheckBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersPvPCheckBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.pvpPanel.control then
                ZO_WorldMapFiltersPvPCheckBox1:SetAnchor(point, ZO_WorldMapFiltersPvPContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if WORLD_MAP_FILTERS.pvpPanel.comboBoxPool then
        WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.parent = ZO_WorldMapFiltersPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvPContainer", ZO_WorldMapFiltersPvP, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.parent)
        end
        if ZO_WorldMapFiltersPvPComboBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersPvPComboBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.pvpPanel.control then
                ZO_WorldMapFiltersPvPComboBox1:SetAnchor(point, ZO_WorldMapFiltersPvPContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if ZO_WorldMapFiltersPvPContainer then
        ZO_WorldMapFiltersPvPContainer:SetAnchorFill()
    end

    if WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool then
        WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.parent = ZO_WorldMapFiltersImperialPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersImperialPvPContainer", ZO_WorldMapFiltersImperialPvP, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.parent)
        end
        if ZO_WorldMapFiltersImperialPvPCheckBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersImperialPvPCheckBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.imperialPvPPanel.control then
                ZO_WorldMapFiltersImperialPvPCheckBox1:SetAnchor(point, ZO_WorldMapFiltersImperialPvPContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool then
        WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.parent = ZO_WorldMapFiltersImperialPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersImperialPvPContainer", ZO_WorldMapFiltersImperialPvP, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.parent)
        end
        if ZO_WorldMapFiltersImperialPvPComboBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersImperialPvPComboBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.imperialPvPPanel.control then
                ZO_WorldMapFiltersPvPComboBox1:SetAnchor(point, ZO_WorldMapFiltersImperialPvPContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if ZO_WorldMapFiltersImperialPvPContainer then
        ZO_WorldMapFiltersImperialPvPContainer:SetAnchorFill()
    end

    if WORLD_MAP_FILTERS.battlegroundPanel.checkBoxPool then
        WORLD_MAP_FILTERS.battlegroundPanel.checkBoxPool.parent = ZO_WorldMapFiltersBattlegroundContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersBattlegroundContainer", ZO_WorldMapFiltersBattleground, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.battlegroundPanel.checkBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.battlegroundPanel.checkBoxPool.parent)
        end
        if ZO_WorldMapFiltersBattlegroundCheckBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersBattlegroundCheckBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.battlegroundPanel.control then
                ZO_WorldMapFiltersBattlegroundCheckBox1:SetAnchor(point, ZO_WorldMapFiltersBattlegroundContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if WORLD_MAP_FILTERS.battlegroundPanel.comboBoxPool then
        WORLD_MAP_FILTERS.battlegroundPanel.comboBoxPool.parent = ZO_WorldMapFiltersBattlegroundContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersBattlegroundContainer", ZO_WorldMapFiltersBattleground, "ZO_ScrollContainer"):GetNamedChild("ScrollChild")
        for i, control in pairs(WORLD_MAP_FILTERS.battlegroundPanel.comboBoxPool.m_Active) do
            control:SetParent(WORLD_MAP_FILTERS.battlegroundPanel.comboBoxPool.parent)
        end
        if ZO_WorldMapFiltersBattlegroundComboBox1 then
            local valid, point, control, relPoint, x, y = ZO_WorldMapFiltersBattlegroundComboBox1:GetAnchor(0)
            if control == WORLD_MAP_FILTERS.battlegroundPanel.control then
                ZO_WorldMapFiltersPvPComboBox1:SetAnchor(point, ZO_WorldMapFiltersBattlegroundContainerScrollChild, relPoint, x, y)
            end
        end
    end
    if ZO_WorldMapFiltersBattlegroundContainer then
        ZO_WorldMapFiltersBattlegroundContainer:SetAnchorFill()
    end
end
EVENT_MANAGER:RegisterForEvent(lib.name, EVENT_ADD_ON_LOADED, OnLoad)

-------------------------------------------------------------------------------
-- lib:MyPosition()
-------------------------------------------------------------------------------
-- Returns the player position on current map.
-- Not really intended for use as a library function.
-- For example it does not return the different formats from GetZoneAndSubzone
-------------------------------------------------------------------------------
function lib:MyPosition()
    if SetMapToPlayerLocation() == SET_MAP_RESULT_MAP_CHANGED then
        CALLBACK_MANAGER:FireCallbacks("OnWorldMapChanged")
    end

    local mapName = zo_strformat(SI_WINDOW_TITLE_WORLD_MAP, GetMapName())
    local x, y = GetMapPlayerPosition("player")
    local zone, subzone = self:GetZoneAndSubzone()

    return x, y, zone, subzone, mapName
end

-------------------------------------------------------------------------------
-- Displays the player position on current map.
-- The output format is prepared for data collection.
-------------------------------------------------------------------------------
local function show_position()
    local x, y, zone, subzone, mapName = lib:MyPosition()
    d(string.format("[\"%s\"][\"%s\"] = { %0.5f, %0.5f } -- %s", zone, subzone, x, y, mapName))
end

SLASH_COMMANDS["/lmploc"] = function() show_position() end

SLASH_COMMANDS["/lmppins"] = function()
    local customPins = lib.pinManager.customPins
    for pinId, pinLayout in pairs(customPins) do
        df("pinId: %d - pinName: %s", pinId, pinLayout.pinTypeString)
    end
end

LibMapPins = lib
