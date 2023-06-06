local FAB = FancyActionBar
local LAM = LibAddonMenu2

function FAB.BuildMenu(SV, defaults)

	local panel = {
		type = 'panel',
		name = 'Fancy Action Bar',
		displayName = 'Fancy Action Bar',
		author = '|cFFFF00@andy.s|r',
		version = string.format('|c00FF00%s|r', FAB.GetVersion()),
		website = 'https://www.esoui.com/downloads/fileinfo.php?id=2462',
		donation = 'https://www.esoui.com/downloads/info2311-HodorReflexes-DPSampUltimateShare.html#donate',
		registerForRefresh = true,
	}

	local options = {
		{
			type = "header",
			name = "|cFFFACD一般的|r",
		},
		{
			type = "checkbox",
			name = "静态技能栏",
			tooltip = "前栏和后栏不会在武器交换时切换位置。",
			default = defaults.staticBars,
			getFunc = function() return SV.staticBars end,
			setFunc = function(value)
				SV.staticBars = value or false
			end,
			requiresReload = true,
		},
		{
			type = "checkbox",
			name = "显示热键",
			tooltip = "在操作栏下显示热键。",
			default = defaults.showHotkeys,
			getFunc = function() return SV.showHotkeys end,
			setFunc = function(value)
				SV.showHotkeys = value or false
				FAB.ToggleHotkeys()
			end,
			width = 'half',
		},
		{
			type = "checkbox",
			name = "显示亮点",
			tooltip = "主动技能将突出显示。",
			default = defaults.showHighlight,
			getFunc = function() return SV.showHighlight end,
			setFunc = function(value)
				SV.showHighlight = value or false
			end,
			width = 'half',
		},
		{
			type = "checkbox",
			name = "显示箭头",
			tooltip = "显示指向当前柱的箭头（仅适用于静态技能栏）。",
			default = defaults.showArrow,
			getFunc = function() return SV.showArrow end,
			setFunc = function(value)
				SV.showArrow = value or false
				FAB_ActionBarArrow:SetHidden(not SV.showArrow)
			end,
			width = 'half',
			disabled = function() return not SV.staticBars end,
		},
		{
			type = "colorpicker",
			name = "箭头颜色",
			default = ZO_ColorDef:New(unpack(defaults.arrowColor)),
			getFunc = function() return unpack(SV.arrowColor) end,
			setFunc = function(r, g, b)
				SV.arrowColor = {r, g, b}
				FAB_ActionBarArrow:SetColor(unpack(SV.arrowColor))
			end,
			width = 'half',
			disabled = function() return not SV.staticBars end,
		},
		{
			type = "header",
			name = "|cFFFACD后台栏|r",
		},
		{
			type = "slider",
			name = "按钮透明度",
			tooltip = "较低的值 = 较不可见的后栏。",
			min = 0.2,
			max = 1,
			step = 0.01,
			decimals = 2,
			clampInput = true,
			default = defaults.backBarAlpha,
			getFunc = function() return SV.backBarAlpha end,
			setFunc = function(value)
				FAB.SetBackBarAlphaAndDesaturation(value, SV.backBarDesaturation)
			end,
			width = 'half',
		},
		{
			type = "slider",
			name = "按钮去饱和",
			tooltip = "较低的值 = 更丰富多彩的背景栏。",
			min = 0,
			max = 1,
			step = 0.01,
			decimals = 2,
			clampInput = true,
			default = defaults.backBarDesaturation,
			getFunc = function() return SV.backBarDesaturation end,
			setFunc = function(value)
				FAB.SetBackBarAlphaAndDesaturation(SV.backBarAlpha, value)
			end,
			width = 'half',
		},
		{
			type = "header",
			name = "|cFFFACD数字|r",
		},
		{
			type = "colorpicker",
			name = "默认颜色",
			tooltip = "技能持续时间的默认颜色。",
			default = ZO_ColorDef:New(unpack(defaults.timerColor)),
			getFunc = function() return unpack(SV.timerColor) end,
			setFunc = function(r, g, b)
				SV.timerColor = {r, g, b}
			end,
			width = 'half',
		},
		{
			type = "colorpicker",
			name = "零颜色",
			tooltip = "技能持续时间结束时数字 0 的颜色。",
			default = ZO_ColorDef:New(unpack(defaults.zeroColor)),
			getFunc = function() return unpack(SV.zeroColor) end,
			setFunc = function(r, g, b)
				SV.zeroColor = {r, g, b}
			end,
			width = 'half',
		},
		{
			type = "slider",
			name = "十进制阈值",
			tooltip = "任何低于此的数字都将显示为小数。 设置为 0 以禁用。",
			min = 0,
			max = 10,
			step = 0.1,
			decimals = 1,
			clampInput = true,
			default = defaults.decimalThreshold,
			getFunc = function() return SV.decimalThreshold end,
			setFunc = function(value)
				SV.decimalThreshold = value
			end,
			width = 'half',
		},
		{
			type = "colorpicker",
			name = "十进制颜色",
			tooltip = "十进制数字的颜色。",
			default = ZO_ColorDef:New(unpack(defaults.decimalColor)),
			getFunc = function() return unpack(SV.decimalColor) end,
			setFunc = function(r, g, b)
				SV.decimalColor = {r, g, b}
			end,
			width = 'half',
		},
		{
			type = "header",
			name = "|cFFFACD技能|r",
		},
		{
			type = "checkbox",
			name = "6s 光的力量",
			default = defaults.potlfix,
			getFunc = function() return SV.potlfix end,
			setFunc = function(value)
				SV.potlfix = value or false
			end,
		},
		{
			type = "header",
			name = "|cFFFACD杂项|r",
		},
		{
			type = "checkbox",
			name = "D调试模式",
			tooltip = "在游戏聊天中显示内部事件。",
			default = false,
			getFunc = function() return FAB.IsDebugMode() end,
			setFunc = function(value)
				FAB.SetDebugMode(value or false)
			end,
		},
	}

	local name = FAB.GetName() .. 'Menu'
    LAM:RegisterAddonPanel(name, panel)
    LAM:RegisterOptionControls(name, options)

end