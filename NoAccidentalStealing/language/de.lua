NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "Diebstahl bestätigen"

-- steal info
L.NAS_STEAL_INFO					= "StealInfo"

-- option strings
L.NAS_STEALTH_ALLOW 				= "Deckung erlaubt Diebstahl"
L.NAS_STEALTH_ALLOW_OR				= "oder Deckung erlaubt Diebstahl"
L.NAS_CONFIRM_SETTING_HEAD			= "Diebstahl Einstellungen"
L.NAS_CONFIRM_SETTING_TEXT			= [[Diebstahl wird möglich, wenn eine der folgenden Bedingungen erfüllt ist:
 - dein Charakter ist in Deckung
 - du hältst die Bestätigungstaste gedrückt (im Menu Steuerung einzustellen)
 - du tippst die Interaktionstaste doppelt (Zeitspanne unten einzustellen)]]
L.NAS_DOUBLE_TAP_HEAD				= "Doppel-Tipp Einstellungen"
L.NAS_DOUBLE_TAP_TITLE				= "Doppel-Tipp Geschwindigkeit"
L.NAS_DOUBLE_TAP_TEXT				= [[Die Interaktionstaste doppelt tippen erlaubt den Diebstahl auch, wenn du nicht in Deckung bist.]]
--Um die Zeitspanne zwischen zwei Tastenanschlägen einzustellen, klicke "Konfigurieren" und tippe zweimal die Interaktionstaste (Standard ist E).]]
L.NAS_DOUBLE_TAP_BUTTON				= "Konfigurieren"
L.NAS_DOUBLE_TAP_SLIDER				= "Doppel-Tipp Intervall (in ms)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "Du kannst das Doppel-Tipp Intervall auch direkt einstellen, anstatt den Konfigurieren Button anzuklicken."
L.NAS_CONTAINER_HEAD				= "Behälter Einstellungen"
L.NAS_CONTAINER_CHECKBOX			= "Behälter durchsuchen erlauben"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "Einen Behälter zu öffnen ist noch kein Delikt. Wenn diese Option eingeschaltet ist, kannst du Behälter öffnen, auch wenn du nicht in Deckung bist."

-- overwrite default localization with the DE one
-- (keep english strings that weren't translated)
for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end

