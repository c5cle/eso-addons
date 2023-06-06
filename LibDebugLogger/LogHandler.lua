local lib = LibDebugLogger
local internal = lib.internal
local callback = lib.callback

local strsub = string.sub
local strformat = string.format
local tostring = tostring
local tconcat = table.concat
local osdate = os.date
local traceback = debug.traceback
local select = select
local type = type
local pcall = pcall
local ZO_ClearTable = ZO_ClearTable
local GetGameTimeMilliseconds = GetGameTimeMilliseconds

-- this function should probably be smarter about detecting real formatting strings.
-- right now we just do a simple detection, try if it works and fall back to using tostring otherwise
local function IsFormattingString(input)
    if(type(input) == "string" and input:find("%%%S")) then
        return true
    end
    return false
end

local function FormatTime(timestamp)
    return osdate("%F %T.%%03.0f %z", timestamp / 1000):format(timestamp % 1000)
end
internal.FormatTime = FormatTime

local function PruneLog()
    local log = internal.log
    local logLength = #log
    if(logLength > internal.LOG_PRUNE_THRESHOLD) then
        -- table.remove is slow, so instead we just copy the results over to a new table and discard the old one
        local newLog = {}
        local startIndex = logLength - internal.NUM_MAX_ENTRIES
        for i = startIndex, logLength do
            newLog[#newLog + 1] = log[i]
        end

        internal.log = newLog
        LibDebugLoggerLog = newLog
        internal:FireCallbacks(callback.LOG_PRUNED, startIndex)
    end
end

local function SplitLongStringIfNeeded(value)
    if(not value) then return "" end

    local output = value
    local byteLength = #value
    local MAX_SAVE_DATA_LENGTH = internal.MAX_SAVE_DATA_LENGTH
    if(byteLength > MAX_SAVE_DATA_LENGTH) then
        output = {}
        local startPos = 1
        local endPos = startPos + MAX_SAVE_DATA_LENGTH - 1
        while startPos <= byteLength do
            output[#output + 1] = value:sub(startPos, endPos)
            startPos = endPos + 1
            endPos = startPos + MAX_SAVE_DATA_LENGTH - 1
        end
    end
    return output
end

local temp = {}
local function PrepareMessage(...)
    local message = ""
    local count = select("#", ...)
    if(count > 0) then
        local handled = false
        if(IsFormattingString(select(1, ...))) then
            -- use pcall to try formatting the string, otherwise we may end up with an infinite error loop
            handled, message = pcall(strformat, ...)
        end

        if(not handled) then
            ZO_ClearTable(temp)
            for i = 1, select("#", ...) do
                temp[i] = tostring(select(i, ...))
            end

            if(internal.appendFormattingErrors and message ~= "") then
                -- try to append the error without the stack trace in case we failed to format it earlier
                local index = message:find("\nstack traceback")
                if(index) then
                    temp[#temp + 1] = message:sub(1, index)
                end
            end
            message = tconcat(temp, " ")
        end
    end

    return message
end

local lastEntry, lastMessage, lastStacktrace, wasDuplicate
local function IsSameAsLastMessage(level, tag, message, stacktrace)
    if not lastEntry or lastMessage ~= message or lastStacktrace ~= stacktrace or lastEntry[internal.ENTRY_LEVEL_INDEX] ~= level or lastEntry[internal.ENTRY_TAG_INDEX] ~= tag then
        return false
    end
    return true
end

local function DoLog(level, tag, message, stacktrace, errorCode)
    local now = internal.SESSION_START_TIME + GetGameTimeMilliseconds()
    if stacktrace and internal.originStacktrace then
        stacktrace = stacktrace .. "\nregistered by:\n" .. internal.originStacktrace
    end
    local updatedExisting = false
    local isDuplicate = IsSameAsLastMessage(level, tag, message, stacktrace)
    if not isDuplicate or not wasDuplicate then
        local entry = {
            now, -- ENTRY_TIME_INDEX
            FormatTime(now), -- ENTRY_FORMATTED_TIME_INDEX
            1, -- ENTRY_OCCURENCES_INDEX
            level, -- ENTRY_LEVEL_INDEX
            tag, -- ENTRY_TAG_INDEX
            SplitLongStringIfNeeded(message), -- ENTRY_MESSAGE_INDEX
            SplitLongStringIfNeeded(stacktrace), -- ENTRY_STACK_INDEX
            errorCode, -- ENTRY_ERROR_CODE_INDEX
        }

        local log = internal.log
        log[#log + 1] = entry

        lastEntry = entry
        lastMessage = message
        lastStacktrace = stacktrace
    else
        lastEntry[internal.ENTRY_TIME_INDEX] = now
        lastEntry[internal.ENTRY_FORMATTED_TIME_INDEX] = FormatTime(now)
        lastEntry[internal.ENTRY_OCCURENCES_INDEX] = lastEntry[internal.ENTRY_OCCURENCES_INDEX] + 1
        updatedExisting = true
    end
    internal:FireCallbacks(callback.LOG_ADDED, lastEntry, updatedExisting)
    wasDuplicate = isDuplicate

    -- need to trim the log during the session in case some addon is producing an error every frame for the whole session without the user noticing, until they cannot log in next time
    PruneLog()
end

-- add a simple log that should hopefully never fail
local function LogFallbackMessage(message)
    if(type(message) == "string") then
        message = strsub(message, 1, internal.MAX_SAVE_DATA_LENGTH)
    else
        message = "Could not create log entry"
    end
    local log = internal.log
    log[#log + 1] = {
        internal.SESSION_START_TIME + GetGameTimeMilliseconds(), -- ENTRY_TIME_INDEX
        "-", -- ENTRY_FORMATTED_TIME_INDEX
        1, -- ENTRY_OCCURENCES_INDEX
        internal.LOG_LEVEL_ERROR, -- ENTRY_LEVEL_INDEX
        lib.id, -- ENTRY_TAG_INDEX
        message, -- ENTRY_MESSAGE_INDEX
    }
    internal:FireCallbacks(callback.LOG_ADDED, log[#log], false)
end

local function ShouldLog(level, tag, minLevelOverride)
    local minLevel = internal.settings.minLogLevel
    if minLevelOverride ~= nil then minLevel = minLevelOverride end
    local LOG_LEVEL_TO_NUMBER = internal.LOG_LEVEL_TO_NUMBER
    if
        not LOG_LEVEL_TO_NUMBER[level]
        or not LOG_LEVEL_TO_NUMBER[minLevel]
        or LOG_LEVEL_TO_NUMBER[level] < LOG_LEVEL_TO_NUMBER[minLevel]
        or (level == internal.LOG_LEVEL_VERBOSE and not internal.verboseWhitelist[tag])
    then
        return false
    end
    return true
end

local function TryLog(level, tag, message, stacktrace, errorCode)
    local handled, message = pcall(DoLog, level, tag, message, stacktrace, errorCode)

    if(not handled) then
        LogFallbackMessage(message)
    end
end

local function LogRaw(level, tag, message, stacktrace, errorCode)
    if(not ShouldLog(level, tag)) then return end
    TryLog(level, tag, message, stacktrace, errorCode)
end
internal.LogRaw = LogRaw

local function Log(level, config, ...)
    if(not ShouldLog(level, config.tag, config.minLevelOverride)) then return end

    local handled, message = pcall(PrepareMessage, ...)

    if(handled) then
        local stacktrace
        local shouldLogTraces = internal.settings.logTraces
        if config.logTracesOverride ~= nil then shouldLogTraces = config.logTracesOverride end
        if shouldLogTraces then
            stacktrace = traceback()
        end
        TryLog(level, config.tag, message, stacktrace)
    else
        LogFallbackMessage(message)
    end
end
internal.Log = Log

function internal:InitializeLog()
    if(LibDebugLoggerLog) then
        local startUpLog = internal.log
        local oldLog = LibDebugLoggerLog
        local newLog = {}

        -- we clean up old entries
        local startIndex = math.max(1, #oldLog + #startUpLog - internal.NUM_MAX_ENTRIES)
        local minTime = internal.SESSION_START_TIME - internal.MAX_ENTRY_AGE
        for i = startIndex, #oldLog do
            local entry = oldLog[i]
            if(entry[internal.ENTRY_TIME_INDEX] >= minTime) then
                newLog[#newLog + 1] = entry
            end
        end

        -- and append the new ones to new table
        for i = 1, #startUpLog do
            newLog[#newLog + 1] = startUpLog[i]
        end

        internal.log = newLog
        LibDebugLoggerLog = newLog
    else
        LibDebugLoggerLog = internal.log
    end
end
