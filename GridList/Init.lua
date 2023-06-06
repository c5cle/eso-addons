local ADDON_NAME = 'GridList'

_G[ADDON_NAME] = {
	-- [1] = {}, -- SV, SavedVars
	-- [2] = {}, -- FN, functions
	-- [3] = {}, -- G, globals constants
	-- [4] = {}, -- L, localization
	-- [5] = {}, -- P, Plugins
}

local GL = GridList

-- local SV, FN = unpack(_G[ADDON_NAME])

function GL.Dummy() end
local Dummy = GL.Dummy

function GL.PostHooksSetupCallback(list, mode, typeId, onCreateFn, onUpdateFn)
	local dataType = list.dataTypes[typeId]
	if not dataType then return end

	local pool				= dataType.pool
	local _hooks			= dataType.hooks
	local _customFactory	= pool.customFactoryBehavior
	local _setupCallback	= dataType.setupCallback

	if not _hooks then
		dataType.hooks = {}
		for m = 1, 3 do
			dataType.hooks[m] = {
				OnCreate	= Dummy,
				OnUpdate	= Dummy,
			}
		end

		local hooks = dataType.hooks

		if _customFactory then
			pool.customFactoryBehavior = function(...)
				_customFactory(...)
				hooks[list.mode].OnCreate(...)
			end
		else
			pool.customFactoryBehavior = function(...)
				hooks[list.mode].OnCreate(...)
			end
		end

		dataType.setupCallback = function(...)
			_setupCallback(...)
			hooks[list.mode].OnUpdate(...)
		end

		if onCreateFn then
			hooks[mode].OnCreate = onCreateFn
		end

		if onUpdateFn then
			hooks[mode].OnUpdate = onUpdateFn
		end
	elseif _hooks then
		local exOnCreate = _hooks[mode].OnCreate
		local exOnUpdate = _hooks[mode].OnUpdate

		if onCreateFn then
			if exOnCreate == Dummy then
				_hooks[mode].OnCreate = onCreateFn
			else
				_hooks[mode].OnCreate = function(...)
					exOnCreate(...)
					onCreateFn(...)
				end
			end
		end

		if onUpdateFn then
			if exOnUpdate == Dummy then
				_hooks[mode].OnUpdate = onUpdateFn
			else
				_hooks[mode].OnUpdate = function(...)
					exOnUpdate(...)
					onUpdateFn(...)
				end
			end
		end
	end
end