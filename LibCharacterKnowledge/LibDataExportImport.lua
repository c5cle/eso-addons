local NAME = "LibDataExportImport"
local VERSION = 2

if (type(_G[NAME]) == "table" and type(_G[NAME].version) == "number" and _G[NAME].version >= VERSION) then return end

local Lib = { version = VERSION }
_G[NAME] = Lib


--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

Lib.SHARE_LIMIT = 29903 - 100 -- Number of bytes (plus a small margin) that can be fit into a text box


--------------------------------------------------------------------------------
-- Wrap/Unwrap
--
-- Format: <tag|payload|checkcode>
-- The tag identifies the type of payload data
-- The upper 4 bits of checkcode is the data format version
-- The lower 32 bits of checkcode is an integrity hash of the tag and payload
--------------------------------------------------------------------------------

local Encode = LibCodesCommonCode.Encode
local Decode = LibCodesCommonCode.Decode

local function GenerateHash( tag, payload )
	return BitAnd(HashString(tag .. payload), 0xFFFFFFFF)
end

function Lib.Wrap( tag, version, payloadTable )
	local payload = table.concat(payloadTable, ",")
	return string.format(
		"<%s|%s|%s>\n",
		tag,
		payload,
		Encode(version * 0x100000000 + GenerateHash(tag, payload))
	)
end

function Lib.Unwrap( wrappedData )
	local tag, payload, checkcode = zo_strsplit("|", wrappedData)
	if (type(tag) == "string" and type(payload) == "string" and type(checkcode) == "string") then
		checkcode = Decode(checkcode)
		if (checkcode % 0x100000000 == GenerateHash(tag, payload)) then
			return tag, zo_floor(checkcode / 0x100000000), payload
		end
	end
	return nil
end


--------------------------------------------------------------------------------
-- Processors
--------------------------------------------------------------------------------

local Processors = { }

function Lib.RegisterProcessor( tag, func )
	Processors[tag] = func
end


--------------------------------------------------------------------------------
-- Import Interface
--------------------------------------------------------------------------------

function Lib.Import( input, invokerTag )
	local result = true

	local datasets = { }
	if (invokerTag) then
		datasets[invokerTag] = { }
	end

	local start = 1
	while (start) do
		start = string.find(input, "<", start)
		if (start) then
			local finish = string.find(input, ">", start)
			if (finish) then
				local tag, version, payload = Lib.Unwrap(zo_strsub(input, start + 1, finish - 1))
				if (tag) then
					if (Processors[tag]) then
						if (not datasets[tag]) then
							datasets[tag] = { }
						end
						table.insert(datasets[tag], {
							version = version,
							payload = payload,
						})
					end
				else
					result = false
					break
				end
			end
			start = finish
		end
	end

	for tag, dataset in pairs(datasets) do
		Processors[tag](dataset)
	end

	return result
end
