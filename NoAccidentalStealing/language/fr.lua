NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "Confirmer le vol"

-- steal info
L.NAS_STEAL_INFO					= "StealInfo"

-- option strings
L.NAS_STEALTH_ALLOW 				= "passer furtif pour voler"
L.NAS_STEALTH_ALLOW_OR				= "ou passer furtif pour voler"
L.NAS_CONFIRM_SETTING_HEAD			= "Conditions pour voler"
L.NAS_CONFIRM_SETTING_TEXT			= [[Le vol est possible si une de ces conditions sont réunis:
 - le personnage est caché,
 - le bouton de confirmation est appuyé (réglable dans le menu Commandes),
 - le bouton d'interaction est appuyé deux fois (la plage de temps du double appui est réglable ci-dessous).]]
L.NAS_DOUBLE_TAP_HEAD				= "Réglage du double appui"
L.NAS_DOUBLE_TAP_TITLE				= "Vitesse du double appui"
L.NAS_DOUBLE_TAP_TEXT				= [[Apuyer deux fois sur le bouton d'interaction confirmera le vol de l'objet, même si vous n'êtes pas en mode furtif.]]
--Pour configurer la plage de temps du double appui, cliquer sur le bouton "Configurer" et faire un double appui sur le bouton d'interaction.]]
L.NAS_DOUBLE_TAP_BUTTON				= "Configurer"
L.NAS_DOUBLE_TAP_SLIDER				= "Intervalle du double appui (en ms)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "Il est possible de régler l'intervalle de temps du double appui directement plutôt que d'utiliser le bouton de configuration."
L.NAS_CONTAINER_HEAD				= "Réglages des conteneurs"
L.NAS_CONTAINER_CHECKBOX			= "Autoriser la fouille des conteneurs"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "Ouvrir un conteneur n'est pas un crime. Quand cette option est activée, vous pouvez ouvrir les conteneurs même si le personnage n'est pas en mode furtif."

-- overwrite default localization with the FR one
-- (keep english strings that weren't translated)
for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end
