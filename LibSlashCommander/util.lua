LibSlashCommander:AddFile("util.lua", 1, function(lib)
    lib.ERROR_INVALID_TYPE = "Invalid argument type"
    lib.ERROR_HAS_NO_PARENT = "Command does not have a parent"
    lib.ERROR_ALREADY_HAS_PARENT = "Command already has a parent"
    lib.ERROR_CIRCULAR_HIERARCHY = "Circular hierarchy detected"
    lib.ERROR_AUTOCOMPLETE_NOT_ACTIVE = "Tried to get autocomplete results while it's disabled"
    lib.ERROR_AUTOCOMPLETE_RESULT_NOT_VALID = "Autocomplete provider returned invalid result type"
    lib.ERROR_CALLED_WITHOUT_CALLBACK = "Tried to call command while no callback is set"
    lib.WARNING_ALREADY_HAS_ALIAS = "Warning: Overwriting existing command alias '%s'"

    function lib.Log(message, ...)
        df("[LibSlashCommander] %s", message:format(...))
    end

    function lib.IsCallable(func)
        return type(func) == "function" or type((getmetatable(func) or {}).__call) == "function"
    end

    function lib.HasBaseClass(baseClass, object)
        object = getmetatable(object)
        while object ~= nil do
            if(object.__index == baseClass) then return true end
            object = getmetatable(object)
        end
        return false
    end

    function lib.AssertIsType(value, typeNameClassOrValidator, errorMessage)
        local check = type(typeNameClassOrValidator)
        local valid = false
        if(check == "string") then
            valid = (type(value) == typeNameClassOrValidator)
        elseif(check == "function") then
            valid = typeNameClassOrValidator(value)
        else
            valid = lib.HasBaseClass(typeNameClassOrValidator, value)
        end
        assert(valid, errorMessage or lib.ERROR_INVALID_TYPE)
    end

    function lib.WrapFunction(object, functionName, wrapper)
        if(type(object) == "string") then
            wrapper = functionName
            functionName = object
            object = _G
        end
        local originalFunction = object[functionName]
        object[functionName] = function(...) return wrapper(originalFunction, ...) end
    end
end)
