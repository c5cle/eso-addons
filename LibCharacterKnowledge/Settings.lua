local LCCC = LibCodesCommonCode
local Internal = LibCharacterKnowledgeInternal
local Public = LibCharacterKnowledge


--------------------------------------------------------------------------------
-- Settings Panel
--------------------------------------------------------------------------------

function Internal.RegisterSettingsPanel( )
	local LAM = LibAddonMenu2

	if (LAM) then
		local panelId = "LCKSettings"

		Internal.settingsPanel = LAM:RegisterAddonPanel(panelId, {
			type = "panel",
			name = GetString(SI_LCK_SETTINGS_TITLE),
			version = "1.4.7",
			author = "@code65536",
			slashCommand = "/lck",
			registerForRefresh = true,
		})

		local append = function( t1, t2 )
			for _, v in ipairs(t2) do
				table.insert(t1, v)
			end
		end

		Internal.shareText = ""

		local controls = {
			--------------------------------------------------------------------
			{
				type = "description",
				text = SI_LCK_SETTINGS_CHATCOMMAND,
			},
			--------------------
			unpack(Internal.SettingsBuildMainSection())
		}

		append(controls, {
			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_LCK_SETTINGS_SHARE_SECTION,
			},
			--------------------
			{
				type = "editbox",
				name = SI_LCK_SETTINGS_SHARE_CAPTION,
				getFunc = function() return Internal.shareText end,
				setFunc = function(text) Internal.shareText = text end,
				isMultiline = true,
				isExtraWide = true,
				maxChars = 0xFFFF,
				textType = TEXT_TYPE_ALL,
				reference = "LCK_ExportBox",
			},
			--------------------
			{
				type = "button",
				name = SI_LCK_SETTINGS_SHARE_EXPORTC,
				func = Internal.ExportCurrent,
				tooltip = SI_LCK_SETTINGS_SHARE_EXPORTCT,
				width = "half",
			},
			--------------------
			{
				type = "button",
				name = SI_LCK_SETTINGS_SHARE_IMPORT,
				func = Internal.Import,
				width = "half",
			},
			--------------------
			{
				type = "button",
				name = SI_LCK_SETTINGS_SHARE_EXPORTA,
				func = function() Internal.ExportMultiple(true) end,
				tooltip = SI_LCK_SETTINGS_SHARE_EXPORTAT,
				width = "half",
			},
			--------------------
			{
				type = "button",
				name = SI_LCK_SETTINGS_SHARE_CLEAR,
				func = function() Internal.shareText = "" end,
				width = "half",
			},
			--------------------
			{
				type = "button",
				name = Internal.GetExportSelectedText,
				func = function() Internal.ExportMultiple(false) end,
				tooltip = SI_LCK_SETTINGS_SHARE_EXPORTST,
				width = "half",
				disabled = function() return Internal.CountExportSelection() == 0 end,
				reference = "LCK_ExportSelected",
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_LCK_SETTINGS_RESET_SECTION,
			},
			--------------------
			{
				type = "custom",
				width = "half",
			},
			--------------------
			{
				type = "button",
				name = SI_OPTIONS_RESET,
				func = function( )
					LibCharacterKnowledgeData = { }
					ReloadUI()
				end,
				tooltip = SI_LCK_SETTINGS_RESET_WARNING,
				width = "half",
				isDangerous = true,
				warning = SI_LCK_SETTINGS_RESET_WARNING,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_LCK_SETTINGS_NOSAVE_SECTION,
			},
			--------------------
			{
				type = "editbox",
				name = SI_LCK_SETTINGS_NOSAVE_CAPTION,
				getFunc = function( )
					local accounts = { }
					if (Internal.vars.noSave) then
						for account in pairs(Internal.vars.noSave) do
							table.insert(accounts, account)
						end
						table.sort(accounts)
					end
					return table.concat(accounts, ", ")
				end,
				setFunc = function( text )
					local accounts = { zo_strsplit(", ", zo_strlower(text)) }
					if (#accounts > 0) then
						Internal.vars.noSave = { }
						for _, account in ipairs(accounts) do
							Internal.vars.noSave[DecorateDisplayName(account)] = true
						end
					else
						Internal.vars.noSave = nil
					end
				end,
				isMultiline = true,
				isExtraWide = true,
				maxChars = 0xFFF,
				textType = TEXT_TYPE_ALL,
			},
		})

		LAM:RegisterOptionControls(panelId, controls)

		do	-- Workaround for old versions of LAM: Set the character limit manually
			local SetLimit
			SetLimit = function( panel )
				if (panel == Internal.settingsPanel) then
					CALLBACK_MANAGER:UnregisterCallback("LAM-PanelOpened", SetLimit)
					if (LCK_ExportBox and LCK_ExportBox.editbox) then
						LCK_ExportBox.editbox:SetMaxInputChars(0xFFFF)
					end
				end
			end
			CALLBACK_MANAGER:RegisterCallback("LAM-PanelOpened", SetLimit)
		end
	end
end


--------------------------------------------------------------------------------
-- Options Tree
--------------------------------------------------------------------------------

function Internal.SettingsBuildOptionsList( min, max, labelFunc )
	local values = { 0 }
	local labels = { GetString(SI_LCK_SETTINGS_USE_DEFAULT) }
	local valuesND = { }
	local labelsND = { }

	for i = min, max do
		local label = labelFunc(i, min, max)
		table.insert(values, i)
		table.insert(labels, label)
		table.insert(valuesND, i)
		table.insert(labelsND, label)
	end

	return values, labels, valuesND, labelsND
end

function Internal.SettingsBuildControlCluster( options, server, account, charId )
	local canMinimize = true
	local showEnabled = 0
	local showExport = false
	local diabledFunc

	local base, key
	if (not server) then
		canMinimize = false
		base = Internal.vars
		key = "defaults"
	elseif (charId) then
		showEnabled = 2
		showExport = true
		base = Internal.characters[server][charId]
		key = "settings"
		diabledFunc = function( )
			return not Internal.IsCharacterEnabled(server, charId)
		end
	else
		base = Internal.accounts[server]
		if (account) then
			showEnabled = 1
			key = account
		else
			key = "defaults"
		end
	end

	local getFunc = function( setting, default )
		return function( )
			return (base[key] and base[key][setting]) or default
		end
	end

	local setFunc = function( setting, default, characterListChanged )
		return function( value )
			if (not base[key]) then
				base[key] = { }
			end
			base[key][setting] = (value ~= default or not canMinimize) and value or nil
			if (canMinimize and next(base[key]) == nil) then
				base[key] = nil
			end
			Internal.NotifyRefresh(characterListChanged)
		end
	end

	local controls = { }

	if (showEnabled > 0) then
		local choiceType, default
		if (showEnabled == 1) then
			choiceType = "enabledND"
			default = 1
		else
			choiceType = "enabled"
			default = 0
		end
		table.insert(controls, {
			type = "dropdown",
			name = SI_ADDON_MANAGER_ENABLED,
			choices = options[choiceType].labels,
			choicesValues = options[choiceType].values,
			getFunc = getFunc("enabled", default),
			setFunc = setFunc("enabled", default, true),
		})
	end

	for _, category in ipairs(Internal.Categories) do
		table.insert(controls, {
			type = "dropdown",
			name = Internal.CategoryLabels[category],
			choices = options.tracking.labels,
			choicesValues = options.tracking.values,
			getFunc = getFunc(category, 0),
			setFunc = setFunc(category, 0),
			disabled = diabledFunc,
		})
	end

	table.insert(controls, {
		type = "dropdown",
		name = SI_LCK_SETTINGS_PRIORITY,
		choices = options.priority.labels,
		choicesValues = options.priority.values,
		getFunc = getFunc("priority", 0),
		setFunc = setFunc("priority", 0, true),
		disabled = diabledFunc,
		tooltip = SI_LCK_SETTINGS_PRIORITY_HELP,
	})

	if (showExport) then
		table.insert(controls, {
			type = "checkbox",
			name = SI_LCK_SETTINGS_EXPORT,
			getFunc = function() return base.export == true end,
			setFunc = function( enabled )
				base.export = (enabled == true) or nil
				if (LCK_ExportSelected and LCK_ExportSelected.button) then
					LCK_ExportSelected.button:SetText(Internal.GetExportSelectedText())
				end
			end,
			disabled = diabledFunc,
		})
	end

	return controls
end

function Internal.SettingsRankingsGetList( server )
	local characters = Public.GetCharacterList(server)
	local result

	if (#characters == 0) then
		result = GetString(SI_ANTIQUITY_EMPTY_LIST)
	else
		local results = { }
		for _, character in ipairs(characters) do
			table.insert(results, character.name)
		end
		result = table.concat(results, ", ")
	end

	-- 0xC5C29E = INTERFACE_COLOR_TYPE_TEXT_COLORS:INTERFACE_TEXT_COLOR_NORMAL
	return string.format("|cC5C29E%s|r", result)
end

function Internal.SettingsBuildMainSection( )
	local options = { tracking = { }, priority = { }, enabled = { }, enabledND = { } }
	local optionsND = { tracking = { }, priority = { } }

	options.tracking.values, options.tracking.labels, optionsND.tracking.values, optionsND.tracking.labels = Internal.SettingsBuildOptionsList(1, 5, function( idx )
		return GetString("SI_LCK_SETTINGS_TRACKING", idx)
	end)

	options.priority.values, options.priority.labels, optionsND.priority.values, optionsND.priority.labels = Internal.SettingsBuildOptionsList(1, Internal.PRIORITY_CLASSES, function( idx, min, max )
		local base = string.byte("A") - 1
		local captions = {
			[min] = SI_SUBSAMPLINGMODE2, -- formerly SI_HIGH
			[max] = SI_SUBSAMPLINGMODE0, -- formerly SI_LOW
		}
		if (captions[idx]) then
			return string.format("%s (%s)", string.char(base + idx), GetString(captions[idx]))
		else
			return string.char(base + idx)
		end
	end)

	options.enabled.values, options.enabled.labels, options.enabledND.values, options.enabledND.labels = Internal.SettingsBuildOptionsList(1, 2, function( idx )
		return GetString((idx == 1) and SI_YES or SI_NO)
	end)

	local controls = {
		--------------------
		{
			type = "header",
			name = SI_LCK_SETTINGS_MAIN_SECTION,
		},
		--------------------
		{
			type = "submenu",
			name = SI_OPTIONS_DEFAULTS,
			controls = {
				--------------------
				{
					type = "description",
					text = SI_LCK_SETTINGS_SYSTEM_DEFAULTS,
				},
				--------------------
				unpack(Internal.SettingsBuildControlCluster(optionsND)),
			},
		},
	}

	for _, server in ipairs(Public.GetServerList()) do
		local users = { }
		local accounts = { }

		for id, data in pairs(Internal.characters[server]) do
			if (not users[data.account]) then
				users[data.account] = { }
			end
			table.insert(users[data.account], id)
		end

		for account in pairs(users) do
			table.insert(accounts, account)
		end
		table.sort(accounts)

		local controlsAccts = {
			--------------------
			{
				type = "description",
				text = function() return Internal.SettingsRankingsGetList(server) end,
				title = SI_LCK_SETTINGS_RANKING_PREVIEW,
			},
			--------------------
			{
				type = "submenu",
				name = SI_OPTIONS_DEFAULTS,
				controls = {
					--------------------
					{
						type = "description",
						text = SI_LCK_SETTINGS_SERVER_DEFAULTS,
					},
					--------------------
					unpack(Internal.SettingsBuildControlCluster(options, server)),
				},
			},
		}

		for _, account in ipairs(accounts) do
			local controlsChars = {
				--------------------
				{
					type = "submenu",
					name = SI_OPTIONS_DEFAULTS,
					controls = {
						--------------------
						{
							type = "description",
							text = SI_LCK_SETTINGS_ACCOUNT_DEFAULTS,
						},
						--------------------
						unpack(Internal.SettingsBuildControlCluster(options, server, account)),
					},
				},
			}

			Internal.Sort(server, users[account])
			for _, id in ipairs(users[account]) do
				table.insert(controlsChars, {
					type = "submenu",
					name = Internal.characters[server][id].name,
					controls = Internal.SettingsBuildControlCluster(options, server, nil, id),
				})
			end

			table.insert(controlsAccts, {
				type = "submenu",
				name = account,
				controls = controlsChars,
			})
		end

		table.insert(controls, {
			type = "submenu",
			name = server,
			controls = controlsAccts,
		})
	end

	return controls
end


--------------------------------------------------------------------------------
-- Public Access
--------------------------------------------------------------------------------

function Public.OpenSettingsPanel( )
	if (Internal.settingsPanel) then
		LibAddonMenu2:OpenToPanel(Internal.settingsPanel)
	end
end


--------------------------------------------------------------------------------
-- Export/Import
--------------------------------------------------------------------------------

local LDEI = LibDataExportImport
local SHARE_TAG = "K"
local SHARE_VERSION = 3 -- Version of the current export/import format
local SHARE_VERSION_COMPATIBILITY = {
	[SHARE_VERSION] = true,
}

function Internal.CountExportSelection( )
	local count = 0
	for _, server in ipairs(Public.GetServerList()) do
		for _, character in ipairs(Public.GetCharacterList(server)) do
			if (Internal.characters[server][character.id].export) then
				count = count + 1
			end
		end
	end
	return count
end

function Internal.GetExportSelectedText( )
	return string.format(GetString(SI_LCK_SETTINGS_SHARE_EXPORTS), Internal.CountExportSelection())
end

function Internal.ExportSelectText( )
	if (LCK_ExportBox and LCK_ExportBox.editbox) then
		zo_callLater(function( )
			LCK_ExportBox:UpdateValue()
			LCK_ExportBox.editbox:SelectAll()
			LCK_ExportBox.editbox:TakeFocus()
		end, 100)
	end
end

function Internal.CreateExportEntry( server, charId, ignoreExportFlag )
	local data = Internal.characters[server][charId]

	if (data and (ignoreExportFlag or data.export)) then
		local knowledge = { }
		for _, category in ipairs(Internal.Categories) do
			if (data[category]) then
				table.insert(knowledge, string.format("%s:%s", category, LCCC.Implode(LCCC.Unchunk(data[category]))))
			end
		end

		if (#knowledge > 0) then
			return LDEI.Wrap(SHARE_TAG, SHARE_VERSION, {
				server,
				UndecorateDisplayName(data.account),
				data.name,
				charId,
				LCCC.Encode(GetAPIVersion(), 1),
				LCCC.Encode(data.timestamp or 0, 1),
				table.concat(knowledge, ";"),
			})
		end
	end

	return ""
end

function Internal.ExportCurrent( )
	Internal.shareText = Internal.CreateExportEntry(Internal.server, Internal.charId, true) .. " "
	Internal.ExportSelectText()
end

function Internal.ExportMultiple( exportAll )
	local result = { }
	local remaining = LDEI.SHARE_LIMIT

	for _, server in ipairs(Public.GetServerList()) do
		for _, character in ipairs(Public.GetCharacterList(server)) do
			local entry = Internal.CreateExportEntry(server, character.id, exportAll)
			local length = zo_strlen(entry)

			if (length > 0) then
				if (length < remaining) then
					table.insert(result, entry)
					remaining = remaining - length
				else
					Internal.Msg(string.format(GetString(SI_LCK_SHARE_EXPORT_LIMIT), server, character.name))
				end
			end
		end
	end

	Internal.shareText = table.concat(result, "") .. " "
	Internal.ExportSelectText()
end

function Internal.Import( )
	if (not LDEI.Import(Internal.shareText, SHARE_TAG)) then
		Internal.Msg(GetString(SI_LCK_SHARE_IMPORT_INVALID))
	end
end

function Internal.ProcessImportData( dataset )
	local newCharacter = false
	local imported = 0

	for _, data in ipairs(dataset) do
		if (not SHARE_VERSION_COMPATIBILITY[data.version]) then
			return imported, SI_LCK_SHARE_IMPORT_BADVERSION, newCharacter
		else
			local server, account, charName, charId, apiVersion, timestamp, knowledge = zo_strsplit(",", data.payload)
			if (LCCC.Decode(apiVersion) == GetAPIVersion()) then
				timestamp = LCCC.Decode(timestamp)

				-- Prepare the destination data tables
				if (not Internal.accounts[server]) then Internal.accounts[server] = { } end
				if (not Internal.characters[server]) then Internal.characters[server] = { } end
				if (not Internal.characters[server][charId]) then
					Internal.characters[server][charId] = { }
					newCharacter = true
				end
				local char = Internal.characters[server][charId]

				if (char.timestamp and char.timestamp >= timestamp) then
					Internal.Msg(string.format(GetString(SI_LCK_SHARE_IMPORT_STALE), server, charName))
				else
					char.account = DecorateDisplayName(account)
					char.name = charName
					char.timestamp = timestamp

					for _, packed in ipairs({ zo_strsplit(";", knowledge) }) do
						local category, data = zo_strsplit(":", packed)
						char[category] = LCCC.Chunk(LCCC.Explode(data))
					end

					imported = imported + 1

					Internal.Msg(string.format(GetString(SI_LCK_SHARE_IMPORT_DONE), server, charName, os.date("%Y/%m/%d %H:%M", timestamp)))
				end
			else
				Internal.Msg(string.format(GetString(SI_LCK_SHARE_IMPORT_API), server, charName))
			end
		end
	end

	return imported, nil, newCharacter
end

LCCC.RunAfterInitialLoadscreen(function( )
	LDEI.RegisterProcessor(SHARE_TAG, function( ... )
		local importedCount, stringId, newCharacter = Internal.ProcessImportData(...)

		if (importedCount > 0) then
			Internal.caches = { }
			Internal.NotifyRefresh(newCharacter)
		end

		if (stringId) then
			Internal.Msg(GetString(stringId))
		end

		if (newCharacter) then
			Internal.Msg(GetString(SI_LCK_SHARE_IMPORT_NEWCHARACTER))
		end

		Internal.Msg(string.format(GetString(SI_LCK_SHARE_IMPORT_TALLY), importedCount))
		Internal.shareText = ""
	end)
end)
