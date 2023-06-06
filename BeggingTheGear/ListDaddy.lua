-- save list daddy data 
local SLDD = ZO_CallbackObject:Subclass()
BTG.SLDD = SLDD

function SLDD:New(saveData)
    local sldd = ZO_CallbackObject.New(self)
    sldd.daddylist = saveData.daddylist or {}
    saveData.daddylist = sldd.daddylist
    return sldd
end

function SLDD:GetKeys()
    local keys = {}
    for key in pairs(self.daddylist) do
        keys[#keys + 1] = key
    end
    table.sort(keys)
    return keys
end

-- function SLDD:HasNotes()
--     return next(self.notes) ~= nil
-- end

-- function SLDD:GetNote(key)
--     return self.notes[key]
-- end

-- function SLDD:HasNote(key)
--     return self.notes[key] ~= nil
-- end

-- function SLDD:SetNote(key, note)
--     local keyExists = self:HasNote(key)
--     self.notes[key] = note
--     if(not keyExists) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end

-- function SLDD:DeleteNote(key)
--     local keyExists = self:HasNote(key)
--     self.notes[key] = nil
--     if(keyExists) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end

-- function SLDD:DeleteAllNotes()
--     local hadNotes = self:HasNotes()
--     ZO_ClearTable(self.notes)
--     if(hadNotes) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end
