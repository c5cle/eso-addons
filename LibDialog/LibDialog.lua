--[========================================================================[
    This is free and unencumbered software released into the public domain.

    Anyone is free to copy, modify, publish, use, compile, sell, or
    distribute this software, either in source code form or as a compiled
    binary, for any purpose, commercial or non-commercial, and by any
    means.

    In jurisdictions that recognize copyright laws, the author or authors
    of this software dedicate any and all copyright interest in the
    software to the public domain. We make this dedication for the benefit
    of the public at large and to the detriment of our heirs and
    successors. We intend this dedication to be an overt act of
    relinquishment in perpetuity of all present and future rights to this
    software under copyright law.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
    OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
    OTHER DEALINGS IN THE SOFTWARE.

    For more information, please refer to <http://unlicense.org/>
--]========================================================================]

local MAJOR, MINOR = "LibDialog", 1.26
if _G[MAJOR] ~= nil and (_G[MAJOR].version and _G[MAJOR].version >= MINOR) then return end


local lib = {}
lib.name    = MAJOR
lib.version = MINOR

--Add global variable "LibDialog"
_G[MAJOR] = lib

------------------------------------------------------------------------
-- 	Local variables, global for the library
------------------------------------------------------------------------
local existingDialogs = {}


------------------------------------------------------------------------
-- 	Helper functions
------------------------------------------------------------------------
local function StringOrFunctionOrGetString(stringVar)
    if type(stringVar) == "function" then
        return stringVar()
    elseif type(stringVar) == "number" then
        return GetString(stringVar)
    end
    return stringVar
end

------------------------------------------------------------------------
-- 	Dialog creation functions
------------------------------------------------------------------------
--register the unique dialog name at the global ESO_Dialogs namespace
local function RegisterCustomDialogAtZOsDialogs(dialogName)
    ESO_Dialogs[dialogName] = {
        canQueue = true,
        uniqueIdentifier = "",
        title = {
            text = "",
        },
        mainText = {
            text = "",
        },
        buttons = {
            [1] = {
                text = SI_DIALOG_CONFIRM,
                callback = function(dialog) end,
            },
            [2] = {
                text = SI_DIALOG_CANCEL,
                callback = function(dialog) end,
            }
        },
        setup = function(dialog, data) end,
    }
    return ESO_Dialogs[dialogName]
end

--Create the new dialog now
local function createCustomDialog(uniqueAddonName, uniqueDialogName, title, body, callbackYes, callbackNo, callbackSetup)
    local dialogName = uniqueAddonName .. "_" .. uniqueDialogName
    --Register the unique dialog name at the global ESO_Dialogs namespace now, and add 2 buttons (confirm, reject)
    local dialog = RegisterCustomDialogAtZOsDialogs(dialogName)
    dialog.title.text = title
    dialog.mainText.text = body
    dialog.buttons[1].callback = callbackYes
    dialog.buttons[2].callback = callbackNo
    dialog.setup = callbackSetup
    dialog.uniqueIdentifier = dialogName
    return dialog
end

--Show the dialog now
local function showDialogNow(uniqueDialogName, data)
    --Show the dialog now, and provide it the data
    ZO_Dialogs_ShowDialog(uniqueDialogName, data)
end


------------------------------------------------------------------------
-- 	Library functions
------------------------------------------------------------------------
function lib:RegisterDialog(uniqueAddonName, uniqueDialogName, title, body, callbackYes, callbackNo, callbackSetup, forceUpdate)
    --Is any of the needed variables not given?
    local titleStr = StringOrFunctionOrGetString(title)
    local bodyStr = StringOrFunctionOrGetString(body)
    assert (titleStr ~= nil, string.format("[" .. MAJOR .. "]Error: Missing title for dialog with the unique identifier \'%s\', addon \'%s\'!", tostring(uniqueDialogName), tostring(uniqueAddonName)))
    assert (bodyStr ~= nil, string.format("[" .. MAJOR .. "]Error: Missing body text for dialog with the unique identifier \'%s\', addon \'%s\'!", tostring(uniqueDialogName), tostring(uniqueAddonName)))
    forceUpdate = forceUpdate or false
    if callbackYes == nil then
        callbackYes = function() end
    end
    if callbackNo == nil then
        callbackNo = function() end
    end
    if callbackSetup == nil then
        callbackSetup = function(dialog, data) end
    end
    --Is there already a dialog for this addon and does the uniqueDialogName already exist?
    if existingDialogs[uniqueAddonName] == nil then
        existingDialogs[uniqueAddonName] = {}
    end
    local dialogs = existingDialogs[uniqueAddonName]
    if not forceUpdate then
        assert(dialogs[uniqueDialogName] == nil, string.format("[" .. MAJOR .. "]Error: Dialog with the unique identifier \'%s\' is already registered for the addon \'%s\'!", tostring(uniqueDialogName), tostring(uniqueAddonName)))
    end
    --Create the table for the dialog in the addon
    dialogs[uniqueDialogName] = {}
    local dialog = dialogs[uniqueDialogName]
    --Create the dialog now
    dialog.dialog = createCustomDialog(uniqueAddonName, uniqueDialogName, titleStr, bodyStr, callbackYes, callbackNo, callbackSetup)
    --return the new created dialog now
    return dialog.dialog
end

--Show a registered dialog now
function lib:ShowDialog(uniqueAddonName, uniqueDialogName, data)
    --Show the dialog now
    local dialogName = uniqueAddonName .. "_" .. uniqueDialogName
    assert(ESO_Dialogs[dialogName] ~= nil, string.format("[" .. MAJOR .. "]Error: Dialog with the unique identifier \'%s\' does not exist in ESO_Dialogs, addon \'%s\'!", tostring(uniqueDialogName), tostring(uniqueAddonName)))
    --Is there already a dialog for this addon and does the uniqueDialogName already exist?
    local dialogs = existingDialogs[uniqueAddonName]
    assert(dialogs ~= nil and dialogs[uniqueDialogName] ~= nil, string.format("[" .. MAJOR .. "]Error: Dialog with the unique identifier \'%s\' does not exist for the addon \'%s\'!", tostring(uniqueDialogName), tostring(uniqueAddonName)))
    --Show the dialog now
    showDialogNow(dialogName, data)
    return true
end

--Addon loaded function
local function OnLibraryLoaded(event, name)
    --Only load lib if ingame
    if name:find("^ZO_") then return end
    EVENT_MANAGER:UnregisterForEvent(MAJOR, EVENT_ADD_ON_LOADED)
    --Provide the library the "list of registered dialogs"
    lib.dialogs = existingDialogs
end

--Load the addon now
EVENT_MANAGER:UnregisterForEvent(MAJOR, EVENT_ADD_ON_LOADED)
EVENT_MANAGER:RegisterForEvent(MAJOR, EVENT_ADD_ON_LOADED, OnLibraryLoaded)
