LibSlashCommander:AddFile("providers/AutoCompleteProvider.lua", 1, function(lib)
    if(not lib.AutoCompleteProvider) then lib.AutoCompleteProvider = ZO_Object:Subclass() end
    local AutoCompleteProvider = lib.AutoCompleteProvider

    function lib.IsAutoCompleteProvider(provider)
        return lib.HasBaseClass(AutoCompleteProvider, provider)
    end

    function AutoCompleteProvider:New(...)
        local obj = ZO_Object.New(self)
        obj:Initialize(...)
        return obj
    end

    function AutoCompleteProvider:Initialize(data)
        local results = {}
        if(type(data) == "table") then
            for i = 1, #data do
                results[zo_strlower(data[i])] = data[i]
            end
        end
        self.results = results
        self.lookup = {}
    end

    function AutoCompleteProvider:SetPrefix(prefix)
        if(not prefix) then
            self.prefix = nil
        else
            lib.AssertIsType(prefix, "string")
            self.prefix = prefix
        end
    end

    --- used to filter tokens before autocompletion starts
    --- e.g. return false when the passed token does not start with '/' to wait for actual slash commands
    function AutoCompleteProvider:CanComplete(token)
        return not self.prefix or (token:sub(1, #self.prefix) == self.prefix)
    end

    --- returns a table which gets passed to GetTopMatchesByLevenshteinSubStringScore
    --- The table requires string keys which are used for comparison and string values which are used as labels in the result box
    --- Due to the way ZOS implemented the autocompletion, the label is also used as result which shows up in the chat input field.
    --- when the label contains some extra info which should not show up when selected, this method needs to setup a lookup table which is then used by GetResultFromLabel.
    function AutoCompleteProvider:GetResultList()
        return self.results
    end

    --- returns the final string that shows up in the chat box. If no lookup table is available, it will just return the label
    --- the lookup table should be generated and set together with the return value for GetResultList to avoid mismatches.
    function AutoCompleteProvider:GetResultFromLabel(label)
        return self.lookup[label] or label
    end
end)
