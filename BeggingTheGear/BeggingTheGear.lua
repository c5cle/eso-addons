BTG = {}
BTG.ename = 'BTG'
BTG.name = 'BeggingTheGear' -- sugar daddy
BTG.author = 'oJelly, SilverWF'
BTG.version = '2.3.2'
BTG.init = false
BTG.savedata = {}
local WM = WINDOW_MANAGER
local EM = EVENT_MANAGER
local SM = SCENE_MANAGER
local CM = CALLBACK_MANAGER
local strformat = zo_strformat
local init_savedef = {
    alwayswhisper = true,
    combattip_pos = { 500, 500 },          -- x y
    gearlist_pos = { 500, 500, 955, 670 }, -- wx y w h
    def_gearlist = {
        keyword = '',
        price = '1k',
        equiptype = {},
        equiptrait = {},
        equipweight = {},
        jewelrytrait = {},
        weapontype = {},
        weapontrait = {},
        thingtype = { 999 },
        lvl = 160,
        rarity = 2,
    },
    def_daddylist = {
        username = '',
        itemlink = '',
    },
    gearlist = {},
    daddylist = {},
}
local ValueList_EquipType = { 1, 2, 3, 4, 8, 9, 10, 12, 13 }
local ValueList_EquipTrait = { 11, 12, 13, 14, 15, 16, 17, 18, 25 }
local ValueList_EquipWeight = { 1, 2, 3 }
local ValueList_JewelryTrait = { 22, 21, 23, 30, 33, 32, 28, 29, 31 }
local ValueList_WeaponType = { 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 13, 14, 15 }
local ValueList_WeaponTrait = { 1, 2, 3, 4, 5, 6, 7, 8, 26 }
local ValueList_ThingType = { 999 }
local W_width = 0
local BTG_max_left = 0
local debug_mode = false

local LAM2 = LibAddonMenu2

local ICON_PATH = {}
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_STURDY] = 'crafting_runecrafter_plug_component_002'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE] = 'crafting_jewelry_base_diamond_r3'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_REINFORCED] = 'crafting_enchantment_base_sardonyx_r2'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED] = 'crafting_accessory_sp_names_002'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_TRAINING] = 'crafting_jewelry_base_emerald_r2'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_INFUSED] = 'crafting_enchantment_baxe_bloodstone_r2'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_EXPLORATION] = 'crafting_jewelry_base_garnet_r3'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_DIVINES] = 'crafting_accessory_sp_names_001'
ICON_PATH[ITEM_TRAIT_TYPE_ARMOR_NIRNHONED] = 'crafting_potent_nirncrux_stone'

ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_POWERED] = 'crafting_runecrafter_potion_008'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_CHARGED] = 'crafting_jewelry_base_amethyst_r3'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_PRECISE] = 'crafting_jewelry_base_ruby_r3'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_INFUSED] = 'crafting_enchantment_base_jade_r3'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_DEFENDING] = 'crafting_jewelry_base_turquoise_r3'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_TRAINING] = 'crafting_runecrafter_armor_component_004'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_SHARPENED] = 'crafting_enchantment_base_fire_opal_r3'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_DECISIVE] = 'crafting_smith_potion__sp_names_003'
ICON_PATH[ITEM_TRAIT_TYPE_WEAPON_NIRNHONED] = 'crafting_potent_nirncrux_dust'

ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_ARCANE] = 'jewelrycrafting_trait_refined_cobalt'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_HEALTHY] = 'jewelrycrafting_trait_refined_antimony'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_ROBUST] = 'jewelrycrafting_trait_refined_zinc'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_TRIUNE] = 'jewelrycrafting_trait_refined_dawnprism'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_INFUSED] = 'crafting_enchantment_base_jade_r1'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE] = 'crafting_runecrafter_armor_component_006'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_SWIFT] = 'crafting_outfitter_plug_component_002'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_HARMONY] = 'crafting_metals_tin'
ICON_PATH[ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY] = 'crafting_enchantment_baxe_bloodstone_r1'

function dev_reloadui()
    SLASH_COMMANDS["/reloadui"]()
end

function GetColor(val, a)
    local r, g = 0, 0
    if val >= 50 then
        r = 100 - ((val - 50) * 2); g = 100
    else
        r = 100; g = val * 2
    end
    return r / 100, g / 100, 0, a
end

function isayToChat(msg)
    CHAT_SYSTEM.textEntry:SetText(msg)
    CHAT_SYSTEM:Maximize()
    CHAT_SYSTEM.textEntry:Open()
    CHAT_SYSTEM.textEntry:FadeIn()
end

-- 亂寫一個 in array
function in_array(val, arr)
    local findstatus = false
    for k, v in pairs(arr) do
        if v == val then
            findstatus = true
            return findstatus
        end
    end
    return findstatus
end

-- 亂摳一個排序
function sortByFilterKeyword(a, b)
    return a.keyword < b.keyword
    -- 　if a.level == b.level then
    -- 　　return a.　keyword < b.　keyword
    -- 　else
    -- 　　return a.level < b.level
    -- 　end
end

-- 亂寫一個n陣列處理
function findArrThenBack(curl, arr, val)
    -- 新增值到陣列中
    if curl == 'c' then
        table.insert(arr, val)
    end
    -- 刪除陣列中的值
    if curl == 'd' then
        for k, v in pairs(arr) do
            if v == val then
                table.remove(arr, k)
            end
        end
    end
    return arr
end

-- tab 轉 字串
-- http://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console
-- Alundaio @ answered Feb 6 at 7:23
function table2string(node)
    -- to make output beautiful
    local function tab(amt)
        local str = ""
        for i = 1, amt do
            str = str .. "--"
        end
        return str
    end

    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k, v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then
                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "[" .. tostring(k) .. "]"
                else
                    key = "['" .. tostring(k) .. "']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. tab(depth) .. key .. " = " .. tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. tab(depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. tab(depth) .. key .. " = '" .. tostring(v) .. "'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. tab(depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. tab(depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)

    return output_str
end

-- @SilverWF idea
function findDaddy4Group(daddyName)
    local daddyhere = false
    for sortIndex = 1, GetGroupSize() do
        local unitTag = GetGroupUnitTagByIndex(sortIndex)
        local unitName = GetUnitName(unitTag)
        if daddyName == unitName then
            daddyhere = true
        end
    end
    return daddyhere
end

----------------------------------------
-- setting
----------------------------------------
local function createLAM2Panel()
    local panelData = {
        type = "panel",
        name = 'BeggingTheGear',
        displayName = ZO_HIGHLIGHT_TEXT:Colorize('BeggingTheGear'),
        author = "|cFFAA33" .. BTG.author .. "|r",
        version = BTG.version,
        registerForRefresh = true,
    }
    local optionsData = {
        -- [tpl] = {
        --     type = "checkbox",
        --     name = 'show TxtOutput status icon',
        --     tooltip = 'show the status ui when you trun off auto show',
        --     getFunc = function()
        --         return OJTOP.savedata.aleryuistatus
        --     end,
        --     setFunc = function(val)
        --         OJTOP.savedata.autoshowstatus = val
        --         OJTOP.toggleOJTOPStatusView(open)
        --     end,
        --     default = OJTOP.savedata.aleryuistatus,
        -- },
        [1] = {
            type = "checkbox",
            name = '使用私聊',
            tooltip = '开启 : 总是使用私聊\n关闭 : 不在组队状态时使用私聊',
            getFunc = function()
                return BTG.savedata.alwayswhisper
            end,
            setFunc = function(val)
                BTG.savedata.alwayswhisper = val
            end,
            default = BTG.savedata.alwayswhisper,
        },
    }
    LAM2:RegisterAddonPanel(BTG.name .. "LAM2Options", panelData)
    LAM2:RegisterOptionControls(BTG.name .. "LAM2Options", optionsData)
end
----------------------------------------
-- ZO_ScrollList @ ListGert Start
----------------------------------------
function BTG.ListGertInitializeRow(control, data)
    local filter = BTG.savedata.gearlist[data.key]
    -- 暫存著偷偷用
    control.keyid = data.key

    -- 因為會莫名其妙自己亮起來 只好強迫全關一次
    for key, val in pairs(ValueList_EquipType) do
        control:GetNamedChild("FilterGearBoxEquipType_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterGearBoxEquipType_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_EquipTrait) do
        control:GetNamedChild("FilterGearTraitBoxEquipTrait_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterGearTraitBoxEquipTrait_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_EquipWeight) do
        control:GetNamedChild("FilterWeightBoxEquipWeight_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterWeightBoxEquipWeight_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_JewelryTrait) do
        control:GetNamedChild("FilterJewelryTraitBoxJewelryTrait_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterJewelryTraitBoxJewelryTrait_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_WeaponType) do
        control:GetNamedChild("FilterWeaponBoxWeaponType_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterWeaponBoxWeaponType_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_WeaponTrait) do
        control:GetNamedChild("FilterWeaponTraitBoxWeaponTrait_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterWeaponTraitBoxWeaponTrait_" .. val .. "Btn").status = 0
    end
    for key, val in pairs(ValueList_ThingType) do
        control:GetNamedChild("FilterThingBoxThingType_" .. val):SetCenterColor(0, 0, 0, 0)
        control:GetNamedChild("FilterThingBoxThingType_" .. val .. "Btn").status = 0
    end

    -- 初始 savedata 值
    -- 增加判斷 , 如果陣列不存在 補上它
    -- 因為 2017 05 29 增加新判斷 導致舊用戶 缺資料
    control:GetNamedChild("InputKeyword"):SetText(filter.keyword)
    -- compatiblity with pre 2.3.1 savedvars
    if not filter.lvl then filter.lvl = 160 end
    if not filter.rarity then filter.rarity = 2 end
    ----
    control:GetNamedChild("InputLvl"):SetText(filter.lvl)
    control:GetNamedChild("InputRare"):SetText(filter.rarity)
    control:GetNamedChild("InputPrice"):SetText(filter.price)

    for key, val in pairs(filter.equiptype) do
        control:GetNamedChild("FilterGearBoxEquipType_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterGearBoxEquipType_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.equiptrait) do
        control:GetNamedChild("FilterGearTraitBoxEquipTrait_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterGearTraitBoxEquipTrait_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.equipweight) do
        control:GetNamedChild("FilterWeightBoxEquipWeight_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterWeightBoxEquipWeight_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.jewelrytrait) do
        control:GetNamedChild("FilterJewelryTraitBoxJewelryTrait_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterJewelryTraitBoxJewelryTrait_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.weapontype) do
        control:GetNamedChild("FilterWeaponBoxWeaponType_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterWeaponBoxWeaponType_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.weapontrait) do
        control:GetNamedChild("FilterWeaponTraitBoxWeaponTrait_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterWeaponTraitBoxWeaponTrait_" .. val .. "Btn").status = 1
    end
    for key, val in pairs(filter.thingtype) do
        control:GetNamedChild("FilterThingBoxThingType_" .. val):SetCenterColor(255, 134, 0, 1)
        control:GetNamedChild("FilterThingBoxThingType_" .. val .. "Btn").status = 1
    end
end

function BTG.UpdateListGertBox()
    local scrollData = ZO_ScrollList_GetDataList(BTGPanelViewListGertBox)
    ZO_ScrollList_Clear(BTGPanelViewListGertBox)
    local entries = BTG.gearlistCTL:GetKeys()
    for i = 1, #entries do
        scrollData[#scrollData + 1] = ZO_ScrollList_CreateDataEntry(BTG.gearlist_NOTE_TYPE, { key = entries[i] })
    end
    ZO_ScrollList_Commit(BTGPanelViewListGertBox)
end

function BTG.AddGearListFilter()
    keyword = BTGPanelViewInputTxtBoxInputTxt:GetText()
    BTGPanelViewInputTxtBoxInputTxt:SetText('')
    if keyword ~= '' then
        local filter = ZO_DeepTableCopy(init_savedef.def_gearlist)
        filter.keyword = keyword
        table.insert(BTG.savedata.gearlist, filter)
        table.sort(BTG.savedata.gearlist, sortByFilterKeyword)
        BTG.UpdateListGertBox()
    end
    BTGPanelViewInputTxtBoxInputTxt:LoseFocus()
end

function BTG.DelGearListFilter(tar)
    local keyid = tar:GetParent().keyid
    table.remove(BTG.savedata.gearlist, keyid)
    table.sort(BTG.savedata.gearlist, sortByFilterKeyword)
    BTG.UpdateListGertBox()
end

function BTG.CallIIfA2showme(tar)
    if IIfA ~= nil then
        local keyid = tar:GetParent().keyid
        local keyword = BTG.savedata.gearlist[keyid].keyword
        IIFA_GUI_SearchBackdropBox:SetText(keyword)
        if IIFA_GUI:IsHidden() then
            IIfA:ToggleInventoryFrame()
        end
    else
        d('BTG: Please install addon : Inventory Insight (3.0)')
        d('http://www.esoui.com/downloads/info731-InventoryInsight.html')
    end
end

function BTG.DelAllGearListFilter()
    for i = 1, table.getn(BTG.savedata.gearlist) do
        table.remove(BTG.savedata.gearlist, 1)
    end
    table.sort(BTG.savedata.gearlist, sortByFilterKeyword)
    BTG.UpdateListGertBox()
end

function BTG.UpdateGearListKeyword(tar)
    local keyid = tar:GetParent().keyid
    local keyword = tar:GetText()
    if keyword ~= '' then
        BTG.savedata.gearlist[keyid].keyword = keyword
    else
        table.remove(BTG.savedata.gearlist, keyid)
    end
    table.sort(BTG.savedata.gearlist, sortByFilterKeyword)
    BTG.UpdateListGertBox()
    tar:LoseFocus()
end

function BTG.UpdateGearListLvl(tar)
    local keyid = tar:GetParent().keyid
    local lvl = tar:GetText()
    BTG.savedata.gearlist[keyid].lvl = tonumber(lvl)
    tar:LoseFocus()
end

function BTG.UpdateGearListPrice(tar)
    local keyid = tar:GetParent().keyid
    local price = tar:GetText()
    BTG.savedata.gearlist[keyid].price = price
    tar:LoseFocus()
end

function BTG.UpdateGearListRarity(tar)
    local keyid = tar:GetParent().keyid
    local rare = tar:GetText()
    BTG.savedata.gearlist[keyid].rarity = tonumber(rare)
    tar:LoseFocus()
end

function BTG.OnFilterClick(tar, filterType, filterId)
    local keyid = tar:GetParent():GetParent():GetParent().keyid
    local status = tar.status
    local findArrThenBack_curl = 'c'

    if status == 1 then
        status = 0
        findArrThenBack_curl = 'd'
        tar:GetParent():SetCenterColor(0, 0, 0, 0)
        tar.status = status
    else
        status = 1
        findArrThenBack_curl = 'c'
        tar:GetParent():SetCenterColor(255, 134, 0, 1)
        tar.status = status
    end

    if filterType == 'EType' then
        BTG.savedata.gearlist[keyid].equiptype = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].equiptype, filterId)
    end
    if filterType == 'ETrait' then
        BTG.savedata.gearlist[keyid].equiptrait = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].equiptrait, filterId)
    end
    if filterType == 'EWeight' then
        BTG.savedata.gearlist[keyid].equipweight = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].equipweight, filterId)
    end
    if filterType == 'JTrait' then
        BTG.savedata.gearlist[keyid].jewelrytrait = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].jewelrytrait, filterId)
    end
    if filterType == 'WType' then
        BTG.savedata.gearlist[keyid].weapontype = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].weapontype, filterId)
    end
    if filterType == 'WTrait' then
        BTG.savedata.gearlist[keyid].weapontrait = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].weapontrait, filterId)
    end
    if filterType == 'TType' then
        BTG.savedata.gearlist[keyid].thingtype = findArrThenBack(findArrThenBack_curl,
            BTG.savedata.gearlist[keyid].thingtype, filterId)
    end
end

function BTG.GearListInputTip(type, tar, msg)
    if type == 1 then
        if msg == 'showDaddyID' then
            local keyid = tar:GetParent().keyid
            local daddy = BTG.savedata.daddylist[keyid]
            if daddy.userid ~= nil and daddy.userid ~= '' then
                ZO_Tooltips_ShowTextTooltip(tar, LEFT, daddy.userid)
            end
        elseif msg ~= '' and msg ~= nil then
            ZO_Tooltips_ShowTextTooltip(tar, BOTTOM, msg)
        else
            ZO_Tooltips_ShowTextTooltip(tar, BOTTOM, '按 enter 键保存')
        end
    end
    if type == 0 then
        ZO_Tooltips_HideTextTooltip()
    end
end

----------------------------------------
-- ZO_ScrollList @ ListGert End
----------------------------------------


----------------------------------------
-- ZO_ScrollList @ ListDaddy Start
----------------------------------------

function BTG.ListDaddyInitializeRow(control, data)
    local daddy = BTG.savedata.daddylist[data.key]
    -- 暫存著偷偷用
    control.keyid = data.key
    -- 初始 savedata 值
    local icon, _, _, _, _ = GetItemLinkInfo(daddy.itemlink)
    local imgItem = '|t22:22:' .. icon .. '|t'
    local username = '|c5EB9D7' .. zo_strformat("<<1>>", daddy.username) .. '|r';
    local itemTrait = GetItemLinkTraitInfo(daddy.itemlink)
    local imgTrait = '' -- '|t22:22:/esoui/art/icons/'..ICON_PATH[itemTrait]..'.dds|t'
    if ICON_PATH[itemTrait] ~= nil then
        imgTrait = '|t22:22:/esoui/art/icons/' .. ICON_PATH[itemTrait] .. '.dds|t'
    end
    local itemlink = imgItem .. imgTrait .. '|u3:0::|u' .. daddy.itemlink;
    -- 塞值
    control:GetNamedChild("TxtDaddy"):SetText(username)
    control:GetNamedChild("TxtItemlink"):SetText(itemlink)
end

function BTG.UpdateListDaddyBox()
    local scrollData = ZO_ScrollList_GetDataList(BTGPanelViewListDaddyBox)
    ZO_ScrollList_Clear(BTGPanelViewListDaddyBox)
    local entries = BTG.daddylistCTL:GetKeys()
    for i = 1, #entries do
        scrollData[#scrollData + 1] = ZO_ScrollList_CreateDataEntry(BTG.daddylist_NOTE_TYPE, { key = entries[i] })
    end
    ZO_ScrollList_Commit(BTGPanelViewListDaddyBox)
end

function BTG.AddDaddyListRow(filterid, user, itemlink, price)
    if user ~= '' and itemlink ~= '' then
        local userid = ''
        -- 巡一遍 group list 找到比對撿到的人
        local gs = GetGroupSize();
        local unitTag
        for i = 1, gs do
            unitTag = GetGroupUnitTagByIndex(i);
            if user == GetRawUnitName(unitTag) then
                userid = GetUnitDisplayName(unitTag)
            end
        end
        -- 存下爸爸資料
        local daddy = {
            filterid = filterid,
            userid = userid,
            username = user,
            itemlink = itemlink,
            price = price,
        }
        table.insert(BTG.savedata.daddylist, daddy)
        BTG.UpdateListDaddyBox()
    end
end

function BTG.DelDaddyListRow(tar)
    local keyid = tar:GetParent().keyid
    table.remove(BTG.savedata.daddylist, keyid)
    BTG.UpdateListDaddyBox()
end

function BTG.DelAllDaddyListRow()
    for i = 1, table.getn(BTG.savedata.daddylist) do
        table.remove(BTG.savedata.daddylist, 1)
    end
    BTG.UpdateListDaddyBox()
end

function BTG.BeggingDaddyListRow(tar, act)
    local keyid = tar:GetParent().keyid
    local daddy = BTG.savedata.daddylist[keyid]
    local daddyName = zo_strformat("<<1>>", daddy.username)
    local isay = ''
    local channel = '/say'
    if act == 1 then
        isay = daddyName ..
            ", can you give me " .. zo_strformat("<<1>>", daddy.itemlink) .. ", please?" .. "\n" ..
            daddyName ..
            ", 你可以给我" .. zo_strformat("<<1>>", daddy.itemlink) .. "吗, 球球了好兄弟"
        if (findDaddy4Group(daddyName)) then
            if BTG.savedata.alwayswhisper then
                -- isay = daddyName .. ", can you give me " .. zo_strformat("<<1>>", daddy.itemlink) .. ", please?"
                channel = "/w "
            else
                -- isay = daddyName .. ", can you give me " .. zo_strformat("<<1>>", daddy.itemlink) .. ", please?"
                channel = "/p "
            end
        else
            -- isay = daddyName .. ", can you give me " .. zo_strformat("<<1>>", daddy.itemlink) .. ", please?"
            channel = "/w "
        end
        isayToChat(channel .. isay)
    else
    end
end

function BTG.PriceDaddyListRow(tar, act)
    local keyid = tar:GetParent().keyid
    local daddy = BTG.savedata.daddylist[keyid]
    local daddyName = zo_strformat("<<1>>", daddy.username)
    local daddyOffer = (daddy.price and zo_strformat("<<1>>", daddy.price) or 'tons')
    local isay = ''
    local channel = '/say'
    if act == 1 then
        isay = daddyName ..
            ", can you sell me " ..
            zo_strformat("<<1>>", daddy.itemlink) .. " for " .. daddyOffer .. " g., please?" ..
            daddyName ..
            ", 你可以把 " ..
            zo_strformat("<<1>>", daddy.itemlink) .. " 以这个价格 " .. daddyOffer .. " g.卖给我吗, 义父！"
        if (findDaddy4Group(daddyName)) then
            if BTG.savedata.alwayswhisper then
                -- isay = daddyName .. ", can you sell me " .. zo_strformat("<<1>>", daddy.itemlink) .. " for " .. daddyOffer .. " g., please?"
                channel = "/w "
            else
                -- isay = daddyName .. ", can you sell me " .. zo_strformat("<<1>>", daddy.itemlink) .. " for " .. daddyOffer .. " g., please?"
                channel = "/p "
            end
        else
            -- isay = daddyName .. ", can you sell me " .. zo_strformat("<<1>>", daddy.itemlink) .. " for " .. daddyOffer .. " g., please?"
            channel = "/w "
        end
        isayToChat(channel .. isay)
    else
        -- StartChatInput(isay, channel, target)
    end
end

-- click daddy item list , show keyword on IIFA
function BTG.DaddyOnClicked(tar)
    if IIfA ~= nil then
        local keyid = tar:GetParent().keyid
        local daddy = BTG.savedata.daddylist[keyid]
        if daddy.filterid ~= nil and daddy.filterid ~= '' then
            local keyword = BTG.savedata.gearlist[daddy.filterid].keyword
            IIFA_GUI_SearchBackdropBox:SetText(keyword)
            if IIFA_GUI:IsHidden() then
                IIfA:ToggleInventoryFrame()
            end
        end
    end
end

function BTG.DaddyOnMouseEnter(tar)
    local keyid = tar:GetParent().keyid
    local daddy = BTG.savedata.daddylist[keyid]
    if W_width == 0 then
        W_width = GuiRoot:GetRight()
        BTG_max_left = W_width - 800 - 420
    end
    if BTGPanelView:GetLeft() > BTG_max_left then
        InitializeTooltip(BTGTooltip, BTGPanelView, TOPRIGHT, -20, 0, TOPLEFT)
    else
        InitializeTooltip(BTGTooltip, BTGPanelView, TOPLEFT, 5, 0, TOPRIGHT)
    end
    BTGTooltip:SetLink(daddy.itemlink);
end

function BTG.DaddyOnMouseExit(tar)
    ClearTooltip(BTGTooltip);
end

----------------------------------------
-- ZO_ScrollList @ ListDaddy End
----------------------------------------



----------------------------------------
-- UI CTRL Start
----------------------------------------
function BTG:OnUiPosLoad()
    BTGPanelView:ClearAnchors()
    BTGPanelView:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, BTG.savedata.gearlist_pos[0], BTG.savedata.gearlist_pos[1])
    BTGPanelView:SetWidth(350)
    BTGPanelView:SetHeight(BTG.savedata.gearlist_pos[3])
    BTG.UpdateListDaddyBox()
    BTG.UpdateListGertBox()

    BTGLootTipView:ClearAnchors()
    BTGLootTipView:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, BTG.savedata.combattip_pos[0], BTG.savedata.combattip_pos[1])
end

function BTG.OnUiPosSave(tag)
    if tag == 'BTGPanelView' then
        BTG.savedata.gearlist_pos[0] = BTGPanelView:GetLeft()
        BTG.savedata.gearlist_pos[1] = BTGPanelView:GetTop()
        BTG.savedata.gearlist_pos[2] = 300
        BTG.savedata.gearlist_pos[3] = BTGPanelView:GetHeight()
        BTG.UpdateListDaddyBox()
        BTG.UpdateListGertBox()
    end
    if tag == 'BTGLootTipView' then
        BTG.savedata.combattip_pos[0] = BTGLootTipView:GetLeft()
        BTG.savedata.combattip_pos[1] = BTGLootTipView:GetTop()
    end
end

function BTG.toggleBTGPanelView(open)
    if open == nil then
        SM:ToggleTopLevel(BTGPanelView)
    elseif open == 1 then
        SM:ShowTopLevel(BTGPanelView)
    elseif open == 0 then
        SM:HideTopLevel(BTGPanelView)
    end
end

function BTG.toggleBTGFilterView(open)
    if BTGPanelViewListGertBox:IsHidden() then
        BTGPanelViewListDaddyBox:SetHidden(true)
        BTGPanelViewBtnDelListDaddy:SetHidden(true)
        BTGPanelViewHeaderBtnShowFilter:SetHidden(true)
        BTGPanelViewInputTxtBox:SetHidden(false)
        BTGPanelView:SetWidth(670)
        BTGPanelViewListGertBox:SetHidden(false)
        BTGPanelViewBtnDelListGert:SetHidden(false)
        BTGPanelViewHeaderBtnHideFilter:SetHidden(false)
    else
        BTGPanelViewListDaddyBox:SetHidden(false)
        BTGPanelViewBtnDelListDaddy:SetHidden(false)
        BTGPanelViewHeaderBtnShowFilter:SetHidden(false)
        BTGPanelViewInputTxtBox:SetHidden(true)
        BTGPanelView:SetWidth(300)
        BTGPanelViewListGertBox:SetHidden(true)
        BTGPanelViewBtnDelListGert:SetHidden(true)
        BTGPanelViewHeaderBtnHideFilter:SetHidden(true)
    end
end

function BTG.moveCloseBTGPanelView(eventCode)
    if BTGPanelView:IsHidden() then
        -- SM:ToggleTopLevel(BTGPanelView)
        -- SM:HideTopLevel(BTGPanelView)
    else
        BTGPanelView:SetHidden(true)
    end
end

function BTG.setBTGPanelPos(parent, pos)
    BTGPanelView:ClearAnchors()
    BTGPanelView:SetAnchor(8, parent, 2, pos, 0)
end

function BTG.resetBTGPanelPos()
    BTGPanelView:ClearAnchors()
    BTGPanelView:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, BTG.savedata.gearlist_pos[0], BTG.savedata.gearlist_pos[1])
end

function BTG.toggleBTGLootTipView(open)
    if open == nil then
        if BTGLootTipView:IsHidden() then
            BTGLootTipView:SetHidden(false)
        else
            BTGLootTipView:SetHidden(true)
        end
    elseif open == 1 then
        BTGLootTipView:SetHidden(false)
    elseif open == 0 then
        BTGLootTipView:SetHidden(true)
    end
end

function BTG.conmoveBTGLootTipView(status)
    if status == 1 then
        BTGLootTipViewBg:SetCenterColor(255, 0, 0, 1)
        -- BTGLootTipViewBg:SetEdgeColor(200,0,0,1)
        WM:SetMouseCursor(MOUSE_CURSOR_PAN)
    elseif status == 0 then
        BTGLootTipViewBg:SetCenterColor(0, 0, 0, 1)
        -- BTGLootTipViewBg:SetEdgeColor(107,61,59,1)
        WM:SetMouseCursor(MOUSE_CURSOR_DO_NOT_CARE)
    end
    -- btn:SetNormalTexture(textures.NORMAL)
    -- btn:SetPressedTexture(textures.PRESSED)
    -- btn:SetMouseOverTexture(textures.MOUSEOVER)
    -- btn:SetDisabledTexture(textures.DISABLED)
end

----------------------------------------
-- UI CTRL End
----------------------------------------



----------------------------------------
-- TEST Start
----------------------------------------
function BTG.TestByJelly()
    local itemlink = BTGPanelViewInputTxtBoxInputTxt:GetText()
    if itemlink == '' then
        BTG.toggleBTGLootTipView(1)
        -- d(BTG.MatchItemFilter('|H1:item:97022:4:22:0:0:0:0:0:0:0:0:0:0:0:0:11:0:0:0:10000:0|h|h'))
    else
        local tbl = BTG.MatchItemFilter(itemlink, true)
        local str = "Debug Msg : " .. "\n"
        str = str .. table2string(tbl) .. "\n"
        str = str .. "match : " .. tostring(tbl.match) .. "\n"
        str = str .. "filterid : " .. tostring(tbl.filterid) .. "\n"
        str = str .. "filterkeyword : " .. tostring(tbl.filterkeyword) .. "\n"
        BTGPanelViewLogTxtBoxVal:SetText(str)
        BTGPanelViewLogTxtBox:SetHidden(false)
    end
end

-- 可以抓出 飾品 特性 的遊戲中資料
-- for trait = 1, 12 do
--     local tid = GetSmithingResearchLineTraitInfo(7,1,trait)
--     local _,desc = GetSmithingResearchLineTraitInfo(7,1,trait)
--     local _,name,icon = GetSmithingTraitItemInfo(tid + 1)
--     d(GetString('SI_ITEMTRAITTYPE',tid)..' |t25:25:'..icon..'|t|t5:25:x.dds|t')
--     d(icon)
--     d(name)
--     d(desc)
-- end

----------------------------------------
-- TEST End
----------------------------------------


----------------------------------------
-- Loot Recieved handler
----------------------------------------
function BTG.OnLootReceived(eventCode, receivedBy, itemName, quantity, itemSound, lootType, lootedBySelf,
                            isPickpocketLoot, questItemIcon, itemId)
    local re = BTG.MatchItemFilter(itemName)
    local name = 'yourself'
    if receivedBy ~= nil then
        name = receivedBy
    end
    if re.match then
        BTG.AddDaddyListRow(re.filterid, name, itemName, re.price)
        BTGLootTipView:SetHidden(false)
    end
end

----------------------------------------
-- Loot Check Main function
----------------------------------------
function BTG.MatchItemFilter(itemlink)
    local re = {
        match = false,
        price = '',
        filterid = '',
        filterkeyword = '',
        keyWordCheck = false,
        itemCheck = false,
        jewelryCheck = false,
        armorCheck = false,
        weaponCheck = false,
    }
    for k, filter in pairs(BTG.savedata.gearlist) do
        re.keyWordCheck = BTG.MatchKeyWord(itemlink, filter)
        if re.keyWordCheck then
            re.itemCheck = BTG.ItemCheck(itemlink, filter)
            if not re.itemCheck then
                local equipLType = GetItemLinkEquipType(itemlink)                                                                                               -- EQUIP_TYPE_ (look below). Non gear items: 0 - INVALID, 11 - COSTUME, 15 - POISON
                if equipLType == 5 or equipLType == 6 or equipLType == 7 or equipLType == 14 then                                                               -- Weapons: 5 ONE_HAND, 6 TWO_HAND, 7 OFF_HAND, 14 MAIN_HAND
                    re.weaponCheck = BTG.WeaponCheck(itemlink, filter)
                elseif equipLType == 2 or equipLType == 12 then                                                                                                 -- Jewelry: 2 NECK, 12 RING
                    re.jewelryCheck = BTG.JewelryCheck(itemlink, filter, equipLType)
                elseif equipLType == 1 or equipLType == 3 or equipLType == 4 or equipLType == 8 or equipLType == 9 or equipLType == 10 or equipLType == 13 then -- Armor: 1 HEAD, 3 CHEST, 4 SHOULDERS, 8 WAIST, 9 LEGS, 10 FEET, 13 HAND
                    re.armorCheck = BTG.ArmorCheck(itemlink, filter, equipLType)
                end
            end
        end

        if re.keyWordCheck and (re.itemCheck or re.weaponCheck or re.jewelryCheck or re.armorCheck) then
            re.match = true
            re.filterid = k
            re.lvl = filter.lvl
            re.rarity = filter.rarity
            re.price = filter.price
            break
        else
            re.match = false
        end
    end

    return re
end

----------------------------------------
-- Loot Check Support functions
----------------------------------------
function BTG.MatchKeyWord(itemlink, filterid)
    local keyCheck = false
    local _, lootSetname, _, _, _, _ = GetItemLinkSetInfo(itemlink) -- Get the name of set
    local lootName = GetItemLinkName(itemlink)                      -- Get the name of the item
    local lootString = string.lower(lootName)
    local lootSetstring = string.lower(lootSetname)                 --
    local filterKey = string.lower(filterid.keyword)
    if filterKey ~= '' then
        keyCheck = (string.match(lootSetstring, filterKey) ~= nil)
        if not keyCheck then
            keyCheck = (string.match(lootString, filterKey) ~= nil)
        end
    end
    return keyCheck
end

function BTG.ItemCheck(itemlink, filterid)
    local itemCheck = false
    local filterType = filterid.thingtype
    if table.getn(filterType) > 0 then
        itemCheck = in_array(999, filterType)
    end
    return itemCheck
end

function BTG.JewelryCheck(itemlink, filterid, equiptype)
    local isBop = IsItemLinkBound(itemlink)
    if isBop then return false end
    local cplevel = GetItemLinkRequiredChampionPoints(itemlink)
    if cplevel < filterid.lvl and filterid.lvl > 0 then return false end
    local rarity = GetItemLinkFunctionalQuality(itemlink)
    if filterid.rarity > 0 and rarity < filterid.rarity then return false end
    --
    local jewelryCheck = false
    local typeCheck = false
    local traitCheck = false
    local lootedType = equiptype
    local lootedTrait = GetItemLinkTraitInfo(itemlink) -- ITEM_TRAIT_TYPE_JEWELRY_: 21 HEALTHY, 22 ARCANE, 23 ROBUST, 24 ORNATE, 27 INTRICATE, 28 SWIFT, 29 HARMONY, 30 TRIUNE, 31 BLOODTHIRSTY, 32 PROTECTIVE, 33 INFUSED
    local filterType = filterid.equiptype
    local filterTrait = filterid.jewelrytrait
    --
    if table.getn(filterType) > 0 then
        typeCheck = in_array(lootedType, filterType)
    else
        return false
    end
    if typeCheck then
        if table.getn(filterTrait) > 0 then
            traitCheck = in_array(lootedTrait, filterTrait)
        else
            traitCheck = true
        end
    end

    if typeCheck and traitCheck then
        jewelryCheck = true
    end

    return jewelryCheck
end

function BTG.WeaponCheck(itemlink, filterid)
    local isBop = IsItemLinkBound(itemlink)
    if isBop then return false end
    local cplevel = GetItemLinkRequiredChampionPoints(itemlink)
    if cplevel < filterid.lvl and filterid.lvl > 0 then return false end
    local rarity = GetItemLinkFunctionalQuality(itemlink)
    if filterid.rarity > 0 and rarity < filterid.rarity then return false end
    --
    local weaponCheck = false
    local typeCheck = false
    local traitCheck = false
    local lootedType = GetItemLinkWeaponType(itemlink) -- WEAPONTYPE_: 0 NONE, 1 AXE, 2 HAMMER, 3 SWORD, 4 TWO_HANDED_SWORD, 5 TWO_HANDED_AXE, 6 TWO_HANDED_HAMMER, 7 PROP, 8 BOW, 9 HEALING_STAFF, 10 RUNE, 11 DAGGER, 12 FIRE_STAFF, 13 FROST_STAFF, 14 SHIELD, 15 LIGHTNING_STAFF
    local lootedTrait = GetItemLinkTraitInfo(itemlink) -- ITEM_TRAIT_TYPE_WEAPON_: 1 POWERED, 2 CHARGED, 3 PRECISE, 4 INFUSED, 5 DEFENDING, 6 TRAINING, 7 SHARPENED, 8 DECISIVE or WEIGHTED, 9 INTRICATE, 10 ORNATE, 26 NIRNHONED
    local filterType = filterid.weapontype
    local filterTrait = filterid.weapontrait
    if lootedType == 14 then
        filterTrait = filterid.equiptrait
    end
    --
    if table.getn(filterType) > 0 then
        typeCheck = in_array(lootedType, filterType)
    else
        return false
    end
    if typeCheck then
        if table.getn(filterTrait) > 0 then
            traitCheck = in_array(lootedTrait, filterTrait)
        else
            traitCheck = true
        end
    end

    if typeCheck and traitCheck then
        weaponCheck = true
    end

    return weaponCheck
end

function BTG.ArmorCheck(itemlink, filterid, equiptype)
    local isBop = IsItemLinkBound(itemlink)
    if isBop then return false end
    local cplevel = GetItemLinkRequiredChampionPoints(itemlink)
    if cplevel < filterid.lvl and filterid.lvl > 0 then return false end
    local rarity = GetItemLinkFunctionalQuality(itemlink)
    if filterid.rarity > 0 and rarity < filterid.rarity then return false end
    --
    local armorCheck = false
    local typeCheck = false
    local traitCheck = false
    local weightCheck = false
    local lootedType = equiptype
    local lootedTrait = GetItemLinkTraitInfo(itemlink)  -- ITEM_TRAIT_TYPE_ARMOR_: 11 STURDY, 12 IMPENETRABLE, 13 REINFORCED, 14 WELL_FITTED, 15 TRAINING, 16 INFUSED, 17 PROSPEROUS or EXPLORATION, 18 DIVINES, 19 ORNATE, 20 INTRICATE, 25 NIRNHONED
    local lootedWeight = GetItemLinkArmorType(itemlink) -- ARMORTYPE_: 0 NONE, 1 LIGHT, 2 MEDIUM, 3 HEAVY
    local filterType = filterid.equiptype
    local filterTrait = filterid.equiptrait
    local filterWeight = filterid.equipweight
    --
    if table.getn(filterType) > 0 then
        typeCheck = in_array(lootedType, filterType)
    else
        return false
    end
    if typeCheck then
        if table.getn(filterTrait) > 0 then
            traitCheck = in_array(lootedTrait, filterTrait)
        else
            traitCheck = true
        end
        if table.getn(filterWeight) > 0 then
            weightCheck = in_array(lootedWeight, filterWeight)
        else
            weightCheck = true
        end
    end

    if typeCheck and traitCheck and weightCheck then
        armorCheck = true
    end

    return armorCheck
end

----------------------------------------
-- INIT
----------------------------------------
function BTG:Initialize()
    SM:RegisterTopLevel(BTGPanelView, false) -- 註冊最高層

    --local Storage = BTG.Storage
    local SLGD = BTG.SLGD
    local SLDD = BTG.SLDD

    BTG.savedata = ZO_SavedVars:NewAccountWide('BTG_savedata', 1, nil, init_savedef)
    -- Works fine without that deep table copy.
    -- 2017 05 29 增加資料 檢查舊資料的預設直
    -- for k,filter in pairs(BTG.savedata.gearlist) do
    -- for k2,filterfield in pairs(init_savedef.def_gearlist) do
    -- if not filter[k2] then
    -- filter[k2] = ZO_DeepTableCopy(filterfield) -- Works fine now.
    -- end
    -- end
    -- BTG.savedata.gearlist[k] = filter
    -- end
    BTG.gearlistCTL = SLGD:New(BTG.savedata)
    BTG.daddylistCTL = SLDD:New(BTG.savedata)

    -- key bind controls
    ZO_CreateStringId("SI_BINDING_NAME_SHOW_BTGPanelView", "切换显示ui")
    ZO_CreateStringId("SI_BINDING_NAME_SHOW_BTGLootTipView", "切换弹窗图标")
    ZO_CreateStringId("SI_BINDING_NAME_DEV_BTGReloadUi", "重新加载ui")

    -- BTGPanelView gear list
    BTG.gearlist_NOTE_TYPE = 1
    ZO_ScrollList_AddDataType(BTGPanelViewListGertBox, BTG.gearlist_NOTE_TYPE, "ListGertTpl", 145,
        BTG.ListGertInitializeRow)
    BTG.gearlistCTL:RegisterCallback("OnKeysUpdated", BTG.UpdateListGertBox)
    BTG.UpdateListGertBox()
    -- BTGPanelView daddy list
    BTG.daddylist_NOTE_TYPE = 1
    ZO_ScrollList_AddDataType(BTGPanelViewListDaddyBox, BTG.daddylist_NOTE_TYPE, "ListDaddyTpl", 70,
        BTG.ListDaddyInitializeRow)
    BTG.daddylistCTL:RegisterCallback("OnKeysUpdated", BTG.UpdateListDaddyBox)
    BTG.UpdateListDaddyBox()

    -- 物品撿取
    EM:RegisterForEvent(self.ename, EVENT_LOOT_RECEIVED, self.OnLootReceived)
    -- EVENT_MANAGER:UnregisterForEvent(moduleName, EVENT_LOOT_RECEIVED)

    -- 一堆 TopLevel 視窗問題
    EM:RegisterForEvent(self.ename, EVENT_NEW_MOVEMENT_IN_UI_MODE, function() BTG.toggleBTGPanelView(0) end)
    ZO_PreHookHandler(ZO_PlayerInventory, 'OnShow', function() BTG.setBTGPanelPos(ZO_PlayerInventory, -50) end)
    ZO_PreHookHandler(ZO_PlayerInventory, 'OnHide', BTG.resetBTGPanelPos)
    ZO_PreHookHandler(ZO_Skills, 'OnShow', function() BTG.toggleBTGPanelView(0) end)
    ZO_PreHookHandler(ZO_ChampionPerks, 'OnShow', function() BTG.toggleBTGPanelView(0) end)
    ZO_PreHookHandler(BTGPanelView, 'OnShow', function() BTG.toggleBTGLootTipView(0) end)
    ZO_PreHookHandler(BTGPanelView, 'OnHide',
        function()
            BTG.toggleBTGLootTipView(0); BTGPanelViewLogTxtBox:SetHidden(true);
        end)

    ZO_PreHookHandler(BTGLootTipView, 'OnMouseEnter', function() BTG.conmoveBTGLootTipView(1) end)
    ZO_PreHookHandler(BTGLootTipView, 'OnMouseExit', function() BTG.conmoveBTGLootTipView(0) end)

    -- setting page
    createLAM2Panel()

    -- 一些 SLASH COMMANDS 視窗問題
    SLASH_COMMANDS["/btg"] = function()
        BTG.toggleBTGPanelView();
    end
    SLASH_COMMANDS["/btgt"] = function()
        BTG.toggleBTGLootTipView();
    end
    BTG:OnUiPosLoad()
end

function BTG.OnAddOnLoaded(event, addonName)
    if addonName ~= BTG.name then return end
    EM:UnregisterForEvent(BTG.ename, EVENT_ADD_ON_LOADED)
    BTG:Initialize()

    SLASH_COMMANDS["/j1"] = function()
        d('OnAddOnLoaded')
    end
end

EM:RegisterForEvent(BTG.ename, EVENT_ADD_ON_LOADED, BTG.OnAddOnLoaded);
