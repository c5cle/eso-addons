local lib = { }

lib.name = "LibTreasure"

local function GetAddonVersion()
	-- Reads the addon version from the addon's txt manifest file tag ##AddOnVersion
	local AddOnManager = GetAddOnManager()
	local numAddOns = AddOnManager:GetNumAddOns()
	for i = 1, numAddOns do
		if AddOnManager:GetAddOnInfo(i) == lib.name then
			return AddOnManager:GetAddOnVersion(i)
		end
	end
end
lib.version = GetAddonVersion()

lib.data = { }


-- Globals
LibTreasure = lib
LIB_TREASURE = lib