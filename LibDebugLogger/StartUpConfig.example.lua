local lib = LibDebugLogger
local internal = lib.internal

-- these changes are used during UI load and get discarded when the real settings are loaded,
-- or if no settings have been created yet, they will be kept instead of the defaults.
internal.settings.logTraces = true
internal.settings.minLogLevel = internal.LOG_LEVEL_VERBOSE

-- enable adding the stacktrace of the call to zo_callLater to the actual stacktrace
internal.logOriginStacktrace = true

-- enable to log fps, latency and memory consumption every few seconds (uses log level debug)
internal.logPerformanceStats = true

-- don't let the saved vars override the settings in this file
-- and don't modify them with the values in here either
internal.ignoreSavedVars = true

-- add tags to the verbose whitelist below so they are logged during UI load.
local whitelist = internal.verboseWhitelist
--whitelist["myTag"] = true
--whitelist["myTag/SubLogger"] = true
