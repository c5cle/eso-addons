PlayerRoleIndicator = PlayerRoleIndicator or {}
local LAM2 = LibAddonMenu2
local noteVisable = false

function PlayerRoleIndicator.createSubmenu(role, roleSV, roleDefault)
	local submenu = {
		[1] = {
			type = "checkbox",
			name = string.format("%s 上方显示图标", role),
			getFunc = function() return roleSV.show end,
			setFunc = function(newValue) 
				roleSV.show = newValue
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			default = roleDefault.show,
		},
		[2] = {
			type = "checkbox",
			name = string.format("活着的 %s 上方显示图标", role),
			getFunc = function() return roleSV.showOnAlive end,
			setFunc = function(newValue) 
				roleSV.showOnAlive = newValue
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not roleSV.show end,
			default = roleDefault.showOnAlive,
		},
		[3] = {
			type = "colorpicker",
			name = string.format("活着的 %s 图标颜色", role),
			getFunc = function() return roleSV.colourAlive.r, roleSV.colourAlive.g, roleSV.colourAlive.b, roleSV.colourAlive.a end,
			setFunc = function(r,g,b,a) 
				roleSV.colourAlive.r = r
				roleSV.colourAlive.g = g
				roleSV.colourAlive.b = b
				roleSV.colourAlive.a = a
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not (roleSV.show and roleSV.showOnAlive) end,
			default = {r = roleDefault.colourAlive.r, g = roleDefault.colourAlive.g, b = roleDefault.colourAlive.b, a = roleDefault.colourAlive.a},
		},
		[4] = {
			type = "colorpicker",
			name = string.format("死亡的 %s 图标颜色", role),
			getFunc = function() return roleSV.colourDead.r, roleSV.colourDead.g, roleSV.colourDead.b, roleSV.colourDead.a end,
			setFunc = function(r,g,b,a) 
				roleSV.colourDead.r = r
				roleSV.colourDead.g = g
				roleSV.colourDead.b = b
				roleSV.colourDead.a = a
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not roleSV.show end,
			default = {r = roleDefault.colourDead.r, g = roleDefault.colourDead.g, b = roleDefault.colourDead.b, a = roleDefault.colourDead.a},
		},
		[5] = {
			type = "iconpicker",
			name = string.format("%s 使用的图标", role),
			choices = {
				"/esoui/art/tutorial/gamepad/gp_lfg_tank.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_healer.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_dps.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_ava.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_normaldungeon.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_trial.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_veteranldungeon.dds",
				"/esoui/art/tutorial/gamepad/gp_lfg_world.dds",
				"/esoui/art/tutorial/gamepad/gp_crowns.dds",
				"/esoui/art/tutorial/gamepad/gp_bonusicon_emperor.dds",
				"/esoui/art/compass/groupleader.dds",
				"/esoui/art/compass/groupmember.dds",
			},
			maxColumns = 3,
			visibleRows = 4,
			iconSize = 32,
			getFunc = function() return roleSV.texturePath end,
			setFunc = function(newValue)
				roleSV.texturePath = newValue
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not roleSV.show end,
			default = roleDefault.texturePath,
		},
	}
	return submenu
end

function PlayerRoleIndicator.createCustomRoles()
	local submenu = {
				[1] = {
					type = "checkbox",
					name = "使用自定义角色",
					getFunc = function() return PlayerRoleIndicator.savedVariables.useCustom end,
					setFunc = function(newValue) PlayerRoleIndicator.savedVariables.useCustom = newValue end,
					default = PlayerRoleIndicator.default.useCustom,
				},
				[2] = {
					type = "slider",
					name = "自定义角色数",
					getFunc = function() return PlayerRoleIndicator.savedVariables.customNum end,
					setFunc = function(newValue)
						if newValue > PlayerRoleIndicator.savedVariables.customNum then
							for i = (PlayerRoleIndicator.savedVariables.customNum + 1), newValue, 1 do
								PlayerRoleIndicator.savedVariables.customRole[i] = PlayerRoleIndicator.default.customDefault
							end
						elseif newValue < PlayerRoleIndicator.savedVariables.customNum then
							for i = PlayerRoleIndicator.savedVariables.customNum, (newValue + 1), -1 do
								table.remove(PlayerRoleIndicator.savedVariables.customRole, i)
							end
						end
						PlayerRoleIndicator.savedVariables.customNum = newValue
						end,
					min = 0,
					max = 10,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useCustom end,
					requiresReload = true,
					default = PlayerRoleIndicator.default.customNum,
				},
			}
	local controlBuffer = {}
	for _,value in ipairs(PlayerRoleIndicator.savedVariables.customRole) do
		local control = PlayerRoleIndicator.createSubmenu(value.name, value, PlayerRoleIndicator.default.customDefault)
		
		local nameCEditBox = {
			type = "editbox",
			name = "自定义角色名称",
			getFunc = function() return value.name end,
			setFunc = function(newValue) value.name = newValue end,
			isMultiline = false,
			requiresReload = true,
			default = PlayerRoleIndicator.default.customDefault.name,
		}
		table.insert(control, 1, nameCEditBox)
		
		local resetButton = {
			type = "button",
			name = "清除玩家",
			func = function() value.players = {} end,
			tooltip = "将从此角色移除所有玩家。",
		}
		table.insert(control, resetButton)
		
		controlBuffer = {
			type = "submenu",
			name = value.name,
			icon = value.texturePath,
			controls = control,
			disabled = function() return not PlayerRoleIndicator.savedVariables.useCustom end,
		}
		table.insert(submenu, controlBuffer)
	end
	return submenu
end

function PlayerRoleIndicator.CreateSettingsWindow()
	local panelData = {
	type = "panel",
	name = "Player role indicator",
	displayName = "玩家角色标志",
	author = "|c18fff9Parietic|r",
	version = PlayerRoleIndicator.version,
	website = "https://www.esoui.com/downloads/info2703-PlayerRoleIndicator.html",
	feedback = "https://www.esoui.com/downloads/info2703-PlayerRoleIndicator.html#comments",
	slashCommand = "/pri",
	registerForRefresh = true,
	registerForDefaults = true,
	}
	local cntrlOptionsPanel = LAM2:RegisterAddonPanel("Player_role_indicator", panelData)
	
	local optionsData = {
		[1] = {
			type = "slider",
			name = "图标大小",
			getFunc = function() return PlayerRoleIndicator.savedVariables.iconSize end,
			setFunc = function(newValue)
				PlayerRoleIndicator.savedVariables.iconSize = newValue 
				PlayerRoleIndicator.UpdateRoleSwitch()
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			min = 1,
			max = 128,
			default = PlayerRoleIndicator.default.iconSize,
		},
		[2] = {
			type = "slider",
			name = "死亡玩家图标偏移",
			getFunc = function() return PlayerRoleIndicator.savedVariables.yOffsetDead end,
			setFunc = function(newValue) PlayerRoleIndicator.savedVariables.yOffsetDead = newValue end,
			min = 0,
			max = 500,
			tooltip = "在死亡玩家上方显示图标的垂直偏移。",
			default = PlayerRoleIndicator.default.yOffsetDead,
		},
		[3] = {
			type = "slider",
			name = "活着的玩家图标偏移",
			getFunc = function() return PlayerRoleIndicator.savedVariables.yOffsetAlive end,
			setFunc = function(newValue) PlayerRoleIndicator.savedVariables.yOffsetAlive = newValue end,
			min = 0,
			max = 500,
			tooltip = "在活着的玩家上方显示图标的垂直偏移。",
			default = PlayerRoleIndicator.default.yOffsetAlive,
		},
		[4] = {
			type = "checkbox",
			name = "为玩家复活状态使用不同颜色",
			getFunc = function() return PlayerRoleIndicator.savedVariables.useRezColour end,
			setFunc = function(newValue)
				PlayerRoleIndicator.savedVariables.useRezColour = newValue
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			default = PlayerRoleIndicator.default.useRezColour,
		},
		[5] = {
			type = "colorpicker",
			name = "等待复活的玩家颜色",
			getFunc = function()  
				local colour = PlayerRoleIndicator.savedVariables.rezPendingColour
				return colour.r, colour.g, colour.b, colour.a 
				end,
			setFunc = function(r,g,b,a)
				local colour = PlayerRoleIndicator.savedVariables.rezPendingColour
				colour.r = r
				colour.g = g
				colour.b = b
				colour.a = a
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not PlayerRoleIndicator.savedVariables.useRezColour end, 
			default = {
				r = PlayerRoleIndicator.default.rezPendingColour.r,
				g = PlayerRoleIndicator.default.rezPendingColour.g,
				b = PlayerRoleIndicator.default.rezPendingColour.b,
				a = PlayerRoleIndicator.default.rezPendingColour.a
				},
		},
		[6] = {
			type = "colorpicker",
			name = "已复活玩家的颜色",
			getFunc = function()  
				local colour = PlayerRoleIndicator.savedVariables.rezingColour
				return colour.r, colour.g, colour.b, colour.a 
				end,
			setFunc = function(r,g,b,a)
				local colour = PlayerRoleIndicator.savedVariables.rezingColour
				colour.r = r
				colour.g = g
				colour.b = b
				colour.a = a
				PlayerRoleIndicator.UpdateAllIconVisuals()
				end,
			disabled = function() return not PlayerRoleIndicator.savedVariables.useRezColour end, 
			default = {
				r = PlayerRoleIndicator.default.rezingColour.r,
				g = PlayerRoleIndicator.default.rezingColour.g,
				b = PlayerRoleIndicator.default.rezingColour.b,
				a = PlayerRoleIndicator.default.rezingColour.a
				},
		},
		[7] = {
			type = "submenu",
			name = "通知",
			icon = "/esoui/art/tutorial/gamepad/achievement_categoryicon_quests.dds",
			controls = {
				[1] = {
					type = "description",
					text = "当组成员死亡或被复活时，会在屏幕上发出通知。" ..
					"\n\n图标、颜色以及是否应该显示X角色，这些都是从指定的角色设置中获取的。"
					},
				[2] = {
					type = "checkbox",
					name = "使用通知",
					getFunc = function() return PlayerRoleIndicator.savedVariables.useNote end,
					setFunc = function(newValue) PlayerRoleIndicator.savedVariables.useNote = newValue end,
					default = PlayerRoleIndicator.default.useNote,
				},
				[3] = {
					type = "checkbox",
					name = "解锁并显示通知面板",
					getFunc = function() return noteVisable end,
					setFunc = function(newValue)
						local c = PlayerRoleIndicatorWindowNotePanel
						c:SetMouseEnabled(newValue)
						c:SetMovable(newValue)
						
						for i = 1, PlayerRoleIndicator.noteNum, 1 do
							local label = c:GetNamedChild(string.format("Note%u", i))
							local labelIcon = label:GetNamedChild("Icon")
							label:SetHidden(not newValue)
							labelIcon:SetHidden(not newValue)
						end
						
						if not newValue then
							PlayerRoleIndicator.savedVariables.notePos.x = c:GetLeft()
							PlayerRoleIndicator.savedVariables.notePos.y = c:GetTop()
							PlayerRoleIndicator.UpdateAllNoteSize()
						end
						
						noteVisable = newValue
						end,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useNote end,
					default = false,
				},
				[4] = {
					type = "slider",
					name = "通知尺寸",
					getFunc = function() return PlayerRoleIndicator.savedVariables.noteSize end,
					setFunc = function(newValue) 
						PlayerRoleIndicator.savedVariables.noteSize = newValue
						PlayerRoleIndicator.UpdateAllNoteSize()
						end,
					min = 0.1,
					max = 4,
					step = 0.1,
					decimals = 1,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useNote end,
					default = PlayerRoleIndicator.default.noteSize,
				},
				[5] = {
					type = "slider",
					name = "通知持续时间",
					getFunc = function() return PlayerRoleIndicator.savedVariables.noteDuration end,
					setFunc = function(newValue) PlayerRoleIndicator.savedVariables.noteDuration = newValue end,
					min = 1,
					max = 10,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useNote end,
					default = PlayerRoleIndicator.default.noteDuration,
				},
				[6] = {
					type = "checkbox",
					name = "使用账户名",
					getFunc = function() return PlayerRoleIndicator.savedVariables.noteUseAccountName end,
					setFunc = function(newValue) PlayerRoleIndicator.savedVariables.noteUseAccountName = newValue end,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useNote end,
					default = PlayerRoleIndicator.default.noteUseAccountName,
				},
				[7] = {
					type = "checkbox",
					name = "在通知中使用角色图标",
					getFunc = function() return PlayerRoleIndicator.savedVariables.noteUseIcon end,
					setFunc = function(newValue) PlayerRoleIndicator.savedVariables.noteUseIcon = newValue end,
					disabled = function() return not PlayerRoleIndicator.savedVariables.useNote end,
					default = PlayerRoleIndicator.default.noteUseIcon,
				},
			},
		},
		[8] = {
			type = "submenu",
			name = "队长",
			icon = "/esoui/art/compass/groupleader.dds",
			controls = PlayerRoleIndicator.createSubmenu("队长", PlayerRoleIndicator.savedVariables.leader, PlayerRoleIndicator.default.leader),
		},
		[9] = {
			type = "submenu",
			name = "坦克",
			icon = "/esoui/art/tutorial/gamepad/gp_lfg_tank.dds",
			controls = PlayerRoleIndicator.createSubmenu("坦克", PlayerRoleIndicator.savedVariables.tank, PlayerRoleIndicator.default.tank),
		},
		[10] = {
			type = "submenu",
			name = "治疗",
			icon = "/esoui/art/tutorial/gamepad/gp_lfg_healer.dds",
			controls = PlayerRoleIndicator.createSubmenu("治疗", PlayerRoleIndicator.savedVariables.healer, PlayerRoleIndicator.default.healer),
		},
		[11] = {
			type = "submenu",
			name = "输出",
			icon = "/esoui/art/tutorial/gamepad/gp_lfg_dps.dds",
			controls = PlayerRoleIndicator.createSubmenu("输出", PlayerRoleIndicator.savedVariables.dps, PlayerRoleIndicator.default.dps),
		},
		[12] = {
			type = "submenu",
			name = "自定义角色",
			icon = "/esoui/art/tutorial/gamepad/gp_lfg_world.dds",
			controls = PlayerRoleIndicator.createCustomRoles(),
		},
		[13] = {
			type = "submenu",
			name = "堕落之影",
			icon = GetAbilityIcon(102271), --Icon for "Shadow of the Fallen" buff
			tooltip = "为老兵云栖城堕落之影机制所做的设置。",
			controls = {
				[1] = {
					type = "description",
					text = "当玩家在老兵云栖城中与泽玛亚的战斗中死亡时，一个阴影将会刷新。" ..
					"此阴影必须被杀死后才能复活倒下的玩家。" ..
					"\n\n这些是与此机制相关的设置。当启用时，如果玩家死亡，而他们的阴影未被杀死的情况下，他们上方的图标将通过颜色变化反映这一情况。",
				},
				[2] = {
					type = "checkbox",
					name = "为堕落之影开启颜色指示",
					getFunc = function() return PlayerRoleIndicator.savedVariables.showShade end,
					setFunc = function(newValue)
						PlayerRoleIndicator.savedVariables.showShade = newValue
						PlayerRoleIndicator.UpdateRoleSwitch()
						PlayerRoleIndicator.UpdateAllIconVisuals()
						end,
					default = PlayerRoleIndicator.default.showShade,
				},
				[3] = {
					type = "colorpicker",
					name = "阴影未被杀死时图标颜色",
					getFunc = function() return 
						PlayerRoleIndicator.savedVariables.shadeColour.r,
						PlayerRoleIndicator.savedVariables.shadeColour.g,
						PlayerRoleIndicator.savedVariables.shadeColour.b,
						PlayerRoleIndicator.savedVariables.shadeColour.a
						end,
					setFunc = function(r,g,b,a)
						PlayerRoleIndicator.savedVariables.shadeColour.r = r
						PlayerRoleIndicator.savedVariables.shadeColour.g = g
						PlayerRoleIndicator.savedVariables.shadeColour.b = b
						PlayerRoleIndicator.savedVariables.shadeColour.a = a
						end,
					default = {
						r = PlayerRoleIndicator.default.shadeColour.r, 
						g = PlayerRoleIndicator.default.shadeColour.g,
						b = PlayerRoleIndicator.default.shadeColour.b,
						a = PlayerRoleIndicator.default.shadeColour.a
						},
				},
			},
		},
	}
	LAM2:RegisterOptionControls("Player_role_indicator", optionsData)
end