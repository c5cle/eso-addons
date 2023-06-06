local Srendarr = _G['Srendarr']
local L = {}

------------------------------------------------------------------------------------------------------------------
-- German (de) - Thanks to ESOUI.com user Scootworks for the translations.
-- Indented or commented lines still require human translation and may not make sense!
------------------------------------------------------------------------------------------------------------------

L.Srendarr									= "|c67b1e9S|c4779ce'rendarr|r"
L.Srendarr_Basic							= "S'rendarr"
L.Usage										= "|c67b1e9S|c4779ce'rendarr|r - Verwendung: /srendarr lock|unlock um die Leisten zu Entsperren/Sperren."
L.CastBar									= "Zauberleiste"
L.Sound_DefaultProc 						= "Srendarr Standard"
L.ToggleVisibility							= "Toggle Srendarr Sichtbarkeit"
	L.UpdateGearSets							= "Update ausgestattete Ausrüstungssätze"

-- time format						
L.Time_Tenths								= "%.1fs"
L.Time_TenthsNS								= "%.1f"
L.Time_Seconds								= "%ds"
L.Time_SecondsNS							= "%d"
L.Time_Minutes								= "%dm"
L.Time_Hours								= "%dh"
L.Time_Days									= "%dd"

-- aura grouping
L.Group_Displayed_Here						= "Angezeigte Leisten"
L.Group_Displayed_None						= "keine"
L.Group_Player_Short						= "Deine kurzen Buffs"
L.Group_Player_Long							= "Deine langen Buffs"
L.Group_Player_Major						= "Deine grösseren Buffs"
L.Group_Player_Minor						= "Deine kleineren Buffs"
L.Group_Player_Toggled						= "Deine umschaltbaren Buffs"
L.Group_Player_Ground						= "Deine Bodeneffekte"
L.Group_Player_Enchant						= "Deine Verzauberungsprocs"
	L.Group_Player_Cooldowns					= "Deine Proc-Abklingzeiten"
L.Group_Player_CABar						= "Abklingzeit Action Bar"
L.Group_Player_Passive						= "Deine Passiven Effekte"
L.Group_Player_Debuff						= "Deine Debuffs"
L.Group_Target_Buff							= "Ziel Buffs"
L.Group_Target_Debuff						= "Ziel Debuffs"
	L.Group_ProminentType						= "Prominente Art"
	L.Group_ProminentTypeTip					= "Wählen Sie den Typ der Aura aus (Buff, Debuff)."
	L.Group_ProminentTarget						= "Prominentes Ziel"
	L.Group_ProminentTargetTip					= "Wählen Sie das Ziel der Aura aus (Spieler, Ziel, AOE)."
	L.Group_GroupBuffs							= "Gruppenbuff -Rahmen"
	L.Group_RaidBuffs							= "Raid Buff -Rahmen"
	L.Group_GroupDebuffs						= "Gruppendebuff -Rahmen"
	L.Group_RaidDebuffs							= "Raid Debuff -Rahmen."
	L.Group_Cooldowns							= "Abfindungs -Tracker"
	L.Group_CooldownBar							= "Aktive Abklingzeit"
	L.Group_Cooldown							= "Abkühlen"

-- whitelist & blacklist control
	L.Prominent_RemoveByRecent					= "aufgrund einer falschen Klassifizierung von der prominenten Richtlinie entfernt, sollte typ sein"
	L.Prominent_AuraAddSuccess					= "zum Rahmen hinzugefügt"
	L.Prominent_AuraAddAs						= "als"
L.Prominent_AuraAddFail 					= "wurde nicht gefunden und konnte nicht hinzugefügt werden."
L.Prominent_AuraAddFailByID					= "Das ist keine gültige Effekt-ID! Die ID dieser Aura konnte nicht hinzugefügt werden."
	L.Prominent_AuraAddFailByName				= "Fehlende oder falsche Parameter."
	L.Prominent_AuraRemoveFail					= "Um eine prominente Aura zu entfernen, müssen Sie zuerst einen Namen von einem Modify-Aura-Pop-out-Menü klicken. Ändern Sie keine Werte, nachdem Sie auf eine Aura geklickt haben, oder das Entfernen wird fehlschlagen."
	L.Prominent_AuraRemoveSuccess				= "wurde aus der prominenten Liste entfernt."
L.Blacklist_AuraAddSuccess					= "wurde zur Blacklist hinzugefügt und wird nicht länger dargestellt."
L.Blacklist_AuraAddFail 					= "wurde nicht gefunden und konnte nicht hinzugefügt werden."
L.Blacklist_AuraAddFailByID					= "Keine gültige Effekt-ID! Die ID dieser Aura konnte nicht der Blacklist hinzugefügt werden."
L.Blacklist_AuraRemoved						= "wurde aus der Blacklist entfernt."
	L.Group_AuraAddSuccess					= "wurde der Gruppenfanweißweichliste hinzugefügt."
	L.Group_AuraAddSuccess2					= "wurde der Gruppen -Debuff Whitelist hinzugefügt."
	L.Group_AuraRemoved						= "wurde aus dem Gruppenbuff Whitelist entfernt."
	L.Group_AuraRemoved2					= "wurde aus der Gruppen -Debuff Whitelist entfernt."

-- settings: base
L.Show_Example_Auras						= "Beispiel Auren"
L.Show_Example_Castbar						= "Beispiel Zauberleiste"

L.SampleAura_PlayerTimed					= "Spieler Zeitlich"
L.SampleAura_PlayerToggled					= "Spieler umschaltbare Buffs"
L.SampleAura_PlayerPassive					= "Spieler Passive"
L.SampleAura_PlayerDebuff					= "Spieler Debuff"
L.SampleAura_PlayerGround					= "Spieler Bodenenffekte"
L.SampleAura_PlayerMajor					= "Grösere Buffs"
L.SampleAura_PlayerMinor					= "Kleinere Buffs"
L.SampleAura_TargetBuff						= "Ziel Buff"
L.SampleAura_TargetDebuff					= "Ziel Debuff"

L.TabButton1								= "Allgemein"
L.TabButton2								= "Filter"
L.TabButton3								= "Zauberleiste"
L.TabButton4								= "Leisten"
L.TabButton5								= "Profile"

L.TabHeader1								= "Allgemein Einstellungen"
L.TabHeader2								= "Filter Einstellungen"
L.TabHeader3								= "Zauberleisten Einstellungen"
L.TabHeader5								= "Profil Einstellungen"
L.TabHeaderDisplay							= "Leisten Einstellungen"

-- settings: generic
L.GenericSetting_ClickToViewAuras			= "Klick = Auren anzeigen"
L.GenericSetting_NameFont					= "Text Schrift"
L.GenericSetting_NameStyle					= "Text Farbe & Aussehen"
L.GenericSetting_NameSize					= "Text Grösse"
L.GenericSetting_TimerFont					= "Zeit Schriftart"
L.GenericSetting_TimerStyle					= "Zeit Schrift Farbe & Aussehen"
L.GenericSetting_TimerSize					= "Zeit Grösse"
L.GenericSetting_BarWidth					= "Leisten Breite"
L.GenericSetting_BarWidthTip				= "Legt die Breite der Zeitleiste fest.\nMöglicherweise musst du anschliessend die Aura Gruppe verschieben."


-- ----------------------------
-- SETTINGS: DROPDOWN ENTRIES
-- ----------------------------
L.DropGroup_1								= "In Leiste [|cffd1001|r]"
L.DropGroup_2								= "In Leiste [|cffd1002|r]"
L.DropGroup_3								= "In Leiste [|cffd1003|r]"
L.DropGroup_4								= "In Leiste [|cffd1004|r]"
L.DropGroup_5								= "In Leiste [|cffd1005|r]"
L.DropGroup_6								= "In Leiste [|cffd1006|r]"
L.DropGroup_7								= "In Leiste [|cffd1007|r]"
L.DropGroup_8								= "In Leiste [|cffd1008|r]"
L.DropGroup_9								= "In Leiste [|cffd1009|r]"
L.DropGroup_10								= "In Leiste [|cffd10010|r]"
L.DropGroup_11								= "In Leiste [|cffd10011|r]"
L.DropGroup_12								= "In Leiste [|cffd10012|r]"
L.DropGroup_13								= "In Leiste [|cffd10013|r]"
L.DropGroup_14								= "In Leiste [|cffd10014|r]"
L.DropGroup_None							= "Nicht anzeigen"

L.DropStyle_Full							= "komplett"
L.DropStyle_Icon							= "nur Icon"
L.DropStyle_Mini							= "nur Text & Dauer"

L.DropGrowth_Up								= "Hoch"
L.DropGrowth_Down							= "Runter"
L.DropGrowth_Left							= "Links"
L.DropGrowth_Right							= "Rechts"
L.DropGrowth_CenterLeft						= "Zentriert (Links)"
L.DropGrowth_CenterRight					= "Zentriert (Rechts)"

L.DropSort_NameAsc							= "Name (auf)"
L.DropSort_TimeAsc							= "Dauer (auf)"
L.DropSort_CastAsc							= "Reihenfolge (auf)"
L.DropSort_NameDesc							= "Name (ab)"
L.DropSort_TimeDesc							= "Dauer (ab)"
L.DropSort_CastDesc							= "Reihenfolge (ab)"

L.DropTimer_Above							= "oberhalb Icon"
L.DropTimer_Below							= "unterhalb Icon"
L.DropTimer_Over							= "auf Icon"
L.DropTimer_Hidden							= "versteckt"

L.DropAuraClassBuff							= "Buff"
L.DropAuraClassDebuff						= "Debuff"
	L.DropAuraTargetPlayer						= "Spieler"
	L.DropAuraTargetTarget						= "Ziel"
	L.DropAuraTargetAOE							= "AOE"
L.DropAuraClassDefault						= "kein Überschreiben"

	L.DropGroupMode1							= "Standard"
--L.DropGroupMode2							= "Foundry Tactical Combat"
--L.DropGroupMode3							= "Lui Extended"
--L.DropGroupMode4							= "Bandits User Interface"
--L.DropGroupMode5							= "AUI"


-- ------------------------
-- SETTINGS: GENERAL
-- ------------------------
-- general (general options)
	L.General_GeneralOptions					= "Allgemeine Optionen"
	L.General_GeneralOptionsDesc				= "Verschiedene allgemeine Optionen, die das Verhalten des Addons kontrollieren."
	L.General_UnlockDesc						= "Entsperren, damit Aura-Anzeigefenster mit der Maus gezogen werden können. Beim Zurücksetzen werden alle Positionsänderungen seit dem letzten Neuladen zurückgesetzt, und die Standardeinstellungen bringen alle Fenster an ihren Standardspeicherort zurück."
L.General_UnlockLock						= "Sperren"
L.General_UnlockUnlock						= "Entsperren"
L.General_UnlockReset						= "Zurücksetzen"
	L.General_UnlockDefaults					= "Standardeinstellungen"
	L.General_UnlockDefaultsAgain				= "Standardeinstellungen bestätigen"
L.General_CombatOnly						= "Nur im Kampf anzeigen"
L.General_CombatOnlyTip						= "Wenn diese Einstellung aktiviert ist, werden die Leisten nur im Kampf angezeigt."
	L.General_PassivesAlways				= "Immer Passive zeigen"
	L.General_PassivesAlwaysTip				= "Passive / lange Dauer Auras anzeigen, auch wenn nicht im Kampf und der obigen Option aktiviert ist."
L.HideOnDeadTargets							= "Verstecke Auren bei Toten"
L.HideOnDeadTargetsTip						= "Verstecke alle Auren bei Toten Zielen."
	L.PVPJoinTimer								= "PVP-Beitrittstimer"
	L.PVPJoinTimerTip							= "Das Spiel blockiert Addon-registrierte Ereignisse bei der Initialisierung von PVP. Dies ist die Anzahl der Sekunden, auf die Srendarr wartet, damit dies abgeschlossen ist, was von Ihrer CPU- und / oder Serververzögerung abhängen kann. Wenn Auras beim Verbinden oder Verlassen von PVP verschwinden, setzen Sie diesen Wert höher."
	L.ShowTenths								= "Zehntel von Sekunden"
	L.ShowTenthsTip								= "Zehntel neben Zeitgebern anzeigen, nur noch Sekunden. Der Schieberegler legt fest, wie viele Sekunden unter welchen Zehnteln angezeigt werden. Wenn Sie diesen Wert auf 0 festlegen, wird die Anzeige der Zehntel deaktiviert."
	L.ShowSSeconds								= "Sekunden 's' anzeigen"
	L.ShowSSecondsTip							= "Zeigen Sie den Buchstaben 's' nach Zeitgebern mit nur noch verbleibenden Sekunden an. Zeiten, die Minuten und Sekunden anzeigen, werden davon nicht beeinflusst."
	L.ShowSeconds								= "Zeige verbleibende Sekunden"
	L.ShowSecondsTip							= "Zeige die verbleibenden Sekunden neben Timern, die Minuten anzeigen. Timer, die Stunden anzeigen, sind davon nicht betroffen."
L.General_ConsolidateEnabled				= "Konsolidiere Multi-Auras"
L.General_ConsolidateEnabledTip				= "Bestimmte Fähigkeiten (z.B. Wiederherstellen Aura vom Templer) haben mehrere Effekte. Diese Effekte werden meistens alle mit dem selben Symbol angezeigt. Diese Option konsolidiert die Effekte zu einer einzigen Aura."
	L.General_AlternateEnchantIcons				= "Alternative Enchant -Ikonen"
	L.General_AlternateEnchantIconsTip			= "Aktivieren: Verwenden Sie einen benutzerdefinierten Satz von Symbolen für Verzauberungseffekte. Deaktivieren: Verwenden Sie Standard -Spiel -Enchant -Symbole."
L.General_PassiveEffectsAsPassive			= "Passive Auren als passive Effekte"
L.General_PassiveEffectsAsPassiveTip		= "Legt fest, ob passive kleinere & grössere Buffs gruppiert oder verborgen sind anhand deiner 'Deine Passiven Effekte' Einstellungen.\n\nFalls diese deaktiviert sind, werden alle kleinen & grossen Buffs separat gruppiert angezeigt, unabhängig ob diese passiv oder zeitlich gesteuert sind."
L.General_AuraFadeout						= "Buff/Debuff Ausblendezeit"
L.General_AuraFadeoutTip					= "Beim Wert '0' blendet das Icon direkt bei Ablauf der Zeit aus."
L.General_ShortThreshold					= "Kurzer Buff Grenzwert"
L.General_ShortThresholdTip					= "Alle Werte unter dieser Grenze werden zählen als 'kurze Buffs', alle oberhalb dieser Grenze als 'lange Buffs'."
	L.General_ProcEnableAnims					= "Aktivieren Sie Bar -Proc -Animationen"
L.General_ProcEnableAnimsTip				= "Aktivieren um die Proc Animationen in der Aktionsleiste anzuzeigen. Proc Fähigkeiten sind:\n- Kristallfragemente (Zauberer)\n- Grimmiger Fokus und deren Morphs (Nachtklinge)\n- Flammenleine (Drachenritter)\n- tödlicher Umhang (Zwei Waffen)"
	L.General_GrimProcAnims						= "Grim Focus Proc Animationen"
	L.General_GrimProcAnimsTip					= "Stellen Sie fest, ob Sie eine Animation auf der Aura selbst zeigen möchten, wenn Nightblade Grim Dawn oder ihre Morphen genügend Stapel haben, um den Speklowbon zu werfen."
	L.General_GearProcAnims						= "Abklingzeit -Action -Bar -Animationen"
	L.General_GearProcAnimsTip					= "Stellen Sie fest, ob Sie eine Animation in der Abklingzeit -Action -Bar anzeigen möchten, wenn die Ausrüstungsfähigkeiten abklingeln und prokitiert sind. (Muss einem Rahmen in Aura Control - Display -Gruppen eine Abkling -Aktionsleiste zuweisen.)"
	L.General_gearProcCDText					= "Abklingzeit Action Bar Dauer"
	L.General_gearProcCDTextTip					= "Zeigen Sie die Abklingzeit -Dauer in der Abklingzeit -Aktionsleiste neben dem festgelegten Proc -Namen der Ausrüstungsfähigkeiten, die zur Verwendung bereit sind."
L.General_ProcEnableAnimsWarn				= "Wenn du die originale Aktionsleiste ausgeblendet hast, wird die Animation auch nicht angezeigt."
L.General_ProcPlaySound						= "Ton bei Proc abspielen"
L.General_ProcPlaySoundTip					= "Solange aktiviert, wird ein Ton abgespielt wenn eine Fähigkeit proct. Ansonsten ist der Ton bei Procs unterdrückt."
L.General_ModifyVolume						= "Ändern Proc Volume"
L.General_ModifyVolumeTip					= "Aktivieren Sie die Verwendung von unter dem Proc-Volume-Schieberegler."
L.General_ProcVolume						= "Proc Lautstärke"
L.General_ProcVolumeTip						= "Vorübergehend überschreibt Audio Effects Volume, wenn die Srendarr proc Ton zu spielen."
	L.General_GroupAuraMode						= "Gruppen -Aura -Modus"
	L.General_GroupAuraModeTip					= "Wählen Sie das Support -Modul für die derzeit verwendeten Gruppeneinheitsrahmen aus. Standard ist die normalen Rahmen des Spiels."
	L.General_RaidAuraMode						= "Raid -Aura -Modus"
	L.General_RaidAuraModeTip					= "Wählen Sie das Support -Modul für die derzeit verwendeten Raid -Einheitsrahmen aus. Standard ist die normalen Rahmen des Spiels."

-- general (display groups)
L.General_ControlHeader						= "Buff/Debuff Anzeige Einstellungen"
L.General_ControlBaseTip					= "Hier wird festgelegt, in welchem Anzeigefenster die Aura Gruppen angezeigt werden."
L.General_ControlShortTip					= "Diese Gruppe zeigt deine eigenen Effekte unterhalb des 'kurzer Buff Grenzwert'."
L.General_ControlLongTip 					= "Diese Gruppe zeigt deine eigenen Effekte oberhalb des 'kurzer Buff Grenzwert'."
L.General_ControlMajorTip					= "Diese Gruppe zeigt alle positive 'grossen Buffs'. Negativ auswirkende Effekte werden in der negativen Effekte Gruppe angezeigt."
L.General_ControlMinorTip					= "Diese Gruppe zeigt alle positive 'kleinen Buffs'. Negativ auswirkende Effekte werden in der negativen Effekte Gruppe angezeigt."
L.General_ControlToggledTip					= "Diese Gruppe zeigt deine umschaltbaren Effekte."
L.General_ControlGroundTip					= "Diese Gruppe zeigt alle Flächeneffekte die von dir benutzt wurden."
L.General_ControlEnchantTip					= "Diese Gruppe enthält alle Verzauberungseffekte, die auf dich selber aktiv sind (z.B. Härten, Berserker)."
L.General_ControlGearTip					= "Diese Gruppe enthält alle Rüstungseffekte, die auf dich selber aktiv sind (z.B. Blutbrut)."
	L.General_ControlCooldownTip				= "Diese Aura-Gruppe verfolgt die interne Abklingzeit Ihrer Gear Procs."
	L.Group_Player_CABarTip						= "Verfolgen Sie Ihre ausgestatteten Abklingzeiten und lassen Sie sich benachrichtigt, wenn sie bereit sind, zu prok."
L.General_ControlPassiveTip					= "Diese Gruppe zeigt alle passiven Effekte die gerade auf dich selbst wirken."
L.General_ControlDebuffTip					= "Diese Gruppe zeigt alle negativen Effekte die auf dich von Gegnern, Spieler oder der Umgebung gewirkt wurden."
L.General_ControlTargetBuffTip				= "Diese Gruppe zeigt alle positive Effekte von deinem Ziel, unabhängig von umschaltbaren, passiven oder aktiven Effekten."
L.General_ControlTargetDebuffTip 			= "Diese Gruppe zeigt alle negativen Effekte von deinem Ziel die du gemacht hast. In seltenen Fällen werden weitere negative Effekte angezeigt, die nicht von dir direkt sind."
	L.General_ControlProminentFrame				= "Prominenter Rahmen"
	L.General_ControlProminentFrameTip			= "Wählen Sie den Rahmen aus, in dem diese prominente Aura angezeigt werden kann. Dadurch wird normale Filterkategorien überschrieben, die sonst für die konfigurierte Aura gelten würden."

-- general (debug)
L.General_DebugOptions						= "Debug Einstellungen"
L.General_DebugOptionsDesc					= "Eine Hilfe um fehlende oder falsche Auren aufzuspüren!"
L.General_DisplayAbilityID					= "Effekt-ID der Auren anzeigen"
L.General_DisplayAbilityIDTip				= "Zeigt die internen Effekt-ID's der Auren an. Das wird benötigt, um z.B. die Fähigkeiten der Blacklist oder der Whitelist hinzuzufügen.\nEs kann natürlich auch verwendet werden, um gewisse Auren dem AddOn Author zu melden."
L.General_ShowCombatEvents					= "Zeige Kampf Ereignisse"
L.General_ShowCombatEventsTip				= "Wenn diese Einstellung aktiviert ist, werden alle Effekt-ID's & deren Namen im Chat angezeigt. Diese enthalten auch die Effekte, die der Gegner auf dich ausführt, und der Ereignisergebniscode (gewonnen, verloren, etc.).\n\nUm eine Informations-Überflutung zu verhindern, wird eine Fähigkeit nur einmal angezeigt. Mit '/reloadui' oder '/sdbclear' kann man den Cache manuell leeren um die Effekt-ID's erneut anzeigen zu lassen.\n\nWARNUNG: Die Aktivierung dieser Option senkt die Spielleistung in großen Gruppen ab. Aktivieren Sie nur, wenn Sie zum Testen benötigt werden."
	L.General_ShowCombatEventsH1				= "WARNUNG:"
	L.General_ShowCombatEventsH2				= "Verlassen "
	L.General_ShowCombatEventsH3				= " werden zu jeder Zeit die Spielleistung in großen Gruppen verringern. Nur bei Bedarf zum Testen aktiviert."
L.General_AllowManualDebug					= "Erlaube manuellen Debug"
L.General_AllowManualDebugTip				= "Mit dieser Einstellung kannst du mit /sdbadd XXXXXX oder /sdbremove XXXXXX einzelne Effekt-ID's dem Flutfilter hinzufügen/entfernen. Darüber hinaus ermöglicht das Tippen /sdbignore XXXXXX immer die Eingabe-ID an dem Flutfilter vorbei. Mit dem Befehl /sdbclear kannst du das zurückzusetzen ."
L.General_DisableSpamControl				= "Deaktiviere Flutfilter"
L.General_DisableSpamControlTip				= "Wenn diese Einstellung EIN ist, wird ein gleiches Ereignis immer wieder aufgelistet. Ansonsten wird es nur einmal angezeigt."
L.General_VerboseDebug						= "Zeige ausführlichen Debug"
L.General_VerboseDebugTip					= "Zeige den gesamten Datenbaustein von EVENT_COMBAT_EVENT, inkl. Fähigkeitssymbol und dessen Effekt-ID. Das wird deinen Chat schnell ausfüllen!"
L.General_OnlyPlayerDebug					= "Nur Spielerereignisse"
L.General_OnlyPlayerDebugTip				= "Nur Debug-Kampf-Events anzeigen, die das Ergebnis von Spieleraktionen sind."
L.General_ShowNoNames						= "Zeige namenslose Ereignisse"
L.General_ShowNoNamesTip					= "Dieser Filter zeigt dir auch Ereignisse an, die keinen expliziten Namen haben (wird grundsätzlich nicht benötigt)."
L.General_ShowSetIds						= "Set-IDs beim Ausrüsten anzeigen"
L.General_ShowSetIdsTip						= "Wenn aktiviert, werden beim Wechseln eines Teils der Name und die SetID aller ausgerüsteten Ausrüstungsgegenstände angezeigt."


-- ------------------------
-- SETTINGS: FILTERS
-- ------------------------
L.FilterHeader								= "Filter Einstellungen"
L.Filter_Desc								= "Hier kannst du verschiedene Einstellungen zu Filtern machen. Du kannst Auren zu Black-/Whitelists hinzufügen und diese in speziellen Leisten darstellen."
L.Filter_RemoveSelected						= "Aura Löschen"
L.Filter_ListAddWarn						= "Um eine Aura hinzufügen zu können, wird das ganze Spiel nach der Fähigkeit durchsucht. Das kann zu einer kurzen Verzögerung, respektive Hängenbleiben des Spiels führen."
L.FilterToggle_Desc             			= "Das Aktivieren eines Filters verhindert die Anzeige dieser Kategorie."

L.Filter_PlayerHeader						= "Buff/Debuff Filter für Spieler"
L.Filter_TargetHeader						= "Buff/Debuff Filter für Ziel"
L.Filter_OnlyPlayerDebuffs					= "Nur Spieler Debuffs"
L.Filter_OnlyPlayerDebuffsTip				= "Unterdrückt Auren von Zielen, die nicht vom Spieler selbst erstellt wurden."
L.Filter_OnlyTargetMajor					= "Nur Ziel-Major"
L.Filter_OnlyTargetMajorTip					= "Zeigen Sie nur große Effektbuffs auf das Ziel. Alle anderen Zielbuffs werden nicht angezeigt."

-- filters (blacklist auras)
L.Filter_BlacklistHeader  					= "Buff/Debuff Blacklist"
L.Filter_BlacklistDesc						= "Es können hier spezifische Auren zu einer Blacklist hinzugefügt werden. Diese werden in keinem Fenster mehr erscheinen! Hinweis: Diese Blacklist blockiert 'keine' Buff Whitelist Auren!"
L.Filter_BlacklistAdd    					= "Buff/Debuff zur Blacklist hinzufügen"
L.Filter_BlacklistAddTip  					= "Eine Aura zu einer Blacklist hinzufügen, damit diese nicht mehr angezeigt werden. ID im Feld eingeben und Enter drücken, bis im Chatfenster eine Bestätigung erscheint."
L.Filter_BlacklistList						= "Aktuelle Blacklist Buffs/Debuffs:"
L.Filter_BlacklistListTip					= "Eine Liste mit allen Auras in der Blacklist. Um eine Aura zu löschen, die entsprechende Aura anklicken und auf entfernen klicken."

-- filters (prominent auras)
	L.Filter_ProminentHead						= "Prominente Aura -Aufgaben"
	L.Filter_ProminentHeadTip					= "Es können AURAs zugewiesen werden, um in bestimmten Rahmen für bestimmte Typen (Buff, Debuff usw.) für bestimmte Ziele (Spieler, Ziel, Gruppe usw.) angezeigt zu werden."
	L.Filter_ProminentOnlyPlayer				= "Nur Spieler"
	L.Filter_ProminentOnlyPlayerTip				= "Achten Sie nur auf die ausgewählte Aura, wenn sie vom Spieler geworfen werden."
	L.Filter_ProminentAddRecent					= "Fügen Sie kürzlich gesehene Aura hinzu:"
	L.Filter_ProminentAddRecentTip				= "Klicken Sie hier, um kürzlich erkannte AURAs in verschiedenen Kategorien anzuzeigen. Wenn Sie auf eine angezeigte Aura klicken, wird das prominente Konfigurationspanel mit diesen Daten ausgefüllt, sodass Sie sie einfach zu einem benutzerdefinierten Anzeigerahmen hinzufügen können."
	L.Filter_ProminentResetRecent				= "Setzen Sie aktuell zurück"
	L.Filter_ProminentResetRecentTip			= "Löschen Sie die Listendatenbank der kürzlich erkannten AURAs."
	L.Filter_ProminentModify					= "Ändern Sie vorhandene prominente Auren:"
	L.Filter_ProminentModifyTip					= "Klicken Sie hier, um eine Liste prominenter Auren anzuzeigen, die für jede Kategorie definiert wurden. Wenn Sie auf eine angezeigte Aura klicken, wird das prominente Konfigurationspanel mit diesen Daten ausgefüllt, sodass Sie diese ändern oder entfernen können."
	L.Filter_ProminentTypePB					= "Spielerbuffs"
	L.Filter_ProminentTypePD					= "Spielerdebuffs"
	L.Filter_ProminentTypeTB					= "Zielbuffs"
	L.Filter_ProminentTypeTD					= "Zieldebuffs"
	L.Filter_ProminentTypeAOE					= "Flächeneffekte"
	L.Filter_ProminentResetAll					= "Klare Menüs"
	L.Filter_ProminentResetAllTip				= "Löschen Sie alle Menüfelder auf dem prominenten Aura -Panel."
	L.Filter_ProminentTypeGB					= "Gruppenfans"
	L.Filter_ProminentTypeGD					= "Gruppendebuffs"
	L.Filter_ProminentAdd						= "Hinzufügen/Update"
	L.Filter_ProminentRemove					= "Entfernen"
	L.Filter_ProminentEdit						= "Ausgewählte Aura:"
	L.Filter_ProminentEditTip1					= "Wählen Sie eine Aura aus einer kürzlich gesehenen Liste aus, um sie hinzuzufügen, oder wählen Sie eine aus der vorhandenen Liste aus, um sie zu ändern."
	L.Filter_ProminentEditTip2					= "Beim Hinzufügen einer Aura müssen alle Auren im Spiel gescannt werden, um die internen ID -Nummern der Fähigkeit zu finden. Dies kann dazu führen, dass das Spiel beim Suchen einen Moment hängt."
	L.Filter_ProminentShowIDs					= "Zeigen Sie Aura-IDs"
	L.Filter_ProminentExpert					= "Experte"
	L.Filter_ProminentExpertTip					= "Ermöglichen Sie den manuellen Eintrag von Auren mit Namen oder ID und aktivieren Sie die Funktion aller Funktionen.\n\n|cffffffWARNUNG:|r Fügen Sie auf diese Weise keine Auras hinzu, die bereits in Srendarr (wenn ihre Kategorie einem Rahmen zugewiesen ist). Dies kann die Leistung kosten und die Dinge brechen. Fügen Sie diese stattdessen mit einem kürzlich gesehenen Menü zu einem benutzerdefinierten Rahmen hinzu. AURAs, die als falscher Typ eingegeben werden, werden automatisch entfernt, wenn Srendarr das Spiel mit unterschiedlichen Parametern sendet.\n\n|cffffffEXPERIMENTAL:|r Sie können hier die Aura -ID eingeben, die das Spiel und Srendarr nicht verfolgen. Es gibt jedoch keine Garantie dafür, dass sie funktionieren, da das Spiel manchmal keine Dauer und falsche Informationen für diese sendet. Es ist besser, den Support von Srendarr hinzuzufügen, um die Dinge manuell zu erzwingen."
	L.Filter_ProminentRemoveAll					= "Alles entfernen"
	L.Filter_ProminentRemoveAllTip				= "Entfernt alle prominenten Auren für das aktuelle aktive Profil. WARNUNG: Wenn Sie Konto -Wege -Einstellungen verwenden, werden alle prominenten AUras aus der Kontostand entfernt."
	L.Filter_ProminentRemoveConfirm				= "Entfernen Sie alle prominenten Auren für das aktuelle aktive Profil?"
	L.Filter_ProminentWaitForSearch				= "Suchen Sie in Arbeit, bitte warten Sie."

-- filters (group frame buffs)
	L.Filter_GroupBuffHeader					= "Gruppenbuffern"
	L.Filter_GroupBuffDesc						= "Diese Liste bestimmt, welche Buffs neben der Gruppe oder dem raid-Rahmen jedes Spielers angezeigt werden."
	L.Filter_GroupBuffAdd						= "Fügen Sie Whitelist Group Buff hinzu"
	L.Filter_GroupBuffAddTip					= "Um eine Buff Aura zum Verfolgen von Gruppenrahmen hinzuzufügen, müssen Sie ihren Namen genau so eingeben, wie er im Spiel angezeigt wird. Drücken Sie die Eingabetaste, um die Eingabe -Aura zur Liste hinzuzufügen.\n\nWarnung: Geben Sie hier keine Aura -ID ein, es sei denn, es wird normalerweise nicht vom Spiel verfolgt (geben Sie stattdessen den Aura -Namen ein). Auras, die von ID hier eingegeben wurden, verwenden das gefälschte Aura -System von Srendarr und kosten die Leistung, je mehr, die eingegeben werden."
	L.Filter_GroupBuffList						= "Aktueller Gruppenbankterweißer"
	L.Filter_GroupBuffListTip					= "Liste aller Buffs, die auf Gruppenrahmen angezeigt werden. Um vorhandene Auras zu entfernen, wählen Sie sie aus der Liste aus und verwenden Sie die folgende Schaltfläche Entfernen."
	L.Filter_GroupBuffsByDuration				= "Buffs durch Dauer ausschließen"
	L.Filter_GroupBuffsByDurationTip			= "Zeigen Sie nur Gruppenfans mit einer Dauer, die kürzer ist als unten ausgewählt (in Sekunden)."
	L.Filter_GroupBuffThreshold					= "Buff Dauer Schwelle"
	L.Filter_GroupBuffWhitelistOff				= "Verwenden Sie als Buff Blacklist"
	L.Filter_GroupBuffWhitelistOffTip			= "Verwandeln Sie die Gruppenbankte -Whitelist in eine schwarze Liste und zeigen Sie alle Auren mit einer Dauer mit Ausnahme dieser Eingaben hier an."
	L.Filter_GroupBuffOnlyPlayer				= "Nur Spielergruppen-Buffs"
	L.Filter_GroupBuffOnlyPlayerTip				= "Zeige nur Gruppenfans, die vom Spieler oder einem ihrer Haustiere gewirkt wurden."
	L.Filter_GroupBuffsEnabled					= "Gruppenfans aktivieren"
	L.Filter_GroupBuffsEnabledTip				= "Wenn Gruppenbuffs deaktiviert sind, werden überhaupt nicht angezeigt."

-- filters (group frame debuffs)
	L.Filter_GroupDebuffHeader					= "Gruppendebuff -Aufgaben"
	L.Filter_GroupDebuffDesc					= "Diese Liste bestimmt, welche Debuffs neben der Gruppe oder dem raid-Rahmen jedes Spielers zeigen werden."
	L.Filter_GroupDebuffAdd						= "Fügen Sie das Debuff der Whitelist -Gruppe hinzu"
	L.Filter_GroupDebuffAddTip					= "Um eine Debuff -Aura hinzuzufügen, um Gruppenrahmen zu verfolgen, müssen Sie ihren Namen genau so eingeben, wie er im Spiel angezeigt wird. Drücken Sie die Eingabetaste, um die Eingabe -Aura zur Liste hinzuzufügen.\n\nWarnung: Geben Sie hier keine Aura -ID ein, es sei denn, es wird normalerweise nicht vom Spiel verfolgt (geben Sie stattdessen den Aura -Namen ein). Auras, die von ID hier eingegeben wurden, verwenden das gefälschte Aura -System von Srendarr und kosten die Leistung, je mehr, die eingegeben werden."
	L.Filter_GroupDebuffList					= "Aktuelle Gruppen -Debuff Whitelist"
	L.Filter_GroupDebuffListTip					= "Liste aller Debuffs, die auf Gruppenrahmen angezeigt werden. Um vorhandene Auras zu entfernen, wählen Sie sie aus der Liste aus und verwenden Sie die folgende Schaltfläche Entfernen."
	L.Filter_GroupDebuffsByDuration				= "Debuffs durch Dauer ausschließen"
	L.Filter_GroupDebuffsByDurationTip			= "Zeigen Sie nur Gruppendebuffs mit einer Dauer kürzer als unten ausgewählt (in Sekunden)."
	L.Filter_GroupDebuffThreshold				= "Debuff Dauer Schwelle"
	L.Filter_GroupDebuffWhitelistOff			= "Verwenden Sie als Debuff Blacklist"
	L.Filter_GroupDebuffWhitelistOffTip			= "Verwandeln Sie die Gruppen -Debuff Whitelist in eine schwarze Liste und zeigen Sie alle Auren mit einer Dauer außer diesen Eingaben hier an."
	L.Filter_GroupDebuffsEnabled				= "Gruppendebuffs aktivieren"
	L.Filter_GroupDebuffsEnabledTip				= "Wenn es deaktiviert ist, werden Gruppendebuffs überhaupt nicht angezeigt."

-- filters (unit options)
	L.Filter_ESOPlus							= "Filter: ESO Plus"
	L.Filter_ESOPlusPlayerTip					= "Legen Sie fest, ob die Anzeige des ESO Plus-Status bei Ihnen selbst verhindert werden soll."
	L.Filter_ESOPlusTargetTip					= "Legen Sie fest, ob die Anzeige des ESO Plus-Status auf Ihrem Ziel verhindert werden soll."
L.Filter_Block								= "Filter: Blocken"
L.Filter_BlockPlayerTip						= "Deaktiviert deine Aura 'Blocken' wenn der Filter EIN ist."
L.Filter_BlockTargetTip						= "Deaktiviert die Ziel Aura 'Blocken' wenn der Filter EIN ist."
L.Filter_MundusBoon							= "Filter: Mundussteine"
L.Filter_MundusBoonPlayerTip				= "Deaktiviert deine 'Mundussteine' Aura/Auren wenn der Filter EIN ist."
L.Filter_MundusBoonTargetTip				= "Deaktiviert die Ziel 'Mundussteine' Aura/Auren wenn der Filter EIN ist."
L.Filter_Cyrodiil							= "Filter: Cyrodiil Boni"
L.Filter_CyrodiilPlayerTip					= "Deaktiviert deine 'Cyrodiil Auren' wenn der Filter EIN ist."
L.Filter_CyrodiilTargetTip					= "Deaktiviert die Ziel 'Cyrodiil Auren' wenn der Filter EIN ist."
L.Filter_Disguise							= "Filter: Verkleidungen"
L.Filter_DisguisePlayerTip					= "Deaktiviert deine 'Verkleidungs' Aura wenn der Filter EIN ist."
L.Filter_DisguiseTargeTtip					= "Deaktiviert die Ziel 'Verkleidungs' Aura wenn der FIlter EIN ist."
L.Filter_MajorEffects						= "Filter: Grössere Buffs"
L.Filter_MajorEffectsTargetTip				= "Deaktiviert die 'grossen Buffs' des Ziels wenn der Filter EIN ist."
L.Filter_MinorEffects						= "Filter: Kleinere Buffs"
L.Filter_MinorEffectsTargetTip				= "Deaktiviert die 'kleinen Buffs' des Ziels wenn der Filter EIN ist."
L.Filter_SoulSummons						= "Filter: Abklingzeit Seelenbeschwörung"
L.Filter_SoulSummonsPlayerTip				= "Deaktiviert deine 'Abklingzeit Seelenbeschwörung' Aura wenn der Filter EIN ist."
L.Filter_SoulSummonsTargetTip				= "Deaktiviert die Ziel 'Abklingzeit Seelenbeschwörung' Aura wenn der Filter EIN ist."
L.Filter_VampLycan							= "Filter: Vampir & Werwolf Verwandlung"
L.Filter_VampLycanPlayerTip					= "Deaktiviert deine 'Vampir & Werwolf Verwandlung' Aura wenn der Filter EIN ist."
L.Filter_VampLycanTargetTip					= "Deaktiviert die Ziel 'Vampir & Werwolf Verwandlung' Aura wenn der Filter EIN ist."
L.Filter_VampLycanBite						= "Filter: Vampir & Werwolf Biss Abklingzeit"
L.Filter_VampLycanBitePlayerTip				= "Deaktiviert deine 'Vampir & Werwolf Biss Abklingzeit' Aura wenn der Filter EIN ist."
L.Filter_VampLycanBiteTargetTip				= "Deaktiviert die Ziel 'Vampir & Werwolf Biss Abklingzeit' Aura wenn der Filter EIN ist."
	L.Filter_GroupDurationThreshold				= "Gruppenauras länger als diese Dauer (in Sekunden) werden nicht gezeigt."


-- ------------------------
-- SETTINGS: CAST BAR
-- ------------------------
L.CastBar_Enable							= "Aktiviere Zauber- & Kanalisierungs Leiste"
L.CastBar_EnableTip							= "Wenn diese Leiste aktiviert ist, zeigt es den Fortschritt der Fähigkeit bevor diese ausgelöst wird."
L.CastBar_Alpha								= "Transparenz"
L.CastBar_AlphaTip							= "Die Transparenz der Leiste solange diese aktiv ist.\nEin Wert von 100 = sichtbar, 0 = unsichtbar."
L.CastBar_Scale								= "Grösse"
L.CastBar_ScaleTip							= "Ein Wert von 100 entspricht der Ursprungsgrösse in Prozent."

-- cast bar (name)
L.CastBar_NameHeader						= "Fähigkeit Text"
L.CastBar_NameShow							= "Zeige Fähigkeitsnamen"

-- cast bar (timer)
L.CastBar_TimerHeader						= "Zauberzeit Text"
L.CastBar_TimerShow							= "Zeige Zauberzeit Text"

-- cast bar (bar)
L.CastBar_BarHeader							= "Zauberzeit Leiste"
L.CastBar_BarReverse						= "Countdown umkehren"
L.CastBar_BarReverseTip						= "Die Richtung des Countdowns kann seitlich umgekehrt werden."
L.CastBar_BarGloss							= "Glänzende Leiste"
L.CastBar_BarGlossTip						= "Legt fest, ob die Zeitleiste glänzend ist."
L.CastBar_BarColor							= "Leisten Farbe"
L.CastBar_BarColorTip						= "Legt die Farbe der Zeitleiste fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"


-- ------------------------
-- SETTINGS: DISPLAY FRAMES
-- ------------------------
L.DisplayFrame_Alpha						= "Fenster Transparenz"
L.DisplayFrame_AlphaTip						= "Definiert die Transparenz des Fensters./nEin Wert von 100 = sichtbar, 0 = unsichtbar."
L.DisplayFrame_Scale						= "Fenster Skalierung"
L.DisplayFrame_ScaleTip						= "Ein Wert von 100 entspricht dem Standard in Prozent."

-- display frames (aura)
L.DisplayFrame_AuraHeader					= "Buff/Debuff Anzeige"
L.DisplayFrame_Style						= "Buff/Debuff Aussehen"
L.DisplayFrame_StyleTip						= "Ändert den Stil wie die Auren angezeigt werden.\n\n|cffd100Komplett anzeigen|r - Zeigt den Fähigkeitsnamen, Symbol, Zeittext und Zeitleiste.\n\n|cffd100Nur Icon|r - Zeigt das Symbol und den Zeittext.\n\n|cffd100Nur Text & Timer|r - Zeit den Fähigkeitsname und eine kleinere Zeitleiste."
L.DisplayFrame_AuraCooldown					= "Zeit Animationen"
L.DisplayFrame_AuraCooldownTip				= "Zeige grüne Zeitanimationen über den Auren an. Es dient dazu, die Auren besser hervorzuheben. Passe die Farben anhand den Einstellungen an."
L.DisplayFrame_CooldownTimed				= "Farbe: Zeitliche Buffs & Debuffs"
	L.DisplayFrame_CooldownTimedB				= "Farbe: zeitliche Buffs"
	L.DisplayFrame_CooldownTimedD				= "Farbe: zeitliche Debuffs"
	L.DisplayFrame_CooldownTimedTip				= "Stellen Sie die Icon -Timer -Animationsfarbe für Auren mit einer festgelegten Dauer ein. Die linke Farbauswahl bestimmt die Buff -Farbe und die rechte Wahl für die Debuff -Farbe."
	L.DisplayFrame_CooldownTimedBTip			= "Stellen Sie die Animationsfarbe der Symbol Timer für Buffs mit einer festgelegten Dauer ein."
	L.DisplayFrame_CooldownTimedDTip			= "Stellen Sie die Icon Timer -Animationsfarbe für Debuffs mit einer festgelegten Dauer fest."
L.DisplayFrame_Growth						= "Buff/Debuff Erweiterungsrichtung"
L.DisplayFrame_GrowthTip					= "Zeigt die Richtung wo sich die Aura ausbreiten kann. Bei zentrierter Ausrichtung wächst diese beidseitig mit der gewünschten Sortierreihenfolge.\n\nDie Auren können nur nach oben und unten wachsen beim |cffd100Komplett anzeigen|r oder |cffd100Nur Text & Timer|r Stil."
L.DisplayFrame_Padding						= "Buff/Debuff Abstand"
L.DisplayFrame_PaddingTip					= "Abstand zwischen den Auren definieren."
L.DisplayFrame_Sort							= "Buff/Debuff Reihenfolge"
L.DisplayFrame_SortTip						= "Sortierreihenfolge der Auren festlegen. Falls nach der Dauer sortiert wird, werden die passiven oder die umschaltbaren Auren immer am Anfang angezeigt."
L.DisplayFrame_Highlight					= "Umschaltbare Buffs/Debuffs hervorheben"
L.DisplayFrame_HighlightTip					= "Die umschaltbaren Auren werden beim Symbol hervorgehoben.\n\nDieses Hervorheben funktioniert nicht beim |cffd100Nur Text & Timer|r Stil."
L.DisplayFrame_Tooltips						= "Buff/Debuff Tooltips mit Zaubernamen"
L.DisplayFrame_TooltipsTip					= "Wenn die Aura mit dem Mauszeiger überfahren wird, zeigt es weitere Informationen zur Fähigkeit an. Nur beim Stil |cffd100Nur Icon|r möglich."
L.DisplayFrame_TooltipsWarn					= "Die Tooltips müssen ausgeschalten werden, wenn man das Fenster verschieben will. Ansonsten wird das Fenster zum Verschieben geblockt."
L.DisplayFrame_AuraClassOverride			= "Aurafarben überschreiben"
L.DisplayFrame_AuraClassOverrideTip			= "Alle zeitlichen Effekte in dieser Leiste (ausgenommen sind umschaltebare und passive Buffs) können einheitlich dargestellt werden. Unabhängig von Buff, Debuff oder Flächeneffekt.\n\nBeispiel: Debuff und Flächeneffekt teilen sich die selbe Leiste, haben aber unterschiedliche Darstellungen. Hiermit kann die Priorität definiert werden."

-- display frames (group)
L.DisplayFrame_GRX							= "Horizontaler Versatz"
L.DisplayFrame_GRXTip						= "Korrigiere die Symbol Position vom Gruppen-/Raidfenster nach rechts und links."
L.DisplayFrame_GRY							= "Vertikaler Versatz"
L.DisplayFrame_GRYTip						= "Korrigiere die Symbol Position vom Gruppen-/Raidfenster nach oben und unten."

-- display frames (name)
L.DisplayFrame_NameHeader					= "Fähigkeitenanzeige"

-- display frames (timer)
L.DisplayFrame_TimerHeader					= "Zeittext"
L.DisplayFrame_TimerLocation				= "Position Zeitanzeige"
L.DisplayFrame_TimerLocationTip				= "Die Position der Zeitanzeige zum Symbol kann hier bestimmt werden. 'Versteckt' deaktiviert den Zeittext für diese Gruppe.\n\nEs sind nur bestimmte Einstellungen möglich, abhängig vom ausgewählten Stil."
L.DisplayFrame_TimerHMS						= "Zeige Minuten für Timer > 1 Stunde"
L.DisplayFrame_TimerHMSTip					= "Die Minuten werden bei Buffs über eine Stunde auch angezeigt. Alternativ steht: '1h+'"

-- display frames (bar)
L.DisplayFrame_BarHeader					= "Zeitleiste"
L.DisplayFrame_HideFullBar					= "Verstecke die Zeitleisten"
L.DisplayFrame_HideFullBarTip				= "Verstecke die Zeitleisten, sofern die Darstellung 'Komplett anzeigen' ausgewählt ist. Somit ist nur der Auraname sichtbar."
L.DisplayFrame_BarReverse					= "Countdown Richtung umkehren"
L.DisplayFrame_BarReverseTip				= "Die Richtung des Countdowns kann seitlich umgekehrt werden. Beim |cffd100Komplett anzeigen|r Stil wird das Aura Symbol auf der anderen Seite angezeigt."
L.DisplayFrame_BarGloss						= "Glänzende Leisten"
L.DisplayFrame_BarGlossTip					= "Legt fest, ob die Zeitleiste glänzend ist. Standard ist EIN"
L.DisplayFrame_BarBuffTimed					= "Farbe: zeitliche Buffs"
L.DisplayFrame_BarBuffTimedTip				= "Legt die Farben der zeitlichen Buffs fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"
L.DisplayFrame_BarBuffPassive				= "Farbe: passive Buffs"
L.DisplayFrame_BarBuffPassiveTip			= "Legt die Farben der passiven Buffs fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"
L.DisplayFrame_BarDebuffTimed				= "Farbe: zeitliche Debuffs"
L.DisplayFrame_BarDebuffTimedTip			= "Legt die Farben der zeitlichen Debuffs fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"
L.DisplayFrame_BarDebuffPassive				= "Farbe: passive Debuffs"
L.DisplayFrame_BarDebuffPassiveTip			= "Legt die Farben der passiven Debuffs fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"
L.DisplayFrame_BarToggled					= "Farbe: umschaltbare Auren"
L.DisplayFrame_BarToggledTip				= "Legt die Farben der umschaltbaren Auren fest. Die Farbe links definiert den Start (wenn es mit dem herunterzählen beginnt) und die zweite Farbe definiert das Ende (wenn der Buff ausläuft)"


-- ------------------------
-- SETTINGS: PROFILES
-- ------------------------
L.Profile_Desc								= "In diesem Bereich können Einstellungen bezüglich den Profilen vorgenommen werden.\n\nDamit man Profile accountweit nutzen kann (für alle Character die selben Einstellungen verwenden), bitte ganz am Schluss die 'Profilverwaltung aktivieren' und danach 'Auf alle Charakter verwenden' einschalten."
L.Profile_UseGlobal							= "Auf alle Charakter verwenden (kontoweit)"
L.Profile_AccountWide						="Kontoweit"
L.Profile_UseGlobalWarn						= "Beim Umstellen von lokalen zu globalen Einstellungen wird das Interface neu geladen."
L.Profile_Copy								= "Profil zum Kopieren auswählen"
L.Profile_CopyTip							= "Wähle ein Profil das zum aktuellen Charakter kopiert werden soll. Das aktive Profil wird entsprechend ersetzt oder neu als accountweite Einstellung gespeichert. Das aktuelle Profil wird 'unwiederruflich' überschrieben!"
	L.Profile_CopyButton1						= "Kopieren Sie das ganze Profil"
	L.Profile_CopyButton1Tip					= "Kopieren Sie das gesamte ausgewählte Profil, einschließlich aller prominenten Aura -Konfigurationen. Siehe unten für Alternative."
	L.Profile_CopyButton2						= "Basisprofil kopieren"
	L.Profile_CopyButton2Tip					= "Kopieren Sie alles aus dem ausgewählten Profil außer prominenten Aura -Konfigurationen. Nützlich zum Einrichten einer Basisanzeigekonfiguration ohne kopiert klassenspezifische Aura-Setup."
L.Profile_CopyButtonWarn					= "Beim Kopieren eines Profils wird das Interface neu geladen."
L.Profile_CopyCannotCopy					= "Es ist nicht möglich das ausgewählte Profil zu kopieren. Versuche es erneut oder wähle ein anderes Profil."
L.Profile_Delete							= "Profil zum Löschen auswählen"
L.Profile_DeleteTip							= "Wähle das zu löschende Profil aus. Wenn du dich später mit dem Charakter anmeldest und nicht das accountweite Profil ausgewählt hast, werden die ganzen Einstellung neu gesetzt.\n\nDas Löschen eines Profils kann nicht rückgängig gemacht werden!"
L.Profile_DeleteButton						= "Profil Löschen"
L.Profile_Guard								= "Profilverwaltung aktivieren"


-- ------------------------
-- Gear Cooldown Alt Names
-- ------------------------
L.YoungWasp									= "Junge Wespe"
L.MolagKenaHit1								= " 1. Hit"
L.VolatileAOE								= "Explosiven Begleiter Fähigkeit"


if (GetCVar('language.2') == "de") then -- overwrite GetLocale for new language
	for k, v in pairs(Srendarr:GetLocale()) do
		if (not L[k]) then -- no translation for this string, use default
			L[k] = v
		end
	end

	function Srendarr:GetLocale() -- set new locale return
		return L
	end
end
