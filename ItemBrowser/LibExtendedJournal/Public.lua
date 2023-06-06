local Internal = LibExtendedJournalInternal
local Public = LibExtendedJournal

local Controls = Internal.controls
local TooltipExtension = Internal.tooltipExtension


--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

function Public.Show( descriptor, toggle )
	Internal.LazyInitialize(descriptor)

	if (descriptor and descriptor ~= ZO_MenuBar_GetSelectedDescriptor(Controls.menu)) then
		ZO_MenuBar_SelectDescriptor(Controls.menu, descriptor, true)
		toggle = false
	end

	if (not SCENE_MANAGER:IsShowing(Internal.SCENE_NAME)) then
		SCENE_MANAGER:Show(Internal.SCENE_NAME)
		if (Controls.mainMenu and ZO_MenuBar_GetSelectedDescriptor(Controls.mainMenu) ~= Internal.name) then
			ZO_MenuBar_SelectDescriptor(Controls.mainMenu, Internal.name, true)
		end
	elseif (toggle == true) then
		SCENE_MANAGER:ShowBaseScene()
	end
end

function Public.RegisterTab( descriptor, tabData )
	tabData.descriptor = descriptor
	Internal.tabs[descriptor] = tabData

	-- Initialize keybind
	if (type(tabData.binding) == "string") then
		ZO_CreateStringId("SI_BINDING_NAME_" .. tabData.binding, Internal.GetString(tabData.name))
	end

	-- Register slash commands
	if (type(tabData.slashCommands) == "table") then
		local showTab = function( )
			Public.Show(descriptor)
		end
		for _, command in ipairs(tabData.slashCommands) do
			if (not SLASH_COMMANDS[command]) then
				SLASH_COMMANDS[command] = showTab
			end
		end
	end
end

function Public.IsTabActive( descriptor )
	return descriptor == (Internal.activeTab and Internal.activeTab.descriptor)
end

function Public.InvokeSettings( )
	if (Internal.settingsVisible) then
		LibAddonMenu2:OpenToPanel(Internal.activeTab.settingsPanel)
	end
end


--------------------------------------------------------------------------------
-- Tooltips
--------------------------------------------------------------------------------

function Public.InitializeTooltip( control )
	if (not control) then control = ExtendedJournalItemTooltip end
	if (Internal.initialized) then
		InitializeTooltip(control, Controls.frame, TOPRIGHT, -100, 0, TOPLEFT)
	end
	return control
end

function Public.ItemTooltip( item, control )
	control = Public.InitializeTooltip(control)
	if (type(item) == "string") then
		control:SetLink(item)
	elseif (type(item) == "table") then
		if (type(item.collectibleId) == "number") then
			control:SetCollectible(item.collectibleId, true, false)
		elseif (type(item.antiquityId) == "number") then
			if (GetAntiquitySetId(item.antiquityId) == 0) then
				control:SetAntiquityLead(item.antiquityId)
			else
				control:SetAntiquitySetFragment(item.antiquityId)
			end
		end
	end
	return control
end

function Public.TooltipExtensionInitialize( showDivider, textLeft, textRight )
	local control = TooltipExtension.control
	control:GetNamedChild("Divider"):SetHidden(not showDivider)
	control:GetNamedChild("Left"):SetText(textLeft or "")
	control:GetNamedChild("Right"):SetText(textRight or "")
	TooltipExtension.index = 1
end

function Public.TooltipExtensionAddSection( textHeader, textBody )
	local control = Internal.TooltipExtensionGetSection()
	control:GetNamedChild("Header"):SetText(textHeader or "")
	control:GetNamedChild("Body"):SetText(textBody or "")
	control:SetHidden(false)
end

function Public.TooltipExtensionFinalize( tooltipControl, showEmpty )
	local control = TooltipExtension.control
	local sections = TooltipExtension.sections
	local index = TooltipExtension.index

	-- Only show if sections were added, unless showEmpty is specified
	if (index > 1 or showEmpty) then
		-- Hide remaining unused sections
		for i = index, #sections do
			sections[i]:SetHidden(true)
		end
		tooltipControl:AddControl(control)
		control:SetAnchor(TOP)
	end
end


--------------------------------------------------------------------------------
-- Wrapper for ZO_ComboBox:SelectItemByIndex
--------------------------------------------------------------------------------

function Public.SelectComboBoxItemByIndex( control, index, ... )
	if (type(index) ~= "number" or index < 1 or index > control:GetNumItems()) then
		index = 1
	end
	control:SelectItemByIndex(index, ...)
end
