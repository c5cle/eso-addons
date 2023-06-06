local NAME = "LibCodesCommonCode"
local VERSION = 10

if (type(_G[NAME]) == "table" and type(_G[NAME].version) == "number" and _G[NAME].version >= VERSION) then return end

local Lib = { version = VERSION }
_G[NAME] = Lib


--------------------------------------------------------------------------------
-- Scope Localizations
--------------------------------------------------------------------------------

local EVENT_MANAGER = EVENT_MANAGER
local BitAnd = BitAnd
local BitOr = BitOr
local BitLShift = BitLShift
local BitRShift = BitRShift
local zo_floor = zo_floor
local zo_plainstrfind = zo_plainstrfind
local zo_strlen = zo_strlen
local zo_strsub = zo_strsub


--------------------------------------------------------------------------------
-- Color Conversions
--------------------------------------------------------------------------------

do
	local function i2c( n, pos )
		return BitAnd(BitRShift(n, pos), 0xFF) / 255
	end

	local function c2i( n, pos )
		return BitLShift(BitAnd(n * 255, 0xFF), pos)
	end

	function Lib.Int24ToRGB( rgb )
		return i2c(rgb, 16), i2c(rgb, 8), i2c(rgb, 0)
	end

	function Lib.Int24ToRGBA( rgb )
		return i2c(rgb, 16), i2c(rgb, 8), i2c(rgb, 0), 1
	end

	function Lib.Int32ToRGBA( rgba )
		return i2c(rgba, 24), i2c(rgba, 16), i2c(rgba, 8), i2c(rgba, 0)
	end

	function Lib.RGBToInt24( r, g, b )
		return c2i(r, 16) + c2i(g, 8) + c2i(b, 0)
	end

	function Lib.RGBAToInt32( r, g, b, a )
		return c2i(r, 24) + c2i(g, 16) + c2i(b, 8) + c2i(a, 0)
	end

	function Lib.Int24ToInt32( rgb )
		return BitOr(BitLShift(rgb, 8), 0xFF)
	end

	function Lib.Int32ToInt24( rgba )
		return BitRShift(rgba, 8)
	end

	local function h2c( p, q, t )
		t = t - zo_floor(t)
		if (t < 1/6) then return p + (q - p) * 6 * t end
		if (t < 1/2) then return q end
		if (t < 2/3) then return p + (q - p) * (2/3 - t) * 6 end
		return p
	end

	function Lib.HSLToRGB( h, s, l )
		if (s == 0) then
			return l, l, l
		else
			local q = (l < 0.5) and (l * (1 + s)) or (l + s - l * s)
			local p = 2 * l - q
			return h2c(p, q, h + 1/3), h2c(p, q, h), h2c(p, q, h - 1/3)
		end
	end
end


--------------------------------------------------------------------------------
-- 6-Bit Encode/Decode
--------------------------------------------------------------------------------

do
	local DICT = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#%"

	function Lib.Encode( number, size )
		-- Values for size:
		-- 0: Pad result to an even number of bytes (the number 0 will encode to an empty string)
		-- n: Pad result to a minimum length of n bytes
		-- nil: Do not pad results (the number 0 will encode to an empty string)

		local result = ""

		while (number > 0) do
			local p = (number % 0x40) + 1
			result = zo_strsub(DICT, p, p) .. result
			number = zo_floor(number / 0x40)
		end

		-- Pad result as necessary
		if (size == 0) then
			if (zo_strlen(result) % 2 == 1) then
				result = zo_strsub(DICT, 1, 1) .. result
			end
		elseif (size) then
			local padding = size - zo_strlen(result)
			if (padding > 0) then
				result = string.rep(zo_strsub(DICT, 1, 1), padding) .. result
			end
		end

		return result
	end

	function Lib.Decode( code )
		local result = 0

		for i = 1, zo_strlen(code) do
			local found, p = zo_plainstrfind(DICT, zo_strsub(code, i, i))
			if (not found) then return 0 end
			result = (result * 0x40) + (p - 1)
		end

		return result
	end
end


--------------------------------------------------------------------------------
-- Consolidator for 6-Bit Encoded Data
--------------------------------------------------------------------------------

do
	local function consolidate( str, char, flag )
		local result = string.gsub(str, string.format("(%s+)", string.rep(char, 4)), function( capture )
			local length = zo_strlen(capture)
			if (length < 0x800) then
				return "~" .. Lib.Encode(0x800 * flag + length, 2)
			else
				return capture
			end
		end)
		return result
	end

	function Lib.Implode( str )
		return consolidate(consolidate(str, "0", 0), "%%", 1)
	end

	function Lib.Explode( str )
		local result = string.gsub(str, "~(..)", function( capture )
			local code = Lib.Decode(capture)
			return string.rep((BitRShift(code, 11) == 0) and "0" or "%", BitAnd(code, 0x7FF))
		end)
		return result
	end
end


--------------------------------------------------------------------------------
-- String Chunk/Unchunk
--
-- Accommodation for the 2000-byte limit for strings in saved variables
--------------------------------------------------------------------------------

do
	local DEFAULT_CHUNK_SIZE = 0x600

	function Lib.Chunk( str, chunkSize )
		if (type(chunkSize) ~= "number") then
			chunkSize = DEFAULT_CHUNK_SIZE
		end

		local length = zo_strlen(str)
		if (length <= chunkSize) then
			return str
		else
			local result = { }
			local i, j = 1
			while (i <= length) do
				j = i + chunkSize
				table.insert(result, zo_strsub(str, i, j - 1))
				i = j
			end
			return result
		end
	end

	function Lib.Unchunk( chunked )
		if (type(chunked) == "string") then
			return chunked
		elseif (type(chunked) == "table") then
			return table.concat(chunked, "")
		else
			return ""
		end
	end
end


--------------------------------------------------------------------------------
-- Concise Server Name
--------------------------------------------------------------------------------

do
	local name = zo_strsplit(" ", GetWorldName())

	function Lib.GetServerName( )
		return name
	end
end


--------------------------------------------------------------------------------
-- Wrapper for initial EVENT_PLAYER_ACTIVATED
--------------------------------------------------------------------------------

do
	local id = 0

	function Lib.RunAfterInitialLoadscreen( func )
		id = id + 1
		local name = string.format("%s%d_%d", NAME, VERSION, id)
		EVENT_MANAGER:RegisterForEvent(name, EVENT_PLAYER_ACTIVATED, function( ... )
			EVENT_MANAGER:UnregisterForEvent(name, EVENT_PLAYER_ACTIVATED)
			func(...)
		end)
	end
end


--------------------------------------------------------------------------------
-- Zone Change Detection
--------------------------------------------------------------------------------

do
	local name = string.format("%s%d_ZoneChange", NAME, VERSION)
	local callbacks = { }
	local registered = false
	local zoneId = 0

	local function onPlayerActivated( )
		local previousZoneId = zoneId
		local currentZoneId = GetZoneId(GetUnitZoneIndex("player"))

		if (zoneId ~= currentZoneId) then
			zoneId = currentZoneId
			for _ , callback in pairs(callbacks) do
				callback(currentZoneId, previousZoneId)
			end
		end
	end

	-- Omit the callback parameter to unregister
	function Lib.MonitorZoneChanges( name, callback )
		callbacks[name] = callback

		if (not registered and next(callbacks)) then
			registered = true
			EVENT_MANAGER:RegisterForEvent(name, EVENT_PLAYER_ACTIVATED, onPlayerActivated)
		elseif (registered and not next(callbacks)) then
			registered = false
			EVENT_MANAGER:UnregisterForEvent(name, EVENT_PLAYER_ACTIVATED)
		end
	end
end


--------------------------------------------------------------------------------
-- Slash Command Helpers
--------------------------------------------------------------------------------

function Lib.RegisterSlashCommands( func, ... )
	for _, command in ipairs({ ... }) do
		SLASH_COMMANDS[command] = func
	end
end

function Lib.TokenizeSlashCommandParameters( params )
	local tokens = { }
	if (type(params) == "string") then
		for _, token in ipairs({ zo_strsplit(" ", zo_strlower(params)) }) do
			tokens[token] = true
		end
	end
	return tokens
end


--------------------------------------------------------------------------------
-- Get a sorted list of keys for a table, with a specific key sorted first
--------------------------------------------------------------------------------

function Lib.GetSortedKeys( tbl, first )
	local keys = { }
	for key in pairs(tbl) do
		table.insert(keys, key)
	end
	table.sort(keys, function( a, b )
		if (a == first) then
			return true
		elseif (b == first) then
			return false
		else
			return a < b
		end
	end)
	return keys
end


--------------------------------------------------------------------------------
-- Count the number of items in a table
--------------------------------------------------------------------------------

function Lib.CountTable( tbl )
	local count = 0
	for _ in pairs(tbl) do
		count = count + 1
	end
	return count
end
