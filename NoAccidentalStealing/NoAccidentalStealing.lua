
local panel -- panel of the addon menu
_G["NAS"] = _G["NAS"] or {}
local NAS = _G["NAS"]
local isConfirmed = false -- true whenever the confirm-stealing button is pressed
local isHidden = false -- true if the character is hidden
local settings = {} -- table to store the settings in
local start -- used for the double-tap configuration. saves the time of the first tap.

-- create string for the key bind
ZO_CreateStringId("SI_BINDING_NAME_CONFIRM_STEAL", "Confirm Stealing")	

-- true if the player is hidden or the confirm button is pressed
local function IsStealingAllowed()
	return isHidden or isConfirmed
end

-- true if the object isn't owned by a NPC or if the object is a container and opening containers is allowed
local function IsInteractionAllowed()
	local action, _, _, isOwned, additional = GetGameCameraInteractableActionInfo()
	local isContainer = (action == GetString(SI_GAMECAMERAACTIONTYPE20)) and (additional ~= ADDITIONAL_INTERACT_INFO_LOCKED)
	local autoLoot = (GetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_LOOT_STOLEN) == "0")
	return (not isOwned) or (autoLoot and isContainer and settings.allowContainers)
end

-- true, if steal-confirmation is bound to a key
local function IsConfirmKeyBound()
	local layerIndex, categoryIndex, actionIndex = GetActionIndicesFromName("CONFIRM_STEAL")
	local bind = GetActionBindingInfo(layerIndex, categoryIndex, actionIndex, 1)
	if bind ~= 0 then
		return true
	end
	bind = GetActionBindingInfo(layerIndex, categoryIndex, actionIndex, 2)
	return bind ~= 0
end

-- this control displays the steal-confirm key, when targeting a stealable item
local stealInfoControl = CreateControlFromVirtual("StealInfo", ZO_ReticleContainerInteract, "ZO_KeybindButton")
stealInfoControl:SetAnchor(TOPLEFT, ZO_ReticleContainerInteractKeybindButton, BOTTOMLEFT, 0, 0)
stealInfoControl:SetKeybind("CONFIRM_STEAL", false)

-- function to set the text of the above defined control
local function SetInfoText()
	if IsConfirmKeyBound() then
		stealInfoControl:SetText(zo_strformat(SI_GAME_CAMERA_TARGET, NAS.localization.NAS_STEALTH_ALLOW_OR))
	else
		stealInfoControl:SetText(zo_strformat(SI_GAME_CAMERA_TARGET, NAS.localization.NAS_STEALTH_ALLOW))
	end
end

-- updates the color to red or green, depending on whether stealing is possible right now or not
local function UpdateColor()
	if IsStealingAllowed() then
		stealInfoControl:SetNormalTextColor(ZO_SUCCEEDED_TEXT)
	else
		stealInfoControl:SetNormalTextColor(ZO_NORMAL_TEXT)
	end
end

-- the default UI calls this function before interacting with the target
-- when the hook returns true, the interaction is cancelled
local oldInteract = INTERACTIVE_WHEEL_MANAGER.StartInteraction
INTERACTIVE_WHEEL_MANAGER.StartInteraction = function(self, interactionType, ...)
	-- start isn't nil if we are currently setting the double-tap intervall
	if start then
		-- is this the first tap?
		if start < 0 then
			start = GetFrameTimeMilliseconds()
			--d("Start setting doubletap timeframe.")
		else
			settings.delay = zo_round((GetFrameTimeMilliseconds() - start) * 1.1) --  increase time by 10%
			--d("Doubletap timeframe set to "..settings.delay.." milliseconds.")
			start = nil
			-- refresh the options panel to display the new time frame
			CALLBACK_MANAGER:FireCallbacks("LAM-RefreshPanel", panel)
		end
		return true
	end
	
	local preventStealing = (not IsStealingAllowed()) and (not IsInteractionAllowed())
	if preventStealing and interactionType == ZO_INTERACTIVE_WHEEL_TYPE_FISHING then
		-- if we have the double-tap feature enabled, then we have to confirm stealing for settings.delay seconds
		if settings.delay > 0 then
			ConfirmStealing(true)
			zo_callLater(function() ConfirmStealing(false) end, settings.delay)
		end
		return true
	else
		return oldInteract(self, interactionType, ...)
	end
end

function ConfirmStealing(confirmed)
	isConfirmed = confirmed
	UpdateColor()
end

-- hook the reticle to get the current stealth state
local stateChange = RETICLE.OnStealthStateChanged
RETICLE.OnStealthStateChanged = function(self, stealthState)
	isHidden = self.stealthIcon.hiddenStates[stealthState]
	UpdateColor()
	return stateChange(self, stealthState)
end

-- hook the reticle update function, to update the additional control we added
local updateInteractText = RETICLE.UpdateInteractText
RETICLE.UpdateInteractText = function(self, ...)
	stealInfoControl:SetHidden(IsInteractionAllowed() or settings.hideInfo)
	SetInfoText()
	return updateInteractText(self, ...)
end

local function OnAddonLoaded( _, addon )
	if addon ~= "NoAccidentalStealing" then
		return
	end
	settings = ZO_SavedVars:New("NAS_SavedVariables", 1, "settings", {delay = 250, criminalPressDuration = 750})
	NAS.settings = settings
	
	NAS.InitializeAbility()
	--SLASH_COMMANDS["/stealtimeframe"] = SetTimeframe
	local AddOnManager = GetAddOnManager()
	local displayVersion = ""
	for addonIndex = 1, AddOnManager:GetNumAddOns() do
		local name = AddOnManager:GetAddOnInfo(addonIndex)
		if name == "NoAccidentalStealing" then
			local versionInt = AddOnManager:GetAddOnVersion(addonIndex)
			local rev = versionInt % 100
			local version = zo_floor(versionInt / 100) % 100
			displayVersion = string.format("%d.%d", version, rev)
		end
	end
	
	local L = NAS.localization
	local panelData = {
		type = "panel",
		name = L.NAS_ADDON_NAME,
		displayName = ZO_HIGHLIGHT_TEXT:Colorize(L.NAS_ADDON_NAME),
		author = "Shinni",
		version = displayVersion,
		registerForRefresh = true,
		registerForDefaults = true,
	}
	
	local optionsTable = setmetatable({}, { __index = table })
	
	optionsTable:insert({
		type = "header",
		name = L.NAS_CONFIRM_SETTING_HEAD,
	})
	
	optionsTable:insert({
		type = "description",
		title = "",
		text = L.NAS_CONFIRM_SETTING_TEXT,
		width = "full"
	})
	
	optionsTable:insert({
		type = "checkbox",
		name = L.NAS_SHOW_INFO_CHECKBOX,
		tooltip = L.NAS_SHOW_INFO_CHECKBOX_TOOLTIP,
		getFunc = function() return not (settings.hideInfo == true) end, -- initially nil, but i want boolean as return type
		setFunc =  function(value) settings.hideInfo = not value end,
		default = true,
	})
	
	optionsTable:insert({
		type = "header",
		name = L.NAS_DOUBLE_TAP_HEAD,
	})
	
	optionsTable:insert({
		type = "description",
		title = L.NAS_DOUBLE_TAP_TITLE,
		text = L.NAS_DOUBLE_TAP_TEXT,
		width = "half"
	})
	
	--optionsTable:insert({
	--	type = "button",
	--	name = L.NAS_DOUBLE_TAP_BUTTON,
	--	func = function() start = -1 end,
	--	width = "half",
	--})
	
	optionsTable:insert({
		type = "slider",
		name = L.NAS_DOUBLE_TAP_SLIDER,
		--tooltip = L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP,
		min = 0,
		max = 1000,
		getFunc = function() return settings.delay end,
		setFunc = function( value ) settings.delay = value end,
		--width = "half",
		default = 0,
	})
	
	optionsTable:insert({
		type = "header",
		name = L.NAS_CONTAINER_HEAD,
	})
	
	optionsTable:insert({
		type = "checkbox",
		name = L.NAS_CONTAINER_CHECKBOX,
		tooltip = L.NAS_CONTAINER_CHECKBOX_TOOLTIP,
		getFunc = function() return (settings.allowContainers == true) end, -- initially nil, but i want false as return type
		setFunc =  function(value) settings.allowContainers = value end,
		default = false,
	})
	
	optionsTable:insert({
		type = "header",
		name = L.NAS_ABILITY_HEAD,
	})
	
	optionsTable:insert({
		type = "description",
		--title = L.NAS_DOUBLE_TAP_TITLE,
		text = L.NAS_ABILITY_TEXT,
		disabled = IsInGamepadPreferredMode,
		width = "half"
	})
	
	optionsTable:insert({
		type = "slider",
		name = L.NAS_ABILITY_SLIDER,
		disabled = IsInGamepadPreferredMode,
		--tooltip = L.NAS_ABILITY_SLIDER_TOOLTIP,
		getFunc = function() return settings.criminalPressDuration end, -- initially nil, but i want false as return type
		setFunc =  function(value) settings.criminalPressDuration = value end,
		default = 750,
		min = 0,
		max = 1500,
	})
	
	panel = LibAddonMenu2:RegisterAddonPanel("NoAccidentalStealingControl", panelData)
	LibAddonMenu2:RegisterOptionControls("NoAccidentalStealingControl", optionsTable)
end

EVENT_MANAGER:RegisterForEvent("NoAccidentalStealing", EVENT_ADD_ON_LOADED , OnAddonLoaded)