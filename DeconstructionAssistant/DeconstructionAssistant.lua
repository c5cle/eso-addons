DeconAssist = {}

DeconAssist.Controls = {
    ["All"] = {
        ["texture"] = {
            ["up"]   = "/esoui/art/inventory/inventory_tabicon_all_up.dds",
            ["down"] = "/esoui/art/inventory/inventory_tabicon_all_down.dds",
            ["over"] = "/esoui/art/inventory/inventory_tabicon_all_over.dds",
            }},
    ["Inventory"] = {
        ["texture"] = {
            ["up"]   = "/esoui/art/icons/achievements_indexicon_crafting_up.dds",
            ["down"] = "/esoui/art/icons/achievements_indexicon_crafting_down.dds",
            ["over"] = "/esoui/art/icons/achievements_indexicon_crafting_over.dds",
            }},
    ["Bank"] = {
        ["texture"] = {
            ["up"]   = "/esoui/art/bank/bank_tabicon_gold_up.dds",
            ["down"] = "/esoui/art/bank/bank_tabicon_gold_down.dds",
            ["over"] = "/esoui/art/bank/bank_tabicon_gold_over.dds",
            }},
    ["Intricate"] = {
        ["texture"] = {
            ["up"]   = "/esoui/art/crafting/smithing_tabicon_research_up.dds",
            ["down"] = "/esoui/art/crafting/smithing_tabicon_research_down.dds",
            ["over"] = "/esoui/art/crafting/smithing_tabicon_research_over.dds",
            }},
    }
DeconAssist.name = "DeconstructionAssistant"
DeconAssist.Mode = "All"
DeconAssist.LastItemType = ""
DeconAssist.LastSubWeaponType = ""
DeconAssist.LastFilter = ""
DeconAssist.DeconItemList = {}
DeconAssist.isUniversalDecon = false
DeconAssist.SmithingObject = SMITHING
DeconAssist.NPCObject = UNIVERSAL_DECONSTRUCTION
DeconAssist.RetraitObject = ZO_RETRAIT_KEYBOARD
DeconAssist.DeconButtonGroup = {
    {
        name = "Select All",
        keybind = "UI_SHORTCUT_QUATERNARY",
        callback = function() DeconAssist.SelectAll() end,
    },
    alignment = KEYBIND_STRIP_ALIGN_CENTER,
}
DeconAssist.CraftingTypes = {
    Deconstruction = {
        Name = "DeconstructionAssistant",
        PanelObject = DeconAssist.SmithingObject.deconstructionPanel,
        PanelName = ZO_SmithingTopLevelDeconstructionPanelInventory,
        TabName = CRAFT_STATION_SMITHING_DECONSTRUCTION_TABS
    },
    Improvement = {
        Name = "ImprovHelper",
        PanelObject = DeconAssist.SmithingObject.improvementPanel,
        PanelName = ZO_SmithingTopLevelImprovementPanelInventory,
        TabName = CRAFT_STATION_SMITHING_IMPROVEMENT_TABS
    },
    Retrait = {
        Name = "RetraitHelper",
        PanelObject = DeconAssist.RetraitObject,
        PanelName =  ZO_RetraitStation_KeyboardTopLevelRetraitPanelInventory,
        TabName = ZO_RETRAIT_TABS
    },
    NPC = {
        Name = "NPCHelper",
        PanelObject = DeconAssist.NPCObject.deconstructionPanel,
        PanelName = ZO_UniversalDeconstructionTopLevel_KeyboardPanelInventory,
        TabName = UNIVERSAL_DECONSTRUCTION_Tabs
    }
}

function DeconAssist.RemoveItemFromDeconList(eventCode, bagId, slotIndex, isNewItem, itemSoundCategory, updateReason, stackCountChange)
    if (stackCountChange == -1) then
        for index, item in ipairs(DeconAssist.DeconItemList) do
            if (item.bagId == bagId and item.slotIndex == slotIndex) then
                table.remove(DeconAssist.DeconItemList, index)
            end
        end
    end
end

function DeconAssist.ClearDeconList()
    if DeconAssist.isUniversalDecon then
        DeconAssist.CraftingTypes.NPC.PanelObject:ClearSelections()
    else
        DeconAssist.CraftingTypes.Deconstruction.PanelObject:ClearSelections()
    end
    for k,v in pairs(DeconAssist.DeconItemList) do
        DeconAssist.DeconItemList[k] = nil
    end
end

function DeconAssist.CheckIfDeconListNeedsToBeCleared(bagId, slotIndex)
    local itemType = GetItemType(bagId, slotIndex)
    local currentFilter

    local function IsStaff(weapon)
        return weapon == WEAPONTYPE_BOW or weapon == WEAPONTYPE_FIRE_STAFF or weapon == WEAPONTYPE_FROST_STAFF or
        weapon == WEAPONTYPE_LIGHTNING_STAFF or
        weapon == WEAPONTYPE_HEALING_STAFF
    end
    if DeconAssist.isUniversalDecon then
        currentFilter = DeconAssist.CraftingTypes.NPC.PanelObject.inventory:GetCurrentFilter()
        if currentFilter ~= DeconAssist.LastFilter then
            DeconAssist.LastFilter = currentFilter
            DeconAssist.ClearDeconList()
        end
    else
        if DeconAssist.LastItemType ~= itemType then
            DeconAssist.LastItemType = itemType
            DeconAssist.ClearDeconList()
        end
        if itemType == ITEMTYPE_WEAPON then
            local weaponSubtype = GetItemWeaponType(bagId, slotIndex)
            if IsStaff(weaponSubtype) and IsStaff(DeconAssist.LastSubWeaponType) ~= true then
                DeconAssist.ClearDeconList()
            end
            if weaponSubtype == WEAPONTYPE_SHIELD and IsStaff(DeconAssist.LastSubWeaponType) then
                DeconAssist.ClearDeconList()
            end
            DeconAssist.LastSubWeaponType = weaponSubtype
        end
    end
end

function DeconAssist.FilterItem(self, bagId, slotIndex, ...)
    DeconAssist.CheckIfDeconListNeedsToBeCleared(bagId, slotIndex)

    local item = {}
    item.bagId = bagId
    item.slotIndex = slotIndex

    local alreadyAdded = false

    for i, v in ipairs(DeconAssist.DeconItemList) do
        if (v.bagId == bagId and v.slotIndex == slotIndex) then
            alreadyAdded = true
        end
    end

    if DeconAssist.Mode == "Inventory" then
        if bagId == BAG_BACKPACK then
            if (alreadyAdded == false) then
                table.insert(DeconAssist.DeconItemList, item)
            end
            return false
        else
            return true
        end
    end
    
    if DeconAssist.Mode == "Bank" then
        if bagId == BAG_BANK or bagId == BAG_SUBSCRIBER_BANK or bagId == BAG_GUILDBANK then
            if (alreadyAdded == false) then
                table.insert(DeconAssist.DeconItemList, item)
            end
            return false
        else
            return true
        end
    end
    
    if DeconAssist.Mode == "Intricate" then
        local itemTrait = GetItemTrait(bagId, slotIndex)
        if itemTrait == ITEM_TRAIT_TYPE_ARMOR_INTRICATE
        or itemTrait == ITEM_TRAIT_TYPE_WEAPON_INTRICATE
        or itemTrait == ITEM_TRAIT_TYPE_JEWELRY_INTRICATE then
            if (alreadyAdded == false) then
                table.insert(DeconAssist.DeconItemList, item)
            end
            return false
        else
            return true
        end
    end
    if (alreadyAdded == false) then
        table.insert(DeconAssist.DeconItemList, item)
    end
    return false
end

function DeconAssist.SelectAll()
    SOUNDS.SMITHING_ITEM_TO_EXTRACT_PLACED = SOUNDS.NONE
    for index, item in ipairs(DeconAssist.DeconItemList) do
        local itemLink = GetItemLink(item.bagId, item.slotIndex, LINK_STYLE_BRACKETS)
        if DeconAssist.isUniversalDecon then
            DeconAssist.NPCObject:AddItemToCraft(item.bagId, item.slotIndex)
        else
            DeconAssist.SmithingObject:AddItemToCraft(item.bagId, item.slotIndex)
        end
    end
    SOUNDS.SMITHING_ITEM_TO_EXTRACT_PLACED = "Smithing_Item_To_Extract_Placed"
    PlaySound(SOUNDS.SMITHING_ITEM_TO_EXTRACT_PLACED)
end

function DeconAssist.CreateButton(craftingType, controlName, position)
    if WINDOW_MANAGER:GetControlByName(craftingType.Name .. controlName, "") then 
        return false 
    end
    
    local function ShowTooltip(self)
        InitializeTooltip(InformationTooltip, self, BOTTOM, 0, 0)
        SetTooltipText(InformationTooltip, controlName)
    end
 
    local function HideTooltip(self)
        ClearTooltip(InformationTooltip)
    end

    local function HandleClickEvent(modeName)
        DeconAssist.ClearDeconList()
        DeconAssist.Mode = modeName
        for type in pairs(DeconAssist.CraftingTypes) do
            local fullType = DeconAssist.CraftingTypes[type]
            for name in pairs(DeconAssist.Controls) do
                if WINDOW_MANAGER:GetControlByName(fullType.Name .. name, "") then
                    WINDOW_MANAGER:GetControlByName(fullType.Name .. name, ""):SetState(DeconAssist.Mode == name and BSTATE_PRESSED or BSTATE_NORMAL)
                    fullType.PanelObject.inventory:HandleDirtyEvent()
                end
            end
        end
    end

    local button = WINDOW_MANAGER:CreateControl(craftingType.Name .. controlName, craftingType.PanelName, CT_BUTTON)
    
    if button then
        button.name = controlName
        button:SetDrawTier(DT_HIGH)
        button:SetDrawLayer(DL_CONTROLS)
        button:SetNormalTexture(DeconAssist.Controls[controlName].texture.up) 
        button:SetPressedTexture(DeconAssist.Controls[controlName].texture.down) 
        button:SetMouseOverTexture(DeconAssist.Controls[controlName].texture.over)
        button:SetState(DeconAssist.Mode == controlName and BSTATE_PRESSED or BSTATE_NORMAL)
        button:SetClickSound(SOUNDS.MENU_BAR_CLICK)
        button:SetDimensions(56, 56)
        button:SetHandler("OnClicked", function(self)
            HandleClickEvent(self.name)
        end)
        button:SetAnchor(TOPLEFT, craftingType.TabName, TOPLEFT, 48 + 45 * position, 2)
        button:SetMouseEnabled(true)
        button:SetHandler("OnMouseEnter", function(self) ShowTooltip(self) end)
        button:SetHandler("OnMouseExit", function(self) HideTooltip(self) end)
    end
    return false
end

function DeconAssist.EndDeconChanges()
    KEYBIND_STRIP:RemoveKeybindButtonGroup(DeconAssist.DeconButtonGroup)
    DeconAssist.LastItemType = ""
    DeconAssist.LastSubWeaponType = ""
    DeconAssist.LastFilter = ""
    DeconAssist.ClearDeconList()
end

function DeconAssist.BeginDeconChanges()
    local checkBox
    KEYBIND_STRIP:AddKeybindButtonGroup(DeconAssist.DeconButtonGroup)
    if DeconAssist.isUniversalDecon then
        checkBox = DeconAssist.NPCObject.deconstructionPanel.inventory.control:GetNamedChild("IncludeBanked")
    else
        checkBox = DeconAssist.SmithingObject.deconstructionPanel.inventory.control:GetNamedChild("IncludeBanked")
    end
    ZO_CheckButton_SetCheckState(checkBox, true)
    checkBox:SetHidden(true)
end

function DeconAssist.CreateButtons(craftingType)
    DeconAssist.CreateButton(craftingType,"All", 0)
    DeconAssist.CreateButton(craftingType,"Inventory", 1)
    DeconAssist.CreateButton(craftingType,"Bank", 2)
    DeconAssist.CreateButton(craftingType,"Intricate",3)
end

DeconAssist.CheckIfDeconAssistant = function(eventCode, craftingType, sameStation, craftingMode)
    if ZO_Smithing_IsUniversalDeconstructionCraftingMode(craftingMode) then
        DeconAssist.isUniversalDecon = true
        DeconAssist.CreateButtons(DeconAssist.CraftingTypes.NPC)
        DeconAssist.BeginDeconChanges()
    end
end

function DeconAssist:RegisterHooks()
    ZO_PreHook(UNIVERSAL_DECONSTRUCTION.deconstructionPanel.inventory, "AddItemData", DeconAssist.FilterItem)
    ZO_PreHook(SMITHING.deconstructionPanel.inventory, "AddItemData", DeconAssist.FilterItem)
    ZO_PreHook(SMITHING.improvementPanel.inventory, "AddItemData", DeconAssist.FilterItem)
    ZO_PreHook(ZO_RETRAIT_KEYBOARD.inventory, "AddItemData", DeconAssist.FilterItem)
    ZO_PreHook(ZO_Smithing, "SetMode", function(smithing_obj, mode)
        if mode == SMITHING_MODE_DECONSTRUCTION then
            DeconAssist.isUniversalDecon = false
            DeconAssist.CreateButtons(DeconAssist.CraftingTypes.Deconstruction)
            DeconAssist.BeginDeconChanges()
        elseif mode == SMITHING_MODE_IMPROVEMENT then
            DeconAssist.CreateButtons(DeconAssist.CraftingTypes.Improvement)
            DeconAssist.EndDeconChanges()
        else
            DeconAssist.EndDeconChanges()
        return false
        end
    end)
    ZO_PreHook(ZO_RetraitStation_Keyboard, "SetMode", function(retrait_obj, mode)
        if mode == ZO_RETRAIT_MODE_RETRAIT then
            DeconAssist.CreateButtons(DeconAssist.CraftingTypes.Retrait)
        return false
        end
    end)
end

function DeconAssist:RegisterEvents()
    EVENT_MANAGER:RegisterForEvent("DeconAssist_CraftingStationInteract", EVENT_CRAFTING_STATION_INTERACT, DeconAssist.CheckIfDeconAssistant)
    EVENT_MANAGER:RegisterForEvent("DeconAssist_InventorySlotUpdate", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, DeconAssist.RemoveItemFromDeconList)
    EVENT_MANAGER:RegisterForEvent("DeconAssist_EndCraftingStationInteract", EVENT_END_CRAFTING_STATION_INTERACT, DeconAssist.EndDeconChanges)
end

function DeconAssist.Initialize()
    DeconAssist:RegisterEvents()
    DeconAssist:RegisterHooks()
end

function DeconAssist.OnAddOnLoaded(event, addonName)
    if addonName == DeconAssist.name then
        DeconAssist.Initialize()
        EVENT_MANAGER:UnregisterForEvent(DeconAssist.name, EVENT_ADD_ON_LOADED)
    end
end

EVENT_MANAGER:RegisterForEvent(DeconAssist.name, EVENT_ADD_ON_LOADED, DeconAssist.OnAddOnLoaded)