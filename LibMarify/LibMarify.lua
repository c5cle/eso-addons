
LibMarify = {
    displayName = "|c3CB371" .. "Lib Marify" .. "|r",
    shortName = "LM",
    name = "LibMarify",
    version = "1.2.17",

    indent         = 0, 
    hookColor      = "FFAC00",
    checkColor     = "55FF00",
    overwriteColor = "4682b4",
    failedColor    = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_FAILED)):ToHex(),
    disabledColor  = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_DISABLED)):ToHex(),
}




function LibMarify:Choice(conditions, trueValue, falseValue)

    if conditions then
        if trueValue then
            return trueValue
        else
            return conditions
        end
    else
        return falseValue
    end
end




function LibMarify:Contains(text, ...)
    if text == nil or text == "" then
        return nil
    end
    if type(text) == "table" then
        local msg = "text is table! @Equal()"
        d("|c88aaff" .. self.name .. ":|r |cFF0000" .. msg .. "|r")
        return false
    end

    local keyList = {...}
    if type(keyList[1]) == "table" then
        keyList = keyList[1]
    end


    local lowerText = string.lower(text)
    local result
    for _, key in ipairs(keyList) do
        if key and key ~= "" then
            result, result2 = string.match(text, key)
            if result then
                return result, result2
            end

            local lowerKey = string.lower(key)
            if lowerText and lowerKey then
                result, result2 = string.match(lowerText, lowerKey)
                if result then
                    return result, result2
                end
            end
        end
    end
    return nil
end





function LibMarify:ContainsNumber(num, ...)

    if num == nil then
        return false
    end
    if type(num) == "table" then
        local msg = "num is table! @ContainsNumber()"
        d("|c88aaff" .. self.name .. ":|r |cFF0000" .. msg .. "|r")
        return false
    end

    local keyList = {...}
    if type(keyList[1]) == "table" then
        keyList = keyList[1]
    end
    for i, key in ipairs(keyList) do
        if num == key then
            return true
        end
    end
    return false
end




function LibMarify:Debug(text, ...)
    if self.isSilent then
        return
    end
    if self.savedVariables and self.savedVariables.isDebug then

        local color
        if string.match(text, "<<1>>") then
            if ... ~= nil then
                local options = {...}
                color = options[#options]
                if (type(color) == "string")
                    and (string.len(color) == 6)
                    and (string.match(color, "^[0-9a-fA-F]*$")) then

                    table.remove(options, #options)
                else
                    color = nil
                end
                text = zo_strformat(text, unpack(options))
            end
        else
            color = ...
        end


        local indentTxt = ""
        if self.indent > 0 then
            indentTxt = string.rep("　", self.indent * 2)
        end


        if color then
            d("|c" .. color .. (self.shortName or self.name) .. ":" .. indentTxt .. text .. "|r")
        else
            d((self.shortName or self.name) .. ":" .. indentTxt .. text)
        end

        local log = tostring(indentTxt .. text):gsub("　", "  "):gsub("|c5c5c5c", ""):gsub("|cffff66", ""):gsub("|r", "")
        if self.savedVariables.debugLog == nil then
            self.savedVariables.debugLog = {}
        end
        table.insert(self.savedVariables.debugLog, log)
    end
end




function LibMarify:DebugFunction(callFunction)
    if self.isSilent then
        return
    end
    if self.savedVariables and self.savedVariables.isDebug then
        local text = callFunction()
        d((self.shortName or self.name) .. ":" .. text)

        local log = tostring(text):gsub("　", "  "):gsub("|c5c5c5c", ""):gsub("|cffff66", ""):gsub("|r", "")
        if self.savedVariables.debugLog == nil then
            self.savedVariables.debugLog = {}
        end
        table.insert(self.savedVariables.debugLog, log)
    end
end




function LibMarify:DebugIfMarify(text, ...)

    if self.isSilent then
        return
    end
    if GetDisplayName() ~= "@Marify" then
        return
    end


    local color
    if string.match(text, "<<1>>") then
        if ... ~= nil then
            local options = {...}
            color = options[#options]
            if (type(color) == "string")
                and (string.len(color) == 6)
                and (string.match(color, "^[0-9a-fA-F]*$")) then

                table.remove(options, #options)
            else
                color = nil
            end
            text = zo_strformat(text, unpack(options))
        end
    else
        color = ...
    end


    local indentTxt = ""
    if self.indent > 0 then
        indentTxt = string.rep("　", self.indent * 2)
    end


    if color then
        d("|c" .. color .. (self.shortName or self.name) .. ":" .. indentTxt  .. text .. "|r")
    else
        d((self.shortName or self.name) .. ":" .. indentTxt  .. text)
    end
end




function LibMarify:Equal(text, ...)

    if text == nil or text == "" then
        return false
    end
    if type(text) == "table" then
        local msg = "text is table! @Equal()"
        d("|c88aaff" .. self.name .. ":|r |cFF0000" .. msg .. "|r")
        return false
    end

    local keyList = {...}
    if type(keyList[1]) == "table" then
        keyList = keyList[1]
    end


    local lowerText = string.lower(text)
    local result
    for _, key in ipairs(keyList) do
        if key and key ~= "" then
            if text == key then
                return true
            end

            local lowerKey = string.lower(key)
            if lowerText == lowerKey then
                return true
            end
        end
    end
    return nil
end




function LibMarify:GetBankIdList(isAll)

    local list = self:GetHouseBankIdList(isAll)
    table.insert(list, 1, BAG_BANK)
    return list
end




function LibMarify:GetCraftingType(itemType, itemLink)

    if itemType == ITEMTYPE_NONE then
        return nil
    end
    if itemLink == "" then
        return nil
    end


    if self:Contains(itemType, ITEMTYPE_WEAPON, ITEMTYPE_ARMOR) then
        if itemType == ITEMTYPE_WEAPON then
            if self:Contains(GetItemLinkWeaponType(itemLink), WEAPONTYPE_BOW,
                                                              WEAPONTYPE_FIRE_STAFF,
                                                              WEAPONTYPE_FROST_STAFF,
                                                              WEAPONTYPE_LIGHTNING_STAFF,
                                                              WEAPONTYPE_HEALING_STAFF,
                                                              WEAPONTYPE_SHIELD) then
                return CRAFTING_TYPE_WOODWORKING
            else
                return CRAFTING_TYPE_BLACKSMITHING
            end

        elseif self:Contains(GetItemLinkEquipType(itemLink), EQUIP_TYPE_NECK, EQUIP_TYPE_RING) then
            return CRAFTING_TYPE_JEWELRYCRAFTING

        elseif itemType == ITEMTYPE_ARMOR then

            local armorType = GetItemLinkArmorType(itemLink)
            if armorType == ARMORTYPE_HEAVY then
                return CRAFTING_TYPE_BLACKSMITHING
            else
                return CRAFTING_TYPE_CLOTHIER, armorType
            end

        else
            return nil
        end
    end
    return nil
end




function LibMarify:GetCraftingTypeByLink(itemLink)

    local itemType, specializedItemType = GetItemLinkItemType(itemLink)
    if itemType ~= ITEMTYPE_MASTER_WRIT then
        return
    end

    local list = {
        ["blacksmithing"]   = {CRAFTING_TYPE_BLACKSMITHING,     1},
        ["clothier"]        = {CRAFTING_TYPE_CLOTHIER,          1},
        ["woodworking"]     = {CRAFTING_TYPE_WOODWORKING,       1},
        ["jewelry"]         = {CRAFTING_TYPE_JEWELRYCRAFTING,   1},
        ["enchanting"]      = {CRAFTING_TYPE_ENCHANTING,        1},
        ["provisioning"]    = {CRAFTING_TYPE_PROVISIONING,      8},
    }
    local itemIcon = string.gsub(GetItemLinkIcon(itemLink), ".*/master_writ.(.*).dds", "%1")
    --self:Debug("itemType=" .. tostring(itemType)
    --        .. " specializedItemType=" .. tostring(specializedItemType)
    --        .. " itemIcon=" .. tostring(itemIcon))

    local result = list[itemIcon]
    if result then
        return unpack(result)
    end

    if self:Contains(itemIcon, "alchemy") then
        local arg1 = string.match(itemLink, "|H%d:item:%d+:%d+:%d+:%d+:%d+:%d+:(%d+):.*")
        if arg1 == "199" then
            return CRAFTING_TYPE_ALCHEMY, 16, ITEMTYPE_POTION

        elseif arg1 == "239" then
            return CRAFTING_TYPE_ALCHEMY, 16, ITEMTYPE_POISON

        end
    end


    if self:Contains(itemIcon, "witchesfestival", "newlife") then
        local arg1, arg2, arg3 = string.match(itemLink, "|H%d:item:%d+:%d+:%d+:%d+:%d+:%d+:(%d+):(%d+):(%d+):.*")
        if arg1 ~= "0" and arg2 == "0" and arg3 == "0" then
            local resultItemLink = zo_strformat("|H1:item:<<1>>:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h", arg1)
            local resultItemType = GetItemLinkItemType(resultItemLink)

            if self:Contains(resultItemType, ITEMTYPE_FOOD, ITEMTYPE_DRINK) then
                if self:Contains(itemIcon, "witchesfestival") then
                    return CRAFTING_TYPE_PROVISIONING, 4
                else
                    return CRAFTING_TYPE_PROVISIONING, 12
                end
            end

        elseif arg1 == "199" then
            return CRAFTING_TYPE_ALCHEMY, 16, ITEMTYPE_POTION

        elseif arg1 == "239" then
            return CRAFTING_TYPE_ALCHEMY, 16, ITEMTYPE_POISON

        end
    end
    return nil, nil
end




function LibMarify:GetHouseBankIdList(isAll)

    if (not isAll)
        and IsOwnerOfCurrentHouse()
        and GetInteractionType() == INTERACTION_BANK then

        local bagId = GetBankingBag()
        if IsHouseBankBag(bagId) then
            return {bagId}
        else
            return {}
        end

    elseif isAll or IsOwnerOfCurrentHouse() then
        local bagIdList = {
            BAG_HOUSE_BANK_ONE,
            BAG_HOUSE_BANK_TWO,
            BAG_HOUSE_BANK_THREE,
            BAG_HOUSE_BANK_FOUR,
            BAG_HOUSE_BANK_FIVE,
            BAG_HOUSE_BANK_SIX,
            BAG_HOUSE_BANK_SEVEN,
            BAG_HOUSE_BANK_EIGHT,
            BAG_HOUSE_BANK_NINE,
            BAG_HOUSE_BANK_TEN}
        local list = {}
        local collectibleId
        local unlockState
        for _, bagId in pairs(bagIdList) do
            collectibleId = GetCollectibleForHouseBankBag(bagId)
            unlockState = GetCollectibleUnlockStateById(collectibleId)
            if collectibleId ~= 0 and unlockState ~= COLLECTIBLE_UNLOCK_STATE_LOCKED then
                list[#list + 1] = bagId
            end
        end
        return list
    end
    return {}
end




function LibMarify:GetItemBagList(isAll)

    local list = self:GetHouseBankIdList(isAll)
    if isAll then
        table.insert(list, 1, BAG_BACKPACK)
        table.insert(list, 1, BAG_SUBSCRIBER_BANK)
        table.insert(list, 1, BAG_BANK)

    elseif IsOwnerOfCurrentHouse() and GetInteractionType() == INTERACTION_BANK then
        table.insert(list, 1, BAG_SUBSCRIBER_BANK)
        table.insert(list, 1, BAG_BANK)

    end
    return list
end




function LibMarify:IndentClear()
    self.indent = 0
end




function LibMarify:Indent()
    self.indent = self.indent + 1
end




function LibMarify:IsDebug()
    if self.isSilent then
        return false
    end
    return self.savedVariables and self.savedVariables.isDebug
end




function LibMarify:Message(msg, color)
    if self.isSilent then
        return
    end
    if self.savedVariables and self.savedVariables.isLog == false then
        return
    end
    if color then
        d("|c88aaff" .. self.name .. ":|r |c" .. color .. msg .. "|r")
    else
        d("|c88aaff" .. self.name .. ":|r |cffffff" .. msg .. "|r")
    end
    if self.savedVariables.isDebug then
        local log = self.name .. tostring(msg):gsub("　", "  "):gsub("|c5c5c5c", ""):gsub("|cffff66", ""):gsub("|r", "")
        if self.savedVariables.debugLog == nil then
            self.savedVariables.debugLog = {}
        end
        table.insert(self.savedVariables.debugLog, log)
    end
end




function LibMarify:NextEmptySlot(bagId, slotIndex, isRetry)

    local newSlotIndex = slotIndex
    if newSlotIndex == nil then
        newSlotIndex = FindFirstEmptySlotInBag(bagId)
    else
        newSlotIndex = ZO_GetNextBagSlotIndex(bagId, newSlotIndex)
    end


    while newSlotIndex and GetItemId(bagId, newSlotIndex) ~= 0 do
        newSlotIndex = ZO_GetNextBagSlotIndex(bagId, newSlotIndex)
    end


    if isRetry then
        return newSlotIndex
    end


    if newSlotIndex == nil then
        newSlotIndex = self:NextEmptySlot(bagId, nil, true)
    end
    return newSlotIndex
end

function LibMarify:OnAddOnLoaded(event, addonName)

    if addonName ~= LibMarify.name then
        return
    end
    SLASH_COMMANDS["/langen"] = function() SetCVar("language.2", "en") end
    SLASH_COMMANDS["/langjp"] = function() SetCVar("language.2", "jp") end
    SLASH_COMMANDS["/langde"] = function() SetCVar("language.2", "de") end
    SLASH_COMMANDS["/langfr"] = function() SetCVar("language.2", "fr") end
    SLASH_COMMANDS["/langru"] = function() SetCVar("language.2", "ru") end
    if EsoPL then
        SLASH_COMMANDS["/langpl"] = function() SetCVar("language.2", "pl") end
    end

end




function LibMarify:Outdent(outdent)
    self.indent = math.max(self.indent - (outdent or 1), 0)
end




function LibMarify:PostHook(objectTable, existingFunctionName, hookFunction)

    if type(objectTable) == "table" then
        SecurePostHook(objectTable, existingFunctionName, hookFunction)
        return
    end

    local existingFunction = objectTable[existingFunctionName]
    if existingFunction == nil then
        return
    end
    if type(existingFunction) ~= "function" then
        return
    end

    local newFunction = function(...)
        local result = existingFunction(...)
        hookFunction(...)
        return result
    end
    objectTable[existingFunctionName] = newFunction
end




function LibMarify:PostHookForAGS(objectTable, existingFunctionName, hookFunction)

    --if AwesomeGuildStore and AwesomeGuildStore.class.ItemDatabase then
    --    self:PostHook(AwesomeGuildStore.class.ItemDatabase, "SetupItemTooltipHook", function()
    --        self:PostHook(objectTable, existingFunctionName, hookFunction)
    --    end)
    --else
        self:PostHook(objectTable, existingFunctionName, hookFunction)
    --end
end




function LibMarify:RemoveWithValue(list, text)

    if text == nil or text == "" then
        return false
    end
    if type(text) == "table" then
        local msg = "text is table! @RemoveWithValue()"
        d("|c88aaff" .. self.name .. ":|r |cFF0000" .. msg .. "|r")
        return false
    end

    if table.maxn(list) == 0 then
        for key, value in pairs(list) do
            if value == text then
                list[key] = nil
                return true
            end
        end
    else
        for i, value in ipairs(list) do
            if value == text then
                table.remove(list, i)
                return true
            end
        end
    end
    return false
end

