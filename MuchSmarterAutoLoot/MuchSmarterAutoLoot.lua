local MuchSmarterAutoLoot = ZO_Object:Subclass()
MuchSmarterAutoLoot.db = nil
MuchSmarterAutoLoot.config = nil
local CBM = CALLBACK_MANAGER
local Config = MuchSmarterAutoLootSettings
MuchSmarterAutoLoot.StartupInfo = false
MuchSmarterAutoLoot.version = "2.10.2"
MuchSmarterAutoLoot.title = "Much Smarter AutoLoot"
MuchSmarterAutoLoot.slashCommand = "/msal"
local SV_NAME = 'MSAL_VARS'
local SV_VER = 1
local db

local looted
local lastExceed

local defaults = {
    version = MuchSmarterAutoLoot.version,
    initPlusCheck = false,
    enabled = true,
    debugMode = false,
    printItems = false,
    closeLootWindow = false,
    lootStolen = false,
    loginReminder = true,
    minimumQuality = 1,
    minimumValue = 0,
    -- filters, use plural for key and value by default
    filters = {
        set = "always loot",
        uncollected = "always loot",
        unresearched = "always loot",
        ornate = "always loot",
        intricate = "always loot",
        clothingIntricate = "always loot",
        blacksmithingIntricate = "always loot",
        woodworkingIntricate = "always loot",
        jewelryIntricate = "always loot",
        companionGears = "always loot",
        weapons = "never loot",
        armors = "never loot",
        jewelry = "never loot",
        uncollectedJewelryProtection = true,
		autoBind = false,

        craftingMaterials = "never loot",
        traitMaterials = "never loot",
        styleMaterials = "never loot",
        runes = "never loot",
        alchemy = "never loot",
        ingredients = "never loot",
        furnishingMaterials = "never loot",
        esopAutolootStolen = false,

        tickets = "always loot",
        crystals = "always loot",


        questItems = "always loot",
        crownItems = "always loot",
        containers = "always loot",
        leads = "always loot",
        soulGems = "only filled",
        recipes = "never loot",
        writs = "never loot",
        treasureMaps = "only non-base-zone",
        glyphs = "never loot",
        treasures = "never loot",
        potions = "never loot",
        collectibles = "never loot",
        foodAndDrink = "never loot",
        poisons = "never loot",
        costumes = "never loot",
        fishingBaits = "never loot",
        tools = "never loot",
        allianceWarConsumables = "never loot",
        furniture = "never loot",
        trash = "never loot",
    }
}

local basezoneTreasureMapID = {
    --khenarthisroost
    43695, 43696, 43697, 43698, 44939, 45010,
    --auridon
    43625, 43626, 43627, 43628, 43629, 43630, 44927,
    --grahtwood
    43631, 43632, 43633, 43634, 43635, 43636, 44937,
    --greenshade
    43637, 43638, 43639, 43640, 43641, 43642, 44938,
    --malabaltor
    43643, 43644, 43645, 43646, 43647, 43648, 44940,
    --reapersmarch
    43649, 43650, 43651, 43652, 43653, 43654, 44941,
    --bleakrock
    43699, 43700, 44931,
    --balfoyen
    43701, 43702, 44928,
    --stonefalls
    43655, 43656, 43657, 43658, 43659, 43660, 44944,
    --deshaan
    43661, 43662, 43663, 43664, 43665, 43666, 44934,
    --shadowfen
    43667, 43668, 43669, 43670, 43671, 43672, 44943,
    --eastmarch
    43673, 43674, 43675, 43676, 43677, 43678, 44935,
    --therift
    43679, 43680, 43681, 43682, 43683, 43684, 44947,
    --strosmkai
    43691, 43692, 44946,
    --betnihk
    43693, 43694, 44930,
    --glenumbra
    43507, 43525, 43527, 43600, 43509, 43526, 44936,
    --stormhaven
    43601, 43602, 43603, 43604, 43605, 43606, 44945,
    --rivenspire
    43607, 43608, 43609, 43610, 43611, 43612, 44942,
    --alikr
    43613, 43614, 43615, 43616, 43617, 43618, 44926,
    --bangkorai
    43619, 43620, 43621, 43622, 43623, 43624, 44929,
    --coldharbour
    43685, 43686, 43687, 43688, 43689, 43690, 44932,
    --craglorn
    43721, 43722, 43723, 43724, 43725, 43726
}

local jewelryTraits = {
	ITEM_TRAIT_TYPE_JEWELRY_ARCANE,
    ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY,
    ITEM_TRAIT_TYPE_JEWELRY_HARMONY,
    ITEM_TRAIT_TYPE_JEWELRY_HEALTHY,
    ITEM_TRAIT_TYPE_JEWELRY_INFUSED,
    ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE,
	ITEM_TRAIT_TYPE_JEWELRY_ROBUST,
    ITEM_TRAIT_TYPE_JEWELRY_SWIFT,
    ITEM_TRAIT_TYPE_JEWELRY_TRIUNE,
    ITEM_TRAIT_TYPE_JEWELRY_INTRICATE,
    ITEM_TRAIT_TYPE_JEWELRY_ORNATE
}

local matItemType = {
	ITEMTYPE_BLACKSMITHING_BOOSTER,
    ITEMTYPE_BLACKSMITHING_MATERIAL,
    ITEMTYPE_BLACKSMITHING_RAW_MATERIAL,
    ITEMTYPE_CLOTHIER_BOOSTER,
    ITEMTYPE_CLOTHIER_MATERIAL,
    ITEMTYPE_CLOTHIER_RAW_MATERIAL,
    ITEMTYPE_WOODWORKING_BOOSTER,
    ITEMTYPE_WOODWORKING_MATERIAL,
    ITEMTYPE_WOODWORKING_RAW_MATERIAL,
    ITEMTYPE_JEWELRYCRAFTING_BOOSTER,
    ITEMTYPE_JEWELRYCRAFTING_MATERIAL,
    ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER,
    ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL,
    ITEMTYPE_RAW_MATERIAL,
    ITEMTYPE_STYLE_MATERIAL,
    ITEMTYPE_WEAPON_TRAIT,
    ITEMTYPE_ARMOR_TRAIT,
    ITEMTYPE_JEWELRY_RAW_TRAIT,
    ITEMTYPE_JEWELRY_TRAIT,
    ITEMTYPE_INGREDIENT,
    ITEMTYPE_POTION_BASE,
    ITEMTYPE_POISON_BASE,
    ITEMTYPE_REAGENT,
    ITEMTYPE_ENCHANTING_RUNE_ASPECT,
    ITEMTYPE_ENCHANTING_RUNE_ESSENCE,
    ITEMTYPE_ENCHANTING_RUNE_POTENCY,
    ITEMTYPE_ENCHANTMENT_BOOSTER,
    ITEMTYPE_FURNISHING_MATERIAL,
    ITEMTYPE_LURE
}

function MuchSmarterAutoLoot:New(...)
    local result = ZO_Object.New(self)
    result:Initialize(...)
    return result
end

function MuchSmarterAutoLoot:Initialize(control)
    self.control = control
    self.control:RegisterForEvent(EVENT_ADD_ON_LOADED, function(...)
        self:OnLoaded(...)
    end)
    --    CBM:RegisterCallback( Config.EVENT_TOGGLE_AUTOLOOT, function() self:ToggleAutoLoot()    end )
end

function MuchSmarterAutoLoot:OnLoaded(event, addon)
    if addon ~= "MuchSmarterAutoLoot" then
        return
    end

    if LibSavedVars ~= nil then
        db = LibSavedVars:NewAccountWide(SV_NAME, "Account", defaults)
                         :AddCharacterSettingsToggle(SV_NAME, "Character")
    else
        db = ZO_SavedVars:New(SV_NAME, 1, nil, defaults)
    end

    self.config = Config:New(db)
	
--	SLASH_COMMANDS[MuchSmarterAutoLoot.slashCommand] = MuchSmarterAutoLoot.HandleSlashCommand

    SLASH_COMMANDS["/msalt"] = function(keyWord, argument)
        db.enabled = not db.enabled
        if (db.enabled == true) then
            d("Much Smarter AutoLoot ON")
        else
            d("Much Smarter AutoLoot OFF")
        end
    end

    --if (db.allowDestroy) then
    --	self.buttonDestroyRemaining = CreateControlFromVirtual("buttonDestroyRemaining", ZO_Loot, "BTN_DestroyRemaining")
    --end

    self.control:RegisterForEvent(EVENT_LOOT_UPDATED, function(_, ...)
        self:OnLootUpdated(...)
    end)

    -- d("MuchSmarterAutoLoot version "..MuchSmarterAutoLoot.version.." by Lykeion")
end

--function MuchSmarterAutoLoot.HandleSlashCommand( command )
--	command = string.lower(command)
--
--	if (command == "on") then
--		db.enabled = true
--		CHAT_ROUTER:AddSystemMessage("Much Smarter AutoLoot Turned On")
--	elseif (command == "off") then
--		db.enabled = false
--		CHAT_ROUTER:AddSystemMessage("Much Smarter AutoLoot Turned Off")
--	else
--		CHAT_ROUTER:AddSystemMessage(MuchSmarterAutoLoot.title)
--		CHAT_ROUTER:AddSystemMessage("/msal on – Turn on Much Smarter AutoLoot")
--		CHAT_ROUTER:AddSystemMessage("/msal off – Turn off Much Smarter AutoLoot")
--	end
--end

function MuchSmarterAutoLoot:LoadScreen()
    --d("initPlusChecking : "..tostring(db.initPlusCheck))
    --d("userBuildInAutoLoot"..userBuildInAutoLoot)
    if ((db.initPlusCheck == nil or db.initPlusCheck == false)) then
        db.initPlusCheck = true
        --d("initPlusChecking...")
        local userBuildInAutoLoot = GetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_LOOT)
        if (IsESOPlusSubscriber() and userBuildInAutoLoot == 1) then
            db.enabled = false
        end
    end

    --d("auto modify build-in autoloot")
    --if (db.enabled) then
    --	SetSetting(SETTING_TYPE_LOOT, LOOT_SETTING_AUTO_LOOT, 0)
    --end

    if (not MuchSmarterAutoLoot.StartupInfo and db.loginReminder == true and db.enabled == true) then
        d("|c215895 Lykeion's|cdb8e0b Much Smarter AutoLoot " .. MuchSmarterAutoLoot.version .. GetString(MSAL_STARTUP_REMINDER))
        --d("IsESOPlusSubscriber() : "..tostring(IsESOPlusSubscriber()))
        if (db.closeLootWindow) then
            d(GetString(MSAL_CLOSE_LOOT_WINDOW_REMINDER))
        end
        if (db.debugMode) then
            d(GetString(MSAL_DEBUG_MODE_REMINDER))
        end
    end
    MuchSmarterAutoLoot.StartupInfo = true
end

--function MuchSmarterAutoLoot:ToggleAutoLoot()
--	if( db.enabled ) then
--		self.control:RegisterForEvent(EVENT_LOOT_UPDATED, function( _, ... ) self:OnLootUpdated( ... )  end)
--	else
--		self.control:UnregisterForEvent( EVENT_LOOT_UPDATED )
--	end
--end

function MuchSmarterAutoLoot:OnInventorySlotUpdate(bagId, slotIndex, isNewItem, itemSoundCategory, updateReason, stackCountChange)
	--d("triggered")
	local link = GetItemLink(bagId, slotIndex)
	local isUncollected = not IsItemSetCollectionPieceUnlocked(GetItemLinkItemId(link))
	if (isUncollected and db.autoBind) then 
		BindItem(bagId, slotIndex) 
	end
end


function MuchSmarterAutoLoot:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
    LootItemById(lootId)

    if (db.printItems) then
        local itemType = GetItemLinkItemType(link)

        if (isUnresearched) then
            d(GetString(MSAL_YOU_LOOTED) .. link .. " (" .. GetString(MSAL_UNRESEARCHED) .. ")")
        elseif (isOrnate) then
            d(GetString(MSAL_YOU_LOOTED) .. link .. " (" .. GetString(MSAL_ORNATE) .. ")")
        elseif (isIntricate) then
            d(GetString(MSAL_YOU_LOOTED) .. link .. " (" .. GetString(MSAL_INTRICATE) .. ")")
        elseif (isSetItem and isUncollected) then
            d(GetString(MSAL_YOU_LOOTED) .. link .. " (" .. GetString(MSAL_UNCOLLECTED) .. ")")
        else
            d(GetString(MSAL_YOU_LOOTED) .. link)
        end
    end
end

function MuchSmarterAutoLoot:OnInventoryUpdated(bagId, slotId, isNewItem, _, _)
    -- d("OnInventoryUpdated")
    if (self.destroying and db.allowDestroy) then
        if (isNewItem) then
            local link = GetItemLink(bagId, slotId)
            -- d("Destroying "..link)
            if (db.allowDestroy) then
                -- d("Actually destroying")
                DestroyItem(bagId, slotId)
            end
        end
    end
end

function MuchSmarterAutoLoot:OnLootClosed(eventCode)
    -- d("OnLootClosed")
    self.control:UnregisterForEvent(EVENT_INVENTORY_SINGLE_SLOT_UPDATE)
    self.control:UnregisterForEvent(EVENT_LOOT_CLOSED)
end

function MuchSmarterAutoLoot:ArrayHasItem(arr, item)
    for i = 0, #arr do
        if arr[i] == item then
            return true
        end
    end
    return false
end

function MuchSmarterAutoLoot:IsJewelry(itemType ,trait)
    if (itemType == ITEMTYPE_ARMOR and self:ArrayHasItem(jewelryTraits, trait)) then
		return true
	end
    return false
end

function MuchSmarterAutoLoot:IsMat(itemType)
    if (self:ArrayHasItem(matItemType, itemType)) then
		return true
	end
    return false
end

function MuchSmarterAutoLoot:ShouldLootGear(filterType, quality, value)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    if (filterType == "per quality threshold" and quality >= db.minimumQuality) then
        looted = true
        return true
    end

    if (filterType == "per value threshold" and value >= db.minimumValue) then
        looted = true
        return true
    end

    --	if (filterType == "per quality AND value") then
    --		if (quality >= db.minimumQuality and value >= db.minimumValue) then
    --			return true
    --		end
    --	end

    -- since 'only legal' & 'only stolen' & 'per quality OR value' option is removed, these IF block is a legacy that should not be used in the lastest version
    --if (filterType == "only legal" and isStolen) then
    --	return false
    --end
    --if (filterType == "only stolen" and not isStolen) then
    --	return false
    --end
    --if (filterType == "per quality OR value") then
    --	if (quality >= db.minimumQuality or value >= db.minimumValue) then
    --		return true
    --	end
    --end

    return false
end

function MuchSmarterAutoLoot:ShouldLootSet(filterType, isUncollected, isJewelry)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    if (filterType == "only uncollected" and isUncollected) then
        return true
    end

    if (filterType == "uncollected and jewelry" and (isUncollected or isJewelry)) then
        return true
    end

    if (filterType == "uncollected and non-jewelry" and isUncollected and not isJewelry) then
        return true
    end

    if (filterType == "only collected" and not isUncollected) then
        return true
    end

    return false
end

function MuchSmarterAutoLoot:ShouldLootPotion(filterType, link)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
	local itemId = GetItemLinkItemId(link)
	if (filterType == "only non-bastian" and itemId ~=176040 and itemId ~=176041 and itemId ~=176042) then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end
    return false
end

function MuchSmarterAutoLoot:ShouldLootMisc(filterType)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end
    return false
end

function MuchSmarterAutoLoot:ShouldLootTreasureMap(filterType, link)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "only non-base-zone") then
        if self:ArrayHasItem(basezoneTreasureMapID, GetItemLinkItemId(link)) then
            return false
        else
            return true
        end
    end
    if (filterType == "never loot") then
        return false
    end
    return false
end

function MuchSmarterAutoLoot:ShouldLootIntricate(filterType, link, quality, value, isJewelry)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end
    if (filterType == "type based") then
        local itemType = GetItemLinkItemType(link)

        -- if jewelry
        if (isJewelry) then
            return self:ShouldLootGear(db.filters.jewelryIntricate, quality, value)
        end
        if (not isJewelry and itemType == ITEMTYPE_ARMOR) then
            local weight = GetItemLinkArmorType(link)
            -- if clothing
            if (weight == ARMORTYPE_LIGHT or weight == ARMORTYPE_MEDIUM) then
                return self:ShouldLootGear(db.filters.clothingIntricate, quality, value)
            end
            -- if blacksmithing
            if (weight == ARMORTYPE_HEAVY) then
                return self:ShouldLootGear(db.filters.blacksmithingIntricate, quality, value)
            end
        end
        if (not isJewelry and itemType == ITEMTYPE_WEAPON) then
            local weaponType = GetItemLinkWeaponType(link)
            -- if woodworing
            if (weaponType == WEAPONTYPE_BOW or weaponType == WEAPONTYPE_FIRE_STAFF or weaponType == WEAPONTYPE_FROST_STAFF or weaponType == WEAPONTYPE_LIGHTNING_STAFF or weaponType == WEAPONTYPE_HEALING_STAFF or weaponType == WEAPONTYPE_SHIELD) then
                return self:ShouldLootGear(db.filters.woodworkingIntricate, quality, value)
            end
            -- if blacksmithing
            if (weaponType == WEAPONTYPE_AXE or weaponType == WEAPONTYPE_DAGGER or weaponType == WEAPONTYPE_HAMMER or weaponType == WEAPONTYPE_SWORD or weaponType == WEAPONTYPE_TWO_HANDED_AXE or weaponType == WEAPONTYPE_TWO_HANDED_HAMMER or weaponType == WEAPONTYPE_TWO_HANDED_SWORD) then
                return self:ShouldLootGear(db.filters.blacksmithingIntricate, quality, value)
            end
        end
    end
    return false
end

function MuchSmarterAutoLoot:ShouldLootMaterial(filterType, isStolen)
    -- if user has ESO Plus then loot the crafting material no matter what
    --d("IsESOPlusSubscriber "..tostring(IsESOPlusSubscriber()))
    --d("db.esopAutoloot "..tostring(db.esopAutoloot))
    --d("isStolen "..tostring(isStolen))
    --d("db.esopAutolootStolen "..tostring(db.esopAutolootStolen))
    if (IsESOPlusSubscriber()) then
        if (not isStolen) then
            looted = true
            return true
        elseif (isStolen and db.esopAutolootStolen) then
            looted = true
            return true
        end
        return false
    end

    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    return false
end

function MuchSmarterAutoLoot:ShouldLootStyleMaterial(filterType, link, isStolen)
    -- if user has ESO Plus then loot the crafting material no matter what
    if (IsESOPlusSubscriber()) then
        if (not isStolen) then
            looted = true
            return true
        elseif (isStolen and db.esopAutolootStolen) then
            looted = true
            return true
        end
        return false
    end

    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    if (filterType == "only non-racial") then
        local itemType = GetItemLinkItemType(link)

        if (itemType == ITEMTYPE_RAW_MATERIAL) then
            looted = true
            return true
        else
            local styleId = GetItemLinkItemStyle(link)
            --d("styleId : "..styleId)
            -- if it is racial style material
            if ((styleId >= 1 and styleId <= 9) or styleId == 15 or styleId == 17 or styleId == 19 or styleId == 20 or styleId == GetImperialStyleId()) then
                return false
            else
                looted = true
                return true
            end
        end
    end

    return false
end

function MuchSmarterAutoLoot:ShouldLootGem(filterType, value)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        looted = true
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    if (filterType == "only filled" and value > 5) then
        looted = true
        return true
    end

    return false
end

function MuchSmarterAutoLoot:ShouldLootRecipe(filterType, link)
    if (filterType == nil) then
        return false
    end

    -- d("checking ShouldLootGear for "..filterType)
    if (filterType == "always loot") then
        return true
    end
    if (filterType == "never loot") then
        return false
    end

    if (filterType == "only unknown" and not IsItemLinkRecipeKnown(link)) then
        return true
    end

    return false
end

function MuchSmarterAutoLoot:ExceedWarning()
	local firstExceed = 0
    if lastExceed == nil or lastExceed == 0 then
		lastExceed = os.time()
		firstExceed = 1
	end
	
	if os.time()-lastExceed > 1 or firstExceed == 1 then
		d(GetString(MSAL_EXCEED_WARNING))
		lastExceed = os.time()
	end
	return
end

function MuchSmarterAutoLoot:OnLootUpdated(numId)
    if (db.enabled == false) then
        return
    end
    -- d("MSAL StartLooting")
    local isShiftKeyDown = IsShiftKeyDown()
    --d("Get First Scene : "..tostring(SCENE_MANAGER:GetCurrentScene().name))

    local unownedMoney, _ = GetLootMoney()
    if (unownedMoney > 0 and db.printItems) then
        d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_MONEY) .. " :" .. unownedMoney)
    end
    LootMoney()
    local unownedStones, _ = GetLootCurrency(CURT_TELVAR_STONES)
    if (unownedStones > 0 and db.printItems) then
        d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_TELVAR_STONES) .. " :" .. unownedStones)
    end
    LootCurrency(CURT_TELVAR_STONES)
    local unownedAPs, _ = GetLootCurrency(CURT_ALLIANCE_POINTS)
    if (unownedAPs > 0 and db.printItems) then
        d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_ALLIANCE_POINTS) .. " :" .. unownedAPs)
    end
    LootCurrency(CURT_ALLIANCE_POINTS)
    local unownedKeys, _ = GetLootCurrency(CURT_UNDAUNTED_KEYS)
    if (unownedKeys > 0 and db.printItems) then
        d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_UNDAUNTED_KEYS) .. " :" .. unownedKeys)
    end
    LootCurrency(CURT_UNDAUNTED_KEYS)
    local unownedVouchers, _ = GetLootCurrency(CURT_WRIT_VOUCHERS)
    if (unownedVouchers > 0 and db.printItems) then
        d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_WRIT_VOUCHERS) .. " :" .. unownedVouchers)
    end
    LootCurrency(CURT_WRIT_VOUCHERS)

    if (db.filters.tickets == "always loot") then
        local currencyAmount = GetCurrencyAmount(CURT_EVENT_TICKETS, CURRENCY_LOCATION_ACCOUNT)
        local unownedCurrency, ownedCurrency = GetLootCurrency(CURT_EVENT_TICKETS)
        local maxCurrency = GetMaxPossibleCurrency(CURT_EVENT_TICKETS, CURRENCY_LOCATION_ACCOUNT)
        if (currencyAmount + unownedCurrency <= maxCurrency) then
            if (unownedCurrency > 0 and db.printItems) then
                d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_EVENT_TICKETS) .. " :" .. unownedCurrency)
            end
            LootCurrency(CURT_EVENT_TICKETS)
        elseif (unownedCurrency > 0) then
            
        else
        end
    end
    if (db.filters.crystals == "always loot") then
        local currencyAmount = GetCurrencyAmount(CURT_CHAOTIC_CREATIA, CURRENCY_LOCATION_ACCOUNT)
        local unownedCurrency, ownedCurrency = GetLootCurrency(CURT_CHAOTIC_CREATIA)
        local maxCurrency = GetMaxPossibleCurrency(CURT_CHAOTIC_CREATIA, CURRENCY_LOCATION_ACCOUNT)
        if (currencyAmount + unownedCurrency <= maxCurrency) then
            if (unownedCurrency > 0 and db.printItems) then
                d(GetString(MSAL_YOU_LOOTED) .. GetString(MSAL_TRANSMUTE_CRYSTALS) .. " :" .. unownedCurrency)
            end
            LootCurrency(CURT_CHAOTIC_CREATIA)
        elseif (unownedCurrency > 0) then
            self:ExceedWarning()
        else
        end
    end

    local num = GetNumLootItems()
    --d("Loot items number : "..num)
    for i = 1, num, 1 do
        local lootId, name, icon, quantity, quality, value, isQuest, isStolen, lootType = GetLootItemInfo(i)
        local link = GetLootItemLink(lootId)
        local trait = GetItemLinkTraitInfo(link)
        local itemType = GetItemLinkItemType(link)
        local isCompanionGear = GetItemLinkActorCategory(link) == GAMEPLAY_ACTOR_CATEGORY_COMPANION
        local isGear = itemType == ITEMTYPE_WEAPON or itemType == ITEMTYPE_ARMOR
        local isSetItem = IsItemLinkSetCollectionPiece(link)
        local isUnresearched = isGear and CanItemLinkBeTraitResearched(link)
		local isUncollected = not IsItemSetCollectionPieceUnlocked(GetItemLinkItemId(link))
        local isOrnate = trait == ITEM_TRAIT_TYPE_ARMOR_ORNATE or trait == ITEM_TRAIT_TYPE_WEAPON_ORNATE or trait == ITEM_TRAIT_TYPE_JEWELRY_ORNATE
        local isIntricate = trait == ITEM_TRAIT_TYPE_ARMOR_INTRICATE or trait == ITEM_TRAIT_TYPE_WEAPON_INTRICATE or trait == ITEM_TRAIT_TYPE_JEWELRY_INTRICATE
        local isJewelry = self:IsJewelry(itemType, trait)
        local isMat = self:IsMat(itemType)
        local isEsop = IsESOPlusSubscriber()

        local shouldBeLooted = false
        if (db.debugMode) then
            --d("got lootId: "..lootId)
            d("link: " .. link)
            --d("got name: "..name)
            d("itemType: " .. itemType)
            d("lootType: " .. lootType)
            --d("filterType"..filterType)
            d("itemId: " .. GetItemLinkItemId(link))
            d(GetItemLinkActorCategory(link))
            d(GetItemLinkActorCategory(link) == GAMEPLAY_ACTOR_CATEGORY_COMPANION)
            --d("have function: ")
            --d(tostring(IsItemSetCollectionPieceUnlocked))
            -- Seems this function returns to opposite result of locked/unlocked
            -- true when owned, false when new
            --d("is set item: "..tostring(isSetItem))
            --d("is collected: "..tostring(alreadyCollectedItem))
            --d("isGear : "..tostring(isGear))
            --d("isUnresearched : "..tostring(isUnresearched))
            --d("alreadyCollectedRecipe : "..tostring(IsItemLinkRecipeKnown(link)))
        end

        -- If this one is stolen AND looting stolen is not allowed, do nothing. Unfortunately Lua doesn't support a continue statement, or a switch statement, so this logic is uglier than it should be.  Lua sucks.
        if (isStolen and ((isMat and ((isEsop and not db.esopAutolootStolen) or (not isEsop and not db.lootStolen))) or (not isMat and not db.lootStolen))) then
            -- If this one is uncollected set jewelry and protection is turned on, skip directly
            --elseif (db.filters.uncollectedJewelryProtection and isSetItem and isUncollected and isJewelry and not isIntricate and not quality == ITEM_QUALITY_LEGENDARY ) then
            -- If this one is not stolen OR stolen is allowed, continue to normal looting process
        else
            -- If it is a quest item we want it no matter what
            if (isQuest) then
                -- d("Looting quest item")
                if (self:ShouldLootMisc(db.filters.questItems)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            end
            -- d("ItemType: "..tostring(itemType))
            if (isGear) then
                if (isCompanionGear) then
                    if (self:ShouldLootGear(db.filters.companionGears, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                end
                if (isSetItem) then
                    if (self:ShouldLootSet(db.filters.set, isUncollected, isJewelry)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (isUnresearched) then
                    if (self:ShouldLootGear(db.filters.unresearched, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (isOrnate) then
                    if (self:ShouldLootGear(db.filters.ornate, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (isIntricate) then
                    if (self:ShouldLootIntricate(db.filters.intricate, link, quality, value, isJewelry)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (isJewelry) then
                    if (self:ShouldLootGear(db.filters.jewelry, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (itemType == ITEMTYPE_ARMOR and not isJewelry) then
                    if (self:ShouldLootGear(db.filters.armors, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (itemType == ITEMTYPE_WEAPON) then
                    if (self:ShouldLootGear(db.filters.weapons, quality, value)) then
                        self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                    end
                elseif (not looted and value >= db.minimumValue) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                elseif (not looted and quality >= db.minimumQuality) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                else
                end
            elseif (itemType == ITEMTYPE_BLACKSMITHING_BOOSTER or itemType == ITEMTYPE_BLACKSMITHING_MATERIAL or itemType == ITEMTYPE_BLACKSMITHING_RAW_MATERIAL) then
                if (self:ShouldLootMaterial(db.filters.craftingMaterials, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_CLOTHIER_BOOSTER or itemType == ITEMTYPE_CLOTHIER_MATERIAL or itemType == ITEMTYPE_CLOTHIER_RAW_MATERIAL) then
                if (self:ShouldLootMaterial(db.filters.craftingMaterials, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_WOODWORKING_BOOSTER or itemType == ITEMTYPE_WOODWORKING_MATERIAL or itemType == ITEMTYPE_WOODWORKING_RAW_MATERIAL) then
                if (self:ShouldLootMaterial(db.filters.craftingMaterials, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_JEWELRYCRAFTING_BOOSTER or itemType == ITEMTYPE_JEWELRYCRAFTING_MATERIAL or itemType == ITEMTYPE_JEWELRYCRAFTING_RAW_BOOSTER or itemType == ITEMTYPE_JEWELRYCRAFTING_RAW_MATERIAL) then
                if (self:ShouldLootMaterial(db.filters.craftingMaterials, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_RAW_MATERIAL or itemType == ITEMTYPE_STYLE_MATERIAL) then
                --d("ImperialStyleId : "GetImperialStyleId())
                --d("ItemStyle : "..GetItemLinkItemStyle(link))
                if (self:ShouldLootStyleMaterial(db.filters.styleMaterials, link, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_WEAPON_TRAIT or itemType == ITEMTYPE_ARMOR_TRAIT or itemType == ITEMTYPE_JEWELRY_RAW_TRAIT or itemType == ITEMTYPE_JEWELRY_TRAIT) then
                --d("ItemType: ".."ITEMTYPE_JEWELRY_TRAIT")
                if (self:ShouldLootMaterial(db.filters.traitMaterials, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
                --d("ITEMTYPE_JEWELRY_TRAIT loot ended")
            elseif (itemType == ITEMTYPE_INGREDIENT) then
                if (self:ShouldLootMaterial(db.filters.ingredients, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_POTION_BASE or itemType == ITEMTYPE_POISON_BASE or itemType == ITEMTYPE_REAGENT) then
                if (self:ShouldLootMaterial(db.filters.alchemy, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_ENCHANTING_RUNE_ASPECT or itemType == ITEMTYPE_ENCHANTING_RUNE_ESSENCE or itemType == ITEMTYPE_ENCHANTING_RUNE_POTENCY or itemType == ITEMTYPE_ENCHANTMENT_BOOSTER) then
                if (self:ShouldLootMaterial(db.filters.runes, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_FURNISHING_MATERIAL) then
                -- 114889 Regulus (Blacksmithing)
                -- 114890 Bast (Clothier, cloth)
                -- 114891 Clean Pelt (Clothier, leather)
                -- 114892 Mundane Rune (Enchanting)
                -- 114893 Alchemical Resin (Alchemy)
                -- 114894 Decorative Wax (Provisioning)
                -- 114895 Heartwood (Woodworking)
                -- d("ItemType: furnishingMaterials")
                if (self:ShouldLootMaterial(db.filters.furnishingMaterials, isStolen)) then
                    -- d("Looting Furniture Crafting Material")
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_GLYPH_ARMOR or itemType == ITEMTYPE_GLYPH_JEWELRY or itemType == ITEMTYPE_GLYPH_WEAPON) then
                if (self:ShouldLootMisc(db.filters.glyphs)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_CONTAINER or itemType == ITEMTYPE_CONTAINER_CURRENCY or itemType == ITEMTYPE_FISH) then
                if (self:ShouldLootMisc(db.filters.containers)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_FURNISHING) then
                if (self:ShouldLootMisc(db.filters.furniture)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_CROWN_ITEM or itemType == ITEMTYPE_CROWN_REPAIR) then
                if (self:ShouldLootMisc(db.filters.crownItems)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_MASTER_WRIT) then
                if (self:ShouldLootMisc(db.filters.writs)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_RACIAL_STYLE_MOTIF or itemType == ITEMTYPE_RECIPE) then
                if (self:ShouldLootRecipe(db.filters.recipes, link)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_SOUL_GEM) then
                if (self:ShouldLootGem(db.filters.soulGems, value)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (lootType == LOOT_TYPE_ANTIQUITY_LEAD) then
                if (self:ShouldLootMisc(db.filters.leads)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_AVA_REPAIR or itemType == ITEMTYPE_SIEGE) then
                if (self:ShouldLootMisc(db.filters.allianceWarConsumables)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_TOOL) then
                -- ITEMTYPE_LOCKPICK doesn't seem to work here!  Is it flagged wrong in the game?
                if (self:ShouldLootMisc(db.filters.tools)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_COLLECTIBLE or lootType == LOOT_TYPE_COLLECTIBLE) then
                if (self:ShouldLootMisc(db.filters.collectibles)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_TROPHY) then
                if (self:ShouldLootTreasureMap(db.filters.treasureMaps, link)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_FOOD or itemType == ITEMTYPE_DRINK) then
                if (self:ShouldLootMisc(db.filters.foodAndDrink)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_POTION) then
                if (self:ShouldLootPotion(db.filters.potions, link)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_POISON) then
                if (self:ShouldLootMisc(db.filters.poisonsm )) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_TREASURE) then
                if (self:ShouldLootGear(db.filters.treasures, quality, value)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_COSTUME or itemType == ITEMTYPE_DISGUISE) then
                if (self:ShouldLootMisc(db.filters.costumes)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_LURE) then
                if (self:ShouldLootMaterial(db.filters.fishingBaits, isStolen)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            elseif (itemType == ITEMTYPE_TRASH) then
                if (self:ShouldLootMisc(db.filters.trash)) then
                    self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
                end
            else
                -- d("ItemType: Unknown Item")
                -- d("ItemType: "..tostring(itemType))
            end
        end
        if (shouldBeLooted) then
            self:LootItem(link, lootId, isUnresearched, isOrnate, isIntricate, isSetItem, isUncollected)
        end
        looted = false
    end

    local currentScene = SCENE_MANAGER:GetCurrentScene().name
    if (db.closeLootWindow and not isShiftKeyDown) then
        SCENE_MANAGER:Toggle(currentScene)
        if (tostring(currentScene) == "inventory") then
            SCENE_MANAGER:Show("inventory")
        end

        -- The following block of codes are provided by Askedal, which is a more elegant implementation than mine. Yet some potential problems was reported by BanjoJedi so it was no longer used.

        --local n = SCENE_MANAGER:GetCurrentScene().name
        --if n == 'hudui' or n == 'interact' or n == 'hud' then
        --  SCENE_MANAGER:Show('hud')
        --else
        --  SCENE_MANAGER:Show(n)
        --end
    end
end

function MuchSmarterAutoLoot_Startup(self)
    _Instance = MuchSmarterAutoLoot:New(self)
end

function MuchSmarterAutoLoot:Reset()
end

EVENT_MANAGER:RegisterForEvent("MuchSmarterAutoLoot", EVENT_PLAYER_ACTIVATED, MuchSmarterAutoLoot.LoadScreen)
EVENT_MANAGER:RegisterForEvent("MSAL_SLOT_UPDATE", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, MuchSmarterAutoLoot.OnInventorySlotUpdate)
EVENT_MANAGER:AddFilterForEvent("MSAL_SLOT_UPDATE", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_IS_NEW_ITEM, true)
EVENT_MANAGER:AddFilterForEvent("MSAL_SLOT_UPDATE", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_BAG_ID, BAG_BACKPACK)



-- Tool Block

-- print all Style Items
--for i = 1, GetNumValidItemStyles() do
--	local styleItemIndex = GetValidItemStyleId(i)
--	local  itemName = GetItemStyleName(styleItemIndex)
--	local styleItem = GetSmithingStyleItemInfo(styleItemIndex)
--	d("styleItemIndex"..styleItemIndex)
--	d("itemName"..itemName)
--	d("styleItem"..styleItem)
--end