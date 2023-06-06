local L = {}

L.Description                            = "Affiche des annonces à l'écran sur différents évènements pendant les raids."

--------------------------------
----     General Stuff      ----
--------------------------------
L.Settings_General_Header                           = "Général"
-- Settings
L.Settings_General_Bufffood_Reminder                = "Rappel Nourriture"
L.Settings_General_Bufffood_Reminder_TT             = "Alerte lorsque vous n'avez pas de nourriture lors d'une épreuve ou quand elle est sur le point d'expirer (voir ci-dessous)"
L.Settings_General_Bufffood_Reminder_Interval       = "Intervalle de Rappel"
L.Settings_General_Bufffood_Reminder_Interval_TT    = "Intervalle pour le rappel de la nourriture, en secondes, quand il ne reste plus que 10 minutes."
L.Settings_General_Vanity_Pets                      = "Désactive les Familiers durant les épreuves"
L.Settings_General_Vanity_Pets_TT                   = "Désactive les Familiers Pacifiques quand l'épreuve commence. Lorsque vous terminez ou quittez une épreuve il se réactivera."
L.Settings_General_No_Assistants                    = "Désactive les Assistants lors des combats"
L.Settings_General_No_Assistants_TT                 = "Ne s'applique que durant les épreuves et n'empêche PAS de les invoquer."
L.Settings_General_Center_Screen_Announce           = "Type des Annonces"
L.Settings_General_Center_Screen_Announce_TT        = "Le type à utiliser pour l'affichage des annonces."
L.Settings_General_UseDisplayName                   = "Utilise le Nom D'Utilisateur"
L.Settings_General_UseDisplayName_TT                = "Utilise le nom d'utilisateur dans les annonces au lieu du nom de personnage."
L.Settings_General_Unlock_Status_Icon               = "Déverouille l'Icone de Statut"
L.Settings_General_Unlock_Status_Icon_TT            = "Quand activé, l'icone de statut sera affiché à l'écran et pourra être déplacé."
L.Settings_General_Default_Sound                    = "Son par Défaut"
L.Settings_General_Default_Sound_TT                 = "Le son par défaut à utiliser pour les notifications."
-- Choices
L.Settings_General_Choices_Off                      = "Non"
L.Settings_General_Choices_Full                     = "Complet"
L.Settings_General_Choices_Normal                   = "Normal"
L.Settings_General_Choices_Minimal                  = "Minimal"
L.Settings_General_Choices_Self                     = "Soi-Même"
L.Settings_General_Choices_Near                     = "Proche"
L.Settings_General_Choices_All                      = "Tous"
L.Settings_General_Choices_Always                   = "Toujours"
L.Settings_General_Choices_Other                    = "Autre"
L.Settings_General_Choices_Inverted                 = "Inversé"
L.Settings_General_Choices_Small_Announcement       = "Petit (obsolete)"
L.Settings_General_Choices_Large_Announcement       = "Grand (obsolete)"
L.Settings_General_Choices_Major_Announcement       = "Majeur (obsolete)"
L.Settings_General_Choices_Custom_Announcement      = "Personnalisé"
-- Alerts
L.Alerts_General_No_Bufffood                        = "Vous n'avez pas de Nourriture!"
L.Alerts_General_Bufffood_Minutes                   = "Votre '<<1>>' nourriture se termine dans |cbd0000<<2>>|r minutes!"
-- Bindings
L.Binding_ToggleUltimateExchange                    = "Bascule l'Ultime"


--------------------------------
----    Ultimate Exchange   ----
--------------------------------
L.Settings_Ultimate_Header                           = "Échange d'Ultimes (beta)"
L.Settings_Ultimate_Description                      = "Cette fonctionnalité vous permet d'envoyer votre nombre de points d'ultimes à vos coéquipiers afin qu'ils puissent voir quand est ce que vous pourrez l'utiliser. Il utilise votre coût en fonction de toutes les réductions de coûts d'ensembles ou de passifs."
-- Settings
L.Settings_Ultimate_Enabled                          = "Activé"
L.Settings_Ultimate_Enabled_TT                       = "Permet le partage et la réception des valeurs d'ultimes. Il est toujours désactivé en dehors des essais."
L.Settings_Ultimate_Hidden                           = "Masqué"
L.Settings_Ultimate_Hidden_TT                        = "Masque la fenêtre d'affichage d'ultime mais ne désactive pas la fonction elle-même."
L.Settings_Ultimate_UseColor                         = "Utilise des Couleurs"
L.Settings_Ultimate_UseColor_TT                      = "Affiche une couleur sur les ultimes en fonction des seuils à 80 et 100 pourcent."
L.Settings_Ultimate_UseDisplayName                   = "Affiche le Nom d'Utilisateur"
L.Settings_Ultimate_UseDisplayName_TT                = "Affiche le nom d'utilisateur dans la fenêtre d'ultime au lieu du nom de personnage."
L.Settings_Ultimate_ShowHealers                      = "Montre les Soigneurs"
L.Settings_Ultimate_ShowHealers_TT                   = "Montre l'ultime des membres du groupe avec le rôle Soins."
L.Settings_Ultimate_ShowTanks                        = "Montre les Tanks"
L.Settings_Ultimate_ShowTanks_TT                     = "Montre l'ultime des membres du groupe avec le rôle Tank."
L.Settings_Ultimate_ShowDps                          = "Montre les DPS"
L.Settings_Ultimate_ShowDps_TT                       = "Montre l'ultime des membres du groupe avec le rôle Dégâts."
L.Settings_Ultimate_TargetUlti                       = "Compétence Ultime"
L.Settings_Ultimate_TargetUlti_TT                    = "Quelle compétence ultime à utiliser pour la valeur du pourcentage observée par les autres."
L.Settings_Ultimate_OverrideCost                     = "Passer Outre le Coût"
L.Settings_Ultimate_OverrideCost_TT                  = "Utilise cette valeur lorsque vous envoyez votre coût d'ultime aux autres. La mettre à 0 désactivera la suppression du coût réel."


--------------------------------
----        Profiles        ----
--------------------------------
L.Settings_Profile_Header                            = "Profils"
L.Settings_Profile_Description                       = "Les paramètres de profils peuvent-être gérés ici, y compris l'option permettant d'activer un profil global de compte qui appliquera les mêmes paramètres à TOUS les personnages sur ce compte. En raison de la permanence de ces options, la gestion doit d'abord être activée à l'aide de l'option en bas du panel."
L.Settings_Profile_UseGlobal                         = "Utiliser un Profil Global de Compte"
L.Settings_Profile_UseGlobal_Warning                 = "Changer entre les profils locaux et globaux rechargera l'interface."
L.Settings_Profile_Copy                              = "Choisir un Profil à Copier"
L.Settings_Profile_Copy_TT                           = "Choisir un profil pour copier ses paramètres sur le profil actuellement actif. Le profil actif sera assigné au personnage connecté ou au profil global du compte si activé.\n\nÇa ne peut pas être annulé!"
L.Settings_Profile_CopyButton                        = "Copier le Profil"
L.Settings_Profile_CopyButton_Warning                = "Copier un profil rechargera l'interface."
L.Settings_Profile_CopyCannotCopy                    = "Impossible de copier le profil sélectionné. Réessayez ou sélectionnez un autre profil."
L.Settings_Profile_Delete                            = "Choisir un Profil à Supprimer"
L.Settings_Profile_Delete_TT                         = "Choisir un profil supprimera ses paramètres de la base de données. Si le personnage se connecte plus tard et que vous n'utilisez pas de profil global de compte, de nouveaux paramètres par défaut seront créés.\n\nSupprimer un profil est permanent!"
L.Settings_Profile_DeleteButton                      = "Supprimer le Profil"
L.Settings_Profile_Guard                             = "Active la Gestion du Profil"


--------------------------------
----       Countdowns       ----
--------------------------------
L.Settings_Countdown_Header                          = "Comptes à Rebours"
L.Settings_Countdown_Description                     = "Change l'apparence et le comportement des comptes à rebours."
L.Settings_Countdown_TimerScale                      = "Taille du Compteur"
L.Settings_Countdown_TimerScale_TT                   = "Change la taille de l'affichage du compteur."
L.Settings_Countdown_TextScale                       = "Taille du Texte"
L.Settings_Countdown_TextScale_TT                    = "Change la taille de l'affichage du texte."
L.Settings_Countdown_UseColors                       = "Utilise les Couleurs"
L.Settings_Countdown_UseColors_TT                    = "Quand activé, affichera les couleurs jaune / orange / rouge pour le compteur jusqu'à atteindre zéro."


--------------------------------
----          Trials        ----
--------------------------------
L.Settings_Trials_Header                            = "Épreuves"
L.Settings_Trials_Description                       = "Ici, vous pouvez configurer les notifications pour chaque épreuve. Vous pouvez simplement basculer de On à Off, jusqu'à spécifier un son unique, ou même voir celles de vos coéquipiers."


--------------------------------
----     Hel Ra Citadel     ----
--------------------------------
L.Settings_HelRa_Header                             = "La Citadelle d'Hel Ra"
-- Settings
L.Settings_HelRa_Yokeda_Meteor                      = "Yokeda: Météores"
L.Settings_HelRa_Yokeda_Meteor_TT                   = "Vous avertit lorsque le Yokeda est sur le point de vous envoyer une météore."
L.Settings_HelRa_Warrior_StoneForm                  = "Guerrier: Forme de Pierre"
L.Settings_HelRa_Warrior_StoneForm_TT               = "Vous avertit lorsque vous et/ou vos coéquipiers sont sur le point d'être transformé en pierre par Le Guerrier."
L.Settings_HelRa_Warrior_ShieldThrow                = "Guerrier: Lancé de Bouclier"
L.Settings_HelRa_Warrior_ShieldThrow_TT             = "Vous avertit lorsque Le Guerrier va lancer son bouclier."
--Alerts
L.Alerts_HelRa_Yokeda_Meteor                        = "En Approche |cFF0000Météore|r sur vous. Bloquez!"
L.Alerts_HelRa_Yokeda_Meteor_Other                  = "En Approche |cFF0000Météore|r sur |c595959<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_StoneForm                    = "En Approche |c595959Forme de Pierre|r sur vous. N'utilisez pas de synergies!"
L.Alerts_HelRa_Warrior_StoneForm_Other              = "En Approche |c595959Forme de Pierre|r sur |cFF0000<<!aC:1>>|r"
L.Alerts_HelRa_Warrior_ShieldThrow                  = "En Approche |cFF0000Lancé de Bouclier|r. "


--------------------------------
----   Aetherian Archives   ----
--------------------------------
L.Settings_Archive_Header                           = "L'Archive Aethérienne"
-- Settings
L.Settings_Archive_StormAtro_ImpendingStorm         = "Atro de Foudre: Tempête de Foudre"
L.Settings_Archive_StormAtro_ImpendingStorm_TT      = "Vous avertit quand l'Atronach de Foudre est sur le point de faire sa grand AoE de Foudre."
L.Settings_Archive_StormAtro_LightningStorm         = "Atro de Foudre: Orage"
L.Settings_Archive_StormAtro_LightningStorm_TT      = "Vous avertit lorsque l'Atronach de Foudre appelle la foudre du ciel dont vous devez vous abriter."
L.Settings_Archive_StoneAtro_BoulderStorm           = "Atro de Pierre: Pluie de Rochers"
L.Settings_Archive_StoneAtro_BoulderStorm_TT        = "Vous avertit quand l'Atronach de Pierre commence à lancer de multiples rochers sur les gens."
L.Settings_Archive_StoneAtro_BigQuake               = "Atro de Pierre: Tremblement de Terre"
L.Settings_Archive_StoneAtro_BigQuake_TT            = "Vous avertit lorsque l'Atronach de Pierre commence à marteler le sol de coups."
L.Settings_Archive_Overcharge                       = "Mobs: Surcharge"
L.Settings_Archive_Overcharge_TT                    = "Vous avertit quand un Surchargeur vous cible avec sa capacité Surcharge (grande AoE)"
L.Settings_Archive_Call_Lightning                   = "Mobs: Appel de la Foudre"
L.Settings_Archive_Call_Lightning_TT                = "Vous avertit quand un Surchargeur vous cible avec sa capacité Appel de la Foudre (petites AoEs)"
-- Alerts
L.Alerts_Archive_StormAtro_ImpendingStorm           = "En Approche |cFF0000Tempête de Foudre|r!"
L.Alerts_Archive_StormAtro_LightningStorm           = "En Approche |cfef92eOrage|r! Allez dans la lumière!"
L.Alerts_Archive_StoneAtro_BoulderStorm             = "En Approche |cFF0000Pluie de Rochers|r! Bloquez pour ne pas être renversé!"
L.Alerts_Archive_StoneAtro_BigQuake                 = "En Approche |cFF0000Tremblement de Terre|r!"
L.Alerts_Archive_Overcharge                         = "En Approche |c46edffSurcharge|r sur vous."
L.Alerts_Archive_Overcharge_Other                   = "En Approche |c46edffSurcharge|r sur |cFF0000<<!aC:1>>|r."
L.Alerts_Archive_Call_Lightning                     = "En Approche |c46edffAppel de la Foudre|r sur vous. Continuez à bouger!"
L.Alerts_Archive_Call_Lightning_Other               = "En Approche |c46edffAppel de la Foudre|r sur |cFF0000<<!aC:1>>|r."


--------------------------------
----    Sanctum Ophidia     ----
--------------------------------
L.Settings_Sanctum_Header                           = "Sanctum Ophidia"
-- Settings
L.Settings_Sanctum_Magicka_Detonation               = "Serpent: Détonation Magique"
L.Settings_Sanctum_Magicka_Detonation_TT            = "Vous avertit lorsque vous avez la Détonation Magique pendant le combat contre le Serpent."
L.Settings_Sanctum_Serpent_Poison                   = "Serpent: Phase de Poison"
L.Settings_Sanctum_Serpent_Poison_TT                = "Vous avertit quand le Serpent va entrer en Phase de Poison."
L.Settings_Sanctum_Serpent_World_Shaper             = "Serpent: Façonne Monde (Mode Difficile)"
L.Settings_Sanctum_Serpent_World_Shaper_TT          = "Vous avertit quand le Serpent commence son attaque Façonne Monde, en comptant jusqu'à ce qu'il soit déchaîné."
L.Settings_Sanctum_Mantikora_Spear                  = "Mantikora: Lance"
L.Settings_Sanctum_Mantikora_Spear_TT               = "Vous avertit lorsque vous êtes ciblé par une lance de la Mantikora."
L.Settings_Sanctum_Mantikora_Quake                  = "Mantikora: Séisme"
L.Settings_Sanctum_Mantikora_Quake_TT               = "Vous avertit lorsque vous êtes ciblé par la série de trois Temblements de Terre de la Mantikora."
L.Settings_Sanctum_Troll_Boulder                    = "Mobs: Troll Jeté de Pierre"
L.Settings_Sanctum_Troll_Boulder_TT                 = "Vous avertit quand le Troll va vous lancer une pierre."
L.Settings_Sanctum_Troll_Poison                     = "Mobs: Troll Poison"
L.Settings_Sanctum_Troll_Poison_TT                  = "Vous avertit quand le Troll va vous jeter du poison."
L.Settings_Sanctum_Overcharge                       = "Mobs: Surcharge"
L.Settings_Sanctum_Overcharge_TT                    = "Vous avertit quand un Surchargeur vous cible avec sa capacité Surcharge (grande AoE)"
L.Settings_Sanctum_Call_Lightning                   = "Mobs: Appel de la Foudre"
L.Settings_Sanctum_Call_Lightning_TT                = "Vous avertit quand un Surchargeur vous cible avec sa capacité Appel de la Foudre (petites AoEs)"
-- Alerts
L.Alerts_Sanctum_Serpent_Poison0                    = "En Approche |c39942ePhase de Poison|r! Rassemblez vous!"
L.Alerts_Sanctum_Serpent_Poison1                    = "En Approche |c39942ePhase de Poison|r! Suivi de |ccc0000Lamies|r."
L.Alerts_Sanctum_Serpent_Poison2                    = "En Approche |c39942ePhase de Poison|r! Suivi d'une |c009933Mantikora|r." --left
L.Alerts_Sanctum_Serpent_Poison3                    = "En Approche |c39942ePhase de Poison|r! Suivi d'une |c009933Mantikora|r." --right
L.Alerts_Sanctum_Serpent_Poison4                    = "En Approche |c39942ePhase de Poison|r! Suivi du |cff33ccBouclier|r."
L.Alerts_Sanctum_Serpent_Poison5                    = "Fin de la |c39942ePhase de Poison|r!"
L.Alerts_Sanctum_Serpent_World_Shaper               = "|c00c832Façonne Monde|r en approche!"
L.Alerts_Sanctum_Magicka_Detonation                 = "|c234afaDétonation Magique|r! Videz vous de votre Magie!"
L.Alerts_Sanctum_Mantikora_Spear                    = "Mantikora |ccde846Lance|r sur vous! Sortez en!"
L.Alerts_Sanctum_Mantikora_Spear_Other              = "Mantikora |ccde846Lance|r sur <<!aC:1>>! Sortez en!"
L.Alerts_Sanctum_Mantikora_Quake                    = "Mantikora |ccde846Séisme|r sur vous! Bougez!"
L.Alerts_Sanctum_Troll_Poison                       = "En Approche |c66ff33Poison du Troll|r. Ne le partagez pas!"
L.Alerts_Sanctum_Troll_Poison_Other                 = "En Approche |c66ff33Poison du Troll|r sur |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Troll_Boulder                      = "En Approche |c595959Jet de Pierre|r. Évitez!"
L.Alerts_Sanctum_Troll_Boulder_Other                = "En Approche |c595959Jet de Pierre|r sur |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Overcharge                         = "En Approche |c46edffSurcharge|r sur vous."
L.Alerts_Sanctum_Overcharge_Other                   = "En Approche |c46edffSurcharge|r sur |cFF0000<<!aC:1>>|r."
L.Alerts_Sanctum_Call_Lightning                     = "En Approche |c46edffAppel de la Foudre|r sur vous. Continuez à bouger!"
L.Alerts_Sanctum_Call_Lightning_Other               = "En Approche |c46edffAppel de la Foudre|r sur |cFF0000<<!aC:1>>|r."


--------------------------------
----    Maelstrom Arena     ----
--------------------------------
L.Settings_Maelstrom_Header                         = "Arène de Maelström"
-- Settings
L.Settings_Maelstrom_Stage7_Poison                  = "Arène 7: Poison"
L.Settings_Maelstrom_Stage7_Poison_TT               = "Vous avertit quand vous avez été empoisonné dans l'Arène 7 (Crypte de l'Ombrage)."
L.Settings_Maelstrom_Stage9_Synergy                 = "Arène 9: Explosion Spectrale (Synergie)"
L.Settings_Maelstrom_Stage9_Synergy_TT              = "Vous avertit quand vous avez obtenu la synergie de l'Arène 9 (Théâtre du Désespoir) après avoir récupéré 3 fantômes dorés."
-- Alerts
L.Alerts_Maelstrom_Stage7_Poison                    = "|c39942eEmpoisonné|r! Utilisez l'une des deux zones pour vous purger!"
L.Alerts_Maelstrom_Stage9_Synergy                   = "|c23afe7Explosion Spectrale|r prête! Utilisez la synergie!"


--------------------------------
----     Maw of Lorkhaj     ----
--------------------------------
L.Settings_MawLorkhaj_Header                        = "Gueule de Lorkhaj"
-- Settings
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj            = "Zhaj'hassa: Prise de Lorkhaj"
L.Settings_MawLorkhaj_Zhaj_GripOfLorkhaj_TT         = "Vous avertit lorsque la Prise de Lorkhaj (malédiction) commence à vous affecter."
L.Settings_MawLorkhaj_Zhaj_Glyphs                   = "Zhaj'hassa: Plateformes de Purge (beta)"
L.Settings_MawLorkhaj_Zhaj_Glyphs_TT                = "Affiche une fenêtre montrant toutes les Plateformes de Purge avec leur état et le temps restant à leur réapparition."
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert            = "       - Vue Inversée"
L.Settings_MawLorkhaj_Zhaj_Glyphs_Invert_TT         = "Inverse l'affichage les Plateformes de Purge."
L.Settings_MawLorkhaj_Twin_Aspects                  = "Jumeaux de la Fausse Lune : Aspects"
L.Settings_MawLorkhaj_Twin_Aspects_TT               = "Vous avertit lorsque vous obtenez l'Aspect Lunaire ou Ombre sur les Jumeaux de la Fausse Lune.\n\n    Complet affiche lorsque vous obtenez un aspect, lorsque vous commencez à changer d'aspect, et lorsque la conversion est terminée.\n    Normal vous avertit lorsque vous obtenez un aspect et lorsque vous convertissez d'aspect.\n    Minimal vous avertit seulement des conversions."
L.Settings_MawLorkhaj_Twin_Aspects_Status           = "       - Affiche le Statut"
L.Settings_MawLorkhaj_Twin_Aspects_Status_TT        = "Affiche le statut en cours dans la fenetre de statut durant le combat du boss."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void         = "Rakkhat : Vide Instable"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_TT      = "Vous avertit lorsque vous avez l'effet Vide Instable (AoE qui explose) de Rakkhat sur vous."
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown = "       - Compte à Rebours"
L.Settings_MawLorkhaj_Rakkhat_Unstable_Void_Countdown_TT = "Quand activé, affiche un compte à rebours au lieu d'une simple annonce pour l'effet Vide Instable."
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings        = "Rakkhat: Ailes Tranchantes"
L.Settings_MawLorkhaj_Rakkhat_ThreshingWings_TT     = "Vous avertit quand Rakkhat utilise sa capacité Ailes Tranchantes qui vous projette."
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls         = "Rakkhat: Chute des Ténèbres"
L.Settings_MawLorkhaj_Rakkhat_DarknessFalls_TT      = "Vous avertit lorsque Rakkhat commence sa capacité Chute des Ténèbres, où il fait tomber des météores dans la salle."
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage           = "Rakkhat: Barrage Sombre"
L.Settings_MawLorkhaj_Rakkhat_DarkBarrage_TT        = "Vous avertit quand Rakkhat commence le Barrage Sombre (mitraillette) sur le tank."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1         = "Rakkhat: Gain du Bastion Lunaire"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion1_TT      = "Affiche quand un joueur obtient la bénédiction de la plateforme dorée."
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2         = "Rakkhat: Perte du Bastion Lunaire"
L.Settings_MawLorkhaj_Rakkhat_LunarBastion2_TT      = "Affiche quand un joueur perd la bénédiction de la plateforme dorée."
L.Settings_MawLorkhaj_ShatteringStrike              = "Mobs: Frappe Écrasante"
L.Settings_MawLorkhaj_ShatteringStrike_TT           = "Avertissement loursqu'un sauvage Dro-m'Athra va lancer sa Frappe Écrasante qui brisera votre armure."
L.Settings_MawLorkhaj_Shattered                     = "Mobs: Armure Brisée"
L.Settings_MawLorkhaj_Shattered_TT                  = "Avertissement lorsque votre armure est brisée."
L.Settings_MawLorkhaj_MarkedForDeath                = "Mobs: Marqué pour la Mort (Panthères)"
L.Settings_MawLorkhaj_MarkedForDeath_TT             = "Avertissement si vous êtes Marqué pour la Mort par une Panthère Dro-m'Athra."
L.Settings_MawLorkhaj_Suneater_Eclipse              = "Mobs: Mange-Soleil Champ d'Éclipse (Négation)"
L.Settings_MawLorkhaj_Suneater_Eclipse_TT           = "Avertissement si le Champ d'Éclipse vous cible."
-- Alerts
L.Alerts_MawLorkhaj_Zhaj_GripOfLorkhaj              = "Attention! |c000055Prise de Lorkhaj!|r Purgez vous!"
L.Alerts_MawLorkhaj_Lunar_Aspect                    = "Reçu : Aspect |cFEFF7FLunaire|r!"
L.Alerts_MawLorkhaj_Shadow_Aspect                   = "Reçu : Aspect d'|c000055Ombre|r!"
L.Alerts_MawLorkhaj_Lunar_Conversion                = "Conversion à l'Aspect |cFEFF7FLunaire|r!"
L.Alerts_MawLorkhaj_Shadow_Conversion               = "Conversion à l'Aspect d'|c000055Ombre|r!"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void           = "Attention! |c000055Vide Instable|r sous vous"
L.Alerts_MawLorkhaj_Rakkhat_Unstable_Void_Other     = "Attention! |c000055Vide Instable|r sous |cFF0000<<!aC:1>>|r"
L.Alerts_MawLorkhaj_Rakkhat_ThreshingWings          = "En Approche |cFF0000Ailes Tranchantes|r! Bloquez!"
L.Alerts_MawLorkhaj_Rakkhat_DarknessFalls           = "En Approche |cFF0000Chute des Ténèbres|r (Météores)!"
L.Alerts_MawLorkhaj_Rakkhat_DarkBarrage             = "En Approche |cFF0000Barrage Sombre|r (Mitrailette)"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1           = "Vous avez obtenu le |cFEFF7FBastion Lunaire|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion1_Other     = "|cFF0000<<!aC:1>>|r a obtenu le |cFEFF7FBastion Lunaire|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2           = "Vous avez perdu le |cFEFF7FBastion Lunaire|r"
L.Alerts_MawLorkhaj_Rakkhat_LunarBastion2_Other     = "|cFF0000<<!aC:1>>|r a perdu le |cFEFF7FBastion Lunaire|r"
L.Alerts_MawLorkhaj_Suneater_Eclipse                = "En Approche |cFF0000Champ d'Éclipse|r sur vous."
L.Alerts_MawLorkhaj_Suneater_Eclipse_Other          = "En Approche |cFF0000Champ d'Éclipse|r sur |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_ShatteringStrike                = "En Approche |c000055Frappe Écrasante|r sur vous."
L.Alerts_MawLorkhaj_ShatteringStrike_Other          = "En Approche |c000055Frappe Écrasante|r sur |cFF0000<<!aC:1>>|r!"
L.Alerts_MawLorkhaj_Shattered                       = "Votre |c595959Armure|r a été |cff0000Brisée|r."
L.Alerts_MawLorkhaj_MarkedForDeath                  = "Attention! Une |c000055Panthère|r te poursuit!"


--------------------------------
----    Dragonstar Arena    ----
--------------------------------
L.Settings_Dragonstar_Header                        = "Arène de l'Étoile du Dragon"
-- Settings
L.Settings_Dragonstar_General_Taking_Aim            = "Général: Visée Précise"
L.Settings_Dragonstar_General_Taking_Aim_TT         = "Vous avertit lorsque vous êtes ciblé par une compétence Visée Précise."
L.Settings_Dragonstar_General_Crystal_Blast         = "General: Cristal Explosif"
L.Settings_Dragonstar_General_Crystal_Blast_TT      = "Vous avertit lorsque vous êtes ciblé par une compétence Cristal Explosif."
L.Settings_Dragonstar_Arena2_Crushing_Shock         = "Arène 2: Onde Écrasante"
L.Settings_Dragonstar_Arena2_Crushing_Shock_TT      = "Vous avertit lorsque vous êtes ciblé par une compétence Onde Écrasante dans l'Arène de Glace."
L.Settings_Dragonstar_Arena6_Drain_Resource         = "Arène 6: Drain de Ressources"
L.Settings_Dragonstar_Arena6_Drain_Resource_TT      = "Vous avertit lorsque vous êtes ciblé par une compétence Drain de Ressources dans l'Arène des Bosmers."
L.Settings_Dragonstar_Arena7_Unstable_Core          = "Arène 7: Noyau Instable (Eclipse)"
L.Settings_Dragonstar_Arena7_Unstable_Core_TT       = "Vous avertit quand le Noyau Instable (Eclipse) a été placé sur vous par le boss Templier dans l'Arène des Sacrifiés."
L.Settings_Dragonstar_Arena8_Ice_Charge             = "Arène 8: Charge de Glace"
L.Settings_Dragonstar_Arena8_Ice_Charge_TT          = "Vous avertit quand le Centurion de Glace va lancer son attaque de glace."
L.Settings_Dragonstar_Arena8_Fire_Charge            = "Arène 8: Charge de Feu"
L.Settings_Dragonstar_Arena8_Fire_Charge_TT         = "Vous avertit quand le Centurion de Feu va lancer son attaque de feu."
-- Alerts
L.Alerts_Dragonstar_General_Taking_Aim              = "|cFF6600Visée Précise|r ciblée sur vous!"
L.Alerts_Dragonstar_General_Crystal_Blast           = "|c990099Cristal Explosif|r ciblé sur vous!"
L.Alerts_Dragonstar_Arena2_Crushing_Shock           = "En Approche |c3366EEOnde Écrasante|r! Bloquez!"
L.Alerts_Dragonstar_Arena6_Drain_Resource           = "En Approche |c00CC00Drain de Ressources|r! Esquivez!"
L.Alerts_Dragonstar_Arena6_Drain_Resource_Other     = "En Approche |c00CC00Drain de Ressources|r sur |cFF0000<<!aC:1>>|r."
L.Alerts_Dragonstar_Arena7_Unstable_Core            = "Vous avez le |cDDDD33Noyau Instable|r! Libérez vous!"
L.Alerts_Dragonstar_Arena8_Ice_Charge               = "En Approche |c6699FFCharge de Glace|r sur vous! Interrompez ou Esquivez!"
L.Alerts_Dragonstar_Arena8_Ice_Charge_Other         = "|c6699FFCharge de Glace|r est lancé sur |cFF0000<<!aC:1>>|r. Interrompez!"
L.Alerts_Dragonstar_Arena8_Fire_Charge              = "En Approche |cFF3113Charge de Feu|r sur vous! Interrompez or Esquivez!"
L.Alerts_Dragonstar_Arena8_Fire_Charge_Other        = "|c6699FFCharge de Feu|r est lancé sur |cFF0000<<!aC:1>>|r. Interrompez!"



--------------------------------
---- Halls Of Fabrication   ----
--------------------------------
L.Settings_HallsFab_Header                          = "Salles de la Fabrication"
-- Settings
L.Settings_HallsFab_Taking_Aim                      = "Général: Visée Précise"
L.Settings_HallsFab_Taking_Aim_TT                   = "Vous avertit lorsque vous êtes ciblé par une compétence Visée Précise."
L.Settings_HallsFab_Taking_Aim_Dynamic              = "       - Compte à Rebours"
L.Settings_HallsFab_Taking_Aim_Dynamic_TT           = "Quand activé, affiche un compte à rebours au lieu d'une simple annonce pour l'attaque Visée Précise."
L.Settings_HallsFab_Taking_Aim_Duration             = "       - Durée du Compte à Rebours"
L.Settings_HallsFab_Taking_Aim_Duration_TT          = "La durée du compte à rebours en millisecondes."
L.Settings_HallsFab_Draining_Ballista               = "Général: Balliste Drainante"
L.Settings_HallsFab_Draining_Ballista_TT            = "Vous avertit quand une Sphère doit être interrompue."
L.Settings_HallsFab_Conduit_Strike                  = "Général: Coupure de Conduit"
L.Settings_HallsFab_Conduit_Strike_TT               = "Vous avertit quand une Coupure de Conduit (AoE qui explose et étourdi) arrive proche de vous."
L.Settings_HallsFab_Power_Leech                     = "Général: Drain de Puissance"
L.Settings_HallsFab_Power_Leech_TT                  = "Vous avertit quand vous êtes étourdi par une Coupure de Courant et que vous devez vous libérer."
L.Settings_HallsFab_Venom_Injection                 = "Chasseurs: Injection de Venin"
L.Settings_HallsFab_Venom_Injection_TT              = "Affiche dans la fenetre d'état lorsque vous êtes atteint par l'Injection de Venin pendant le combat des boss."
L.Settings_HallsFab_Conduit_Spawn                   = "Pinacle: Apparition de Lance"
L.Settings_HallsFab_Conduit_Spawn_TT                = "Vous avertit quand une lance va apparaître sur le boss Factotum du Pinacle."
L.Settings_HallsFab_Conduit_Drain                   = "Pinacle: Drain des Lances"
L.Settings_HallsFab_Conduit_Drain_TT                = "Vous avertit quand une lance draîne vos ressources sur le boss Factotum du Pinacle."
L.Settings_HallsFab_Scalded_Debuff                  = "Pinacle: Debuff Brûlant"
L.Settings_HallsFab_Scalded_Debuff_TT               = "Affiche une petite icône montrant le temps restant pour que le debuff disparaisse, et de combien il affecte le heal reçu."
L.Settings_HallsFab_Overcharge_Aura                 = "Commitée: Aura Surchargée"
L.Settings_HallsFab_Overcharge_Aura_TT              = "Vous avertit quand le boss Récupérateur commence son Aura Surchargée."
L.Settings_HallsFab_Overpower_Auras                 = "Commitée: Auras Surchargées"
L.Settings_HallsFab_Overpower_Auras_TT              = "Vous avertit quand les tanks doivent échanger leurs boss (Réacteur et Réducteur)."
L.Settings_HallsFab_Overpower_Auras_Duration        = "       - Durée du Compte à Rebours"
L.Settings_HallsFab_Overpower_Auras_Duration_TT     = "La durée du compte à rebours en millisecondes."
L.Settings_HallsFab_Overpower_Auras_Dynamic         = "       - Compte à Rebours Dynamique"
L.Settings_HallsFab_Overpower_Auras_Dynamic_TT      = "Lorsque l'option est activée, elle essaiera d'arrêter le compte à rebours lorsque les tanks ont fini leur échange."
L.Settings_HallsFab_Fabricant_Spawn                 = "Commitée: Apparition de Factotums Ruinés"
L.Settings_HallsFab_Fabricant_Spawn_TT              = "Vous avertit lorsque des Factotums Ruinés sont sur le point d'apparaître."
L.Settings_HallsFab_Catastrophic_Discharge          = "Commitée: Décharge Catastrophique"
L.Settings_HallsFab_Catastrophic_Discharge_TT       = "Vous avertit lorsqu'un Factotum Ruiné va vous charger."
L.Settings_HallsFab_Reclaim_Achieve                 = "Commitée: Échec [Obsolescence Planifiée]"
L.Settings_HallsFab_Reclaim_Achieve_TT              = "Vous avertit lorsqu'un Factotum Ruiné a atteind le Récupérateur et que vous n'avez donc pas réussi le succés Obsolescence Planifiée."
-- Alerts
L.Alerts_HallsFab_Taking_Aim                        = "|cFF6600Visée Précise|r ciblée sur vous!"
L.Alerts_HallsFab_Taking_Aim_Other                  = "|cFF6600Visée Précise|r ciblée sur |cFF0000<<!aC:1>>|r!"
L.Alerts_HallsFab_Taking_Aim_Simple                 = "|cFF6600Visée Précise|r"
L.Alerts_HallsFab_Conduit_Spawn                     = "Une Lance va apparaître"
L.Alerts_HallsFab_Conduit_Drain                     = "Une Lance draîne vos ressources!"
L.Alerts_HallsFab_Conduit_Drain_Other               = "Une Lance draîne les ressources de |cFF0000<<!aC:1>>|r!"
L.Alerts_HallsFab_Conduit_Strike                    = "En Approche |cFF0000Coupure de Conduit|r. Bloquez!"
L.Alerts_HallsFab_Draining_Ballista                 = "|cFFC000Balliste Drainante|r ciblée sur vous! Bloquez ou Interrompez!"
L.Alerts_HallsFab_Draining_Ballista_Other           = "|cFFC000Balliste Drainante|r ciblée sur |cFF0000<<!aC:1>>|r! Interrompez!"
L.Alerts_HallsFab_Power_Leech                       = "|c6600FFDrain de Puissance|r! Libérez vous!"
L.Alerts_HallsFab_Overcharge_Aura                   = "|c3366EEAura Surchargée|r sur Récupérateur."
L.Alerts_HallsFab_Overpower_Auras                   = "|cFF0000Compte à Rebours des Auras!|r"
L.Alerts_HallsFab_Catastrophic_Discharge            = "|cFF0000Décharge Catastrophique|r sur vous! Bloquez!"
L.Alerts_HallsFab_Fabricant_Spawn                   = "|cFFC000Apparition de Factotums Ruinés|r"
L.Alerts_HallsFab_Reclaim_Achieve                   = "|cDCD822[Obsolescence Planifiée]|r, le succés a |cFF0000Échoué|r"



--------------------------------
----   Asylum Sanctorium    ----
--------------------------------
L.Settings_Asylum_Header                         = "Asile Sanctuaire"
-- Settings
L.Settings_Asylum_Defiling_Blast                 = "Saint Llothis: Détonation Profanée"
L.Settings_Asylum_Defiling_Blast_TT              = "Vous avertit quand Saint Llothis cible un joueur du groupe avec son attaque conique."
L.Settings_Asylum_Soul_Stained_Corruption        = "Saint Llothis: Rayons Oppresseurs"
L.Settings_Asylum_Soul_Stained_Corruption_TT     = "Vous avertit quand Saint Llothis cible tous les joueurs avec son attaque qui devrait être interrompue."
L.Settings_Asylum_Teleport_Strike                = "Saint Felms: Téléportation"
L.Settings_Asylum_Teleport_Strike_TT             = "Vous avertit quand Saint Felms va se téléporter sur vous."
L.Settings_Asylum_Exhaustive_Charges             = "Saint Olms: Charges Épuisantes"
L.Settings_Asylum_Exhaustive_Charges_TT          = "Vous avertit quand Saint Olms est sur le point de lancer sont attaque qui envoie tois grandes AoEs de foudre."
L.Settings_Asylum_Storm_The_Heavens              = "Saint Olms: Assaillir les Cieux"
L.Settings_Asylum_Storm_The_Heavens_TT           = "Vous avertit quand Saint Olms est sur le point de s'envoler et d'envoyer une grande quantité de petites AoEs de foudre."
L.Settings_Asylum_Gusts_Of_Steam                 = "Saint Olms: Nuages de Vapeur"
L.Settings_Asylum_Gusts_Of_Steam_TT              = "Vous avertit quand Saint Olms est sur le point de sauter d'avant en arrière, signalant la prochaine phase du combat."
L.Settings_Asylum_Gusts_Of_Steam_Slider          = "       - Poucentage avant Saut"
L.Settings_Asylum_Gusts_Of_Steam_Slider_TT       = "Affiche une notification quelques pourcents de la santé du boss avant qu'il ne commence à sauter."
L.Settings_Asylum_Protector_Spawn                = "Saint Olms: Apparition d'un Protecteur"
L.Settings_Asylum_Protector_Spawn_TT             = "Vous avertit quand une sphère est sur le point d'apparaitre."
L.Settings_Asylum_Trial_By_Fire                  = "Saint Olms: Épreuve du Feu"
L.Settings_Asylum_Trial_By_Fire_TT               = "Vous avertit quand Saint Olms va lancer du feu durant la phase finale."
-- Alerts
L.Alerts_Asylum_Defiling_Blast                   = "Attention! |c00cc00Détonation Profanée|r sur vous"
L.Alerts_Asylum_Defiling_Blast_Other             = "Attention! |c00cc00Détonation Profanée|r sur |cFF0000<<!aC:1>>|r"
L.Alerts_Asylum_Soul_Stained_Corruption          = "En Approche |c3366EERayons Oppresseurs|r. Interrompez!"
L.Alerts_Asylum_Teleport_Strike                  = "|cFF3366Téléportation|r sur vous"
L.Alerts_Asylum_Teleport_Strike_Other            = "|cFF3366Téléportation|r sur |cFF0000<<!aC:1>>|r"
L.Alerts_Asylum_Exhaustive_Charges               = "En Approche |cFF0000Charges Épuisantes|r"
L.Alerts_Asylum_Storm_The_Heavens                = "En Approche |cFF0000Assaillir les Cieux|r! Courez!"
L.Alerts_Asylum_Gusts_Of_Steam                   = "En Approche |cFF9900Nuages de Vapeur|r! Cachez vous!"
L.Alerts_Asylum_Pre_Gusts_Of_Steam               = "|cFF0000<<1>>%|r avant |cFF9900Saut|r! Préparez vous!"
L.Alerts_Asylum_Trial_By_Fire                    = "En Approche |cFF5500Feu|r!"
L.Alerts_Asylum_Protector_Spawn                  = "Apparition d'un |c0000FFProtecteur|r!"
L.Alerts_Asylum_Protector_Active                 = "|c0000FFProtecteur|r actif!"



--------------------------------
------   CLOUDREST         -----
--------------------------------
L.Settings_Cloudrest_Header			= "Le Pas-des-Nuées"
-- Settings
L.Settings_Cloudrest_Olorime_Spears             = "General: Lance d'Olorime"
L.Settings_Cloudrest_Olorime_Spears_TT          = "Vous avertit quand une Lance apparait et que quelqu'un doit la ramasser."
L.Settings_Cloudrest_Shadow_Realm_Cast          = "General: Apparition de Portail"
L.Settings_Cloudrest_Shadow_Realm_Cast_TT       = "Vous avertit lorsque  le portail apparait et que le groupe doit aller dans la Dimension d'Ombre. "
L.Settings_Cloudrest_Hoarfrost                  = "Faralielle: Verglas"
L.Settings_Cloudrest_Hoarfrost_TT               = "Vous avertit quand vous avez le debuff de Verglas sur vous qui doit être synergisé pour être supprimé."
L.Settings_Cloudrest_Hoarfrost_Countdown        = "       - Compte à Rebours"
L.Settings_Cloudrest_Hoarfrost_Countdown_TT     = "Affiche un compte à rebours qui vous avertit quand vous pourrez lacher le debuff."
L.Settings_Cloudrest_Hoarfrost_Shed             = "Faralielle: Rejet de Verglas"
L.Settings_Cloudrest_Hoarfrost_Shed_TT          = "Vous avertit quand le debuff de Verglas à été laché par un autre joueur et doit être récupéré."
L.Settings_Cloudrest_Heavy_Attack               = "Mini Boss: Attaque Lourde"
L.Settings_Cloudrest_Heavy_Attack_TT            = "Vous avertit quand l'un des 3 Mini Boss va faire son Attaque Lourde."
L.Settings_Cloudrest_Chilling_Comet             = "Faralielle: Comètes de Glace"
L.Settings_Cloudrest_Chilling_Comet_TT          = "Vous avertit quand la Comète de Glace est sur vous. Vous devez bloquer et vous ne devez pas vous chevaucher avec un autre joueur ayant le même debuff avant l'explosion."
L.Settings_Cloudrest_Roaring_Flare              = "Siroria: Signal Rugissant"
L.Settings_Cloudrest_Roaring_Flare_TT           = "Vous avertit lorsque l'un des membres du groupe à le debuff Signal Rugissant qui nécessite un minimum de 3 personnes regroupées pour ne pas se faire one shot."
L.Settings_Cloudrest_Track_Roaring_Flare        = "       - Traque Signal Rugissant"
L.Settings_Cloudrest_Track_Roaring_Flare_TT     = ""
L.Settings_Cloudrest_Voltaic_Overload           = "Belanaril: Surchage Voltaïque"
L.Settings_Cloudrest_Voltaic_Overload_TT        = "Vous avertit quand vous allez avoir le debuff Surchage Voltaïque qui vous empêchera de changer de barres pendant 10 secondes."
L.Settings_Cloudrest_Nocturnals_Favor	        = "Z'Maja: Faveur de Nocturne"
L.Settings_Cloudrest_Nocturnals_Favor_TT        = "Vous avertit quand Z'Maja vous cible avec son attaque lourde."
L.Settings_Cloudrest_Baneful_Barb               = "Monstruosité Yaghra: Barbe Funeste"
L.Settings_Cloudrest_Baneful_Barb_TT            = "Vous avertit quand une Monstruosité Yaghra vous cible et fera son attaque Barbe Funeste."
L.Settings_Cloudrest_Break_Amulet               = "Z'Maja: Seulement Important en Execute"
L.Settings_Cloudrest_Break_Amulet_TT            = "Désactive les annonces de Spheres et de Rampant en execute."
L.Settings_Cloudrest_Sum_Shadow_Beads           = "Z'Maja: Sphères"
L.Settings_Cloudrest_Sum_Shadow_Beads_TT        = "Vous avertit quand les Sphères vont apparaitres."
L.Settings_Cloudrest_Tentacle_Spawn             = "Z'Maja: Apparition de Rampant"
L.Settings_Cloudrest_Tentacle_Spawn_TT          = "Vous avertit quand un Rampant de Nocturne va apparaitre."
L.Settings_Cloudrest_Crushing_Darkness          = "Z'Maja: Ténèbres Écrasantes"
L.Settings_Cloudrest_Crushing_Darkness_TT       = "Vous avertit quand une AoE vous suit et doit être gardée à distance."
L.Settings_Cloudrest_Malicious_Strike           = "Z'Maja: Frappe Malveillante"
L.Settings_Cloudrest_Malicious_Strike_TT        = "Vous avertit quand une sphère a été détruite et que pour éviter le debuff vous devez rouler ou bloquer."

-- Alerts
L.Alerts_Cloudrest_Olorime_Spears               = "Une |cffd000Lance|r apparaît!"
L.Alerts_Cloudrest_Hoarfrost0                   = "|c00ddffVerglas|r sur vous!"
L.Alerts_Cloudrest_Hoarfrost1                   = "|cff0000Dernier|r |c00ddffVerglas|r sur vous!"
L.Alerts_Cloudrest_Hoarfrost_Other0             = "|c00ddffVerglas|r sur |cff0000<<!aC:1>>|r."
L.Alerts_Cloudrest_Hoarfrost_Other1             = "|cff0000Dernier|r |c00ddffVerglas|r sur |cff0000<<!aC:1>>|r."
L.Alerts_Cloudrest_Hoarfrost_Countdown0         = "Lachez le |c00ddffVerglas|r dans..."
L.Alerts_Cloudrest_Hoarfrost_Countdown1         = "Lachez le |cff0000Dernier|r |c00ddffVerglas|r dans..."
L.Alerts_Cloudrest_Hoarfrost_Syn                = "|cff0000Synergie|r pour lacher le Verglas!"
L.Alerts_Cloudrest_Hoarfrost_Shed               = "|c00ddffVerglas|r laché."
L.Alerts_Cloudrest_Hoarfrost_Shed_Other         = "|c00ddffVerglas|r laché par |cff0000<<!aC:1>>|r."
L.Alerts_Cloudrest_Heavy_Attack                 = "|c0bf29eAttaque Lourde|r sur vous!"
L.Alerts_Cloudrest_Heavy_Attack_Other           = "|c0bf29eAttaque Lourde|r sur |cff0000<<!aC:1>>|r."
L.Alerts_Cloudrest_Baneful_Barb                 = "|cff0000Barbe Funeste|r. Esquivez!"
L.Alerts_Cloudrest_Baneful_Barb_Other           = "|cff0000Barbe Funeste|r sur |cff0000<<!aC:1>>|r."
L.Alerts_Cloudrest_Chilling_Comet               = "|cff0000Comète de Glace|r sur vous. Bloquez!"
L.Alerts_Cloudrest_Roaring_Flare                = "|cff7700Signal Rugissant|r sur vous."
L.Alerts_Cloudrest_Roaring_Flare_2              = "|cff0000<<!aC:1>>|r |t100%:100%:Esoui/Art/Buttons/large_leftarrow_up.dds|t |cff7700Roaring Flare|r |t100%:100%:Esoui/Art/Buttons/large_rightarrow_up.dds|t |cff0000<<!aC:2>>|r"
L.Alerts_Cloudrest_Roaring_Flare_Other          = "|cff7700Signal Rugissant|r sur |cff0000<<!aC:1>>|r. Regroupez vous!"
L.Alerts_Cloudrest_Voltaic_Current              = "En Approche |c55b4d4Surchage Voltaïque|r sur vous dans"
L.Alerts_Cloudrest_Voltaic_Overload             = "|c4d61c1Surchage Voltaïque|r sur vous! Changez de barre!"
L.Alerts_Cloudrest_Voltaic_Overload_Cd          = "|c4d61c1Surchage Voltaïque|r. Ne changez pas de barre!"
L.Alerts_Cloudrest_Shadow_Realm_Cast            = "Apparition du |cab82ffPortail|r"
L.Alerts_Cloudrest_Tentacle_Spawn               = "Apparition d'un |c00a86bRampant|r"
L.Alerts_Cloudrest_Sum_Shadow_Beads             = "Apparition des |cab82ffSphères|r"
L.Alerts_Cloudrest_Nocturnals_Favor             = "|cff0000Faveur de Nocturne|r sur vous!"
L.Alerts_Cloudrest_Crushing_Darkness            = "|cfc0c66Ténèbres Écrasantes|r sur vous. Courez!"
L.Alerts_Cloudrest_Malicious_Strike             = "|cff0000Frappe Malveillante|r sur vous. Bloquez!"


--------------------------------
----        Sunspire        ----
--------------------------------

L.Settings_Sunspire_Header            		= "Sollance"
-- Settings
L.Settings_Sunspire_Chilling_Comet        	= "General: Comète de Glace"
L.Settings_Sunspire_Chilling_Comet_TT     	= "Vous avertit quand une Comète de Glace est sur vous. Vous devez sortir du groupe, bloquer et ne pas vous chevaucher avec un autre joueur ayant une comète. Comète de Glace est sur deux joueurs en meme temps."
L.Settings_Sunspire_Sweeping_Breath         	= "Nahviintaas: Balayage de Feu"
L.Settings_Sunspire_Sweeping_Breath_TT    	= "Vous avertit quand Nahviintaas va faire son souffle de feu qui traverse toute la salle. Tous les joueurs doivent esquiver ou bloquer cette attaque."
L.Settings_Sunspire_Molten_Meteor         	= "Nahviintaas: Météore en Fusion"
L.Settings_Sunspire_Molten_Meteor_TT      	= "Vous avertit quand une Météore en Fusion est sur vous. Vous devez aller a l'extrémité de la salle, bloquer et ne pas vous chevaucher avec un autre joueur ayant une météore. Météore en Fusion cible trois joueurs en meme temps."
L.Settings_Sunspire_Focus_Fire            	= "Yolnahkriin: Tir Concentré"
L.Settings_Sunspire_Focus_Fire_TT         	= "Vous avertit quand un membre du groupe est ciblé par un Tir Concentré. Tir Concentré nécessite que les joueurs se rassemblent pour partager les dégâts. Il y aura un debuff persistant après qui augmentera les dégâts du prochain Tir Concentré. A cause de ce debuff vous devrez vous rassembler dans deux groupes séparés."
L.Settings_Sunspire_Breath                	= "General: Souffle Glacé/De Feu/Brûlant"
L.Settings_Sunspire_Breath_TT             	= "Vous avertit lorsque le cône canalisé de chaque boss vous cible, cette attaque inflige de gros dégâts."
L.Settings_Sunspire_Cataclism             	= "Yolnahkriin: Cataclysme"
L.Settings_Sunspire_Cataclism_TT          	= "Vous avertit quand le boss crachera du feu au milieu de la salle. Tout le monde doit aller sur les bords de la salle et tuer les adds."
L.Settings_Sunspire_Frozen_Tomb           	= "Lokkestiiz: Tombe Givrée"
L.Settings_Sunspire_Frozen_Tomb_TT        	= "Vous avertit quand une Tombe Givrée apparait. Un joueur doit entrer dans la tombe ce qui le gèlera et lui infligera des dégâts sur la durée. Vous devez ensuite remonter à 100% de santé pour être libéré. Il faut trois joueurs différents pour prendre les tombes à cause d'un debuff."
L.Settings_Sunspire_Thrash                 	= "Nahviintaas: Rosée Brutale"
L.Settings_Sunspire_Thrash_TT              	= "Vous avertit lorsque le boss va balancer sa tête dans le groupe et repousser tout le monde. Cette attaque doit être bloqué ou esquivé."
L.Settings_Sunspire_Mark_For_Death       	= "Nahviintaas: Marqué et Condamné"
L.Settings_Sunspire_Mark_For_Death_TT     	= "Vous avertit quand vous êtes marqué et condamné. Inflige de gros dégâts sur la durée, et enlève toutes vos résistances."
L.Settings_Sunspire_Time_Breach           	= "Nahviintaas: Rupture Temporelle"
L.Settings_Sunspire_Time_Breach_TT        	= "Vous avertit quand les portails pour descendre sont ouverts."
L.Settings_Sunspire_Negate_Field          	= "Serviteur Éternel: Champ de Négation"
L.Settings_Sunspire_Negate_Field_TT       	= "Vous avertit si vous êtes la cible du Champ de Négation en bas."
-- Alerts
L.Alerts_Sunspire_Chilling_Comet        	= "|c00ddffComète de Glace|r sur vous. Bloquez!"
L.Alerts_Sunspire_Chilling_Comet_Other  	= "|c00ddffComète de Glacet|r sur |cff0000<<!aC:1>>|r"
L.Alerts_Sunspire_Sweeping_Breath        	= "|cff0000Balayage de Feu|r! Bloquez!"
L.Alerts_Sunspire_Molten_Meteor            	= "|c00ddffMétéore en Fusion|r sur vous! Bougez!"
L.Alerts_Sunspire_Molten_Meteor_Other   	= "|c00ddffMétéore en Fusion|r sur <<!aC:1>>|r"
L.Alerts_Sunspire_Focus_Fire            	= "|cff7700Tir Concentré|r sur vous dans"
L.Alerts_Sunspire_Focus_Fire_Other        	= "|cff7700Tir Concentré|r sur |cff0000<<!aC:1>>|r dans"
L.Alerts_Sunspire_Atronach_Zap          	= "|cff7700Atronach|r apparait dans"
L.Alerts_Sunspire_Frost_Atronach        	= "|cff7700Atronach de Glace|r apparait!"
L.Alerts_Sunspire_Breath                	= "|cffff00<<1>>|r sur vous!"
L.Alerts_Sunspire_Breath_Other            	= "|cffff00<<1>>|r sur |cff0000<<!aC:2>>|r"
L.Alerts_Sunspire_Cataclism             	= "|cff3300Cataclysme|r s'arrete dans"
L.Alerts_Sunspire_Frozen_Tomb            	= "|c00ddffTombe Givrée|r (<<1>>)"
L.Alerts_Sunspire_Thrash                 	= "En Approche |cff0000Rosée Brutale|r! Bloquez!"
L.Alerts_Sunspire_Mark_For_Death        	= "Marqué et Condamné sur vous"
L.Alerts_Sunspire_Mark_For_Death_Other  	= "Marqué et Condamné sur |cff0000<<!aC:1>>|r"
L.Alerts_Sunspire_Time_Breach_Countdown   	= "|c81cc00Rupture Temporelle|r dans "
L.Alerts_Sunspire_Negate_Field            	= "|c53c4c9Champ de Négation|r sur vous!"
L.Alerts_Sunspire_Negate_Field_Others     	= "|c53c4c9Champ de Négation|r sur <<!aC:1>>!"


--------------------------------
----       Debugging        ----
--------------------------------
L.Settings_Debug_Header                  = "Débogage"
L.Settings_Debug                         = "Activer le débogage"
L.Settings_Debug_TT                      = "Activer le débogage dans la fenêtre de discussion"
L.Settings_Debug_DevMode                 = "Mode Développeur"
L.Settings_Debug_DevMode_TT              = "Lorsque l'option est activée, elle affiche certaines alertes qui ne fonctionnent pas complétement, qui ont un décalage dans le temps, ou qui ne sont pas encore complètement testées. En génèrale elles ne doivent pas produire d'erreurs UI, mais un addon 'attrapeur de bug' est recommandé."
L.Settings_Debug_DevMode_Warning         = "Nécessite le Mode Développeur"

L.Settings_Debug_Tracker_Header          = "Débogueur"
L.Settings_Debug_Tracker_Description     = "Il s'agit d'une fonction de débogage destinée à suivre et à afficher les potentiels mécaniques au cours d'une épreuve en enregistrant les informations sur les évènements et les effets de combat. En raison de la quantité potentiellement importante d'informations, il existe quelques options pour éviter d'encombrer votre fenêtre de discussion."
L.Settings_Debug_Tracker_Enabled         = "Activé"
L.Settings_Debug_Tracker_SpamControl     = "Contrôle Anti-Spam"
L.Settings_Debug_Tracker_SpamControl_TT  = "Avec cette option, chaque capacité / effet n'est enregistré qu'une fois par type d'action. La liste de ces capacités connues pour cette session peut être effacé avec :\n\n /rndebug clear"
L.Settings_Debug_Tracker_MyEnemyOnly     = "Mon Ennemi Seulement"
L.Settings_Debug_Tracker_MyEnemyOnly_TT  = "Lorsque l'option est activée, elle limitera TOUTE sortie de capacités / effets ciblés sur le joueur et qui ne proviennent pas du joueur ou du groupe. Utile lorsque vous cherchez une chose spécifique et que vous ne voulez pas que le Contrôle Anti-Spam s'active."



--TODO: get rid of this ugly, bulky localization method
for k, v in pairs(L) do
    local string = "RAIDNOTIFIER_" .. string.upper(k)
    ZO_CreateStringId(string, v)
end

if (GetCVar('language.2') == 'fr') then
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
