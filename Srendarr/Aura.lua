local Srendarr		= _G['Srendarr'] -- grab addon table from global
local L				= Srendarr:GetLocale()
local LMP			= LibMediaProvider
local Aura			= {}

-- CONSTS --
local AURA_TYPE_TIMED		= Srendarr.AURA_TYPE_TIMED
local AURA_TYPE_TOGGLED		= Srendarr.AURA_TYPE_TOGGLED
local AURA_TYPE_PASSIVE		= Srendarr.AURA_TYPE_PASSIVE
local DEBUFF_TYPE_PASSIVE	= Srendarr.DEBUFF_TYPE_PASSIVE
local DEBUFF_TYPE_TIMED		= Srendarr.DEBUFF_TYPE_TIMED

local AURA_HEIGHT			= Srendarr.AURA_HEIGHT

local AURA_STYLE_FULL		= Srendarr.AURA_STYLE_FULL
local AURA_STYLE_ICON		= Srendarr.AURA_STYLE_ICON
local AURA_STYLE_MINI		= Srendarr.AURA_STYLE_MINI
local AURA_STYLE_GROUPB		= Srendarr.AURA_STYLE_GROUPB
local AURA_STYLE_GROUPD		= Srendarr.AURA_STYLE_GROUPD

local AURA_TIMERLOC_HIDDEN	= Srendarr.AURA_TIMERLOC_HIDDEN
local AURA_TIMERLOC_OVER	= Srendarr.AURA_TIMERLOC_OVER
local AURA_TIMERLOC_ABOVE	= Srendarr.AURA_TIMERLOC_ABOVE
local AURA_TIMERLOC_BELOW	= Srendarr.AURA_TIMERLOC_BELOW

local GROUP_START_FRAME		= Srendarr.GROUP_START_FRAME
local GROUP_DSTART_FRAME	= Srendarr.GROUP_DSTART_FRAME

-- UPVALUES --
local WM					= WINDOW_MANAGER
local TEXT_ALIGN_TOP		= TEXT_ALIGN_TOP
local TEXT_ALIGN_BOTTOM		= TEXT_ALIGN_BOTTOM
local TEXT_ALIGN_CENTER		= TEXT_ALIGN_CENTER
local TEXT_ALIGN_LEFT		= TEXT_ALIGN_LEFT
local TEXT_ALIGN_RIGHT		= TEXT_ALIGN_LEFT
local GetGameTimeMillis		= GetGameTimeMilliseconds
local strformat				= string.format
local math_floor			= math.floor
local tremove				= table.remove
local tinsert				= table.insert
local zo_strformat			= zo_strformat
local AddControl			= Srendarr.AddControl

local tTenths				= L.Time_Tenths
local tTenthsNS				= L.Time_TenthsNS
local tSec					= L.Time_Seconds
local tSecNS				= L.Time_SecondsNS
local tMin					= L.Time_Minutes
local tHour					= L.Time_Hours
local tDay					= L.Time_Days
local tToggle				= L.Time_Toggle
local tPassive				= L.Time_Passive

local bData					= Srendarr.BahseiData
local auraLookup			= Srendarr.auraLookup
local stackingAuras			= Srendarr.stackingAuras
local maxAbilityID			= Srendarr.maxAbilityID
local grimProcs				= Srendarr.grimProcs
local grimBase				= Srendarr.grimBase

local auraID				= 1		-- incremental counter to give each aura object a unique identifier
local activeTimedAuras		= {}	-- all active auras with timers, referenced by their auraID
local currentTime, colors, iconColors
local showSeconds, showSSeconds, showTenths

Srendarr.PassToDisplayFrame = {}

-- ------------------------
-- CONFIGURE ABILITY ID DISPLAY
-- ------------------------
local showAbilityID			= false

function Srendarr:ConfigureDisplayAbilityID()
	showAbilityID = self.db.displayAbilityID
end


-- ------------------------
-- TIME FORMAT FUNCTION
-- ------------------------
local function FormatTime(remaining, frame)
	frame = (frame < GROUP_START_FRAME) and frame or (frame < GROUP_DSTART_FRAME) and Srendarr:GetGroupBuffTab() or Srendarr:GetGroupDebuffTab()
	if remaining <= 0 then -- Hide when expires
		return ""
	elseif (showTenths ~= 0) and (remaining < showTenths) then -- seconds + 10ths of seconds
		return (showSSeconds) and strformat(tTenths, remaining) or strformat(tTenthsNS, remaining)
	elseif remaining < 60 then -- seconds
		return (showSSeconds) and strformat(tSec, remaining+1) or strformat(tSecNS, remaining+1)
	elseif remaining < 3600 then -- minutes
		if (showSeconds) then
			local minutes = math_floor(remaining / 60)
			local minutestring = strformat(tMin, minutes)
			local secondstring = strformat(tSec, math_floor(remaining - (minutes * 60)))
			return minutestring..secondstring
		else
			return strformat(tMin, math_floor((remaining / 60) + 0.5))
		end
	elseif remaining > 172800 then -- days (2+, revert to hours when between 24-48hrs)
		return strformat(tDay, math_floor(remaining / 86400))
	else -- hours
		if (Srendarr.db.displayFrames[frame].timerHMS) then
			local sub = math_floor(remaining / 3600) * 60
			local hours = math_floor(remaining / 3600)
			local hourstring = strformat(tHour, hours)
			local minutes = math_floor(remaining / 60) - sub
			local minutestring = strformat(tMin, minutes)
			local secondstring = strformat(tSec, math_floor(remaining - (hours * 3600) - (minutes * 60)))
			if minutes > 0 then
				return hourstring..minutestring
			else
				return hourstring..secondstring
			end
		else
			return strformat(tHour, math_floor(remaining / 3600)).."+"
		end
	end
end

function Srendarr:ConfigureTimeSettings()
	showSeconds = self.db.showSeconds
	showSSeconds = self.db.showSSeconds
	showTenths = self.db.showTenths
end


-- ------------------------
-- TOOLTIP HANDLERS
-- ------------------------
local function OnMouseEnter(aura)
	local equippedSets = Srendarr.equippedSets
	local abilityBarSets = Srendarr.abilityBarSets
	local pCast = aura.pCast
	local unitTag = aura.unitTag
	local aId = aura.abilityID -- below strips Srendarr prefix class identifier from custom ability ID's in order to check if the base game has a description for it (Phinix)
	local abilityOffset = (aId-5000000 > 0) and aId-5000000 or (aId-4000000 > 0) and aId-4000000 or (aId-3000000 > 0) and aId-3000000 or (aId-2000000 > 0) and aId-2000000 or (aId-1000000 > 0) and aId-1000000 or aId

	if (pCast) then -- only show specialized tooltips for gear procs on the player (Phinix)
		for k, v in pairs(equippedSets) do
			if abilityBarSets[k] ~= nil then
				for i, cId in ipairs(abilityBarSets[k]) do
					if cId == abilityOffset then
						InitializeTooltip(InformationTooltip, aura, TOPRIGHT, 0, - 2, BOTTOMLEFT)
						InformationTooltip:AddLine(zo_strupper(v.name), 'ZoFontHeader2', 1, 1, 1, CENTER, MODIFY_TEXT_TYPE_NONE, CENTER, false)
						InformationTooltip:AddVerticalPadding(10)
						local _, _, numBonuses = GetItemLinkSetInfo(v.cLink)
						for bonusIndex = 1, numBonuses do
							local _, bDesc = GetItemLinkSetBonusInfo(v.cLink, true, bonusIndex)
							if bonusIndex > 1 then
								InformationTooltip:AddVerticalPadding(-5)
							end
							InformationTooltip:AddLine(bDesc, 'ZoFontWinH5', 0.7725, 0.7608, 0.6196, LEFT, MODIFY_TEXT_TYPE_NONE, TEXT_ALIGN_LEFT, false)
						end
						InformationTooltip:AddVerticalPadding(10)
						InformationTooltip:AddLine("|c67b1e9S|c4779ce'rendarr|r ID: "..tostring(aId), 'ZoFontWinH5', 1, 1, 1, CENTER, MODIFY_TEXT_TYPE_NONE, CENTER, false)
						return
					end
				end
			end
		end
	end

	for i = 1, GetNumBuffs(unitTag) do -- handle tooltips for game-supported effects that show on stat sheet (Phinix)
		local buffName, timeStarted, timeEnding, buffSlot, stackCount, iconFilename, buffType, effectType, abilityType, statusEffectType, abilityId, _, castByPlayer = GetUnitBuffInfo(unitTag, i)
		if abilityId == abilityOffset then
			if (abilityOffset < maxAbilityID and GetAbilityDescription(abilityOffset) ~= '') then
				InitializeTooltip(InformationTooltip, aura, TOPRIGHT, 0, - 2, BOTTOMLEFT)
				InformationTooltip:SetAbilityId(abilityOffset)
				InformationTooltip:AddVerticalPadding(10)
				InformationTooltip:AddLine("|c67b1e9S|c4779ce'rendarr|r ID: "..tostring(aId), 'ZoFontWinH5', 1, 1, 1, CENTER, MODIFY_TEXT_TYPE_NONE, CENTER, false)
			else
				InitializeTooltip(InformationTooltip, aura, TOPRIGHT, 0, - 2, BOTTOMLEFT)
				InformationTooltip:SetBuff(buffSlot, unitTag)
				InformationTooltip:AddLine("|c67b1e9S|c4779ce'rendarr|r ID: "..tostring(aId), 'ZoFontWinH5', 1, 1, 1, CENTER, MODIFY_TEXT_TYPE_NONE, CENTER, false)
			end
			return
		end
	end

	-- catch other random tooltips (Phinix)
	InitializeTooltip(InformationTooltip, aura, TOPRIGHT, 0, - 2, BOTTOMLEFT)
	if (abilityOffset < maxAbilityID and GetAbilityDescription(abilityOffset) ~= '') then
		InformationTooltip:SetAbilityId(abilityOffset)
		InformationTooltip:AddVerticalPadding(10)
	else
		SetTooltipText(InformationTooltip, aura.auraName)
		InformationTooltip:AddVerticalPadding(5)
	end
	InformationTooltip:AddLine("|c67b1e9S|c4779ce'rendarr|r ID: "..tostring(aId), 'ZoFontWinH5', 1, 1, 1, CENTER, MODIFY_TEXT_TYPE_NONE, CENTER, false)
end

local function OnMouseExit()
	ClearTooltip(InformationTooltip)
end

local function OnMouseUp(aura, button, upInside)
	if button == 2 and (upInside) then -- right-click cancel eligible auras (Phinix)
		local abilityID = aura.abilityID

		local numAuras = GetNumBuffs('player')
		for i = 1, numAuras do
		--	local buffName, startTime, endTime, buffSlot, stackCount, iconFile, buffType, effectType, abilityType, statusEffectType, abilityId, canClickOff = GetUnitBuffInfo("player", i)
			local _, _, _, buffSlot, _, _, _, _, _, _, abilityIDb, canClickOff = GetUnitBuffInfo("player", i)
			if abilityIDb == abilityID then
				CancelBuff(buffSlot)
				auraLookup['player'][abilityID]:Release()
			end
		end
	end
end


-- ------------------------
-- TIMER UPDATE HANDLER
do ------------------------
	local RATE				= Srendarr.AURA_UPDATE_RATE
	local math_max			= math.max
	local GetFormattedTime	= FormatTime

	local timedAuras		= activeTimedAuras
	local auraFadeTime		= -2 -- need a base value before being set by config
	local nextUpdate		= 0
	local timeRemaining

	local function OnUpdate(self, updateTime)
		if updateTime >= nextUpdate then
			for _, aura in pairs(timedAuras) do
				auraFadeTime = aura.fadeTime * -1
				timeRemaining = aura.finish - updateTime

				if timeRemaining <= auraFadeTime then -- expired and finished fading, done
					aura:Release()

					-- re-populate the passive "ready" icon when cooldown action bar timers expire (Phinix)
					local tId = aura.abilityID - 5000000
					if tId > 0 then
						local GROUP_CDBAR = Srendarr.GROUP_CDBAR
						if Srendarr.db.auraGroups[GROUP_CDBAR] ~= 0 then
							local equippedSets = Srendarr.equippedSets
							local abilityBarSets = Srendarr.abilityBarSets
							local abilityCooldowns = Srendarr.abilityCooldowns
							local filteredAuras = Srendarr.filteredAuras
							for k, v in pairs(equippedSets) do
								if abilityBarSets[k] ~= nil then
									for i, cId in ipairs(abilityBarSets[k]) do
										if cId == tId then
											if abilityCooldowns[cId] ~= nil then
												local abID = cId+5000000
												local currentTime = GetGameTimeMillis() / 1000
												local abName = (abilityCooldowns[cId].altName ~= nil) and abilityCooldowns[cId].altName or GetAbilityName(cId)
												local abIcon = (abilityCooldowns[cId].altIcon ~= nil) and abilityCooldowns[cId].altIcon or GetAbilityIcon(cId)
												if filteredAuras['player'] ~= nil then
													if not filteredAuras['player'][abID] then
														if auraLookup['player'][abID] then auraLookup['player'][abID]:Release() end
														local isProminent = (Srendarr.prominentIDs[abilityId] ~= nil) and true or false -- only need to check main prominent table since gear cooldowns in Srendarr can only be player cast (Phinix)
														Srendarr.PassToDisplayFrame(false, GROUP_CDBAR, AURA_TYPE_PASSIVE, abName, 'player', currentTime, currentTime, abIcon, BUFF_EFFECT_TYPE_BUFF, ABILITY_TYPE_NONE, abID, 0, true, isProminent, true)
													end
												end
											end
										end
									end
								end
							end
						end
					end
				elseif timeRemaining <= 0 then -- expired, but not done fading yet
					if (not aura.isFading) then
						aura:SetExpired() -- set expired if we should be but aren't yet
					end

					aura:SetAlpha(math_max(0, 1 - (timeRemaining / auraFadeTime)))
				else -- normal countdown
					aura.bar:SetValue(1 - ((updateTime - aura.start) / (aura.finish - aura.start)))

					if (aura.auraType == AURA_TYPE_TIMED or aura.auraType == DEBUFF_TYPE_TIMED) then -- use timer for stack tracking when in icon mode (Phinix)
						aura.timer:SetText(GetFormattedTime(timeRemaining, Srendarr.db.auraGroups[aura.auraGroup]))
					else
						aura.timer:SetText('')
					end
				end
			end

			nextUpdate = updateTime + RATE
		end
	end

	Srendarr:SetHandler('OnUpdate', OnUpdate)

	function Srendarr:ConfigureAuraFadeTime(frame)
		if frame and frame ~= 0 then
			local displayDB = Srendarr.db.displayFrames
			local displayFrame = Srendarr.displayFrames[frame]

			for k, v in pairs(displayFrame.aurasActive) do
				v.fadeTime = displayDB[frame].auraFadeTime
			end
		end

	--	auraFadeTime = self.db.auraFadeTime * -1
	end
end


-- ------------------------
-- AURA
-- ------------------------
function Aura:Create(displayParent)
	local aura, ctrl

	aura, ctrl = AddControl(displayParent, CT_TEXTURE, 2)
	ctrl:SetDimensions(AURA_HEIGHT, AURA_HEIGHT)

	-- ICON BACKGROUND
	aura.iconBG, ctrl = AddControl(aura, CT_BACKDROP, 3)
	ctrl:SetDimensions(AURA_HEIGHT - 6, AURA_HEIGHT - 6)
	ctrl:SetAnchor(CENTER)
	ctrl:SetCenterColor( 0,0,0,1 )
	ctrl:SetEdgeColor( 0,0,0,1 )
	-- ICON
	aura.icon, ctrl = AddControl(aura, CT_TEXTURE, 3)
	ctrl:SetDimensions(AURA_HEIGHT - 6, AURA_HEIGHT - 6)
	ctrl:SetAnchor(CENTER)
	-- CD BACKGROUND
	aura.cdBG, ctrl = AddControl(aura, CT_BACKDROP, 2)
	ctrl:SetDimensions(AURA_HEIGHT, AURA_HEIGHT)
	ctrl:SetAnchor(CENTER)
	ctrl:SetCenterColor( 0,0,0,1 )	
	ctrl:SetEdgeColor( 0,0,0,1 )
	-- COOLDOWN
	aura.cooldown, ctrl = AddControl(aura.cdBG, CT_COOLDOWN, 2)
	ctrl:SetDimensions(AURA_HEIGHT, AURA_HEIGHT)
	ctrl:SetAnchor(CENTER)
	ctrl:SetHidden(true)
	-- GEAR PROC READY
	aura.proc, ctrl = AddControl(aura, CT_TEXTURE, 4)
	ctrl:SetDimensions(AURA_HEIGHT, AURA_HEIGHT)
	ctrl:SetAnchor(CENTER)
	ctrl:SetTexture([[esoui/art/actionbar/abilityhighlight_mage_med.dds]])
	ctrl:SetBlendMode(TEX_BLEND_MODE_ADD)
--	ctrl:SetDrawLevel(2)
	ctrl:SetHidden(true)
	aura.loopTexture = ctrl
	aura.loop = ANIMATION_MANAGER:CreateTimelineFromVirtual('UltimateReadyLoop', ctrl)
	aura.loop:SetHandler('OnStop', function()
		aura.loopTexture:SetHidden(true)
	end)
	aura.isPlaying = false
	-- TOGGLED HIGHLIGHT
	aura.highlight, ctrl = AddControl(aura, CT_TEXTURE, 3)
	ctrl:SetDimensions(AURA_HEIGHT -2, AURA_HEIGHT -2)
	ctrl:SetAnchor(CENTER)
	ctrl:SetTexture([[/esoui/art/actionbar/actionslot_toggledon.dds]])
	ctrl:SetHidden(true)
	-- LABELS
	aura.name, ctrl = AddControl(aura, CT_LABEL, 4)
	ctrl:SetVerticalAlignment(TEXT_ALIGN_BOTTOM)
	ctrl:SetInheritScale(false)
	aura.timer, ctrl = AddControl(aura, CT_LABEL, 4)
	ctrl:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
	ctrl:SetInheritScale(false)
	-- BAR
	aura.bar, ctrl = AddControl(aura, CT_STATUSBAR, 2)
	ctrl:SetHeight(16)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_genericfill.dds]])
	ctrl:SetTextureCoords(0, 1, 0, 0.625)
	ctrl:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge.dds]], 8, 32)
	ctrl:SetLeadingEdgeTextureCoords(0, 1, 0, 0.625)
	ctrl:EnableLeadingEdge(true)
	ctrl:SetMinMax(0, 1)
	ctrl:SetHandler('OnValueChanged', function(bar, value) bar.gloss:SetValue(value) end) -- change gloss value as main bar changes
	-- BAR GLOSS
	aura.bar.gloss, ctrl = AddControl(aura.bar, CT_STATUSBAR, 3)
	ctrl:SetHeight(16)
	ctrl:SetAnchor(TOPLEFT)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_genericfill_gloss.dds]])
	ctrl:SetTextureCoords(0, 1, 0, 0.625)
	ctrl:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge_gloss.dds]], 8, 32)
	ctrl:SetLeadingEdgeTextureCoords(0, 1, 0, 0.625)
	ctrl:EnableLeadingEdge(true)
	ctrl:SetMinMax(0, 1)
	-- BAR FRAME
	aura.barBorderL, ctrl = AddControl(aura.bar, CT_TEXTURE, 4)
	ctrl:SetDimensions(10, 16)
	ctrl:SetAnchor(TOPLEFT)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_frame.dds]])
	aura.barBorderR, ctrl = AddControl(aura.bar, CT_TEXTURE, 4)
	ctrl:SetDimensions(10, 16)
	ctrl:SetAnchor(TOPRIGHT)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_frame.dds]])
	aura.barBorderM, ctrl = AddControl(aura.bar, CT_TEXTURE, 4)
	ctrl:SetHeight(16)
	ctrl:SetAnchor(TOPLEFT, aura.bar, TOPLEFT, 10, 0)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_frame.dds]])
	ctrl:SetTextureCoords(0.019500000402331, 0.58980000019073, 0, 0.625)
	-- BAR BACKDROP
	aura.barBackdropEnd, ctrl = AddControl(aura.bar, CT_TEXTURE, 1)
	ctrl:SetDimensions(10, 16)
	ctrl:SetTexture([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge.dds]])
	ctrl:SetColor(0,0,0,0.4)
	aura.barBackdrop, ctrl = AddControl(aura.bar, CT_TEXTURE, 1)
	ctrl:SetHeight(16)
	ctrl:SetTexture('')
	ctrl:SetColor(0,0,0,0.4)

	aura.displayParent		= displayParent
	aura.auraID				= auraID
	auraID					= auraID + 1

	aura.highlightToggled	= false	-- will both be set by the Configure function
	aura.barColors			= {}
	aura.cooldownColors		= {}

	-- aura exec
	aura['Initialize']		= Aura.Initialize
	aura['Update']			= Aura.Update
	aura['SetExpired']		= Aura.SetExpired
	aura['Release']			= Aura.Release
	-- configuration
	aura['Configure']		= Aura.Configure
	aura['UpdateVisuals']	= Aura.UpdateVisuals

	return aura
end


-- ------------------------
-- AURA EXECUTION
do ------------------------
	local alteredIcons = Srendarr.alteredAuraIcons

	function Aura:Initialize(auraFadeTime, auraGroup, auraType, auraName, unitTag, start, finish, icon, effectType, abilityType, abilityID, stacks, isActionBar, pCast)
		self.auraGroup			= auraGroup
		self.fadeTime			= auraFadeTime
		self.auraType			= auraType
		self.auraName			= zo_strformat("<<t:1>>", auraName)
		self.unitTag			= unitTag or 'notag' -- ensure something is set here
		self.start				= start
		self.finish				= finish
		self.effectType			= effectType
		self.abilityType		= abilityType
		self.abilityID			= abilityID
		self.pCast				= pCast
		self.stacks				= (stacks ~= nil) and stacks or 0
		self.duration			= (start == finish) and 1000000 or finish - start
		self.isFading			= false		-- make sure to note aura is enabled again

		local parentID			= self.displayParent.displayID
		local displayDB			= Srendarr.db.displayFrames
		local procAnims			= Srendarr.db.gearProcAnims
		local grimProcAnims		= Srendarr.db.grimProcAnims
		local abilityCooldowns	= Srendarr.abilityCooldowns
		local grimBase			= Srendarr.grimBase
		local grimProcs			= Srendarr.grimProcs
		local displayID = (parentID < GROUP_START_FRAME) and parentID or (parentID < GROUP_DSTART_FRAME) and Srendarr:GetGroupBuffTab() or Srendarr:GetGroupDebuffTab()

		if not abilityID then return end -- safety check

		local aId = abilityID
		local isCDBar = (aId-5000000 > 0) and true or false
		local abilityOffset = (aId-5000000 > 0) and aId-5000000 or (aId-4000000 > 0) and aId-4000000 or (aId-3000000 > 0) and aId-3000000 or (aId-2000000 > 0) and aId-2000000 or (aId-1000000 > 0) and aId-1000000 or aId


	local sampleAuraData = Srendarr.sampleAuraData

		if sampleAuraData[abilityID] then -- disable mouse interaction with sample auras to allow moving frames when shown (Phinix)
			self:SetMouseEnabled(false)
		else
			self:SetMouseEnabled(true)
		end

		self.proc:SetDimensions(AURA_HEIGHT, AURA_HEIGHT)

		if grimProcs[abilityOffset] then -- Grim Focus (Phinix)
			local mAbility = grimProcs[abilityOffset]
			local sAbility = abilityOffset
			local hasPassive = false
			local numAuras = GetNumBuffs('player')
			for i = 1, numAuras do -- reset last stack count if passive not present when ability is cast (Phinix)
				local _, _, _, _, tStacks, _, _, _, _, _, tAbility = GetUnitBuffInfo('player', i)
				if tAbility == mAbility then
					hasPassive = true
					Srendarr.db.grimTracker[sAbility] = tStacks
				end
			end
			if not hasPassive then Srendarr.db.grimTracker[sAbility] = 0 end
			self.stacks = Srendarr.db.grimTracker[sAbility] -- set the current stacks to saved value for Grim Focus morph when passive exists (Phinix)
		end

		-- used to add stacks to name of auras that have them (Phinix)
		local stackString = (stackingAuras[abilityOffset]) and "\(" .. tostring(self.stacks) .. "\)" or ""

		if abilityOffset == bData.ID then stackString = "|c00ff00" .. tostring(self.stacks) .. "\%|r" end -- Bahsei's Mania

		auraLookup[unitTag][abilityID] = self -- add self to the aura lookup reference

		if (displayDB[displayID].style == AURA_STYLE_MINI) then
			if (self.cooldown) then self.cooldown:SetHidden(true) end
			if (self.iconBG) then self.iconBG:SetHidden(true) end
			if (self.cdBG) then self.cdBG:SetHidden(true) end
		else
			if (self.iconBG) then self.iconBG:SetHidden(false) end
			if (self.cdBG) then self.cdBG:SetHidden(false) end
			if start == finish and displayDB[displayID].auraCooldown then
				if (self.cooldown) then self.cooldown:SetHidden(true) end -- hide cooldown animation if no duration
			end
		end

		local aName = ((isCDBar) and (Srendarr.db.gearProcCDText)) and self.auraName.." ".."\("..tostring(abilityCooldowns[abilityOffset].CD).."s\)" or self.auraName
		if self.auraStyle == AURA_STYLE_GROUPB or self.auraStyle == AURA_STYLE_GROUPD then
			self.name:SetText("")
		else
			if self.auraStyle ~= AURA_STYLE_ICON then
				if (showAbilityID) then
					self.name:SetText(aName .. " " .. stackString .. ' [' .. abilityOffset .. ']')
				else
					self.name:SetText(aName .. " " .. stackString)
				end
			else
				if (showAbilityID) then
					self.name:SetText(abilityOffset)
				else
					self.name:SetText(stackString)
				end
			end
		end

	--	if displayDB[displayID].auraCooldown then -- change icon size based on display mode
	--		self.icon:SetDimensions(AURA_HEIGHT - 6, AURA_HEIGHT - 6)
	--	else
	--		self.icon:SetDimensions(AURA_HEIGHT - 2, AURA_HEIGHT - 2)
	--	end

		self.icon:SetTexture((alteredIcons[abilityOffset]) and alteredIcons[abilityOffset] or icon)

		if grimProcs[abilityOffset] then -- Grim Focus (Phinix)
			local procID = grimProcs[abilityID]
			self.proc:SetDimensions(AURA_HEIGHT - 6, AURA_HEIGHT - 6)
			if self.stacks == 5 then
				self.icon:SetTexture('/esoui/art/icons/ability_rogue_058.dds')
				if (grimProcAnims) then
					if not self.isPlaying then
						self.loopTexture:SetHidden(false)
						self.loop:PlayFromStart()
						self.isPlaying = true
					end
				end
			else
				self.icon:SetTexture(grimBase[procID].icon)
				if self.isPlaying then
					self.loopTexture:SetHidden(true)
					self.loop:Stop()
					self.isPlaying = false
				end
			end
		end

		self.icon:SetDesaturation(0)
		self.highlight:SetHidden(true)
		self:SetAlpha(1)

		local tText = ""

		if (auraType == AURA_TYPE_TIMED or auraType == DEBUFF_TYPE_TIMED) then
			currentTime = GetGameTimeMillis() / 1000
			tText = FormatTime(finish - currentTime, Srendarr.db.auraGroups[auraGroup])
			self.bar:SetValue(1 - ((currentTime - start) / (finish - start)))

			if (displayDB[displayID].auraCooldown and displayDB[displayID].style ~= AURA_STYLE_MINI) then
				if (self.cooldown) then
					self.cooldown:StartCooldown( ( finish - currentTime ) * 1000 , ( finish - start ) * 1000 , CD_TYPE_RADIAL, CD_TIME_TYPE_TIME_UNTIL, false )
					self.cooldown:SetHidden(false)   
				end
			end

			activeTimedAuras[self.auraID] = self -- is a timed aura, add to timer tracking table (used in OnUpdate)

			if (self.cooldown) then
				iconColors = self.cooldownColors[auraType]
				self.cooldown:SetFillColor(iconColors.r1, iconColors.g1, iconColors.b1, 1)
			end
			if isCDBar then
				self.icon:SetDesaturation(1)
				self.loopTexture:SetHidden(true)
				self.loop:Stop()
				self.isPlaying = false
			end -- desaturate the cooldown action bar icons to indicate cooldown is not available (Phinix)

		elseif auraType == AURA_TYPE_TOGGLED then
			self.bar:SetValue(0.99)
			self.highlight:SetHidden(not self.highlightToggled)
		else -- AURA_TYPE_PASSIVE
			self.bar:SetValue(0.99)

			if isCDBar then
				if (procAnims) then
					if not self.isPlaying then
						self.loopTexture:SetHidden(false)
						self.loop:PlayFromStart()
						self.isPlaying = true
					end
				else
					if self.isPlaying then
						self.loopTexture:SetHidden(true)
						self.loop:Stop()
						self.isPlaying = false
					end
				end
			end
		end

		if (self.auraStyle == AURA_STYLE_ICON) and (showAbilityID) then
			tText = (tText ~= "") and tText.." \("..stackString.."\)" or stackString
		end
		self.timer:SetText(tText)

		colors = self.barColors[auraType]
		self.bar:SetGradientColors(colors.r1, colors.g1, colors.b1, 1, colors.r2, colors.g2, colors.b2, 1)

		self:SetHidden(false)
	end
end

function Aura:Update(start, finish, stacks, refresh)
	local grimProcs = Srendarr.grimProcs
	local nStacks = (stacks ~= nil) and stacks or 0
	local stackString = ""
	local sStart
	local sFinish
	local grimProcAnims = Srendarr.db.grimProcAnims

	if not self.abilityID then return end -- safety check

	local aId = self.abilityID
	local abilityOffset = (aId-5000000 > 0) and aId-5000000 or (aId-4000000 > 0) and aId-4000000 or (aId-3000000 > 0) and aId-3000000 or (aId-2000000 > 0) and aId-2000000 or (aId-1000000 > 0) and aId-1000000 or aId

	if grimProcs[abilityOffset] then nStacks = Srendarr.db.grimTracker[abilityOffset] end -- Grim Focus (Phinix)

	if abilityOffset == bData.ID then stackString = "|c00ff00" .. tostring(nStacks) .. "\%|r" end -- Bahsei's Mania

	if stackingAuras[abilityOffset] then -- used to add stacks to name of auras that have them (Phinix)
		stackString = "\(" .. tostring(nStacks) .. "\)"
		if stackingAuras[abilityOffset].base and not refresh then
			sStart = start
			sFinish = finish
		else
			sStart = (stackingAuras[abilityOffset].rTimer) and start or self.start
			sFinish = (stackingAuras[abilityOffset].rTimer) and finish or self.finish
		end
	else
		sStart = start
		sFinish = finish
	end

	if self.auraStyle == AURA_STYLE_GROUPB or self.auraStyle == AURA_STYLE_GROUPD then
		self.name:SetText("")
	else
		if self.auraStyle ~= AURA_STYLE_ICON then
			if (showAbilityID) then
				self.name:SetText(self.auraName .. " " .. stackString .. ' [' .. abilityOffset .. ']')
			else
				self.name:SetText(self.auraName .. " " .. stackString)
			end
		else
			if (showAbilityID) then
				self.name:SetText(abilityOffset)
			else
				self.name:SetText(stackString)
			end
		end
	end

	-- Change icon based on proc events (for stacking auras only) (Phinix)
	if stackingAuras[abilityOffset] then
		if nStacks ~= 0 and nStacks == stackingAuras[abilityOffset].proc then
			self.icon:SetTexture(stackingAuras[abilityOffset].picon)
		else
			self.icon:SetTexture(GetAbilityIcon(abilityOffset))
			if self.isPlaying then -- safety check should not be necessary (Phinix)
				self.loopTexture:SetHidden(true)
				self.loop:Stop()
				self.isPlaying = false
			end
		end
	end

	self.stacks = nStacks

	if grimProcs[abilityOffset] then -- Grim Focus (Phinix)
		local procID = grimProcs[abilityOffset]
		if nStacks == 5 then
			self.icon:SetTexture('/esoui/art/icons/ability_rogue_058.dds')
			if (grimProcAnims) then
				if not self.isPlaying then
					self.loopTexture:SetHidden(false)
					self.loop:PlayFromStart()
					self.isPlaying = true
				end
			end
		else
			self.icon:SetTexture(grimBase[procID].icon)
			if self.isPlaying then
				self.loopTexture:SetHidden(true)
				self.loop:Stop()
				self.isPlaying = false
			end
		end
	end

--	if (self.start == sStart and self.finish == sFinish and self.start ~= self.finish) then return end -- if they are the same nothing changed (repeat event firings probably), do nothing
	if (self.start == sStart and self.finish == sFinish) then
		if self.start ~= self.finish then return end -- allows passives to update even when the duration doesn't change (Phinix)
	end

	local parentID = self.displayParent.displayID
	local displayDB = Srendarr.db.displayFrames
	local displayID = (parentID < GROUP_START_FRAME) and parentID or (parentID < GROUP_DSTART_FRAME) and Srendarr:GetGroupBuffTab() or Srendarr:GetGroupDebuffTab()

	currentTime = GetGameTimeMillis() / 1000
	self.start	= start
	self.finish	= finish

	local tText = ""
	if (self.auraType == AURA_TYPE_TIMED or self.auraType == DEBUFF_TYPE_TIMED) then
		tText = FormatTime(finish - currentTime, Srendarr.db.auraGroups[self.auraGroup])
	end
	if (self.auraStyle == AURA_STYLE_ICON) and (showAbilityID) then
		tText = (tText ~= "") and tText.." \("..stackString.."\)" or stackString
	end
	self.timer:SetText(tText)

	if start == nil then -- need to research further (Phinix)
		self:Release()

	--	d("test")

		return
	end

	self.bar:SetValue(1 - ((currentTime - start) / (finish - start)))

	if displayDB[displayID].auraCooldown then
		if (self.cooldown) then
			self.cooldown:StartCooldown( ( finish - currentTime ) * 1000 , ( finish - start ) * 1000 , CD_TYPE_RADIAL, CD_TIME_TYPE_TIME_UNTIL, false )
			self.cooldown:SetHidden(false)    
		end
	end

	if (self.isFading) then -- aura (most likely) had expired in game but was still active internally due to fadeout
		self.isFading = false
		self:SetAlpha(1)
		self.icon:SetDesaturation(0)
	end

	self.displayParent:UpdateDisplay() -- time has changed, update parent display as ordering may have been altered
end

function Aura:SetExpired()
	if (not self.isFading) then -- if not already expired and fading, start
		self.finish = GetGameTimeMillis() / 1000 -- times up, make sure our internal finish time agrees
		self.icon:SetDesaturation(1)

		self.isFading = true -- note that its time to start fading
	end
end

function Aura:Release(flagBurst)
	self:SetHidden(true)

	activeTimedAuras[self.auraID] = nil -- whether timed aura or not, this removes self from tracking table

	auraLookup[self.unitTag][self.abilityID] = nil -- remove self from the aura lookup reference

	self.displayParent:OnAuraReleased(flagBurst, self)
end


-- ------------------------
-- CONFIGURATION
-- ------------------------
function Aura:Configure(settings)

	local displayDB = Srendarr.db.displayFrames
	local displayID = settings.base.id
	local sampleAuraData = Srendarr.sampleAuraData

	self.auraStyle = settings.style -- internal ref for currently active style

	-- configure local references for things that can change from ability to ability on the same aura object
	self.highlightToggled						= settings.highlightToggled
	self.barColors[AURA_TYPE_TIMED]				= settings.barColors[AURA_TYPE_TIMED]
	self.barColors[AURA_TYPE_TOGGLED]			= settings.barColors[AURA_TYPE_TOGGLED]
	self.barColors[AURA_TYPE_PASSIVE]			= settings.barColors[AURA_TYPE_PASSIVE]
	self.barColors[DEBUFF_TYPE_PASSIVE]			= settings.barColors[DEBUFF_TYPE_PASSIVE]
	self.barColors[DEBUFF_TYPE_TIMED]			= settings.barColors[DEBUFF_TYPE_TIMED]
	self.cooldownColors[AURA_TYPE_TIMED]		= settings.cooldownColors[AURA_TYPE_TIMED]
	self.cooldownColors[AURA_TYPE_TOGGLED]		= settings.cooldownColors[AURA_TYPE_TOGGLED]
	self.cooldownColors[AURA_TYPE_PASSIVE]		= settings.cooldownColors[AURA_TYPE_PASSIVE]
	self.cooldownColors[DEBUFF_TYPE_PASSIVE]	= settings.cooldownColors[DEBUFF_TYPE_PASSIVE]
	self.cooldownColors[DEBUFF_TYPE_TIMED]		= settings.cooldownColors[DEBUFF_TYPE_TIMED]

	self.name:SetFont(strformat('%s|%d|%s', LMP:Fetch('font', settings.nameFont), settings.nameSize, settings.nameStyle))
	self.name:SetColor(settings.nameColor[1], settings.nameColor[2], settings.nameColor[3], settings.nameColor[4])

	self.timer:SetFont(strformat('%s|%d|%s', LMP:Fetch('font', settings.timerFont), settings.timerSize, settings.timerStyle))
	self.timer:SetColor(settings.timerColor[1], settings.timerColor[2], settings.timerColor[3], settings.timerColor[4])
	self.timer:SetVerticalAlignment(TEXT_ALIGN_BOTTOM)

	-- configure tooltip control
--	if (settings.style == AURA_STYLE_ICON and settings.enableTooltips) then
		if (not self:GetHandler('OnMouseEnter')) then
			self:SetHandler('OnMouseEnter',	OnMouseEnter)
			self:SetHandler('OnMouseExit',	OnMouseExit)
			self:SetHandler('OnMouseUp',	OnMouseUp)
		end





		if sampleAuraData[self.abilityID] then
			self:SetMouseEnabled(false)
		else
			self:SetMouseEnabled(true)
		end

--	else -- only in icon mode
--		self:SetMouseEnabled(false)
--
--		if (self:GetHandler('OnMouseEnter')) then
--			self:SetHandler('OnMouseEnter', nil)
--			self:SetHandler('OnMouseExit', nil)
--			self:SetHandler('OnMouseUp', nil)
--		end
--	end

	if settings.style == AURA_STYLE_FULL then -- full style, must be growing up or down
		-- configure icon
		if (displayDB[displayID].auraCooldown) then
			self:SetTexture([[Srendarr/Icons/IconBG.dds]])
		else
			self:SetTexture([[/esoui/art/actionbar/abilityframe64_up.dds]])
		end
		self.icon:SetHidden(false)

		if (not displayDB[displayID].auraCooldown) then
			if (self.cooldown) then self.cooldown:SetHidden(true) end
		else
			if (self.cooldown) then self.cooldown:SetHidden(false) end
		end

		self.highlight:SetAlpha(1) -- allow toggle highlight to be seen again if set (is a hack, but it works without a lot of checking)
		-- configure timer
		self.timer:ClearAnchors()
		self.timer:SetAnchor(BOTTOM, self, BOTTOM, 0, -1) -- in full style, the timer is either over or hidden
		self.timer:SetHidden(settings.timerLocation == AURA_TIMERLOC_HIDDEN)

		-- configure bar display
		self.bar:SetDimensions(settings.barWidth, 16)
		self.bar:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge.dds]], 8, 32)
		self.bar.gloss:SetDimensions(settings.barWidth, 16)
		self.bar.gloss:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge_gloss.dds]], 8, 32)
		self.bar.gloss:SetHidden((not settings.barGloss or displayDB[displayID].hideFullBar))
		self.barBorderL:SetHeight(16)
		self.barBorderR:SetHeight(16)
		self.barBorderM:SetDimensions(settings.barWidth - 20, 16)
		self.barBackdrop:ClearAnchors()
		self.barBackdrop:SetDimensions(settings.barWidth - 10, 16)
		self.barBackdropEnd:ClearAnchors()
		self.barBackdropEnd:SetHeight(16)

		self.name:ClearAnchors()
		self.name:SetHidden(false)
		self.bar:ClearAnchors()
		self.bar:SetHidden(displayDB[displayID].hideFullBar)

		if (settings.barReverse) then
			self.barBackdrop:SetAnchor(TOPRIGHT, self.bar, TOPRIGHT, 0, 0)
			self.barBackdropEnd:SetAnchor(TOPLEFT, self.bar, TOPLEFT, 0, 0)
			self.bar:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
			self.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
			self.barBorderL:SetTextureCoords(0.6133000254631, 0.59380000829697, 0, 0.625)
			self.barBorderR:SetTextureCoords(0.019500000402331, 0, 0, 0.625)
			self.barBackdropEnd:SetTextureCoords(1, 0, 0, 0.625)

			if (displayDB[displayID].hideFullBar) then
				self.name:SetAnchor(RIGHT, self, LEFT, -8, 0)
			else
				self.name:SetAnchor(BOTTOMRIGHT, self.bar, TOPRIGHT, -2, -1)
			end

			self.name:SetHorizontalAlignment(TEXT_ALIGN_RIGHT)
			self.bar:SetAnchor(BOTTOMRIGHT, self, BOTTOMLEFT, -3, 0)
		else
			self.barBackdrop:SetAnchor(TOPLEFT, self.bar, TOPLEFT, 0, 0)
			self.barBackdropEnd:SetAnchor(TOPRIGHT, self.bar, TOPRIGHT, 0, 0)
			self.bar:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
			self.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
			self.barBorderL:SetTextureCoords(0, 0.019500000402331, 0, 0.625)
			self.barBorderR:SetTextureCoords(0.59380000829697, 0.6133000254631, 0, 0.625)
			self.barBackdropEnd:SetTextureCoords(0, 1, 0, 0.625)

			if (displayDB[displayID].hideFullBar) then
				self.name:SetAnchor(LEFT, self, RIGHT, 8, 0)
			else
				self.name:SetAnchor(BOTTOMLEFT, self.bar, TOPLEFT, 2, -1)
			end

			self.name:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
			self.bar:SetAnchor(BOTTOMLEFT, self, BOTTOMRIGHT, 3, 0)
		end
	elseif (settings.style == AURA_STYLE_ICON or settings.style == AURA_STYLE_GROUPB or settings.style == AURA_STYLE_GROUPD) then -- icon only style, hide unused elements
		-- configure icon
		if (displayDB[displayID].auraCooldown) then
			self:SetTexture([[Srendarr/Icons/IconBG.dds]])
		else
			self:SetTexture([[/esoui/art/actionbar/abilityframe64_up.dds]])
		end
		self.icon:SetHidden(false)

		if (not displayDB[displayID].auraCooldown) then
			if (self.cooldown) then self.cooldown:SetHidden(true) end
		else
			if (self.cooldown) then self.cooldown:SetHidden(false) end
		end

		self.highlight:SetAlpha(1) -- allow toggle highlight to be seen again if set (is a hack, but it works without a lot of checking)
		-- configure timer
		self.timer:ClearAnchors()

		if settings.timerLocation == AURA_TIMERLOC_ABOVE then
			self.timer:SetAnchor(BOTTOM, self, TOP, 0, 0)
		elseif settings.timerLocation == AURA_TIMERLOC_BELOW then
			self.timer:SetAnchor(TOP, self, BOTTOM, 0, -1)
			self.timer:SetVerticalAlignment(TEXT_ALIGN_TOP)
		else -- settings.timerLocation == AURA_TIMERLOC_OVER (or hidden, makes no difference)
			self.timer:SetAnchor(BOTTOM, self, BOTTOM, 0, -1)
		end

		self.timer:SetHidden(settings.timerLocation == AURA_TIMERLOC_HIDDEN)

		if (showAbilityID) then -- repurpose name display for abilityID display
			self.name:SetFont(strformat('%s|13|soft-shadow-thin', LMP:Fetch('font', 'Univers 57')))
		end

		self.name:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
		self.name:ClearAnchors()
		self.name:SetAnchor(TOP, self, TOP, 0, 1)
		self.name:SetHidden(false)

		self.bar:SetHidden(true)
	elseif settings.style == AURA_STYLE_MINI then -- style == AURA_STYLE_MINI

		-- configure icon
		self:SetTexture(0, 0, 0, 0)	-- make icon inivisble (cannot set alpha as it is the base of the aura object)
		self.icon:SetHidden(true)	-- hide the icon for this ability
		if (self.cooldown) then self.cooldown:SetHidden(true) end
		self.highlight:SetAlpha(0)	-- disable toggle highlight (is a hack, but it works without a lot of checking)
		-- configure timer
		self.timer:SetHidden(true) -- no timer text in this style

		-- configure bar display
		self.bar:SetDimensions(settings.barWidth, 9)
		self.bar:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge.dds]], 8, 18)
		self.bar.gloss:SetDimensions(settings.barWidth, 9)
		self.bar.gloss:SetLeadingEdge([[/esoui/art/miscellaneous/progressbar_genericfill_leadingedge_gloss.dds]], 8, 18)
		self.bar.gloss:SetHidden(not settings.barGloss)
		self.barBorderL:SetHeight(9)
		self.barBorderR:SetHeight(9)
		self.barBorderM:SetDimensions(settings.barWidth - 20, 9)
		self.barBackdrop:ClearAnchors()
		self.barBackdrop:SetDimensions(settings.barWidth - 10, 9)
		self.barBackdropEnd:ClearAnchors()
		self.barBackdropEnd:SetHeight(9)

		self.name:ClearAnchors()
		self.name:SetHidden(false)
		self.bar:ClearAnchors()
		self.bar:SetHidden(false)

		if (settings.barReverse) then
			self.barBackdrop:SetAnchor(TOPRIGHT, self.bar, TOPRIGHT, 0, 0)
			self.barBackdropEnd:SetAnchor(TOPLEFT, self.bar, TOPLEFT, 0, 0)
			self.bar:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
			self.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
			self.barBorderL:SetTextureCoords(0.6133000254631, 0.59380000829697, 0, 0.625)
			self.barBorderR:SetTextureCoords(0.019500000402331, 0, 0, 0.625)
			self.barBackdropEnd:SetTextureCoords(1, 0, 0, 0.625)
			self.name:SetAnchor(BOTTOMRIGHT, self.bar, TOPRIGHT, -2, -1)
			self.name:SetHorizontalAlignment(TEXT_ALIGN_RIGHT)
			self.bar:SetAnchor(BOTTOMRIGHT, self, BOTTOMRIGHT, 0, -5)
		else
			self.barBackdrop:SetAnchor(TOPLEFT, self.bar, TOPLEFT, 0, 0)
			self.barBackdropEnd:SetAnchor(TOPRIGHT, self.bar, TOPRIGHT, 0, 0)
			self.bar:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
			self.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
			self.barBorderL:SetTextureCoords(0, 0.019500000402331, 0, 0.625)
			self.barBorderR:SetTextureCoords(0.59380000829697, 0.6133000254631, 0, 0.625)
			self.barBackdropEnd:SetTextureCoords(0, 1, 0, 0.625)
			self.name:SetAnchor(BOTTOMLEFT, self.bar, TOPLEFT, 2, -1)
			self.name:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
			self.bar:SetAnchor(BOTTOMLEFT, self, BOTTOMLEFT, 0, -5)
		end
	end
end

function Aura:UpdateVisuals() -- updates visuals on active auras, only called by settings changes
	if (self.auraType and self.auraType == AURA_TYPE_TOGGLED) then
		self.highlight:SetHidden(not self.highlightToggled) -- update toggle highlighting
	end

	colors = self.barColors[self.auraType]
	self.bar:SetGradientColors(colors.r1, colors.g1, colors.b1, 1, colors.r2, colors.g2, colors.b2, 1)

end


Srendarr.Aura = Aura
