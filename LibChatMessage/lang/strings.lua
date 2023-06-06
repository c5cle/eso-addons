local strings = {
    ["LIB_CHATMESSAGE_UNKNOWN_DESCRIPTION"] = 'The chat link "<<1>>" is currently not supported.'
}
for id, text in pairs(strings) do
    ZO_CreateStringId(id, text)
end
