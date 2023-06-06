local lmb,rmb = '|t16:16:AlphaGear/asset/lmb.dds|t','|t16:16:AlphaGear/asset/rmb.dds|t'



AGLang.msg = {
    Copy = '拷贝',
    Paste = '粘贴',
    Clear = '清除',
    Insert = '插入当前装备的',

	-- new since 6.6.0
	ToBankAll = '存入所有装备套装',
	FromBankAll = '取出所有装备套装',
	FailedToMoveItem = '移动 <<1>> 失败',
	MovingSet = '移动套装 <<1>>...',
	-- end new 6.6.0

	-- new since 6.2.1
	ToBank = '存入装备套装',
	FromBank = '取出装备套装',
    CurrentlyEquipped = '<<1>> 仍在被装备着',
	NotEnoughSpaceInBackPack = '背包没有足够空间放入 <<1>>',
	NotEnoughSpaceInBank = '银行没有足够空间放入 <<1>>',
	ItemIsStolen = '<<1>> 是赃物。无法存入银行。',
	ReassignHint = '请用 Shift + Click 重新保存此技能，也可以从技能窗口拖拽它来获取正确的提示框.',
	ToolTipSkillIcon = lmb..' 选择图标\n'..rmb..' 重置图标',
	BindLoadNextSet = '载入下一个套装',
	BindLoadPreviousSet = '载入上一个套装',
	BindToggleSet = '切换最后两个套装',
    MsgNoPreviousSet = '你没有装备第二个套装',
	ShowMainBinding = '显示/隐藏 AlphaGear 窗口',
	-- end new 6.2.1

    Icon = lmb..'选择图标',
    Set = lmb..' 装备套装\n'..rmb..' 编辑套装',
    NotFound = '<<1>> |cFF0000没有找到...|r',
    NotEnoughSpace = '|cFFAA33AlphaGear|r |cFF0000没有足够的空间...|r',
    SoulgemUsed = '<<C:1>> |cFFAA33已充能.|r',
    SetPart = '\n|cFFAA33套装: <<C:1>>|r',
    Lock = '如果套装锁定, 所有空的槽位将会卸下装备.\n如果套装解锁, 所有空的槽位将会忽略.\n\n'..lmb..' 锁定/解锁',
    Unequip = '卸下装备',
    UnequipAll = '卸下所有装备',
	
	-- new since 6.1.1
	SetsHeader = '套装',
	SettingsDesc = '安装 AlphaGear 界面, 自动修复和自动充能',
	NumVisibleSetButtons = '要显示的套装按钮数量',
	GearHeader = '装备',
	WeaponsHeader = '武器',
	EquipmentHeader = '装备面板',
	UIHeader = '用户界面',
	ResetPositions = '重置位置',
	-- end new 6.1.1
	-- new since 6.1.3
	ShowItemLevelChoices = {'一直', '只显示低级物品', '不显示'},
	-- end new 6.1.3
    
	-- new since 6.2.0
	OutfitLabel = '服装',
	UneqipAllBinding = '卸下所有装备',
	LoadSetBinding = '载入套装 ',
	KeepOutfitItemLabel = '保留当前服装',
	SetChangeQueuedMsg = '设置 <<1>> (<<2>>) 将在战斗结束后被装备。',
	ActionBar1Text = '技能条 1',
	ActionBar2Text = '技能条 2',
	ActionBarNText = '技能条 <<1>>',
	NotEnoughMoneyForRepairMsg = '没有足够的钱来修理装备。',
	ItemsRepairedMsg = '<<1>> 物品被修复。维修总共花费: <<2>> 金币.',
	ItemsNotRepairedMsg = '金钱不足以维修 <<1>> 物品。',
	-- end new since 6.2.0    
	
	-- new since 6.5.0
	BindLoadProfile = '载入首选项 ',
	BindLoadNextProfile = '载入下一个首选项',
	BindLoadPreviousProfile = '载入上一个首选项',
	BindToggleProfile = '切换最后两个首选项',
	MsgNoPreviousProfile = '没有首选项可切换',
	-- end new since 6.5.0
	
    SetConnector = {
        lmb..' 链接装备到套装\n'..rmb..' 移除连接',
        lmb..' 链接技能条 1 到套装\n'..rmb..' 移除连接',
        lmb..' 连接技能条 2 到套装\n'..rmb..' 移除连接'
    },
    Head = {
        Gear = '装备 ',
        Skill = '技能 '
    },
    Button = {
        Gear = lmb..' 装备物品\n'..rmb..' 移除物品',
        Skill = lmb..' 装备技能\n'..rmb..' 移除技能'
    },
    Selector = {
        Gear = lmb..' 装备所有装备\n'..rmb..' 更多选项',
        Skill = lmb..' 装备所有技能\n'..rmb..' 更多选项'
    },
    OptionWidth = 300,
    Options = {
        '显示界面按钮',
        '显示界面套装按钮',
        '显示修理按钮',
        '显示修理花费',
        '显示武器充能图标',
        '显示武器切换信息',
        '显示正在装备的套装',
        '在物品栏中标记套装',
        '显示物品耐久度百分比',
        '显示物品质量为颜色',
        '移动时关闭窗口',
        '锁定所有AlphaGear的元素',
        '自动武器充能',
	-- new since 6.1.1
		'在商店自动维修护甲',
	-- end new 6.1.1
	-- new since 6.1.3
		'显示物品等级标记',
    -- end new 6.1.3
	-- new since 6.4.1
		'<未使用的信息>',		
		'自动载入首选项的最后一个人物建设',          -- AG_OPTION_LOAD_LAST_BUILD_OF_PROFILE = 17
	-- end new since 6.4.1
	},

	-- new since 6.8.1
	Integrations = {
		Inventory = {
			Title = '物品栏管理器',
			UseFCOIS = '使用FCO Item Saver插件',
			FCOIS = {
				GearMarkerIconLabel = '标记图标',
				NoGearMarkerIconEntry = '-无-',
			}
		},

		Styling = {
			Title = '风格管理器',
			UseAlphaStyle = '使用Alpha风格',
		},

		Champion = {
			Title = '勇士点管理器',
			UseCPSlots = '使用勇士点槽',
		},

		QuickSlot = {
			Title = '快捷栏管理器',
			UseGMQSB = '使用Greymind快捷栏条',
		},

	},
	-- new since 6.8.1
}
