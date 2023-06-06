local lib = LibDebugLogger
local internal = lib.internal

local SUB_LOGGER_TAG_TEMPLATE = "%s/%s"

local Logger = ZO_Object:Subclass()
internal.class.Logger = Logger

function Logger:New(...)
    local obj = ZO_Object.New(self)
    obj:Initialize(...)
    return obj
end

function Logger:Initialize(tag)
    assert(type(tag) == "string" and tag ~= "", "Invalid tag for logger")
    self.enabled = true
    self.tag = tag
    self.originalTag = tag
    self.minLevelOverride = nil
    self.logTracesOverride = nil
end

-- public API

--- Convenience method to create a new instance of the logger with a combined tag. Can be used to separate logs from different files.
--- @param tag - a string identifier that is appended to the original tag of the parent, separated by a slash
--- @return a new logger instance with the combined tag
function Logger:Create(tag)
    return Logger:New(SUB_LOGGER_TAG_TEMPLATE:format(self.originalTag, tag))
end

--- Convenience method to dynamically set a child tag without having to call Create to instantiate a new sub logger.
--- @param tag - a string identifier that is appended to the original tag, separated by a slash. No tag or an empty string will restore the original tag
function Logger:SetSubTag(tag)
    if not tag or tag == "" then
        self.tag = self.originalTag
    else
        self.tag = SUB_LOGGER_TAG_TEMPLATE:format(self.originalTag, tag)
    end
end

--- setter to turn this logger of so it no longer adds anything to the log when one of its log methods is called.
--- @param enabled - boolean which turns logging on or off
function Logger:SetEnabled(enabled)
    self.enabled = enabled
end

--- setter to define a non-persistent override for the minimum log level from the global configuration. Passing nil clears the override value.
--- this method is intended to allow authors to provide users with a way to temporarily enable debug logging on a per-addon basis (e.g. via a LAM button).
--- @param level - sets the override for the minimum log level.
function Logger:SetMinLevelOverride(level)
    self.minLevelOverride = level
end

--- setter to define a non-persistent override for the stack trace logging from the global configuration. Passing nil clears the override value.
--- this method is intended to allow authors to provide users with a way to temporarily enable debug logging on a per-addon basis (e.g. via a LAM button).
--- @param enabled - overrides if logs should capture a stack trace for this logger.
function Logger:SetLogTracesOverride(enabled)
    self.logTracesOverride = enabled
end

--- method to log messages with the passed log level.
--- @param level - the log level for the logged message. See LOG_LEVEL_* constants in API.lua
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Log(level, ...)
    if(not self.enabled) then return end
    return internal.Log(level, self, ...)
end

--- method to log messages with the verbose log level, only messages with whitelisted tags will be logged
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Verbose(...)
    if(not self.enabled) then return end
    return internal.Log(internal.LOG_LEVEL_VERBOSE, self, ...)
end

--- method to log messages with the debug log level
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Debug(...)
    if(not self.enabled) then return end
    return internal.Log(internal.LOG_LEVEL_DEBUG, self, ...)
end

--- method to log messages with the info log level
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Info(...)
    if(not self.enabled) then return end
    return internal.Log(internal.LOG_LEVEL_INFO, self, ...)
end

--- method to log messages with the warning log level
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Warn(...)
    if(not self.enabled) then return end
    return internal.Log(internal.LOG_LEVEL_WARNING, self, ...)
end

--- method to log messages with the error log level
--- @param ... - values to log, each of which will get passed through tostring, or string.format in case the first argument contains a formatting token
function Logger:Error(...)
    if(not self.enabled) then return end
    return internal.Log(internal.LOG_LEVEL_ERROR, self, ...)
end
