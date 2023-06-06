
local dbg = nil

local AbstractNotification = ZO_Object:Subclass()

AbstractNotification.NOTIFY = 0
AbstractNotification.COUNTDOWN = 1

function AbstractNotification:New(...)
	local obj = ZO_Object.New(self)
	obj:Init(...)
	return obj
end

function AbstractNotification:Init(type, id, parent)
	self.id = id
	self.parent = parent
	self.freeToUse = false
	self.type = type
end

function AbstractNotification:GetType() 
	return self.type
end

function AbstractNotification:GetText()
	return self.text
end

function AbstractNotification:GetId()
	return self.id
end

function AbstractNotification:IsFreeToUse()
	return self.freeToUse
end

function AbstractNotification:SetDisplayTime(displayTime)
	self.displayTime = displayTime
	self.endTime = GetGameTimeMilliseconds() + displayTime
end

function AbstractNotification:GetEndTime()
	return self.endTime
end

function AbstractNotification:Stop()
	EVENT_MANAGER:UnregisterForUpdate("RNNotification_" .. self.id)
--	dbg("Stopped: %d %s", self.id, self.text)
	self:SetHidden(true)
	self.freeToUse = true
end

function AbstractNotification:_runTimer(ms, f)
	self.displayTime = math.floor((self.endTime - GetGameTimeMilliseconds())/ms + 0.5) * ms
	if (f) then
		f()
	end
	EVENT_MANAGER:RegisterForUpdate("RNNotification_" .. self.id, ms, function()
		if (ms < 500) then
			ms = 200
		elseif (ms < 1000) then
			ms = 500
		end
		self.displayTime = math.floor((self.endTime - GetGameTimeMilliseconds())/ms + 0.5) * ms
		if (f) then
			f()
		end
		if (self.displayTime <= 0) then
			self:SetHidden(true)
			self.freeToUse = true
			--dbg("Hiding: "..self.id)				
			EVENT_MANAGER:UnregisterForUpdate("RNNotification_" .. self.id)
		end			
	end)
end

function AbstractNotification:runTimer(ms, f)
	local timer = self.endTime - GetGameTimeMilliseconds()
	local mod = timer % ms
	zo_callLater(function()
		self:_runTimer(ms, f)
	end, mod)
end

function AbstractNotification:SetAnchor(width, height)
	self.ctrl:SetAnchor(TOP, self.parent, TOP, width, height)
end

function AbstractNotification:SetHidden(hidden)
	self.ctrl:SetHidden(hidden)
end

function AbstractNotification:IsHidden()
	return self.ctrl:IsHidden()
end

function AbstractNotification:GetPriority()
	return 1
end

local Notification = AbstractNotification:Subclass()

function Notification:New(...)
	local obj = AbstractNotification.New(self, AbstractNotification.NOTIFY, ...)
	obj:Initialize(...)
	return obj
end

function Notification:GetHeight()
	return self.ctrl:GetTextHeight();
end

function Notification:SetText(str)
	self.ctrl:SetText(str)
end

function Notification:SetScale(scale)
	self.ctrl:SetScale(scale)
end

function Notification:Initialize(id, parent)
	self.ctrl = WINDOW_MANAGER:CreateControl("RNotification"..id, self.parent, CT_LABEL)
	self.fadeInAnimation = GetAnimationManager():CreateTimelineFromVirtual("CenterAnnounceFadeIn", self.ctrl)
	self.ctrl:SetFont('ZoFontCenterScreenAnnounceSmall')
end

function Notification:Show(text)
	self.text = text
	self.fadeInAnimation:PlayFromStart()
	self:SetHidden(false)
	self:SetText(text)
	self.freeToUse = false
	
	self:runTimer(1000)
	
	return self.id
end

local CountdownNotification = AbstractNotification:Subclass()

function CountdownNotification:New(...)
	local obj = AbstractNotification.New(self, AbstractNotification.COUNTDOWN, ...)
	obj:Initialize(...)
	return obj
end

function CountdownNotification:Initialize(id, parent)
	self.ctrl = WINDOW_MANAGER:CreateControl("RNotification"..id, self.parent)	
	
	self.ctrl.label = WINDOW_MANAGER:CreateControl("RNotification"..id.."Label", self.ctrl, CT_LABEL)
	self.ctrl.label:SetAnchor(TOP, self.ctrl, LEFT, 0, 0)
	self.ctrl.label:SetFont('ZoFontCenterScreenAnnounceSmall')
	
	self.ctrl.counter = WINDOW_MANAGER:CreateControl("RNotification"..id.."Counter", self.ctrl, CT_LABEL)
	self.ctrl.counter:SetAnchor(LEFT, self.ctrl.label, RIGHT, 20, 0)
	self.ctrl.counter:SetFont('ZoFontCenterScreenAnnounceLarge')
	
	self.fadeInAnimation = GetAnimationManager():CreateTimelineFromVirtual("CenterAnnounceFadeIn", self.ctrl)
	self.countdownAnimation = GetAnimationManager():CreateTimelineFromVirtual("CenterAnnounceCountdownLoop", self.ctrl.counter)
end

function CountdownNotification:GetHeight()
	return self.ctrl.label:GetTextHeight();
end

function CountdownNotification:SetText(str)
	self.ctrl.label:SetText(str)
end

function CountdownNotification:SetScale(scale)
	self.ctrl.label:SetScale(scale)
	self.ctrl.counter:SetScale(scale * 1.3)
	self.scale = scale;
	local firstAnimation = self.countdownAnimation:GetAnimation(1)
	local startScale = firstAnimation:GetStartScale()
	local endScale = firstAnimation:GetEndScale()
	firstAnimation:SetScaleValues(1.1 * self.scale, 1.5 * self.scale) -- TODO Get base scale from xml
	
	local secondAnimation = self.countdownAnimation:GetAnimation(2)
	local startScale = secondAnimation:GetStartScale()
	local endScale = secondAnimation:GetEndScale()
	secondAnimation:SetScaleValues(1.5 * self.scale, 1.1 * self.scale) -- TODO Get base scale from xml
end

function CountdownNotification:GetScale()
	return self.scale and self.scale or 1;
end

local function OnCountdown(self, precise)
	if (self.scale) then
		self.ctrl.counter:SetScale(self.scale)
	end
	if (precise < 1000) then
		txt = string.format("%0.1f", self.displayTime/1000)
	else
		self.countdownAnimation:PlayFromStart()
		txt = self.displayTime/1000
	end
	if (self.displayTime <= 3000) then
		txt = "|cff0000" .. txt .."|r"
	end
	self.ctrl.counter:SetText(txt)
end

function CountdownNotification:Show(text, precise)
	self.text = text
	if (precise == 1000) then
		self.fadeInAnimation:PlayFromStart()
	end
	self:SetHidden(false)
	self.freeToUse = false
	self:SetText(text)
	self.ctrl.counter:SetText("")
	local txt
	self:runTimer(precise == nil and 1000 or precise, function() OnCountdown(self, precise) end)
	return self.id
end

local NotificationsPool = ZO_Object:Subclass()

function NotificationsPool:New(...)
	local obj = ZO_Object.New(self)
	obj:Initialize(...)
	return obj
end

function NotificationsPool:Initialize(displayTime, parent)
	self.pool = {}
	self.displayTime = displayTime
	if (parent == nil) then
		self.parent = RaidNotifierUICenterAnnounce
	else
		self.parent = parent
	end
	
	dbg = RaidNotifier.dbg
	
--	self.bg = WINDOW_MANAGER:CreateControl(nil, self.parent, CT_BACKDROP)
--	self.bg:SetAnchorFill(self.parent)
--	self.bg:SetEdgeTexture(nil, 1, 1, 0.5, 0.5)	
end

local pool = nil

function NotificationsPool.GetInstance(displayTime)
	if (not pool) then
		if (displayTime == nil) then
			displayTime = 3000
		end
		pool = NotificationsPool:New(displayTime)
	end
	return pool
end

function NotificationsPool:SetScale(scale)
	self.scale = scale;
end

-- 10 - 1s, 5 - 0.5s, 2 - 0.2s
function NotificationsPool:SetPrecise(precise)
	self.precise = precise * 100
end

function NotificationsPool:Add(text, displayTime, isCountdown)
	isCountdown = isCountdown and isCountdown or false
	local notify = nil
	for i = 1, #self.pool, 1 do
		if (self.pool[i]:IsFreeToUse()) then
			if ((self.pool[i]:GetType() == AbstractNotification.COUNTDOWN and isCountdown) 
			or  (self.pool[i]:GetType() == AbstractNotification.NOTIFY and not isCountdown)) then
				--dbg("Used already created notification "..self.pool[i]:GetId())
				notify = self.pool[i]
				break;
			end
		end
	end

	if (notify == nil) then
		local id = #self.pool + 1
		if (isCountdown == true) then
			notify = CountdownNotification:New(id, self.parent)
		else
			notify = Notification:New(id, self.parent)
		end
		
		notify:SetText("X") -- we need anything to get text height
		self.pool[id] = notify
		--dbg("Created new notification "..id)
	end
	
	if (self.scale) then
		notify:SetScale(self.scale)
	end	
		
	notify:SetDisplayTime(displayTime and displayTime or self.displayTime)
	
	table.sort(self.pool, function(a,b) 
		if (a:GetEndTime() < b:GetEndTime()) then
			return true
--		elseif (a:GetEndTime() > b:GetEndTime()) then
--			return false
		end
--		return a:GetLastUpdateTime() < b:GetLastUpdateTime()
		return false
	end)

	local height = 0
	for i = #self.pool, 1, -1 do
		if (not self.pool[i]:IsHidden() or self.pool[i] == notify) then
			self.pool[i]:SetAnchor(0, height)
			height = height + self.pool[i]:GetHeight()
		end
	end
	return notify:Show(text, self.precise)
end

function NotificationsPool:Stop(id) 
	if (id == nil or (id <= #self.pool and id > 0)) then
		for i = 1, #self.pool, 1 do
			if (self.pool[i]:GetId() == id or id == nil) then
				self.pool[i]:Stop()
			end
		end
	end
end

RaidNotifier = RaidNotifier or {}
RaidNotifier.Notification = Notification
RaidNotifier.NotificationsPool = NotificationsPool
