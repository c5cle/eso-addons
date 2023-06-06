local ADDON_NAME = "Chat2Clipboard"
local nextEventHandleIndex = 1
Chat2Clipboard = {}
Chat2Clipboard.Defaults = {
    removeChannel = false,
    removeSender = false,
    removeTimestamp = false,
    removepChat = true,
    removeIcons = true,
    removeColorTags = true,
    removeFormatting = true,
    replaceLinks = true,
}

local function RegisterForEvent(event, callback)
    local eventHandleName = ADDON_NAME .. nextEventHandleIndex
    EVENT_MANAGER:RegisterForEvent(eventHandleName, event, callback)
    nextEventHandleIndex = nextEventHandleIndex + 1
    return eventHandleName
end

local function UnregisterForEvent(event, name)
    EVENT_MANAGER:UnregisterForEvent(name, event)
end

local function OnAddonLoaded(callback)
    local eventHandle = ""
    eventHandle = RegisterForEvent(EVENT_ADD_ON_LOADED, function(event, name)
        if(name ~= ADDON_NAME) then return end
        callback()
        UnregisterForEvent(event, name)
    end)
end

------------------------------
local PCHAT_LINK = "p" -- PCHAT_LINK is a local value defined in pChat.lua
local MOUSE_BUTTON_LEFT = MOUSE_BUTTON_INDEX_LEFT
local MOUSE_BUTTON_RIGHT = MOUSE_BUTTON_INDEX_RIGHT
local ICON_SIZE = 12
local COPY_LINK_TYPE = "copyText"
local COPY_LINK_ICON = zo_iconFormat("Chat2Clipboard/images/copy.dds", ICON_SIZE, ICON_SIZE)
local REVERSE_BLANK_ICON = zo_iconFormat("blank.dds", -7, ICON_SIZE)
-- we use a negative image width to go outside the visible area, then place a link with a dot and space as text and then the actual icon
-- the combination of char - space spans the link through the image until the next char appears in the string
local COPY_LINK_FORMAT = ("%s|Hignore:%s:%%d:%%d|h. |h%s"):format(REVERSE_BLANK_ICON, COPY_LINK_TYPE, COPY_LINK_ICON)

local CircularBuffer = nil
local clipBoardControl = nil
local window = nil
local copyBufferList = {}
local savedVars
local version = 1
local defaultVars = {
    removeChannel = false,
    removeSender = false,
    removeTimestamp = false,
    removepChat = true,
    removeIcons = true,
    removeColorTags = true,
    removeFormatting = true,
    replaceLinks = true,
}

local function CreateClipBoardControl()
    window = Chat2ClipboardControl -- api v100010 made the CopyAllTextToClipboard method private so we can only show a textbox, select everything and let the user press ctrl+c manually now
    clipBoardControl = Chat2ClipboardControlOutputBox
    clipBoardControl:SetMaxInputChars(100000)
    clipBoardControl:SetHandler("OnTextChanged", function(control)
        control:SelectAll()
    end)
    clipBoardControl:SetHandler("OnFocusLost", function()
        window:SetHidden(true)
    end)
end

local function CreateCopyBuffer(buffer)
    local copyBuffer = CircularBuffer:New(buffer:GetMaxHistoryLines())
    table.insert(copyBufferList, copyBuffer)
    return #copyBufferList
end

local function CreateCopyButton(copyBufferIndex, message)
    local copyBuffer = copyBufferList[copyBufferIndex]
    local index = copyBuffer:Add(message)
    return COPY_LINK_FORMAT:format(copyBufferIndex, index)
end

local library = {}
for i = 1, GetNumLoreCategories() do
    local _, numCollections = GetLoreCategoryInfo(i)
    for j = 1, numCollections do
        local _, _, _, totalBooks =  GetLoreCollectionInfo(i, j)
        for k = 1, totalBooks do
            local title = GetLoreBookInfo(i, j, k)
            local _, _, _, bookId = ZO_LinkHandler_ParseLink(GetLoreBookLink(i, j, k))
            library[bookId] = title
        end
    end
end

local function RemoveLink(linkToReplace)
    local label, style, type, id = ZO_LinkHandler_ParseLink(linkToReplace)
    if(savedVars.replaceLinks) then
        local isLinkStyleBrackets = (tonumber(style) == LINK_STYLE_BRACKETS)
        local linkStyle, text
        if(type == ITEM_LINK_TYPE) then
            linkStyle = (isLinkStyleBrackets and SI_LINK_FORMAT_ITEM_NAME_BRACKETS or SI_LINK_FORMAT_ITEM_NAME)
            text = GetItemLinkName(linkToReplace)
        elseif(type == ACHIEVEMENT_LINK_TYPE) then
            linkStyle = (isLinkStyleBrackets and SI_LINK_FORMAT_GENERIC_NAME_BRACKETS or SI_LINK_FORMAT_GENERIC_NAME)
            text = GetAchievementInfo(tonumber(id))
        elseif(type == BOOK_LINK_TYPE and savedVars.replaceLinks) then
            linkStyle = (isLinkStyleBrackets and SI_LINK_FORMAT_GENERIC_NAME_BRACKETS or SI_LINK_FORMAT_GENERIC_NAME)
            text = (library[id] or GetString(SI_ITEM_SUB_TYPE_BOOK))
        end

        if(text and #text > 0) then
            return zo_strformat(linkStyle, text)
        elseif(#label > 0) then
            return label
        else
            return "[link]"
        end
    end
    if(savedVars.removepChat and type == PCHAT_LINK) then
        return label
    end
    return linkToReplace
end

local function HandleLeftClick(message, stripAll)
    if(savedVars.removeChannel or stripAll) then
        message = message:gsub("|H%d:channel:.-|h.-|h ", "", 1)
    end
    if(savedVars.removeSender or stripAll) then
        local num = 0
        message, num = message:gsub("|H%d:display:.-|h.-|h: ", "", 1) --display name link
        if num == 0 then
            message = message:gsub("|H%d:character:.-|h.-|h: ", "", 1) --character link
        end
    end
    if(savedVars.removeTimestamp or stripAll) then
        local num = 0
        message, num = message:gsub("|H%d:p:.-|h%[%d%d:%d%d.-%]|h ", "", 1) --pChat timestamp
        if num == 0 then
            message = message:gsub("%[%d%d:%d%d.-%]", "", 1) --other timestamps
        end
    end
    if(savedVars.removeIcons or stripAll) then
        message = message:gsub("|t.-|t", "") -- icons
    end
    if(savedVars.removeColorTags or stripAll) then
        message = message:gsub("|c......(.-)|r", "%1") -- remove color tags with an end tag
        message = message:gsub("|c......", "") -- remove remaining malformed color tags
    end
    if(savedVars.removeFormatting or stripAll) then
        message = message:gsub("|u.-|u", "") -- padding
        message = message:gsub("|L.-|l(.-)|l", "%1") -- lines
    end
    message = message:gsub("(|H.-|h.-|h)", RemoveLink) -- remove links
    return message
end

local function AddMenuCheckbox(text, key)
    local itemIndex = AddCustomMenuItem(text, function(self, state)
        savedVars[key] = state
    end, MENU_ADD_OPTION_CHECKBOX)
    UpdateMenuItemState(itemIndex, savedVars[key])
end

local function HandleRightClick(control)
    ClearMenu()
    SetMenuSpacing(4)
    AddMenuCheckbox("Remove channel name", "removeChannel")
    AddMenuCheckbox("Remove sender name", "removeSender")
    AddMenuCheckbox("Remove timestamp", "removeTimestamp")
    if pChat then AddMenuCheckbox("Remove pChat links", "removepChat") end
    AddMenuCheckbox("Remove icons", "removeIcons")
    AddMenuCheckbox("Remove color tags", "removeColorTags")
    AddMenuCheckbox("Remove other formatting", "removeFormatting")
    AddMenuCheckbox("Replace links with text", "replaceLinks")
    ZO_Menu.height = 17 * (pChat and 8 or 7) -- a small hack to get the context menu height right
    ShowMenu(control)
end

local function ShowClipBoardControl(text)
    clipBoardControl:SetText(text)
    window:SetHidden(false)
    clipBoardControl:TakeFocus()
end

local TRANSLATE_URL = "https://translate.google.com/#auto/auto/"

local function RequestTranslate(text)
    RequestOpenUnsafeURL(TRANSLATE_URL .. text:gsub("/", "%%2F"):gsub("%%", "%%25"))
end

local function HandleCopyLink(link, button, control, color, linkType, copyBufferIndex, messageIndex)
    if(linkType == COPY_LINK_TYPE) then
        copyBufferIndex = tonumber(copyBufferIndex)
        messageIndex = tonumber(messageIndex)
        local copyBuffer = copyBufferList[copyBufferIndex]
        assert(copyBuffer ~= nil, "copy buffer not found")

        local message = copyBuffer:Get(messageIndex)
        if button == MOUSE_BUTTON_LEFT then
            local shift = IsShiftKeyDown()
            message = HandleLeftClick(message, shift)
            if(shift) then
                RequestTranslate(message)
            else
                ShowClipBoardControl(message)
            end
        elseif button == MOUSE_BUTTON_RIGHT then
            HandleRightClick(control)
        end
        return true
    end
end

OnAddonLoaded(function()
    savedVars = ZO_SavedVars:NewAccountWide("Chat2Clipboard_SavedVariables", version, defaultVars)
    CircularBuffer = Chat2Clipboard.CircularBuffer

    CreateClipBoardControl()
    Chat2Clipboard.ShowClipBoard = ShowClipBoardControl

    local AddWindow_Orig = SharedChatContainer.AddWindow
    SharedChatContainer.AddWindow = function(...)
        local window = AddWindow_Orig(...)
        local buffer = window.buffer

        -- we cannot access the messages in the native chat buffer object, so we have to save them separately ourselves.
        local copyBufferIndex = CreateCopyBuffer(buffer)

        local AddMessage_Orig = buffer.AddMessage
        buffer.AddMessage = function(self, message, ...)
            if(message and #message > 0) then
                message = CreateCopyButton(copyBufferIndex, message) .. message
            end
            AddMessage_Orig(self, message, ...)
        end

        return window
    end

    LINK_HANDLER:RegisterCallback(LINK_HANDLER.LINK_CLICKED_EVENT, HandleCopyLink)
    LINK_HANDLER:RegisterCallback(LINK_HANDLER.LINK_MOUSE_UP_EVENT, HandleCopyLink)

    -- mouse to clipboard
    local LR = LORE_READER
    local MI = MAIL_INBOX
    local MILC = ZO_MailInboxListContents

    local function IsLoreReader(control)
        return control == LR.control
    end

    local function GetLoreReaderText()
        return string.format("%s\n\n%s", LR.titleText, LR.bodyText)
    end

    local function IsMail(control)
        return control:GetOwningWindow() == MI.control
    end

    local function GetMailText()
        local data = MI:GetMailData(MI.mailId)
        local name = data.senderDisplayName
        if(#data.senderCharacterName > 0) then name = string.format("%s (%s)", name, data.senderDisplayName) end
        local date = data:GetReceivedText()
        local body = MI.bodyLabel:GetText()
        return string.format("From: %s\nReceived: %s\nSubject: %s\n\n%s", name, date, data.subject, body)
    end

    local function IsTextControl(control)
        local type = control:GetType()
        return type == CT_EDITBOX or type == CT_LABEL
    end

    local function GetText(control)
        local text = control:GetText()
        if(text and text ~= "") then
            return text
        end
    end

    local function IsPointInsideControl(control, x, y)
        local left, top, right, bottom = control:GetScreenRect()
        return not (x < left or x > right or y < top or y > bottom)
    end

    local function GetMouseOverText(control)
        if(not control) then return end

        -- some special cases
        if(IsLoreReader(control)) then
            return GetLoreReaderText()
        elseif(IsMail(control)) then
            if(control:GetParent() == MILC) then
                return control.dataEntry.data.subject
            else
                return GetMailText()
            end
        elseif(IsTextControl(control)) then
            local text = GetText(control)
            if(text) then return text end
        end

        local x, y = GetUIMousePosition()
        for i=1, control:GetNumChildren() do
            local child = control:GetChild(i)
            if(child and IsPointInsideControl(child, x, y)) then
                local text = GetMouseOverText(child)
                if(text) then return text end
            end
        end
    end

    SLASH_COMMANDS["/m2c"] = function()
        local text = GetMouseOverText(WINDOW_MANAGER:GetMouseOverControl())
        if(text and text ~= "") then
            ShowClipBoardControl(text)
        end
    end
end)

Chat2Clipboard.copyBufferList = copyBufferList
