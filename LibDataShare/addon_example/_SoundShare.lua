SoundShare = {
	name = "SoundShare",
	version = "0.2",
	sounds = {
		[1] = SOUNDS.DUEL_START,
		[2] = SOUNDS.EMPEROR_CORONATED_ALDMERI,
		[3] = SOUNDS.LEVEL_UP,
		[4503483664] = SOUNDS.SKILL_POINT_GAINED, -- max possible number on Betnikh map used by this addon, equals share:GetMapSize()^2
	},
}

local S = SoundShare
local NAME = S.name
local EM = EVENT_MANAGER
local share -- LibDataShare map handler

local function HandleData(tag, data)
	if S.sounds[data] then
		d(string.format("Sound by %s", GetUnitDisplayName(tag)))
		PlaySound(S.sounds[data])
	end
end

local function Initialize()
	-- Register Betnikh map for data sharing.
	share = LibDataShare:RegisterMap("SoundShare", 20, HandleData)
end

local function OnAddOnLoaded(event, addonName)
	if addonName == NAME then
		EM:UnregisterForEvent(NAME, EVENT_ADD_ON_LOADED)
		Initialize()
	end
end

SLASH_COMMANDS["/soundshare"] = function(sound)
	sound = tonumber(sound)
	if S.sounds[sound] then
		share:QueueData(sound, function()
			PlaySound(S.sounds[sound])
		end)
	else
		d("Unknown sound.")
	end
end

EM:RegisterForEvent(NAME, EVENT_ADD_ON_LOADED, OnAddOnLoaded)