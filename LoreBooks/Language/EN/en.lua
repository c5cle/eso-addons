ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[Book is maybe not here]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "Quest in <<1>>")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")

--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "Town")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "Underground")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "LoreBooks")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "Select map pin icons")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "Select map pin icons (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "Select map pin icons.")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Use grayscale")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Use grayscale for collected lore books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Use grayscale for uncollected eidetic books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "Pin size")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "Set the size of the map pins.")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "Pin layer")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "Set the layer of the map pins")
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
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "Show lorebooks on the compass.")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "Show/Hide icons for unknown lorebooks on the compass.")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "Max pin distance")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "The maximum distance for pins to appear on the compass.")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "Show unknown lorebooks")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "Show/Hide icons for unknown lorebooks on the map.")
ZO_CreateStringId("LBOOKS_COLLECTED", "Show already collected lorebooks")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "Show/Hide icons for already collected lorebooks on the map.")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "Share your discoveries with LoreBooks author")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "Enabling this option will share your discoveries with LoreBooks author by sending automatically an ingame mail with data collected.\nThis option is only available for EU Users, even if data collected is shared with NA ones\nPlease note that you may encounter a small lag with your skills when the mail is sent. Mail is silently sent every 30 books read.")

ZO_CreateStringId("LBOOKS_EIDETIC", "Show unknown Eidetic Memory")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "Show/Hide unknown Eidetic Memory scrolls on map. Those scrolls are lore-related scrolls not involved into Mages Guild Progression, but only informative about Tamriel")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "Show known Eidetic Memory")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "Show/Hide known Eidetic Memory scrolls on map. Those scrolls are lore-related scrolls not involved into Mages Guild Progression, but only informative about Tamriel")
ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")

ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "Show unknown Eidetic Memory on compass")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "Show/Hide unknown Eidetic Memory scrolls on compass. Those scrolls are lore-related scrolls not involved into Mages Guild Progression, but only informative about Tamriel")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")

ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "Unlock Eidetic Library")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "This will unlock Eidetic Library even if you haven't done the Mage Guild questline. This option is only valid for EN/FR/DE users.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "This option is disabled because either LoreBooks has not yet been updated for the latest game update or your language is not supported")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "Unknown lorebooks")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "Collected lorebooks")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (Collected)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "Search in the lore library :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "Lorebook Name")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[Bookshelves]")

-- Report
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Report")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Switch Mode")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copy")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "Few books are still missing in the Shalidor Library..")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "You maxed Mages Guild Skillline ! But few books are still missing")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "You collected all Shalidor Library. Congratulations !")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "Few books are still missing in the Eidetic Memory..")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "You need to collect few more books in order to get a report on Eidetic Memory ..")

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
