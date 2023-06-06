local MAJOR, MINOR = "LibNotifications", 10
assert(not _G[MAJOR], MAJOR .. " is already loaded")

local libNotification
if(LibStub) then
    --Register LN with LibStub
    libNotification  = LibStub:NewLibrary(MAJOR, MINOR)
    if not libNotification then return end --the same or newer version of this lib is already loaded into memory
else
    libNotification = {}
end
_G[MAJOR] = libNotification
LibNotification = libNotification

local KEYBOARD_NOTIFICATION_ICONS = ZO_KEYBOARD_NOTIFICATION_ICONS
local GAMEPAD_NOTIFICATION_ICONS = ZO_GAMEPAD_NOTIFICATION_ICONS
local DATA_TYPE_TO_TEMPLATE = ZO_NOTIFICATION_TYPE_TO_GAMEPAD_TEMPLATE

--==========================================================================--
--=== OVERRIDES ===--
--==========================================================================--
-- Override so we can set our own texture & heading
function NOTIFICATIONS:SetupBaseRow(control, data)
    ZO_SortFilterList.SetupRow(self.sortFilterList, control, data)

    local notificationType = data.notificationType
    local texture          = data.texture or KEYBOARD_NOTIFICATION_ICONS[notificationType]
    local headingText      = data.heading or zo_strformat(SI_NOTIFICATIONS_TYPE_FORMATTER, GetString("SI_NOTIFICATIONTYPE", notificationType))

    control.notificationType = notificationType
    control.index            = data.index

    GetControl(control, "Icon"):SetTexture(texture)
    GetControl(control, "Type"):SetText(headingText)
end

-- Override so we can set our own texture & heading
function GAMEPAD_NOTIFICATIONS:AddDataEntry(dataType, data, isHeader)
    local texture     = data.texture or GAMEPAD_NOTIFICATION_ICONS[data.notificationType]
    local headingText = data.heading or zo_strformat(SI_NOTIFICATIONS_TYPE_FORMATTER, GetString("SI_NOTIFICATIONTYPE", data.notificationType))

    local entryData = ZO_GamepadEntryData:New(data.shortDisplayText, texture)
    entryData.data  = data
    entryData:SetIconTintOnSelection(true)
    entryData:SetIconDisabledTintOnSelection(true)

    if isHeader then
        entryData:SetHeader(headingText)
        self.list:AddEntryWithHeader(DATA_TYPE_TO_TEMPLATE[dataType], entryData)
    else
        self.list:AddEntry(DATA_TYPE_TO_TEMPLATE[dataType], entryData)
    end
end

--==========================================================================--
--=== Base Provider ===--
--==========================================================================--
local libNotificationProvider = ZO_NotificationProvider:Subclass()

function libNotificationProvider:New(notificationManager)
    local provider = ZO_NotificationProvider.New(self, notificationManager)
    table.insert(notificationManager.providers, provider)

    return provider
end

function libNotificationProvider:BuildNotificationList()
    ZO_ClearNumericallyIndexedTable(self.list)

    -- Use a copy so it wont delete/alter the addons original msg list/table.
    local notifications = self.providerLinkTable.notifications
    self.list = ZO_DeepTableCopy(notifications)
end

--==========================================================================--
--=== Keyboard Provider ===--
--==========================================================================--
local libNotificationKeyboardProvider = libNotificationProvider:Subclass()

function libNotificationKeyboardProvider:New(notificationManager)
    local keyboardProvider = libNotificationProvider.New(self, notificationManager)

    return keyboardProvider
end

function libNotificationKeyboardProvider:Accept(data)
    if data.keyboardAcceptCallback then
        data.keyboardAcceptCallback(data)
    end
end

function libNotificationKeyboardProvider:Decline(data, button, openedFromKeybind)
    -- there was a typo in the field name. for backwards compatibility we have to keep both
    local callback = data.keyboardDeclineCallback or data.keybaordDeclineCallback
    if callback then
        callback(data)
    end
end


--==========================================================================--
--=== Gamepad Provider ===--
--==========================================================================--
local libNotificationGamepadProvider = libNotificationProvider:Subclass()

function libNotificationGamepadProvider:New(notificationManager)
    local gamepadProvider = libNotificationProvider.New(self, notificationManager)

    return gamepadProvider
end

function libNotificationGamepadProvider:Accept(data)
    if data.gamepadAcceptCallback then
        data.gamepadAcceptCallback(data)
    end
end

function libNotificationGamepadProvider:Decline(data, button, openedFromKeybind)
    if data.gamepadDeclineCallback then
        data.gamepadDeclineCallback(data)
    end
end

--=============================================================--
--=== LIBRARY FUNCTIONS ===--
--=============================================================--
function libNotification:CreateProvider()
    local keyboardProvider = libNotificationKeyboardProvider:New(NOTIFICATIONS)
    local gamepadProvider  = libNotificationGamepadProvider:New(GAMEPAD_NOTIFICATIONS)

    local provider = {
        notifications       = {},
        keyboardProvider    = keyboardProvider,
        gamepadProvider     = gamepadProvider,
        UpdateNotifications = function()
            keyboardProvider:pushUpdateCallback()
            gamepadProvider:pushUpdateCallback()
        end,
    }
    keyboardProvider.providerLinkTable = provider
    gamepadProvider.providerLinkTable  = provider

    return provider
end
