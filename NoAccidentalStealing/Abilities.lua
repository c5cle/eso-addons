
function NAS.InitializeAbility()
	
	if GetUnitClassId("player") ~= 5 then return end -- no point in loading if we are not a necromancer
	
	local criminalAbilities = {
		[122174] = true, -- Frozen Collosus
		[122395] = true, -- Pestilent Collosus,
		[122388] = true, -- Glacial Collossus
		
		[114860] = true, -- Blastbondes
		[117690] = true, -- Blighted Blastbones
		[117749] = true, -- Stalking Blastbones
		
		[114317] = true, -- Skeletal Mage
		[118680] = true, -- Skeletal Archer
		[118726] = true, -- Skeletal Arcanist
		
		[115001] = true, -- Bone Goliath Transformation
		[118664] = true, -- Pummeling Goliath
		[118279] = true, -- Ravenous Goliath
		
		[115710] = true, -- Spirit Mender
		[118912] = true, -- Spirit Guardian
		[118840] = true, -- Intensive Mender
	}

	local lastSlowDownTime = {}
	local function IsSlotBlocked(slotNum)
		if NAS.settings.criminalPressDuration == 0 then return false end
		if IsInGamepadPreferredMode() then return false end
		if lastSlowDownTime[slotNum] then
			if GetGameTimeMilliseconds() - lastSlowDownTime[slotNum] > NAS.settings.criminalPressDuration then
				return false
			end
		end
		return criminalAbilities[GetSlotBoundId(slotNum)] and not IsUnitInCombat("player")
	end
	
	ZO_PreHook("ZO_ActionBar_OnActionButtonDown", function(slotNum)
		lastSlowDownTime[slotNum] = GetGameTimeMilliseconds()
	end)

	ZO_PreHook("ZO_ActionBar_OnActionButtonUp", function(slotNum)
		lastSlowDownTime[slotNum] = nil
	end)

	ZO_PreHook("ZO_ActionBar_CanUseActionSlots", function()
		if IsUnitInCombat("player") then return end
		slotNum = tonumber(debug.traceback():match('keybind = "ACTION_BUTTON_(%d)'))
		if slotNum then
			if not lastSlowDownTime[slotNum] then return end -- this is a button down press
			if not IsSlotBlocked(slotNum) then return end -- not criminal
			ZO_Alert(UI_ALERT_CATEGORY_ERROR, SOUNDS.NEGATIVE_CLICK, SI_RESPECRESULT10)
			ZO_ActionBar_OnActionButtonUp(slotNum)
			return true
		end
	end)


	local ACTION_BUTTON_TEMPLATE = "ZO_ActionButton"
	local ULTIMATE_ABILITY_BUTTON_TEMPLATE = "ZO_UltimateActionButton"
	local function HandleSlotChanged(slotNum)
		local btn = ZO_ActionBar_GetButton(slotNum)
		if btn and not btn.noUpdates then
			btn:HandleSlotChanged()

			local buttonTemplate = ZO_GetPlatformTemplate(ACTION_BUTTON_TEMPLATE)

			if slotNum == ACTION_BAR_ULTIMATE_SLOT_INDEX + 1 then
				buttonTemplate = ZO_GetPlatformTemplate(ULTIMATE_ABILITY_BUTTON_TEMPLATE)
			end

			btn:ApplyStyle(buttonTemplate)
		end
	end

	EVENT_MANAGER:RegisterForEvent("NAS_BlockCriminalAbility", EVENT_PLAYER_COMBAT_STATE, function(_, inCombat)
		for slot = 3, 8 do
			HandleSlotChanged(slot)
		end
	end)

	local originalUpdateUseFailure = ActionButton.UpdateUseFailure
	function ActionButton:UpdateUseFailure(...)
		originalUpdateUseFailure(self, ...)
		local slotNum = self:GetSlot()
		self.useFailure = self.useFailure or IsSlotBlocked(slotNum)
	end
end



