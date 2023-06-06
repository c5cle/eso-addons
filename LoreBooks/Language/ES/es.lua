---------------------------------------
-- Spansih localization for LoreBooks --
---------------------------------------
--
-- Translated by:
--

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[Podría no estar ahí]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "Misión en <<1>>")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")


--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "Ciudad")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "Subterráneo")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. ": |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "LoreBooks")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "Iconos en el mapa")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "Iconos en el mapa (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "Define los iconos que aparecerán en el mapa.")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Usar escala de grises")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Usar iconos en escala de grises para libros coleccionados. (Sólo aplica a 'Iconos reales')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Usar iconos en escala de grises para libros de la biblioteca de memoria eidética sin coleccionar. (Sólo aplica a 'Iconos reales')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "Tamaño de marcador")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "Define el tamaño de los marcadores en el mapa.")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "Nivel del marcador")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "Define el nivel de los marcadores en el mapa.")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU", "Enable Lorebook player waypoint click option")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU_DESC", "Enable and disable the click option when Lorebooks are stacked to set player waypoint.")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU", "Add Dungeon or Location name to tooltip")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU_DESC", "Enable and disable adding the Dungeon or Location name to the tooltip. Example [Dungeon], or [Zenithar's Abbey]")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU", "Add Quest name and Location to tooltip")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU_DESC", "Enable and disable adding the Quest name and Location name if available to the tooltip. Example Quent in Blackwood [The Golden Anvil]")

ZO_CreateStringId("LBOOKS_PIN_TEXTURE1", "Iconos reales")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE2", "Set de iconos 1")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE3", "Set de iconos 2")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE4", "Iconos de Esohead (Rushmik)")

--compass
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "Mostrar libros en la brújula")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "Muestra los iconos de los libros desconocidos en la brújula.")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "Distancia máxima del marcador")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "La distancia máxima en la que los marcadores aparecerán en la brújula.")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "Mostrar libros desconocidos")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "Muestra los iconos de los libros desconocidos en el mapa.")
ZO_CreateStringId("LBOOKS_COLLECTED", "Mostrar libros coleccionados")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "Muestra los iconos de los libros ya coleccionados en el mapa.")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "Comparte tus descubrimientos con el autor de LoreBooks")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "Activar esta opción compartirá tus descubrimientos con el autor de LoreBooks enviando automáticamente un correo con la información recolectada.\nEsta opción sólo está disponible para usuarios de EU, incluso si la información compartida se comparte con los usuarios de NA.\nPor favor, ten en cuenta que podrías encontrarte con un corto retraso en tus habilidades cuando el correo está siendo enviado. Los correos se enviarán en segundo plano cada 30 libros leídos.")

ZO_CreateStringId("LBOOKS_EIDETIC", "Mostrar desconocidos de Memoria eidética")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "Muestra libros desconocidos de la biblioteca de memoria eidética en el mapa. Estos libros están relacionados con la historia y sucesos de las distintas regiones de Tamriel y no afectan la progresión en el Gremio de Magos.")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "Mostrar conocidos de Memoria eidética")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "Muestra libros ya coleccionados de la biblioteca de memoria eidética en el mapa. Estos libros están relacionados con la historia y sucesos de las distintas regiones de Tamriel y no afectan la progresión en el Gremio de Magos.")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "Mostrar desconocidos de Memoria eidética en la brújula")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "Muestra libros desconocidos de la biblioteca de memoria eidética en la brújula. Estos libros están relacionados con la historia y sucesos de las distintas regiones de Tamriel y no afectan la progresión en el Gremio de Magos.")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "Desbloquear biblioteca eidética")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "Desbloquea la biblioteca de memoria eidética incluso si no has completado la historia del Gremio de Magos. Sólo disponible para clientes EN/FR/DE.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "Esta opción está desactivada porque LoreBooks no ha sido actualizado a la última versión del juego, o el idioma de tu cliente aún no es soportado.")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "Libros desconocidos")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "Libros coleccionados")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (Coleccionado)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "Search in the lore library :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "Lorebook Name")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[Estanterías]")

-- Report

ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Informar")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Cambiar modo")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copiar")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "Faltan algunos libros en la biblioteca de Shalidor...")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "¡Alcanzaste el nivel máximo en la línea del Gremio de Magos! Pero aún faltan unos cuantos libros.")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "Coleccionaste todos los libros de la biblioteca de Shalidor. ¡Enhorabuena!")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "Faltan algunos libros en la memoria eidética...")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "Necesitas coleccionar unos cuantos libros más para poder hacer un informe de memoria eidética...")

-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "Activar modo inmersivo según")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "Los libros desconocidos no aparecerán según tu compleción de los siguientes objetivos en tu zona actual.")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "Desactivado")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "Historia principal de zona")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "Misiones de la zona")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "Usar libros de misión (beta)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "Esta opción intentará usar los libros recogidos en misiones cuando son obtenidos para evitar perder libros únicos de inventario. También podría ocurrir con mapas y similares porque no hay forma de distinguirlos de libros u otros objetos de misión.")
