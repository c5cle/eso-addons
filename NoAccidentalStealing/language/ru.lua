NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "Разрешить украсть"

-- steal info
L.NAS_STEAL_INFO					= "StealInfo"

-- option strings
L.NAS_STEALTH_ALLOW 				= "красться, чтобы украсть"
L.NAS_STEALTH_ALLOW_OR				= "нажать, чтобы украсть"
L.NAS_CONFIRM_SETTING_HEAD			= "Описание"
L.NAS_CONFIRM_SETTING_TEXT			= [[Кража возможна, если соблюдены следующие условия:
 - Ваш персонаж скрыт;
 - зажата кнопка разрешения кражи (настраивается в меню управления)
 - дважды нажата кнопка взаимодействия (скорость двойного нажатия настраивается ниже)]]
L.NAS_DOUBLE_TAP_HEAD				= "Настройки двойного нажатия"
L.NAS_DOUBLE_TAP_TITLE				= "Скорость двойного нажатия"
L.NAS_DOUBLE_TAP_TEXT				= [[Двойное нажатие клавиши взаимодействия позволяет украсть предмет, даже если Вы не скрыты.]]
--Чтобы настроить интервал двойного нажатия, нажмите "Настроить" и дважды нажмите кнопку взаимодействия (по умолчанию [E].]]
L.NAS_DOUBLE_TAP_BUTTON				= "Настроить"
L.NAS_DOUBLE_TAP_SLIDER				= "Интервал двойного нажатия (мс)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "Вы можете установить интервал двойного нажатия вручную."
L.NAS_CONTAINER_HEAD				= "Настройки контейнеров"
L.NAS_CONTAINER_CHECKBOX			= "Разрешить обыскивать контейнеры"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "Открытие контейнеров не является преступлением. Если данная опция включена, то Вы сможете их открывать не в скрытности (если установлен автолут, не следует включать эту опцию)."

-- overwrite default localization with the RU one
-- (keep english strings that weren't translated)
for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end