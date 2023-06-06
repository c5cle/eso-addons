-------------------------------------------------------------------------------
-- Useful methods for pins:
-------------------------------------------------------------------------------
--
-- pin:GetControl()
-- pin:GetPinType()
-- pin:GetPinTypeAndTag()
-- pin:GetLevel()
-- pin:GetNormalizedPosition()
-- pin:SetData(pinType, pinTag)
-- pin:SetLocation(xLoc, yLoc, raduis)
-- pin:SetRotation(angle)
-- pin:UpdateLocation()
-------------------------------------------------------------------------------


--[[---------------------------------------------------------------------------
-- Sample code:
-------------------------------------------------------------------------------
-- MapPinTest/MapPintest.txt
-------------------------------------------------------------------------------
## Title: MapPinTest
## APIVersion: 100012
## SavedVariables: MapPinTest_SavedVariables

MapPinTest.lua

-------------------------------------------------------------------------------
-- MapPinTest/MapPinTest.lua
-------------------------------------------------------------------------------
local LMP = LibMapPins

local pinType1 = "My_unique_name"
local pinType2 = "My_even_more_unique_name"
local pinTypeId1, pinTypeId2

--sample data
local pinData = {
   ["auridon/auridon_base"] = {
      { x = 0.5432, y = 0.6789 },
   },
   ["alikr/alikr_base"] = {
      { x = 0.4343, y = 0.5353 },
   },
}

--sample layout
local pinLayoutData  = {
   level = 50,
   texture = "EsoUI/Art/MapPins/hostile_pin.dds",
   size = 30,
}

--tooltip creator
local pinTooltipCreator = {
   creator = function(pin)
      local locX, locY = pin:GetNormalizedPosition()
        InformationTooltip:AddLine(zo_strformat("Position of my pin is: <<1>>•<<2>>", ("%05.02f"):format(locX*100), ("%05.02f"):format(locY*100)))
   end,
   tooltip = ZO_MAP_TOOLTIP_MODE.INFORMATION,
}

--click handlers
local LMB_handler = {
   {
      name = "LMB action 1",
      callback = function(pin) d("LMB action 1!") end,
      show = function(pin) return pin:GetControl():GetHeight() == 30 end,
   },
   {
      name = "LMB action 2",
      callback = function(pin) d("LMB action 2!") end,
      show = function(pin) return pin:GetControl():GetHeight() == 20 end,
   },
}
local RMB_handler = {
   {
      name = "RMB action",
      callback = function(pin) d("RMB action!") end,
   },
}

--add callback function
local pinTypeAddCallback = function(pinManager)
   --do not create pins if your pinType is not enabled
   if not LMP:IsEnabled(pinType1) then return end
   --do not create pins on world, alliance and cosmic maps
   if (GetMapType() > MAPTYPE_ZONE) then return end

   local mapname = LMP:GetZoneAndSubzone(true)
   local pins = pinData[mapname]
   --return if no data for the current map
   if not pins then return end

   for _, pinInfo in ipairs(pins) do
      LMP:CreatePin(pinType1, pinInfo, pinInfo.x, pinInfo.y)
   end
end

--resize callback function (usually just nil)
local pinTypeOnResizeCallback = function(pinManager, mapWidth, mapHeight)
   local visibleWidth, visibleHeight = ZO_WorldMapScroll:GetDimensions()
   local currentZoom = mapWidth / visibleWidth

   if currentZoom < 1.5 then
      LMP:SetLayoutData(pinType1, pinLayoutData)
      LMP:RefreshPins(pinType1)
   else
      LMP:SetLayoutData(pinType1, {})
      LMP:RefreshPins(pinType1)
   end
end

local function OnLoad(eventCode, name)
   if name ~= "MapPinTest" then return end

   --saved variables
   savedVars = ZO_SavedVars:New("MapPinTest_SavedVariables", 1, nil, { filters = true })
   --initialize map pins
   pinTypeId1 = LMP:AddPinType(pinType1, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
   pinTypeId2 = LMP:AddPinType(pinType2, function() d("refresh") end)
   --set click handlers
   LMP:SetClickHandlers(pinTypeId1, LMB_handler, RMB_handler)
   --add pin filters to the world map
   LMP:AddPinFilter(pinTypeId1, "MapPinTest's pins", false, savedVars, "filters")
   LMP:AddPinFilter(pinTypeId2, nil, nil, savedVars)

   --hide filters for non-pve
   LMP:SetPinFilterHidden(pinType1, "pvp", true)
   LMP:SetPinFilterHidden(pinType1, "imperialPvP", true)
   LMP:SetPinFilterHidden(pinType1, "battleground", true)

   --more detailed hiding
   local function OnMapChanged()
      LMP:SetPinFilterHidden(pinType1, "pve", GetZoneId(GetCurrentMapZoneIndex()) ~= 1160) --Western Skyrim
   end
   CALLBACK_MANAGER:RegisterCallback("OnWorldMapChanged", OnMapChanged)

   EVENT_MANAGER:UnregisterForEvent("MapPinTest_OnLoad", eventCode)
end

EVENT_MANAGER:RegisterForEvent("MapPinTest_OnLoad", EVENT_ADD_ON_LOADED, OnLoad)
-------------------------------------------------------------------------------
-- END of sample code
--]]---------------------------------------------------------------------------