LibSlashCommander:AddFile("descriptions/types.lua", 1, function(lib)
    lib.COMMAND_TYPE_BUILT_IN = 1
    lib.COMMAND_TYPE_CHAT_SWITCH = 2
    lib.COMMAND_TYPE_EMOTE = 3
    lib.COMMAND_TYPE_ADDON = 4

    lib.typeColor = {
        [lib.COMMAND_TYPE_BUILT_IN] = "|c87C180",
        [lib.COMMAND_TYPE_CHAT_SWITCH] = "|cD8D891",
        [lib.COMMAND_TYPE_EMOTE] = "|c88A1CC",
        [lib.COMMAND_TYPE_ADDON] = "|cEC9746",
    }

    lib.types = {}

    for slashName in pairs(lib.descriptions) do
        lib.types[slashName] = lib.COMMAND_TYPE_BUILT_IN
    end

    for i = 1, GetNumEmotes() do
        local slashName, _, _, displayName = GetEmoteInfo(i)
        lib.types[slashName] = lib.COMMAND_TYPE_EMOTE
        lib.descriptions[slashName] = displayName
    end

    for slashName, data in pairs(CHAT_SYSTEM.switchLookup) do
        if(type(slashName) == "string") then
            lib.types[slashName] = lib.COMMAND_TYPE_CHAT_SWITCH
            if(data.dynamicName) then
                lib.descriptions[slashName] = function()
                    return GetDynamicChatChannelName(data.id)
                end
            else
                lib.descriptions[slashName] = data.name
            end
        end
    end
end)
