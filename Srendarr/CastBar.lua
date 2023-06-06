local Srendarr		= _G['Srendarr'] -- grab addon table from global
local L				= Srendarr:GetLocale()
local LMP			= LibMediaProvider
local Cast			= _G['Srendarr_CastBar']

-- UPVALUES --
local strformat					= string.format
local GetGameTimeMillis			= GetGameTimeMilliseconds
local GetLatency				= GetLatency
local IsSlotToggled				= IsSlotToggled
local AddControl				= Srendarr.AddControl

local crystalFragments 			= Srendarr.crystalFragments		-- used for crystal frags procs (no cast if proc'd)
local crystalFragmentsProc		= Srendarr.crystalFragmentsProc	-- used for crystal frags procs (no cast if proc'd)

local slotData					= Srendarr.slotData
local tTenths					= L.Time_Tenths
local isCastingOrChannelling	= false
local currentTime, data
local settings


-- ------------------------
-- CAST BAR UPDATE HANDLER
do ------------------------
	local RATE				= Srendarr.CAST_UPDATE_RATE
	local nextUpdate		= 0
	local timeRemaining

	local function OnUpdate(self, updateTime)
		if (updateTime >= nextUpdate) then
			timeRemaining = self.castFinish - updateTime

			if (timeRemaining <= 0) then -- cast complete, stop cast
				self:OnCastStop()
			else
				if (self.isChannel) then
					Cast.bar:SetValue(1 - ((updateTime - self.castStart) / (self.castFinish - self.castStart)))
				else
					Cast.bar:SetValue((updateTime - self.castStart) / (self.castFinish - self.castStart))
				end

				Cast.timer:SetText(strformat(tTenths, timeRemaining))
			end

			nextUpdate = updateTime + RATE
		end
	end

	Cast:SetHidden(true)
	Cast:SetHandler('OnUpdate', OnUpdate)
end


-- ------------------------
-- CAST CONTROL
-- ------------------------
function Cast:OnCastStart(isChannel, castName, start, finish, castIcon, abilityID)
	self.isChannel		= isChannel
	self.castStart		= start
	self.castFinish		= finish
	self.abilityID		= abilityID

	self.name:SetText(zo_strformat(SI_ABILITY_TOOLTIP_NAME, castName))
	self.icon:SetTexture(castIcon)

	currentTime = GetGameTimeMillis() / 1000

	if (isChannel) then
		self.bar:SetValue((currentTime - start) / (finish - start))
	else
		self.bar:SetValue(1 - ((currentTime - start) / (finish - start)))
	end

	self.timer:SetText(strformat(tTenths, finish - currentTime))

	isCastingOrChannelling = true

	self:SetHidden(false)
end

function Cast:OnCastStop()
	isCastingOrChannelling = false

	self:SetHidden(true)
end


local function OnActionUpdateCooldowns()
--[[ UNUSED FOR NOW
	if (isCastingOrChannelling) then
		if (GetSlotCooldownInfo(Cast.slotID) > 0) then -- on cooldown, cast must be complete, cancel active
			d(string.format('%.3f OnActionUpdateCooldowns - Cancelled Cast', GetFrameTimeSeconds())
			Cast:OnCastStop()
		end
	end
]]
end

local function OnActionSlotAbilityUsed(evt, slot)
	if (slot < 3 or slot > 8) then return end

	if (not slotData[slot].isDelayed) then return end -- this ability is instant cast

	data = slotData[slot]

	if (IsSlotToggled(slot)) then return end -- ability is toggled on, so no cast time to cancel

	if (isCastingOrChannelling and (data.abilityID == Cast.abilityID)) then return end -- already casting this ability, bail out

	if (data.abilityName == crystalFragments and crystalFragmentsProc) then return end -- no cast bar if ability is frags and the proc is active (instant)

	currentTime = GetGameTimeMillis()

	Cast:OnCastStart(
		data.isChannel,
		data.abilityName,
		currentTime / 1000,
		(currentTime + (data.isChannel and data.channelTime or data.castTime) + GetLatency()) / 1000,
		data.abilityIcon,
		data.abilityID
	)
end


-- ------------------------
-- CONFIGURATION
-- ------------------------
function Srendarr:ConfigureCastBar()
	if (not settings.enabled) then
--		EVENT_MANAGER:UnregisterForEvent(self.name .. 'Cast', EVENT_ACTION_UPDATE_COOLDOWNS)
		EVENT_MANAGER:UnregisterForEvent(self.name .. 'Cast', EVENT_ACTION_SLOT_ABILITY_USED)
		Cast:SetHidden(true)
		return
	end

	Cast:SetDimensions(settings.barWidth + 26, 23)

	Cast.icon:ClearAnchors()
	Cast.bar:ClearAnchors()
	Cast.bar:SetDimensions(settings.barWidth, 23)
	Cast.bar:SetGradientColors(settings.barColor.r1, settings.barColor.g1, settings.barColor.b1, 1, settings.barColor.r2, settings.barColor.g2, settings.barColor.b2, 1)
	Cast.bar.gloss:SetDimensions(settings.barWidth, 23)
	Cast.bar.gloss:SetHidden(not settings.barGloss)
	Cast.bar.borderM:SetDimensions(settings.barWidth - 17, 23)
	Cast.bar.backdropM:SetDimensions(settings.barWidth - 17, 23)

	Cast.name:ClearAnchors()
	Cast.name:SetFont(strformat('%s|%d|%s', LMP:Fetch('font', settings.nameFont), settings.nameSize, settings.nameStyle))
	Cast.name:SetColor(settings.nameColor[1], settings.nameColor[2], settings.nameColor[3], settings.nameColor[4])
	Cast.name:SetHidden(not settings.nameShow)

	Cast.timer:ClearAnchors()
	Cast.timer:SetFont(strformat('%s|%d|%s', LMP:Fetch('font', settings.timerFont), settings.timerSize, settings.timerStyle))
	Cast.timer:SetColor(settings.timerColor[1], settings.timerColor[2], settings.timerColor[3], settings.timerColor[4])
	Cast.timer:SetHidden(not settings.timerShow)

	if (settings.barReverse) then
		Cast.icon:SetAnchor(RIGHT, Cast, RIGHT, 0, 0)
		Cast.bar:SetAnchor(RIGHT, Cast.icon, LEFT, -3, 0)
		Cast.bar:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
		Cast.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
		Cast.bar.borderL:SetDimensions(13, 23)
		Cast.bar.borderL:SetTextureCoords(0.3671874, 0.46875, 0.328125, 0.6875)
		Cast.bar.borderR:SetDimensions(4, 23)
		Cast.bar.borderR:SetTextureCoords(0.5859375, 0.6171875, 0.328125, 0.6875)
		Cast.bar.backdropL:SetDimensions(13, 23)
		Cast.bar.backdropL:SetTextureCoords(0.3671874, 0.46875, 0.328125, 0.6875)
		Cast.bar.backdropR:SetDimensions(4, 23)
		Cast.bar.backdropR:SetTextureCoords(0.5859375, 0.6171875, 0.328125, 0.6875)
		Cast.name:SetAnchor(RIGHT, Cast.bar, RIGHT, -5, 0)
		Cast.timer:SetAnchor(LEFT, Cast.bar, LEFT, 15, 0)
	else
		Cast.icon:SetAnchor(LEFT, Cast, LEFT, 0, 0)
		Cast.bar:SetAnchor(LEFT, Cast.icon, RIGHT, 3, 0)
		Cast.bar:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
		Cast.bar.gloss:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
		Cast.bar.borderL:SetDimensions(4, 23)
		Cast.bar.borderL:SetTextureCoords(0.6171875, 0.5859375, 0.328125, 0.6875)
		Cast.bar.borderR:SetDimensions(13, 23)
		Cast.bar.borderR:SetTextureCoords(0.46875, 0.3671874, 0.328125, 0.6875)
		Cast.bar.backdropL:SetDimensions(4, 23)
		Cast.bar.backdropL:SetTextureCoords(0.6171875, 0.5859375, 0.328125, 0.6875)
		Cast.bar.backdropR:SetDimensions(13, 23)
		Cast.bar.backdropR:SetTextureCoords(0.46875, 0.3671874, 0.328125, 0.6875)
		Cast.name:SetAnchor(LEFT, Cast.bar, LEFT, 5, 0)
		Cast.timer:SetAnchor(RIGHT, Cast.bar, RIGHT, -15, 0)
	end

--	EVENT_MANAGER:RegisterForEvent(self.name .. 'Cast', EVENT_ACTION_UPDATE_COOLDOWNS,	OnActionUpdateCooldowns) -- don't think this is needed anymore
	EVENT_MANAGER:RegisterForEvent(self.name .. 'Cast', EVENT_ACTION_SLOT_ABILITY_USED,	OnActionSlotAbilityUsed)
end


-- ------------------------
-- DRAG OVERLAY
-- ------------------------
function Cast:EnableDragOverlay()
	self:SetMouseEnabled(true)
	self:SetMovable(true)

	currentTime = GetGameTimeMillis() / 1000

	Cast:OnCastStart(
		true,
		strformat('%s - %s', L.Srendarr_Basic, L.CastBar),
		currentTime,
		currentTime + 600,
		[[esoui/art/icons/ability_mageguild_001.dds]],
		Srendarr.castBarID
	)

	self:SetHidden(false)
end

function Cast:DisableDragOverlay()
	self:SetMouseEnabled(false)
	self:SetMovable(false)

	Cast:OnCastStop()

	self:SetHidden(true)
end


-- ------------------------
-- INITIALIZATION
-- ------------------------
function Srendarr:InitializeCastBar()
	settings = self.db.castBar

	Cast:SetKeyboardEnabled(false)
	Cast:SetMouseEnabled(false)
	Cast:SetMovable(false)
	Cast:SetDimensions(settings.barWidth + 26, 23)
	Cast:SetAnchor(settings.base.point, GuiRoot, settings.base.point, settings.base.x, settings.base.y)
	Cast:SetAlpha(settings.base.alpha)	-- both values, if configured after load, are done directly)
	Cast:SetScale(settings.base.scale)	-- both values, if configured after load, are done directly)

	Cast:SetHandler('OnReceiveDrag', function(f)
		f:StartMoving()
	end)
	Cast:SetHandler('OnMouseUp', function(f)
		f:StopMovingOrResizing()
		local point, x, y = Srendarr:GetEdgeRelativePosition(f)
		settings.base.point	= point
		settings.base.x		= x
		settings.base.y		= y
	end)

	-- ICON
	Cast.icon, ctrl = AddControl(Cast, CT_TEXTURE, 0)
	ctrl:SetDimensions(23, 23)
	Cast.iconBorder, ctrl = AddControl(Cast.icon, CT_TEXTURE, 1)
	ctrl:SetDimensions(23, 23)
	ctrl:SetTexture([[/esoui/art/actionbar/abilityframe64_up.dds]])
	ctrl:SetAnchor(CENTER)
	-- LABELS
	Cast.name, ctrl = AddControl(Cast, CT_LABEL, 4)
	ctrl:SetVerticalAlignment(TEXT_ALIGN_CENTER)
	ctrl:SetInheritScale(false)
	Cast.timer, ctrl = AddControl(Cast, CT_LABEL, 4)
	ctrl:SetVerticalAlignment(TEXT_ALIGN_CENTER)
	ctrl:SetInheritScale(false)
	-- BAR
	Cast.bar, ctrl = AddControl(Cast, CT_STATUSBAR, 2)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_fill.dds]])
	ctrl:SetTextureCoords(0, 1, 0, 0.53125)
	ctrl:SetLeadingEdge([[/esoui/art/unitattributevisualizer/attributebar_dynamic_leadingedge.dds]], 11, 17)
	ctrl:SetLeadingEdgeTextureCoords(0, 0.6875, 0, 0.53125)
	ctrl:EnableLeadingEdge(true)
	ctrl:SetHandler('OnValueChanged', function(bar, value) bar.gloss:SetValue(value) end) -- change gloss value as main bar changes
	-- BAR GLOSS
	Cast.bar.gloss, ctrl = AddControl(Cast.bar, CT_STATUSBAR, 3)
	ctrl:SetAnchor(TOPLEFT)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_fill_gloss.dds]])
	ctrl:SetTextureCoords(0, 1, 0, 0.53125)
	ctrl:SetLeadingEdge([[/esoui/art/unitattributevisualizer/attributebar_dynamic_leadingedge_gloss.dds]], 11, 17)
	ctrl:SetLeadingEdgeTextureCoords(0, 0.6875, 0, 0.53125)
	ctrl:EnableLeadingEdge(true)
	-- BAR FRAME
	Cast.bar.borderL, ctrl = AddControl(Cast.bar, CT_TEXTURE, 4)
	ctrl:SetAnchor(TOPLEFT)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_frame.dds]])
	Cast.bar.borderR, ctrl = AddControl(Cast.bar, CT_TEXTURE, 4)
	ctrl:SetAnchor(TOPRIGHT)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_frame.dds]])
	Cast.bar.borderM, ctrl = AddControl(Cast.bar, CT_TEXTURE, 4)
	ctrl:SetAnchor(TOPLEFT, Cast.bar.borderL, TOPRIGHT, 0, 0)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_frame.dds]])
	ctrl:SetTextureCoords(0.4921875, 0.5546875, 0.328125, 0.6875)
	-- BAR BACKDROP
	Cast.bar.backdropL, ctrl = AddControl(Cast.bar, CT_TEXTURE, 1)
	ctrl:SetAnchor(TOPLEFT)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_bg.dds]])
	Cast.bar.backdropR, ctrl = AddControl(Cast.bar, CT_TEXTURE, 1)
	ctrl:SetAnchor(TOPRIGHT)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_bg.dds]])
	Cast.bar.backdropM, ctrl = AddControl(Cast.bar, CT_TEXTURE, 1)
	ctrl:SetAnchor(TOPLEFT, Cast.bar.backdropL, TOPRIGHT, 0, 0)
	ctrl:SetTexture([[/esoui/art/unitattributevisualizer/attributebar_dynamic_bg.dds]])
	ctrl:SetTextureCoords(0.4921875, 0.5546875, 0.328125, 0.6875)

	self:ConfigureCastBar()
end

Srendarr.Cast = Cast
