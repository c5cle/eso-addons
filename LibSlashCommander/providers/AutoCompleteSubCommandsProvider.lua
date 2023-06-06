LibSlashCommander:AddFile("providers/AutoCompleteSubCommandsProvider.lua", 1, function(lib)
    local AutoCompleteProvider = lib.AutoCompleteProvider

    if(not lib.AutoCompleteSubCommandsProvider) then lib.AutoCompleteSubCommandsProvider = AutoCompleteProvider:Subclass() end
    local AutoCompleteSubCommandsProvider = lib.AutoCompleteSubCommandsProvider

    function lib.IsAutoCompleteSubCommandsProvider(provider)
        return lib.HasBaseClass(AutoCompleteSubCommandsProvider, provider)
    end

    function AutoCompleteSubCommandsProvider:New(command)
        lib.AssertIsType(command, lib.IsCommand)
        local provider = AutoCompleteProvider.New(self)
        provider.command = command
        return provider
    end

    function AutoCompleteSubCommandsProvider:FormatLabel(alias, description)
        if(description) then
            return string.format("%s|caaaaaa - %s", alias, description)
        end
        return alias
    end

    function AutoCompleteSubCommandsProvider:GetResultList()
        local results = {}
        local lookup = {}
        for alias, subCommand in pairs(self.command.subCommandAliases) do
            local label = self:FormatLabel(alias, subCommand:GetDescription(alias))
            if(label ~= alias) then
                lookup[label] = alias
            end
            results[zo_strlower(alias)] = label
        end
        self.lookup = lookup
        return results
    end
end)
