local RaidNotifier = RaidNotifier
local Util         = RaidNotifier.Util


local GetGameTimeMillis		= GetGameTimeMilliseconds
local strfmt				= string.format

do 
	local UI_FRAGMENT

	local CUSTOM_ANCHORS = --for managing control position with a none-TOPLEFT anchor
	{
		[CENTER]   = function(ctrl) return ctrl:GetCenter() end,
		[TOPLEFT]  = function(ctrl) return ctrl:GetLeft(), ctrl:GetTop() end,
	}

	local function GetSettingForControl(control)
		local settings = RaidNotifier.Vars[control.category]
		return settings and settings[control.key]
	end

	function RaidNotifier:AddFragment()
		if not UI_FRAGMENT then 
			UI_FRAGMENT = ZO_HUDFadeSceneFragment:New(RaidNotifierUI)
		end
		HUD_SCENE:AddFragment(UI_FRAGMENT)
		HUD_UI_SCENE:AddFragment(UI_FRAGMENT)
	end
	function RaidNotifier:RemoveFragment()
		if not UI_FRAGMENT then 
			UI_FRAGMENT = ZO_HUDFadeSceneFragment:New(RaidNotifierUI)
		end
		HUD_SCENE:RemoveFragment(UI_FRAGMENT)
		HUD_UI_SCENE:RemoveFragment(UI_FRAGMENT)
	end

	local function SetElementPosition(ctrl, position)
		local initial = ctrl.initialAnchor or {}
		ctrl:ClearAnchors()
		ctrl:SetAnchor(position[3] or TOPLEFT, initial.relativeTo or RaidNotifierUI, position[4] or TOPLEFT, position[1], position[2])
	end

	local function SaveElementPosition(ctrl)
		local settings = GetSettingForControl(ctrl)
		if settings and settings.position then -- move this to GetSettingForControl?
			settings = settings.position
		end
		if not settings then
			--df("Could not find saved position for '%s'", ctrl:GetName())
		else
			local anchor = settings[3] or TOPLEFT
			settings[1], settings[2] = CUSTOM_ANCHORS[anchor](ctrl)
			-- After moving UI element it's "relative point" and "point" may also be recalculated
			-- Getting position by GetCenter() or GetLeft() / GetTop() will mind "relative point" = TOPLEFT it seems
			-- That's why settings[4] doesn't saved here, thus default TOPLEFT will be loaded instead
		end
	end
	
	local function LoadElementPosition(ctrl)
		local settings = GetSettingForControl(ctrl)
		if settings and settings.position then -- move this to GetSettingForControl?
			settings = settings.position
		end
		if not settings then
			--df("Could not find saved position for '%s'", ctrl:GetName())
		else
			SetElementPosition(ctrl, settings)
		end
	end
	
	local elements = {}
	function RaidNotifier:RegisterElement(ctrl)
		if type(ctrl) == "string" then
			ctrl = RaidNotifierUI:GetNamedChild(ctrl)
		end
		elements[ctrl.key] = ctrl --just save by key as it probably never conflicts
		ctrl:SetHandler("OnMoveStop", SaveElementPosition)
		LoadElementPosition(ctrl)
		return ctrl
	end

	function RaidNotifier:ResetElement(ctrl)
		if type(ctrl) == "string" then
			ctrl = RaidNotifierUI:GetNamedChild(ctrl)
		end
		if ctrl.initialAnchor then
			SetElementPosition(ctrl, {
				ctrl.initialAnchor.offsetX,
				ctrl.initialAnchor.offsetY,
				ctrl.initialAnchor.relativePoint,
				ctrl.initialAnchor.point
			})
		end
	end

	function RaidNotifier:SetElementHidden(category, key, hidden)
		local ctrl = elements[key]
		if ctrl then
			ctrl:SetHidden(hidden)
		end
	end
	
	function RaidNotifier:HideAllElements()
		for k, elem in pairs(elements) do
			elem:SetHidden(true)
		end
	end

	function RaidNotifier:GetElement(category, key)
		return elements[key]
	end

end

-- --------------------
-- -- ULTIMATE WINDOW
do --------------------

	local window = nil

	function RaidNotifier:InitializeUltimateWindow(control, mode)
		window = self:RegisterElement(control)
		-- do more with mode for initial display?
		self:UpdateUltimateWindow(nil, mode)
	end

	function RaidNotifier:UpdateUltimateWindow(sortedUlti, mode)
		if not window then return end

		local settings = self.Vars.ultimate

		if sortedUlti then
			local text = "Ultimates:" --TODO: grab text from abilityId??
			for i, data in ipairs(sortedUlti) do
				local name = settings.useDisplayName and data.userName or data.name
				local c1,c2 = "",""
				if settings.useColor then
					if data.percent >= 100 then
						c1,c2 = "|c00ff00","|r"
					elseif data.percent >= 80 then
						c1,c2 = "|ccccc00","|r"
					end
				end
				text = string.format("%s\n%s%s %d%%%s", text, c1, name, zo_min(data.percent, 100), c2)
			end

			window.label:SetText(text)
		end
		
		if mode ~= nil then
			window:SetHidden(mode)
		end

	end

end

-- -------------------
-- -- RNTIMER OBJECT
do -------------------

	local UPDATE_RATE    = 0.05
	local OnUpdate   = nil --forwarding
	local refCounter = Util.RefCounter:New("TimerCounter",
		function() -- on getting atleast one reference
			RaidNotifierUI:SetHandler("OnUpdate", OnUpdate)
		end,
		function() -- on reaching zero references
			RaidNotifierUI:SetHandler("OnUpdate", nil)
		end)

	-- TODO: switch to a proper pool?
	local activeTimers = {}
	local nextUpdate = 0
	OnUpdate = function(self, updateTime)
		if (updateTime >= nextUpdate) then
			for id, timer in pairs(activeTimers) do
				timer:Update(updateTime)
			end
			nextUpdate = updateTime + UPDATE_RATE
		end
	end

	-- Base Timer
	local timerId = 1 
	local Timer = ZO_Object:Subclass()
	function Timer:New(...)
		local object = ZO_Object.New(self)
		object:Initialize(...)
		return object
	end

	function Timer:Initialize(control, formatter, onCompleteFn) -- control.type = LABEL
		self.control = control

		local function DefaultFormatter(remaining)
			return ZO_FormatTime(remaining, TIME_FORMAT_STYLE_DESCRIPTIVE_MINIMAL_SHOW_TENTHS_SECS)
		end
		self.formatter = formatter or DefaultFormatter

		self.onCompleteFn = onCompleteFn

		self.start   = 0
		self.finish  = 0
		-- fading (ignored for base timer)
		self.fadeTime = 0
		self.isFading = false
		
		self.timerId = timerId
		timerId      = timerId + 1
	end

	function Timer:SetText(text)
		self.control:SetText(text)
	end

	function Timer:Reset()
		-- placed here since there are several places that might stop the timer
		refCounter:Decr()
		 -- remove it from active list even if it may not have been on there
		activeTimers[self.timerId] = nil
		-- reset base
		self.start    = 0
		self.finish   = 0
		-- reset fading
		self.isFading = false
		self:SetFade(1)
		-- additional fade reset for subclasses
		self:ResetFade()
	end

	function Timer:OnComplete(forceStopped)
		--TODO: hide control by default here?
		if self.onCompleteFn then
			self.onCompleteFn(self, forceStopped)
		end
		--self:Reset()
	end
	
	function Timer:IsActive()
		return self.start > 0
	end

	function Timer:Start(start, finish, fadeTime)
		if self:IsActive() then
			self:Reset() -- TODO: reset manually instead?
		end
		-- increment counter for active timers
		refCounter:Incr()
		-- show timer
		self:SetHidden(false)
		-- add to active list
		activeTimers[self.timerId] = self
		-- base
		self.start   = start
		self.finish  = finish
		-- fading (if supported)
		if fadeTime ~= nil then
			self:SetFadeTime(fadeTime)
		end
		-- use Update to setup (initial) values
		self:Update(start) 
	end

	-- Use this to force a timer to stop
	function Timer:Stop(skipFade)
		--only stop if we are active
		if self:IsActive() then
		
			if skipFade or self.fadeTime == 0 then
				self:OnComplete()
				self:Release()
			else
				self:SetExpired()
			end
		end
	end

	function Timer:Release()
		self:SetHidden(true)
		self:Reset()
	end
	function Timer:SetHidden(hidden)
		self.control:SetHidden(hidden)
	end

	-- base timer cannot fade
	function Timer:SetFadeTime(fadeTime)
		-- do nothing
	end
	function Timer:SetFade(fade)
		-- do nothing
	end
	function Timer:ResetFade()
		-- do nothing
	end
	function Timer:SetExpired()
		-- do nothing
	end

	-- update timer and handle fading for subclasses that support it
	function Timer:Update(currentTime)
		local remaining = self.finish - currentTime
		if (remaining <= self.fadeTime) then -- done with timer and done with possible fading
			self:OnComplete()
			self:Release()
		elseif (remaining <= 0) then -- handle fading, won't occur for base timer tho
			if (not self.isFading) then
				self:SetExpired()
			end
			self:SetFade(math.max(0, 1 - (remaining / self.fadeTime)))
		else
			self:SetText(self.formatter(remaining))
		end
	end
	
	RaidNotifier.Timer = Timer


	-- IconTimer: Handles a timer with a texture as control
	local IconTimer = Timer:Subclass()
	function IconTimer:New(...)
		return Timer.New(self, ...)
	end
	function IconTimer:Initialize(control, formatter, onCompleteFn) -- control.type = TEXTURE
		Timer.Initialize(self, control, formatter, onCompleteFn)
		-- initialize additional children
		self.control.timer = control:GetNamedChild("Timer")
	end

	-- redirect text to label
	function IconTimer:SetText(text)
		self.control.timer:SetText(text)
	end

	-- fading is supported
	function IconTimer:SetFadeTime(fadeTime)
		if not self.isFading then -- only when not fading already
			self.fadeTime = fadeTime * -1
		end
	end
	function IconTimer:SetFade(fade)
		self.control:SetAlpha(fade)
	end
	function IconTimer:ResetFade() -- called by Timer:Reset()
		self.control:SetDesaturation(0)
	end
	function IconTimer:SetExpired()
		if (not self.isFading) then 
			self.isFading = true
			-- make sure fading starts right now
			self.finish = GetGameTimeMillis() / 1000
			-- grey it out
			self.control:SetDesaturation(1)
			-- set text to 0 seconds (maybe hide text completely?)
			self:SetText(self.formatter(0))
		end
	end

	RaidNotifier.IconTimer = IconTimer
end


-- -------------------
-- -- STATUS DISPLAY
do -------------------

	-- Multi-purpose status display, used in various places to show (semi)persistant effects
	local display   = nil    -- the parent display
	local iconTimer = nil    -- the timer object (NOT THE ACTUAL CONTROL)
	local owner     = "none" -- simple string to see who is currently using the status display
	
	--local self = RaidNotifier

	function RaidNotifier:InitializeStatusDisplay(control)
		display = self:RegisterElement(control)
		-- set icon
		display:SetTexture([[esoui/art/icons/ability_mage_065.dds]])
		-- initialize additional controls
		display.label = display:GetNamedChild("Label")
		-- create timer object
		iconTimer = RaidNotifier.IconTimer:New(display)
		-- animation for flashing
		if not display.flashTimeline then
			display.flashTimeline = ANIMATION_MANAGER:CreateTimelineFromVirtual("RaidNotifierStatusDisplayLoop", display)
			display.flashTimeline:SetPlaybackType(ANIMATION_PLAYBACK_LOOP, LOOP_INDEFINITELY) -- each loop is 1 second
		end
	end


	-- Sanctum Ophidia: Spreading Poison  (SHELVED INDEFINITELY)
	--function RaidNotifier:UpdateSpreadingPoison(active, start, finish)
	--	if not display then return end
	--	if owner ~= "sanctum_spread_poison" then
	--		owner = "sanctum_spread_poison"
	--		display:SetTexture([[esoui/art/icons/death_recap_poison_aoe.dds]])
	--		--display:SetTexture([[esoui/art/icons/ability_healer_018.dds]]) -- actual icon for ability?? 
	--		display.label:SetHidden(true)
	--		display.timer:SetHidden(false)
	--	end
	--	if active then
	--		iconTimer:Start(start, finish)
	--	else
	--		iconTimer:Stop() -- let it fade 
	--	end
	--end

	-- Maw of Lorkhaj: False Moon Twins
	function RaidNotifier:UpdateTwinAspect(aspect)
		local settings = self.Vars.mawLorkhaj
		if not settings.twinBoss_aspects_status then return end

		if not display then return end
		if owner ~= "mol_twins_aspect" then
			owner = "mol_twins_aspect"
			display.timer:SetHidden(true) -- maybe use timer when converting?
			display.label:SetHidden(true) -- display aspect as text maybe?
		end

		local icons = -- TODO: decide which icon to use 
		{
			["lunar"]    = [[RaidNotifier/assets/aspect_lunar3.dds]],
			["tolunar"]  = [[RaidNotifier/assets/aspect_lunar1.dds]],
			["shadow"]   = [[RaidNotifier/assets/aspect_shadow3.dds]],
			["toshadow"] = [[RaidNotifier/assets/aspect_shadow1.dds]],
		}

		local currentTime = GetGameTimeMillis() / 1000
		if aspect == "none" then
			iconTimer:Start(currentTime, currentTime, 0.5) -- finish time doesn't matter
			iconTimer:SetExpired() -- start fading
			if display.flashTimeline:IsPlaying() then
				display.flashTimeline:PlayInstantlyToEnd()
				display.flashTimeline:Stop()
			end
		else
			iconTimer:Start(currentTime, currentTime+3600, 0.5) -- just for making it 'active'
			display:SetTexture(icons[aspect])
			if aspect == "tolunar" or aspect == "toshadow" then --these should always last 3 seconds at most
				display.flashTimeline:PlayFromStart()
			elseif display.flashTimeline:IsPlaying() then
				display.flashTimeline:PlayInstantlyToEnd()
				display.flashTimeline:Stop()
			end
		end
	end

	-- Halls of Fabrication: Hunter Pair
	function RaidNotifier:UpdateSphereVenom(active, start, finish)
		if not display then return end
		if owner ~= "hof_venom_inject" then
			owner = "hof_venom_inject"
			display:SetTexture([[esoui/art/icons/death_recap_poison_ranged.dds]])
			display.timer:SetHidden(false)
			--display.label:SetHidden(true) --maybe display "Purge" instead?
			display.label:SetHidden(false)
			display.label:SetText("Purge!")
		end
		if active then
			iconTimer:Start(start, finish)
		else
			iconTimer:Stop() -- let it fade 
		end
	end

	-- Halls of Fabrication: Pinnacle Factotum
	function RaidNotifier:UpdateScaldedStacks(stacks, start, finish)
		if not display then return end
		if owner ~= "hof_scalded_debuff" then
			owner = "hof_scalded_debuff"
			display:SetTexture([[esoui/art/icons/ability_dragonknight_002_b.dds]])
			display.timer:SetHidden(false)
			display.label:SetHidden(false)
		end

		if (stacks > 0) then
			local r,g,b = Util.HSL2RGB((10 - stacks) / 30, 1, 1.5)
			display.label:SetColor(r,g,b,1)
			display.label:SetText(("%d%%"):format(stacks * 10))

			iconTimer:Start(start, finish, 0.5)
		else
			iconTimer:Stop() -- let it fade 
		end
	end

	SLASH_COMMANDS["/rnstatus"] = function(status)
		local currentTime = GetGameTimeMillis() / 1000
		if status == "scalded" then
			local stacks = math.random(1, 10)
			RaidNotifier:UpdateScaldedStacks(stacks, currentTime, currentTime + 15)
		--elseif status == "aspect" then
		--	RaidNotifier:UpdateTwinAspect("tolunar")
		elseif status == "venom" then
			RaidNotifier:UpdateSphereVenom(true, currentTime, currentTime + 8.3)
		elseif status == "troll" then
			RaidNotifier:UpdateSpreadingPoison(true, currentTime, currentTime + 10)
		else
			RaidNotifier:UpdateTwinAspect(status)
		end
		
	end

end

-- -------------------
-- -- ARROW DISPLAY
do -------------------

	local display = nil -- parent

	function RaidNotifier:InitializeArrowDisplay(control)
		display = self:RegisterElement(control)
		--display.arrow = display:GetNamedChild("Arrow")
	end

	function RaidNotifier:TrackPlayer(playerTag, trackTime)
		local function Update()
			local rotationAngle = self.Util:GetRotationAngle(playerTag)
			display:SetTextureRotation(rotationAngle)
		end
		
		local function Stop()
			self:StopTrackPlayer();
		end
		if trackTime ~= nil and trackTime > 0 then
			display:SetHidden(false)
		
			EVENT_MANAGER:RegisterForUpdate(self.Name .. "_TrackPlayer", 50, Update)
			zo_callLater(Stop, trackTime)
		end
	end
	function RaidNotifier:StopTrackPlayer()
		EVENT_MANAGER:UnregisterForUpdate(self.Name .. "_TrackPlayer")
		display:SetHidden(true)
	end
end
-- -----------------
-- -- GLYPH WINDOW
do -----------------

	local window      = nil -- the window itself
	local glyphTimers = {}  -- the glyph objects (NOT THE ACTUAL CONTROLS)

	local Timer = RaidNotifier.Timer

	-- GlyphTimer: handles showing and hiding of the overlay and timer
	--             in addition to updating the timer itself.
	local GlyphTimer = Timer:Subclass()
	function GlyphTimer:New(...)
		return Timer.New(self, ...)
	end
	function GlyphTimer:Initialize(control, formatter, onCompleteFn)
		Timer.Initialize(self, control, formatter, onCompleteFn)
		-- additional controls
		self.control.bg       = control:GetNamedChild("BG")
		self.control.overlay  = control:GetNamedChild("Overlay")
		self.control.timer    = control:GetNamedChild("Timer")
		-- show overlay by default
		self:SetHidden(true)
	end
	function GlyphTimer:Reset()
		Timer.Reset(self)
		-- show overlay when inactive
		self.control.timer:SetHidden(true)
		self.control.overlay:SetHidden(false)
	end
	function GlyphTimer:Start(start, finish)
		Timer.Start(self, start, finish) -- will call Update()
		self:SetHidden(false) -- shows timer and hides overlay
	end
	function GlyphTimer:SetText(text)
		self.control.timer:SetText(text)
	end
	-- we don't hide the control themselves, only switch between timer and overlay
	function GlyphTimer:SetHidden(hidden)
		self.control.timer:SetHidden(hidden)
		self.control.overlay:SetHidden(not hidden)
	end


	-- Wrapper functions
	function RaidNotifier:StartGlyphTimer(index, cooldown)
		if not window then return end

		local glyph = glyphTimers[index]
		if not glyph then return end
		
		local currentTime = GetGameTimeMillis() / 1000
		glyph:Start(currentTime, currentTime + cooldown)
	end 
	function RaidNotifier:StopGlyphTimer(index)
		if not window then return end

		local glyph = glyphTimers[index]
		if not glyph then return end
		
		glyph:Stop() -- just calls OnComplete, nothing special for now
	end

	-- Called upon loading and when the setting is changed
	function RaidNotifier:InvertGlyphs()
		if not window then return end

		for _, glyph in ipairs(glyphTimers) do
			local _, _, _, _, offsetX, offsetY = glyph.control:GetAnchor(0)
			glyph.control:SetAnchor(CENTER, nil, CENTER, -1*offsetX, -1*offsetY)
		end
		local label = window:GetNamedChild("Exit")
		local _, point = label:GetAnchor(0)
		label:ClearAnchors()
		label:SetAnchor(point == TOP and BOTTOM or TOP, nil, point == TOP and BOTTOM or TOP)
	end

	function RaidNotifier:InitializeGlyphWindow(control, inverted)
		window = self:RegisterElement(control)
		glyphTimers = {}
		for i=1,7 do
			glyphTimers[i] = GlyphTimer:New(window:GetNamedChild("Glyph"..i))
		end
		-- change the textures for the magical 'player glyph' 
		local playerGlyph = glyphTimers[7]
		playerGlyph.control.bg:SetTexture([[RaidNotifier/assets/white_circle.dds]])
		playerGlyph.control.overlay:SetTexture([[RaidNotifier/assets/dummy.dds]])
		-- apply inversion if set
		if inverted then
			self:InvertGlyphs()
		end
	end

end
-- ----------------------
-- -- ANNOUNCEMENT WINDOW
do ----------------------
	local manager = {}
	RaidNotifier.AnnouncementUIManager = manager

	manager.control = nil

	function manager:SetupCSAState()
		if not self.control then return end

		-- This call has two effects: one obvious (hide all notifications) and one side-effect (setting countdown as inactive)
		-- Latter matters here too since NotificationsPool countdown doesn't care about RaidNotifier:IsCountdownInProgress() state
		-- If it'd be needed to keep notifications at the screen then you should call RaidNotifier:StopCountdown(0) here at least
		RaidNotifier:StopCountdown()
		self.control:SetMovable(false)
		RaidNotifier:ResetElement(self.control)
	end

	function manager:SetupCustomState()
		if not self.control then return end

		RaidNotifier:StopCountdown()
		self.control:SetMovable(true)
		RaidNotifier:RegisterElement(self.control)
	end

	function manager:Initialize(control)
		self.control = control

		if RaidNotifier.Vars.general.use_center_screen_announce == 0 then
			self:SetupCustomState()
		end
	end
end
