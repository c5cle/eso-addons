local lib = LibDebugLogger
local internal = lib.internal
local callback = lib.callback

-- everything in this file is subject to be removed in the future

-- See Callbacks.lua
lib.CALLBACK_LOG_CLEARED = callback.LOG_CLEARED
lib.CALLBACK_LOG_PRUNED = callback.LOG_PRUNED
lib.CALLBACK_LOG_ADDED = callback.LOG_ADDED

--- @deprecated use lib.SESSION_START_TIME instead
--- @return the time when the client was started in milliseconds.
function lib:GetSessionStartTime()
    return internal.SESSION_START_TIME
end

--- @deprecated use lib.UI_LOAD_START_TIME instead
--- @return the approximate time when the UI was loaded in milliseconds.
function lib:GetUiLoadStartTime()
    return internal.UI_LOAD_START_TIME
end