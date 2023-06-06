local NAME = "LibDataShare"

local lib = {version = 3}
_G[NAME] = lib

local LMP = LibMapPing2
if LMP and not LMP.internal then LMP = nil end -- a naive check for LMP version just to avoid calling really old ones

local mapHandlers = {} -- currently registered maps

local ENABLED = true -- this lib won't send or process map pings if this setting is set to false
local MAIN_MAP_INDEX = 30 -- Vvardenfell
local PING_RATE = 2020 -- minimum time between pings
local lastPingTime = 0 -- time of the latest map ping
local lastOnPingTime = 0 -- time of the latest received and processed map ping

local EM = EVENT_MANAGER
local time = GetGameTimeMilliseconds

local function IsCallable(f)
	return type(f) == "function"
end

-- Utility object that works with a single map used by a specific addon to send map pings.
-- Each addon must acquire its own object by calling LibDataShare:RegisterMap()
local MapHandler = {}
function MapHandler:New(owner, mapId, dataHandler)
	handler = {mapId = mapId, owner = owner}
	setmetatable(handler, self)
	self.__index = self
	handler:SetDataHandler(dataHandler)
	return handler
end

-- Returns the number of unique points on a single axis of the current map.
-- This number squared is the largest number you can send via QueueData() and SendData().
function MapHandler:GetMapSize()
	return lib.maps[self.mapId].size
end

-- Queue data for sending. It'll be sent as soon as it's safe to send the next ping.
-- If callback is a function, then it'll be called right after the data has been sent, but not received yet.
-- Returns the number of milliseconds this data needs to "wait" to be sent.
function MapHandler:QueueData(data, callback)
	local t = time()
	local x, y = lib:EncodeData(self.mapId, data)
	local nextPingDelay = zo_max(0, lastPingTime - t + PING_RATE) -- make sure to always have at least PING_RATE delay between any pings

	zo_callLater(function()
		local result = false
		if lib:PrepareMap(self.mapId) then
			lib:SetMapPing(x, y)
			lib:RestoreMap()
			result = true
		end
		if IsCallable(callback) then
			callback(result)
		end
	end, nextPingDelay)

	lastPingTime = t + nextPingDelay

	return nextPingDelay > 0 and nextPingDelay or 1
end

-- Send data instantly without checking if it's safe to do so (too many map pings in a row will kick the player from server).
-- You might want to call LibDataShare:IsSendWindow() before sending data, but if you need to send something urgently and rarely, then it's usually safe to do without any checks.
-- Returns true if data has been successfully sent, false otherwise.
function MapHandler:SendData(data)
	if lib:PrepareMap(self.mapId) then
		local x, y = lib:EncodeData(self.mapId, data)
		lib:SetMapPing(x, y)
		lib:RestoreMap()
		lastPingTime = zo_max(lastPingTime, time())
		return true
	else
		return false
	end
end

-- A shortcut for LibDataShare:IsSendWindow().
function MapHandler:IsSendWindow()
	return LibDataShare:IsSendWindow()
end

-- Set a function that will handle incoming data.
-- The function will receive 3 values: unitTag (sender's group tag), data (received data), time (time in milliseconds when the data was received)
function MapHandler:SetDataHandler(func)
	self.dataHandler = func
end

-- When the lib is disabled, it won't send or process incoming pings.
function lib:IsEnabled()
	return ENABLED
end

-- Enable/disable data sharing.
function lib:SetEnabled(enabled)
	if enabled then
		ENABLED = true
	else
		ENABLED = false
	end
end

-- Encode data (a number between 0 and the corresponding map's amount of steps^2) into map coordinates.
-- mapId is ESO internal mapId found here: https://wiki.esoui.com/Maps
function lib:EncodeData(mapId, data)
	local map = lib.maps[mapId]
	if map and data >= 0 and data <= map.size^2 then
		return zo_floor(data / map.size) * map.step, (data % map.size) * map.step
	else
		return 0, 0
	end
end

--- Decode data from map coordinates.
function lib:DecodeData(mapId, x, y)
	local map = lib.maps[mapId]
	if map then
		return zo_floor(x / map.step + 0.5) * map.size + zo_floor(y / map.step + 0.5)
	else
		return 0
	end
end

-- Register a map for data sharing.
-- owner: name of the addon that wants to register the map.
-- mapId: check Map.lua for available maps.
-- dataHandler: function that will handle incoming data. It will receive 3 values: unitTag (sender's group tag), data (received data), time (time in milliseconds when the data was received).
-- Returns MapHandler object.
function lib:RegisterMap(owner, mapId, dataHandler)
	if lib.maps[mapId] then
		if mapHandlers[mapId] then
			error(string.format("Map %d is already registered by %s.", mapId, mapHandlers[mapId].owner))
		else
			local handler = MapHandler:New(owner, mapId, dataHandler)
			mapHandlers[mapId] = handler
			return handler
		end
	end
end

-- Stop using a map for data sharing.
function lib:UnregisterMap(mapId)
	mapHandlers[mapId] = nil
end

-- Get map ping for unitTag.
function lib:GetMapPing(unitTag)
	-- Use the original function.
	if LMP then
		return LMP.internal.handler.original.GetMapPing(unitTag)
	else
		return GetMapPing(unitTag)
	end
end

-- Set map ping at (x, y).
function lib:SetMapPing(x, y)
	-- Use the original function.
	if LMP then
		LMP.internal.handler.original.PingMap(MAP_PIN_TYPE_PING, MAP_TYPE_LOCATION_CENTERED, x, y)
	else
		PingMap(MAP_PIN_TYPE_PING, MAP_TYPE_LOCATION_CENTERED, x, y)
	end	
end

-- Returns true, if it's safe to send a map ping (enough time has passed since the last ping).
-- Returns false otherwise.
function lib:IsSendWindow()
	local t = time()
	return t - lastPingTime > PING_RATE and t - lastOnPingTime > 100
end

-- Mute all ping sounds.
function lib:MutePings()
	SOUNDS.MAP_PING = nil
	SOUNDS.MAP_PING_REMOVE = nil
end

-- Unmute all ping sounds.
function lib:UnmutePings()
	SOUNDS.MAP_PING = 'Map_Ping'
	SOUNDS.MAP_PING_REMOVE = 'Map_Ping_Remove'
end

-- Minimum time between pings sent by the lib.
function lib:GetPingRate()
	return PING_RATE
end

-- Disable data sharing in other addons.
-- This function is called by HodorReflexes when it's enabled, otherwise it will conflict with all of the following addons.
-- You need to disable Hodor Reflexes to use data sharing features of these addons.
function lib:ResolveConflicts()
	-- Disable RaidNotifier ult exchange
	if RaidNotifier then
		RaidNotifier:UnregisterForUltimateChanges()
	end

	-- Disable Bandits sharing
	if BUI and BUI.Vars then
		if BUI.Vars.StatShare and BUI.StatShare then
			BUI.Vars.StatShare = false
			BUI.StatShare:Initialize(true)
		end
		if BUI.Vars.StatsShareDPS then
			BUI.Vars.StatsShareDPS = false
		end
		if BUI.Vars.StatsUpdateDPS then
			BUI.Vars.StatsUpdateDPS = false
			EM:UnregisterForUpdate("BUI_ShareDPS")
		end
		BUI.StatShare.OnPing = function(eventCode, pingEventType, pingType, unitTag, offsetX, offsetY, isOwner) return end
	end

	-- Disable FTC dps sharing
	if FTC and FTC.Stats then
		FTC.Vars.StatsShareDPS = false
	end

	-- Disable Taos Group Tools
	if TGT_SettingsHandler then
		TGT_SettingsHandler.SavedVariables.IsSendingDataActive = false
		EM:UnregisterForUpdate('TGT-PlayerHandler')
	end

	-- Disable Piece of Candy
	if POC and POC.Comm and POC.Settings then
		POC.Comm.Unload()
		POC.Settings.SavedVariables.CommOff = true
	end

	-- Unregister all registered callbacks in LibMapPing.
	-- It might be a bit too brutal, but helps to avoid potential conflicts and performance issues, e.g.
	-- with LibGroupSocket, which processes every incoming ping without a way to disable it.
	if LMP then
		LMP.internal.callbackObject:UnregisterAllCallbacks("BeforePingAdded")
		LMP.internal.callbackObject:UnregisterAllCallbacks("AfterPingRemoved")
	end
end

--[[
--	Internal stuff.
--]]

-- Player opens/hides the world map.
local worldMapState = false -- world map is showing
local worldMapUpdate = false -- world map needs to be updated
local function MapStateChange(oldState, newState)
	if newState == SCENE_SHOWING then
		if worldMapUpdate then
			ZO_WorldMap_UpdateMap()
			worldMapUpdate = false
		end 
		worldMapState = true
	elseif newState == SCENE_HIDDEN then
		worldMapState = false
	end
end

-- Change map to Vvardenfell if possible.
local prepareMapResult = SET_MAP_RESULT_FAILED -- using SetMapResultCode constants, because why not
function lib:PrepareMap(mapId)
	-- Don't prepare map if data sharing is disabled.
	if not ENABLED then return false end

	local sameMap = DoesCurrentMapMatchMapForPlayerLocation()
	-- The following check fails if the player is viewing the map of another zone,
	-- because we can't set Vvardenfell map and return back without complex operations (like in LibGPS).
	if worldMapState and not sameMap then
		prepareMapResult = SET_MAP_RESULT_FAILED
	else
		prepareMapResult = sameMap and SET_MAP_RESULT_CURRENT_MAP_UNCHANGED or SET_MAP_RESULT_MAP_CHANGED
		SetMapToMapListIndex(mapId)
	end
	return prepareMapResult ~= SET_MAP_RESULT_FAILED
end

-- Return to the current map (should be called after each PrepareMap()).
function lib:RestoreMap()
	if prepareMapResult ~= SET_MAP_RESULT_FAILED then
		SetMapToPlayerLocation()
		if prepareMapResult == SET_MAP_RESULT_MAP_CHANGED then
			-- If player changed a subzone, then we need to update the world map, but only when he opens it.
			worldMapUpdate = true
		end
	end
end

-- EVENT_MAP_PING handler.
local function OnMapPing(eventCode, pingEventType, pingType, pingTag, offsetX, offsetY, isLocalPlayerOwner)
	if pingEventType == PING_EVENT_ADDED and pingType == MAP_PIN_TYPE_PING then
		local t = time()
		if isLocalPlayerOwner then
			-- Ignore own ping.
			lastPingTime = t
		elseif lib:PrepareMap(MAIN_MAP_INDEX) then
			lastOnPingTime = t
			local x, y = lib:GetMapPing(pingTag)
			-- If it's a ping on the main map, then use its handler directly, otherwise search for a suitable handler in mapHandlers.
			if x >= 0 and x <= 1 and y >= 0 and y <= 1 then
				local handler = mapHandlers[MAIN_MAP_INDEX]
				if handler and IsCallable(handler.dataHandler) then
					handler.dataHandler(pingTag, lib:DecodeData(MAIN_MAP_INDEX, x, y), t)
				end
			else
				for mapId, handler in pairs(mapHandlers) do
					if mapId ~= MAIN_MAP_INDEX then
						local map = lib.maps[mapId]
						if map and x >= map.x0 - map.step and x <= map.x1 + map.step and y >= map.y0 - map.step and y <= map.y1 + map.step then
							if lib:PrepareMap(mapId) then
								x, y = lib:GetMapPing(pingTag)
								if IsCallable(handler.dataHandler) then
									handler.dataHandler(pingTag, lib:DecodeData(mapId, x, y), t)
								end
							end
							break
						end
					end
				end
			end
			lib:RestoreMap()
		end
	end
end

local function Initialize()
	local function OnPlayerActivated()
		-- Unregister map ping handler.
		EM:UnregisterForEvent(NAME, EVENT_MAP_PING)

		-- Unregister map state changes.
		WORLD_MAP_SCENE:UnregisterCallback("StateChange", MapStateChange)
		GAMEPAD_WORLD_MAP_SCENE:UnregisterCallback("StateChange", MapStateChange)

		if lib:IsEnabled() then
			-- Register map ping handler.
			EM:RegisterForEvent(NAME, EVENT_MAP_PING, OnMapPing)

			-- Register map state changes.
			WORLD_MAP_SCENE:RegisterCallback("StateChange", MapStateChange)
			GAMEPAD_WORLD_MAP_SCENE:RegisterCallback("StateChange", MapStateChange)

			-- Mute all pings once and for all.
			lib:MutePings()
		else
			lib:UnmutePings()
		end
	end

	EM:RegisterForEvent(NAME, EVENT_PLAYER_ACTIVATED, OnPlayerActivated)
end

Initialize()