---------------------------------------
-- Japanese (JF) localization for LoreBooks --
---------------------------------------
--
-- Translated by:
--

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[书有可能不在这里]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "在 <<1>> 中的任务")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")


--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "城镇")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "地下")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "LoreBooks 典籍")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "选择地图标记图标")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "选择地图标记图标 (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "选择地图标记图标")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - 使用灰鳞")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "对已收集的典籍使用灰鳞（只对'真实图标'起效）")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "对未收集的永恒记忆书本使用灰鳞（只对'真实图标'起效）")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "标记尺寸")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "设置地图标记的尺寸")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "标志图层")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "设置地图标志的图层")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU", "Enable Lorebook player waypoint click option")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU_DESC", "Enable and disable the click option when Lorebooks are stacked to set player waypoint.")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU", "Add Dungeon or Location name to tooltip")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU_DESC", "Enable and disable adding the Dungeon or Location name to the tooltip. Example [Dungeon], or [Zenithar's Abbey]")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU", "Add Quest name and Location to tooltip")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU_DESC", "Enable and disable adding the Quest name and Location name if available to the tooltip. Example Quent in Blackwood [The Golden Anvil]")

ZO_CreateStringId("LBOOKS_PIN_TEXTURE1", "真实图标")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE2", "书籍图标设置 1")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE3", "书籍图标设置 2")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE4", "Esohead的图标 (Rushmik)")

--compass
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "在罗盘上显示典籍")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "在罗盘上 显示/隐藏 未知典籍的图标")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "最大标记距离")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "标记在罗盘上出现的最大距离")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "显示未知典籍")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "在地图上 显示/隐藏 未知典籍的图标")
ZO_CreateStringId("LBOOKS_COLLECTED", "显示已收集典籍")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "在地图上 显示/隐藏 已收集典籍的图标")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "与 LoreBooks 作者分享你的发现")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "开启此选项将通过自动发送一个收集数据的游戏内邮件来与 LoreBooks 作者分享你的发现。\n此选项只对欧服玩家生效, 但收集到的数据会被分享给美服玩家\n请注意，当邮件发送时，您的技能可能会遇到一个小延迟。 每阅读30本书，邮件就自动发送一次。")

ZO_CreateStringId("LBOOKS_EIDETIC", "显示未知永恒记忆")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "在地图上 显示/隐藏 未知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "显示已知永恒记忆")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "在地图上 显示/隐藏 已知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "在罗盘上显示未知永恒记忆")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "在罗盘上 显示/隐藏 未知永恒记忆卷轴。 这些卷轴是一些不计入法师公会进度的相关知识卷轴, 只提供一些与塔姆瑞尔世界观相关的信息")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "解锁永恒图书馆")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "即使你还没有完成法师公会的任务线，此选项依然能为您解锁永恒图书馆。此选项只对 英语/法语/德语 用户生效。")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "This option is disabled because either LoreBooks has not yet been updated for the latest game update or your language is not supported")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "未知典籍")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "已收集典籍")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (已收集)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "在典籍图书馆中搜索:")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "典籍名字")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[书架]")

-- Report
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "报告")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "切换模式")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "复制")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "沙利多的图书馆中仍有部分书籍未找到..")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "您已达到法师公会技能线最大级 ! 但是仍有部分书籍未找到")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "你成功完成了所有沙利多的图书馆书籍收集。恭喜您 !")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "永恒记忆中仍有部分书籍未找到..")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "你需要收集更多一些书籍来获取永恒记忆报告..")

-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "开启沉浸模式基于")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "基于您正在查看的当前区域以下目标的完成情况，未知典籍不会被显示")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "禁用")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "区域主线任务")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "区域任务")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "使用任务书籍 (测试版)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "收到新任务时，会尝试使用任务工具来避免错过只出现在物品栏的书籍。也可以使用地图之类的东西，因为书和其他可用的任务物品没有区别。")