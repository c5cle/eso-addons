LibSlashCommander:AddFile("Command.lua", 1, function(lib)
    if(not lib.Command) then lib.Command = ZO_Object:Subclass() end
    local Command = lib.Command
    local AutoCompleteProvider = lib.AutoCompleteProvider
    local AutoCompleteSubCommandsProvider = lib.AutoCompleteSubCommandsProvider
    local AssertIsType = lib.AssertIsType

    function lib.IsCommand(command)
        return lib.HasBaseClass(Command, command)
    end

    function Command:New(...)
        local obj = ZO_Object.New(self)
        obj:Initialize(...)
        return obj
    end

    function Command:Initialize()
        self.callback = nil

        -- make the table callable
        local meta = getmetatable(self)
        meta.__call = function(self, input)
            if(type(input) == "string" and next(self.subCommandAliases)) then
                local alias, newInput = input:match("(.-)%s+(.-)$")
                if(not alias) then alias = input end
                local subCommand = self.subCommandAliases[alias]
                if(subCommand) then
                    subCommand(newInput)
                    return
                end
            end
            if(self.callback) then
                self.callback(input)
            else
                error(lib.ERROR_CALLED_WITHOUT_CALLBACK)
            end
        end

        self.aliases = {}
        self.subCommands = {}
        self.subCommandAliases = {}
        self.autocomplete = nil
    end

    function Command:SetDescription(description)
        if(description) then
            AssertIsType(description, "string")
        end
        self.description = description
    end

    function Command:GetDescription(alias)
        return self.description
    end

    function Command:SetCallback(callback)
        if(callback ~= nil) then
            AssertIsType(callback, lib.IsCallable)
        end
        self.callback = callback
    end

    function Command:GetCallback(callback)
        return self.callback
    end

    function Command:AddAlias(alias)
        AssertIsType(alias, "string")
        self.aliases[alias] = self
        if(self.parent ~= nil) then
            self.parent:RegisterSubCommandAlias(alias, self)
        end
    end

    function Command:HasAlias(alias)
        if(self.aliases[alias]) then
            return true
        end
        return false
    end

    function Command:RemoveAlias(alias)
        self.aliases[alias] = nil
        if(self.parent ~= nil) then
            self.parent:UnregisterSubCommandAlias(alias)
        end
    end

    function Command:HasAncestor(parent)
        while parent ~= nil do
            if(parent == self) then return true end
            parent = parent.parent
        end
        return false
    end

    function Command:SetParentCommand(command)
        if(command == nil) then
            assert(self.parent, lib.ERROR_HAS_NO_PARENT)
            for alias in pairs(self.aliases) do
                self.parent:UnregisterSubCommandAlias(alias)
            end
            self.parent = nil
        else
            assert(not self.parent, lib.ERROR_ALREADY_HAS_PARENT)
            AssertIsType(command, Command)
            assert(not self:HasAncestor(command), lib.ERROR_CIRCULAR_HIERARCHY)
            self.parent = command
            for alias in pairs(self.aliases) do
                self.parent:RegisterSubCommandAlias(alias, self)
            end
        end
    end

    function Command:RegisterSubCommand(command)
        if(command == nil) then
            command = Command:New()
        end
        AssertIsType(command, Command)
        command:SetParentCommand(self)
        self.subCommands[command] = command
        if(not self.autocomplete) then
            self:SetAutoComplete(true)
        end
        return command
    end

    function Command:HasSubCommand(command)
        if(self.subCommands[command]) then
            return true
        end
        return false
    end

    function Command:UnregisterSubCommand(command)
        command:SetParentCommand(nil)
        self.subCommands[command] = nil
        if(lib.IsAutoCompleteSubCommandsProvider(self.autocomplete) and not next(self.subCommands)) then
            self:SetAutoComplete(false)
        end
    end

    function Command:RegisterSubCommandAlias(alias, command)
        AssertIsType(alias, "string")
        AssertIsType(command, Command)
        if(self.subCommandAliases[alias]) then
            lib.Log(lib.WARNING_ALREADY_HAS_ALIAS, alias)
        end
        self.subCommandAliases[alias] = command
    end

    function Command:HasSubCommandAlias(alias)
        if(self.subCommandAliases[alias]) then
            return true
        end
        return false
    end

    function Command:GetSubCommandByAlias(alias)
        return self.subCommandAliases[alias]
    end

    function Command:UnregisterSubCommandAlias(alias)
        self.subCommandAliases[alias] = nil
    end

    function Command:SetAutoComplete(provider)
        if(provider == nil or provider == false) then
            self.autocomplete = nil
        elseif(provider == true) then
            self.autocomplete = AutoCompleteSubCommandsProvider:New(self)
        elseif(lib.IsAutoCompleteProvider(provider)) then
            self.autocomplete = provider
        elseif(type(provider) == "table") then
            self.autocomplete = AutoCompleteProvider:New(provider)
        else
            error(lib.ERROR_INVALID_TYPE)
        end
        return self.autocomplete
    end

    function Command:ShouldAutoComplete(token)
        if(self.autocomplete and self.autocomplete:CanComplete(token)) then
            return true
        end
        return false
    end

    function Command:GetAutoCompleteResults()
        assert(self.autocomplete ~= nil, lib.ERROR_AUTOCOMPLETE_NOT_ACTIVE)
        local results = self.autocomplete:GetResultList()
        AssertIsType(results, "table", lib.ERROR_AUTOCOMPLETE_RESULT_NOT_VALID)
        return results
    end

    function Command:GetAutoCompleteResultFromDisplayText(label)
        assert(self.autocomplete ~= nil, lib.ERROR_AUTOCOMPLETE_NOT_ACTIVE)
        AssertIsType(label, "string")
        local result = self.autocomplete:GetResultFromLabel(label)
        AssertIsType(result, "string", lib.ERROR_AUTOCOMPLETE_RESULT_NOT_VALID)
        return result
    end
end)
