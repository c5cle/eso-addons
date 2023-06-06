-- save list gear data 
local SLGD = ZO_CallbackObject:Subclass()
BTG.SLGD = SLGD

function SLGD:New(saveData)
    local slgd = ZO_CallbackObject.New(self)
    slgd.gearlist = saveData.gearlist or {}
    saveData.gearlist = slgd.gearlist
    return slgd
end

function SLGD:GetKeys()
    local keys = {}
    for key in pairs(self.gearlist) do
        keys[#keys + 1] = key
    end
    table.sort(keys)
    return keys
end

-- function SLGD:HasNotes()
--     return next(self.notes) ~= nil
-- end

-- function SLGD:GetNote(key)
--     return self.notes[key]
-- end

-- function SLGD:HasNote(key)
--     return self.notes[key] ~= nil
-- end

-- function SLGD:SetNote(key, note)
--     local keyExists = self:HasNote(key)
--     self.notes[key] = note
--     if(not keyExists) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end

-- function SLGD:DeleteNote(key)
--     local keyExists = self:HasNote(key)
--     self.notes[key] = nil
--     if(keyExists) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end

-- function SLGD:DeleteAllNotes()
--     local hadNotes = self:HasNotes()
--     ZO_ClearTable(self.notes)
--     if(hadNotes) then
--         self:FireCallbacks("OnKeysUpdated")
--     end
-- end