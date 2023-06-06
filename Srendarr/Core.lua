--[[----------------------------------------------------------
	Srendarr - Aura (Buff & Debuff) Tracker
	----------------------------------------------------------
	*
	* Phinix, Kith, Garkin, silentgecko
	*
	*
	Copyright (c) 2015-2023
	
	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation (the "Software"),
	to operate the Software for personal use only. Permission is NOT granted
	to modify, merge, publish, distribute, sublicense, re-upload, and/or sell
	copies of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
	OTHER DEALINGS IN THE SOFTWARE.
	
	----------------------------------------------------------------------------
	
	DISCLAIMER:
	
	This Add-on is not created by, affiliated with or sponsored by ZeniMax
	Media Inc. or its affiliates. The Elder Scrolls® and related logos are
	registered trademarks or trademarks of ZeniMax Media Inc. in the United
	States and/or other countries. All rights reserved.
	
	You can read the full terms at:
	https://account.elderscrollsonline.com/add-on-terms
]]--
local Srendarr				= _G['Srendarr'] -- grab addon table from global
local L						= Srendarr:GetLocale()
local ZOSName				= function (abilityID) return zo_strformat("<<t:1>>", GetAbilityName(abilityID)) end

Srendarr.name				= 'Srendarr'
Srendarr.slash				= '/srendarr'
Srendarr.version			= '2.5.16'
Srendarr.versionDB			= 3

Srendarr.displayFrames		= {}
Srendarr.displayFramesScene	= {}
Srendarr.PassToAuraHandler	= {}
Srendarr.PassReticleChange	= {}
Srendarr.slotData			= {}
Srendarr.tempPostitions		= {}

Srendarr.auraGroupStrings = {		-- used in several places to display the aura grouping text
	[Srendarr.GROUP_PLAYER_SHORT]	= L.Group_Player_Short,
	[Srendarr.GROUP_PLAYER_LONG]	= L.Group_Player_Long,
	[Srendarr.GROUP_PLAYER_TOGGLED]	= L.Group_Player_Toggled,
	[Srendarr.GROUP_PLAYER_PASSIVE]	= L.Group_Player_Passive,
	[Srendarr.GROUP_PLAYER_DEBUFF]	= L.Group_Player_Debuff,
	[Srendarr.GROUP_PLAYER_GROUND]	= L.Group_Player_Ground,
	[Srendarr.GROUP_PLAYER_MAJOR]	= L.Group_Player_Major,
	[Srendarr.GROUP_PLAYER_MINOR]	= L.Group_Player_Minor,
	[Srendarr.GROUP_PLAYER_ENCHANT]	= L.Group_Player_Enchant,
	[Srendarr.GROUP_TARGET_BUFF]	= L.Group_Target_Buff,
	[Srendarr.GROUP_TARGET_DEBUFF]	= L.Group_Target_Debuff,
	[Srendarr.GROUP_CDTRACKER]		= L.Group_Cooldowns,
	[Srendarr.GROUP_CDBAR]			= L.Group_CooldownBar,
}

Srendarr.uiLocked			= true	-- flag for whether the UI is current drag enabled
Srendarr.uiHidden			= false	-- flag for whether auras should be hidden in UI state
Srendarr.groupUnits			= {}
Srendarr.groupNames			= {}
Srendarr.auraPolling		= true
local gearSwapDelay			= false
local POrderData			= Srendarr.POrderData

------------------------------------------------------------------------------------------------------------------------------
-- ADDON INITIALIZATION
------------------------------------------------------------------------------------------------------------------------------
function Srendarr.OnInitialize(code, addon)
	if addon ~= Srendarr.name then return end

	EVENT_MANAGER:UnregisterForEvent(Srendarr.name, EVENT_ADD_ON_LOADED)
	SLASH_COMMANDS[Srendarr.slash] = Srendarr.SlashCommand

	Srendarr.db = ZO_SavedVars:NewAccountWide('SrendarrDB', Srendarr.versionDB, nil, Srendarr:GetDefaults())

	if (not Srendarr.db.useAccountWide) then -- not using global settings, generate (or load) character specific settings
		Srendarr.db = ZO_SavedVars:NewCharacterIdSettings('SrendarrDB', Srendarr.versionDB, nil, Srendarr:GetDefaults())
	end

	local displayBase

	-- create display frames
	for x = 1, Srendarr.NUM_DISPLAY_FRAMES do

		local groupFrame = (x < Srendarr.GROUP_DSTART_FRAME) and Srendarr:GetGroupBuffTab() or Srendarr:GetGroupDebuffTab()
		displayBase = (x > (Srendarr.GROUP_START_FRAME - 1)) and Srendarr.db.displayFrames[groupFrame].base or Srendarr.db.displayFrames[x].base

		Srendarr.displayFrames[x] = Srendarr.DisplayFrame:Create(x, displayBase.point, displayBase.x, displayBase.y, displayBase.alpha, displayBase.scale)

		Srendarr.displayFrames[x]:Configure()

		-- add each frame to the ZOS scene manager to control visibility
		Srendarr.displayFramesScene[x] = ZO_HUDFadeSceneFragment:New(Srendarr.displayFrames[x], 0, 0)

		HUD_SCENE:AddFragment(Srendarr.displayFramesScene[x])
		HUD_UI_SCENE:AddFragment(Srendarr.displayFramesScene[x])
		SIEGE_BAR_SCENE:AddFragment(Srendarr.displayFramesScene[x])

		Srendarr.displayFrames[x]:SetHandler('OnEffectivelyShown', function(f)
			f:SetAlpha(f.displayAlpha) -- ensure alpha is reset after a scene fade
		end)
	end

	Srendarr:PopulateFilteredAuras()		-- AuraData.lua
	Srendarr:ConfigureAuraFadeTime()		-- Aura.lua
	Srendarr:ConfigureDisplayAbilityID()	-- Aura.lua
	Srendarr:ConfigureTimeSettings()		-- Aura.lua
	Srendarr:InitializeAuraControl()		-- AuraControl.lua
	Srendarr:InitializeCastBar()			-- CastBar.lua
	Srendarr:InitializeProcs()				-- Procs.lua
	Srendarr:InitializeSettings()			-- Settings.lua
	Srendarr:PartialUpdate()
	Srendarr:HideInMenus()
	Srendarr.OnActionSlotsFullUpdate()

	-- setup events to handle actionbar slotted abilities (used for procs and the castbar)
	for slot = 3, 8 do
		Srendarr.slotData[slot] = {}
		Srendarr.OnActionSlotUpdated(nil, slot) -- populate initial data (before events registered so no triggers before setup is done)
	end

	local function OnGroupLeft(e, mCName, reason, isLocalPlayer, iLead, mDName, aRVote) Srendarr.OnGroupChanged(isLocalPlayer) end
	local function GroupUpdate() Srendarr.OnGroupChanged(false) end

--	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ACTION_SLOTS_FULL_UPDATE,		Srendarr.OnActionSlotsFullUpdate) -- no longer triggers on bar swap (Phinix)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ACTIVE_WEAPON_PAIR_CHANGED,		Srendarr.OnActionSlotsFullUpdate)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ACTION_SLOT_UPDATED,			Srendarr.OnActionSlotUpdated)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ACTION_SLOT_STATE_UPDATED, 		Srendarr.OnActionSlotUpdated) -- needed for tracking dragging abilities on bar to change order (Phinix)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_GROUP_TYPE_CHANGED, 			GroupUpdate)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_GROUP_MEMBER_JOINED, 			GroupUpdate)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_GROUP_MEMBER_LEFT, 				OnGroupLeft)
	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_GROUP_UPDATE, 					GroupUpdate)

	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE,	function(_,...) Srendarr.OnEquipChange(...) end)
	EVENT_MANAGER:AddFilterForEvent(Srendarr.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE,	REGISTER_FILTER_BAG_ID, BAG_WORN)
	EVENT_MANAGER:AddFilterForEvent(Srendarr.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE,	REGISTER_FILTER_INVENTORY_UPDATE_REASON, INVENTORY_UPDATE_REASON_DEFAULT)

	EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ARMORY_BUILD_RESTORE_RESPONSE,	function() Srendarr.OnEquipChange() end)

	ZO_CreateStringId("SI_BINDING_NAME_TOGGLE_VISIBILITY", L.ToggleVisibility)
	ZO_CreateStringId("SI_BINDING_NAME_UPDATE_GEAR_SETS", L.UpdateGearSets)
end

function Srendarr.KeybindVisibilityToggle()
	if (Srendarr.KeybindVisibility) then
		for x = 1, Srendarr.NUM_DISPLAY_FRAMES do
			Srendarr.displayFrames[x]:SetHidden(true)
		end
		Srendarr.KeybindVisibility = false
	else
		for x = 1, Srendarr.NUM_DISPLAY_FRAMES do
			Srendarr.displayFrames[x]:SetHidden(false)
		end
		Srendarr.KeybindVisibility = true
	end
end

function Srendarr.UpdateGearSets()
	Srendarr.OnEquipChange()
end

function Srendarr.GetRotPOIcon()
	local ringStages = {
		[1] = 'Srendarr/Icons/RotPO_Level5.dds',
		[2] = 'Srendarr/Icons/RotPO_Level4.dds',
		[3] = 'Srendarr/Icons/RotPO_Level3.dds',
		[4] = 'Srendarr/Icons/RotPO_Level2.dds',
	}
	local groupSize = GetGroupSize() - 1
	if not IsUnitGrouped('player') or groupSize == 0 then
		return 'Srendarr/Icons/RotPO_Level6.dds'
	elseif groupSize >= 5 then
		return 'Srendarr/Icons/RotPO_Level1.dds'
	else
		return ringStages[groupSize]
	end
end

function Srendarr.PlayerLoaded(_, initial)
	Srendarr.OnPlayerActivatedAlive()
	Srendarr.OnEquipChange()
end

function Srendarr.SlashCommand(text)
	local groupStart = Srendarr.GROUP_START_FRAME - 1
	if text == 'lock' then
		for x = 1, groupStart do
			Srendarr.displayFrames[x]:DisableDragOverlay()
		end
		Srendarr.Cast:DisableDragOverlay()
		Srendarr.uiLocked = true
		local auraLookup = Srendarr.auraLookup
		for unit, data in pairs(auraLookup) do
			for aura, ability in pairs(auraLookup[unit]) do
				ability:SetExpired()
				ability:Release()
			end
		end
	elseif text == 'unlock' then
		for x = 1, groupStart do
			Srendarr.displayFrames[x]:EnableDragOverlay()
		end
		Srendarr.Cast:EnableDragOverlay()
		Srendarr.uiLocked = false
		local auraLookup = Srendarr.auraLookup
		for unit, data in pairs(auraLookup) do
			for aura, ability in pairs(auraLookup[unit]) do
				ability:SetExpired()
				ability:Release()
			end
		end
	else
		CHAT_SYSTEM:AddMessage(L.Usage)
	end
end


------------------------------------------------------------------------------------------------------------------------------
-- GROUP DATA HANDLING
------------------------------------------------------------------------------------------------------------------------------
do
-- re-dock group frame windows when group size changes. (Phinix)
	function Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
		local GetGameTimeMillis	= GetGameTimeMilliseconds
		local PassToAuraHandler = Srendarr.PassToAuraHandler
		local auraName, finish, icon, effectType, abilityType, abilityID
		if numAuras > 0 then -- unit has auras, repopulate
			local ts = GetGameTimeMillis() / 1000
			for i = 1, numAuras do
				auraName, _, finish, _, stack, icon, _, effectType, abilityType, _, abilityID, _, castByPlayer = GetUnitBuffInfo(unitTag, i)
				local pCast = (castByPlayer) and 31 or 32
				PassToAuraHandler(true, zo_strformat("<<t:1>>", auraName), unitTag, ts, finish, icon, effectType, abilityType, abilityID, pCast, stack)
			end
		end
		-- re-shuffle repopulated abilities to avoid gaps
		Srendarr.displayFrames[frame1]:Configure()
		Srendarr.displayFrames[frame2]:Configure()
		Srendarr.displayFrames[frame1]:UpdateDisplay()
		Srendarr.displayFrames[frame2]:UpdateDisplay()
	end

	function Srendarr.AnchorGroupFrames(groupSize, s, numAuras, unitTag, frame1, frame2)
		local gBX = Srendarr.db.displayFrames[Srendarr.GROUP_BUFFS].base.x
		local gBY = Srendarr.db.displayFrames[Srendarr.GROUP_BUFFS].base.y
		local rBX = Srendarr.db.displayFrames[Srendarr.RAID_BUFFS].base.x
		local rBY = Srendarr.db.displayFrames[Srendarr.RAID_BUFFS].base.y
		local gDX = Srendarr.db.displayFrames[Srendarr.GROUP_DEBUFFS].base.x
		local gDY = Srendarr.db.displayFrames[Srendarr.GROUP_DEBUFFS].base.y
		local rDX = Srendarr.db.displayFrames[Srendarr.RAID_DEBUFFS].base.x
		local rDY = Srendarr.db.displayFrames[Srendarr.RAID_DEBUFFS].base.y
		local fs = Srendarr.displayFrames[frame1]
		local fd = Srendarr.displayFrames[frame2]
		local groupAuraMode = Srendarr.db.groupAuraMode
		local raidAuraMode = Srendarr.db.raidAuraMode

		-- prepare to re-anchor display frames (addon support goes here)
		fs:ClearAnchors() 
		fd:ClearAnchors()

		local function defaultGroup() ---------------------------------------------------------------------- Default group frame configuration
			local groupSlot = tostring(unitTag:gsub("%a",''))
			local control = GetControl('ZO_GroupUnitFramegroup'..groupSlot..'Name')
			fs:SetAnchor(BOTTOMLEFT, control, TOPLEFT, gBX, gBY)
			fd:SetAnchor(TOPLEFT, control, TOPRIGHT, gDX, gDY)
			Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
			return
		end
		local function defaultRaid() ----------------------------------------------------------------------- Default raid frame configuration
			local groupSlot = tostring(unitTag:gsub("%a",''))
			local control = GetControl('ZO_RaidUnitFramegroup'..groupSlot)
			fs:SetAnchor(TOPLEFT, control, TOPRIGHT, rBX, rBY + 1)
			fd:SetAnchor(BOTTOMLEFT, control, BOTTOMRIGHT, rDX, rDY - 3)
			Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
			return
		end

		if groupSize <= 4 then
			if groupAuraMode == 1 then
				defaultGroup()
			elseif groupAuraMode == 2 then ----------------------------------------------------------------- Group frame support for Foundry Tactical Combat
				if FTC_VARS then
					local EnableFrames = FTC_VARS.Default[GetDisplayName()]["$AccountWide"].EnableFrames
					local GroupFrames = FTC_VARS.Default[GetDisplayName()]["$AccountWide"].GroupFrames
					if (EnableFrames == true and GroupFrames == true) then
						local control = GetControl('FTC_GroupFrame'..s..'_Health')
						fs:SetAnchor(TOPLEFT, control, BOTTOMLEFT, gBX + 2, gBY + 3)
						fd:SetAnchor(TOPLEFT, control, TOPRIGHT, gDX + 2, gDY + 3)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultGroup()
					end
				else
					defaultGroup()
				end
			elseif groupAuraMode == 3 then ----------------------------------------------------------------- Group frame support for Lui Extended
				if LUIESV then
					local EnableFrames = LUIESV.Default[GetDisplayName()]["$AccountWide"].UnitFrames_Enabled
					local GroupFrames = LUIESV.Default[GetDisplayName()]["$AccountWide"].UnitFrames.CustomFramesGroup
					if (EnableFrames == true and GroupFrames == true) then
						local function getLUIframe()
							for i = 1, 4 do
								local frame = 'SmallGroup'..i
								local uT = LUIE.UnitFrames.CustomFrames[frame].unitTag
								if uT == unitTag then
									return i
								end
							end
							return 0
						end
						local frame = getLUIframe()
						if frame ~= 0 then
							local control = LUIE.UnitFrames.CustomFrames['SmallGroup'..frame].control
							fs:SetAnchor(TOPLEFT, control, BOTTOMLEFT, gBX + 2, gBY + 2)
							fd:SetAnchor(TOPLEFT, control, TOPRIGHT, gDX + 2, gDY + 2)
							Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						end
						return
					else
						defaultGroup()
					end
				else
					defaultGroup()
				end
			elseif groupAuraMode == 4 then ----------------------------------------------------------------- Group frame support for Bandits User Interface 
				if BUI_VARS then
					local EnableFrames = BUI.Vars.RaidFrames
					if EnableFrames == true then
						local groupSlot = tostring(unitTag:gsub("%a",''))
						local control = GetControl('BUI_RaidFrame'..s)
						fs:SetAnchor(BOTTOMLEFT, control, TOPRIGHT, gBX + 2, gBY + 16)
						fd:SetAnchor(LEFT, control, RIGHT, gDX + 2, gDY)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultGroup()
					end
				else
					defaultGroup()
				end
			elseif groupAuraMode == 5 then ----------------------------------------------------------------- Group frame support for AUI
				if AUI_Main then
					local EnableFrames = AUI_Main.Default[GetDisplayName()]["$AccountWide"].modul_unit_frames_enabled
					local EnableGroup = (AUI_Attributes) and AUI_Attributes.Default[GetDisplayName()]["$AccountWide"].group_unit_frames_enabled or false
					if (EnableFrames) and (EnableGroup) then
						local groupSlot = tostring(unitTag:gsub("%a",''))
						local gTemplate = AUI_Templates.Default[GetDisplayName()]["$AccountWide"]["Attributes"]["Group"]
						local gFrame = ""
						if gTemplate == "AUI" then
							gFrame = "AUI_GroupFrame"
						elseif gTemplate == "AUI_TESO" then
							gFrame = "TESO_GroupFrame"
						elseif gTemplate == "AUI_Tactical" then
							gFrame = "AUI_Tactical_GroupFrame"
						end
						local control = GetControl(gFrame..groupSlot)
						fs:SetAnchor(TOPLEFT, control, BOTTOMLEFT, gBX + 2, gBY + 3)
						fd:SetAnchor(TOPLEFT, control, TOPRIGHT, gDX + 2, gDY + 3)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultGroup()
					end
				else
					defaultGroup()
				end
			end
		elseif groupSize >= 5 then
			if raidAuraMode == 1 then
				defaultRaid()
			elseif raidAuraMode == 2 then ------------------------------------------------------------------ Raid frame support for Foundry Tactical Combat
				if FTC_VARS then
					local EnableFrames = FTC_VARS.Default[GetDisplayName()]["$AccountWide"].EnableFrames
					local RaidFrames = FTC_VARS.Default[GetDisplayName()]["$AccountWide"].RaidFrames
					if (EnableFrames == true and RaidFrames == true) then
						local control = GetControl('FTC_RaidFrame'..s)
						fs:SetAnchor(TOPLEFT, control, TOPRIGHT, rBX, rBY + 4)
						fd:SetAnchor(BOTTOMLEFT, control, BOTTOMRIGHT, rDX, rDY - 2)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultRaid()
					end
				else
					defaultRaid()
				end
			elseif raidAuraMode == 3 then ------------------------------------------------------------------ Raid frame support for Lui Extended
				if LUIESV then
					local EnableFrames = LUIESV.Default[GetDisplayName()]["$AccountWide"].UnitFrames_Enabled
					local RaidFrames = LUIESV.Default[GetDisplayName()]["$AccountWide"].UnitFrames.CustomFramesRaid
					if (EnableFrames == true and RaidFrames == true) then
						local function getLUIframe()
							for i = 1, 24 do
								local frame = 'RaidGroup'..i
								if LUIE.UnitFrames.CustomFrames[frame] then
									local uT = LUIE.UnitFrames.CustomFrames[frame].unitTag
									if uT == unitTag then
										return i
									end
								end
							end
							return 0
						end
						local frame = getLUIframe()
						if frame ~= 0 then
							local control1 = LUIE.UnitFrames.CustomFrames['RaidGroup'..frame].control
							local control2 = LUIE.UnitFrames.CustomFrames['RaidGroup'..frame].name
							fs:SetAnchor(TOPLEFT, control2, TOPRIGHT, rBX, rBY)
							fd:SetAnchor(TOPLEFT, control1, TOPRIGHT, rDX, rDY)
							Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						end
						return
					else
						defaultRaid()
					end
				else
					defaultRaid()
				end
			elseif raidAuraMode == 4 then ------------------------------------------------------------------ Raid frame support for Bandits User Interface 
				if BUI_VARS then
					local EnableFrames = BUI.Vars.RaidFrames
					if EnableFrames == true then
						local groupSlot = tostring(unitTag:gsub("%a",''))
						local control = GetControl('BUI_RaidFrame'..s)
						fs:SetAnchor(TOPLEFT, control, TOPRIGHT, rBX + 2, rBY)
						fd:SetAnchor(BOTTOMLEFT, control, BOTTOMRIGHT, rDX + 2, rDY - 12)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultRaid()
					end
				else
					defaultRaid()
				end
			elseif raidAuraMode == 5 then ------------------------------------------------------------------ Raid frame support for AUI
				if AUI_Main then
					local EnableFrames = AUI_Main.Default[GetDisplayName()]["$AccountWide"].modul_unit_frames_enabled
					local EnableRaid = (AUI_Attributes) and AUI_Attributes.Default[GetDisplayName()]["$AccountWide"].raid_unit_frames_enabled or false
					if (EnableFrames) and (EnableRaid) then
						local raidSlot = tostring(unitTag:gsub("%a",''))
						local rTemplate = AUI_Templates.Default[GetDisplayName()]["$AccountWide"]["Attributes"]["Raid"]
						local rFrame = ""
						if rTemplate == "AUI" then
							rFrame = "AUI_RaidFramegroup"
						elseif rTemplate == "AUI_Tactical" then
							rFrame = "AUI_Tactical_RaidFramegroup"
						end
						local control = GetControl(rFrame..raidSlot)
						fs:SetAnchor(TOPLEFT, control, TOPRIGHT, rBX, rBY + 4)
						fd:SetAnchor(BOTTOMLEFT, control, BOTTOMRIGHT, rDX, rDY - 2)
						Srendarr.RepopulateGroupAuras(numAuras, unitTag, frame1, frame2)
						return
					else
						defaultRaid()
					end
				else
					defaultRaid()
				end
			end
		end
	end

	function Srendarr.OnGroupChanged(playerLeft)
		Srendarr.groupUnits = {}
		Srendarr.groupNames = {}
		local auraLookup = Srendarr.auraLookup

		if (playerLeft) then
			for g = 1, 24 do -- clear auras when group changes to avoid floating remnants
				local unit = "group" .. tostring(g)
				if auraLookup[unit] then
					for aura, ability in pairs(auraLookup[unit]) do
						ability:SetExpired()
						ability:Release()
					end
				end
			end
		end

		if auraLookup['player'][POrderData.ID] ~= nil then -- special case to change RotPO power level when group changes (Phinix)
			auraLookup['player'][POrderData.ID].icon:SetTexture(Srendarr.GetRotPOIcon())
		end

		if not Srendarr.GroupEnabled then return end -- abort if unsupported group frame detected

		if IsUnitGrouped("player") then
			Srendarr.IsPlayerGrouped = true
			for g = 1, 24 do -- clear auras when group changes to avoid floating remnants
				local unit = "group" .. tostring(g)
				if auraLookup[unit] then
					for aura, ability in pairs(auraLookup[unit]) do
						ability:SetExpired()
						ability:Release()
					end
				end
			end

			local groupSize = GetGroupSize()
			for s = 1, groupSize do
				local frame1 = s + (Srendarr.GROUP_START_FRAME - 1)
				local frame2 = s + Srendarr.GROUP_END_FRAME
				local unitTag = GetGroupUnitTagByIndex(s)

				if (DoesUnitExist(unitTag)) then
					--	zo_strformat("<<t:1>>", GetUnitName(unitTag))
					--	/script d(zo_strformat("<<t:1>>", GetUnitName(GetGroupUnitTagByIndex(1))))

					local gName = zo_strformat("<<t:1>>",GetUnitName(unitTag))
					local numAuras = GetNumBuffs(unitTag)

					Srendarr.groupNames[gName] = unitTag -- table of group names to unit tags for use identifying fake aura targets (Phinix)

					Srendarr.groupUnits[unitTag] = {index = s + 199} -- store the group frame order
					Srendarr.AnchorGroupFrames(groupSize, s, numAuras, unitTag, frame1, frame2)
				end
			end
		else
			Srendarr.IsPlayerGrouped = false
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------
-- SLOTTED ABILITY DATA HANDLING
------------------------------------------------------------------------------------------------------------------------------
do
	local GetSlotBoundId		= GetSlotBoundId
	local GetAbilityCastInfo	= GetAbilityCastInfo
	local GetAbilityIcon		= GetAbilityIcon
	local procAbilityNames		= Srendarr.procAbilityNames

	local abilityID, abilityName, slotData, isChannel, castTime, channelTime

	function Srendarr.OnActionSlotsFullUpdate()
		for slot = 3, 8 do
			Srendarr.OnActionSlotUpdated(nil, slot)
		end
	end

	function Srendarr.OnActionSlotUpdated(e, slot)

		if (slot < 3 or slot > 8) then return end -- abort if not a main ability (or ultimate)

		Srendarr.slotData[slot] = {}

		abilityID	= GetSlotBoundId(slot)
		slotData	= Srendarr.slotData[slot]

		if abilityID == 0 then return end -- avoid showing proc on empty slots (Phinix)
		if slotData.abilityID == abilityID then return end -- nothing has changed, abort

		abilityName				= ZOSName(abilityID)

		slotData.abilityID		= abilityID
		slotData.abilityName	= abilityName
		slotData.abilityIcon	= GetAbilityIcon(abilityID)

		isChannel, castTime, channelTime = GetAbilityCastInfo(abilityID)

		if (castTime > 0 or channelTime > 0) then
			slotData.isDelayed		= true			-- check for needing a cast bar
			slotData.isChannel		= isChannel
			slotData.castTime		= castTime
			slotData.channelTime	= channelTime
		else
			slotData.isDelayed		= false
		end

		if (procAbilityNames[abilityName]) then -- this is currently a proc'd ability (or special case for crystal fragments)
			Srendarr:ProcAnimationStart(slot)
		elseif slot ~= 8 then -- cannot have procs on ultimate slot
			Srendarr:ProcAnimationStop(slot)
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------
-- EQUIPMENT CHANGE HANDLING FOR COOLDOWN TRACKING
------------------------------------------------------------------------------------------------------------------------------
do
	local GetGameTimeMillis	= GetGameTimeMilliseconds
	local playerLookup = Srendarr.auraLookup['player']

	function Srendarr.OnEquipChange(bagId,slotId,delayed)

		if (bagId and bagId == 0) and (slotId and (slotId == 13 or slotId == 14)) then return end -- ignore poison slot procs (Phinix)

		local RotPOEquipped = false
		if (delayed) or (not gearSwapDelay) then
			gearSwapDelay = true -- spam control for armory and gear swap addons (Phinix)
			local abilityBarSets = Srendarr.abilityBarSets
			local specialGearSets = Srendarr.specialGearSets
			local abilityCooldowns = Srendarr.abilityCooldowns

			local function GetNormalSet(setId)
				if specialGearSets[setId] then
					return specialGearSets[setId].alt
				elseif abilityBarSets[setId] then
					for k, v in pairs(abilityBarSets[setId]) do
						if abilityCooldowns[v] then
							if abilityCooldowns[v].s1 ~= 0 then
								return abilityCooldowns[v].s1
							end
						end
					end
				end
				return 0
			end
			local function GetPerfectSet(setId)
				if specialGearSets[setId] then
					return specialGearSets[setId].alt
				elseif abilityBarSets[setId] then
					for k, v in pairs(abilityBarSets[setId]) do
						if abilityCooldowns[v] then
							if abilityCooldowns[v].s2 ~= 0 then
								return abilityCooldowns[v].s2
							end
						end
					end
				end
				return 0
			end

			local setTable = {}
			local specialTable = {}
			local allSets = {}
			Srendarr.equippedSets = {}
			Srendarr.equippedSpecial = {}

			if playerLookup[POrderData.ID] then playerLookup[POrderData.ID]:Release() end -- release Pale Order before re-checking if it is equipped (Phinix)

			for k, v in pairs(specialGearSets) do -- release special gear set procs before re-checking (Phinix)
				for id, aura in pairs(playerLookup) do
					if id == v.ID then aura:Release() end
				end
			end
			for k, v in pairs(abilityCooldowns) do -- release standard gear set procs before re-checking (Phinix)
				for id, aura in pairs(playerLookup) do
					if id == k+5000000 then aura:Release() end
				end
			end

			for i = 0, 21 do -- count the total number of set pieces equipped
				local itemLink = GetItemLink(BAG_WORN, i)
			--[[
			--	0	= helm
			--	1	= necklace
			--	2	= chest
			--	3	= shoulders
			--	4	= weapon 1 mainhand (or 2h)
			--	5	= weapon 1 offhand
			--	6	= belt
			--	7	= ?
			--	8	= pants
			--	9	= feet
			--	10	= disguise
			--	11	= ring 1
			--	12	= ring 2
			--	13	= poison 1
			--	14	= poison 2
			--	15	= ?
			--	16	= hands
			--	17	= ?
			--	18	= ?
			--	19	= ?
			--	20	= weapon 2 mainhand (or 2h)
			--	21	= weapon 2 offhand
			--]]
				if itemLink ~= "" then -- this is necessary because numNormalEquipped and numPerfectedEquipped only count items on your active bar (Phinix)
				--	GetItemLinkSetInfo(string itemLink, boolean equipped) - Returns: boolean hasSet, string setName, number numBonuses, number numNormalEquipped, number maxEquipped, number setId, number numPerfectedEquipped
					local hasSet, setName, _, _, maxEquipped, setId = GetItemLinkSetInfo(itemLink, true)
					setName = zo_strformat("<<t:1>>",setName)

					if setId == POrderData.set then -- Pale Order Tracker
						local currentTime = GetGameTimeMillis() / 1000
						local isProminent = false

						if Srendarr.prominentIDs[POrderData.ID] ~= nil then isProminent = true end

						RotPOEquipped = true

						Srendarr.PassToAuraHandler(
							false,
							zo_strformat("<<t:1>>",GetAbilityName(POrderData.ID)),
							'player',
							currentTime,
							currentTime,
							Srendarr.GetRotPOIcon(),
							BUFF_EFFECT_TYPE_BUFF,
							ABILITY_TYPE_NONE,
							POrderData.ID,
							1,
							nil,
							nil,
							isProminent
						)
					end

					local addValue = (GetItemLinkEquipType(itemLink) == EQUIP_TYPE_TWO_HAND) and 2 or 1
					--[[
					--	EQUIP_TYPE_CHEST		3
					--	EQUIP_TYPE_COSTUME		11
					--	EQUIP_TYPE_FEET			10
					--	EQUIP_TYPE_HAND			13
					--	EQUIP_TYPE_HEAD			1
					--	EQUIP_TYPE_LEGS			9
					--	EQUIP_TYPE_MAIN_HAND	14
					--	EQUIP_TYPE_NECK			2
					--	EQUIP_TYPE_OFF_HAND		7
					--	EQUIP_TYPE_ONE_HAND		5
					--	EQUIP_TYPE_POISON		15
					--	EQUIP_TYPE_RING			12
					--	EQUIP_TYPE_SHOULDERS	4
					--	EQUIP_TYPE_TWO_HAND		6
					--	EQUIP_TYPE_WAIST		8
					--]]
					if hasSet then
						local isPerfectedSet = GetItemSetUnperfectedSetId(setId) > 0
						local perfectedName = (isPerfectedSet) and "Perfected " or ""

						if specialGearSets[setId] then
							local normalId
							local perfectId
							if isPerfectedSet then
								perfectId = setId
								normalId = GetNormalSet(setId)
							else
								perfectId = GetPerfectSet(setId)
								normalId = setId
							end
							local setString = tostring(normalId).."-"..tostring(perfectId)

							if specialTable[setString] ~= nil then
								if isPerfectedSet then
									specialTable[setString].pE = specialTable[setString].pE + addValue
									specialTable[setString].pLink = itemLink
								else
									specialTable[setString].nE = specialTable[setString].nE + addValue
									specialTable[setString].nLink = itemLink
								end
							else
								if isPerfectedSet then
									specialTable[setString] = {nE = 0, nId = normalId, nName = "", pE = addValue, pId = perfectId, pName = setName, full = maxEquipped, pLink = itemLink, nLink = ""}
								else
									specialTable[setString] = {nE = addValue, nId = normalId, nName = setName, pE = 0, pId = perfectId, pName = "", full = maxEquipped, pLink = "", nLink = itemLink}
								end
							end
						elseif abilityBarSets[setId] ~= nil then
							local normalId
							local perfectId
							if isPerfectedSet then
								perfectId = setId
								normalId = GetNormalSet(setId)
							else
								perfectId = GetPerfectSet(setId)
								normalId = setId
							end
							local setString = tostring(normalId).."-"..tostring(perfectId)

							if setTable[setString] ~= nil then
								if isPerfectedSet then
									setTable[setString].pE = setTable[setString].pE + addValue
									setTable[setString].pLink = itemLink
								else
									setTable[setString].nE = setTable[setString].nE + addValue
									setTable[setString].nLink = itemLink
								end
							else
								if isPerfectedSet then
									setTable[setString] = {nE = 0, nId = normalId, nName = "", pE = addValue, pId = perfectId, pName = setName, full = maxEquipped, pLink = itemLink, nLink = ""}
								else
									setTable[setString] = {nE = addValue, nId = normalId, nName = setName, pE = 0, pId = perfectId, pName = "", full = maxEquipped, pLink = "", nLink = itemLink}
								end
							end
						end
						if allSets[tonumber(setId)] == nil then
							allSets[tonumber(setId)] = perfectedName..setName
						end
					end
				end
			end

		--	d(setTable)
		--	d(allSets)

			for k, v in pairs(specialTable) do
				if v.nE + v.pE >= v.full then Srendarr.equippedSpecial[v.nId] = {name = v.nName, cLink = (v.pE >= v.full) and v.pLink or v.nLink} end
			end

			for k, v in pairs(setTable) do
				if v.nE + v.pE >= v.full then Srendarr.equippedSets[v.nId] = {name = v.nName, cLink = (v.pE >= v.full) and v.pLink or v.nLink} end
			end

			if Srendarr.db.setIdDebug == true then
				for k, v in pairs(allSets) do
					d(zo_strformat("<<t:1>>", tostring(k)..": "..v))
				end
			end

			if (delayed) then
				gearSwapDelay = false
				local bData = Srendarr.BahseiData

				if Srendarr.equippedSpecial[bData.nSet] ~= nil then -- Bahsei's Mania Tracker
					local function UpdateBahsei()
						local aDesc = GetAbilityDescription(bData.ID)
						local tRes = string.match(aDesc, ":.+%%")
						tRes = (tRes ~= nil and tRes ~= "") and tRes:gsub(':',''):gsub("|r",''):gsub("|c......",''):gsub("%%",'') or "0"

						local sRes = tonumber(tRes)
						local currentTime = GetGameTimeMillis() / 1000
						local isProminent = false

						if Srendarr.prominentIDs[bData.ID] ~= nil then isProminent = true end

						Srendarr.PassToAuraHandler(
							false,
							zo_strformat("<<t:1>>",GetAbilityName(bData.ID)),
							'player',
							currentTime,
							currentTime,
							specialGearSets[bData.nSet].icon,
							BUFF_EFFECT_TYPE_BUFF,
							ABILITY_TYPE_NONE,
							bData.ID,
							1,
							sRes,
							nil,
							isProminent
						)
					end
					UpdateBahsei()
					EVENT_MANAGER:RegisterForEvent('Srendarr_Bahsei', EVENT_POWER_UPDATE, UpdateBahsei)
					EVENT_MANAGER:AddFilterForEvent('Srendarr_Bahsei', EVENT_POWER_UPDATE, REGISTER_FILTER_UNIT_TAG, 'player')
					EVENT_MANAGER:AddFilterForEvent('Srendarr_Bahsei', EVENT_POWER_UPDATE, REGISTER_FILTER_POWER_TYPE, POWERTYPE_MAGICKA)
				else
					if playerLookup[bData.ID] then
						playerLookup[bData.ID]:Release()
					end
					EVENT_MANAGER:UnregisterForEvent('Srendarr_Bahsei', EVENT_POWER_UPDATE)
				end

				Srendarr.OnPlayerActivatedAlive(true)
			else
				Srendarr.OnPlayerActivatedAlive(true)
				zo_callLater(
					function()
						Srendarr.OnEquipChange(bagId,slotId,true)
					end,
				2000 + GetLatency()
				)
			end -- reset spam block after delayed reproc (Phinix)
			return
		else
		--	d("blocked")
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST AND PROMINENT AURAS CONTROL
do ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local STR_PROMBYID				= Srendarr.STR_PROMBYID
	local STR_BLOCKBYID				= Srendarr.STR_BLOCKBYID
	local STR_GROUPBUFFBYID			= Srendarr.STR_GROUPBUFFBYID
	local STR_GROUPDEBUFFBYID		= Srendarr.STR_GROUPDEBUFFBYID

	local DoesAbilityExist			= DoesAbilityExist
	local GetAbilityDuration		= GetAbilityDuration
	local GetAbilityDescription		= GetAbilityDescription
	local GetAbilityName			= GetAbilityName
	local IsAbilityPassive			= IsAbilityPassive

	local maxAbilityID				= Srendarr.maxAbilityID
	local specialNames				= Srendarr.specialNames
	local fakeAuras					= Srendarr.fakeAuras
	local OffBalance				= Srendarr.OffBalance
	local matchedIDs				= {}

	function Srendarr:FindIDByName(auraName, stage, list, tdebug, sType, pOnly)
	--	/script Srendarr:FindIDByName("Ability Name", 1, 1, true)
		local tempInt = (stage == 1) and 0 or 1
		local IdLow = (50000 * stage) - 50000
		local IdHigh = 50000 * stage
		IdLow = (IdLow > 0) and IdLow or 1
		local compareName = ""
		local obiName = OffBalance.nameID
		local obName1 = OffBalance.obN1
		local obName2 = OffBalance.obN2

		if stage == 1 then
			for i in pairs(matchedIDs) do
				matchedIDs[i] = nil -- reset matches
			end
			if (fakeAuras[auraName]) then -- a fake aura exists for this ability, add its ID
				local abilityID = fakeAuras[auraName].abilityID
				table.insert(matchedIDs, abilityID)
			end
			if auraName == obiName then
				table.insert(matchedIDs, OffBalance.ID)
				zo_callLater(function() Srendarr:FindIDByName(auraName, 4, list, tdebug, sType, pOnly) end, 500)
				return
			end
		end

		for i = IdLow, IdHigh do
			local cId = i+tempInt
			if auraName ~= obiName and DoesAbilityExist(cId) then
				compareName = (specialNames[cId] ~= nil) and specialNames[cId].name or zo_strformat("<<t:1>>", GetAbilityName(cId))
			--	if string.find(compareName,auraName) ~= nil then

				if auraName == obName1 or auraName == obName2 then
					if compareName == obName1 or compareName == obName2 then table.insert(matchedIDs, cId) end
				else
					if compareName == auraName then table.insert(matchedIDs, cId) end
				end
			end
			if i == IdHigh then
				if stage == 4 then
					if tdebug then
						if next(matchedIDs) ~= nil then -- matches were found
							for _, id in ipairs(matchedIDs) do
							--	d('['..id ..'] '..zo_strformat("<<t:1>>", id) .. '-' .. GetAbilityDuration(id) .. '-' .. GetAbilityDescription(id))
								d(id.." - "..auraName)
							end
						end
					else
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				-- Prominent Whitelist
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						if list == 1 then
							Srendarr.AuraSearchResults(matchedIDs, auraName, sType, pOnly)
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				-- Group Buff Whitelist
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						elseif list == 2 then
							if next(matchedIDs) ~= nil then -- matches were found
						--	if (#matchedIDs > 0) then -- matches were found
								self.db.groupBuffWhitelist[auraName] = {} -- add a new whitelist entry
								for _, id in ipairs(matchedIDs) do
									self.db.groupBuffWhitelist[auraName][id] = true
								end
								Srendarr:ConfigureAuraHandler() -- update handler ref
								Srendarr:PopulateGroupBuffsDropdown()
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraAddSuccess)) -- inform user of successful addition
							else
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Prominent_AuraAddFail)) -- inform user of failed addition
							end
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				-- Group Debuff Whitelist
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						elseif list == 3 then
							if next(matchedIDs) ~= nil then -- matches were found
						--	if (#matchedIDs > 0) then -- matches were found
								self.db.groupDebuffWhitelist[auraName] = {} -- add a new whitelist entry
								for _, id in ipairs(matchedIDs) do
									self.db.groupDebuffWhitelist[auraName][id] = true
								end
								Srendarr:ConfigureAuraHandler() -- update handler ref
								Srendarr:PopulateGroupDebuffsDropdown()
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraAddSuccess2)) -- inform user of successful addition
							else
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Prominent_AuraAddFail)) -- inform user of failed addition
							end
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				-- Global Blacklist
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						elseif list == 4 then
							if next(matchedIDs) ~= nil then -- matches were found
						--	if (#matchedIDs > 0) then -- matches were found
								self.db.blacklist[auraName] = {} -- add a new blacklist entry
								for _, id in ipairs(matchedIDs) do
									self.db.blacklist[auraName][id] = true
								end
								Srendarr:PopulateFilteredAuras() -- update filtered aura IDs
								Srendarr:PopulateBlacklistAurasDropdown()
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Blacklist_AuraAddSuccess)) -- inform user of successful addition
							else
								CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Blacklist_AuraAddFail)) -- inform user of failed addition
							end
						end
					end
					return
				else
					zo_callLater(function() Srendarr:FindIDByName(auraName, stage+1, list, tdebug, sType, pOnly) end, 500)
					return
				end
			end
		end
	end

	function Srendarr:GroupWhitelistAdd(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_GROUPBUFFBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- number entered, assume is an abilityID
			auraName = tonumber(auraName)
			if (auraName > 0 and auraName < maxAbilityID and DoesAbilityExist(auraName) and (GetAbilityDuration(auraName) > 0 or not IsAbilityPassive(auraName))) then
				-- can only add timed abilities to the group whitelist
				if (not self.db.groupBuffWhitelist[STR_GROUPBUFFBYID]) then
					self.db.groupBuffWhitelist[STR_GROUPBUFFBYID] = {} -- ensure the by ID table is present
				end
				self.db.groupBuffWhitelist[STR_GROUPBUFFBYID][auraName] = true
				CHAT_SYSTEM:AddMessage(string.format('%s: [%d] (%s) %s', L.Srendarr, auraName, ZOSName(auraName), L.Group_AuraAddSuccess)) -- inform user of successful addition
				Srendarr:ConfigureOnCombatEvent()
				Srendarr:ConfigureAuraHandler() -- update handler ref
			else
				CHAT_SYSTEM:AddMessage(string.format('%s: [%s] %s', L.Srendarr, auraName, L.Prominent_AuraAddFailByID)) -- inform user of failed addition
			end
		else
			if (self.db.groupBuffWhitelist[auraName]) then return end -- already added this aura
			Srendarr:FindIDByName(auraName, 1, 2)
		end
	end

	function Srendarr:GroupWhitelistAdd2(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_GROUPDEBUFFBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- number entered, assume is an abilityID
			auraName = tonumber(auraName)
			if (auraName > 0 and auraName < maxAbilityID and DoesAbilityExist(auraName) and (GetAbilityDuration(auraName) > 0 or not IsAbilityPassive(auraName))) then
				-- can only add timed abilities to the group whitelist
				if (not self.db.groupDebuffWhitelist[STR_GROUPDEBUFFBYID]) then
					self.db.groupDebuffWhitelist[STR_GROUPDEBUFFBYID] = {} -- ensure the by ID table is present
				end
				self.db.groupDebuffWhitelist[STR_GROUPDEBUFFBYID][auraName] = true
				CHAT_SYSTEM:AddMessage(string.format('%s: [%d] (%s) %s', L.Srendarr, auraName, ZOSName(auraName), L.Group_AuraAddSuccess2)) -- inform user of successful addition
				Srendarr:ConfigureOnCombatEvent()
				Srendarr:ConfigureAuraHandler() -- update handler ref
			else
				CHAT_SYSTEM:AddMessage(string.format('%s: [%s] %s', L.Srendarr, auraName, L.Prominent_AuraAddFailByID)) -- inform user of failed addition
			end
		else
			if (self.db.groupDebuffWhitelist[auraName]) then return end -- already added this aura
			Srendarr:FindIDByName(auraName, 1, 3)
		end
	end

	function Srendarr:BlacklistAuraAdd(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_BLOCKBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- number entered, assume is an abilityID
			auraName = tonumber(auraName)
			if (auraName > 0 and auraName < maxAbilityID+5000000) then -- sanity check on the ID given
			-- add 4000000 to allow to blacklist individual proc cooldowns so you can still track the ones you care about (Phinix)
				if (not self.db.blacklist[STR_BLOCKBYID]) then
					self.db.blacklist[STR_BLOCKBYID] = {} -- ensure the by ID table is present
				end
				self.db.blacklist[STR_BLOCKBYID][auraName] = true
				Srendarr:PopulateFilteredAuras() -- update filtered aura IDs
				CHAT_SYSTEM:AddMessage(string.format('%s: [%d] (%s) %s', L.Srendarr, auraName, ZOSName(auraName), L.Blacklist_AuraAddSuccess)) -- inform user of successful addition
			else
				CHAT_SYSTEM:AddMessage(string.format('%s: [%s] %s', L.Srendarr, auraName, L.Blacklist_AuraAddFailByID)) -- inform user of failed addition
			end
		else
			if (self.db.blacklist[auraName]) then return end -- already added this aura
			Srendarr:FindIDByName(auraName, 1, 4)
		end
	end

	function Srendarr:GroupAuraRemove(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_GROUPBUFFBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- trying to remove by number, assume is an abilityID
			auraName = tonumber(auraName)
			if (self.db.groupBuffWhitelist[STR_GROUPBUFFBYID][auraName]) then -- ID is in list, remove and inform user
				self.db.groupBuffWhitelist[STR_GROUPBUFFBYID][auraName] = nil
				Srendarr:ConfigureAuraHandler() -- update handler ref
				CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraRemoved)) -- inform user of removal
			end
		else
			if (not self.db.groupBuffWhitelist[auraName]) then return end -- not in whitelist, abort
			for id in pairs(self.db.groupBuffWhitelist[auraName]) do
				self.db.groupBuffWhitelist[auraName][id] = nil -- clean out whitelist entry
			end
			self.db.groupBuffWhitelist[auraName] = nil -- remove whitelist entrys
			Srendarr:ConfigureAuraHandler() -- update handler ref
			CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraRemoved)) -- inform user of removal
		end
	end

	function Srendarr:GroupAuraRemove2(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_GROUPDEBUFFBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- trying to remove by number, assume is an abilityID
			auraName = tonumber(auraName)
			if (self.db.groupDebuffWhitelist[STR_GROUPDEBUFFBYID][auraName]) then -- ID is in list, remove and inform user
				self.db.groupDebuffWhitelist[STR_GROUPDEBUFFBYID][auraName] = nil
				Srendarr:ConfigureAuraHandler() -- update handler ref
				CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraRemoved2)) -- inform user of removal
			end
		else
			if (not self.db.groupDebuffWhitelist[auraName]) then return end -- not in whitelist, abort
			for id in pairs(self.db.groupDebuffWhitelist[auraName]) do
				self.db.groupDebuffWhitelist[auraName][id] = nil -- clean out whitelist entry
			end
			self.db.groupDebuffWhitelist[auraName] = nil -- remove whitelist entrys
			Srendarr:ConfigureAuraHandler() -- update handler ref
			CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Group_AuraRemoved2)) -- inform user of removal
		end
	end

	function Srendarr:BlacklistAuraRemove(auraName)
		auraName = zo_strformat("<<t:1>>", auraName) -- strip out any control characters player may have entered
		if auraName == STR_BLOCKBYID then return end -- make sure we don't mess with internal table
		if (tonumber(auraName)) then -- trying to remove by number, assume is an abilityID
			auraName = tonumber(auraName)
			if (self.db.blacklist[STR_BLOCKBYID][auraName]) then -- ID is in list, remove and inform user
				self.db.blacklist[STR_BLOCKBYID][auraName] = nil
				Srendarr:PopulateFilteredAuras() -- update filtered aura IDs
				CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Blacklist_AuraRemoved)) -- inform user of removal
			end
		else
			if (not self.db.blacklist[auraName]) then return end -- not in blacklist, abort
			for id in pairs(self.db.blacklist[auraName]) do
				self.db.blacklist[auraName][id] = nil -- clean out blacklist entry
			end
			self.db.blacklist[auraName] = nil -- remove blacklist entrys
			Srendarr:PopulateFilteredAuras() -- update filtered aura IDs
			CHAT_SYSTEM:AddMessage(string.format('%s: %s %s', L.Srendarr, auraName, L.Blacklist_AuraRemoved)) -- inform user of removal
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------
-- UI HELPER FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------
do
	local math_abs				= math.abs
	local WM					= WINDOW_MANAGER

	function Srendarr:GetEdgeRelativePosition(object)
		local left, top     = object:GetLeft(),		object:GetTop()
		local right, bottom = object:GetRight(),	object:GetBottom()
		local rootW, rootH  = GuiRoot:GetWidth(),	GuiRoot:GetHeight()
		local point         = 0
		local x, y

		if (left < (rootW - right) and left < math_abs((left + right) / 2 - rootW / 2)) then
			x, point = left, 2 -- 'LEFT'
		elseif ((rootW - right) < math_abs((left + right) / 2 - rootW / 2)) then
			x, point = right - rootW, 8 -- 'RIGHT'
		else
			x, point = (left + right) / 2 - rootW / 2, 0
		end

		if (bottom < (rootH - top) and bottom < math_abs((bottom + top) / 2 - rootH / 2)) then
			y, point = top, point + 1 -- 'TOP|TOPLEFT|TOPRIGHT'
		elseif ((rootH - top) < math_abs((bottom + top) / 2 - rootH / 2)) then
			y, point = bottom - rootH, point + 4 -- 'BOTTOM|BOTTOMLEFT|BOTTOMRIGHT'
		else
			y = (bottom + top) / 2 - rootH / 2
		end

		point = (point == 0) and 128 or point -- 'CENTER'
		return point, x, y
	end

	function Srendarr.AddControl(parent, cType, level)
		local c = WM:CreateControl(nil, parent, cType)
		c:SetDrawLayer(DL_OVERLAY)
		c:SetDrawLevel(level)
		return c, c
	end

	function Srendarr:GetGroupBuffTab()
		local groupSize = GetGroupSize()
		if groupSize <= 4 then
			return Srendarr.GROUP_BUFFS
		elseif groupSize >= 5 then
			return Srendarr.RAID_BUFFS
		end
	end

	function Srendarr:GetGroupDebuffTab()
		local groupSize = GetGroupSize()
		if groupSize <= 4 then
			return Srendarr.GROUP_DEBUFFS
		elseif groupSize >= 5 then
			return Srendarr.RAID_DEBUFFS
		end
	end

	local function Show()
		for i = 1, Srendarr.NUM_DISPLAY_FRAMES do
			if Srendarr.displayFrames[i] ~= nil then
				Srendarr.displayFrames[i]:SetHidden(false)
			end
		end
		Srendarr:ConfigureOnCombatState()
	end
	local function Hide()
		for i = 1, Srendarr.NUM_DISPLAY_FRAMES do
			if Srendarr.displayFrames[i] ~= nil then
				Srendarr.displayFrames[i]:SetHidden(true)
			end
		end
	end
	function Srendarr:HideInMenus() -- hide auras in menus except the move mouse cursor mode (Phinix)
		local hudScene = SCENE_MANAGER:GetScene("hud")
		hudScene:RegisterCallback("StateChange", function(oldState, newState)
			if newState == SCENE_HIDDEN then
				if SCENE_MANAGER:GetNextScene():GetName() ~= "hudui" then
					Srendarr.uiHidden = true
					Hide()
				end
			elseif newState == SCENE_SHOWN then
				Srendarr.PassReticleChange()
				Srendarr.uiHidden = false
				Show()
			--	Srendarr.OnEquipChange(true)
			end
		end)
	end
end


EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_ADD_ON_LOADED, Srendarr.OnInitialize)
EVENT_MANAGER:RegisterForEvent(Srendarr.name, EVENT_PLAYER_ACTIVATED, Srendarr.PlayerLoaded)
