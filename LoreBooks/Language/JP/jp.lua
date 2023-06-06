-----------------------------------------
-- Japanese localization for LoreBooks --
-----------------------------------------
--
-- Translated by:
-- BowmoreLover (http://www.esoui.com/forums/member.php?u=26795)

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[本は多分ここにない]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "<<1>> のクエスト")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")


--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "町")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "地下")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", "目的地を設定する: |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "LoreBooks")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "マップピンのアイコンの選択")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "マップピンのアイコンの選択 (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "マップピンのアイコンを選択します。")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Use grayscale")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Use grayscale for collected lore books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Use grayscale for uncollected eidetic books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "ピンのサイズ")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "マップピンのサイズを設定します。")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "ピンのレイヤー")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "マップピンのレイヤーを設定します。")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU", "Enable Lorebook player waypoint click option")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU_DESC", "Enable and disable the click option when Lorebooks are stacked to set player waypoint.")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU", "Add Dungeon or Location name to tooltip")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU_DESC", "Enable and disable adding the Dungeon or Location name to the tooltip. Example [Dungeon], or [Zenithar's Abbey]")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU", "Add Quest name and Location to tooltip")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU_DESC", "Enable and disable adding the Quest name and Location name if available to the tooltip. Example Quent in Blackwood [The Golden Anvil]")

ZO_CreateStringId("LBOOKS_PIN_TEXTURE1", "Real icons")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE2", "Book icon set 1")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE3", "Book icon set 2")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE4", "Esohead's icons (Rushmik)")

--compass
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "伝説の書物をコンパスに表示")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "未発見の伝説の書物をコンパスに表示するかどうか。")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "マップピンの距離")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "コンパスに表示するピンの最大距離です。")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "未発見の伝説の書物の表示")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "未発見の伝説の書物のアイコンをマップに表示するかどうか。")
ZO_CreateStringId("LBOOKS_COLLECTED", "収集済みの伝説の書物の表示")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "収集済みの伝説の書物のアイコンをマップに表示するかどうか。")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "発見をLoreBooksの作者に共有")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "有効にするとあなたの発見をゲーム内のメールを使ってLoreBooksの作者に自動的に共有します。\nこのオプションはEUユーザーにのみ有効ですが、収集されたデータはNAユーザーにも共有されます。\nメール送信時にわずかなスキルのラグが発生することがあるので注意してください。メールは本を30冊読むたびに裏で送信されます。")

ZO_CreateStringId("LBOOKS_EIDETIC", "未発見の直観記憶を表示")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "未発見の直観記憶の巻物をマップに表示するかどうか。この巻物は魔術師ギルド進行に関連しない伝承関連のもので、タムリエルの情報を提供するだけです。")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "発見済の直観記憶を表示")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "発見済の直観記憶の巻物をマップに表示するかどうか。この巻物は魔術師ギルド進行に関連しない伝承関連のもので、タムリエルの情報を提供するだけです。")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "未発見の直観記憶をコンパスに表示")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "未発見の直観記憶の巻物をコンパスに表示するかどうか。この巻物は魔術師ギルド進行に関連しない伝承関連のもので、タムリエルの情報を提供するだけです。")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "未発見の直観記憶のアンロック")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "魔術師ギルドのクエストラインが未完了でも未発見の直観記憶をアンロックします。このオプションはEN/FR/DEユーザーにのみ有効です。")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "This option is disabled because either LoreBooks has not yet been updated for the latest game update or your language is not supported")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "未発見の伝説の書物")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "収集済みの伝説の書物")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (収集済)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "伝承の蔵書庫から検索 :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "伝説の書物名")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[本棚]")

-- Report
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Report")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Switch Mode")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copy")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "シャリドールの蔵書がいくつか欠落しています…")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "魔術師ギルドのスキルラインが完成しました！ でもいくつかの本が欠落しています")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "シャリドールの蔵書をすべて収集しました。おめでとう！")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "直観記憶の本がいくつか欠落しています…")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "直観記憶のレポートを受け取るにはまだ本を集める必要があります…")

-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "Enable Immersive Mode based on")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "Unknown Lorebooks won't be displayed based on the completion of the following objective on the current zone you are looking at")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "Disabled")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "Zone Main Quest")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "Zone Quests")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "Use Quest Books (Beta)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "Will try to use quest tools when they are received to avoid missing inventory-only books. May also use things like maps because there's no distinction between books and other usable quest items.")
