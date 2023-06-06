--LibMediaProvider-1.0 is inspired by and borrows from LibSharedMedia-3.0 for World of Warcraft by Elkano
--LibSharedMedia-3.0 and LibMediaProvider-1.0 are under the LGPL-2.1 license

if LibMediaProvider then d("Warning : 'LibMediaProvider' has always been loaded.") return end
local cm = CALLBACK_MANAGER

-- Since version 1.0 release 21, the default ui media for fonts depends on the language mode.
local predefinedFont = {
--In official language modes where no unique font presets are defined, use ["default"].
	["default"] = {
		["ProseAntique"]			= "$(PROSE_ANTIQUE_FONT)", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "$(FTN57_FONT)", 
		["Futura Condensed Bold"]	= "$(FTN87_FONT)", 
		["Futura Condensed Light"]	= "$(FTN47_FONT)", 
		["Skyrim Handwritten"]		= "$(HANDWRITTEN_BOLD_FONT)", 
		["Trajan Pro"]				= "$(TRAJAN_PRO_R_FONT)", 
		["Univers 55"]				= "$(UNIVERS55_FONT)", 
		["Univers 57"]				= "$(UNIVERS57_FONT)", 
		["Univers 67"]				= "$(UNIVERS67_FONT)", 
	}, 
--In unofficial language modes where no unique font presets are defined, use ["vanilla"].
	["vanilla"] = {
		["ProseAntique"]			= "EsoUI/Common/Fonts/ProseAntiquePSMT.otf", 
		["Consolas"]				= "EsoUI/Common/Fonts/Consola.ttf", 
		["Futura Condensed"]		= "EsoUI/Common/Fonts/FTN57.otf", 
		["Futura Condensed Bold"]	= "EsoUI/Common/Fonts/FTN87.otf", 
		["Futura Condensed Light"]	= "EsoUI/Common/Fonts/FTN47.otf", 
		["Skyrim Handwritten"]		= "EsoUI/Common/Fonts/Handwritten_Bold.otf", 
		["Trajan Pro"]				= "EsoUI/Common/Fonts/TrajanPro-Regular.otf", 
		["Univers 55"]				= "EsoUI/Common/Fonts/Univers55.otf", 
		["Univers 57"]				= "EsoUI/Common/Fonts/Univers57.otf", 
		["Univers 67"]				= "EsoUI/Common/Fonts/Univers67.otf", 
	}, 
--In unofficial language modes where the missing glyphs are supplemented with backup fonts, use ["unofficial_language_base"].
	["unofficial_language_base"] = {
		["ProseAntique"]			= "$(PROSE_ANTIQUE_FONT)", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "$(FTN57_FONT)", 
		["Futura Condensed Bold"]	= "$(FTN87_FONT)", 
		["Futura Condensed Light"]	= "$(FTN47_FONT)", 
		["Skyrim Handwritten"]		= "$(HANDWRITTEN_BOLD_FONT)", 
		["Trajan Pro"]				= "$(TRAJAN_PRO_R_FONT)", 
		["Univers 55"]				= "$(UNIVERS55_FONT)", 
		["Univers 57"]				= "$(UNIVERS57CYR_FONT)", 
		["Univers 67"]				= "$(UNIVERS67CYR_FONT)", 
	}, 
}
--If you prefer to use a dedicated font preset for an unofficial language mode, describe a unique preset table here.
--However, glyphs specific to these predefined western fonts should be consistent regardless of language mode.
--If possible, try to make up for missing glyphs in backup font definitions.
	 predefinedFont["br"] = {	-- for EsoBR (Portugese)
		["ProseAntique"]			= "EsoBR/fonts/ProseAntiquePSMT.otf", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "EsoBR/fonts/FTN57.otf", 
		["Futura Condensed Bold"]	= "EsoBR/fonts/FTN87.otf", 
		["Futura Condensed Light"]	= "EsoBR/fonts/FTN47.otf", 
		["Skyrim Handwritten"]		= "EsoBR/fonts/Handwritten_Bold.otf", 
		["Trajan Pro"]				= "EsoBR/fonts/TrajanPro-Regular.otf", 
		["Univers 55"]				= "EsoBR/fonts/univers55.otf", 
		["Univers 57"]				= "EsoBR/fonts/univers57.otf", 
		["Univers 67"]				= "EsoBR/fonts/univers67.otf", 
	}
	predefinedFont["cs"] = {	-- for Cervanteso (Spanish)
		["ProseAntique"]			= "fonts/ProseAntiquePSMT.otf", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "fonts/FTN57.otf", 
		["Futura Condensed Bold"]	= "fonts/FTN87.otf", 
		["Futura Condensed Light"]	= "fonts/FTN47.otf", 
		["Skyrim Handwritten"]		= "fonts/Handwritten_Bold.otf", 
		["Trajan Pro"]				= "fonts/TrajanPro-Regular.otf", 
		["Univers 55"]				= "fonts/univers55.otf", 
		["Univers 57"]				= "fonts/univers57.otf", 
		["Univers 67"]				= "fonts/univers67.otf", 
	}
	predefinedFont["it"] = predefinedFont["vanilla"]	-- for Italian Scrolls Online (Italian)
	predefinedFont["kr"] = {	-- for EsoKR (Korean)
		["ProseAntique"]			= "EsoKR/fonts/ProseAntiquePSMT.otf", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "EsoKR/fonts/FTN57.otf", 
		["Futura Condensed Bold"]	= "EsoKR/fonts/FTN87.otf", 
		["Futura Condensed Light"]	= "EsoKR/fonts/FTN47.otf", 
		["Skyrim Handwritten"]		= "EsoKR/fonts/Handwritten_Bold.otf", 
		["Trajan Pro"]				= "EsoKR/fonts/TrajanPro-Regular.otf", 
		["Univers 55"]				= "EsoKR/fonts/univers55.otf", 
		["Univers 57"]				= "EsoKR/fonts/univers57.otf", 
		["Univers 67"]				= "EsoKR/fonts/univers67.otf", 
	}
	predefinedFont["kt"] = predefinedFont["kr"]	-- for EsoKR (Korean)
	predefinedFont["pl"] = {	-- for Skrybowie Tamriel (Polish)
		["ProseAntique"]			= "fonts/ProseAntiquePSMT.otf", 
		["Consolas"]				= "$(CONSOLAS_FONT)", 
		["Futura Condensed"]		= "fonts/FTN57.otf", 
		["Futura Condensed Bold"]	= "fonts/FTN87.otf", 
		["Futura Condensed Light"]	= "fonts/FTN47.otf", 
		["Skyrim Handwritten"]		= "fonts/Handwritten_Bold.otf", 
		["Trajan Pro"]				= "fonts/TrajanPro-Regular.otf", 
		["Univers 55"]				= "fonts/univers55.otf", 
		["Univers 57"]				= "fonts/univers57.otf", 
		["Univers 67"]				= "fonts/univers67.otf", 
	}
	predefinedFont["ua"] = predefinedFont["vanilla"]	-- for EsoUA (Ukranian)
	predefinedFont["ut"] = predefinedFont["vanilla"]	-- for EsoUA (Ukranian)
--	predefinedFont["zh"] = {	-- for EsoZH (Chinese)
--		["ProseAntique"]			= "EsoZH/fonts/ProseAntiquePSMT.otf", 
--		["Consolas"]				= "$(CONSOLAS_FONT)", 
--		["Futura Condensed"]		= "EsoZH/fonts/FTN57.otf", 
--		["Futura Condensed Bold"]	= "EsoZH/fonts/FTN87.otf", 
--		["Futura Condensed Light"]	= "EsoZH/fonts/FTN47.otf", 
--		["Skyrim Handwritten"]		= "EsoZH/fonts/Handwritten_Bold.otf", 
--		["Trajan Pro"]				= "EsoZH/fonts/TrajanPro-Regular.otf", 
--		["Univers 55"]				= "EsoZH/fonts/univers55.otf", 
--		["Univers 57"]				= "EsoZH/fonts/univers57.otf", 
--		["Univers 67"]				= "EsoZH/fonts/univers67.otf", 
--	}

-- ---------------------------------------------------------------------------------------
-- LibMediaProvider Class
-- ---------------------------------------------------------------------------------------
local LMP = ZO_InitializingObject:Subclass()
function LMP:Initialize(language)
	self.name = "LibMediaProvider"
	self.lang = language or GetCVar("Language.2")
	self.external = {}
	self.defaultMedia = {}
	self.mediaList = {}
	self.mediaTable = {}
	self.sharedMediaTable = {}		-- duplicated mediaTable for sharing
	self.mediaType = {
		BACKGROUND = "background",	-- background textures
		BORDER = "border",			-- border textures
		FONT = "font",				-- fonts
		STATUSBAR = "statusbar",	-- statusbar textures
		SOUND = "sound",			-- sound files
	}

--DEFAULT UI MEDIA--
-- BACKGROUND
	self.mediaTable.background = {
--		["None"]				= "", --commented out because it still leaves a white texture behind - addons can use alpha to hide the background
		["ESO Black"]			= "EsoUI/Art/Miscellaneous/borderedinset_center.dds", 
		["ESO Chat"]			= "EsoUI/Art/chatwindow/chat_bg_center.dds", 
		["ESO Gray"]			= "EsoUI/Art/itemtooltip/simpleprogbarbg_center.dds", 
		["Solid"]				= "", 
	}
	self.defaultMedia.background = "Solid"

-- BORDER
	self.mediaTable.border = {
--		["None"]				= "", --commented out because it still leaves a white texture behind - addons can use alpha to hide the border
		["ESO Gold"]			= "EsoUI/Art/Miscellaneous/borderedinsettransparent_edgefile.dds", 
		["ESO Chat"]			= "EsoUI/Art/chatwindow/chat_bg_edge.dds", 
		["ESO Rounded"]			= "EsoUI/Art/miscellaneous/interactkeyframe_edge.dds", 
		["ESO Blue Highlight"]	= "EsoUI/Art/miscellaneous/textentry_highlight_edge.dds", 
		["ESO Blue Glow"]		= "EsoUI/Art/crafting/crafting_tooltip_glow_edge_blue64.dds", 
		["ESO Red Glow"]		= "EsoUI/Art/crafting/crafting_tooltip_glow_edge_red64.dds", 
		["ESO Red Overlay"]		= "EsoUI/Art/uicombatoverlay/uicombatoverlayedge.dds", 
	}
	self.defaultMedia.border = "ESO Gold"

-- FONT
	self.mediaTable.font = predefinedFont[self.lang] or predefinedFont["default"]
	self.mediaTable.font["JP-StdFont"]	= "EsoUI/Common/Fonts/ESO_FWNTLGUDC70-DB.ttf"
	self.mediaTable.font["JP-ChatFont"]	= "EsoUI/Common/Fonts/ESO_FWUDC_70-M.ttf"
	self.mediaTable.font["JP-KafuPenji"]	= "EsoUI/Common/Fonts/ESO_KafuPenji-M.ttf"
	self.mediaTable.font["ZH-StdFont"]	= "EsoUI/Common/Fonts/MYingHeiPRC-W5.otf"
	self.mediaTable.font["ZH-MYoyoPRC"]	= "EsoUI/Common/Fonts/MYoyoPRC-Medium.otf"
	self.defaultMedia.font = "Univers 57"

-- STATUSBAR
	self.mediaTable.statusbar = {
--	self.mediaTable.statusbar["ESO Basic"]			= "EsoUI/Art/miscellaneous/progressbar_genericfill_tall.dds"
		["ESO Basic"]			= "", 
	}
	self.defaultMedia.statusbar = "ESO Basic"

-- SOUND
	self.mediaTable.sound = {
		["None"]					= "", 
		["AvA Gate Open"]			= SOUNDS.AVA_GATE_OPENED, 
		["AvA Gate Close"]			= SOUNDS.AVA_GATE_CLOSED, 
		["Emperor Coronated"]		= SOUNDS.EMPEROR_CORONATED_DAGGERFALL, 
		["Level Up"]				= SOUNDS.LEVEL_UP, 
		["Skill Gained"]			= SOUNDS.SKILL_GAINED, 
		["Ability Purchased"]		= SOUNDS.ABILITY_SKILL_PURCHASED, 
		["Book Acquired"]			= SOUNDS.BOOK_ACQUIRED, 
		["Unlock"]					= SOUNDS.LOCKPICKING_UNLOCKED, 
		["Enchanting Extract"]		= SOUNDS.ENCHANTING_EXTRACT_START_ANIM, 
		["Enchanting Create"]		= SOUNDS.ENCHANTING_CREATE_TOOLTIP_GLOW, 
		["Blacksmith Improve"]		= SOUNDS.BLACKSMITH_IMPROVE_TOOLTIP_GLOW_SUCCESS, 
	}
	self.defaultMedia.sound = "None"

	-- We do the duplication as the last step in initialization.
	ZO_DeepTableCopy(self.mediaTable, self.sharedMediaTable)
	self:InitializeAPI()
end

function LMP:RebuildMediaList(mediatype)
	if not self.mediaTable[mediatype] then return end
	self.mediaList[mediatype] = self.mediaList[mediatype] or {}
	local mlist = self.mediaList[mediatype]
	-- list can only get larger, so simply overwrite it
	local i = 0
	for k in pairs(self.mediaTable[mediatype]) do
		i = i + 1
		mlist[i] = k
	end
	table.sort(mlist)
end

function LMP:Validate(mediatype, key)
	local mtt = self.mediaTable[mediatype]
	local smtt = self.sharedMediaTable[mediatype]
	if mtt and not smtt then
		ZO_ShallowTableCopy(mtt, smtt)
	else
		if mtt[key] ~= smtt[key] then
			smtt[key] = mtt[key]
		end
	end
end

function LMP:Register(mediatype, key, data)
	if type(mediatype) ~= "string" then
		error(self.name .. ":Register(mediatype, key, data) - mediatype must be string, got " .. type(mediatype))
	end
	if type(key) ~= "string" then
		error(self.name .. ":Register(mediatype, key, data) - key must be string, got " .. type(key))
	end
	mediatype = mediatype:lower()
	self.mediaTable[mediatype] = self.mediaTable[mediatype] or {}
	self.sharedMediaTable[mediatype] = self.sharedMediaTable[mediatype] or {}

	if self.mediaTable[mediatype][key] then
		return false	--  we do not allow overwriting of registered media.
	end
	self.mediaTable[mediatype][key] = data
	self.sharedMediaTable[mediatype][key] = data
	self:RebuildMediaList(mediatype)
	cm:FireCallbacks("LibMediaProvider_Registered", mediatype, key)
	return true
end

function LMP:Fetch(mediatype, key)
	local mtt = self.mediaTable[mediatype]
	local result = (mtt and mtt[key]) or (self.defaultMedia[mediatype] and mtt[self.defaultMedia[mediatype]])
	return result ~= "" and result or nil
end

function LMP:IsValid(mediatype, key)
	return self.mediaTable[mediatype] and (not key or self.mediaTable[mediatype][key]) and true or false
end

function LMP:HashTable(mediatype)
	return self.sharedMediaTable[mediatype]
end

function LMP:List(mediatype)
	if not self.mediaTable[mediatype] then
		return nil
	end
	if not self.mediaList[mediatype] then
		self:RebuildMediaList(mediatype)
	end
	return self.mediaList[mediatype]
end

function LMP:GetDefault(mediatype)
	return self.defaultMedia[mediatype]
end

function LMP:SetDefault(mediatype, key)
	if self.mediaTable[mediatype] and self.mediaTable[mediatype][key] and not self.defaultMedia[mediatype] then
		self.defaultMedia[mediatype] = key
		return true
	else
		return false
	end
end

function LMP:InitializeAPI()
--
-- ---- LibMediaProvider-1.0 API
--
	self.external.Register = function(_, mediatype, key, data)
		return self:Register(mediatype, key, data)
	end
	self.external.Fetch = function(_, mediatype, key)
		return self:Fetch(mediatype, key)
	end
	self.external.IsValid = function(_, mediatype, key)
		return self:IsValid(mediatype, key)
	end
	self.external.HashTable = function(_, mediatype)
		return self:HashTable(mediatype)
	end
	self.external.List = function(_, mediatype)
		return self:List(mediatype)
	end
	self.external.GetDefault = function(_, mediatype)
		return self:GetDefault(mediatype)
	end
	self.external.SetDefault = function(_, mediatype, key)
		return self:SetDefault(mediatype, key)
	end
	self.external.MediaType = self.mediaType
	self.external.MediaTable = {}	-- Stub for backward compatibility
	for _, mediaType in pairs(self.mediaType) do
		self.external.MediaTable[mediaType] = {}	-- No longer used
	end
	assert(not _G[self.name], self.name .. " is already loaded.")
	_G[self.name] = self.external
end

-- -----------------------------------------------------------------------------------------------------------
-- LibMediaProvider-1.0 Add-on
-- -----------------------------------------------------------------------------------------------------------
local LibMediaProviderNamespace = LMP:New(GetCVar("Language.2"))
