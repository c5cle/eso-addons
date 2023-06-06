FancyActionBar = {}

local NAME = "FancyActionBar"
local VERSION = "2.7"

local defaultSettings = {
	staticBars = true,
	showHotkeys = true,
	showHighlight = true,
	showArrow = true,
	arrowColor = {0, 1, 0},
	-- Backbar.
	backBarDesaturation = 0.8,
	backBarAlpha = 0.8,
	-- Numbers.
	timerColor = {1, 1, 1},
	decimalColor = {1, 1, 0},
	zeroColor = {1, 1, 0},
	decimalThreshold = 0,
	-- Skills.
	potlfix = true, -- fixed duration for Power of the Light (6s)
}

local FAB = FancyActionBar
local EM = EVENT_MANAGER
local SV
local ACTIVATED = false -- addon activated and EVENT_PLAYER_ACTIVATED triggered
local strformat = string.format
local time = GetFrameTimeSeconds

local MIN_INDEX = 3 -- first ability index
local MAX_INDEX = 7 -- last ability index
local SLOT_INDEX_OFFSET = 20 -- offset for backbar abilities indices
local SLOT_COUNT = MAX_INDEX - MIN_INDEX + 1 -- total number of slots
local ACTION_BAR = ZO_ActionBar1
local abilityConfig = {} -- parsed FancyActionBar.abilityConfig
local stacks = {} -- ability id => current stack count

-- Backbar buttons.
local buttons = {}

-- Button overlay controls contain abilities duration, number of stacks and visual effects.
local overlays = {}

-- This is the table of all effects (buffs, debuffs, damage abilities) we need to track, because their respective skills
-- have been slotted: effect_id => effect_info (table, see SlotEffect()).
-- We have to track some effects using EVENT_EFFECT_CHANGED event, because there can be a big delay between using a skill and showing its duration, e.g.
-- for Scalding Rune, which takes 2 seconds to arm, we want to track the fire dot, not the tooltip duration.
-- At the time of writing this comment ZOS function GetActionSlotEffectDuration() didn't provide any information about fire dot duration (there are issues with some other skills too).
local effects = {}

-- Primary bar, back bar or special bar (different special bars have different categories).
local currentHotbarCategory = GetActiveHotbarCategory()

local debug = false -- debug mode
local function dbg(msg, ...)
	if debug then d(strformat(msg, ...)) end
end

local GAMEPAD_CONSTANTS =
{
	abilitySlotWidth = 64,
    abilitySlotOffsetX = 10,
	buttonTextOffsetY = 60,
	actionBarOffset = -52,
	attributesOffset = -152,
	quickslotOffsetXFromFirstSlot = 5,
}
local KEYBOARD_CONSTANTS =
{
	abilitySlotWidth = 50,
    abilitySlotOffsetX = 2,
	buttonTextOffsetY = 50,
	actionBarOffset = -22,
	attributesOffset = -112,
	quickslotOffsetXFromFirstSlot = 5,
}

function FAB.GetName()
	return NAME
end

function FAB.GetVersion()
	return VERSION
end

-- Parse FAB.abilityConfig for faster access.
function FAB.BuildAbilityConfig()
	for id, cfg in pairs(FAB.abilityConfig) do
		if type(cfg) == 'table' then
			abilityConfig[id] = {cfg[1] or id, cfg[2]}
		elseif cfg then
			abilityConfig[id] = {id, type(cfg) == 'number' and cfg or nil, true}
		elseif cfg == false then
			abilityConfig[id] = false
		else
			abilityConfig[id] = nil
		end
	end
end

-- Get ActionButton by index.
function FAB.GetActionButton(index)
	if index > SLOT_INDEX_OFFSET then
		return buttons[index]
	else
		return ZO_ActionBar_GetButton(index)
	end
end

-- Show/hide hotkeys.
function FAB.ToggleHotkeys()
	for i = MIN_INDEX, MAX_INDEX do
		ZO_ActionBar_GetButton(i).buttonText:SetHidden(not SV.showHotkeys)
	end
end

function FAB.IsDebugMode()
	return debug
end

function FAB.SetDebugMode(mode)
	assert(type(mode) == 'boolean', 'Debug mode must be boolean.')
	debug = mode
end

function FAB.SetBackBarAlphaAndDesaturation(alpha, desaturation)
	if alpha < 0.2 or alpha > 1 then
		alpha = defaultSettings.backBarAlpha
	end
	SV.backBarAlpha = alpha
	if desaturation < 0 or desaturation > 1 then
		desaturation = defaultSettings.backBarDesaturation
	end
	SV.backBarDesaturation = desaturation
	for _, button in pairs(buttons) do
		button.icon:SetAlpha(SV.backBarAlpha)
		button.icon:SetDesaturation(SV.backBarDesaturation)
	end
end

-- Move action bar and attributes up a bit.
local function AdjustControlsPositions()
	local style = IsInGamepadPreferredMode() and GAMEPAD_CONSTANTS or KEYBOARD_CONSTANTS
	local anchor = ZO_Anchor:New()
	anchor:SetFromControlAnchor(ACTION_BAR)
	anchor:SetOffsets(nil, style.actionBarOffset)
	anchor:Set(ACTION_BAR)

	anchor:SetFromControlAnchor(ZO_PlayerAttribute)
	anchor:SetOffsets(nil, style.attributesOffset)
	anchor:Set(ZO_PlayerAttribute)
end

-- Backbar control initialized.
function FAB.OnActionBarInitialized(control)
	-- Set active bar as a parent to make inactive bar show/hide automatically.
	control:SetParent(ACTION_BAR)

	-- Need to adjust it here instead of in ApplyStyle(), otherwise it won't properly work with Azurah.
	AdjustControlsPositions()

	-- Create inactive bar buttons.
    for i = MIN_INDEX + SLOT_INDEX_OFFSET, MAX_INDEX + SLOT_INDEX_OFFSET do
		local button = ActionButton:New(i, ACTION_BUTTON_TYPE_VISIBLE, control, 'ZO_ActionButton')
		button:SetShowBindingText(false)
		button.icon:SetHidden(true)
		button:SetupBounceAnimation()
		buttons[i] = button
    end
end

-- Create button overlay.
function CreateOverlay(index)
	local template = ZO_GetPlatformTemplate('FAB_ActionButtonOverlay')
	local overlay = overlays[index]
	if overlay then
		ApplyTemplateToControl(overlay, template)
		overlay:ClearAnchors()
	else
		overlay = CreateControlFromVirtual('ActionButtonOverlay', ACTION_BAR, template, index)
		overlays[index] = overlay
	end
	return overlay
end

-- Update overlay controls.
function UpdateOverlay(index)
	local overlay = overlays[index]
	if overlay then
		local effect = overlay.effect
		-- Get controls to update.
		local durationControl = overlay:GetNamedChild('Duration')
		local stacksControl = overlay:GetNamedChild('Stacks')
		local bgControl = overlay:GetNamedChild('BG')
		if effect then
			-- Update duration.
			local duration = effect.endTime - time()
			--duration = GetActionSlotEffectTimeRemaining(index, index < SLOT_INDEX_OFFSET and HOTBAR_CATEGORY_PRIMARY or HOTBAR_CATEGORY_BACKUP) / 1000
			if duration > -3 then
				if SV.decimalThreshold > 0 and duration < SV.decimalThreshold then
					durationControl:SetText(strformat('%0.1f', zo_max(0, duration)))
					durationControl:SetColor(unpack(duration > 0 and SV.decimalColor or SV.zeroColor))
				else
					durationControl:SetText(zo_max(0, zo_ceil(duration)))
					if duration > 0 then
						durationControl:SetColor(unpack(SV.timerColor))
					else
						durationControl:SetColor(unpack(SV.zeroColor))
					end
				end
				bgControl:SetHidden(duration <= 0 or not SV.showHighlight)
			else
				bgControl:SetHidden(true)
				durationControl:SetText('')
			end
			-- Update stacks.
			if stacks[effect.id] and stacks[effect.id] > 0 then
				stacksControl:SetText(stacks[effect.id])
			else
				stacksControl:SetText('')
			end
		else
			bgControl:SetHidden(true)
			durationControl:SetText('')
		end
	end
end

-- Remove effect from overlay index.
function UnslotEffect(index)
	local overlay = overlays[index]
	if overlay then
		local effect = overlay.effect
		if effect then
			if index < SLOT_INDEX_OFFSET then effect.slot1 = nil else effect.slot2 = nil end
			overlay.effect = nil
		end
	end
end

-- Assign effect to overlay index.
function SlotEffect(index, abilityId)
	if not abilityId or abilityId == 0 or GetAbilityCastInfo(abilityId) then
		UnslotEffect(index)
	else
		local cfg = abilityConfig[abilityId]
		local effectId, duration, simple, custom
		if cfg == false then
			return
		elseif cfg then
			effectId = cfg[1] or abilityId
			simple = cfg[3] or false
			duration = cfg[2] or simple and GetAbilityDuration(abilityId) / 1000
			custom = true
		else
			effectId = abilityId
		end
		local effect = effects[effectId]
		if not effect then
			effect = {id = effectId, simple = simple, endTime = 0, custom = custom}
			effects[effectId] = effect
		end
		effect.duration = duration and duration > 0 and duration or nil
		if index < SLOT_INDEX_OFFSET then effect.slot1 = index else effect.slot2 = index end
		-- Assign effect to overlay.
		local overlay = overlays[index]
		if overlay then overlay.effect = effect end
		return effect
	end
end

-- Slot effects for primary and backup bars.
function SlotEffects()
	if currentHotbarCategory == HOTBAR_CATEGORY_PRIMARY or currentHotbarCategory == HOTBAR_CATEGORY_BACKUP then
		for i = MIN_INDEX, MAX_INDEX do
			SlotEffect(i, GetSlotBoundId(i, HOTBAR_CATEGORY_PRIMARY))
			SlotEffect(i + SLOT_INDEX_OFFSET, GetSlotBoundId(i, HOTBAR_CATEGORY_BACKUP))
		end
	else
		-- Unslot all effects, if we are on a special bar.
		for i = MIN_INDEX, MAX_INDEX do
			UnslotEffect(i)
			UnslotEffect(i + SLOT_INDEX_OFFSET)
		end
	end
end

-- Update overlays linked to the effect.
function UpdateEffect(effect)
	if effect then
		if effect.slot1 then UpdateOverlay(effect.slot1) end
		if effect.slot2 then UpdateOverlay(effect.slot2) end
	end
end

-- Apply style to action bars depending on keyboard/gamepad mode.
local function ApplyStyle()

	local style = IsInGamepadPreferredMode() and GAMEPAD_CONSTANTS or KEYBOARD_CONSTANTS
	local scale = ZO_ActionBar1:GetScale()

	-- Most alignments are relative to weapon swap button.
	local weaponSwapControl = ACTION_BAR:GetNamedChild('WeaponSwap')

	-- Hide default background.
	ACTION_BAR:GetNamedChild('KeybindBG'):SetHidden(true)

	-- Hide weapon swap button.
	weaponSwapControl:SetAlpha(SV.staticBars and 0 or 1)

	-- Arrow style.
	FAB_ActionBarArrow:SetHidden(not SV.staticBars or not SV.showArrow)
	FAB_ActionBarArrow:SetColor(unpack(SV.arrowColor))

	-- Set positions for buttons and overlays.
	local lastButton
	local buttonTemplate = ZO_GetPlatformTemplate('ZO_ActionButton')
	local overlayTemplate = ZO_GetPlatformTemplate('FAB_ActionButtonOverlay')
	for i = MIN_INDEX, MAX_INDEX do
		local button = ZO_ActionBar_GetButton(i)
		local overlayOffsetX = (i - MIN_INDEX) * (style.abilitySlotWidth + style.abilitySlotOffsetX)

		-- Hotkey position.
		button.buttonText:ClearAnchors()
		button.buttonText:SetAnchor(TOP, weaponSwapControl, RIGHT, (overlayOffsetX + style.abilitySlotWidth / 2) * scale, style.buttonTextOffsetY * scale)
		button.buttonText:SetHidden(not SV.showHotkeys)

		-- Main button overlay.
		local overlay = CreateOverlay(i)
		if i == MIN_INDEX then
			overlay:SetAnchor(BOTTOMLEFT, weaponSwapControl, RIGHT, 0, -4)
		else
			overlay:SetAnchor(LEFT, overlays[i - 1], RIGHT, style.abilitySlotOffsetX, 0)
		end

		-- Backbar button style and position.
		button = buttons[i + SLOT_INDEX_OFFSET]
		button:ApplyStyle(buttonTemplate)
		if lastButton then
			button:ApplyAnchor(lastButton.slot, style.abilitySlotOffsetX)
		end
		lastButton = button

		-- Back button overlay.
		overlay = CreateOverlay(i + SLOT_INDEX_OFFSET)
		if i == MIN_INDEX then
			overlay:SetAnchor(TOPLEFT, weaponSwapControl, RIGHT, 0, 0)
		else
			overlay:SetAnchor(LEFT, overlays[i + SLOT_INDEX_OFFSET - 1], RIGHT, style.abilitySlotOffsetX, 0)
		end
	end

	FAB.SetBackBarAlphaAndDesaturation(SV.backBarAlpha, SV.backBarDesaturation)

	-- Reposition ultimate slot.
	ActionButton8:ClearAnchors()
	ActionButton8:SetAnchor(LEFT, weaponSwapControl, RIGHT, SLOT_COUNT * (style.abilitySlotWidth + 2 * style.abilitySlotOffsetX) * scale)

	-- Lock quickslot and companion buttons in place.
	--ActionButton9:ClearAnchors()
	--ActionButton9:SetAnchor(RIGHT, weaponSwapControl, LEFT, -style.quickslotOffsetXFromFirstSlot * scale)
	CompanionUltimateButton:ClearAnchors()
	CompanionUltimateButton:SetAnchor(RIGHT, weaponSwapControl, LEFT, -style.quickslotOffsetXFromFirstSlot * scale)

end

-- Refresh action bars positions.
local function SwapControls()

	-- Set new anchors for the first buttons.
	local weaponSwapControl = ACTION_BAR:GetNamedChild('WeaponSwap')
	ActionButton3:ClearAnchors()
	ActionButton23:ClearAnchors()
	if SV.staticBars and currentHotbarCategory == HOTBAR_CATEGORY_BACKUP then
		ActionButton3:SetAnchor(TOPLEFT, weaponSwapControl, RIGHT, 0, 0)
		ActionButton23:SetAnchor(BOTTOMLEFT, weaponSwapControl, RIGHT, 0, -4)
	else
		ActionButton3:SetAnchor(BOTTOMLEFT, weaponSwapControl, RIGHT, 0, -4)
		ActionButton23:SetAnchor(TOPLEFT, weaponSwapControl, RIGHT, 0, 0)
	end

	-- Set new anchors for overlays.
	ActionButtonOverlay3:ClearAnchors()
	ActionButtonOverlay23:ClearAnchors()
	if not SV.staticBars and currentHotbarCategory == HOTBAR_CATEGORY_BACKUP then
		ActionButtonOverlay3:SetAnchor(TOPLEFT, weaponSwapControl, RIGHT, 0, 0)
		ActionButtonOverlay23:SetAnchor(BOTTOMLEFT, weaponSwapControl, RIGHT, 0, -4)
	else
		ActionButtonOverlay3:SetAnchor(BOTTOMLEFT, weaponSwapControl, RIGHT, 0, -4)
		ActionButtonOverlay23:SetAnchor(TOPLEFT, weaponSwapControl, RIGHT, 0, 0)
	end

	-- Update icons for inactive bar.
	for i = MIN_INDEX, MAX_INDEX do
		local btnBackSlotId = GetSlotBoundId(i, currentHotbarCategory == HOTBAR_CATEGORY_BACKUP and HOTBAR_CATEGORY_PRIMARY or HOTBAR_CATEGORY_BACKUP)
		local btnBack = buttons[i + SLOT_INDEX_OFFSET]
		if btnBackSlotId > 0 then
			btnBack.icon:SetTexture(GetAbilityIcon(btnBackSlotId))
			btnBack.icon:SetHidden(false)
		else
			btnBack.icon:SetHidden(true)
		end
		-- Need to update main buttons manually, because by default it is done when animation ends.
		local btnMain = ZO_ActionBar_GetButton(i)
		btnMain:HandleSlotChanged()
	end

	-- Unslot effects from the main bar if it's currently a special bar.
	if currentHotbarCategory ~= HOTBAR_CATEGORY_PRIMARY and currentHotbarCategory ~= HOTBAR_CATEGORY_BACKUP then
		for i = MIN_INDEX, MAX_INDEX do
			UnslotEffect(i)
		end
	end
end

local function SetAbilityBarTimersEnabled()
    if tonumber(GetSetting(SETTING_TYPE_UI, UI_SETTING_SHOW_ACTION_BAR_TIMERS)) == 0 then
		SetSetting(SETTING_TYPE_UI, UI_SETTING_SHOW_ACTION_BAR_TIMERS, "true")
	end
end

local function Initialize()

	SV = ZO_SavedVars:NewAccountWide('FancyActionBarSV', 1, nil, defaultSettings)

	FAB.BuildMenu(SV, defaultSettings)
	FAB.BuildAbilityConfig()

	-- Can use abilities while map is open, when cursor is active, etc.
	-- Disabled for now, causes conflicts with action bar cheating addons :D
	-- ZO_ActionBar_CanUseActionSlots = function() return true end

	-- Slot ability changed, e.g. summoned a pet, procced crystal, etc.
	local function OnSlotChanged(_, n)
		local btn = ZO_ActionBar_GetButton(n)
		if btn then
			btn:HandleSlotChanged()
		end
	end

	-- Button (usable) state changed.
	local function OnSlotStateChanged(_, n)
		local btn = ZO_ActionBar_GetButton(n)
		if btn then btn:UpdateState() end
	end

	-- Any skill swapped. Setup buttons and slot effects.
	local function OnAllHotbarsUpdated()
		for i = MIN_INDEX, MAX_INDEX + 1 do
			local button = ZO_ActionBar_GetButton(i)
			if button then
				button.showTimer = false -- disable default timer
				button.stackCountText:SetHidden(true)
				button.timerText:SetHidden(true)
				if i <= MAX_INDEX then -- non ult only
					button.hotbarSwapAnimation = nil -- delete default animation
					button.noUpdates = true -- disable animation updates
					button:HandleSlotChanged() -- update slot manually
				end
			end
			-- Hide default backbar button.
			if currentHotbarCategory == HOTBAR_CATEGORY_PRIMARY or currentHotbarCategory == HOTBAR_CATEGORY_BACKUP then
				local button = ZO_ActionBar_GetButton(i, currentHotbarCategory == HOTBAR_CATEGORY_PRIMARY and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY)
				if button then
					--button.backBarSwapAnimation = nil -- breaks console ui
					button.showTimer = false
					button.showBackRowSlot = false
					if i <= MAX_INDEX then -- non ult only
						button.noUpdates = true
					end
				end
			end
		end
		SlotEffects()
	end

	-- Hotbar changed. Can be primary bar, back bar or special bar: werewolf, relic, etc.
	local function OnActiveWeaponPairChanged()
		currentHotbarCategory = GetActiveHotbarCategory()
		SwapControls()
	end

	local function OnAbilityUsed(_, n)
		if n >= MIN_INDEX and n <= MAX_INDEX then
			local index = currentHotbarCategory == HOTBAR_CATEGORY_BACKUP and n + SLOT_INDEX_OFFSET or n
			local id = GetSlotBoundId(n, currentHotbarCategory)

			local duration = GetAbilityDuration(id) / 1000
			local effect = SlotEffect(index, id)
			if effect and effect.simple then
				effect.endTime = time() + effect.duration
			end
			dbg('[ActionButton%d] #%d: %0.1fs', index, id, duration)
		end
	end

	-- Any effect duration gained.
    local function OnActionSlotEffectUpdated(_, hotbarCategory, actionSlotIndex)
		local effect = effects[GetSlotBoundId(actionSlotIndex, hotbarCategory)]
		-- Effect must be slotted and not have custom duration specified in config.lua
		if effect and not effect.custom then
			local duration = GetActionSlotEffectDuration(actionSlotIndex, hotbarCategory)
			if duration > 2000 and duration < 100000 then
				local remain = GetActionSlotEffectTimeRemaining(actionSlotIndex, hotbarCategory) / 1000
				-- Adjustment for Power of the Light.
				-- TODO: find a better place to do it.
				if SV.potlfix and remain > 6 and effect.id == 21763 then
					remain = 6
				end
				effect.endTime = time() + remain
				UpdateEffect(effect)
			--else
				--effect.endTime = 0
			end
		end
    end

	local function OnEffectChanged(_, change, _, effectName, unitTag, beginTime, endTime, stackCount, _, _, _, _, _, _, _, abilityId)
		if change == EFFECT_RESULT_GAINED or change == EFFECT_RESULT_UPDATED then
			local effect = effects[abilityId]
			if effect and effect.custom then
				local t = time()
				if effect.duration then
					endTime = t + effect.duration
				end
				-- Ignore abilities that will end in less than 2s or longer than 100s.
				if endTime > t + 2 and endTime < t + 100 then
					effect.endTime = endTime
					UpdateEffect(effect)
				else
					effect.endTime = 0
				end
			end
			dbg('%s #%d - %d (%s)', change == EFFECT_RESULT_GAINED and '+' or '*', abilityId, endTime - beginTime, effectName)
		elseif change == EFFECT_RESULT_FADED then
			-- A fix for fake Crystal Fragments proc, which can start and suddenly end.
			if abilityId == 46327 then
				local effect = effects[abilityId]
				if effect then
					effect.endTime = 0
				end
			end
		end
	end

	-- Update overlays.
	local function Update()
		for i, overlay in pairs(overlays) do
			UpdateOverlay(i)
		end
	end

	-- Abilities stacks.
	local function OnStackChanged(_, changeType, _, _, _, _, _, stackCount, _, _, _, _, _, _, _, abilityId)
		if changeType == EFFECT_RESULT_FADED then
			stackCount = 0
		end
		stacks[FAB.stackMap[abilityId]] = stackCount
		-- Remove Seething Fury effect manually, otherwise it will keep counting down.
		if stackCount == 0 and abilityId == 122658 and effects[122658] then effects[122658].endTime = time() end
	end

	for abilityId in pairs(FAB.stackMap) do
		EM:RegisterForEvent(NAME .. abilityId, EVENT_EFFECT_CHANGED, OnStackChanged)
		EM:AddFilterForEvent(NAME .. abilityId, EVENT_EFFECT_CHANGED, REGISTER_FILTER_ABILITY_ID, abilityId)
		EM:AddFilterForEvent(NAME .. abilityId, EVENT_EFFECT_CHANGED, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)
	end

	EM:RegisterForEvent(NAME, EVENT_ACTION_SLOT_UPDATED, OnSlotChanged)
	EM:RegisterForEvent(NAME, EVENT_ACTION_SLOT_STATE_UPDATED, OnSlotStateChanged)
	EM:RegisterForEvent(NAME, EVENT_ACTION_SLOTS_ALL_HOTBARS_UPDATED, OnAllHotbarsUpdated)
	EM:RegisterForEvent(NAME, EVENT_ACTION_SLOT_ABILITY_USED, OnAbilityUsed)
	EM:RegisterForEvent(NAME, EVENT_ACTION_SLOT_EFFECT_UPDATE, OnActionSlotEffectUpdated)
	EM:RegisterForEvent(NAME, EVENT_GAMEPAD_PREFERRED_MODE_CHANGED, function() ApplyStyle(); SwapControls(); AdjustControlsPositions() end)
	EM:RegisterForEvent(NAME, EVENT_PLAYER_ACTIVATED, function()
		-- Enable Ability Bar Timers if they are disabled, otherwise EVENT_ACTION_SLOT_EFFECT_UPDATE won't fire :(
		SetAbilityBarTimersEnabled()
		-- The following stuff only needs to run once.
		if not ACTIVATED then
			currentHotbarCategory = GetActiveHotbarCategory()
			ApplyStyle()
			OnAllHotbarsUpdated()
			SwapControls()
			EM:UnregisterForUpdate(NAME .. 'Update')
			EM:RegisterForUpdate(NAME .. 'Update', 100, Update)
			-- If placed outside, then triggers once on character log in before player activated, causing UI error...
			EM:RegisterForEvent(NAME, EVENT_ACTIVE_WEAPON_PAIR_CHANGED, OnActiveWeaponPairChanged)
			ACTIVATED = true
		end
	end)

	EM:RegisterForEvent(NAME, EVENT_EFFECT_CHANGED, OnEffectChanged)
	EM:AddFilterForEvent(NAME, EVENT_EFFECT_CHANGED, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)

	-- Unregister some default stuff from action buttons.
	EM:UnregisterForEvent("ZO_ActionBar", EVENT_ACTION_SLOT_EFFECT_UPDATE)
	for i = MIN_INDEX, MAX_INDEX + 1 do
		EM:UnregisterForEvent("ActionButton" .. i, EVENT_INTERFACE_SETTING_CHANGED)
		EM:UnregisterForEvent("ActionBarTimer" .. i, EVENT_INTERFACE_SETTING_CHANGED)
	end
	--EM:UnregisterForEvent("CompanionUltimateButton", EVENT_INTERFACE_SETTING_CHANGED)

end

local function OnAddOnLoaded(event, addonName)
	if addonName == NAME then
		EM:UnregisterForEvent(NAME, EVENT_ADD_ON_LOADED)
		Initialize()
	end
end

EM:RegisterForEvent(NAME, EVENT_ADD_ON_LOADED, OnAddOnLoaded)