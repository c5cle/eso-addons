local TryDetermineMissingItemID = function(savedVars)
	local serverRegion = TamrielTradeCentre.GetCurrentServerRegion()
	local data = nil

	if (serverRegion == "NA") then
		data = savedVars.NAData
	else
		data = savedVars.EUData
	end

	for guildName, savedVarGuildInfo in pairs(data.Guilds) do
		for index, listEntry in pairs(savedVarGuildInfo.Entries) do
			local itemLink = listEntry.ItemLink
			if (itemLink ~= nil and listEntry.ID == nil) then
				local _, specializedItemType = GetItemLinkItemType(itemLink)
				listEntry.ID = TamrielTradeCentre_ItemInfo:NameSpecializedItemTypeToItemID(listEntry.Name, specializedItemType)
			end
		end
	end
end

function TamrielTradeCentre:UpgradeSavedVar(savedVars)
	if (savedVars == nil) then
		self:DebugWriteLine("Saved var is nil. Bad sign")
		return
	end

	local actualVersion = savedVars.ActualVersion

	TryDetermineMissingItemID(savedVars)
end