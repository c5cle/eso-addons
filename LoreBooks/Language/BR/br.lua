---------------------------------------------
-- Português br localização para LoreBooks --
---------------------------------------------
--
-- Traduzido por Eucio (by mlsevero)
--

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[Livro talvez não esteja aqui]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "Missão em <<1>>")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Special quest in <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "You must be reading a book to use /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Crafting Book or no relation to Eidetic Memory or Shalidor's Library.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Please Help Update")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Climb")

--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bookshelf")

ZO_CreateStringId("LBOOKS_MOREINFO1", "Cidade")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "Subterrâneo")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "Inside Inn")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r")

--settings menu header
ZO_CreateStringId("LBOOKS_TITLE", "Livros da Tradição (Lorebooks)")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "Selecione os ícones de pinos do mapa")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "Selecione os ícones de pinos do mapa (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "Selecione os ícones de pinos do mapa.")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Use grayscale")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Use grayscale for collected lore books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Use grayscale for uncollected eidetic books. (Only applies to 'real icons')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "Tamanho dos Pinos")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "Defina o tamanho dos pinos do mapa.")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "Camada dos Pinos")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "Defina a camada dos pinos do mapa")
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
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "Mostrar os Livros na Bússola.")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "Mostrar/Ocultar ícones de livros desconhecidos na bússola.")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "Distância máxima do pino")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "A distância máxima para os pinos aparecerem na bússola.")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "Mostrar livros desconhecidos")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "Mostrar/Ocultar ícones de livros desconhecidos no mapa.")
ZO_CreateStringId("LBOOKS_COLLECTED", "Mostrar livros já coletados")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "Mostrar/Ocultar ícones de livros já coletados no mapa.")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "Compartilhe suas descobertas com o autor do LoreBooks")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "Habilitar esta opção compartilhará suas descobertas com o autor do LoreBooks enviando automaticamente um e-mail no jogo com dados coletados.\Esta opção só está disponível para usuários da UE, mesmo se os dados coletados forem compartilhados com os NAs\Por favor, observe que você pode encontrar um pequeno atraso nas suas habilidades quando o email é enviado. O correio é enviado silenciosamente a cada 30 livros lidos.")

ZO_CreateStringId("LBOOKS_EIDETIC", "Mostrar Memória Eidética desconhecida")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "Mostrar/Esconder Pergaminhos de Memória Eidética desconhecidos no mapa. Esses pergaminhos são relacionados ao folclore e não envolvidos na Progressão da Guilda dos Magos, mas apenas informativos sobre Tamriel.")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "Mostrar Memória Eidética conhecida")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "Mostrar/Ocultar a Memória Eidética conhecida no mapa. Esses pergaminhos são pergaminhos relacionados ao folclore e não envolvidos na Progressão da Guilda dos Magos, mas apenas informativos sobre Tamriel.")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Show bookshelves")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Show/Hide bookshelves on map. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "Mostrar Memória Eidética desconhecida na bússola")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "Mostrar/Ocultar Pergaminhos de Memória Eidética desconhecidos na bússola. Esses pergaminhos são relacionados ao folclore e não envolvidos na Progressão da Guilda dos Magos, mas apenas informativos sobre Tamriel.")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Show bookshelves on compass")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Show/Hide bookshelves on compass. Bookshelves contain a random book from the zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "Desbloquear Biblioteca Eidética")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "Isto irá desbloquear a Biblioteca Eidética, mesmo que você não tenha feito a linha de missão do Mago. Esta opção é válida apenas para usuários EN/FR/DE.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "This option is disabled because either LoreBooks has not yet been updated for the latest game update or your language is not supported")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "Livross desconhecidos")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "Livros Coletados")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (Coletado)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Lorebooks Bookshelf")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "Pesquise na biblioteca de conhecimento :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "Nome do Livro")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Include Motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[Estante]")

-- Report
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Relatório")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Mudar de modo")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copiar")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "Ainda estão faltando alguns livros na Biblioteca Shalidor.")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "You maxed Mages Guild Skillline ! But few books are still missing")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "Você colecionou toda a biblioteca de Shalidor. Parabéns!")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "Ainda estão faltando alguns livros na memória eidética.")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "Você precisa coletar mais alguns livros para obter um relatório sobre a memória eidética.")
-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "Ativar modo imersivo com base em")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "Lorebooks desconhecidos não serão exibidos com base na conclusão do seguinte objetivo na zona atual em que você está procurando")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "Desativado")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "Zona da Missão Principal")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "Zona de Missões")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "Use Quest Books (Beta)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "Will try to use quest tools when they are received to avoid missing inventory-only books. May also use things like maps because there's no distinction between books and other usable quest items.")
