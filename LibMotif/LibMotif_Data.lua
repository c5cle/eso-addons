LibMotif = LibMotif or {}

-- Motif ID ==> Achievement ID
--
-- is_simple = true
--
-- 		For the few motifs that lack 14 individual purple pages,
-- 		is_simple is true. Use IsSmithingStyleKnown(motif_id).
--
-- achievement_id = 1423
--
-- 		For motifs with 14 individual purple pages, achievement_id tells
-- 		the achievement_id to pass to
-- 		GetAchievementCriterion(achievement_id, page_index)
--      where n is a number 1-14.

LibMotif.DATA = {
    [  1] = { is_simple       =  true } -- Breton
,   [  2] = { is_simple       =  true } -- Redguard
,   [  3] = { is_simple       =  true } -- Orc
,   [  4] = { is_simple       =  true } -- Dark Elf
,   [  5] = { is_simple       =  true } -- Nord
,   [  6] = { is_simple       =  true } -- Argonian
,   [  7] = { is_simple       =  true } -- High Elf
,   [  8] = { is_simple       =  true } -- Wood Elf
,   [  9] = { is_simple       =  true } -- Khajiit
,   [ 10] = nil                         -- Unique
,   [ 11] = { achievement_id  =  1423 } -- Thieves Guild
,   [ 12] = { achievement_id  =  1661 } -- Dark Brotherhood
,   [ 13] = { achievement_id  =  1412 } -- Malacath
,   [ 14] = { achievement_id  =  1144 } -- Dwemer
,   [ 15] = { is_simple       =  true } -- Ancient Elf
,   [ 16] = { achievement_id  =  1660 } -- Order of the Hour
,   [ 17] = { is_simple       =  true } -- Barbaric
,   [ 18] = nil                         -- Bandit
,   [ 19] = { is_simple       =  true } -- Primal
,   [ 20] = { is_simple       =  true } -- Daedric
,   [ 21] = { achievement_id  =  1411 } -- Trinimac
,   [ 22] = { achievement_id  =  1341 } -- Ancient Orc
,   [ 23] = { achievement_id  =  1416 } -- Daggerfall Covenant
,   [ 24] = { achievement_id  =  1414 } -- Ebonheart Pact
,   [ 25] = { achievement_id  =  1415 } -- Aldmeri Dominion
,   [ 26] = { achievement_id  =  1348 } -- Mercenary
,   [ 27] = { achievement_id  =  1714 } -- Celestial
,   [ 28] = { achievement_id  =  1319 } -- Glass
,   [ 29] = { achievement_id  =  1181 } -- Xivkyn
,   [ 30] = { is_simple       =  true } -- Soul Shriven
,   [ 31] = { achievement_id  =  1715 } -- Draugr
,   [ 32] = nil                         -- Maormer
,   [ 33] = { achievement_id  =  1318 } -- Akaviri
,   [ 34] = { is_simple       =  true } -- Imperial
,   [ 35] = { achievement_id  =  1713 } -- Yokudan
,   [ 36] = nil                         -- Universal
,   [ 37] = nil                         -- Reach Winter
,   [ 38] = { is_simple       =  true } -- Tsaesci
,   [ 39] = { achievement_id  =  1662 } -- Minotaur
,   [ 40] = { achievement_id  =  1798 } -- Ebony
,   [ 41] = { achievement_id  =  1422 } -- Abah's Watch
,   [ 42] = { achievement_id  =  1676 } -- Skinchanger
,   [ 43] = { achievement_id  =  1933 } -- Morag Tong
,   [ 44] = { achievement_id  =  1797 } -- Ra Gada
,   [ 45] = { achievement_id  =  1659 } -- Dro-m'Athra
,   [ 46] = { achievement_id  =  1424 } -- Assassins League
,   [ 47] = { achievement_id  =  1417 } -- Outlaw
,   [ 48] = { achievement_id  =  2022 } -- Redoran
,   [ 49] = { achievement_id  =  2021 } -- Hlaalu
,   [ 50] = { achievement_id  =  1935 } -- Militant Ordinator
,   [ 51] = { achievement_id  =  2023 } -- Telvanni
,   [ 52] = { achievement_id  =  1934 } -- Buoyant Armiger
,   [ 53] = { is_simple       =  true } -- Frostcaster
,   [ 54] = { achievement_id  =  1932 } -- Ashlander
,   [ 55] = { achievement_id  =  2120 } -- Worm Cult
,   [ 56] = { achievement_id  =  1796 } -- Silken Ring
,   [ 57] = { achievement_id  =  1795 } -- Mazzatun
,   [ 58] = { is_simple       =  true } -- Grim Harlequin
,   [ 59] = { achievement_id  =  1545 } -- Hollowjack
,   [ 60] = { achievement_id  =  2024 } -- Refabricated
,   [ 61] = { achievement_id  =  2098 } -- Bloodforge
,   [ 62] = { achievement_id  =  2097 } -- Dreadhorn
,   [ 63] = nil                         --
,   [ 64] = nil                         --
,   [ 65] = { achievement_id  =  2044 } -- Apostle
,   [ 66] = { achievement_id  =  2045 } -- Ebonshadow
,   [ 67] = nil                         -- Undaunted
,   [ 68] = nil                         --
,   [ 69] = { achievement_id  =  2190 } -- Fang Lair
,   [ 70] = { achievement_id  =  2189 } -- Scalecaller
,   [ 71] = { achievement_id  =  2186 } -- Psijic Order
,   [ 72] = { achievement_id  =  2187 } -- Sapiarch
,   [ 73] = { achievement_id  =  2319 } -- Welkynar
,   [ 74] = { achievement_id  =  2188 } -- Dremora
,   [ 75] = { achievement_id  =  2285 } -- Pyandonean
,   [ 76] = nil                         -- Divine Prosecution
,   [ 77] = { achievement_id  =  2317 } -- Huntsman
,   [ 78] = { achievement_id  =  2318 } -- Silver Dawn
,   [ 79] = { achievement_id  =  2360 } -- Dead-Water
,   [ 80] = { achievement_id  =  2359 } -- Honor Guard
,   [ 81] = { achievement_id  =  2361 } -- Elder Argonian
,   [ 82] = { achievement_id  =  2503 } -- Coldsnap
,   [ 83] = { achievement_id  =  2504 } -- Meridian
,   [ 84] = { achievement_id  =  2505 } -- Anequina
,   [ 85] = { achievement_id  =  2506 } -- Pellitine
,   [ 86] = { achievement_id  =  2507 } -- Sunspire
,   [ 87] = nil                         -- Dragon Bone
,   [ 88] = nil                         --
,   [ 89] = { achievement_id  =  2629 } -- Stags of Z'en
,   [ 90] = nil                         --
,   [ 91] = nil                         --
,   [ 92] = { achievement_id  =  2630 } -- Dragonguard
,   [ 93] = { achievement_id  =  2628 } -- Moongrave Fane
,   [ 94] = { achievement_id  =  2748 } -- New Moon Priest
,   [ 95] = { achievement_id  =  2750 } -- Shield of Senchal
,   [ 96] = nil                         --
,   [ 97] = { achievement_id  =  2747 } -- Icereach Coven
,   [ 98] = { achievement_id  =  2749 } -- Pyre Watch
,   [ 99] = nil                         -- Swordthane
,   [100] = { achievement_id  =  2757 } -- Blackreach Vanguard
,   [101] = { achievement_id  =  2761 } -- Greymoor
,   [102] = { achievement_id  =  2762 } -- Sea Giant
,   [103] = { achievement_id  =  2763 } -- Ancestral Nord
,   [104] = { achievement_id  =  2773 } -- Ancestral High Elf
,   [105] = { achievement_id  =  2776 } -- Ancestral Orc
,   [106] = { achievement_id  =  2849 } -- Thorn Legion
,   [107] = { achievement_id  =  2850 } -- Hazardous Alchemy
,   [108] = { achievement_id  =  2903 } -- Ancestral Akaviri
,   [109] = nil                         --
,   [110] = { achievement_id  =  2905 } -- Ancestral Reach
,   [111] = { achievement_id  =  2926 } -- Nighthollow
,   [112] = { achievement_id  =  2938 } -- Arkthzand Armory
,   [113] = { achievement_id  =  2998 } -- Wayward Guardian
,   [114] = { achievement_id  =  2959 } -- House Hexos
,   [115] = nil                         -- Deadlands Gladiator
,   [116] = { achievement_id  =  2984 } -- True-Sworn
,   [117] = { achievement_id  =  2991 } -- Waking Flame
,   [118] = nil                         -- Dremora Kynreeve
,   [119] = { achievement_id  =  2999 } -- Ancient Daedric
,   [120] = { achievement_id  =  3000 } -- Black Fin Legion
,   [121] = { achievement_id  =  3001 } -- Ivory Brigade
,   [122] = { achievement_id  =  3002 } -- Sul-Xan
,   [123] = { achievement_id  =  3094 } -- Crimson Oath
,   [124] = { achievement_id  =  3097 } -- Silver Rose
,   [125] = nil                         -- Annihilarch's Chosen
,   [126] = nil                         -- Fargrave Guardian
}

-- What to pass as page_index for
-- GetAchievementCriterion(achievement_id, page_index)
LibMotif.MOTIF_PAGE = {
    AXES       =  1     -- ITEM_STYLE_CHAPTER_AXES      = 10
,   BELTS      =  2     -- ITEM_STYLE_CHAPTER_BELTS     =  6
,   BOOTS      =  3     -- ITEM_STYLE_CHAPTER_BOOTS     =  3
,   BOWS       =  4     -- ITEM_STYLE_CHAPTER_BOWS      = 14
,   CHESTS     =  5     -- ITEM_STYLE_CHAPTER_CHESTS    =  5
,   DAGGERS    =  6     -- ITEM_STYLE_CHAPTER_DAGGERS   = 11
,   GLOVES     =  7     -- ITEM_STYLE_CHAPTER_GLOVES    =  2
,   HELMETS    =  8     -- ITEM_STYLE_CHAPTER_HELMETS   =  1
,   LEGS       =  9     -- ITEM_STYLE_CHAPTER_LEGS      =  4
,   MACES      = 10     -- ITEM_STYLE_CHAPTER_MACES     =  9
,   SHIELDS    = 11     -- ITEM_STYLE_CHAPTER_SHIELDS   = 13
,   SHOULDERS  = 12     -- ITEM_STYLE_CHAPTER_SHOULDERS =  7
,   STAVES     = 13     -- ITEM_STYLE_CHAPTER_STAVES    = 12
,   SWORDS     = 14     -- ITEM_STYLE_CHAPTER_SWORDS    =  8
}

-- Convert from LibMotif to LibCharacterKnowledge page indices.
LibMotif.MOTIF_PAGE_TO_CHAPTER = {
    [LibMotif.MOTIF_PAGE.AXES       ] = ITEM_STYLE_CHAPTER_AXES      -- 10
,   [LibMotif.MOTIF_PAGE.BELTS      ] = ITEM_STYLE_CHAPTER_BELTS     --  6
,   [LibMotif.MOTIF_PAGE.BOOTS      ] = ITEM_STYLE_CHAPTER_BOOTS     --  3
,   [LibMotif.MOTIF_PAGE.BOWS       ] = ITEM_STYLE_CHAPTER_BOWS      -- 14
,   [LibMotif.MOTIF_PAGE.CHESTS     ] = ITEM_STYLE_CHAPTER_CHESTS    --  5
,   [LibMotif.MOTIF_PAGE.DAGGERS    ] = ITEM_STYLE_CHAPTER_DAGGERS   -- 11
,   [LibMotif.MOTIF_PAGE.GLOVES     ] = ITEM_STYLE_CHAPTER_GLOVES    --  2
,   [LibMotif.MOTIF_PAGE.HELMETS    ] = ITEM_STYLE_CHAPTER_HELMETS   --  1
,   [LibMotif.MOTIF_PAGE.LEGS       ] = ITEM_STYLE_CHAPTER_LEGS      --  4
,   [LibMotif.MOTIF_PAGE.MACES      ] = ITEM_STYLE_CHAPTER_MACES     --  9
,   [LibMotif.MOTIF_PAGE.SHIELDS    ] = ITEM_STYLE_CHAPTER_SHIELDS   -- 13
,   [LibMotif.MOTIF_PAGE.SHOULDERS  ] = ITEM_STYLE_CHAPTER_SHOULDERS --  7
,   [LibMotif.MOTIF_PAGE.STAVES     ] = ITEM_STYLE_CHAPTER_STAVES    -- 12
,   [LibMotif.MOTIF_PAGE.SWORDS     ] = ITEM_STYLE_CHAPTER_SWORDS    --  8
}
