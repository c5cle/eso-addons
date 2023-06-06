local L = {}

L.Description                            = "Zeigt Benachrichtigungen zu verschiedenen Ereignissen während einer Prüfung(Raid) an."

--------------------------------
----     General Stuff      ----
--------------------------------
L.Settings_General_Header                           = "Allgemein"
-- Settings
L.Settings_General_Bufffood_Reminder                = "Buff-Food-Hinweis"
L.Settings_General_Bufffood_Reminder_TT             = "Weist im Raid auf fehlendes oder auslaufendes Buff-Food hin (siehe unten)."
L.Settings_General_Bufffood_Reminder_Interval       = "Hinweisintervall"
L.Settings_General_Bufffood_Reminder_Interval_TT    = "Intervall für den Buff-Food-Hinweis in Sekunden, beginnend bei 10 verbleibenden Minuten."
L.Settings_General_Vanity_Pets                      = "Deaktiviere friedliche Begleiter im Raid"
L.Settings_General_Vanity_Pets_TT                   = "Deaktiviert friedliche Begleiter, wenn ein Raid gestartet wird. Sobald dieser beendet oder verlassen wurde, wird das Haustier wieder aktiviert."
L.Settings_General_No_Assistants                    = "Deaktiviert Gehilfen im Kampf"
L.Settings_General_No_Assistants_TT                 = "Gilt nur für Raids und verhindert NICHT, dass sie beschworen werden."
L.Settings_General_Center_Screen_Announce           = "Anzeigetyp"
L.Settings_General_Center_Screen_Announce_TT        = "Der Typ der verwendeten Anzeige."
L.Settings_General_NotificationsScale               = "Benachrichtigungsgröße"
L.Settings_General_NotificationsScale_TT            = "Die Größe der Benachrichtigungs- und der kleineren Countdownsanzeige."
L.Settings_General_UseDisplayName                   = "Verwende Benutzernamen(UserID)"
L.Settings_General_UseDisplayName_TT                = "Verwendet den Benutzernamen(UserID) eines Spielers in den Benachrichtigungen anstelle seines Charakternamens."
L.Settings_General_Unlock_Status_Icon               = "Statusanzeige entsperren"
L.Settings_General_Unlock_Status_Icon_TT            = "Bei Aktivierung wird die Statusanzeige auf dem Bildschirm angezeigt und kann verschoben werden."
L.Settings_General_Default_Sound                    = "Standardton"
L.Settings_General_Default_Sound_TT                 = "Der Standardton für eine Benachrichtigung."
-- Choices
L.Settings_General_Choices_Off                      = "Aus"
L.Settings_General_Choices_Full                     = "Komplett"
L.Settings_General_Choices_Normal                   = "Normal"
L.Settings_General_Choices_Minimal                  = "Minimal"
L.Settings_General_Choices_Self                     = "Selbst"
L.Settings_General_Choices_Near                     = "Nahe"
L.Settings_General_Choices_All                      = "Alle"
L.Settings_General_Choices_Always                   = "Immer"
L.Settings_General_Choices_Other                    = "Andere"
L.Settings_General_Choices_Inverted                 = "Invertiert"
L.Settings_General_Choices_Small_Announcement       = "Wenig (veraltet)"
L.Settings_General_Choices_Large_Announcement       = "Viel (veraltet)"
L.Settings_General_Choices_Major_Announcement       = "Alles (veraltet)"
L.Settings_General_Choices_1s                       = "1.0s"
L.Settings_General_Choices_500ms                    = "0.5s"
L.Settings_General_Choices_200ms                    = "0.2s"
L.Settings_General_Choices_Custom_Announcement      = "Benutzerdefiniert"
-- Alerts
L.Alerts_General_No_Bufffood                        = "Du hast kein Bufffood!"
L.Alerts_General_Bufffood_Minutes                   = "Dein Bufffood: '<<1>>' läuft in |cbd0000<<2>>|r Minuten aus!"
-- Bindings
L.Binding_ToggleUltimateExchange                    = "Ulti-Austausch an/aus"


--------------------------------
----    Ultimate Exchange   ----
--------------------------------
L.Settings_Ultimate_Header                           = "Ulti Austausch (beta)"
L.Settings_Ultimate_Description                      = "Mit dieser Funktion kannst du deine Ulti an Gruppenmitglieder senden, damit diese sehen können, wie weit sie geladen ist. Es verwendet die Kosten basierend auf deine Kostenreduzierungen, durch mögliche Sets oder passive Fähigkeiten."
-- Settings
L.Settings_Ultimate_Enabled                          = "Aktiv"
L.Settings_Ultimate_Enabled_TT                       = "Aktiviert das Teilen und Empfangen von ultimativen Werten. Außerhalb von Raids ist es immer deaktiviert."
L.Settings_Ultimate_Hidden                           = "Versteckt"
L.Settings_Ultimate_Hidden_TT                        = "Blendet das Ulti Fenster aus, deaktiviert die Funktion selbst jedoch nicht."
L.Settings_Ultimate_UseColor                         = "Verwende Farben"
L.Settings_Ultimate_UseColor_TT                      = "Verleiht der Ulti eines Mitspielers eine Farbe, die auf den Schwellenwerten von 80 und 100 Prozent basiert."
L.Settings_Ultimate_UseDisplayName                   = "Verwende Benutzernamen(UserID)"
L.Settings_Ultimate_UseDisplayName_TT                = "Zeigt den Benutzernamen(UserID) im Ulti Fenster anstelle des Charakternamen an."
L.Settings_Ultimate_ShowHealers                      = "Zeige Heiler"
L.Settings_Ultimate_ShowHealers_TT                   = "Zeigt die Ulti für Gruppenmitglieder mit der Rolle Heiler."
L.Settings_Ultimate_ShowTanks                        = "Zeige Tank"
L.Settings_Ultimate_ShowTanks_TT                     = "Zeigt die Ulti für Gruppenmitglieder mit der Rolle Tank."
L.Settings_Ultimate_ShowDps                          = "Zeige DD"
L.Settings_Ultimate_ShowDps_TT                       = "Zeigt die Ulti für Gruppenmitglieder mit der Rolle DD."
L.Settings_Ultimate_TargetUlti                       = "Ultimative Fähigkeit"
L.Settings_Ultimate_TargetUlti_TT                    = "Welche ultimative Fähigkeit verwendet wird für den Prozentwert, den andere sehen."
L.Settings_Ultimate_OverrideCost                     = "Kosten überschreiben"
L.Settings_Ultimate_OverrideCost_TT                  = "Verwende diesen Wert, wenn Ulti Kosten an andere gesendet werden. Wird der Wert auf 0 gesetzt, wird das Überschreiben deaktiviert."


--------------------------------
----        Profiles        ----
--------------------------------
L.Settings_Profile_Header                            = "Profile"
L.Settings_Profile_Description                       = "Hier können Profileinstellungen verwaltet werden, einschließlich der Option, ein Accountweites Profil zu aktivieren, das die gleichen Einstellungen auf ALLE Charaktere dieses Kontos anwendet. Aufgrund der Eigenschaft dieser Optionen muss die Verwaltung zunächst über das Kontrollkästchen am unteren Rand des Panels aktiviert werden."
L.Settings_Profile_UseGlobal                         = "Accountweites Profil verwenden"
L.Settings_Profile_UseGlobal_Warning                 = "Durch das Wechseln zwischen lokalen und globalen Profilen wird die Benutzeroberfläche neu geladen."
L.Settings_Profile_Copy                              = "Wähle ein zu kopierendes Profil"
L.Settings_Profile_Copy_TT                           = "Wählen Sie ein Profil aus, um seine Einstellungen in das derzeit aktive Profil zu kopieren. Das aktive Profil ist entweder für den derzeitig angemeldeten Charakter oder für das accountweite Profil, falls aktiviert. Die vorhandenen Profileinstellungen werden dauerhaft überschrieben.\n\nDies kann nicht rückgängig gemacht werden!"
L.Settings_Profile_CopyButton                        = "Profil kopieren"
L.Settings_Profile_CopyButton_Warning                = "Durch Kopieren eines Profils wird die Benutzeroberfläche neu geladen."
L.Settings_Profile_CopyCannotCopy                    = "Das ausgewählte Profil kann nicht kopiert werden. Bitte versuche es erneut oder wähle ein anderes Profil."
L.Settings_Profile_Delete                            = "Wählen ein zu löschendes Profil"
L.Settings_Profile_Delete_TT                         = "Wähle ein Profil aus, um dessen Einstellungen aus der Datenbank zu löschen. Wenn dieser Charakter später angemeldet wird und kein accountweites Profil verwendet wird, werden die Standardeinstellungen verwendet.\n\nDas Löschen eines Profils ist permanent!"
L.Settings_Profile_DeleteButton                      = "Profil löschen"
L.Settings_Profile_Guard                             = "Profilverwaltung aktivieren"


--------------------------------
----       Countdowns       ----
--------------------------------
L.Settings_Countdown_Header                          = "Countdowns"
L.Settings_Countdown_Description                     = "Ändere das Aussehen und Verhalten der Countdowns."
L.Settings_Countdown_TimerScale                      = "Timergröße (veraltet)"
L.Settings_Countdown_TimerScale_TT                   = "Die Größe der Timeranzeige."
L.Settings_Countdown_TextScale                       = "Schriftgröße (veraltet)"
L.Settings_Countdown_TextScale_TT                    = "Die Schriftgröße der Anzeige."
L.Settings_Countdown_TimerPrecise                    = "Timerpräzision"
L.Settings_Countdown_TimerPrecise_TT                    = "Stellt die Timergenauigkeit für den Countdown ein."
L.Settings_Countdown_UseColors                       = "Verwende Farben"
L.Settings_Countdown_UseColors_TT                    = "Wenn diese Option aktiviert ist, werden die Farben Gelb/Orange/Rot für den Countdown bis zum Erreichen von null verwendet."


--------------------------------
----          Trials        ----
--------------------------------
L.Settings_Trials_Header                            = "Raids"
L.Settings_Trials_Description                       = "Hier können die Benachrichtigungen für jeden Raid konfiguriert werden. Alle haben einen konfigurierbaren Sound und viele von ihnen unterstützen nicht nur dich, sondern auch deine Gruppenmitglieder."


--------------------------------
----     Hel Ra Citadel     ----
--------------------------------
L.Settings_HelRa_Header                             = "Zitadelle von Hel Ra"
-- Settings
L.Settings_HelRa_Yokeda_Meteor                      = "Yokeda: Meteor"
L.Settings_HelRa_Yokeda_Meteor_TT                   = "Warnt dich, wenn der Yokeda mit einem Meteor angreifen wird."
L.Settings_HelRa_Warrior_StoneForm                  = "Krieger: Stein Form"
L.Settings_HelRa_Warrior_StoneForm_TT               = "Warnt dich, wenn du und/oder andere vom Krieger in Stein verwandelt werden."
L.Settings_HelRa_Warrior_ShieldThrow                = "Krieger: Schildwurf"
L.Settings_HelRa_Warrior_ShieldThrow_TT             = "Warnt dich, wenn der Krieger seinen Schild werfen will."
--Alerts
L.Alerts_HelRa_Yokeda_Meteor                        = "Eingehender |cFF0000Meteor|r aud dir. Block!"
L.Alerts_HelRa_Yokeda_Meteor_Other                  = "Eingehender |cFF0000Meteor|r auf |c595959<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_StoneForm                    = "Eingehende |c595959Stein Form|r auf dir. Nutze keine Synergien!"
L.Alerts_HelRa_Warrior_StoneForm_Other              = "Eingehende |c595959Stein Form|r auf |cFF0000<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_ShieldThrow                  = "Eingehender |cFF0000Schildwurf|r. "


--------------------------------
----   Aetherian Archives   ----
--------------------------------
L.Settings_Archive_Header                           = "Ätherisches Archiv"
-- Settings
L.Settings_Archive_StormAtro_ImpendingStorm         = "Sturm Atro: Aufziehender Sturm"
L.Settings_Archive_StormAtro_ImpendingStorm_TT      = "Warnt dich, wenn der Sturm-Atronach im Begriff ist, seinen großen Blitz-AoE durchzuführen."
L.Settings_Archive_StormAtro_LightningStorm         = "Sturm Atro: Gewittersturm"
L.Settings_Archive_StormAtro_LightningStorm_TT      = "Warnt dich, wenn der Sturm-Atronach seinen Gewittersturm ruft, vor dem du dich schützen musst."
L.Settings_Archive_StoneAtro_BoulderStorm           = "Stein Atro: Steinschlag"
L.Settings_Archive_StoneAtro_BoulderStorm_TT        = "Warnt dich, wenn der Stein-Atronach mehrere Steine auf Spieler wirft."
L.Settings_Archive_StoneAtro_BigQuake               = "Stein Atro: Großes Erdbeben"
L.Settings_Archive_StoneAtro_BigQuake_TT            = "Warnt dich, wenn der Stein-Atronach auf den Boden stampft."
L.Settings_Archive_Overcharge                       = "Mobs: Überladung"
L.Settings_Archive_Overcharge_TT                    = "Warnt dich, wenn ein Überlader dich mit seiner Überladung-Fähigkeit angreift."
L.Settings_Archive_Call_Lightning                   = "Mobs: Blitz Herbeirufen"
L.Settings_Archive_Call_Lightning_TT                = "Warnt dich, wenn ein Überlader dich mit seiner Blitz Herbeirufen-Fähigkeit angreift."
-- Alerts
L.Alerts_Archive_StormAtro_ImpendingStorm           = "Eingehender |cFF0000Aufziehender Sturm|r!"
L.Alerts_Archive_StormAtro_LightningStorm           = "Eingehender |cfef92eGewittersturm|r! Geh in das Licht!"
L.Alerts_Archive_StoneAtro_BoulderStorm             = "Eingehender |cFF0000Steinschlag|r! Blocken vermeidet Rückstoß!"
L.Alerts_Archive_StoneAtro_BigQuake                 = "Eingehendes |cFF0000Großes Erdbeben|r!"
L.Alerts_Archive_Overcharge                         = "Eingehende |c46edffÜberladung|r auf dir."
L.Alerts_Archive_Overcharge_Other                   = "Eingehende |c46edffÜberladung|r auf |cFF0000<<!aC:1>>|r."
L.Alerts_Archive_Call_Lightning                     = "Eingehender |c46edffBlitz Herbeirufen|r auf dir. Bleib in Bewegung!"
L.Alerts_Archive_Call_Lightning_Other               = "Eingehender |c46edffBlitz Herbeirufen|r auf |cFF0000<<!aC:1>>|r."


--------------------------------
----    Sanctum Ophidia     ----
--------------------------------
L.Settings_Sanctum_Header                           = "Sanctum Ophidia"
-- Settings
L.Settings_Sanctum_Magicka_Detonation               = "Schlange: Magicka Detonation"
L.Settings_Sanctum_Magicka_Detonation_TT            = "Warnt dich, wenn du den Magicka-Detonationsdebuff während des Schlangenkampfs erhälst."
L.Settings_Sanctum_Serpent_Poison                   = "Schlange: Gift Phase"
L.Settings_Sanctum_Serpent_Poison_TT                = "Warnungen für die Giftphase während des Schlangenkampfes."
L.Settings_Sanctum_Serpent_World_Shaper             = "Schlange: Weltenformer (Hard Mode)"
L.Settings_Sanctum_Serpent_World_Shaper_TT          = "Warnt dich, wenn die Schlange dem Weltenformer-Angriff startet, zählt bis zur Auslösung herunter."
L.Settings_Sanctum_Mantikora_Spear                  = "Mantikor: Speer"
L.Settings_Sanctum_Mantikora_Spear_TT               = "Warnt dich, wenn du den Mantikora-Speer erhältst."
L.Settings_Sanctum_Mantikora_Quake                  = "Mantikor: Beben"
L.Settings_Sanctum_Mantikora_Quake_TT               = "Warnt, wenn du die drei Beben oder Runen vom Mantikor erhältst."
L.Settings_Sanctum_Troll_Boulder                    = "Mobs: Troll Felswurf"
L.Settings_Sanctum_Troll_Boulder_TT                 = "Warnt dich, wenn sich ein Troll darauf vorbereitet, einen Stein auf dich zu werfen."
L.Settings_Sanctum_Troll_Poison                     = "Mobs: Troll Gift"
L.Settings_Sanctum_Troll_Poison_TT                  = "Warnt dich, wenn sich ein Troll darauf vorbereitet, das ansteckende Gift auf dich zu werfen."
L.Settings_Sanctum_Overcharge                       = "Mobs: Überladung"
L.Settings_Sanctum_Overcharge_TT                    = "Warnt dich, wenn ein Überlader dich mit seiner Überladung-Fähigkeit angreift."
L.Settings_Sanctum_Call_Lightning                   = "Mobs: Blitz Herbeirufen"
L.Settings_Sanctum_Call_Lightning_TT                = "Warnt dich, wenn ein Überlader dich mit seiner Blitz Herbeirufen-fähigkeit angreift."
-- Alerts
L.Alerts_Sanctum_Serpent_Poison0                    = "Eingehende |c39942eGift Phase|r! Zusammen stehen!"
L.Alerts_Sanctum_Serpent_Poison1                    = "Eingehende |c39942eGift Phase|r! Gefolgt von |ccc0000Lamien|r."
L.Alerts_Sanctum_Serpent_Poison2                    = "Eingehende |c39942eGift Phase|r! Gefolgt von |c009933Mantikor|r." --left
L.Alerts_Sanctum_Serpent_Poison3                    = "Eingehende |c39942eGift Phase|r! Gefolgt von |c009933Mantikor|r." --right
L.Alerts_Sanctum_Serpent_Poison4                    = "Eingehende |c39942eGift Phase|r! Gefolgt von |cff33ccSchilde|r."
L.Alerts_Sanctum_Serpent_Poison5                    = "Finale |c39942eGift Phase|r!"
L.Alerts_Sanctum_Serpent_World_Shaper               = "|c00c832Weltenformer|r in"
L.Alerts_Sanctum_Magicka_Detonation                 = "|c234afaMagicka Detonation|r! Verbrenne deine Magicka!"
L.Alerts_Sanctum_Mantikora_Spear                    = "Mantikor |ccde846Speer|r auf dir! Lauf raus!"
L.Alerts_Sanctum_Mantikora_Spear_Other              = "Mantikor |ccde846Speer|r auf <<!aC:1>>! Lauf raus!"
L.Alerts_Sanctum_Mantikora_Quake                    = "Mantikor |ccde846Beben|r unter dir! Lauf weg!"
L.Alerts_Sanctum_Troll_Poison                       = "Eingehendes |c66ff33Troll Gift|r. Verbreite es nicht!"
L.Alerts_Sanctum_Troll_Poison_Other                 = "Eingehendes |c66ff33Troll Gift|r auf |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Troll_Boulder                      = "Eingehender |c595959Felswurf|r. Ausweichen!"
L.Alerts_Sanctum_Troll_Boulder_Other                = "Eingehender |c595959Felswurf|r auf |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Overcharge                         = "Eingehende |c46edffÜberladung|r auf dir."
L.Alerts_Sanctum_Overcharge_Other                   = "Eingehende |c46edffÜberladung|r auf |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Call_Lightning                     = "Eingehender |c46edffBlitz Herbeirufen|r auf dir. Bleib in Bewegung!"
L.Alerts_Sanctum_Call_Lightning_Other               = "Eingehender |c46edffBlitz Herbeirufen|r auf |cFF0000<<!aC:1>>|r."


--------------------------------
----    Maelstrom Arena     ----
--------------------------------
L.Settings_Maelstrom_Header                         = "Mahlstrom Arena"
-- Settings
L.Settings_Maelstrom_Stage7_Poison                  = "Arena 7: Gift"
L.Settings_Maelstrom_Stage7_Poison_TT               = "Warnt dich, wenn du in Arena 7 (Gewölbe des Anstoßes) vergiftet wurdest."
L.Settings_Maelstrom_Stage9_Synergy                 = "Arena 9: Spektrale Ladung (Synergie)"
L.Settings_Maelstrom_Stage9_Synergy_TT              = "Erinnert dich, wenn du die Synergie in Arena 9 (Theater der Verzweiflung) erhalten hast, nachdem du 3 (goldene) Geister aufgesammelt hast."
-- Alerts
L.Alerts_Maelstrom_Stage7_Poison                    = "|c39942eVergiftet|r! Verwende einen der beiden Bereiche zum reinigen!"
L.Alerts_Maelstrom_Stage9_Synergy                   = "|c23afe7Spektrale Ladung|r bereit! Nutze Synergie!"


--------------------------------
----     Maw of Lorkhaj     ----
--------------------------------
L.Settings_MawLorkhaj_Header                        = "Schlund von Lorkhaj"
-- Settings
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj            = "Zhaj'hassa: Hand von Lorkhaj"
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT         = "Warnt dich, wenn der Debuff Hand von Lorkhaj auf dich übergreift."
L.Settings_MawLorkhaj_Zhaj_Glyphs                   = "Zhaj'hassa: Reinigungsplattformen (beta)"
L.Settings_MawLorkhaj_Zhaj_Glyphs_TT                = "Zeigt ein Fenster mit allen Reinigungsplattformen mit ihrem Status und ihrer Zeit bis zum Wiederauftreten an."
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert            = "       - Invertierte Ansicht"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT         = "Invertiert Reinigungsplattformen."
L.Settings_MawLorkhaj_Twin_Aspects                  = "Falsche Mondzwillinge: Aspekte"
L.Settings_MawLorkhaj_Twin_Aspects_TT               = "Warnt, wenn du den Mond- oder Schattenaspekt bei den Falschen Mondzwillingen erhältst.\n\n  Komplett warnt, wenn du einen Aspekt erhältst, wenn du mit der Konvertierung in einen Aspekt beginnst und wenn die Konvertierung abgeschlossen ist.\n  Normal warnt, wenn du einen Aspekt erhältst, und wenn du konvertierst.\n  Minimal benachrichtigt dich nur, wenn du konvertierst."
L.Settings_MawLorkhaj_Twin_Aspects_Status           = "       - Zeige Status"
L.Settings_MawLorkhaj_Twin_Aspects_Status_TT        = "Zeigt deinen aktuellen Aspekt in der Statusanzeige während des Bosskampfs an."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void         = "Rakkhat: Instabile Leere"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT      = "Warnt vor der Instabilen Leere Fähigkeit bei Rakkhat."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown = "       - Countdown"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT = "Wenn diese Option aktiviert ist, wird ein Countdown anstelle einer einfachen Benachrichtigung für instabile Leere angezeigt."
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings        = "Rakkhat: Dreschende Schwingen"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT     = "Alarmiert, wenn Rakkhat seine Fähigkeit Dreschende Schwingen einsetzt, die dich zurückwirft."
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls         = "Rakkhat: hereinbrechende Dunkelheit"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT      = "Warnt, wenn Rakkhat seine Fähigkeit hereinbrechende Dunkelheit einsetzt und die Decke herunterfällt."
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage           = "Rakkhat: dunkles Sperrfeuer"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT        = "Alarmiert, wenn Rakkhat seine dunkles Sperrfeuer-Fähigkeit auf den Tank anwendet."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1         = "Rakkhat: Mondbastion erhalten"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT      = "Zeigt an, wann ein Spieler den Segen von der leuchtenden Plattform erhält."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2         = "Rakkhat: Mondbastion verloren"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT      = "Zeigt an, wann ein Spieler den Segen von der leuchtenden Plattform verliert."
L.Settings_MawLorkhaj_ShatteringStrike              = "Mobs: Zerschlagender Schlag"
L.Settings_MawLorkhaj_ShatteringStrike_TT           = "Erhalte eine Warnung, wenn eine Dro-m'Athra Wilde im Begriff ist, einen zerstörerischen Angriff auszuführen."
L.Settings_MawLorkhaj_Shattered                     = "Mobs: Rüstung zerschmettert"
L.Settings_MawLorkhaj_Shattered_TT                  = "Erhalte eine Warnung, wenn deine Rüstung zerschmettert ist."
L.Settings_MawLorkhaj_MarkedForDeath                = "Mobs: Todesmarkierung (Panther)"
L.Settings_MawLorkhaj_MarkedForDeath_TT             = "Warnt, wenn die Panther eines Dro-m'Athra-Schreckenspirschers dich für den Tod markieren-"
L.Settings_MawLorkhaj_Suneater_Eclipse              = "Mobs: Sonnenfresser Eklipsenfeld (negate)"
L.Settings_MawLorkhaj_Suneater_Eclipse_TT           = "Erhalte eine Warnung, wenn das Eklipsenfeld auf dich zielt."
-- Alerts
L.Alerts_MawLorkhaj_Zhaj_GripOfLorkhaj              = "Warnung! |c000055Hand von Lorkhaj!|r Reinige dich!"
L.Alerts_MawLorkhaj_Lunar_Aspect                    = "|cFEFF7FMond|r Aspekt erhalten!"
L.Alerts_MawLorkhaj_Shadow_Aspect                   = "|c000055Schatten|r Aspekt erhalten!"
L.Alerts_MawLorkhaj_Lunar_Conversion                = "Wechsel zu |cFEFF7FMond|r Aspekt!"
L.Alerts_MawLorkhaj_Shadow_Conversion               = "Wechsel zu |c000055Schatten|r Aspekt!"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void           = "Warnung! |c000055Instabile Leere|r unter dir"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void_Other     = "Warnung! |c000055Instabile Leere|r unter |cFF0000<<!aC:1>>|r"
L.Alerts_MawLorkhaj_Rakkhat_ThreshingWings          = "Eingehend |cFF0000Dreschende Schwingen|r! Block!"
L.Alerts_MawLorkhaj_Rakkhat_DarknessFalls           = "Eingehend |cFF0000hereinbrechende Dunkelheit|r!"
L.Alerts_MawLorkhaj_Rakkhat_DarkBarrage             = "Eingehend |cFF0000dunkles Sperrfeuer|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1           = "Du hast |cFEFF7FMondbastion|r erhalten"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1_Other     = "|cFF0000<<!aC:1>>|r erhielt |cFEFF7FMondbastion|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2           = "Du hast |cFEFF7FMondbastion|r verloren"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2_Other     = "|cFF0000<<!aC:1>>|r hat |cFEFF7FMondbastion|r verloren"
L.Alerts_MawLorkhaj_Suneater_Eclipse                = "Eingehendes |cFF0000Eklipsenfeld|r auf dir."
L.Alerts_MawLorkhaj_Suneater_Eclipse_Other          = "Eingehendes |cFF0000Eklipsenfeld|r auf |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_ShatteringStrike                = "Eingehender |c000055Zerschlagender Schlag|r auf dir."
L.Alerts_MawLorkhaj_ShatteringStrike_Other          = "Eingehender |c000055Zerschlagender Schlag|r auf |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_Shattered                       = "Deine |c595959Rüstungr|r wurde |cff0000Zerschlagen|r."
L.Alerts_MawLorkhaj_MarkedForDeath                  = "Warnung! |c000055Panther|r verfolgen dich!"


--------------------------------
----    Dragonstar Arena    ----
--------------------------------
L.Settings_Dragonstar_Header                        = "Drachenstern-Arena"
-- Settings
L.Settings_Dragonstar_General_Taking_Aim            = "Allgemein: Ziel Erfassen"
L.Settings_Dragonstar_General_Taking_Aim_TT         = "Warnt dich, wenn du von der Fähigkeit Ziel Erfassen als Ziel ausgewählt wirst."
L.Settings_Dragonstar_General_Crystal_Blast         = "Allgemein: Kristallexplosion"
L.Settings_Dragonstar_General_Crystal_Blast_TT      = "Warnt dich, wenn du von der Fähigkeit Kristallexplosion als Ziel ausgewählt wirst."
L.Settings_Dragonstar_Arena2_Crushing_Shock         = "Arena 2: Zermalmender Schlag"
L.Settings_Dragonstar_Arena2_Crushing_Shock_TT      = "Warnt dich, wenn du in der Eis Arena von der Fähigkeit Zermalmender Schlag als Ziel ausgewählt wirst."
L.Settings_Dragonstar_Arena6_Drain_Resource         = "Arena 6: Ressource Entziehen"
L.Settings_Dragonstar_Arena6_Drain_Resource_TT      = "Warnt dich, wenn du vom Giftpfeil Ressourcen Entziehen in der Bosmer-Arena angegriffen wirst."
L.Settings_Dragonstar_Arena7_Unstable_Core          = "Arena 7: Instbiles Zentrum (Eclipse)"
L.Settings_Dragonstar_Arena7_Unstable_Core_TT       = "Warnt dich, wenn der Templerboss in der Opferarena ein instabiles Zentrum (Eclipse) auf dich gelegt hat."
L.Settings_Dragonstar_Arena8_Ice_Charge             = "Arena 8: Eisladung"
L.Settings_Dragonstar_Arena8_Ice_Charge_TT          = "Warnt dich, wenn ein Eis Centurion kurz vor seinem Eisangriff steht."
L.Settings_Dragonstar_Arena8_Fire_Charge            = "Arena 8: Feuerladung"
L.Settings_Dragonstar_Arena8_Fire_Charge_TT         = "Warnt dich, wenn ein Feuer Centurion kurz vor seinem Feuerangriff steht."
-- Alerts
L.Alerts_Dragonstar_General_Taking_Aim              = "|cFF6600Ziel Erfassen|r auf dir!"
L.Alerts_Dragonstar_General_Crystal_Blast           = "|c990099Kristallexplosion|r auf dir!"
L.Alerts_Dragonstar_Arena2_Crushing_Shock           = "Eingehender |c3366EEZermalmender Schlag|r! Block!"
L.Alerts_Dragonstar_Arena6_Drain_Resource           = "Eingehende |c00CC00Ressource Entziehen|r! Dodge!"
L.Alerts_Dragonstar_Arena6_Drain_Resource_Other     = "Eingehende |c00CC00Ressource Entziehen|r auf |cFF0000<<!aC:1>>|r."
L.Alerts_Dragonstar_Arena7_Unstable_Core            = "|cDDDD33Instbiles Zentrum|r! Freibrechen!"
L.Alerts_Dragonstar_Arena8_Ice_Charge               = "Eingehende |c6699FFEisladung|r auf dir! Unterbrechen oder ausweichen!"
L.Alerts_Dragonstar_Arena8_Ice_Charge_Other         = "|c6699FFEisladung|r wird auf |cFF0000<<!aC:1>>|r angewandt. Unterbrechen!"
L.Alerts_Dragonstar_Arena8_Fire_Charge              = "Eingehende |cFF3113Feuerladung|r auf dir! Unterbrechen oder ausweichen!"
L.Alerts_Dragonstar_Arena8_Fire_Charge_Other        = "|c6699FFeuerladung|r wird auf |cFF0000<<!aC:1>>|r angewandt. Unterbrechen!"



--------------------------------
---- Halls Of Fabrication   ----
--------------------------------
L.Settings_HallsFab_Header                          = "Hallen der Fertigung"
-- Settings
L.Settings_HallsFab_Taking_Aim                      = "Allgemein: Ziel Erfassen"
L.Settings_HallsFab_Taking_Aim_TT                   = "Warnt dich, wenn du von der Fähigkeit Ziel Erfassen als Ziel ausgewählt wirst."
L.Settings_HallsFab_Taking_Aim_Dynamic              = "       - Countdown"
L.Settings_HallsFab_Taking_Aim_Dynamic_TT           = "Wenn diese Option aktiviert ist, wird ein Countdown anstelle einer einfachen Benachrichtigung für Ziel Erfassen angezeigt."
L.Settings_HallsFab_Taking_Aim_Duration             = "       - Countdown Dauer"
L.Settings_HallsFab_Taking_Aim_Duration_TT          = "Die Dauer des Countdowns in Millisekunden."
L.Settings_HallsFab_Draining_Ballista               = "Allgemein: entziehende Balliste"
L.Settings_HallsFab_Draining_Ballista_TT            = "Warnt dich, wenn eine Sphere unterbrochen werden muss."
L.Settings_HallsFab_Conduit_Strike                  = "Allgemein: Leitender Schlag"
L.Settings_HallsFab_Conduit_Strike_TT               = "Warnt dich, wenn eine Leitender Schlag kommt."
L.Settings_HallsFab_Power_Leech                     = "Allgemein: Leitender Schlag Kraftentzug"
L.Settings_HallsFab_Power_Leech_TT                  = "Warnt dich, wenn du von einem Leitenden Schlag betäubt wurdest und dich frei brechen musst."
L.Settings_HallsFab_Venom_Injection                 = "Abfänger: Giftinjektion"
L.Settings_HallsFab_Venom_Injection_TT              = "Zeigt eine Statusanzeige an, wenn du während der Abfänger-Bosse von Giftinjektion betroffen bist."
L.Settings_HallsFab_Conduit_Spawn                   = "Perfektioniertes Faktotum: Blitzspeer Spawn"
L.Settings_HallsFab_Conduit_Spawn_TT                = "Warnt dich, wenn ein Blitzspeer beim Perfektionierten Faktotum Boss kommt."
L.Settings_HallsFab_Conduit_Drain                   = "Perfektioniertes Faktotum: Blitzspeer Entzug"
L.Settings_HallsFab_Conduit_Drain_TT                = "Warnt dich, wenn ein Blitzspeer beim Perfektionierten Faktotum Boss dir deine Ressourcen raubt."
L.Settings_HallsFab_Scalded_Debuff                  = "Perfektioniertes Faktotum: Verbrühter Debuff"
L.Settings_HallsFab_Scalded_Debuff_TT               = "Zeigt ein kleines Statussymbol an, das die Zeit bis zum Verschwinden und die Höhe des Heilungs-Debuffs angibt."
L.Settings_HallsFab_Overcharge_Aura                 = "Komitee: Überladende Aura"
L.Settings_HallsFab_Overcharge_Aura_TT              = "Warnt dich, wenn der Rückforderer seine Aura überlädt."
L.Settings_HallsFab_Overpower_Auras                 = "Komitee: Überwältigende Auras"
L.Settings_HallsFab_Overpower_Auras_TT              = "Warnt dich, wenn die Tanks die Komiteebosse tauschen müssen."
L.Settings_HallsFab_Overpower_Auras_Duration        = "       - Countdown Dauer"
L.Settings_HallsFab_Overpower_Auras_Duration_TT     = "Die Dauer des Countdowns in Millisekunden."
L.Settings_HallsFab_Overpower_Auras_Dynamic         = "       - Dynamischer Countdown"
L.Settings_HallsFab_Overpower_Auras_Dynamic_TT      = "Aktiviert, wird versucht, den Countdown zu stoppen, sobald die Tanks die Bosse getauscht haben."
L.Settings_HallsFab_Fabricant_Spawn                 = "Komitee: Zerstörter Faktotum Spawn"
L.Settings_HallsFab_Fabricant_Spawn_TT              = "Warnt dich, wenn zerstörte Fatktoten erscheinen."
L.Settings_HallsFab_Catastrophic_Discharge          = "Komitee: Katastrophale Entladung"
L.Settings_HallsFab_Catastrophic_Discharge_TT       = "Warnt dich, wenn ein zerstörtes Faktotum anfängt, auf dich loszustürmen."
L.Settings_HallsFab_Reclaim_Achieve                 = "Komitee: Geplante Überalterung Erfolg gescheitert"
L.Settings_HallsFab_Reclaim_Achieve_TT              = "Warnt dich, wenn ein zerstörtes Faktotum den Rückforderer erreicht und der Erfolg scheitert."
-- Alerts
L.Alerts_HallsFab_Taking_Aim                        = "|cFF6600Ziel Erfassen|r auf dir!"
L.Alerts_HallsFab_Taking_Aim_Other                  = "|cFF6600Ziel Erfassen|r auf |cFF0000<<!aC:1>>|r!"
L.Alerts_HallsFab_Taking_Aim_Simple                 = "|cFF6600Ziel Erfassen|r"
L.Alerts_HallsFab_Conduit_Spawn                     = "Ein Blitzspeer erscheint."
L.Alerts_HallsFab_Conduit_Drain                     = "Ein Blitspeer enzieht dir Ressourcen!"
L.Alerts_HallsFab_Conduit_Drain_Other               = "Ein Blitspeer enzieht |cFF0000<<!aC:1>>|r Ressourcen!"
L.Alerts_HallsFab_Conduit_Strike                    = "Eingehender |cFF0000Leitender Schlag|r. Block!"
L.Alerts_HallsFab_Draining_Ballista                 = "|cFFC000Entziehende Balliste|r auf dir! Block oder unterbrich!"
L.Alerts_HallsFab_Draining_Ballista_Other           = "|cFFC000Entziehende Balliste|r auf |cFF0000<<!aC:1>>|r! Unterbrich!"
L.Alerts_HallsFab_Power_Leech                       = "|c6600FFKraftenzug|r! Frei Brechen!"
L.Alerts_HallsFab_Overcharge_Aura                   = "|c3366EEÜberladende Aura|r auf Reclaimer."
L.Alerts_HallsFab_Overpower_Auras                   = "|cFF0000Aura Countdown!|r"
L.Alerts_HallsFab_Catastrophic_Discharge            = "|cFF0000Katastrophale Entladung|r auf dir! Block!"
L.Alerts_HallsFab_Fabricant_Spawn                   = "|cFFC000Ruined Fabricant Spawn|r"
L.Alerts_HallsFab_Reclaim_Achieve                   = "|cDCD822[Geplante Überalterung]|r Erfolg |cFF0000Gescheitert|r"



--------------------------------
----   Asylum Sanctorium    ----
--------------------------------
L.Settings_Asylum_Header                         = "Anstalt Sanctorium"
-- Settings
L.Settings_Asylum_Defiling_Blast                 = "Heiliger Llothis: Entweihende Farbexplosion"
L.Settings_Asylum_Defiling_Blast_TT              = "Warnt dich, wenn Llothis dich oder andere mit seinem Kegelangriff angreift."
L.Settings_Asylum_Soul_Stained_Corruption        = "Heiliger Llothis: Seelenfleckenverderbnis"
L.Settings_Asylum_Soul_Stained_Corruption_TT     = "Warnt dich, wenn Llothis Spieler mit seinem Angriff angreift, welcher unterbrochen werden sollte."
L.Settings_Asylum_Teleport_Strike                = "Heiliger Felms: Teleportationsschlag"
L.Settings_Asylum_Teleport_Strike_TT             = "Warnt dich, wenn Felms sich zu dir teleportiert."
L.Settings_Asylum_Exhaustive_Charges             = "Heiliger Olms: Erschöpfende Ladungen"
L.Settings_Asylum_Exhaustive_Charges_TT          = "Warnt dich, wenn Olms im Begriff ist, seinen Angriff zu starten, der drei große Blitzkreise fallen lässt."
L.Settings_Asylum_Storm_The_Heavens              = "Heiliger Olms: Erstürmung des Himmels"
L.Settings_Asylum_Storm_The_Heavens_TT           = "Warnt Sie, wenn Olms in die Luft geht und eine große Anzahl kleinerer Blitzkreise erzeugt."
L.Settings_Asylum_Gusts_Of_Steam                 = "Heiliger Olms: Dampfschwaden"
L.Settings_Asylum_Gusts_Of_Steam_TT              = "Warnt dich, wenn Olms im Begriff ist, vor und zurück zu springen, und die nächste Phase des Kampfes signalisiert."
L.Settings_Asylum_Gusts_Of_Steam_Slider          = "       - Prozentsatz vor dem Sprung"
L.Settings_Asylum_Gusts_Of_Steam_Slider_TT       = "Zeige die Benachrichtigung ein paar Prozent bevor er springt."
L.Settings_Asylum_Protector_Spawn                = "Heiliger Olms: Geschütz Spawn"
L.Settings_Asylum_Protector_Spawn_TT             = "Warnt dich, wenn eine Sphere erscheint."
L.Settings_Asylum_Trial_By_Fire                  = "Heiliger Olms: Feuertaufe"
L.Settings_Asylum_Trial_By_Fire_TT               = "Warnt dich, wenn Olms in der Executephase Feuer werfen wird."
-- Alerts
L.Alerts_Asylum_Defiling_Blast                   = "Warnung! |c00cc00Entweihende Explosion|r auf dir"
L.Alerts_Asylum_Defiling_Blast_Other             = "Warnung! |c00cc00Entweihende Explosion|r auf |cFF0000<<!aC:1>>|r"
L.Alerts_Asylum_Soul_Stained_Corruption          = "Eingehende |c3366EESeelenfleckenverderbnis|r. Unterbrechen!"
L.Alerts_Asylum_Teleport_Strike                  = "|cFF3366Teleportationsschlag|r auf dir"
L.Alerts_Asylum_Teleport_Strike_Other            = "|cFF3366Teleportationsschlag|r auf |cFF0000<<!aC:1>>|r"
L.Alerts_Asylum_Exhaustive_Charges               = "Eingehende |cFF0000Erschöpfende Ladungen|r"
L.Alerts_Asylum_Storm_The_Heavens                = "Eingehende |cFF0000Erstürmung des Himmels|r! Kite!"
L.Alerts_Asylum_Gusts_Of_Steam                   = "Eingehende |cFF9900Dampfschwaden|r! Verstecken!"
L.Alerts_Asylum_Pre_Gusts_Of_Steam               = "|cFF0000<<1>>%|r vor |cFF9900Sprung|r! Bereit zu Laufen!"
L.Alerts_Asylum_Trial_By_Fire                    = "Eingehendes |cFF5500Feuer|r!"
L.Alerts_Asylum_Protector_Spawn                  = "|c0000FFGeschütz|r erscheint!"
L.Alerts_Asylum_Protector_Active                 = "|c0000FFGeschütz|r aktiv!"



--------------------------------
------   CLOUDREST         -----
--------------------------------
L.Settings_Cloudrest_Header                     = "Wolkenruh"
-- Settings
L.Settings_Cloudrest_Olorime_Spears             = "Allgemein: Olorime Speer"
L.Settings_Cloudrest_Olorime_Spears_TT          = "Warnt dich, wenn Speere da sind und jemand sie abholen muss."
L.Settings_Cloudrest_Shadow_Realm_Cast          = "Allgemein: Portal Spawn"
L.Settings_Cloudrest_Shadow_Realm_Cast_TT       = "Warnt dich, wenn das Portal für eine Gruppe in die Schattenwelt erstellt wurde."
L.Settings_Cloudrest_Hoarfrost                  = "Faralielle: Raureif"
L.Settings_Cloudrest_Hoarfrost_TT               = "Warnt dich, wenn du den Raureif-Debuff hast, der zum Entfernen synergetisiert werden muss."
L.Settings_Cloudrest_Hoarfrost_Countdown        = "       - Nutze Countdown"
L.Settings_Cloudrest_Hoarfrost_Countdown_TT     = "Verwenden einen Countdown, um anzuzeigen, wann du ihn ablegen kannst."
L.Settings_Cloudrest_Hoarfrost_Shed             = "Faralielle: Raureif Frei"
L.Settings_Cloudrest_Hoarfrost_Shed_TT          = "Warnt dich, wenn der Raureif-Debuff von einem anderen Spieler abgelegt wurde und abgeholt werden muss."
L.Settings_Cloudrest_Heavy_Attack               = "Mini Boss: Schwerer Angriff"
L.Settings_Cloudrest_Heavy_Attack_TT            = "Warnt dich, wenn der Blitz(schockierendes Schmettern), Feuer(verbrühendes Trennen) oder Frost(verwüstender Schlag) Miniboss einen schweren Angriff ausführt."
L.Settings_Cloudrest_Chilling_Comet             = "Faralielle: Unterkühlender Komet"
L.Settings_Cloudrest_Chilling_Comet_TT          = "Warnt dich, wenn der Debuff Unterkühlender Komet auf dich angewendet wird, der geblockt werden muss und sich nicht mit einem anderen Spieler überschneiden darf, der denselben Debuff vor der Explosion hat."
L.Settings_Cloudrest_Roaring_Flare              = "Siroria: Lodernde Fackel"
L.Settings_Cloudrest_Roaring_Flare_TT           = "Warnt, wenn du oder eines deiner Teammitglieder den Debuff Lodernde Fackel haben, für den mindestens 3 Teammitglieder zusammenstehen müssen, um diesen Debuff zu annullieren."
L.Settings_Cloudrest_Track_Roaring_Flare        = "       - Verfolge Lodernde Fackel"
L.Settings_Cloudrest_Track_Roaring_Flare_TT     = "Zeigt die Richtung des Spielers mit dem Debuff."
L.Settings_Cloudrest_Voltaic_Overload           = "Belanaril: Voltaische Überladung"
L.Settings_Cloudrest_Voltaic_Overload_TT        = "Warnt dich, dass du den Debuff Voltaische Überladung bekommst. Nachdem du ihn erhalten hast, darf 10 Sekunden lang nicht die Waffenleiste gewechselt werden."
L.Settings_Cloudrest_Nocturnals_Favor           = "Z'Maja: Nocturnals Gunst"
L.Settings_Cloudrest_Nocturnals_Favor_TT        = "Warnt dich, wenn Z'Maja dich anvisiert und ihren schweren Angriff ausführt."
L.Settings_Cloudrest_Baneful_Barb               = "Yaghra Monstrosität: Unheilvolle Dornen"
L.Settings_Cloudrest_Baneful_Barb_TT            = "Warnt dich, wenn Yaghra Monstrosität dich als Ziel gewählt hat und mit Unheilvolle Dornen angreift."
L.Settings_Cloudrest_Break_Amulet               = "Z'Maja: Nur wichtige Mechaniken im Execute"
L.Settings_Cloudrest_Break_Amulet_TT            = "Deaktiviere Spheren, Tentakel Benachrichtigungen im Execute"
L.Settings_Cloudrest_Sum_Shadow_Beads           = "Z'Maja: Spheren"
L.Settings_Cloudrest_Sum_Shadow_Beads_TT        = "Warnt wenn Spheren erscheinen."
L.Settings_Cloudrest_Tentacle_Spawn             = "Z'Maja: Tentakel(Creeper) Spawn"
L.Settings_Cloudrest_Tentacle_Spawn_TT          = "Warnt wenn Creeper erscheinen."
L.Settings_Cloudrest_Crushing_Darkness          = "Z'Maja: Erdrückende Dunkelheit"
L.Settings_Cloudrest_Crushing_Darkness_TT       = "Warnt dich, wenn der AoE dir folgt und herumgeführt werden muss."
L.Settings_Cloudrest_Malicious_Strike           = "Z'Maja: Boshafter Schlag"
L.Settings_Cloudrest_Malicious_Strike_TT        = "Warnt, wenn Kugeln zerstört werden und geblockt oder ausgewichen werden muss."

-- Alerts
L.Alerts_Cloudrest_Olorime_Spears               = "|cffd000Speer|r isr da! (<<1>>)"
L.Alerts_Cloudrest_Hoarfrost0                   = "|c00ddffRaureif|r auf dir!"
L.Alerts_Cloudrest_Hoarfrost1                   = "|cff0000Letzter|r |c00ddffRaureif|r auf dir!"
L.Alerts_Cloudrest_Hoarfrost_Other0             = "|c00ddffRaureif|r auf |cff0000<<!aC:1>>|r"
L.Alerts_Cloudrest_Hoarfrost_Other1             = "|cff0000Letzter|r |c00ddffRaureif|r auf |cff0000<<!aC:1>>|r"
L.Alerts_Cloudrest_Hoarfrost_Countdown0         = "Lege |c00ddffRaureif|r ab in..."
L.Alerts_Cloudrest_Hoarfrost_Countdown1         = "Lege |cff0000Letzten|r |c00ddffRaureif|r ab in..."
L.Alerts_Cloudrest_Hoarfrost_Syn                = "|cff0000Synergie|r für Raureif!"
L.Alerts_Cloudrest_Hoarfrost_Shed               = "|c00ddffRaureif|r abgelegt."
L.Alerts_Cloudrest_Hoarfrost_Shed_Other         = "|c00ddffRaureif|r abgelegt von |cff0000<<!aC:1>>|r"
L.Alerts_Cloudrest_Heavy_Attack                 = "|c0bf29eSchwerer Angriff|r auf dir!"
L.Alerts_Cloudrest_Heavy_Attack_Other           = "|c0bf29eSchwerer Angriff|r auf |cff0000<<!aC:1>>|r"
L.Alerts_Cloudrest_Baneful_Barb                 = "|cff0000Unheilvolle Dornen|r. Ausweichrolle!"
L.Alerts_Cloudrest_Baneful_Barb_Other           = "|cff0000Unheilvolle Dornen|r auf |cff0000<<!aC:1>>|r"
L.Alerts_Cloudrest_Chilling_Comet               = "|cff0000Unterkühlender Komet|r auf dir. Block!"
L.Alerts_Cloudrest_Roaring_Flare                = "|cff7700Lodernde Fackel|r auf dir"
L.Alerts_Cloudrest_Roaring_Flare_2              = "|cff0000<<!aC:1>>|r |t100%:100%:Esoui/Art/Buttons/large_leftarrow_up.dds|t |cff7700Lodernde Fackel|r |t100%:100%:Esoui/Art/Buttons/large_rightarrow_up.dds|t |cff0000<<!aC:2>>|r"
L.Alerts_Cloudrest_Roaring_Flare_Other          = "|cff7700Lodernde Fackel|r auf |cff0000<<!aC:1>>|r. Zusammen!"
L.Alerts_Cloudrest_Voltaic_Current              = "Eingehende |c55b4d4Voltaische Überladung|r auf dir in"
L.Alerts_Cloudrest_Voltaic_Overload             = "|c4d61c1Voltaische Überladung|r auf dir! Waffenwechseln!"
L.Alerts_Cloudrest_Voltaic_Overload_Cd          = "|c4d61c1Voltaische Überladung|r. Nicht wechseln!"
L.Alerts_Cloudrest_Shadow_Realm_Cast            = "|cab82ffPortal|r Spawn (<<1>>)"
L.Alerts_Cloudrest_Tentacle_Spawn               = "|c00a86bCreeper|r Spawn"
L.Alerts_Cloudrest_Sum_Shadow_Beads             = "|cab82ffSpheren|r werden erscheinen"
L.Alerts_Cloudrest_Nocturnals_Favor             = "|cff0000Nocturnals Gunst|r auf dir!"
L.Alerts_Cloudrest_Crushing_Darkness            = "|cfc0c66Erdrückende Dunkelheit|r auf dir. Kite!"
L.Alerts_Cloudrest_Malicious_Strike             = "|cff0000Boshafter Schlag|r auf dir. Block!"

--------------------------------
------   SUNSPIRE          -----
--------------------------------
L.Settings_Sunspire_Header          = "Sonnspitz"
-- Settings
L.Settings_Sunspire_Chilling_Comet        = "Allgemein: Unterkühlender Komet"
L.Settings_Sunspire_Chilling_Comet_TT     = "Warnt dich, wenn der Unterkühlende Komet auf dich zielt. Verlasse die Gruppe, block und überlappe ihn nicht mit einem anderen Spieler, der ebenfalls einen Unterkühlender Komet hat. Er zielt auf 2 Spieler gleichzeitig ab."
L.Settings_Sunspire_Sweeping_Breath       = "Nahviintaas: Mitreißender Odem"
L.Settings_Sunspire_Sweeping_Breath_TT    = "Warnt dich vor Nahviintass Feueratem. Der Atem geht von einer Seite der Arena aus und geht auf die andere Seite über, wobei jeder Spieler in der Arena Schaden nimmt. Jeder Spieler muss diesen Angriff blocken oder ausweichen."
L.Settings_Sunspire_Molten_Meteor         = "Nahviintaas: Geschmolzener Meteor"
L.Settings_Sunspire_Molten_Meteor_TT      = "Warnt dich, wenn der geschmolzene Meteor auf dich zielt. Gehe an den Rand der Arena, blocke und überlappe nicht mit einem anderen Spieler, der ebenfalls einen geschmolzenen Meteor hat. Geschmolzener Meteor Greift 3 Spieler gleichzeitig an."
L.Settings_Sunspire_Focus_Fire            = "Yolnahkriin: Fokussiertes Feuer"
L.Settings_Sunspire_Focus_Fire_TT         = "Warnt, wenn ein Gruppenmitglied von Fokussiertes Feuer als Ziel ausgewählt wird. Beim Feuer müssen Gruppenmitglieder zusammen stehen, um den Schaden zu teilen. Danach wird es einen anhaltenden Debuff geben, der den durch das nächste Fokusfeuer erlittenen Schaden erhöht. Aufgrund dieses Debuffs sollten Sie in zwei separate Gruppen stehen."
L.Settings_Sunspire_Breath                = "Allgemein: Feuer/Frost/Sengender Atem"
L.Settings_Sunspire_Breath_TT             = "Warnt dich, wenn der kanalisierte Kegel von einem Boss auf dich gerichtet ist und schweren Schaden verursacht."
L.Settings_Sunspire_Cataclism             = "Yolnahkriin: Kataklysmus"
L.Settings_Sunspire_Cataclism_TT          = "Warnt dich, wenn der Boss mitten in der Arena Feuer spuckt. Jeder muss an den Rand gehen und die Adds töten."
L.Settings_Sunspire_Frozen_Tomb           = "Lokkestiiz: Gefrorenes Grab"
L.Settings_Sunspire_Frozen_Tomb_TT        = "Warnt dich, wenn ein Gefrorenes Grab erscheint. Ein Spieler muss in das Grab gehen, was ihn einfriert und ihm mit der Zeit Schaden zufügt. Du musst dann geheilt werden, um freigelassen zu werden. Benötigt 3 Spieler, um die Gräber aufgrund eines Debuffs zu erobern, jedes Mal eine andere Person."
L.Settings_Sunspire_Thrash                = "Nahviintaas: Dreschen"
L.Settings_Sunspire_Thrash_TT             = "Warnt dich, wenn der Boss dabei ist, seinen Kopf durch die Gruppe zu schwingen und alle zurückzustößt. Diesem muss blockiert oder ausgewichen werden."
L.Settings_Sunspire_Mark_For_Death        = "Nahviintaas: Todesmal"
L.Settings_Sunspire_Mark_For_Death_TT     = "Warnt dich, wenn du für den Tod markiert bist. Fügt im Laufe der Zeit schweren Schaden zu und entferne alle deine Resistenzen vollständig."
L.Settings_Sunspire_Time_Breach           = "Nahviintaas: Zeitriss"
L.Settings_Sunspire_Time_Breach_TT        = "Warnt dich, wenn das Portal in die Zeitverschiebung geöffnet ist."
L.Settings_Sunspire_Negate_Field          = "Ewiger Diener: Negationsfeld"
L.Settings_Sunspire_Negate_Field_TT       = "Warnt dich, wenn dich das Negationsfeld in der Zeitverschiebung angreift."
L.Settings_Sunspire_Shock_Bolt            = "Ewiger Diener: Schockender Stoß"
L.Settings_Sunspire_Shock_Bolt_TT         = "Warnt dich, wenn der Ewige Diener dich mit seinem Kegelangriff anvisiert und du blocken oder ausweichen musst."
L.Settings_Sunspire_Apocalypse            = "Ewiger Diener: Verschiebungsapokalypse"
L.Settings_Sunspire_Apocalypse_TT         = "Warnt dich, wenn der Ewige Diener seine Verschiebungsapokalypse startet und unterbrochen werden muss."


-- Alerts
L.Alerts_Sunspire_Chilling_Comet          = "|c00ddffUnterkühlender Komet|r auf dir. Block!"
L.Alerts_Sunspire_Chilling_Comet_Other    = "|c00ddffUnterkühlender Komet|r auf |cff0000<<!aC:1>>|r"
L.Alerts_Sunspire_Sweeping_Breath         = "|cff0000Mitreißender Odem|r! Block!"
L.Alerts_Sunspire_Molten_Meteor           = "|c00ddffGeschmolzener Meteor|r auf dir! Geh raus!"
L.Alerts_Sunspire_Molten_Meteor_Other     = "|c00ddffGeschmolzener Meteor|r auf <<!aC:1>>|r"
L.Alerts_Sunspire_Focus_Fire              = "|cff7700Fokussiertes Feuer|r auf dir in"
L.Alerts_Sunspire_Focus_Fire_Other        = "|cff7700Fokussiertes Feuer|r auf |cff0000<<!aC:1>>|r in"
L.Alerts_Sunspire_Atronach_Zap            = "|cff7700Atronachen|r erscheinen in"
L.Alerts_Sunspire_Frost_Atronach          = "|cff7700Frost Atronach|r ist da!"
L.Alerts_Sunspire_Breath                  = "|cffff00<<1>>|r auf dir!"
L.Alerts_Sunspire_Breath_Other            = "|cffff00<<1>>|r auf |cff0000<<!aC:2>>|r"
L.Alerts_Sunspire_Cataclism               = "|cff3300Kataklysmus|r endet in"
L.Alerts_Sunspire_Frozen_Tomb             = "|c00ddffGefrorenes Grab|r (<<1>>)"
L.Alerts_Sunspire_Thrash                  = "Eingehendes |cff0000Dreschen|r! Block!"
L.Alerts_Sunspire_Mark_For_Death          = "Todesmal auf dir"
L.Alerts_Sunspire_Mark_For_Death_Other    = "Todesmal auf |cff0000<<!aC:1>>|r"
L.Alerts_Sunspire_Time_Breach_Countdown   = "|c81cc00Zeitriss|r in "
L.Alerts_Sunspire_Negate_Field            = "|c53c4c9Negationsfeld|r auf dir!"
L.Alerts_Sunspire_Negate_Field_Others     = "|c53c4c9Negationsfeld|r auf <<!aC:1>>!"
L.Alerts_Sunspire_Shock_Bolt              = "Eingehender |c00ddffSchockender Stoß|r auf dir!"
L.Alerts_Sunspire_Shock_Bolt_Others       = "Eingehender |c00ddffSchockender Stoß|r auf <<!aC:1>>!"
L.Alerts_Sunspire_Apocalypse              = "Eingehende |cffff00Verschiebungsapokalypse|r!"
L.Alerts_Sunspire_Apocalypse_Ends         = "|cffff00Verschiebungsapokalypse|r endet in"

--------------------------------
----       Debugging        ----
--------------------------------
L.Settings_Debug_Header                  = "Debug"
L.Settings_Debug                         = "Debug einschalten"
L.Settings_Debug_TT                      = "Aktiviert Debugausgabe im Chatfenster"
L.Settings_Debug_DevMode                 = "Dev Modus"
L.Settings_Debug_DevMode_TT              = "Wenn diese Option aktiviert ist, werden bestimmte Warnmeldungen aktiviert, die möglicherweise nicht vollständig funktionieren, zeitlich nicht übereinstimmen oder noch nicht vollständig getestet wurden. Im Allgemeinen sollten sie keine Fehler in der Benutzeroberfläche verursachen, es wird jedoch dennoch empfohlen, eine Art Fehlermeldungsabfang-Addon zu verwenden."
L.Settings_Debug_DevMode_Warning         = "Benötigt Dev Modus"

L.Settings_Debug_Tracker_Header          = "Debug Tracker"
L.Settings_Debug_Tracker_Description     = "Dies ist eine Debug-Funktion, mit der potenzielle Mechaniken während eines Raids aufgespürt und ausgegeben werden können, indem Informationen zu Kampfereignissen und -effekten in den Chat gedruckt werden. Aufgrund der potenziell großen Ausgabemenge gibt es einige Optionen, mit denen Sie verhindern können, dass Ihr Chatfenster überfüllt wird."
L.Settings_Debug_Tracker_Enabled         = "Aktivieren"
L.Settings_Debug_Tracker_SpamControl     = "Spam Kontrolle"
L.Settings_Debug_Tracker_SpamControl_TT  = "Damit wird jede Fähigkeit/jeder Effekt nur einmal pro Aktionstyp ausgegeben. Die Liste der bekannten Fähigkeiten dieser Sitzung kann mit \"/rndebug clear\" gelöscht werden."
L.Settings_Debug_Tracker_MyEnemyOnly     = "Nur meine Gegner"
L.Settings_Debug_Tracker_MyEnemyOnly_TT  = "Wenn diese Option aktiviert ist, werden ALLE Ausgaben auf Fähigkeiten/Effekte beschränkt, die auf den Spieler abzielen und NICHT vom Spieler oder der Gruppe stammen. Nützlich, wenn Sie nach einer bestimmten Sache suchen und die Spam-Kontrolle nicht aktivieren möchten."

--TODO: get rid of this ugly, bulky localization method
for k, v in pairs(L) do
    local string = "RAIDNOTIFIER_" .. string.upper(k)
    ZO_CreateStringId(string, v)
end

if (GetCVar('language.2') == 'de') then
        local MissingL = {}
        for k, v in pairs(RaidNotifier:GetLocale()) do
                if (not L[k]) then
                        table.insert(MissingL, k)
                        L[k] = v
                end
        end
        function RaidNotifier:GetLocale()
                return L
        end
        -- for debugging
        function RaidNotifier:MissingLocale()
                df("Missing strings for '%s'", GetCVar('language.2'))
                d(MissingL)
        end
end
