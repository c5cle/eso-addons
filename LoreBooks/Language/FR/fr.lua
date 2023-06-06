----------------------------------------
-- French localization for LoreBooks --
----------------------------------------
--
-- Translated by:
-- Ykses (http://www.esoui.com/forums/member.php?u=1521)
--

ZO_CreateStringId("LBOOKS_QUEST_BOOK", "Quest [%s]")
ZO_CreateStringId("LBOOKS_QUEST_BOOK_ZONENAME", "Quest in %s [%s]")
ZO_CreateStringId("LBOOKS_MAYBE_NOT_HERE", "[Le livre n'est peut être pas là]")
ZO_CreateStringId("LBOOKS_QUEST_IN_ZONE", "Quête en <<1>>")
ZO_CreateStringId("LBOOKS_SPECIAL_QUEST", "Quête spéciale dans <<1>>")
ZO_CreateStringId("LBOOKS_LBPOS_OPEN_BOOK", "Vous devez lire un livre pour utiliser /lbpos")
ZO_CreateStringId("LBOOKS_LBPOS_ERROR", "Livre d'artisanat ou aucun rapport avec la mémoire eidétique ou la bibliothèque de Shalidor.")
ZO_CreateStringId("LBOOKS_PIN_UPDATE", "Veuillez aider à mettre à jour")

--Camera Actions
ZO_CreateStringId("LBOOKS_CLIMB", "Monter")


--tooltips
ZO_CreateStringId("LBOOKS_BOOKSHELF", "Bibliothèque")

ZO_CreateStringId("LBOOKS_MOREINFO1", "Ville")
ZO_CreateStringId("LBOOKS_MOREINFO2", GetString(SI_INSTANCEDISPLAYTYPE7))
ZO_CreateStringId("LBOOKS_MOREINFO3", GetString(SI_INSTANCEDISPLAYTYPE6))
ZO_CreateStringId("LBOOKS_MOREINFO4", "sous la terre")
ZO_CreateStringId("LBOOKS_MOREINFO5", GetString(SI_INSTANCETYPE2))
ZO_CreateStringId("LBOOKS_MOREINFO6", "À l'intérieur de l'auberge")

ZO_CreateStringId("LBOOKS_SET_WAYPOINT", GetString(SI_WORLD_MAP_ACTION_SET_PLAYER_WAYPOINT) .. " : |cFFFFFF<<1>>|r")

--settings menu header
--ZO_CreateStringId("LBOOKS_TITLE,						"LoreBooks")

--appearance
ZO_CreateStringId("LBOOKS_PIN_TEXTURE", "Choix des icônes")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_EIDETIC", "Choix des icônes (<<1>>)")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE_DESC", "Choisir l'apparence des icônes sur la carte.")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE", " - Utiliser les niveaux de gris")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_DESC", "Utilisez des niveaux de gris pour les livres de traditions collectés. (Ne s'applique qu'aux 'vraies icônes')")
ZO_CreateStringId("LBOOKS_PIN_GRAYSCALE_EIDETIC_DESC", "Utilisez des niveaux de gris pour les livres eidétiques non collectés. (S'applique uniquement aux 'vraies icônes')")
ZO_CreateStringId("LBOOKS_PIN_SIZE", "Taille des icônes")
ZO_CreateStringId("LBOOKS_PIN_SIZE_DESC", "Choisir la taille des icônes sur la carte.")
ZO_CreateStringId("LBOOKS_PIN_LAYER", "Épaisseur des icônes")
ZO_CreateStringId("LBOOKS_PIN_LAYER_DESC", "Choisir l'épaisseur des icônes sur la carte.")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU", "Activer l'option de clic sur le passage du joueur")
ZO_CreateStringId("LBOOKS_PIN_CLICK_MENU_DESC", "Activer et désactiver l'option de clic lorsque les Lorebooks sont empilés pour définir le point de passage du joueur.")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU", "Add Dungeon or Location name to tooltip")
ZO_CreateStringId("LBOOKS_DUNGEON_TAG_MENU_DESC", "Enable and disable adding the Dungeon or Location name to the tooltip. Example [Dungeon], or [Zenithar's Abbey]")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU", "Add Quest name and Location to tooltip")
ZO_CreateStringId("LBOOKS_QUESTINFO_MENU_DESC", "Enable and disable adding the Quest name and Location name if available to the tooltip. Example Quent in Blackwood [The Golden Anvil]")

ZO_CreateStringId("LBOOKS_PIN_TEXTURE1", "Icônes réelles")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE2", "Jeu d'icônes de livre 1")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE3", "Jeu d'icônes de livre 2")
ZO_CreateStringId("LBOOKS_PIN_TEXTURE4", "Les icônes d'Esohead (Rushmik)")

--compass
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN", "Positions indiquées sur la boussole")
ZO_CreateStringId("LBOOKS_COMPASS_UNKNOWN_DESC", "Afficher/cacher les Livres (de la Guilde des Mages) non collectés sur la boussole.")
ZO_CreateStringId("LBOOKS_COMPASS_DIST", "Distance d'affichage maximum")
ZO_CreateStringId("LBOOKS_COMPASS_DIST_DESC", "Choisir la distance à partir de laquelle les Livres apparaissent sur la boussole.")

--filters
ZO_CreateStringId("LBOOKS_UNKNOWN", "Afficher les Livres inconnus")
ZO_CreateStringId("LBOOKS_UNKNOWN_DESC", "Afficher/Masquer les icônes des Livres (de la Guilde des Mages) inconnus sur la carte.")
ZO_CreateStringId("LBOOKS_COLLECTED", "Afficher les Livres collectés")
ZO_CreateStringId("LBOOKS_COLLECTED_DESC", "Afficher/Masquer les icônes des Livres (de la Guilde des Mages) déjà collectés sur la carte.")

ZO_CreateStringId("LBOOKS_SHARE_DATA", "Partagez vos découvertes avec l'auteur de LoreBooks")
ZO_CreateStringId("LBOOKS_SHARE_DATA_DESC", "L'activation de cette option partagera vos découvertes avec l'auteur de LoreBooks en envoyant automatiquement un e-mail dans le jeu avec les données collectées.\nCette option n'est disponible que pour les utilisateurs de l'UE, même si les données collectées sont partagées avec ceux de NA\nVeuillez noter que vous pouvez rencontrer un léger décalage avec vos compétences lors de l'envoi du courrier. Le courrier est envoyé silencieusement tous les 30 livres lus.")

ZO_CreateStringId("LBOOKS_EIDETIC", "Mémoire Éidétique inconnue sur la carte")
ZO_CreateStringId("LBOOKS_EIDETIC_DESC", "Afficher/Masquer les parchemins inconnus présents dans la Mémoire Éidétique sur la carte. Ces parchemins promulguent diverses informations sur le lore de Tamriel et ne sont en rien impliqués dans la progression de la Guilde des Mages")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED", "Mémoire Éidétique connue sur la carte")
ZO_CreateStringId("LBOOKS_EIDETIC_COLLECTED_DESC", "Affiche/Masque les parchemins connus présents dans la Mémoire Éidétique sur la carte. Ces parchemins promulguent diverses informations sur le lore de Tamriel et ne sont en rien impliqués dans la progression de la Guilde des Mages")

ZO_CreateStringId("LBOOKS_BOOKSHELF_NAME", "Voir la Bibliothèque")
ZO_CreateStringId("LBOOKS_BOOKSHELF_DESC", "Afficher/Masquer les Bibliothèques sur la carte. Les Bibliothèques contiennent un livre aléatoire de la zone.")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC", "Mémoire Éidétique inconnue sur le compas")
ZO_CreateStringId("LBOOKS_COMPASS_EIDETIC_DESC", "Affiche/Masque les parchemins inconnus présents dans la Mémoire Éidétique sur le compas. Ces parchemins promulguent diverses informations sur le lore de Tamriel et ne sont en rien impliqués dans la progression de la Guilde des Mages")

ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_NAME", "Afficher les Bibliothèques sur la boussole")
ZO_CreateStringId("LBOOKS_COMPASS_BOOKSHELF_DESC", "Afficher/Masquer les Bibliothèques sur la boussole. Les Bibliothèques contiennent un livre aléatoire de la zone.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC", "Déverrouiller la bibliothèque eidétique")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_DESC", "Cela débloquera la bibliothèque eidétique même si vous n'avez pas terminé la série de quêtes de la guilde des mages. Cette option n'est valable que pour les utilisateurs EN/FR/DE.")
ZO_CreateStringId("LBOOKS_UNLOCK_EIDETIC_WARNING", "Cette option est désactivée car soit LoreBooks n'a pas encore été mis à jour pour la dernière mise à jour du jeu, soit votre langue n'est pas prise en charge")

--worldmap filters
ZO_CreateStringId("LBOOKS_FILTER_UNKNOWN", "Livres inconnus")
ZO_CreateStringId("LBOOKS_FILTER_COLLECTED", "Livres collectés")
ZO_CreateStringId("LBOOKS_FILTER_EICOLLECTED", "<<1>> (Collectés)")
ZO_CreateStringId("LBOOKS_FILTER_BOOKSHELF", "Bibliothèque Lorebooks")

--research
ZO_CreateStringId("LBOOKS_SEARCH_LABEL", "Recherche dans la bibliothèque :")
ZO_CreateStringId("LBOOKS_SEARCH_PLACEHOLDER", "Nom du livre")
ZO_CreateStringId("LBOOKS_INCLUDE_MOTIFS_CHECKBOX", "Inclure les motifs")

ZO_CreateStringId("LBOOKS_RANDOM_POSITION", "[Étagères]")

-- Report

ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_RPRT", "Rapport")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_SWITCH", "Changer de mode")
ZO_CreateStringId("LBOOKS_REPORT_KEYBIND_COPY", "Copier")

ZO_CreateStringId("LBOOKS_RS_FEW_BOOKS_MISSING", "Quelques livres sont encore manquants dans la Bibliothèque de Shalidor ..")
ZO_CreateStringId("LBOOKS_RS_MDONE_BOOKS_MISSING", "Niveau maximum de la Guilde des Mages ! Mais quelques livres sont encore manquants ..")
ZO_CreateStringId("LBOOKS_RS_GOT_ALL_BOOKS", "Vous avez retrouvé tous les livres de la Bibliothèque de Shalidor. Félicitations !")

ZO_CreateStringId("LBOOKS_RE_FEW_BOOKS_MISSING", "Quelques livres sont encore manquants dans la Mémoire Éidétique..")
ZO_CreateStringId("LBOOKS_RE_THREESHOLD_ERROR", "Encore quelques livres avant de consulter le détail de votre progression sur la Mémoire Éidétique ..")

-- Immersive Mode
ZO_CreateStringId("LBOOKS_IMMERSIVE", "Activer le mode immersif basé sur")
ZO_CreateStringId("LBOOKS_IMMERSIVE_DESC", "Les livres inconnus ne seront pas affichés suivant la réalisation de l'objectif suivant")

ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE1", "Désactivé")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE2", "Quête de zone principale")
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE3", GetString(SI_MAPFILTER8))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE4", GetAchievementCategoryInfo(6))
ZO_CreateStringId("LBOOKS_IMMERSIVE_CHOICE5", "Quêtes de zone")

-- Quest Books
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS", "Utiliser les livres de quête (Beta)")
ZO_CreateStringId("LBOOKS_USE_QUEST_BOOKS_DESC", "Essaiera d'utiliser les outils de quête lorsqu'ils seront reçus pour éviter de manquer des livres d'inventaire uniquement. Peut également utiliser des choses comme des cartes car il n'y a pas de distinction entre les livres et les autres objets de quête utilisables.")
