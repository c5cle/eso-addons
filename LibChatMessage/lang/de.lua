local strings = {
    ["LIB_CHATMESSAGE_UNKNOWN_DESCRIPTION"] = 'Der Chat-Link "<<1>>" wird zurzeit nicht unterstützt.'
}
for id, text in pairs(strings) do
    SafeAddString(_G[id], text)
end
