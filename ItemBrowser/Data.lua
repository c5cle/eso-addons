ItemBrowser.data = {
	flags = {
		crafted       = 0x01,
		jewelry       = 0x02,
		weapon        = 0x04,
		monster       = 0x08,
		mixedWeights  = 0x10,
		allianceStyle = 0x20,
		multiStyle    = 0x40,
		manualStyle   = 0x80,
		mythic        = 0x100,
		shield        = 0x200,
	},

	items = {
		-- Crafted -------------------------------------------------------------
		{ 46177, 0x51, { 3, 381, 41 }, 2 }, -- Death's Wind
		{ 46563, 0x51, { 19, 383, 57 }, 3 }, -- Twilight's Embrace
		{ 46954, 0x51, { 3, 381, 41 }, 2 }, -- Night's Silence
		{ 47322, 0x51, { 20, 108, 117 }, 4 }, -- Whitestrake's Retribution
		{ 47712, 0x51, { 19, 383, 57 }, 3 }, -- Armor of the Seducer
		{ 48088, 0x51, { 104, 58, 101 }, 5 }, -- Vampire's Kiss
		{ 48478, 0x51, { 20, 108, 117 }, 4 }, -- Magnus' Gift
		{ 48869, 0x51, { 92, 382, 103 }, 6 }, -- Night Mother's Gaze
		{ 49252, 0x51, { 3, 381, 41 }, 2 }, -- Ashen Grip
		{ 49627, 0x51, { 347 }, 8 }, -- Oblivion's Foe
		{ 50001, 0x51, { 347 }, 8 }, -- Spectre's Eye
		{ 50389, 0x51, { 19, 383, 57 }, 3 }, -- Torug's Pact
		{ 50764, 0x51, { 20, 108, 117 }, 4 }, -- Hist Bark
		{ 51152, 0x51, { 92, 382, 103 }, 6 }, -- Willow's Path
		{ 51541, 0x51, { 92, 382, 103 }, 6 }, -- Hunding's Rage
		{ 51907, 0x51, { 104, 58, 101 }, 5 }, -- Song of Lamae
		{ 52288, 0x51, { 104, 58, 101 }, 5 }, -- Alessia's Bulwark
		{ 52669, 0x51, { 642 }, 8 }, -- Orgnum's Scales
		{ 53057, 0x51, { 267 }, 8 }, -- Eyes of Mara
		{ 53438, 0x51, { 642 }, 8 }, -- Kagrenac's Hope
		{ 53812, 0x51, { 267 }, 8 }, -- Shalidor's Curse
		{ 55233, 0x51, { 888 }, 8 }, -- Way of the Arena
		{ 58483, 0x51, { 888 }, 9 }, -- Twice-Born Star
		{ 60203, 0x51, { 584 }, 5 }, -- Noble's Conquest
		{ 60560, 0x51, { 584 }, 7 }, -- Redistributor
		{ 60903, 0x51, { 584 }, 9 }, -- Armor Master
		{ 69907, 0x51, { 684 }, 6 }, -- Law of Julianos
		{ 70243, 0x51, { 684 }, 3 }, -- Trial by Fire
		{ 70950, 0x51, { 684 }, 9 }, -- Morkuldin
		{ 72107, 0x51, { 816 }, 5 }, -- Tava's Favor
		{ 72471, 0x51, { 816 }, 7 }, -- Clever Alchemist
		{ 72674, 0x51, { 816 }, 9 }, -- Eternal Hunt
		{ 75484, 0x51, { 823 }, 5 }, -- Kvatch Gladiator
		{ 75819, 0x51, { 823 }, 7 }, -- Varen's Legacy
		{ 76169, 0x51, { 823 }, 9 }, -- Pelinal's Aptitude
		{ 121634, 0x51, { 849 }, 3 }, -- Assassin's Guile
		{ 121984, 0x51, { 849 }, 8 }, -- Daedric Trickery
		{ 122334, 0x51, { 849 }, 6 }, -- Shacklebreaker
		{ 130460, 0x51, { 980 }, 2 }, -- Innate Axiom
		{ 130803, 0x51, { 981, { 980 } }, 4 }, -- Fortified Brass
		{ 131168, 0x51, { 980 }, 6 }, -- Mechanical Acuity
		{ 135800, 0x51, { 1011 }, 3 }, -- Adept Rider
		{ 136157, 0x51, { 1027, { 1011 } }, 6 }, -- Sload's Semblance
		{ 136515, 0x51, { 1011 }, 9 }, -- Nocturnal's Favor
		{ 142894, 0x51, { 726 }, 7 }, -- Grave-Stake Collector
		{ 143271, 0x51, { 726 }, 2 }, -- Naga Shaman
		{ 143634, 0x51, { 726 }, 4 }, -- Might of the Lost Legion
		{ 148058, 0x51, { 1086 }, 8 }, -- Coldharbour's Favorite
		{ 148421, 0x51, { 1086 }, 5 }, -- Senche-raht's Grit
		{ 148791, 0x51, { 1086 }, 3 }, -- Vastarie's Tutelage
		{ 155507, 0x51, { 1133 }, 3 }, -- Daring Corsair
		{ 155881, 0x51, { 1133 }, 6 }, -- Ancient Dragonguard
		{ 156255, 0x51, { 1133 }, 9 }, -- New Moon Acolyte
		{ 158419, 0x51, { 181, { -202 } }, 3 }, -- Critical Riposte
		{ 158793, 0x51, { 181, { -201 } }, 3 }, -- Unchained Aggressor
		{ 159167, 0x51, { 181, { -203 } }, 3 }, -- Dauntless Combatant
		{ 161324, 0x51, { 1160 }, 5 }, -- Stuhn's Favor
		{ 161713, 0x51, { 1160 }, 7 }, -- Dragon's Appetite
		{ 163167, 0x51, { 1161, { 1160 } }, 3 }, -- Spell Parasite
		{ 168102, 0x51, { 1207 }, 3 }, -- Red Eagle's Fury
		{ 168476, 0x51, { 1207 }, 6 }, -- Legacy of Karth
		{ 168850, 0x51, { 1208, { 1207 } }, 9 }, -- Aetherial Ascension
		{ 172558, 0x51, { 1261 }, 3 }, -- Hist Whisperer
		{ 172932, 0x51, { 1261 }, 7 }, -- Heartland Conqueror
		{ 173306, 0x51, { 1261 }, 5 }, -- Diamond's Victory
		{ 178916, 0x51, { 1286 }, 3 }, -- Wretched Vitality
		{ 179298, 0x51, { 1286 }, 7 }, -- Deadlands Demolisher
		{ 179657, 0x51, { 1283, { 1286 } }, 5 }, -- Iron Flask
		{ 184881, 0x51, { 1318 }, 3 }, -- Order's Wrath
		{ 185254, 0x51, { 1318 }, 5 }, -- Serpent's Disdain
		{ 185634, 0x51, { 1318 }, 7 }, -- Druid's Braid
		{ 191335, 0x51, { 1383 }, 7 }, -- Chimera's Rebuke
		{ 191715, 0x51, { 1383 }, 3 }, -- Old Growth Brewer
		{ 192110, 0x51, { 1383 }, 5 }, -- Claw of the Forest Wraith
		{ 194680, 0x51, { 1413 }, 5 }, -- Shattered Fate
		{ 195045, 0x51, { 1414 }, 3 }, -- Telvanni Efficiency
		{ 195425, 0x51, { 1413 }, 7 }, -- Seeker Synthesis

		-- Non-Crafted ---------------------------------------------------------
		{ 68476, 0x20, { 643 } }, -- Black Rose
		{ 68483, 0x00, { 684 } }, -- Trinimac's Valor
		{ 68491, 0x00, { 684 } }, -- Briarheart
		{ 68571, 0x00, { 677 } }, -- Winterborn
		{ 68579, 0x20, { 643 } }, -- Powerful Assault
		{ 68652, 0x00, { 684 } }, -- Mark of the Pariah
		{ 68659, 0x20, { 643 } }, -- Meritorious Service
		{ 68667, 0x00, { 677 } }, -- Para Bellum
		{ 68740, 0x00, { 677 } }, -- Glorious Defender
		{ 68747, 0x00, { 677 } }, -- Elemental Succession
		{ 68755, 0x20, { 643 } }, -- Shield Breaker
		{ 68828, 0x00, { 677 } }, -- Permafrost
		{ 68835, 0x20, { 643 } }, -- Phoenix
		{ 68843, 0x00, { 677 } }, -- Hunt Leader
		{ 68916, 0x20, { 643 } }, -- Reactive Armor
		{ 72892, 0x10, { 816 } }, -- Bahraha's Curse
		{ 72972, 0x10, { 816 } }, -- Syvarra's Scales
		{ 73001, 0x00, { 725 } }, -- Moondancer
		{ 73027, 0x00, { 725 } }, -- Twilight Remedy
		{ 73051, 0x00, { 725 } }, -- Roar of Alkosh
		{ 73074, 0x00, { 725 } }, -- Lunar Bastion
		{ 73880, 0x00, { 181 } }, -- Marksman's Crest
		{ 73942, 0x00, { 181 } }, -- Leki's Focus
		{ 74004, 0x00, { 181 } }, -- Fasalla's Guile
		{ 74087, 0x00, { 181 } }, -- Warrior's Fury
		{ 74149, 0x00, { 181 } }, -- Vicious Death
		{ 74222, 0x00, { 181 } }, -- Robes of Transmutation
		{ 74824, 0x00, { 20 } }, -- Darkstride
		{ 74990, 0x00, { 108 } }, -- Shadow Dancer's Raiment
		{ 76969, 0x00, { 823 } }, -- Hide of Morihaus
		{ 77109, 0x00, { 823 } }, -- Flanking Strategist
		{ 77291, 0x10, { 823 } }, -- Sithis' Touch
		{ 78103, 0x00, { 643 } }, -- Galerion's Revenge
		{ 78391, 0x00, { 643 } }, -- Vicecanon of Venom
		{ 78656, 0x00, { 643 } }, -- Thews of the Harbinger
		{ 78954, 0x10, { 643 } }, -- Imperial Physique
		{ 79967, 0x00, { 636, 638, 639 }, alt = "Eternal Yokeda" }, -- Eternal Warrior
		{ 80119, 0x00, { 636, 638, 639 }, alt = "Vicious Ophidian" }, -- Vicious Serpent
		{ 80272, 0x00, { 636, 638, 639 }, alt = "Infallible Aether" }, -- Infallible Mage
		{ 80735, 0x00, { 381 } }, -- Queen's Elegance
		{ 81065, 0x00, { 382 } }, -- Senche's Bite
		{ 82264, 0x00, { 843 } }, -- Aspect of Mazzatun
		{ 82447, 0x00, { 843 } }, -- Amber Plasm
		{ 82637, 0x00, { 843 } }, -- Heem-Jas' Retribution
		{ 82819, 0x00, { 848 } }, -- Hand of Mephala
		{ 83002, 0x00, { 848 } }, -- Gossamer
		{ 83192, 0x00, { 848 } }, -- Widowmaker
		{ 84558, 0x00, { 101 } }, -- Akaviri Dragonguard
		{ 84741, 0x00, { 41 } }, -- Silks of the Sun
		{ 84931, 0x00, { 41 } }, -- Shadow of the Red Mountain
		{ 85114, 0x00, { 383 } }, -- Syrabane's Grip
		{ 85486, 0x00, { 58 } }, -- Salvation
		{ 86041, 0x00, { 3 } }, -- Hide of the Werewolf
		{ 86224, 0x00, { 104 } }, -- Robes of the Withered Hand
		{ 86596, 0x00, { 19 } }, -- Storm Knight's Plate
		{ 86779, 0x00, { 20 } }, -- Necropotence
		{ 86969, 0x00, { 635 } }, -- Footman's Fortune
		{ 87152, 0x00, { 635 } }, -- Healer's Habit
		{ 87343, 0x00, { 635 } }, -- Robes of Destruction Mastery
		{ 87533, 0x00, { 635 } }, -- Archer's Mind
		{ 88020, 0x20, { 181, { -202, -204 } } }, -- Alessian Order
		{ 88384, 0x20, { 181, { -202, -204 } } }, -- Crest of Cyrodiil
		{ 88566, 0x20, { 181, { -202, -204 } } }, -- Bastion of the Heartland
		{ 88748, 0x20, { 181, { -202, -204 } } }, -- Beckoning Steel
		{ 88930, 0x20, { 181, { -202, -204 } } }, -- The Juggernaut
		{ 89294, 0x20, { 181, { -202, -205 } } }, -- Affliction
		{ 89476, 0x20, { 181, { -202, -205 } } }, -- Ravager
		{ 89840, 0x20, { 181, { -202, -205 } } }, -- Elf Bane
		{ 90261, 0x20, { 181, { -203, -204 } } }, -- Desert Rose
		{ 90834, 0x20, { 181, { -203, -204 } } }, -- Curse Eater
		{ 91025, 0x20, { 181, { -203, -204 } } }, -- Almalexia's Mercy
		{ 91407, 0x20, { 181, { -203, -204 } } }, -- Robes of Alteration Mastery
		{ 91598, 0x20, { 181, { -203, -205 } } }, -- The Arch-Mage
		{ 91789, 0x20, { 181, { -203, -205 } } }, -- Light of Cyrodiil
		{ 91980, 0x20, { 181, { -203, -204 } } }, -- Buffer of the Swift
		{ 92300, 0x80, { 381 }, 7 }, -- Twin Sisters
		{ 92664, 0x20, { 181, { -201, -204 } } }, -- Shield of the Valiant
		{ 92846, 0x20, { 181, { -201, -205 } } }, -- Shadow Walker
		{ 93210, 0x20, { 181, { -201, -205 } } }, -- Hawk's Eye
		{ 93392, 0x20, { 181, { -201, -205 } } }, -- The Morag Tong
		{ 93574, 0x20, { 181, { -201, -205 } } }, -- Kyne's Kiss
		{ 93756, 0x20, { 181, { -201, -205 } } }, -- Ward of Cyrodiil
		{ 93938, 0x20, { 181, { -201, -205 } } }, -- Sentry
		{ 94289, 0x00, { 381 } }, -- Armor of the Veiled Heritance
		{ 95305, 0x00, { 888 } }, -- Way of Fire
		{ 95488, 0x00, { 888 } }, -- Way of Martial Knowledge
		{ 95698, 0x00, { 888 } }, -- Way of Air
		{ 95983, 0x50, { 534, 537, 280, 535, 281 } }, -- Armor of the Trainee
		{ 96432, 0x00, { 3 } }, -- Bloodthorn's Touch
		{ 96622, 0x00, { 41 } }, -- Shalk Exoskeleton
		{ 96804, 0x00, { 3 } }, -- Wyrd Tree's Blessing
		{ 96979, 0x00, { 57 } }, -- Night Mother's Embrace
		{ 97070, 0x00, { 57 } }, -- Plague Doctor
		{ 97253, 0x00, { 57 } }, -- Mother's Sorrow
		{ 97443, 0x00, { 108 } }, -- Wilderqueen's Arch
		{ 97625, 0x00, { 383 } }, -- Green Pact
		{ 97807, 0x00, { 19 } }, -- Night Terror
		{ 97990, 0x00, { 19 } }, -- Dreamer's Mantle
		{ 98180, 0x00, { 383 } }, -- Ranger's Gait
		{ 98362, 0x00, { 108 } }, -- Beekeeper's Gear
		{ 98544, 0x00, { 20 } }, -- Vampire Cloak
		{ 98727, 0x00, { 117 } }, -- Robes of the Hist
		{ 98917, 0x00, { 117 } }, -- Swamp Raider
		{ 99099, 0x00, { 117 } }, -- Hatchling's Shell
		{ 99318, 0x00, { 104 } }, -- Sword-Singer
		{ 99500, 0x00, { 104 } }, -- Order of Diagna
		{ 99683, 0x00, { 58 } }, -- Spinner's Garments
		{ 99873, 0x00, { 58 } }, -- Thunderbug's Carapace
		{ 100056, 0x00, { 101 } }, -- Stendarr's Embrace
		{ 100246, 0x00, { 101 } }, -- Fiord's Legacy
		{ 100432, 0x00, { 92 } }, -- Vampire Lord
		{ 100622, 0x00, { 92 } }, -- Spriggan's Thorns
		{ 100804, 0x00, { 92 } }, -- Seventh Legion Brute
		{ 100987, 0x00, { 382 } }, -- Skooma Smuggler
		{ 101177, 0x00, { 382 } }, -- Soulshine
		{ 101360, 0x00, { 103 } }, -- Ysgramor's Birthright
		{ 101550, 0x00, { 103 } }, -- Witchman Armor
		{ 101732, 0x00, { 103 } }, -- Draugr's Heritage
		{ 101916, 0x00, { 347 } }, -- Prisoner's Rags
		{ 102106, 0x00, { 347 } }, -- Stygian
		{ 102288, 0x00, { 347 } }, -- Meridia's Blessed Armor
		{ 102471, 0x00, { 380, 935 } }, -- Sanctuary
		{ 102661, 0x00, { 380, 935 } }, -- Jailbreaker
		{ 102843, 0x00, { 380, 935 } }, -- Tormentor
		{ 103025, 0x00, { 144, 936 } }, -- Spelunker
		{ 103208, 0x00, { 283, 934 } }, -- Spider Cultist Cowl
		{ 103399, 0x00, { 126, 931 } }, -- Light Speaker
		{ 103589, 0x00, { 126, 931 } }, -- Undaunted Bastion
		{ 103772, 0x00, { 146, 933 } }, -- Combat Physician
		{ 103962, 0x00, { 146, 933 } }, -- Toothrow
		{ 104145, 0x00, { 63, 930 } }, -- Netch's Touch
		{ 104335, 0x00, { 63, 930 } }, -- Strength of the Automaton
		{ 104518, 0x00, { 176, 681 } }, -- Burning Spellweave
		{ 104708, 0x00, { 176, 681 } }, -- Sunderflame
		{ 104890, 0x00, { 176, 681 } }, -- Embershield
		{ 105072, 0x00, { 31 } }, -- Hircine's Veneer
		{ 105254, 0x00, { 64 } }, -- Sword Dancer
		{ 105437, 0x00, { 22 } }, -- Treasure Hunter
		{ 105627, 0x00, { 22 } }, -- Duneripper's Scales
		{ 105810, 0x00, { 130, 932 } }, -- Shroud of the Lich
		{ 106000, 0x00, { 130, 932 } }, -- Leviathan
		{ 106182, 0x00, { 130, 932 } }, -- Ebon Armory
		{ 106365, 0x00, { 148 } }, -- Lamia's Song
		{ 106555, 0x00, { 148 } }, -- Undaunted Infiltrator
		{ 106737, 0x00, { 148 } }, -- Medusa
		{ 106920, 0x00, { 449 } }, -- Magicka Furnace
		{ 107110, 0x00, { 449 } }, -- Draugr Hulk
		{ 107293, 0x00, { 38 } }, -- Undaunted Unweaver
		{ 107483, 0x00, { 38 } }, -- Bone Pirate's Tatters
		{ 107665, 0x00, { 38 } }, -- Knight-errant's Mail
		{ 107848, 0x00, { 144, 936 } }, -- Prayer Shawl
		{ 108038, 0x00, { 144, 936 } }, -- Knightmare
		{ 108220, 0x00, { 283, 934 } }, -- Viper's Sting
		{ 108402, 0x00, { 283, 934 } }, -- Dreugh King Slayer
		{ 108584, 0x00, { 126, 931 } }, -- Barkskin
		{ 108766, 0x00, { 146, 933 } }, -- Sergeant's Mail
		{ 108948, 0x00, { 63, 930 } }, -- Armor of Truth
		{ 109150, 0x00, { 22 } }, -- Crusader
		{ 109312, 0x00, { 449 } }, -- The Ice Furnace
		{ 109495, 0x00, { 31 } }, -- Vestments of the Warlock
		{ 109685, 0x00, { 31 } }, -- Durok's Bane
		{ 109868, 0x00, { 64 } }, -- Noble Duelist's Silks
		{ 110058, 0x00, { 64 } }, -- Nikulas' Heavy Armor
		{ 110241, 0x00, { 131 } }, -- Overwhelming Surge
		{ 110431, 0x00, { 131 } }, -- Storm Master
		{ 110613, 0x00, { 131 } }, -- Jolting Arms
		{ 110796, 0x00, { 11 } }, -- The Worm's Raiment
		{ 110986, 0x00, { 11 } }, -- Oblivion's Edge
		{ 111168, 0x00, { 11 } }, -- Rattlecage
		{ 111351, 0x00, { 678 } }, -- Scathing Mage
		{ 111541, 0x00, { 678 } }, -- Sheer Venom
		{ 111723, 0x00, { 678 } }, -- Leeching Plate
		{ 111906, 0x00, { 688 } }, -- Spell Power Cure
		{ 112096, 0x00, { 688 } }, -- Essence Thief
		{ 112278, 0x00, { 688 } }, -- Brands of Imperium
		{ 112479, 0x00, { 638 }, alt = "Mending" }, -- Healing Mage
		{ 112669, 0x00, { 638 }, alt = "Ophidian Celerity" }, -- Quick Serpent
		{ 112851, 0x00, { 638 }, alt = "Resilient Yokeda" }, -- Defending Warrior
		{ 113034, 0x00, { 636 }, alt = "Aether Destruction" }, -- Destructive Mage
		{ 113224, 0x00, { 636 }, alt = "Ophidian Venom" }, -- Poisonous Serpent
		{ 113406, 0x00, { 636 }, alt = "Advancing Yokeda" }, -- Berserking Warrior
		{ 113589, 0x00, { 639 }, alt = "Aether Strategy" }, -- Wise Mage
		{ 113779, 0x00, { 639 }, alt = "Two-Fanged Snake" }, -- Twice-Fanged Serpent
		{ 113961, 0x00, { 639 }, alt = "Immortal Yokeda" }, -- Immortal Warrior
		{ 122645, 0x00, { 849 } }, -- Warrior-Poet
		{ 122828, 0x00, { 849 } }, -- War Maiden
		{ 123018, 0x00, { 849 } }, -- Infector
		{ 123201, 0x00, { -2 } }, -- Vanguard's Challenge
		{ 123383, 0x00, { -2 } }, -- Coward's Gear
		{ 123566, 0x00, { -2 } }, -- Knight Slayer
		{ 123757, 0x00, { -2 } }, -- Wizard's Riposte
		{ 123947, 0x00, { 975 } }, -- Automated Defense
		{ 124129, 0x00, { 975 } }, -- War Machine
		{ 124312, 0x00, { 975 } }, -- Master Architect
		{ 124503, 0x00, { 975 } }, -- Inventor's Guard
		{ 125743, 0x10, { -2 } }, -- Impregnable Armor
		{ 127185, 0x00, { 974 } }, -- Ironblood
		{ 127368, 0x00, { 974 } }, -- Draugr's Rest
		{ 127558, 0x00, { 974 } }, -- Pillar of Nirn
		{ 127788, 0x00, { 973 } }, -- Hagraven's Garden
		{ 127971, 0x00, { 973 } }, -- Flame Blossom
		{ 128161, 0x00, { 973 } }, -- Blooddrinker
		{ 128407, 0x00, { 1009 } }, -- Ulfnor's Favor
		{ 128590, 0x00, { 1009 } }, -- Caluurion's Legacy
		{ 128780, 0x00, { 1009 } }, -- Trappings of Invigoration
		{ 128962, 0x00, { 1010 } }, -- Curse of Doylemish
		{ 129145, 0x00, { 1010 } }, -- Jorvuld's Guidance
		{ 129335, 0x00, { 1010 } }, -- Plague Slinger
		{ 132884, 0x00, { 980, 1000 } }, -- Mad Tinkerer
		{ 133074, 0x00, { 980, 1000 } }, -- Unfathomable Darkness
		{ 132701, 0x00, { 980, 1000 } }, -- Livewire
		{ 135197, 0x00, { 1011 } }, -- Grace of Gloom
		{ 135379, 0x00, { 1011 } }, -- Gryphon's Ferocity
		{ 135562, 0x00, { 1011 } }, -- Wisdom of Vanus
		{ 136802, 0x00, { 1051 } }, -- Aegis of Galenwe
		{ 136984, 0x00, { 1051 } }, -- Arms of Relequen
		{ 137167, 0x00, { 1051 } }, -- Mantle of Siroria
		{ 137358, 0x00, { 1051 } }, -- Vestment of Olorime
		{ 137999, 0x00, { 1051 } }, -- Perfect Aegis of Galenwe
		{ 138181, 0x00, { 1051 } }, -- Perfect Arms of Relequen
		{ 138364, 0x00, { 1051 } }, -- Perfect Mantle of Siroria
		{ 138555, 0x00, { 1051 } }, -- Perfect Vestment of Olorime
		{ 140547, 0x00, { 1055 } }, -- Haven of Ursus
		{ 140730, 0x00, { 1055 } }, -- Hanu's Compassion
		{ 140920, 0x00, { 1055 } }, -- Blood Moon
		{ 141102, 0x00, { 1052 } }, -- Jailer's Tenacity
		{ 141285, 0x00, { 1052 } }, -- Moon Hunter
		{ 141475, 0x00, { 1052 } }, -- Savage Werewolf
		{ 142271, 0x00, { 726, 1082 } }, -- Champion of the Hist
		{ 142453, 0x00, { 726, 1082 } }, -- Dead-Water's Guile
		{ 142636, 0x00, { 726, 1082 } }, -- Bright-Throat's Boast
		{ 143937, 0x20, { -4 } }, -- Indomitable Fury
		{ 144128, 0x20, { -4 } }, -- Spell Strategist
		{ 144318, 0x20, { -4 } }, -- Battlefield Acrobat
		{ 144500, 0x20, { -4 } }, -- Soldier of Anguish
		{ 144682, 0x20, { -4 } }, -- Steadfast Hero
		{ 144864, 0x20, { -4 } }, -- Battalion Defender
		{ 146112, 0x00, { 1080 } }, -- Mighty Glacier
		{ 146294, 0x00, { 1080 } }, -- Tzogvin's Warband
		{ 146477, 0x00, { 1080 } }, -- Icy Conjuror
		{ 146715, 0x00, { 1081 } }, -- Frozen Watcher
		{ 146897, 0x00, { 1081 } }, -- Scavenging Demise
		{ 147080, 0x00, { 1081 } }, -- Auroran's Thunder
		{ 147372, 0x20, { 181, { -201, -205 } } }, -- Deadly Strike
		{ 149093, 0x00, { 1086 } }, -- Call of the Undertaker
		{ 149276, 0x00, { 1086 } }, -- Crafty Afliq
		{ 149466, 0x00, { 1086 } }, -- Vesture of Darloc Brae
		{ 149648, 0x00, { 1121 } }, -- Claw of Yolnahkriin
		{ 149830, 0x00, { 1121 } }, -- Tooth of Lokkestiiz
		{ 150013, 0x00, { 1121 } }, -- False God's Devotion
		{ 150204, 0x00, { 1121 } }, -- Eye of Nahviintaas
		{ 150849, 0x00, { 1121 } }, -- Perfected Claw of Yolnahkriin
		{ 151031, 0x00, { 1121 } }, -- Perfected Tooth of Lokkestiiz
		{ 151214, 0x00, { 1121 } }, -- Perfected False God's Devotion
		{ 151405, 0x00, { 1121 } }, -- Perfected Eye of Nahviintaas
		{ 152391, 0x00, { 1122 } }, -- Renald's Resolve
		{ 152574, 0x00, { 1122 } }, -- Hollowfang Thirst
		{ 152764, 0x00, { 1122 } }, -- Dro'Zakar's Claws
		{ 152946, 0x00, { 1123 } }, -- Dragon's Defilement
		{ 153129, 0x00, { 1123 } }, -- Z'en's Redress
		{ 153319, 0x00, { 1123 } }, -- Azureblight Reaper
		{ 154871, 0x00, { 1133 } }, -- Senchal Defender
		{ 155057, 0x00, { 1133 } }, -- Marauder's Haste
		{ 155250, 0x00, { 1133 } }, -- Dragonguard Elite
		{ 156885, 0x00, { 1152 } }, -- Hiti's Hearth
		{ 157078, 0x00, { 1152 } }, -- Titanborn Strength
		{ 157263, 0x00, { 1152 } }, -- Bani's Torment
		{ 157571, 0x00, { 1153 } }, -- Draugrkin's Grip
		{ 157764, 0x00, { 1153 } }, -- Aegis Caller
		{ 157949, 0x00, { 1153 } }, -- Grave Guardian
		{ 160663, 0x00, { 1160, 1161 } }, -- Winter's Respite
		{ 160856, 0x00, { 1160, 1161 } }, -- Venomous Smite
		{ 161041, 0x00, { 1160, 1161 } }, -- Eternal Vigor
		{ 162001, 0x00, { 1196 } }, -- Roaring Opportunist
		{ 162135, 0x00, { 1196 } }, -- Yandir's Might
		{ 162264, 0x00, { 1196 } }, -- Vrol's Command
		{ 162410, 0x00, { 1196 } }, -- Kyne's Wind
		{ 162544, 0x00, { 1196 } }, -- Perfected Roaring Opportunist
		{ 162678, 0x00, { 1196 } }, -- Perfected Yandir's Might
		{ 162807, 0x00, { 1196 } }, -- Perfected Vrol's Command
		{ 162953, 0x00, { 1196 } }, -- Perfected Kyne's Wind
		{ 164329, 0x00, { 1201 } }, -- Talfyg's Treachery
		{ 164522, 0x00, { 1201 } }, -- Unleashed Terror
		{ 164707, 0x00, { 1201 } }, -- Crimson Twilight
		{ 164893, 0x00, { 1197 } }, -- Elemental Catalyst
		{ 165086, 0x00, { 1197 } }, -- Kraglen's Howl
		{ 165271, 0x00, { 1197 } }, -- Arkasis's Genius
		{ 167465, 0x00, { 1207, 1208 } }, -- Radiant Bastion
		{ 167631, 0x00, { 1207, 1208 } }, -- Voidcaller
		{ 167803, 0x00, { 1207, 1208 } }, -- Witch-Knight's Defiance
		{ 169154, 0x00, { 1227 } }, -- Hex Siphon
		{ 169326, 0x00, { 1227 } }, -- Pestilent Host
		{ 169491, 0x00, { 1227 } }, -- Explosive Rebuke
		{ 170267, 0x00, { 1228 } }, -- True-Sworn Fury
		{ 170439, 0x00, { 1228 } }, -- Kinras's Wrath
		{ 170604, 0x00, { 1228 } }, -- Drake's Rush
		{ 170770, 0x00, { 1229 } }, -- Unleashed Ritualist
		{ 170942, 0x00, { 1229 } }, -- Dagon's Dominion
		{ 171107, 0x00, { 1229 } }, -- Foolkiller's Ward
		{ 171984, 0x00, { 1261 } }, -- Frostbite
		{ 172156, 0x00, { 1261 } }, -- Deadlands Assassin
		{ 172321, 0x00, { 1261 } }, -- Bog Raider
		{ 173627, 0x00, { 1263 } }, -- Bahsei's Mania
		{ 173763, 0x00, { 1263 } }, -- Sul-Xan's Torment
		{ 173892, 0x00, { 1263 } }, -- Saxhleel Champion
		{ 174036, 0x00, { 1263 } }, -- Stone-Talker's Oath
		{ 174228, 0x00, { 1263 } }, -- Perfected Stone-Talker's Oath
		{ 174412, 0x00, { 1263 } }, -- Perfected Bahsei's Mania
		{ 174594, 0x00, { 1263 } }, -- Perfected Sul-Xan's Torment
		{ 174983, 0x00, { 1263 } }, -- Perfected Saxhleel Champion
		{ 177427, 0x00, { 1268 } }, -- Crimson Oath's Rive
		{ 177593, 0x00, { 1268 } }, -- Scorion's Feast
		{ 177765, 0x00, { 1268 } }, -- Rush of Agony
		{ 177930, 0x00, { 1267 } }, -- Silver Rose Vigil
		{ 178096, 0x00, { 1267 } }, -- Thunder Caller
		{ 178268, 0x00, { 1267 } }, -- Grisly Gourmet
		{ 180463, 0x20, { -4 } }, -- Dark Convergence
		{ 180635, 0x20, { -4 } }, -- Plaguebreak
		{ 180800, 0x20, { -4 } }, -- Hrothgar's Chill
		{ 179960, 0x00, { 1286 } }, -- Eye of the Grasp
		{ 180132, 0x00, { 1286 } }, -- Hexos' Ward
		{ 180297, 0x00, { 1286 } }, -- Kynmarcher's Cruelty
		{ 180966, 0x00, { 1301 } }, -- Maligalig's Maelstrom
		{ 181138, 0x00, { 1301 } }, -- Gryphon's Reprisal
		{ 181303, 0x00, { 1301 } }, -- Glacial Guardian
		{ 181739, 0x00, { 1302 } }, -- Turning Tide
		{ 181905, 0x00, { 1302 } }, -- Storm-Cursed's Revenge
		{ 182077, 0x00, { 1302 } }, -- Spriggan's Vigor
		{ 183272, 0x20, { -4 } }, -- Rallying Cry
		{ 183444, 0x20, { -4 } }, -- Hew and Sunder
		{ 183609, 0x20, { -4 } }, -- Enervating Aura
		{ 185943, 0x00, { 1318 } }, -- Blessing of High Isle
		{ 186115, 0x00, { 1318 } }, -- Steadfast's Mettle
		{ 186280, 0x00, { 1318 } }, -- Systres' Scowl
		{ 186446, 0x00, { 1344 } }, -- Whorl of the Depths
		{ 186582, 0x00, { 1344 } }, -- Coral Riptide
		{ 186711, 0x00, { 1344 } }, -- Pearlescent Ward
		{ 186855, 0x00, { 1344 } }, -- Pillager's Profit
		{ 187047, 0x00, { 1344 } }, -- Perfected Pillager's Profit
		{ 187231, 0x00, { 1344 } }, -- Perfected Whorl of the Depths
		{ 187413, 0x00, { 1344 } }, -- Perfected Coral Riptide
		{ 187585, 0x00, { 1344 } }, -- Perfected Pearlescent Ward
		{ 188380, 0x00, { 1360 } }, -- Deeproot Zeal
		{ 188546, 0x00, { 1360 } }, -- Stone's Accord
		{ 188718, 0x00, { 1360 } }, -- Rage of the Ursauk
		{ 188883, 0x00, { 1361 } }, -- Pangrit Denmother
		{ 189049, 0x00, { 1361 } }, -- Grave Inevitability
		{ 189221, 0x00, { 1361 } }, -- Phylactery's Grasp
		{ 189542, 0x20, { -4 } }, -- Langour of Peryite
		{ 189714, 0x20, { -4 } }, -- Nocturnal's Ploy
		{ 189879, 0x20, { -4 } }, -- Mara's Balm
		{ 190403, 0x00, { 1383 } }, -- Back-Alley Gourmand
		{ 190575, 0x00, { 1383 } }, -- Phoenix Moth Theurge
		{ 190740, 0x00, { 1383 } }, -- Bastion of the Draoife
		{ 192652, 0x00, { 1389 } }, -- Ritemaster's Bond
		{ 192824, 0x00, { 1389 } }, -- Nix-Hound's Howl
		{ 192989, 0x00, { 1389 } }, -- Telvanni Enforcer
		{ 193211, 0x00, { 1390 } }, -- Runecarver's Blaze
		{ 193383, 0x00, { 1390 } }, -- Apocryphal Inspiration
		{ 193548, 0x00, { 1390 } }, -- Abyssal Brace
		{ 193886, 0x20, { -4 } }, -- Snake in the Stars
		{ 194058, 0x20, { -4 } }, -- Shell Splitter
		{ 194223, 0x20, { -4 } }, -- Judgement of Akatosh
		{ 195734, 0x00, { 1413, 1414 } }, -- Vivec's Duality
		{ 195906, 0x00, { 1413, 1414 } }, -- Camonna Tong
		{ 196071, 0x00, { 1413, 1414 } }, -- Adamant Lurker
		{ 196251, 0x00, { 1427 } }, -- Peace and Serenity
		{ 196387, 0x00, { 1427 } }, -- Ansuul's Torment
		{ 196516, 0x00, { 1427 } }, -- Test of Resolve
		{ 196662, 0x00, { 1427 } }, -- Transformative Hope
		{ 196860, 0x00, { 1427 } }, -- Perfected Transformative Hope
		{ 197044, 0x00, { 1427 } }, -- Perfected Peace and Serenity
		{ 197226, 0x00, { 1427 } }, -- Perfected Ansuul's Torment
		{ 197398, 0x00, { 1427 } }, -- Perfected Test of Resolve

		-- Monster Sets --------------------------------------------------------
		{ 59391, 0x18, { 934, { -101 } } }, -- Spawn of Mephala
		{ 59427, 0x18, { 936, { -101 } } }, -- Blood Spawn
		{ 59457, 0x18, { 678, { -103 } } }, -- Lord Warden
		{ 59493, 0x18, { 933, { -101 } } }, -- Scourge Harvester
		{ 59529, 0x18, { 930, { -101 } } }, -- Engine Guardian
		{ 59577, 0x18, { 931, { -101 } } }, -- Nightflame
		{ 59613, 0x18, { 932, { -102 } } }, -- Nerien'eth
		{ 59649, 0x18, { 681, { -102 } } }, -- Valkyn Skoria
		{ 59679, 0x18, { 935, { -101 } } }, -- Maw of the Infernal
		{ 68124, 0x18, { 688, { -103 } } }, -- Molag Kena
		{ 82130, 0x18, { 848, { -103 } } }, -- Velidreth
		{ 82176, 0x18, { 843, { -103 } } }, -- Mighty Chudan
		{ 94477, 0x18, { 144, { -101 } } }, -- Swarm Mother
		{ 94501, 0x18, { 146, { -101 } } }, -- Slimecraw
		{ 94549, 0x18, {  22, { -102 } } }, -- Tremorscale
		{ 94557, 0x18, {  38, { -102 } } }, -- Pirate Skeleton
		{ 94733, 0x18, { 380, { -101 } } }, -- Shadowrend
		{ 94757, 0x18, {  63, { -101 } } }, -- Sentinel of Rkugamz
		{ 94765, 0x18, { 126, { -101 } } }, -- Chokethorn
		{ 94789, 0x18, { 176, { -102 } } }, -- Infernal Guardian
		{ 94797, 0x18, { 130, { -102 } } }, -- Ilambris
		{ 94805, 0x18, { 449, { -102 } } }, -- Iceheart
		{ 94837, 0x18, {  64, { -102 } } }, -- The Troll King
		{ 94853, 0x18, {  11, { -102 } } }, -- Grothdarr
		{ 95013, 0x18, { 283, { -101 } } }, -- Kra'gh
		{ 95053, 0x18, { 148, { -102 } } }, -- Sellistrix
		{ 95085, 0x18, { 131, { -102 } } }, -- Stormfist
		{ 95117, 0x18, {  31, { -102 } } }, -- Selene
		{ 127722, 0x18, { 973, { -103 } } }, -- Earthgore
		{ 128309, 0x18, { 974, { -103 } } }, -- Domihaus
		{ 129483, 0x18, { 1009, { -103 } } }, -- Thurvokun
		{ 129547, 0x18, { 1010, { -103 } } }, -- Zaan
		{ 141628, 0x18, { 1055, { -103 } } }, -- Balorgh
		{ 141676, 0x18, { 1052, { -103 } } }, -- Vykosa
		{ 146638, 0x18, { 1080, { -103 } } }, -- Stonekeeper
		{ 147243, 0x18, { 1081, { -103 } } }, -- Symphony of Blades
		{ 152266, 0x18, { 1122, { -103 } } }, -- Grundwulf
		{ 152318, 0x18, { 1123, { -103 } } }, -- Maarselok
		{ 158177, 0x18, { 1152, { -103 } } }, -- Mother Ciannait
		{ 158239, 0x18, { 1153, { -103 } } }, -- Kjalnar's Nightmare
		{ 167046, 0x18, { 1197, { -103 } } }, -- Stone Husk
		{ 167116, 0x18, { 1201, { -103 } } }, -- Lady Thorn
		{ 171619, 0x18, { 1228, { -103 } } }, -- Encratis's Behemoth
		{ 171663, 0x18, { 1229, { -103 } } }, -- Baron Zaudrus
		{ 175197, 0x18, { 584 } }, -- Zoal the Ever-Wakeful
		{ 175253, 0x18, { 584 } }, -- Immolator Charr
		{ 175309, 0x18, { 584 } }, -- Glorgoloch the Destroyer
		{ 178582, 0x18, { 1267, { -103 } } }, -- Prior Thierric
		{ 178644, 0x18, { 1268, { -103 } } }, -- Magma Incarnate
		{ 183744, 0x18, { 1301, { -103 } } }, -- Kargaeda
		{ 183800, 0x18, { 1302, { -103 } } }, -- Nazaray
		{ 183908, 0x18, { 584 } }, -- Nunatak
		{ 183976, 0x18, { 584 } }, -- Lady Malygda
		{ 184032, 0x18, { 584 } }, -- Baron Thirsk
		{ 189368, 0x18, { 1360, { -103 } } }, -- Archdruid Devyric
		{ 189418, 0x18, { 1361, { -103 } } }, -- Euphotic Gatekeeper
		{ 193124, 0x18, { 1389, { -103 } } }, -- Roksa the Warped
		{ 193695, 0x18, { 1390, { -103 } } }, -- Ozezan the Inferno

		-- 3p Jewelry Sets -----------------------------------------------------
		{ 69166, 0x22, { 584, -1 } }, -- Endurance
		{ 69278, 0x22, { 584, -1 } }, -- Willpower
		{ 69390, 0x22, { 584, -1 } }, -- Agility
		{ 87748, 0x22, { 181, { -202 } } }, -- Blessing of the Potentates
		{ 89988, 0x22, { 181, { -203, -204 } } }, -- Wrath of the Imperium
		{ 90107, 0x22, { 181, { -203, -204 } } }, -- Grace of the Ancients
		{ 92136, 0x22, { 181, { -201 } } }, -- Eagle Eye
		{ 92147, 0x22, { 181, { -201 } } }, -- Vengeance Leech

		-- Special Weapons -----------------------------------------------------
		{ 133275, 0x004, { 1000 } }, -- Perfected Timeless Blessing (The Asylum's Perfected Restoration Staff)
		{ 133284, 0x004, { 1000 } }, -- Perfected Chaotic Whirlwind (The Asylum's Perfected Dagger)
		{ 133287, 0x004, { 1000 } }, -- Perfected Disciplined Slash (The Asylum's Perfected Greatsword)
		{ 133288, 0x004, { 1000 } }, -- Perfected Piercing Spray (The Asylum's Perfected Bow)
		{ 133289, 0x004, { 1000 } }, -- Perfected Concentrated Force (The Asylum's Perfected Inferno Staff)
		{ 133361, 0x204, { 1000 } }, -- Perfected Defensive Position (The Asylum's Perfected Shield)
		{ 133428, 0x004, { 1000 } }, -- Timeless Blessing (The Asylum's Restoration Staff)
		{ 133437, 0x004, { 1000 } }, -- Chaotic Whirlwind (The Asylum's Dagger)
		{ 133440, 0x004, { 1000 } }, -- Disciplined Slash (The Asylum's Greatsword)
		{ 133441, 0x004, { 1000 } }, -- Piercing Spray (The Asylum's Bow)
		{ 133442, 0x004, { 1000 } }, -- Concentrated Force (The Asylum's Inferno Staff)
		{ 133514, 0x204, { 1000 } }, -- Defensive Position (The Asylum's Shield)
		{ 133657, 0x004, { 677 } }, -- Precise Regeneration (The Maelstrom's Restoration Staff)
		{ 133666, 0x004, { 677 } }, -- Cruel Flurry (The Maelstrom's Dagger)
		{ 133669, 0x004, { 677 } }, -- Merciless Charge (The Maelstrom's Greatsword)
		{ 133670, 0x004, { 677 } }, -- Thunderous Volley (The Maelstrom's Bow)
		{ 133671, 0x004, { 677 } }, -- Crushing Wall (The Maelstrom's Inferno Staff)
		{ 133743, 0x204, { 677 } }, -- Rampaging Slash (The Maelstrom's Shield)
		{ 133810, 0x004, { 635 } }, -- Grand Rejuvenation (The Master's Restoration Staff)
		{ 133819, 0x004, { 635 } }, -- Stinging Slashes (The Master's Dagger)
		{ 133822, 0x004, { 635 } }, -- Titanic Cleave (The Master's Greatsword)
		{ 133823, 0x004, { 635 } }, -- Caustic Arrow (The Master's Bow)
		{ 133824, 0x004, { 635 } }, -- Destructive Impact (The Master's Inferno Staff)
		{ 133896, 0x204, { 635 } }, -- Puncturing Remedy (The Master's Shield)
		{ 145043, 0x004, { 1082 } }, -- Mender's Ward (Blackrose Restoration Staff)
		{ 145052, 0x004, { 1082 } }, -- Spectral Cloak (Blackrose Dagger)
		{ 145055, 0x004, { 1082 } }, -- Radial Uppercut (Blackrose Greatsword)
		{ 145056, 0x004, { 1082 } }, -- Virulent Shot (Blackrose Bow)
		{ 145057, 0x004, { 1082 } }, -- Wild Impulse (Blackrose Inferno Staff)
		{ 145129, 0x204, { 1082 } }, -- Gallant Charge (Blackrose Shield)
		{ 145196, 0x004, { 1082 } }, -- Perfected Mender's Ward (Blackrose Perfected Restoration Staff)
		{ 145205, 0x004, { 1082 } }, -- Perfected Spectral Cloak (Blackrose Perfected Dagger)
		{ 145208, 0x004, { 1082 } }, -- Perfected Radial Uppercut (Blackrose Perfected Greatsword)
		{ 145209, 0x004, { 1082 } }, -- Perfected Virulent Shot (Blackrose Perfected Bow)
		{ 145210, 0x004, { 1082 } }, -- Perfected Wild Impulse (Blackrose Perfected Inferno Staff)
		{ 145282, 0x204, { 1082 } }, -- Perfected Gallant Charge (Blackrose Perfected Shield)
		{ 166081, 0x004, { 635 } }, -- Perfected Grand Rejuvenation (The Master's Perfected Restoration Staff)
		{ 166090, 0x004, { 635 } }, -- Perfected Stinging Slashes (The Master's Perfected Dagger)
		{ 166093, 0x004, { 635 } }, -- Perfected Titanic Cleave (The Master's Perfected Greatsword)
		{ 166094, 0x004, { 635 } }, -- Perfected Caustic Arrow (The Master's Perfected Bow)
		{ 166095, 0x004, { 635 } }, -- Perfected Destructive Impact (The Master's Perfected Inferno Staff)
		{ 166167, 0x204, { 635 } }, -- Perfected Puncturing Remedy (The Master's Perfected Shield)
		{ 166218, 0x004, { 677 } }, -- Perfected Precise Regeneration (The Maelstrom's Perfected Restoration Staff)
		{ 166227, 0x004, { 677 } }, -- Perfected Cruel Flurry (The Maelstrom's Perfected Dagger)
		{ 166230, 0x004, { 677 } }, -- Perfected Merciless Charge (The Maelstrom's Perfected Greatsword)
		{ 166231, 0x004, { 677 } }, -- Perfected Thunderous Volley (The Maelstrom's Perfected Bow)
		{ 166232, 0x004, { 677 } }, -- Perfected Crushing Wall (The Maelstrom's Perfected Inferno Staff)
		{ 166304, 0x204, { 677 } }, -- Perfected Rampaging Slash (The Maelstrom's Perfected Shield)
		{ 169908, 0x004, { 1227 } }, -- Force Overflow (Vateshran's Restoration Staff)
		{ 169917, 0x004, { 1227 } }, -- Executioner's Blade (Vateshran's Dagger)
		{ 169920, 0x004, { 1227 } }, -- Frenzied Momentum (Vateshran's Greatsword)
		{ 169921, 0x004, { 1227 } }, -- Point-Blank Snipe (Vateshran's Bow)
		{ 169922, 0x004, { 1227 } }, -- Wrath of Elements (Vateshran's Inferno Staff)
		{ 169994, 0x204, { 1227 } }, -- Void Bash (Vateshran's Shield)
		{ 170027, 0x004, { 1227 } }, -- Perfected Force Overflow (Vateshran's Perfected Restoration Staff)
		{ 170036, 0x004, { 1227 } }, -- Perfected Executioner's Blade (Vateshran's Perfected Dagger)
		{ 170039, 0x004, { 1227 } }, -- Perfected Frenzied Momentum (Vateshran's Perfected Greatsword)
		{ 170040, 0x004, { 1227 } }, -- Perfected Point-Blank Snipe (Vateshran's Perfected Bow)
		{ 170041, 0x004, { 1227 } }, -- Perfected Wrath of Elements (Vateshran's Perfected Inferno Staff)
		{ 170111, 0x204, { 1227 } }, -- Perfected Void Bash (Vateshran's Perfected Shield)

		-- Level Up Rewards ----------------------------------------------------
		--{ 134955, 0x02, { -3 } }, -- Broken Soul
		--{ 134975, 0x02, { -3 } }, -- Prophet's

		-- Mythic Items --------------------------------------------------------
		{ 163052, 0x102, { -5 } }, -- Ring of the Wild Hunt
		{ 163451, 0x102, { -5 } }, -- Torc of Tonal Constancy
		{ 164291, 0x100, { -5 } }, -- Thrassian Stranglers
		{ 165879, 0x100, { -5 } }, -- Snow Treaders
		{ 165880, 0x102, { -5 } }, -- Malacath's Band of Brutality
		{ 165899, 0x100, { -5 } }, -- Bloodlord's Embrace
		{ 171436, 0x102, { -5 } }, -- Ring of the Pale Order
		{ 171437, 0x102, { -5 } }, -- Pearls of Ehlnofey
		{ 175524, 0x100, { -5 } }, -- Harpooner's Wading Kilt
		{ 175525, 0x100, { -5 } }, -- Gaze of Sithis
		--{ 175526, 0x102, { -5 } }, -- Harvester's Hope-Ring
		{ 175527, 0x102, { -5 } }, -- Death Dealer's Fete
		{ 175528, 0x102, { -5 } }, -- Shapeshifter's Chain
		{ 181695, 0x100, { -5 } }, -- Spaulder of Ruin
		{ 182208, 0x102, { -5 } }, -- Markyn Ring of Majesty
		{ 182209, 0x102, { -5 } }, -- Belharza's Band
		{ 187654, 0x100, { -5 } }, -- Mora's Whispers
		{ 187655, 0x100, { -5 } }, -- Dov-rha Sabatons
		{ 187656, 0x100, { -5 } }, -- Lefthander's War Girdle
		{ 187657, 0x102, { -5 } }, -- Sea-Serpent's Coil
		{ 187658, 0x102, { -5 } }, -- Oakensoul Ring
		{ 190886, 0x100, { -5 } }, -- Faun's Lark Cladding
		{ 190887, 0x100, { -5 } }, -- Stormweaver's Cavort
		{ 190888, 0x100, { -5 } }, -- Syrabane's Ward
		{ 194509, 0x100, { -5 } }, -- Cryptcanon Vestments
		{ 194510, 0x100, { -5 } }, -- Esoteric Environment Greaves
		{ 194512, 0x102, { -5 } }, -- Velothi Ur-Mage's Amulet
	},

	specialNames = {
		[-101] = "Maj",
		[-102] = "Glirion",
		[-103] = "Urgarlag",

		[-201] = "Bruma",
		[-202] = "Vlastarus",
		[-203] = "Cropsford",
		[-204] = "Chorrol",
		[-205] = "Cheydinhal",
	},

	zoneClassification = {
		-- Daggerfall Covenant -------------------------------------------------
		[ 534] = 1, -- Stros M'Kai
		[ 535] = 1, -- Betnikh
		[   3] = 1, -- Glenumbra
		[  19] = 1, -- Stormhaven
		[  20] = 1, -- Rivenspire
		[ 104] = 1, -- Alik'r Desert
		[  92] = 1, -- Bangkorai

		-- Aldmeri Dominion ----------------------------------------------------
		[ 537] = 1, -- Khenarthi's Roost
		[ 381] = 1, -- Auridon
		[ 383] = 1, -- Grahtwood
		[ 108] = 1, -- Greenshade
		[  58] = 1, -- Malabal Tor
		[ 382] = 1, -- Reaper's March

		-- Ebonheart Pact ------------------------------------------------------
		[ 280] = 1, -- Bleakrock Isle
		[ 281] = 1, -- Bal Foyen
		[  41] = 1, -- Stonefalls
		[  57] = 1, -- Deshaan
		[ 117] = 1, -- Shadowfen
		[ 101] = 1, -- Eastmarch
		[ 103] = 1, -- The Rift

		-- Neutral -------------------------------------------------------------
		[ 347] = 1, -- Coldharbour
		[ 267] = 1, -- Eyevea
		[ 642] = 1, -- The Earth Forge
		[ 888] = 1, -- Craglorn
		[ 684] = 1, -- Wrothgar
		[ 816] = 1, -- Hew's Bane
		[ 823] = 1, -- The Gold Coast
		[ 849] = 1, -- Vvardenfell
		[ 980] = 1, -- The Clockwork City
		[ 981] = 1, -- The Brass Fortress
		[1011] = 1, -- Summerset
		[1027] = 1, -- Artaeum
		[ 726] = 1, -- Murkmire
		[1086] = 1, -- Northern Elsweyr
		[1133] = 1, -- Southern Elsweyr
		[1160] = 1, -- Western Skyrim
		[1161] = 1, -- Blackreach: Greymoor Caverns
		[1207] = 1, -- The Reach
		[1208] = 1, -- Blackreach: Arkthzand Cavern
		[1261] = 1, -- Blackwood
		[1283] = 1, -- The Shambles
		[1286] = 1, -- The Deadlands
		[1318] = 1, -- High Isle
		[1383] = 1, -- Galen
		[1413] = 1, -- Apocrypha
		[1414] = 1, -- Telvanni Peninsula

		-- PvP -----------------------------------------------------------------
		[ 181] = 2, -- Cyrodiil
		[ 584] = 2, -- Imperial City
		[ 643] = 2, -- Imperial Sewers

		-- Dungeons ------------------------------------------------------------
		[ 144] = 3, -- Spindleclutch I
		[ 936] = 3, -- Spindleclutch II
		[ 380] = 3, -- The Banished Cells I
		[ 935] = 3, -- The Banished Cells II
		[ 283] = 3, -- Fungal Grotto I
		[ 934] = 3, -- Fungal Grotto II
		[ 146] = 3, -- Wayrest Sewers I
		[ 933] = 3, -- Wayrest Sewers II
		[ 126] = 3, -- Elden Hollow I
		[ 931] = 3, -- Elden Hollow II
		[  63] = 3, -- Darkshade Caverns I
		[ 930] = 3, -- Darkshade Caverns II
		[ 130] = 3, -- Crypt of Hearts I
		[ 932] = 3, -- Crypt of Hearts II
		[ 176] = 3, -- City of Ash I
		[ 681] = 3, -- City of Ash II
		[ 148] = 3, -- Arx Corinium
		[  22] = 3, -- Volenfell
		[ 131] = 3, -- Tempest Island
		[ 449] = 3, -- Direfrost Keep
		[  38] = 3, -- Blackheart Haven
		[  31] = 3, -- Selene's Web
		[  64] = 3, -- Blessed Crucible
		[  11] = 3, -- Vaults of Madness
		[ 678] = 3, -- Imperial City Prison
		[ 688] = 3, -- White-Gold Tower
		[ 843] = 3, -- Ruins of Mazzatun
		[ 848] = 3, -- Cradle of Shadows
		[ 973] = 3, -- Bloodroot Forge
		[ 974] = 3, -- Falkreath Hold
		[1009] = 3, -- Fang Lair
		[1010] = 3, -- Scalecaller Peak
		[1052] = 3, -- Moon Hunter Keep
		[1055] = 3, -- March of Sacrifices
		[1080] = 3, -- Frostvault
		[1081] = 3, -- Depths of Malatar
		[1122] = 3, -- Moongrave Fane
		[1123] = 3, -- Lair of Maarselok
		[1152] = 3, -- Icereach
		[1153] = 3, -- Unhallowed Grave
		[1197] = 3, -- Stone Garden
		[1201] = 3, -- Castle Thorn
		[1228] = 3, -- Black Drake Villa
		[1229] = 3, -- The Cauldron
		[1267] = 3, -- Red Petal Bastion
		[1268] = 3, -- The Dread Cellar
		[1301] = 3, -- Coral Aerie
		[1302] = 3, -- Shipwright's Regret
		[1360] = 3, -- Earthen Root Enclave
		[1361] = 3, -- Graven Deep
		[1389] = 3, -- Bal Sunnar
		[1390] = 3, -- Scrivener's Hall

		-- Trials --------------------------------------------------------------
		[ 636] = 4, -- Hel Ra Citadel
		[ 638] = 4, -- Aetherian Archive
		[ 639] = 4, -- Sanctum Ophidia
		[ 635] = 4, -- Dragonstar Arena
		[ 677] = 4, -- Maelstrom Arena
		[ 725] = 4, -- Maw of Lorkhaj
		[ 975] = 4, -- Halls of Fabrication
		[1000] = 4, -- Asylum Sanctorium
		[1051] = 4, -- Cloudrest
		[1082] = 4, -- Blackrose Prison
		[1121] = 4, -- Sunspire
		[1196] = 4, -- Kyne's Aegis
		[1227] = 4, -- Vateshran Hollows
		[1263] = 4, -- Rockgrove
		[1344] = 4, -- Dreadsail Reef
		[1427] = 4, -- Sanity's Edge

		-- Miscellaneous -------------------------------------------------------
		[  -1] = 3, -- Random Dungeon Finder
		[  -2] = 2, -- Battlegrounds
		[  -3] =-1, -- Level Up Rewards
		[  -4] = 2, -- Rewards for the Worthy
		[  -5] = 5, -- Antiquities
	},
}
