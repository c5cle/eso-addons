---------------------------------------
-- German localization for LoreBooks --
---------------------------------------
--
-- Translated by:
-- Bl4ckSh33p, Votan & Scootworks

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[Das Buch ist möglicherweise nicht hier]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "Quest in <<1>>")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")


--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "Stadt")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "unter der Erde")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "Bücher")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "Icon für die Kartenmarkierung")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "Icon für die Kartenmarkierung (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "Wähle ein Icon für die Kartenmarkierung.")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Use grayscale")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Use grayscale for collected lore books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Use grayscale for uncollected eidetic books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "Größe der Kartenmarkierung")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "Bestimmt die Größe der Kartenmarkierung auf der Karte.")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "Ebene der Kartenmarkierung")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "Bestimmt die Ebene der Kartenmarkierung.")
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
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "Zeige Bücher auf dem Kompass")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "Zeige/Verberge Markierungen für noch nicht gesammelte Bücher auf dem Kompass.")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "Max. Entfernung der Kartenmarkierung")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "Die maximale Entfernung auf die Kartenmarkierungen am Kompass angezeigt werden.")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "Zeige unbekannte Bücher")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "Zeige/Verberge unbekannte Bücher auf der Karte.")
ZO_CreateStringId("LBOOKS_COLLECTED", "Zeige gesammelte Bücher")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "Zeige/Verberge bereits eingesammelte Bücher auf der Karte.")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "Teile deine Funde mit LoreBooks Author")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "Bei der Aktivierung dieser Option wirst du deine Funde direkt mit dem LoreBooks Author teilen können. Es wird automatisch eine Ingame Nachricht mit den erfassten Daten zugeschickt.\nBitte beachte, dass leichte Verzögerungen bei deinen Fertigkeiten auftreten können, solange die Nachricht geschickt wird. Die Nachricht wird alle 30 gelesenen Bücher lautlos verschickt.")

ZO_CreateStringId("LBOOKS_EIDETIC", "Zeige unbekannte Ewige Erinnerung")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "Zeige/Verberge unbekannte Schriften auf der Karte, die nicht den Magiergilden-Skill steigern.")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "Zeige bekannte Ewige Erinnerung")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "Zeige/Verberge Schriften der Ewigen Erinnerung auf der Karte. Diese Schriften sind lore-bezogene Schriften, die nicht zur Reihe der Magiergilde gehören. Sie sind rein informativ über Tamriel.")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "Zeige unbekannte Ewige Erinnerung im Kompass")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "Zeige/Verberge unbekannte Schriften im Kompass. Diese Schriften sind auf das Lore bezogen und nicht aus der Magiergilden Reihe. Sie sind rein informativ über Tamriel.")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "Ewige Erinnerung freischalten")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "Dies schaltet die Ewige Erinnerung frei, auch wenn Du die Questreihe der Magiergilde nicht abgeschlossen hast. Diese Option ist nur für EN/FR/DE verfügbar.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "This option is disabled because either LoreBooks has not yet been updated for the latest game update or your language is not supported")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "Unbekannte Bücher")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "Eingesammelte Bücher")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (Eingesammelte)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "Suche in der Bibliothek :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "Name des Buches")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[Bücherregale]")

-- Report
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Report")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Switch Mode")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copy")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "Es fehlen noch immer einige Bücher in Shalidors Bibliothek..")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "Du hast nun die Magiergilde ausgelevelt! Es fehlen aber noch immer einige Bücher")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "Du hast alle Bücher von Shalidors Bibliothek gesammelt. Herzlichen Glückwunsch!")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "Es fehlen noch immer einige Bücher von Ewige Erinnerung..")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "Noch ein paar Ewige Erinnerung Bücher mehr, um diese dem Author zu melden..")

-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "Aktiviere Immersiv Modus (abhängig von)")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "Unbekannte Bücher werden nicht angezeigt, wenn die folgende Einstellung nicht für die aktuell betrachtete Zone erfüllt wurde")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "Deaktiviert")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "Zonen Haupt Quest")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "Zonen Quests")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "Use Quest Books (Beta)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "Will try to use quest tools when they are received to avoid missing inventory-only books. May also use things like maps because there's no distinction between books and other usable quest items.")
