SetLangAddOn = {
	Name = "SetLang";
}
--
-- Initialization
--
function SetLangAddOn.Init()
-- languages in latin alphabetical order
	SLASH_COMMANDS["/l2de"] = function() SetCVar("language.2", "de") end
	SLASH_COMMANDS["/reen切换到英文"] = function() SetCVar("language.2", "en") end
	SLASH_COMMANDS["/l2es"] = function() SetCVar("language.2", "es") end
	SLASH_COMMANDS["/rezh切换到中文"] = function() SetCVar("language.2", "zh") end
	SLASH_COMMANDS["/l2ru"] = function() SetCVar("language.2", "ru") end
end

function SetLangAddOn.OnAddonLoaded(eventCode, aName)
    if aName == SetLangAddOn.Name then
	EVENT_MANAGER:UnregisterForEvent(SetLangAddOn.name, eventCode)
	SetLangAddOn:Init()
    end
end	

EVENT_MANAGER:RegisterForEvent(SetLangAddOn.Name, EVENT_ADD_ON_LOADED, SetLangAddOn.OnAddonLoaded )
