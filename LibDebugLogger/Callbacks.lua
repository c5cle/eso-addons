local lib = LibDebugLogger
local callback = lib.callback

--- This callback is fired when the log is wiped by the user or an addon.
--- @param log - the reference to the empty log
callback.LOG_CLEARED = "LogCleared"

--- This callback is fired after a new message was added and the log contains too many entries.
--- This pruning is necessary to prevent the log from growing too large to be loaded on login.
--- @param startIndex - the index in the old log which will become the beginning of the pruned log.
callback.LOG_PRUNED = "LogPruned"

--- This callback is fired whenever a new message is logged.
--- @param entry - the table containing the data for the last logged entry
--- Can either use unpack to assign it to local variables:
--- local time, formattedTime, count, level, tag, message, trace = unpack(entry)
--- or use the lib.ENTRY_*_INDEX constants to access individual values directly:
--- local message = entry[lib.ENTRY_MESSAGE_INDEX]
--- @param wasDuplicate - true if the same message was logged more than once.
--- In which case only the time is updated and the occurrences count increased by one
callback.LOG_ADDED = "LogAdded"
