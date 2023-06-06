LibSlashCommander:AddFile("providers/AutoCompleteSlashCommandsProvider.lua", 3, function(lib)
    local AutoCompleteProvider = lib.AutoCompleteProvider

    if(not lib.AutoCompleteSlashCommandsProvider) then lib.AutoCompleteSlashCommandsProvider = AutoCompleteProvider:Subclass() end
    local AutoCompleteSlashCommandsProvider = lib.AutoCompleteSlashCommandsProvider

    function lib.IsAutoCompleteSlashCommandsProvider(provider)
        return lib.HasBaseClass(AutoCompleteSlashCommandsProvider, provider)
    end

    function AutoCompleteSlashCommandsProvider:New()
        local provider = AutoCompleteProvider.New(self)
        provider:SetPrefix("/")
        return provider
    end

    local function AddCommand(results, lookup, alias, description)
        local label = lib:GenerateLabel(alias, description)
        if(label ~= alias) then
            lookup[label] = alias
        end
        results[zo_strlower(alias)] = label
    end

    function AutoCompleteSlashCommandsProvider:GetResultList()
        local results = {}
        local lookup = {}
        for alias, command in pairs(SLASH_COMMANDS) do
            local description
            if(lib.IsCommand(command)) then
                description = command:GetDescription()
            end
            AddCommand(results, lookup, alias, description)
        end
        for alias in pairs(CHAT_SYSTEM.switchLookup) do
            if(type(alias) == "string") then
                AddCommand(results, lookup, alias)
            end
        end
        self.lookup = lookup
        return results
    end
end)
