NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "Confirm Stealing"

-- steal info
L.NAS_SHOW_INFO_CHECKBOX			= "Show status information"
L.NAS_SHOW_INFO_CHECKBOX_TOOLTIP	= "When enabled, the addon will display instructions (e.g. keybind) on how to enable stealing."

-- addon description
L.NAS_ADDON_NAME					= "NoAccidentalStealing"

-- option strings
L.NAS_STEALTH_ALLOW 				= "stealth to allow stealing"
L.NAS_STEALTH_ALLOW_OR				= "or stealth to allow stealing"
L.NAS_CONFIRM_SETTING_HEAD			= "Confirmation Settings"
L.NAS_CONFIRM_SETTING_TEXT			= [[Stealing becomes possible, if one of the following conditions is met:
 - your character is hidden
 - you are holding the confirmation key (can be set in the controls menu)
 - you are double tapping the interaction key (touble tap timeframe can be set below)]]
L.NAS_DOUBLE_TAP_HEAD				= "Double Tap Settings"
L.NAS_DOUBLE_TAP_TITLE				= "Double Tap speed"
L.NAS_DOUBLE_TAP_TEXT				= [[Double tapping the interaction key will confirm stealing an item, even if you aren't stealthed.]]
--To configure the double tap time frame, click the "Configure" button and double tap the interaction key (E by default).]]
L.NAS_DOUBLE_TAP_BUTTON				= "Configure"
L.NAS_DOUBLE_TAP_SLIDER				= "Double Tap intervall (in ms)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "You can set the double tap intervall directly, instead of using the configure button."
L.NAS_CONTAINER_HEAD				= "Container Settings"
L.NAS_CONTAINER_CHECKBOX			= "Allow searching containers"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "Opening a container is not a crime. When this option is enabled, you can open containers even if you aren't stealthed."

for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end
