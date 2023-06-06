-- LibGPS3 & its files � sirinsidiator                          --
-- Distributed under The Artistic License 2.0 (see LICENSE)     --
------------------------------------------------------------------

local LIB_IDENTIFIER = "LibGPS3"
local VERSION = 5

assert(not _G[LIB_IDENTIFIER], LIB_IDENTIFIER .. "已经加载完毕")

local lib = {}
_G[LIB_IDENTIFIER] = lib

lib.internal = {
    class = {},
    logger = LibDebugLogger(LIB_IDENTIFIER),
    chat = LibChatMessage(LIB_IDENTIFIER, "LGPS"),
    TAMRIEL_MAP_INDEX = 1,
    BLACKREACH_ROOT_MAP_INDEX = 40,
}

function lib.internal:InitializeSaveData()
    -- local saveData = LibGPS_Data

    -- if(not saveData or saveData.version ~= VERSION or saveData.apiVersion ~= GetAPIVersion()) then
    --     self.logger:Info("Creating new saveData")
    --     saveData = {
    --         version = VERSION,
    --         apiVersion = GetAPIVersion()
    --     }
    -- end

    -- LibGPS_Data = saveData
    -- self.saveData = saveData
end

function lib.internal:Initialize()
    local class = self.class
    local logger = self.logger

    logger:Debug("初始化 LibGPS3 中...")
    local internal = lib.internal

    local mapAdapter = class.MapAdapter:New()
    local meter = class.TamrielOMeter:New(mapAdapter)

    internal.mapAdapter = mapAdapter
    internal.meter = meter

    EVENT_MANAGER:RegisterForEvent(LIB_IDENTIFIER, EVENT_ADD_ON_LOADED, function(event, name)
        if (name ~= "LibGPS") then return end
        EVENT_MANAGER:UnregisterForEvent(LIB_IDENTIFIER, EVENT_ADD_ON_LOADED)
        internal:InitializeSaveData()
        logger:Debug("已加载保存的变量")
        SetMapToPlayerLocation() -- initial measurement so we can get back to where we are currently
    end)

    SLASH_COMMANDS["/libgpsreset"] = function()
        meter:Reset()
        self.chat:Print("所有测量值均已清除")
    end

    logger:Debug("初始化完成")
end
