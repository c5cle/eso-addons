local lls = LibLootSummary

local List = ZO_Object:Subclass()
lls.List = List

local addQuantity, appendText, coalesce, defaultChat, getChildTable, mergeTables, sortByCurrencyName, sortByItemName, sortByQuality, isSetItemNotCollected, formatCount, getPlural
local qualityChoices, qualityChoicesValues, delimiterChoices, delimiterChoicesValues
local generateLam2EnabledOption, generateLam2QualityOption, generateLam2IconsOption, generateLam2CollectionOption, generateLam2IconSizeOption, generateLam2TraitsOption,
      generateLam2HideSingularOption, generateLam2CombineDuplicatesOption, generateLam2SortOption, generateLam2DelimiterOption, generateLam2LinkStyleOption,
      generateLam2CounterOption
local GetItemLinkFunctionalQuality, ZO_CachedStrFormat, GetCurrencyName = GetItemLinkFunctionalQuality, ZO_CachedStrFormat, GetCurrencyName
local zo_strsub, zo_strgsub, zo_strlen, zo_min, zo_strformat = zo_strsub, zo_strgsub, zo_strlen, zo_min, zo_strformat
local tostring, pairs, ipairs = tostring, pairs, ipairs
local tableInsert, stringFormat, tableSort, stringFind = table.insert, string.format, table.sort, string.find
local linkFormat = "|H%s:item:%s:1:1:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local collectionIcon = "EsoUI/Art/treeicons/gamepad/achievement_categoryicon_collections.dds"
local CHAT_DEFAULTS, OPTIONS_DEFAULTS, RENAMED_OPTIONS

function lls.List:New(options)
    local instance = ZO_Object.New(self)
    instance:Initialize(options)
    return instance
end

function lls.List:Initialize(params)
    self:Reset()
    if params == nil then
        params = {}
    end
    for chatSetting, chatDefault in pairs(CHAT_DEFAULTS) do
        self[chatSetting] = coalesce(params[chatSetting], chatDefault)
    end
    
    -- Require a Print function in the chat proxy that is passed
    if type(self.chat.Print) ~= "function" then
        self.chat = CHAT_DEFAULTS.chat
    end
    
    self.options = params
    self.defaults = {}
    self.counter = 0
end

function lls.List:AddCurrency(currencyType, quantity)
    if not self:IsEnabled() then
        return
    end

    addQuantity(self.currencyList, self.currencyKeys, currencyType, quantity, self:GetOption('combineDuplicates'))
end
function lls.List:AddItem(bagId, slotIndex, quantity)
    if not self:IsEnabled() then
        return
    end

    if not quantity then
        local stackSize, maxStackSize = GetSlotStackSize(bagId, slotIndex)
        quantity = zo_min(stackSize, maxStackSize)
    end

    self:AddItemLink(GetItemLink(bagId, slotIndex, self:GetOption('linkStyle')), quantity, true)
end
function lls.List:AddItemId(itemId, quantity)
    if not self:IsEnabled() then
        return
    end

    self:AddItemLink(stringFormat(linkFormat, self:GetOption('linkStyle'), itemId), quantity, true)
end
function lls.List:AddItemLink(itemLink, quantity, dontChangeStyle)
    if not self:IsEnabled() then
        return
    end

    if not dontChangeStyle then
        itemLink = zo_strgsub(itemLink, "|H[0-1]:", "|H"..tostring(self:GetOption('linkStyle'))..":")
    end

    addQuantity(self.itemList, self.itemKeys, itemLink, quantity, self:GetOption('combineDuplicates'))
end

function lls.List:GenerateLam2ItemOptions(addonName, options, defaults, ...)
    self:SetOptions(options, defaults, ...)
    return generateLam2EnabledOption(self, addonName, SI_LLS_ITEM_SUMMARY, SI_LLS_ITEM_SUMMARY_TOOLTIP),
        generateLam2QualityOption(self, SI_LLS_MIN_ITEM_QUALITY, SI_LLS_MIN_ITEM_QUALITY_TOOLTIP),
        generateLam2IconsOption(self, SI_LLS_SHOW_ITEM_ICONS, SI_LLS_SHOW_ITEM_ICONS_TOOLTIP),
        generateLam2CollectionOption(self, SI_LLS_SHOW_ITEM_NOT_COLLECTED, SI_LLS_SHOW_ITEM_NOT_COLLECTED_TOOLTIP),
        generateLam2IconSizeOption(self),
        generateLam2TraitsOption(self, SI_LLS_SHOW_ITEM_TRAITS, SI_LLS_SHOW_ITEM_TRAITS_TOOLTIP),
        generateLam2HideSingularOption(self,  SI_LLS_HIDE_ITEM_SINGLE_QTY, SI_LLS_HIDE_ITEM_SINGLE_QTY_TOOLTIP),
        generateLam2CombineDuplicatesOption(self),
        generateLam2SortOption(self),
        generateLam2DelimiterOption(self),
        generateLam2LinkStyleOption(self),
        generateLam2CounterOption(self)
end

function lls.List:GenerateLam2LootOptions(addonName, options, defaults, ...)
    self:SetOptions(options, defaults, ...)
    return generateLam2EnabledOption(self, addonName, SI_LLS_LOOT_SUMMARY, SI_LLS_LOOT_SUMMARY_TOOLTIP),
        generateLam2QualityOption(self, SI_LLS_MIN_LOOT_QUALITY, SI_LLS_MIN_LOOT_QUALITY_TOOLTIP),
        generateLam2IconsOption(self, SI_LLS_SHOW_LOOT_ICONS, SI_LLS_SHOW_LOOT_ICONS_TOOLTIP),
        generateLam2CollectionOption(self, SI_LLS_SHOW_LOOT_NOT_COLLECTED, SI_LLS_SHOW_LOOT_NOT_COLLECTED_TOOLTIP),
        generateLam2IconSizeOption(self),
        generateLam2TraitsOption(self, SI_LLS_SHOW_LOOT_TRAITS, SI_LLS_SHOW_LOOT_TRAITS_TOOLTIP),
        generateLam2HideSingularOption(self, SI_LLS_HIDE_LOOT_SINGLE_QTY, SI_LLS_HIDE_LOOT_SINGLE_QTY_TOOLTIP),
        generateLam2CombineDuplicatesOption(self),
        generateLam2SortOption(self),
        generateLam2DelimiterOption(self),
        generateLam2LinkStyleOption(self),
        generateLam2CounterOption(self)
end

function lls.List:GetOption(key)
    if OPTIONS_DEFAULTS[key] == nil then
        return nil
    end
    if self.options and self.options[key] ~= nil then
        return self.options[key]
    end
    if self.defaults then
        return self.defaults[key]
    end
end

function lls.List:IncrementCounter()
    self.counter = self.counter + 1
end

--[[ Outputs a verbose summary of all loot and currency ]]
function lls.List:Print()

    if not self:IsEnabled() then
        return
    end

    local lines = {}
    local summary = ""
    local maxLength = (self.chat.maxCharsPerLine or 1200) - ZoUTF8StringLength(self.prefix) - ZoUTF8StringLength(self.suffix)

    -- Add items summary
    if self:GetOption('sortedByQuality') then
        tableSort(self.itemKeys, sortByQuality)
    elseif self:GetOption('sorted') then
        tableSort(self.itemKeys, sortByItemName)
    end

    local quality, quantities, countString, iconStringLength
    for _, itemLink in ipairs(self.itemKeys) do
        quality = GetItemLinkFunctionalQuality(itemLink)
        if quality >= self:GetOption('minQuality') then
            quantities = self.itemList[itemLink]
            if quantities then
                for _, quantity in ipairs(quantities) do
                    local itemString = itemLink
                    iconStringLength = 0
                    if self:GetOption('showNotCollected') and isSetItemNotCollected(itemLink) then
                        local iconSize = stringFormat("%s%%", tostring(self:GetOption('iconSize')))
                        local iconString = zo_iconFormatInheritColor(collectionIcon, iconSize, iconSize)
                        if not self.chat.isDefault then
                            iconStringLength = zo_strlen(iconString)
                        end
                        itemString = itemString .. iconString
                    end
                    if self:GetOption('showTrait') and GetItemLinkEquipType(itemLink) ~= EQUIP_TYPE_INVALID then
                        local traitType = GetItemLinkTraitInfo(itemLink)
                        if traitType and traitType > 0 then
                            itemString = stringFormat("%s (%s)", itemString, GetString("SI_ITEMTRAITTYPE", traitType))
                        end
                    end
                    if not self:GetOption('hideSingularQuantities') or quantity > 1 then
                        countString = ZO_CachedStrFormat(GetString(SI_HOOK_POINT_STORE_REPAIR_KIT_COUNT), ZO_CommaDelimitNumber(quantity))
                        itemString = stringFormat("%s %s", itemString, countString)
                    end
                    if self:GetOption('showIcon') then
                        local iconSize = stringFormat("%s%%", tostring(self:GetOption('iconSize')))
                        local iconString = zo_iconFormat(GetItemLinkIcon(itemLink), iconSize, iconSize)
                        if not self.chat.isDefault then
                            iconStringLength = iconStringLength + zo_strlen(iconString)
                        end
                        itemString = iconString .. itemString
                    end
                    summary = appendText(itemString, summary, maxLength, lines, self:GetOption('delimiter'), self.prefix, iconStringLength)
                end
            else
                d("LibLootSummary has somehow lost track of how many " .. tostring(itemLink) .. " should be printed.  Please report this bug on ESOUI.com.")
            end
        end
    end

    -- Add money summary
    if self:GetOption('sorted') then
        tableSort(self.currencyKeys, sortByCurrencyName)
    end

    for _, currencyType in ipairs(self.currencyKeys) do
        quantities = self.currencyList[currencyType]
        -- fix race condition for when multiple threads call Print at the same time
        if quantities then
            for _, quantity in ipairs(quantities) do
                local moneyString = GetCurrencyName(currencyType, IsCountSingularForm(quantity))
                countString = quantity > 0 and ZO_CachedStrFormat(GetString(SI_HOOK_POINT_STORE_REPAIR_KIT_COUNT), ZO_CommaDelimitNumber(quantity)) or tostring(quantity)
                moneyString = stringFormat("%s %s", moneyString, countString)
                iconStringLength = 0
                if self:GetOption('showIcon') then
                    local currencyIcon = ZO_Currency_GetPlatformFormattedCurrencyIcon(currencyType)
                    if not self.chat.isDefault then
                        iconStringLength = zo_strlen(currencyIcon)
                    end
                    moneyString = currencyIcon .. moneyString
                end
                summary = appendText(moneyString, summary, maxLength, lines, self:GetOption('delimiter'), self.prefix, iconStringLength)
            end
        else
            d("LibLootSummary has somehow lost track of how many " .. GetCurrencyName(currencyType, false) .. " should be printed.  Please report this bug on ESOUI.com.")
        end
    end
    
    -- Add counter text, if the summary is not empty and the counter is > 0
    if self:GetOption('showCounter') and self.counter > 0 then
        if self.counterText and self.counterText ~= "" and (#lines > 0 or summary ~= "") then
            local text = formatCount(self.counterText, self.counter)
            summary = appendText(text, summary, maxLength, lines, self:GetOption('delimiter'), self.prefix, iconStringLength)
        end
    end

    -- Append last line
    if ZoUTF8StringLength(summary) > ZoUTF8StringLength(self.prefix) then
        tableInsert(lines, summary)
    end

    -- Print to chat
    for i, line in ipairs(lines) do
        self.chat:Print(self.prefix .. line .. self.suffix)
    end

    self:Reset()
end

function lls.List:Reset()
    if self.itemList then
        ZO_ClearTable(self.itemList)
    end
    self.itemList = {}
    self.itemKeys = {}
    if self.currencyList then
        ZO_ClearTable(self.currencyList)
    end
    self.currencyList = {}
    self.currencyKeys = {}
    self.counter = 0
end

function lls.List:SetCombineDuplicates(combineDuplicates)
    self:SetOption('combineDuplicates', combineDuplicates)
end

function lls.List:SetCounterText(counterText)
    self.counterText = counterText
end

function lls.List:SetDelimiter(delimiter)
    self:SetOption('delimiter', delimiter)
end

function lls.List:SetEnabled(enabled)
    self:SetOption('enabled', enabled)
end

function lls.List:IsEnabled()
    return self:GetOption('enabled')
end

function lls.List:SetHideSingularQuantities(hideSingularQuantities)
    self:SetOption('hideSingularQuantities', hideSingularQuantities)
end

function lls.List:SetLinkStyle(linkStyle)
    self:SetOption('linkStyle', linkStyle)
end

function lls.List:SetMinQuality(quality)
    self:SetOption('minQuality', quality)
end

function lls.List:SetOption(key, value)
    if OPTIONS_DEFAULTS[key] ~= nil then
        self.options[key] = value
    end
end

function lls.List:SetOptions(options, defaults, ...)
    if defaults == nil then
        defaults = {}
    end
    local optionsKeys = {...}
    if #optionsKeys > 0 then
        defaults = getChildTable(defaults, optionsKeys)
        local parent = options
        options = getChildTable(parent, optionsKeys)
        options = setmetatable({},
            {
                __index = function(_, key)
                    local childTable = getChildTable(parent, optionsKeys)
                    return childTable[key]
                end,
                __newindex = function(_, key, value)
                    local childTable = getChildTable(parent, optionsKeys)
                    childTable[key] = value
                end,
            })
    end
    
    for oldField, newField in pairs(RENAMED_OPTIONS) do
        if defaults[oldField] ~= nil then
            defaults[newField] = defaults[oldField]
            defaults[oldField] = nil
        end
        if options[oldField] ~= nil then
            if options[newField] == nil then
                options[newField] = options[oldField]
            end
            options[oldField] = nil
        end
    end
    
    defaults = mergeTables(defaults, OPTIONS_DEFAULTS)
    
    -- Carry over options from the constructor, if any were passed there
    for field, _ in pairs(OPTIONS_DEFAULTS) do
        if options[field] == nil then
            options[field] = self.options[field]
        end
    end
    
    -- Initialize values if not yet done
    for field, defaultValue in pairs(defaults) do
        if options[field] == nil then
            options[field] = defaultValue
        end
    end
    
    self.options = options
    self.defaults = defaults
end

function lls.List:SetPrefix(prefix)
    self.prefix = prefix
end

function lls.List:SetShowCounter(showCounter)
    self:SetOption('showCounter', showCounter)
end

function lls.List:SetShowIcon(showIcon)
    self:SetOption('showIcon', showIcon)
end

function lls.List:SetIconSize(iconSize)
    self:SetOption('iconSize', iconSize)
end

function lls.List:SetShowTrait(showTrait)
    self:SetOption('showTrait', showTrait)
end

function lls.List:SetShowNotCollected(showNotCollected)
    self:SetOption('showNotCollected', showNotCollected)
end

function lls.List:SetSorted(sorted)
    self:SetOption('sorted', sorted)
end

function lls.List:SetSortedByQuality(sortedByQuality)
    self:SetOption('sortedByQuality', sortedByQuality)
end

function lls.List:SetSuffix(suffix)
    self.suffix = suffix
end

function lls.List:UseLibChatMessage(chat)
    self.chat = chat
end


-- Local functions

function addQuantity(list, keys, key, quantity, combineDuplicates)
    if list[key] then
        if combineDuplicates then
            list[key][1] = list[key][1] + quantity
        else
            tableInsert(list[key], quantity)
        end
    else
        list[key] = { [1] = quantity }
        tableInsert(keys, key)
    end
end

function appendText(text, currentText, maxLength, lines, delimiter, prefix, iconStringLength)
    local currentTextLength = ZoUTF8StringLength(currentText)
    local stringLength = currentTextLength + ZoUTF8StringLength(delimiter) + ZoUTF8StringLength(text)
    -- icons only take up the space of two characters
    if iconStringLength > 0 then
        stringLength = stringLength - iconStringLength + 2 
    end
    if stringLength > maxLength then
        tableInsert(lines, currentText)
        currentText = ""
    elseif currentTextLength > ZoUTF8StringLength(prefix) or stringFind(delimiter, "^\n") then
        currentText = currentText .. delimiter
    end
    currentText = currentText .. text
    return currentText
end

function coalesce(...)
    local args = {...}
    for key = 1, #args do
        local value = args[key]
        if value ~= nil then
            return value, key
        end
    end
end

defaultChat = ZO_Object:Subclass()
function defaultChat:New(...)
    local instance = ZO_Object.New(self)
    instance.isDefault = true
    instance.maxCharsPerLine = MAX_TEXT_CHAT_INPUT_CHARACTERS
    return instance
end
function defaultChat:Print(message)
    if CHAT_ROUTER then
        CHAT_ROUTER:AddDebugMessage(message)
    end
end

OPTIONS_DEFAULTS = {
    enabled = true,
    minQuality = ITEM_FUNCTIONAL_QUALITY_MIN_VALUE,
    showIcon = false,
    iconSize = 90,
    showTrait = false,
    showNotCollected = false,
    combineDuplicates = true,
    hideSingularQuantities = false,
    delimiter = " ",
    linkStyle = LINK_STYLE_DEFAULT,
    sorted = false,
    sortedByQuality = false,
    showCounter = false,
}

CHAT_DEFAULTS = {
    chat = defaultChat:New(),
    prefix = "",
    suffix = "",
}

RENAMED_OPTIONS = {
    traits = 'showTrait',
    icons = 'showIcon',
}

function formatCount(countText, count)
    -- The <<1*2>> format only prints a number when there are more than one
    if count > 1 then
        return ZO_CachedStrFormat(SI_LLS_COUNTER_FORMAT_PLURAL, count, countText)
    end
    -- Fall back on an explicit number and singular word
    return ZO_CachedStrFormat(SI_LLS_COUNTER_FORMAT_SINGLE, count, countText)
end

local numberDelimLength = zo_strlen(GetString(SI_LLS_COUNTER_FORMAT_SINGLE)) - 12
function getPlural(countText)
    -- <<m:1>> seems to be buggy and doesn't properly pluralize words, but <<1*2>> does.
    local pluralNumberAndWord = ZO_CachedStrFormat(SI_LLS_PLURAL, 2, countText)
    local plural = zo_strsub(pluralNumberAndWord, 2 + numberDelimLength)
    return plural
end

function generateLam2EnabledOption(self, addonName, name, tooltip)
    return 
        -- Enabled
        {
            type = "checkbox",
            name = GetString(name),
            tooltip = zo_strformat(tooltip, addonName),
            getFunc = function() return self:IsEnabled() end,
            setFunc = function(value) self:SetEnabled(value) end,
            default = self.defaults.enabled,
        }
end
function generateLam2HideSingularOption(self, name, tooltip)
    return 
        -- HideSingularQuantities
        {
            type = "checkbox",
            name = GetString(name),
            tooltip = GetString(tooltip),
            getFunc = function() return self:GetOption('hideSingularQuantities') end,
            setFunc = function(value) self:SetHideSingularQuantities(value) end,
            default = self.defaults.hideSingularQuantities,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2CombineDuplicatesOption(self)
    return 
        -- Combine duplicates
        {
            type = "checkbox",
            name = GetString(SI_LLS_COMBINE_DUPLICATES),
            tooltip = GetString(SI_LLS_COMBINE_DUPLICATES_TOOLTIP),
            getFunc = function() return self:GetOption('combineDuplicates') end,
            setFunc = function(value) self:SetCombineDuplicates(value) end,
            default = self.defaults.combineDuplicates,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2IconsOption(self, name, tooltip)
    return 
        -- Show Icons
        {
            type = "checkbox",
            name = GetString(name),
            tooltip = GetString(tooltip),
            getFunc = function() return self:GetOption('showIcon') end,
            setFunc = function(value) self:SetShowIcon(value) end,
            default = self.defaults.showIcon,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2CollectionOption(self, name, tooltip)
    return 
        -- Show not collected piece
        {
            type = "checkbox",
            name = zo_strformat(GetString(name), zo_iconFormat(collectionIcon, '120%', '120%')),
            tooltip = GetString(tooltip),
            getFunc = function() return self:GetOption('showNotCollected') end,
            setFunc = function(value) self:SetShowNotCollected(value) end,
            default = self.defaults.showNotCollected,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2IconSizeOption(self)
    return 
        -- Set icons size
        {
            type = "slider",
            min = 50,
            max = 200,
            step = 10,
            decimals = 0,
            clampInput = true,
            name = GetString(SI_LLS_ICON_SIZE),
            tooltip = GetString(SI_LLS_ICON_SIZE_TOOLTIP),
            getFunc = function() return self:GetOption('iconSize') end,
            setFunc = function(value) self:SetIconSize(value) end,
            default = self.defaults.iconSize,
            disabled =
                function()
                    return not self:IsEnabled() 
                           or (not self:GetOption('showIcon') 
                               and not self:GetOption('showNotCollected'))
                end,
        }
end
function generateLam2QualityOption(self, name, tooltip)
    return 
        -- Minimum Quality
        {
            type = "dropdown",
            choices = qualityChoices,
            choicesValues = qualityChoicesValues,
            sort = "numericvalue-up",
            name = GetString(name),
            tooltip = GetString(tooltip),
            getFunc = function() return self:GetOption('minQuality') end,
            setFunc = function(value) self:SetMinQuality(value) end,
            default = self.defaults.minQuality,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2TraitsOption(self, name, tooltip)
    return 
        -- Show Traits
        {
            type = "checkbox",
            name = GetString(name),
            tooltip = GetString(tooltip),
            getFunc = function() return self:GetOption('showTrait') end,
            setFunc = function(value) self:SetShowTrait(value) end,
            default = self.defaults.showTrait,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2SortOption(self)
    return 
        -- Sort order
        {
            type = "dropdown",
            name = GetString(SI_GAMEPAD_BANK_SORT_ORDER_HEADER),
            tooltip = GetString(SI_LLS_SORT_ORDER_TOOLTIP),
            choices =
                {
                    ZO_GenerateCommaSeparatedListWithoutAnd({
                        GetString('SI_TRADINGHOUSEFEATURECATEGORY', TRADING_HOUSE_FEATURE_CATEGORY_QUALITY),
                        GetString('SI_TRADINGHOUSELISTINGSORTTYPE', TRADING_HOUSE_LISTING_SORT_TYPE_NAME) }
                    ),
                    GetString('SI_TRADINGHOUSELISTINGSORTTYPE', TRADING_HOUSE_LISTING_SORT_TYPE_NAME),
                    GetString(SI_ITEMTYPE0)
                },
            choicesValues =
                {
                    'quality',
                    'name',
                    'none'
                },
            getFunc =
                function()
                    return self:GetOption('sortedByQuality') and 'quality'
                           or self:GetOption('sorted') and 'name'
                           or 'none'
                end,
            setFunc = 
                function(value)
                    if value == 'quality' then
                        self:SetSortedByQuality(true)
                        self:SetSorted(false)
                    elseif value == 'name' then
                        self:SetSorted(true)
                        self:SetSortedByQuality(false)
                    else
                        self:SetSorted(false)
                        self:SetSortedByQuality(false)
                    end
                end,
            default = self.defaults.sortedByQuality and 'quality' or self.defaults.sorted and 'name' or 'none',
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2DelimiterOption(self)
    return 
        -- delimiter
        {
            type = "dropdown",
            name = GetString(SI_LLS_DELIMITER),
            tooltip = GetString(SI_LLS_DELIMITER_TOOLTIP),
            choices = delimiterChoices,
            choicesValues = delimiterChoicesValues,
            getFunc = function() return self:GetOption('delimiter') end,
            setFunc = function(value) self:SetDelimiter(value) end,
            default = self.defaults.delimiter,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2LinkStyleOption(self)
    return 
        -- delimiter
        {
            type = "dropdown",
            name = GetString(SI_LLS_LINK_STYLE),
            tooltip = GetString(SI_LLS_LINK_STYLE_TOOLTIP),
            choices =
                {
                    stringFormat(linkFormat, LINK_STYLE_BRACKETS, 54172),
                    stringFormat(linkFormat, LINK_STYLE_DEFAULT, 54172),
                },
            choicesValues =
                {
                    LINK_STYLE_BRACKETS,
                    LINK_STYLE_DEFAULT
                },
            getFunc = function() return self:GetOption('linkStyle') end,
            setFunc = function(value) self:SetLinkStyle(value) end,
            default = self.defaults.linkStyle,
            disabled = function() return not self:IsEnabled() end,
        }
end
function generateLam2CounterOption(self)
    if self.counterText == nil or self.counterText == '' then
        return
    end
    local language = GetCVar("Language.2")
    local pluralCounterText = getPlural(self.counterText)
    local counterTitleText = language == "en" and zo_strformat("<<t:1>>", pluralCounterText) or pluralCounterText
    local name = zo_strformat(GetString(SI_LLS_SHOW_COUNTER), counterTitleText)
    local tooltip = zo_strformat(GetString(SI_LLS_SHOW_COUNTER_TOOLTIP), pluralCounterText)
    return 
        -- Show Counter
        {
            type = "checkbox",
            name = name,
            tooltip = tooltip,
            getFunc = function() return self:GetOption('showCounter') end,
            setFunc = function(value) self:SetShowCounter(value) end,
            default = self.defaults.showCounter,
            disabled = function() return not self:IsEnabled() end,
        }
end

function getChildTable(parent, childPath)
    local childTable = parent
    for _, key in ipairs(childPath) do
        childTable = childTable[key]
    end
    return childTable
end

function isSetItemNotCollected(itemLink)
    if not IsItemLinkSetCollectionPiece(itemLink) then return nil end
    local setId = select(6, GetItemLinkSetInfo(itemLink, false))
    local slot = GetItemLinkItemSetCollectionSlot(itemLink)
    return not IsItemSetCollectionSlotUnlocked(setId, slot)
end

function mergeTables(table1, table2)
    local merged = ZO_ShallowTableCopy(table1)
    for key, value in pairs(table2) do
        if merged[key] == nil then
            merged[key] = value
        end
    end
    return merged
end

function sortByCurrencyName(currencyType1, currencyType2)
    return GetCurrencyName(currencyType1) < GetCurrencyName(currencyType2)
end

function sortByItemName(itemLink1, itemLink2)
    return ZO_CachedStrFormat(SI_LINK_FORMAT_ITEM_NAME, GetItemLinkName(itemLink1)) < ZO_CachedStrFormat(SI_LINK_FORMAT_ITEM_NAME, GetItemLinkName(itemLink2))
end

function sortByQuality(itemLink1, itemLink2)
    local quality1 = GetItemLinkFunctionalQuality(itemLink1)
    local quality2 = GetItemLinkFunctionalQuality(itemLink2)
    if quality1 == quality2 then
        return sortByItemName(itemLink1, itemLink2)
    else
        return quality2 < quality1
    end
end

qualityChoices = {}
qualityChoicesValues = {}
for quality = ITEM_FUNCTIONAL_QUALITY_MIN_VALUE, ITEM_FUNCTIONAL_QUALITY_MAX_VALUE do
    local qualityColor = GetItemQualityColor(quality)
    local qualityString = qualityColor:Colorize(GetString("SI_ITEMQUALITY", quality))
    tableInsert(qualityChoicesValues, quality)
    tableInsert(qualityChoices, qualityString)
end


delimiterChoicesValues = {
    " ",
    "   ",
    ", ",
    " * ",
    "; ",
    "\n",
    "\n• ",
    "\n- ",
    "\n+ ",
    "\n* ",
    "、",
    "・",
}

delimiterChoices = { }
for _, delimiterChoice in ipairs(delimiterChoicesValues) do
    delimiterChoice = zo_strgsub(delimiterChoice, "\n", "\\n")
    table.insert(delimiterChoices, zo_strformat(GetString(SI_LLS_QUOTES), delimiterChoice))
end