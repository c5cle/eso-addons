local lib = LibDebugLogger
local internal = lib.internal

internal.TAG_INGAME = "UI"

internal.LOG_LEVEL_VERBOSE = "V"
internal.LOG_LEVEL_DEBUG = "D"
internal.LOG_LEVEL_INFO = "I"
internal.LOG_LEVEL_WARNING = "W"
internal.LOG_LEVEL_ERROR = "E"

internal.NUM_MAX_ENTRIES = 10000
internal.LOG_PRUNE_THRESHOLD = internal.NUM_MAX_ENTRIES + 1000
internal.MAX_ENTRY_AGE = 24 * 3600 * 1000 -- one day
internal.MAX_SAVE_DATA_LENGTH = 1999 -- buffer length used by ZOS

internal.ENTRY_TIME_INDEX = 1
internal.ENTRY_FORMATTED_TIME_INDEX = 2
internal.ENTRY_OCCURENCES_INDEX = 3
internal.ENTRY_LEVEL_INDEX = 4
internal.ENTRY_TAG_INDEX = 5
internal.ENTRY_MESSAGE_INDEX = 6
internal.ENTRY_STACK_INDEX = 7
internal.ENTRY_ERROR_CODE_INDEX = 8

internal.LOG_LEVELS = {
    internal.LOG_LEVEL_VERBOSE,
    internal.LOG_LEVEL_DEBUG,
    internal.LOG_LEVEL_INFO,
    internal.LOG_LEVEL_WARNING,
    internal.LOG_LEVEL_ERROR,
}

internal.LOG_LEVEL_TO_NUMBER = {
    [internal.LOG_LEVEL_VERBOSE] = 0,
    [internal.LOG_LEVEL_DEBUG] = 1,
    [internal.LOG_LEVEL_INFO] = 2,
    [internal.LOG_LEVEL_WARNING] = 3,
    [internal.LOG_LEVEL_ERROR] = 4,
}

internal.LOG_LEVEL_TO_STRING = {
    [internal.LOG_LEVEL_VERBOSE] = "verbose",
    [internal.LOG_LEVEL_DEBUG] = "debug",
    [internal.LOG_LEVEL_INFO] = "info",
    [internal.LOG_LEVEL_WARNING] =  "warning",
    [internal.LOG_LEVEL_ERROR] = "error",
}

internal.STR_TO_LOG_LEVEL = {}
for level, str in pairs(internal.LOG_LEVEL_TO_STRING) do
    internal.STR_TO_LOG_LEVEL[str] = level
    internal.STR_TO_LOG_LEVEL[level:lower()] = level
end
