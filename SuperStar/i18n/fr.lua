--[[
Author: Ayantir
Filename: fr.lua
Version: 3
]]--

SafeAddString(SI_BINDING_NAME_SUPERSTAR_SHOW_PANEL,			"Toggle SuperStar", 1)
	
SafeAddString(SUPERSTAR_RESPECFAV_SP,								"Réattribuer les Compétences", 1)
SafeAddString(SUPERSTAR_RESPECFAV_CP,								"Réattribuer les Points Champion", 1)
SafeAddString(SUPERSTAR_SAVEFAV,										"Enregistrer le favori", 1)
SafeAddString(SUPERSTAR_VIEWFAV,										"Voir les compétences", 1)
SafeAddString(SUPERSTAR_VIEWHASH,									"Voir le favori", 1)
SafeAddString(SUPERSTAR_UPDATEHASH,                                 "Mettre à jour le favori", 1)

SafeAddString(SUPERSTAR_REMFAV,										"Supprimer le favori", 1)
SafeAddString(SUPERSTAR_FAVNAME,										"Nom du favori", 1)
	
SafeAddString(SUPERSTAR_CSA_RESPECDONE_TITLE,					"Archétype changé", 1)
SafeAddString(SUPERSTAR_CSA_RESPECDONE_POINTS,					"<<1>> points attribués", 1)
SafeAddString(SUPERSTAR_CSA_RESPEC_INPROGRESS,					"Réattribution des points en cours", 1)
SafeAddString(SUPERSTAR_CSA_RESPEC_TIME,							"L'opération prendra environ <<1>> <<1[minutes/minute/minutes]>>", 1)

SafeAddString(SUPERSTAR_RESPEC_SPTITLE,							"Vous allez réattribuer vos |cFF0000compétences|r avec l'archétype suivant : <<1>>", 1)
SafeAddString(SUPERSTAR_RESPEC_CPTITLE,							"Vous allez réattribuer vos |cFF0000points champion|r avec l'archétype suivant : <<1>>", 1)

SafeAddString(SUPERSTAR_RESPEC_ERROR1,								"Impossible de réattribuer les points, Classe invalide", 1)
SafeAddString(SUPERSTAR_RESPEC_ERROR2,								"Impossible de réattribuer les points, Points de compétence insufisants", 1)
SafeAddString(SUPERSTAR_RESPEC_ERROR3,								"Attention: La race définie dans l'archétype n'est pas la vôtre, les points raciaux ne seront pas définis", 1)
SafeAddString(SUPERSTAR_RESPEC_ERROR5,								"Impossible de réattribuer les points champion, vous n'êtes pas un Champion", 1)
SafeAddString(SUPERSTAR_RESPEC_ERROR6,								"Impossible de réattribuer les points champion, pas assez de points champion", 1)

SafeAddString(SUPERSTAR_RESPEC_SKILLLINES_MISSING,				"Attention: Les lignes de compétence suivantes ne sont pas débloquées et ne seront pas définies", 1)
SafeAddString(SUPERSTAR_RESPEC_CPREQUIRED,						"Cet archétype définira <<1>> Points Champion", 1)

SafeAddString(SUPERSTAR_RESPEC_INPROGRESS1,						"Compétences de classe définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS2,						"Compétences d'arme définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS3,						"Compétences d'armure définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS4,						"Compétences du monde définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS5,						"Compétences de guilde définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS6,						"Compétences de guerre d'alliance définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS7,						"Compétences de race définies", 1)
SafeAddString(SUPERSTAR_RESPEC_INPROGRESS8,						"Compétences d'artisanat définies", 1)

SafeAddString(SUPERSTAR_IMPORT_MENU_TITLE,						"Importer", 1)
SafeAddString(SUPERSTAR_FAVORITES_MENU_TITLE,					"Favoris", 1)
SafeAddString(SUPERSTAR_RESPEC_MENU_TITLE,						"Respec", 1)

SafeAddString(SUPERSTAR_DIALOG_SPRESPEC_TITLE,					"Set skill points", 1)
SafeAddString(SUPERSTAR_DIALOG_SPRESPEC_TEXT,					"Set skill points according to the template selected ?", 1)

SafeAddString(SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TITLE,		"Réinitialiser le Simulateur", 1)
SafeAddString(SUPERSTAR_DIALOG_REINIT_SKB_ATTR_CP_TEXT,		"Vous êtes sur le point de réinitialiser le Simulateur de compétences qui contient des points d'attribut et/ou des points champion.\n\nFaire ceci réinitialisera également ces valeurs.\n\nSi vous souhaitez réinitialiser une compétence, faites simplement un clic droit sur son icône.", 1)

SafeAddString(SUPERSTAR_DIALOG_CPRESPEC_NOCOST_TEXT,			"Vous êtes sur le point de réattribuer vos Points Champion.\n\nCe changement sera gratuit", 1)

SafeAddString(SUPERSTAR_SCENE_SKILL_RACE_LABEL,					"Race", 1)

SafeAddString(SUPERSTAR_XML_CUSTOMIZABLE,							"Personnalisable", 1)
SafeAddString(SUPERSTAR_XML_GRANTED,								"Débloqués", 1)
SafeAddString(SUPERSTAR_XML_TOTAL,									"Total", 1)
SafeAddString(SUPERSTAR_XML_BUTTON_FAV,							"Favori", 1)
SafeAddString(SUPERSTAR_XML_BUTTON_REINIT,						"Réinitialiser", 1)
SafeAddString(SUPERSTAR_XML_BUTTON_EXPORT,						"Export", 1)
SafeAddString(SUPERSTAR_XML_NEWBUILD,								"Nouvel archétype :", 1)
SafeAddString(SUPERSTAR_XML_BUTTON_RESPEC,						"Respec", 1)
SafeAddString(SUPERSTAR_XML_BUTTON_START,						"Start", 1)

SafeAddString(SUPERSTAR_XML_IMPORT_EXPLAIN,						"Importer d'autres builds avec ce formulaire\n\nLes builds peuvent contenir des points champion, des points de compétence et des points d'attribut.", 1)
SafeAddString(SUPERSTAR_XML_FAVORITES_EXPLAIN,					"Les favoris vous permettent de voir et de respécialiser vos builds rapidement.\n\n", 1)

SafeAddString(SUPERSTAR_XML_SKILLPOINTS,							"Points de compétence", 1)
SafeAddString(SUPERSTAR_XML_CHAMPIONPOINTS,						"Points champion", 1)

ZO_CreateStringId("SUPERSTAR_SLOTNAME20",							"Alt. main droite") -- No EN
ZO_CreateStringId("SUPERSTAR_SLOTNAME21",							"Alt. main gauche") -- No EN

ZO_CreateStringId("SUPERSTAR_CHAMPION_SKILL2NAME1",			"Armure lourde") -- No EN
ZO_CreateStringId("SUPERSTAR_CHAMPION_SKILL3NAME1",			"Armure légère") -- No EN
ZO_CreateStringId("SUPERSTAR_CHAMPION_SKILL4NAME1",			"Armure moyenne") -- No EN
ZO_CreateStringId("SUPERSTAR_CHAMPION_SKILL6NAME1",			"Exp CàC") -- No EN

--SafeAddString(SUPERSTAR_MAELSTROM_WEAPON,							"Maelström", 1)
SafeAddString(SUPERSTAR_DESC_ENCHANT_MAX,							" maximale", 1)

SafeAddString(SUPERSTAR_DESC_ENCHANT_SEC,							" secondes", 1)
SafeAddString(SUPERSTAR_DESC_ENCHANT_SEC_SHORT,					" secs", 1)

SafeAddString(SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG,				" dégâts de Magie", 1)
SafeAddString(SUPERSTAR_DESC_ENCHANT_MAGICKA_DMG_SHORT,		" dégâts Magie", 1)

SafeAddString(SUPERSTAR_DESC_ENCHANT_BASH,						" Percussion", 1)
SafeAddString(SUPERSTAR_DESC_ENCHANT_BASH_SHORT,				" Percu", 1)

SafeAddString(SUPERSTAR_DESC_ENCHANT_REDUCE,						" et réduit le coût", 1)
SafeAddString(SUPERSTAR_DESC_ENCHANT_REDUCE_SHORT,				" et", 1)

SafeAddString(SUPERSTAR_IMPORT_ATTR_DISABLED,					"Incl. Attributs", 1)
SafeAddString(SUPERSTAR_IMPORT_ATTR_ENABLED,						"Supppr. Attributs", 1)
SafeAddString(SUPERSTAR_IMPORT_SP_DISABLED,						"Incl. Compétences", 1)
SafeAddString(SUPERSTAR_IMPORT_SP_ENABLED,						"Supppr. Compétences", 1)
SafeAddString(SUPERSTAR_IMPORT_CP_DISABLED,						"Incl. Points Champion", 1)
SafeAddString(SUPERSTAR_IMPORT_CP_ENABLED,						"Supppr. Points Champion", 1)
SafeAddString(SUPERSTAR_IMPORT_BUILD_OK,							"Build Valide, le voir !", 1)
SafeAddString(SUPERSTAR_IMPORT_BUILD_NO_SKILLS,					"Ce Build n'a pas de compétences associées", 1)
SafeAddString(SUPERSTAR_IMPORT_BUILD_NOK,							"Build Incorrect, Vérifiez votre Hash", 1)
SafeAddString(SUPERSTAR_IMPORT_BUILD_LABEL,						"Importer un build : coller le hash", 1)
SafeAddString(SUPERSTAR_IMPORT_MYBUILD,							"Mon Build", 1)

--SafeAddString(SUPERSTAR_XML_SWITCH_PLACEHOLDER,					"Switchez d'armes pour la 2nde barre", 1)

SafeAddString(SUPERSTAR_XML_FAVORITES_HEADER_NAME					, "Name", 1)
SafeAddString(SUPERSTAR_XML_FAVORITES_HEADER_CP					, "CP", 1)
SafeAddString(SUPERSTAR_XML_FAVORITES_HEADER_SP					, "SP", 1)
SafeAddString(SUPERSTAR_XML_FAVORITES_HEADER_ATTR					, "Attr", 1)
SafeAddString(SUPERSTAR_EQUIP_SET_BONUS
, "Set", 1)
