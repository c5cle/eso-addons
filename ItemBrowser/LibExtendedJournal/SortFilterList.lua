local Internal = LibExtendedJournalInternal
local Public = LibExtendedJournal


--------------------------------------------------------------------------------
-- ExtendedJournalSortFilterList
--------------------------------------------------------------------------------

ExtendedJournalSortFilterList = ZO_SortFilterList:Subclass()
local ExtendedJournalSortFilterList = ExtendedJournalSortFilterList

function ExtendedJournalSortFilterList:New( control, contextMenuItems )
	local list = ZO_SortFilterList.New(self, control)
	list.frame = control
	list.contextMenuItems = contextMenuItems
	list:Setup()
	return list
end

function ExtendedJournalSortFilterList:SortScrollList( )
	if (self.currentSortKey ~= nil and self.currentSortOrder ~= nil) then
		table.sort(ZO_ScrollList_GetDataList(self.list), self.sortFunction)
	end
	self:RefreshVisible()
end

function ExtendedJournalSortFilterList:Row_OnMouseUp( control, button, upInside )
	local data = ZO_ScrollList_GetData(control)
	local menuItems = self.contextMenuItems
	if (menuItems and #menuItems >= 1 and upInside) then
		if (button == MOUSE_BUTTON_INDEX_LEFT) then
			-- LMB: Invoke the first context menu item
			local _, action = menuItems[1](data)
			if (type(action) == "function") then action() end
		elseif (button == MOUSE_BUTTON_INDEX_RIGHT) then
			-- RMB: Open the context menu
			ClearMenu()
			for _, func in ipairs(menuItems) do
				local label, action = func(data)
				if (label and type(action) == "function") then
					AddMenuItem(Internal.GetString(label), action)
				end
			end
			self:ShowMenu(control)
		end
	end
end

function ExtendedJournalSortFilterList:InitializeSearch( typeId )
	local search = ZO_StringSearch:New()

	search:AddProcessor(typeId, function( stringSearch, data, searchTerm, ... )
		local invert = false

		-- Invert the results if the "-" modifier prefix is specified
		if (zo_strlen(searchTerm) > 1 and searchTerm:sub(1, 1) == "-") then
			searchTerm = searchTerm:sub(2)
			invert = true
		end

		local result = self:ProcessItemEntry(stringSearch, data, searchTerm, ...)
		if (invert) then result = not result end
		return result
	end)

	return search
end

do
	local function AddEntry( control, label, id, data, callback )
		local entry = ZO_ComboBox:CreateItemEntry(label, callback)
		entry.id = id
		entry.data = data
		control:AddItem(entry, ZO_COMBOBOX_SUPRESS_UPDATE)
	end

	function ExtendedJournalSortFilterList:InitializeComboBox( control, items, initialIndex, allowInitialCallback, callback )
		control:SetSortsItems(false)
		control:ClearItems()

		if (not callback) then
			-- Default callback
			callback = function() self:RefreshFilters() end
		end

		if (items.list) then
			-- Premade list
			for i, item in ipairs(items.list) do
				local label = (items.key) and item[items.key] or item
				local data = (items.dataKey) and item[items.dataKey]
				AddEntry(control, label, i, data, callback)
			end
		elseif (items.prefix and items.max) then
			-- String ID list
			for i = 1, items.max do
				AddEntry(control, GetString(items.prefix, i), i, nil, callback)
			end
		end

		Public.SelectComboBoxItemByIndex(control, initialIndex, not allowInitialCallback)
	end
end
