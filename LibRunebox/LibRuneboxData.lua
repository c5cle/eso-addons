LibRunebox = LibRunebox or {}

local lib = LibRunebox

lib.TYPE_CONTAINER             = 1
lib.TYPE_STYLEPAGE             = 2
lib.TYPE_BOUNDSTYLEPAGE        = 3
lib.TYPE_COLLECTIBLE_FRAGMENT  = 4

lib.lastAPIVersion = 100031
lib.lastScannedItemId = 166706
lib.preloadedRuneboxList = 
{
	[1] = { -- Runebox: Xivkyn Dreadguard
		["collectibleId"] = 148,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 79329,
	},
	[2] = { -- Runebox: Xivkyn Tormentor
		["collectibleId"] = 147,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 79330,
	},
	[3] = { -- Runebox: Xivkyn Augur
		["collectibleId"] = 146,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 79331,
	},
	[4] = { -- Runebox: Pumpkin Spectre Mask
		["collectibleId"] = 439,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 83516,
	},
	[5] = { -- Runebox: Scarecrow Spectre Mask
		["collectibleId"] = 440,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 83517,
	},
	[6] = { -- Runebox: Mud Ball Pouch
		["collectibleId"] = 601,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96391,
	},
	[7] = { -- Runebox: Sword-Swallower's Blade
		["collectibleId"] = 597,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96392,
	},
	[8] = { -- Runebox: Juggler's Knives
		["collectibleId"] = 598,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96393,
	},
	[9] = { -- Runebox: Fire-Breather's Torches
		["collectibleId"] = 600,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96395,
	},
	[10] = { -- Runebox: Nordic Bather's Towel
		["collectibleId"] = 753,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96951,
	},
	[11] = { -- Runebox: Colovian Fur Hood
		["collectibleId"] = 755,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96952,
	},
	[12] = { -- Runebox: Colovian Filigreed Hood
		["collectibleId"] = 754,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 96953,
	},
	[13] = { -- Runebox: Cherry Blossom Branch
		["collectibleId"] = 1108,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 119692,
	},
	[14] = { -- Runebox: Dwarven Theodolite Pet
		["collectibleId"] = 1232,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 124658,
	},
	[15] = { -- Runebox: Sixth House Robe Costume
		["collectibleId"] = 1230,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 124659,
	},
	[16] = { -- Runebox: Hollowjack Spectre Mask
		["collectibleId"] = 1338,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 128359,
	},
	[17] = { -- Runebox: Thicketman Spectre Mask
		["collectibleId"] = 1339,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 128360,
	},
	[18] = { -- Runebox: Clockwork Reliquary
		["collectibleId"] = 4660,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 133550,
	},
	[19] = { -- Runebox: Jester's Scintillator
		["collectibleId"] = 4797,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 134678,
	},
	[20] = { -- Runebox: Stonefire Scamp
		["collectibleId"] = 149,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 137962,
	},
	[21] = { -- Runebox: Soul-Shriven Skin
		["collectibleId"] = 161,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 137963,
	},
	[22] = { -- Runebox: Arena Gladiator Helm
		["collectibleId"] = 5019,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 138784,
	},
	[23] = { -- Runebox: Big-Eared Ginger Kitten Pet
		["collectibleId"] = 4996,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 139464,
	},
	[24] = { -- Runebox: Psijic Glowglobe Emote
		["collectibleId"] = 5047,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 139465,
	},
	[25] = { -- Style Page: Molag Kena's Mask
		["collectibleId"] = 5454,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140308,
	},
	[26] = { -- Style Page: Molag Kena's Shoulder
		["collectibleId"] = 5455,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140309,
	},
	[27] = { -- Style Page: Shadowrend's Shoulder
		["collectibleId"] = 5457,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140310,
	},
	[28] = { -- Style Page: Shadowrend's Mask
		["collectibleId"] = 5456,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140311,
	},
	[29] = { -- Style Page: Ilambris' Shoulder
		["collectibleId"] = 5453,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140312,
	},
	[30] = { -- Style Page: Ilambris' Mask
		["collectibleId"] = 5452,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 140313,
	},
	[31] = { -- Style Page: Fanged Worm Jerkin
		["collectibleId"] = 5355,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140314,
	},
	[32] = { -- Style Page: Fanged Worm Hat
		["collectibleId"] = 5356,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140315,
	},
	[33] = { -- Style Page: Fanged Worm Breeches
		["collectibleId"] = 5357,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140316,
	},
	[34] = { -- Style Page: Fanged Worm Epaulets
		["collectibleId"] = 5358,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140317,
	},
	[35] = { -- Style Page: Fanged Worm Shoes
		["collectibleId"] = 5359,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140318,
	},
	[36] = { -- Style Page: Fanged Worm Gloves
		["collectibleId"] = 5360,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140319,
	},
	[37] = { -- Style Page: Fanged Worm Robe
		["collectibleId"] = 5361,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140320,
	},
	[38] = { -- Style Page: Fanged Worm Sash
		["collectibleId"] = 5362,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140321,
	},
	[39] = { -- Style Page: Fanged Worm Jack
		["collectibleId"] = 5363,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140322,
	},
	[40] = { -- Style Page: Fanged Worm Helm
		["collectibleId"] = 5364,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140323,
	},
	[41] = { -- Style Page: Fanged Worm Guards
		["collectibleId"] = 5365,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140324,
	},
	[42] = { -- Style Page: Fanged Worm Arm Cops
		["collectibleId"] = 5366,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140325,
	},
	[43] = { -- Style Page: Fanged Worm Boots
		["collectibleId"] = 5367,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140326,
	},
	[44] = { -- Style Page: Fanged Worm Bracers
		["collectibleId"] = 5368,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140327,
	},
	[45] = { -- Style Page: Fanged Worm Belt
		["collectibleId"] = 5369,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140328,
	},
	[46] = { -- Style Page: Fanged Worm Cuirass
		["collectibleId"] = 5370,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140329,
	},
	[47] = { -- Style Page: Fanged Worm Helmet
		["collectibleId"] = 5371,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140330,
	},
	[48] = { -- Style Page: Fanged Worm Greaves
		["collectibleId"] = 5372,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140331,
	},
	[49] = { -- Style Page: Fanged Worm Pauldrons
		["collectibleId"] = 5373,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140332,
	},
	[50] = { -- Style Page: Fanged Worm Sabatons
		["collectibleId"] = 5374,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140333,
	},
	[51] = { -- Style Page: Fanged Worm Gauntlets
		["collectibleId"] = 5375,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140334,
	},
	[52] = { -- Style Page: Fanged Worm Girdle
		["collectibleId"] = 5376,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140335,
	},
	[53] = { -- Style Page: Fanged Worm Battle Axe
		["collectibleId"] = 5378,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140336,
	},
	[54] = { -- Style Page: Fanged Worm Maul
		["collectibleId"] = 5379,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140337,
	},
	[55] = { -- Style Page: Fanged Worm Greatsword
		["collectibleId"] = 5380,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140338,
	},
	[56] = { -- Style Page: Fanged Worm Axe
		["collectibleId"] = 5381,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140339,
	},
	[57] = { -- Style Page: Fanged Worm Bow
		["collectibleId"] = 5382,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140340,
	},
	[58] = { -- Style Page: Fanged Worm Dagger
		["collectibleId"] = 5383,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140341,
	},
	[59] = { -- Style Page: Fanged Worm Mace
		["collectibleId"] = 5384,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140342,
	},
	[60] = { -- Style Page: Fanged Worm Shield
		["collectibleId"] = 5385,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140343,
	},
	[61] = { -- Style Page: Fanged Worm Staff
		["collectibleId"] = 5386,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140344,
	},
	[62] = { -- Style Page: Fanged Worm Sword
		["collectibleId"] = 5387,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140345,
	},
	[63] = { -- Style Page: Horned Dragon Battle Axe
		["collectibleId"] = 5420,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140346,
	},
	[64] = { -- Style Page: Horned Dragon Maul
		["collectibleId"] = 5421,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140347,
	},
	[65] = { -- Style Page: Horned Dragon Greatsword
		["collectibleId"] = 5422,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140348,
	},
	[66] = { -- Style Page: Horned Dragon Axe
		["collectibleId"] = 5423,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140349,
	},
	[67] = { -- Style Page: Horned Dragon Bow
		["collectibleId"] = 5424,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140350,
	},
	[68] = { -- Style Page: Horned Dragon Dagger
		["collectibleId"] = 5425,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140351,
	},
	[69] = { -- Style Page: Horned Dragon Mace
		["collectibleId"] = 5426,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140352,
	},
	[70] = { -- Style Page: Horned Dragon Shield
		["collectibleId"] = 5427,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140353,
	},
	[71] = { -- Style Page: Horned Dragon Staff
		["collectibleId"] = 5428,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140354,
	},
	[72] = { -- Style Page: Horned Dragon Sword
		["collectibleId"] = 5429,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140355,
	},
	[73] = { -- Style Page: Horned Dragon Jerkin
		["collectibleId"] = 5430,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140356,
	},
	[74] = { -- Style Page: Horned Dragon Hat
		["collectibleId"] = 5431,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140357,
	},
	[75] = { -- Style Page: Horned Dragon Breeches
		["collectibleId"] = 5432,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140358,
	},
	[76] = { -- Style Page: Horned Dragon Epaulets
		["collectibleId"] = 5433,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140359,
	},
	[77] = { -- Style Page: Horned Dragon Shoes
		["collectibleId"] = 5434,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140360,
	},
	[78] = { -- Style Page: Horned Dragon Gloves
		["collectibleId"] = 5435,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140361,
	},
	[79] = { -- Style Page: Horned Dragon Robe
		["collectibleId"] = 5436,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140362,
	},
	[80] = { -- Style Page: Horned Dragon Sash
		["collectibleId"] = 5437,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140363,
	},
	[81] = { -- Style Page: Horned Dragon Helm
		["collectibleId"] = 5438,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140364,
	},
	[82] = { -- Style Page: Horned Dragon Jack
		["collectibleId"] = 5439,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140365,
	},
	[83] = { -- Style Page: Horned Dragon Guards
		["collectibleId"] = 5440,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140366,
	},
	[84] = { -- Style Page: Horned Dragon Arm Cops
		["collectibleId"] = 5441,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140367,
	},
	[85] = { -- Style Page: Horned Dragon Boots
		["collectibleId"] = 5442,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140368,
	},
	[86] = { -- Style Page: Horned Dragon Bracers
		["collectibleId"] = 5443,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140369,
	},
	[87] = { -- Style Page: Horned Dragon Belt
		["collectibleId"] = 5444,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140370,
	},
	[88] = { -- Style Page: Horned Dragon Cuirass
		["collectibleId"] = 5445,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140371,
	},
	[89] = { -- Style Page: Horned Dragon Helmet
		["collectibleId"] = 5446,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140372,
	},
	[90] = { -- Style Page: Horned Dragon Greaves
		["collectibleId"] = 5447,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140373,
	},
	[91] = { -- Style Page: Horned Dragon Pauldrons
		["collectibleId"] = 5448,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140374,
	},
	[92] = { -- Style Page: Horned Dragon Sabatons
		["collectibleId"] = 5449,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140375,
	},
	[93] = { -- Style Page: Horned Dragon Gauntlets
		["collectibleId"] = 5450,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140376,
	},
	[94] = { -- Style Page: Horned Dragon Girdle
		["collectibleId"] = 5451,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 140377,
	},
	[95] = { -- Runebox: Swamp Jelly
		["collectibleId"] = 5656,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 141749,
	},
	[96] = { -- Runebox: Arena Gladiator Costume
		["collectibleId"] = 5589,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 141750,
	},
	[97] = { -- Apple-Bobbing Fresh Gorapples
		["collectibleId"] = 6737,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141908,
	},
	[98] = { -- Apple-Bobbing Cold Iron Cauldron
		["collectibleId"] = 6738,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141909,
	},
	[99] = { -- Apple-Bobbing Aged Fetid Fish
		["collectibleId"] = 6739,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141910,
	},
	[100] = { -- Apple-Bobbing Stale Creek Water
		["collectibleId"] = 6740,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141911,
	},
	[101] = { -- Apple-Bobbing Poise Guide
		["collectibleId"] = 6741,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141912,
	},
	[102] = { -- Apple-Bobbing Viscous Slime
		["collectibleId"] = 6742,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141913,
	},
	[103] = { -- Apple-Bobbing Fenwood Ladle
		["collectibleId"] = 6743,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 141914,
	},
	[104] = { -- Runebox: Apple-Bobbing Cauldron
		["collectibleId"] = 5590,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 141915,
	},
	[105] = { -- Style Page: Pit Daemon Cuirass
		["collectibleId"] = 5621,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141977,
	},
	[106] = { -- Style Page: Pit Daemon Helmet
		["collectibleId"] = 5622,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141978,
	},
	[107] = { -- Style Page: Pit Daemon Greaves
		["collectibleId"] = 5623,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141979,
	},
	[108] = { -- Style Page: Pit Daemon Pauldrons
		["collectibleId"] = 5624,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141980,
	},
	[109] = { -- Style Page: Pit Daemon Sabatons
		["collectibleId"] = 5625,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141981,
	},
	[110] = { -- Style Page: Pit Daemon Gauntlets
		["collectibleId"] = 5626,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141982,
	},
	[111] = { -- Style Page: Pit Daemon Girdle
		["collectibleId"] = 5627,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141983,
	},
	[112] = { -- Style Page: Stormlord Cuirass
		["collectibleId"] = 5628,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141984,
	},
	[113] = { -- Style Page: Stormlord Helmet
		["collectibleId"] = 5629,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141985,
	},
	[114] = { -- Style Page: Stormlord Greaves
		["collectibleId"] = 5630,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141986,
	},
	[115] = { -- Style Page: Stormlord Pauldrons
		["collectibleId"] = 5631,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141987,
	},
	[116] = { -- Style Page: Stormlord Sabatons
		["collectibleId"] = 5632,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141988,
	},
	[117] = { -- Style Page: Stormlord Gauntlets
		["collectibleId"] = 5633,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141989,
	},
	[118] = { -- Style Page: Stormlord Girdle
		["collectibleId"] = 5634,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141990,
	},
	[119] = { -- Style Page: Fire Drake Cuirass
		["collectibleId"] = 5645,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141991,
	},
	[120] = { -- Style Page: Fire Drake Helmet
		["collectibleId"] = 5646,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141992,
	},
	[121] = { -- Style Page: Fire Drake Greaves
		["collectibleId"] = 5647,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141993,
	},
	[122] = { -- Style Page: Fire Drake Pauldrons
		["collectibleId"] = 5648,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141994,
	},
	[123] = { -- Style Page: Fire Drake Sabatons
		["collectibleId"] = 5649,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141995,
	},
	[124] = { -- Style Page: Fire Drake Gauntlets
		["collectibleId"] = 5650,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141996,
	},
	[125] = { -- Style Page: Fire Drake Girdle
		["collectibleId"] = 5651,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 141997,
	},
	[126] = { -- Emerald Indrik Feather
		["collectibleId"] = 6706,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 142006,
	},
	[127] = { -- Gilded Indrik Feather
		["collectibleId"] = 6707,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 142007,
	},
	[128] = { -- Onyx Indrik Feather
		["collectibleId"] = 6708,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 142008,
	},
	[129] = { -- Opaline Indrik Feather
		["collectibleId"] = 6709,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 142009,
	},
	[130] = { -- Style Page: Iceheart's Mask
		["collectibleId"] = 5615,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142010,
	},
	[131] = { -- Style Page: Iceheart's Shoulder
		["collectibleId"] = 5616,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142011,
	},
	[132] = { -- Style Page: Grothdarr's Shoulder
		["collectibleId"] = 5546,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142012,
	},
	[133] = { -- Style Page: Grothdarr's Mask
		["collectibleId"] = 5545,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142013,
	},
	[134] = { -- Style Page: Troll King's Shoulder
		["collectibleId"] = 5608,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142014,
	},
	[135] = { -- Style Page: Troll King's Mask
		["collectibleId"] = 5607,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 142015,
	},
	[136] = { -- Dawnwood Berries of Bloom
		["collectibleId"] = 6659,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 145578,
	},
	[137] = { -- Dawnwood Berries of Budding
		["collectibleId"] = 6660,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 145579,
	},
	[138] = { -- Dawnwood Berries of Growth
		["collectibleId"] = 6661,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 145580,
	},
	[139] = { -- Dawnwood Berries of Ripeness
		["collectibleId"] = 6662,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 145581,
	},
	[140] = { -- Style Page: Bloodspawn's Mask
		["collectibleId"] = 5924,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146038,
	},
	[141] = { -- Style Page: Bloodspawn's Shoulder
		["collectibleId"] = 5925,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146040,
	},
	[142] = { -- Runebox: Arena Gladiator Emote
		["collectibleId"] = 5746,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 146041,
	},
	[143] = { -- Style Page: Sellistrix' Mask
		["collectibleId"] = 5763,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146043,
	},
	[144] = { -- Style Page: Sellistrix' Shoulder
		["collectibleId"] = 5764,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146044,
	},
	[145] = { -- Style Page: Swarm Mother's Mask
		["collectibleId"] = 5926,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146045,
	},
	[146] = { -- Style Page: Swarm Mother's Shoulder
		["collectibleId"] = 5927,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146046,
	},
	[147] = { -- Style Page: Engine Guardian Shoulder
		["collectibleId"] = 6045,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146074,
	},
	[148] = { -- Style Page: Engine Guardian Mask
		["collectibleId"] = 6044,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 146075,
	},
	[149] = { -- Runebox: Elinhir Arena Lion
		["collectibleId"] = 6064,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 147286,
	},
	[150] = { -- Style Page: Prophet's Hood
		["collectibleId"] = 6141,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147301,
	},
	[151] = { -- Style Page: Prophet's Sandals
		["collectibleId"] = 6143,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147302,
	},
	[152] = { -- Style Page: Prophet's Wraps
		["collectibleId"] = 6144,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147303,
	},
	[153] = { -- Style Page: Prophet's Robe
		["collectibleId"] = 6145,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147304,
	},
	[154] = { -- Style Page: Prophet's Shawl
		["collectibleId"] = 6142,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147305,
	},
	[155] = { -- Style Page: Prophet's Staff
		["collectibleId"] = 6146,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147306,
	},
	[156] = { -- Style Page: Lyris Titanborn's Cuirass
		["collectibleId"] = 6155,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147307,
	},
	[157] = { -- Style Page: Lyris Titanborn's Greaves
		["collectibleId"] = 6153,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147309,
	},
	[158] = { -- Style Page: Lyris Titanborn's Pauldrons
		["collectibleId"] = 6152,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147310,
	},
	[159] = { -- Style Page: Lyris Titanborn's Sabatons
		["collectibleId"] = 6151,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147311,
	},
	[160] = { -- Style Page: Lyris Titanborn's Gauntlets
		["collectibleId"] = 6150,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147312,
	},
	[161] = { -- Style Page: Lyris Titanborn's Girdle
		["collectibleId"] = 6149,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147313,
	},
	[162] = { -- Style Page: Lyris Titanborn's Battle Axe
		["collectibleId"] = 6148,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147314,
	},
	[163] = { -- Style Page: Lyris Titanborn's Shield
		["collectibleId"] = 6147,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147315,
	},
	[164] = { -- Style Page: Sai Sahan's Jack
		["collectibleId"] = 6157,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147316,
	},
	[165] = { -- Style Page: Sai Sahan's Guards
		["collectibleId"] = 6158,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147317,
	},
	[166] = { -- Style Page: Sai Sahan's Arm Cops
		["collectibleId"] = 6159,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147318,
	},
	[167] = { -- Style Page: Sai Sahan's Boots
		["collectibleId"] = 6160,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147319,
	},
	[168] = { -- Style Page: Sai Sahan's Bracers
		["collectibleId"] = 6161,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147320,
	},
	[169] = { -- Style Page: Sai Sahan's Belt
		["collectibleId"] = 6162,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147321,
	},
	[170] = { -- Style Page: Sai Sahan's Greatsword
		["collectibleId"] = 6163,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147322,
	},
	[171] = { -- Style Page: Sai Sahan's Sword
		["collectibleId"] = 6164,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147323,
	},
	[172] = { -- Style Page: Abnur Tharn's Jerkin
		["collectibleId"] = 6165,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147324,
	},
	[173] = { -- Style Page: Abnur Tharn's Breeches
		["collectibleId"] = 6167,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147326,
	},
	[174] = { -- Style Page: Abnur Tharn's Epaulets
		["collectibleId"] = 6168,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147327,
	},
	[175] = { -- Style Page: Abnur Tharn's Shoes
		["collectibleId"] = 6169,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147328,
	},
	[176] = { -- Style Page: Abnur Tharn's Gloves
		["collectibleId"] = 6170,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147329,
	},
	[177] = { -- Style Page: Abnur Tharn's Sash
		["collectibleId"] = 6171,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147330,
	},
	[178] = { -- Style Page: Abnur Tharn's Dagger
		["collectibleId"] = 6172,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147331,
	},
	[179] = { -- Style Page: Abnur Tharn's Staff
		["collectibleId"] = 6173,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147332,
	},
	[180] = { -- Bound Style Page: Prophet's Hood
		["collectibleId"] = 6141,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147333,
	},
	[181] = { -- Bound Style Page: Prophet's Sandals
		["collectibleId"] = 6143,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147334,
	},
	[182] = { -- Bound Style Page: Prophet's Wraps
		["collectibleId"] = 6144,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147335,
	},
	[183] = { -- Bound Style Page: Prophet's Robe
		["collectibleId"] = 6145,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147336,
	},
	[184] = { -- Bound Style Page: Prophet's Shawl
		["collectibleId"] = 6142,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147337,
	},
	[185] = { -- Bound Style Page: Prophet's Staff
		["collectibleId"] = 6146,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147338,
	},
	[186] = { -- Bound Style Page: Lyris Titanborn's Cuirass
		["collectibleId"] = 6155,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147339,
	},
	[187] = { -- Bound Style Page: Lyris Titanborn's Greaves
		["collectibleId"] = 6153,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147341,
	},
	[188] = { -- Bound Style Page: Lyris Titanborn's Pauldrons
		["collectibleId"] = 6152,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147342,
	},
	[189] = { -- Bound Style Page: Lyris Titanborn's Sabatons
		["collectibleId"] = 6151,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147343,
	},
	[190] = { -- Bound Style Page: Lyris Titanborn's Gauntlets
		["collectibleId"] = 6150,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147344,
	},
	[191] = { -- Bound Style Page: Lyris Titanborn's Girdle
		["collectibleId"] = 6149,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147345,
	},
	[192] = { -- Bound Style Page: Lyris Titanborn's Battle Axe
		["collectibleId"] = 6148,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147346,
	},
	[193] = { -- Bound Style Page: Lyris Titanborn's Shield
		["collectibleId"] = 6147,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147347,
	},
	[194] = { -- Bound Style Page: Sai Sahan's Jack
		["collectibleId"] = 6157,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147348,
	},
	[195] = { -- Bound Style Page: Sai Sahan's Guards
		["collectibleId"] = 6158,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147349,
	},
	[196] = { -- Bound Style Page: Sai Sahan's Arm Cops
		["collectibleId"] = 6159,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147350,
	},
	[197] = { -- Bound Style Page: Sai Sahan's Boots
		["collectibleId"] = 6160,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147351,
	},
	[198] = { -- Bound Style Page: Sai Sahan's Bracers
		["collectibleId"] = 6161,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147352,
	},
	[199] = { -- Bound Style Page: Sai Sahan's Belt
		["collectibleId"] = 6162,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147353,
	},
	[200] = { -- Bound Style Page: Sai Sahan's Greatsword
		["collectibleId"] = 6163,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147354,
	},
	[201] = { -- Bound Style Page: Sai Sahan's Sword
		["collectibleId"] = 6164,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147355,
	},
	[202] = { -- Bound Style Page: Abnur Tharn's Jerkin
		["collectibleId"] = 6165,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147356,
	},
	[203] = { -- Bound Style Page: Abnur Tharn's Breeches
		["collectibleId"] = 6167,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147358,
	},
	[204] = { -- Bound Style Page: Abnur Tharn's Epaulets
		["collectibleId"] = 6168,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147359,
	},
	[205] = { -- Bound Style Page: Abnur Tharn's Shoes
		["collectibleId"] = 6169,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147360,
	},
	[206] = { -- Bound Style Page: Abnur Tharn's Gloves
		["collectibleId"] = 6170,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147361,
	},
	[207] = { -- Bound Style Page: Abnur Tharn's Sash
		["collectibleId"] = 6171,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147362,
	},
	[208] = { -- Bound Style Page: Abnur Tharn's Dagger
		["collectibleId"] = 6172,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147363,
	},
	[209] = { -- Bound Style Page: Abnur Tharn's Staff
		["collectibleId"] = 6173,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147364,
	},
	[210] = { -- Style Page: Valkyn Skoria's Mask
		["collectibleId"] = 6174,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147428,
	},
	[211] = { -- Style Page: Valkyn Skoria's Shoulder
		["collectibleId"] = 6175,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147429,
	},
	[212] = { -- Style Page: Cadwell's \"Battle Axe\"
		["collectibleId"] = 6097,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147467,
	},
	[213] = { -- Style Page: Cadwell's \"Maul\"
		["collectibleId"] = 6098,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147468,
	},
	[214] = { -- Style Page: Cadwell's \"Greatsword\"
		["collectibleId"] = 6099,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147469,
	},
	[215] = { -- Style Page: Cadwell's \"Axe\"
		["collectibleId"] = 6100,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147470,
	},
	[216] = { -- Style Page: Cadwell's \"Bow\"
		["collectibleId"] = 6101,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147471,
	},
	[217] = { -- Style Page: Cadwell's \"Dagger\"
		["collectibleId"] = 6102,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147472,
	},
	[218] = { -- Style Page: Cadwell's \"Mace\"
		["collectibleId"] = 6103,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147473,
	},
	[219] = { -- Style Page: Cadwell's \"Shield\"
		["collectibleId"] = 6104,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147474,
	},
	[220] = { -- Style Page: Cadwell's \"Staff\"
		["collectibleId"] = 6105,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147475,
	},
	[221] = { -- Style Page: Cadwell's \"Sword\"
		["collectibleId"] = 6106,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147476,
	},
	[222] = { -- Bound Style Page: Cadwell's \"Battle Axe\"
		["collectibleId"] = 6097,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147478,
	},
	[223] = { -- Bound Style Page: Cadwell's \"Maul\"
		["collectibleId"] = 6098,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147479,
	},
	[224] = { -- Bound Style Page: Cadwell's \"Greatsword\"
		["collectibleId"] = 6099,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147480,
	},
	[225] = { -- Bound Style Page: Cadwell's \"Axe\"
		["collectibleId"] = 6100,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147481,
	},
	[226] = { -- Bound Style Page: Cadwell's \"Bow\"
		["collectibleId"] = 6101,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147482,
	},
	[227] = { -- Bound Style Page: Cadwell's \"Dagger\"
		["collectibleId"] = 6102,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147483,
	},
	[228] = { -- Bound Style Page: Cadwell's \"Mace\"
		["collectibleId"] = 6103,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147484,
	},
	[229] = { -- Bound Style Page: Cadwell's \"Shield\"
		["collectibleId"] = 6104,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147485,
	},
	[230] = { -- Bound Style Page: Cadwell's \"Staff\"
		["collectibleId"] = 6105,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147486,
	},
	[231] = { -- Bound Style Page: Cadwell's \"Sword\"
		["collectibleId"] = 6106,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147487,
	},
	[232] = { -- Runebox: Guar Stomp Emote
		["collectibleId"] = 6197,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 147499,
	},
	[233] = { -- Luminous Berries of Bloom
		["collectibleId"] = 6694,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 147514,
	},
	[234] = { -- Luminous Berries of Budding
		["collectibleId"] = 6695,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 147515,
	},
	[235] = { -- Luminous Berries of Growth
		["collectibleId"] = 6696,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 147516,
	},
	[236] = { -- Luminous Berries of Ripeness
		["collectibleId"] = 6697,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 147517,
	},
	[237] = { -- Style Page: Pit Daemon Battle Axe
		["collectibleId"] = 6229,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147534,
	},
	[238] = { -- Style Page: Pit Daemon Maul
		["collectibleId"] = 6230,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147535,
	},
	[239] = { -- Style Page: Pit Daemon Greatsword
		["collectibleId"] = 6231,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147536,
	},
	[240] = { -- Style Page: Pit Daemon Axe
		["collectibleId"] = 6232,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147537,
	},
	[241] = { -- Style Page: Pit Daemon Bow
		["collectibleId"] = 6233,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147538,
	},
	[242] = { -- Style Page: Pit Daemon Dagger
		["collectibleId"] = 6234,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147539,
	},
	[243] = { -- Style Page: Pit Daemon Mace
		["collectibleId"] = 6235,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147540,
	},
	[244] = { -- Style Page: Pit Daemon Shield
		["collectibleId"] = 6236,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147541,
	},
	[245] = { -- Style Page: Pit Daemon Staff
		["collectibleId"] = 6237,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147542,
	},
	[246] = { -- Style Page: Pit Daemon Sword
		["collectibleId"] = 6238,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147543,
	},
	[247] = { -- Style Page: Stormlord Battle Axe
		["collectibleId"] = 6209,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147544,
	},
	[248] = { -- Style Page: Stormlord Maul
		["collectibleId"] = 6210,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147545,
	},
	[249] = { -- Style Page: Stormlord Greatsword
		["collectibleId"] = 6211,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147546,
	},
	[250] = { -- Style Page: Stormlord Axe
		["collectibleId"] = 6212,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147547,
	},
	[251] = { -- Style Page: Stormlord Bow
		["collectibleId"] = 6213,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147548,
	},
	[252] = { -- Style Page: Stormlord Dagger
		["collectibleId"] = 6214,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147549,
	},
	[253] = { -- Style Page: Stormlord Mace
		["collectibleId"] = 6215,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147550,
	},
	[254] = { -- Style Page: Stormlord Shield
		["collectibleId"] = 6216,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147551,
	},
	[255] = { -- Style Page: Stormlord Staff
		["collectibleId"] = 6217,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147552,
	},
	[256] = { -- Style Page: Stormlord Sword
		["collectibleId"] = 6218,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147553,
	},
	[257] = { -- Style Page: Fire Drake Battle Axe
		["collectibleId"] = 6219,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147554,
	},
	[258] = { -- Style Page: Fire Drake Maul
		["collectibleId"] = 6220,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147555,
	},
	[259] = { -- Style Page: Fire Drake Greatsword
		["collectibleId"] = 6221,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147556,
	},
	[260] = { -- Style Page: Fire Drake Axe
		["collectibleId"] = 6222,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147557,
	},
	[261] = { -- Style Page: Fire Drake Bow
		["collectibleId"] = 6223,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147558,
	},
	[262] = { -- Style Page: Fire Drake Dagger
		["collectibleId"] = 6224,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147559,
	},
	[263] = { -- Style Page: Fire Drake Mace
		["collectibleId"] = 6225,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147560,
	},
	[264] = { -- Style Page: Fire Drake Shield
		["collectibleId"] = 6226,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147561,
	},
	[265] = { -- Style Page: Fire Drake Staff
		["collectibleId"] = 6227,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147562,
	},
	[266] = { -- Style Page: Fire Drake Sword
		["collectibleId"] = 6228,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147563,
	},
	[267] = { -- Style Page: Nightflame's Mask
		["collectibleId"] = 6251,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147601,
	},
	[268] = { -- Style Page: Nightflame's Shoulder
		["collectibleId"] = 6252,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147602,
	},
	[269] = { -- Style Page: Prophet's Breeches
		["collectibleId"] = 6295,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147660,
	},
	[270] = { -- Bound Style Page: Prophet's Breeches
		["collectibleId"] = 6295,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 147661,
	},
	[271] = { -- Style Page: Lord Warden's Mask
		["collectibleId"] = 6388,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147767,
	},
	[272] = { -- Style Page: Lord Warden's Shoulder
		["collectibleId"] = 6389,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 147768,
	},
	[273] = { -- Onyx Berries of Bloom
		["collectibleId"] = 6698,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150379,
	},
	[274] = { -- Onyx Berries of Budding
		["collectibleId"] = 6699,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150380,
	},
	[275] = { -- Onyx Berries of Growth
		["collectibleId"] = 6700,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150381,
	},
	[276] = { -- Onyx Berries of Ripeness
		["collectibleId"] = 6701,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150382,
	},
	[277] = { -- Pure-Snow Berries of Bloom
		["collectibleId"] = 6702,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150770,
	},
	[278] = { -- Pure-Snow Berries of Budding
		["collectibleId"] = 6703,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150771,
	},
	[279] = { -- Pure-Snow Berries of Growth
		["collectibleId"] = 6704,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150772,
	},
	[280] = { -- Pure-Snow Berries of Ripeness
		["collectibleId"] = 6705,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 150773,
	},
	[281] = { -- Bound Style Page: Shadowrend Greatsword
		["collectibleId"] = 5463,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151561,
	},
	[282] = { -- Bound Style Page: Shadowrend Bow
		["collectibleId"] = 5464,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151562,
	},
	[283] = { -- Bound Style Page: Shadowrend Shield
		["collectibleId"] = 5465,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151563,
	},
	[284] = { -- Bound Style Page: Shadowrend Staff
		["collectibleId"] = 5466,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151564,
	},
	[285] = { -- Bound Style Page: Shadowrend Axe
		["collectibleId"] = 5467,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151565,
	},
	[286] = { -- Bound Style Page: Ilambris Battle Axe
		["collectibleId"] = 5162,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151566,
	},
	[287] = { -- Bound Style Page: Ilambris Bow
		["collectibleId"] = 5163,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151567,
	},
	[288] = { -- Bound Style Page: Ilambris Shield
		["collectibleId"] = 5164,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151568,
	},
	[289] = { -- Bound Style Page: Ilambris Staff
		["collectibleId"] = 5165,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151569,
	},
	[290] = { -- Bound Style Page: Ilambris Sword
		["collectibleId"] = 5166,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151570,
	},
	[291] = { -- Bound Style Page: Molag Kena Sword
		["collectibleId"] = 5118,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151571,
	},
	[292] = { -- Bound Style Page: Molag Kena Maul
		["collectibleId"] = 5123,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151572,
	},
	[293] = { -- Bound Style Page: Molag Kena Shield
		["collectibleId"] = 5124,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151573,
	},
	[294] = { -- Bound Style Page: Molag Kena Bow
		["collectibleId"] = 5125,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151574,
	},
	[295] = { -- Bound Style Page: Molag Kena Staff
		["collectibleId"] = 5126,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151575,
	},
	[296] = { -- Bound Style Page: Grothdar Mace
		["collectibleId"] = 5191,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151576,
	},
	[297] = { -- Bound Style Page: Grothdar Staff
		["collectibleId"] = 5192,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151577,
	},
	[298] = { -- Bound Style Page: Grothdar Maul
		["collectibleId"] = 5193,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151578,
	},
	[299] = { -- Bound Style Page: Grothdar Bow
		["collectibleId"] = 5194,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151579,
	},
	[300] = { -- Bound Style Page: Grothdar Shield
		["collectibleId"] = 5195,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151580,
	},
	[301] = { -- Bound Style Page: Shadowrend's Mask
		["collectibleId"] = 5456,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151581,
	},
	[302] = { -- Bound Style Page: Shadowrend's Shoulder
		["collectibleId"] = 5457,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151582,
	},
	[303] = { -- Bound Style Page: Ilambris' Mask
		["collectibleId"] = 5452,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151583,
	},
	[304] = { -- Bound Style Page: Ilambris' Shoulder
		["collectibleId"] = 5453,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151584,
	},
	[305] = { -- Bound Style Page: Molag Kena's Mask
		["collectibleId"] = 5454,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151585,
	},
	[306] = { -- Bound Style Page: Molag Kena's Shoulder
		["collectibleId"] = 5455,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151586,
	},
	[307] = { -- Bound Style Page: Grothdar's Mask
		["collectibleId"] = 5545,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151587,
	},
	[308] = { -- Bound Style Page: Grothdar's Shoulder
		["collectibleId"] = 5546,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151588,
	},
	[309] = { -- Bound Style Page: Second Legion Jack
		["collectibleId"] = 6586,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151916,
	},
	[310] = { -- Bound Style Page: Second Legion Helmet
		["collectibleId"] = 6587,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151917,
	},
	[311] = { -- Bound Style Page: Second Legion Arm Cops
		["collectibleId"] = 6588,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151918,
	},
	[312] = { -- Bound Style Page: Second Legion Guards
		["collectibleId"] = 6589,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151919,
	},
	[313] = { -- Bound Style Page: Second Legion Belt
		["collectibleId"] = 6590,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151920,
	},
	[314] = { -- Bound Style Page: Second Legion Bracers
		["collectibleId"] = 6591,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151921,
	},
	[315] = { -- Bound Style Page: Second Legion Boots
		["collectibleId"] = 6592,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 151922,
	},
	[316] = { -- Style Page: Second Legion Jack
		["collectibleId"] = 6586,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151923,
	},
	[317] = { -- Style Page: Second Legion Helmet
		["collectibleId"] = 6587,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151924,
	},
	[318] = { -- Style Page: Second Legion Arm Cops
		["collectibleId"] = 6588,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151925,
	},
	[319] = { -- Style Page: Second Legion Guards
		["collectibleId"] = 6589,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151926,
	},
	[320] = { -- Style Page: Second Legion Belt
		["collectibleId"] = 6590,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151927,
	},
	[321] = { -- Style Page: Second Legion Bracers
		["collectibleId"] = 6591,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151928,
	},
	[322] = { -- Style Page: Second Legion Boots
		["collectibleId"] = 6592,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 151929,
	},
	[323] = { -- Runebox: Aldmeri Dominion Banner Emote
		["collectibleId"] = 6493,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 151931,
	},
	[324] = { -- Runebox: Daggerfall Covenant Banner Emote
		["collectibleId"] = 6365,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 151932,
	},
	[325] = { -- Runebox: Ebonheart Pact Banner Emote
		["collectibleId"] = 6494,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 151933,
	},
	[326] = { -- Runebox: Siegemaster's Close Helm
		["collectibleId"] = 6438,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 151940,
	},
	[327] = { -- Bound Style Page: The Maelstrom's Battle Axe
		["collectibleId"] = 3720,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152121,
	},
	[328] = { -- Bound Style Page: The Maelstrom's Maul
		["collectibleId"] = 3721,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152122,
	},
	[329] = { -- Bound Style Page: The Maelstrom's Greatsword
		["collectibleId"] = 3722,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152123,
	},
	[330] = { -- Bound Style Page: The Maelstrom's Axe
		["collectibleId"] = 3723,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152124,
	},
	[331] = { -- Bound Style Page: The Maelstrom's Bow
		["collectibleId"] = 3724,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152125,
	},
	[332] = { -- Bound Style Page: The Maelstrom's Mace
		["collectibleId"] = 3725,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152126,
	},
	[333] = { -- Bound Style Page: The Maelstrom's Shield
		["collectibleId"] = 3726,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152127,
	},
	[334] = { -- Bound Style Page: The Maelstrom's Staff
		["collectibleId"] = 3727,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152128,
	},
	[335] = { -- Bound Style Page: The Maelstrom's Sword
		["collectibleId"] = 3728,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152129,
	},
	[336] = { -- Bound Style Page: The Maelstrom's Dagger
		["collectibleId"] = 4892,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 152130,
	},
	[337] = { -- Style Page: The Maelstrom's Battle Axe
		["collectibleId"] = 3720,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152131,
	},
	[338] = { -- Style Page: The Maelstrom's Maul
		["collectibleId"] = 3721,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152132,
	},
	[339] = { -- Style Page: The Maelstrom's Greatsword
		["collectibleId"] = 3722,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152133,
	},
	[340] = { -- Style Page: The Maelstrom's Axe
		["collectibleId"] = 3723,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152134,
	},
	[341] = { -- Style Page: The Maelstrom's Bow
		["collectibleId"] = 3724,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152135,
	},
	[342] = { -- Style Page: The Maelstrom's Mace
		["collectibleId"] = 3725,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152136,
	},
	[343] = { -- Style Page: The Maelstrom's Shield
		["collectibleId"] = 3726,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152137,
	},
	[344] = { -- Style Page: The Maelstrom's Staff
		["collectibleId"] = 3727,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152138,
	},
	[345] = { -- Style Page: The Maelstrom's Sword
		["collectibleId"] = 3728,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152139,
	},
	[346] = { -- Style Page: The Maelstrom's Dagger
		["collectibleId"] = 4892,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152140,
	},
	[347] = { -- Newcomer: Shock Skin Salamander
		["collectibleId"] = 5661,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 152152,
	},
	[348] = { -- Newcomer: Toxin Skin Salamander
		["collectibleId"] = 5660,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 152153,
	},
	[349] = { -- Newcomer: Flame Skin Salamander
		["collectibleId"] = 5659,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 152154,
	},
	[350] = { -- Style Page: Mighty Chudan's Mask
		["collectibleId"] = 6690,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152252,
	},
	[351] = { -- Style Page: Mighty Chudan's Shoulder
		["collectibleId"] = 6691,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152253,
	},
	[352] = { -- Style Page: Velidreth's Shoulder
		["collectibleId"] = 6693,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152254,
	},
	[353] = { -- Style Page: Velidreth's Mask
		["collectibleId"] = 6692,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 152255,
	},
	[354] = { -- Style Page: Pirate Skeleton's Mask
		["collectibleId"] = 6721,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153475,
	},
	[355] = { -- Style Page: Pirate Skeleton's Shoulder
		["collectibleId"] = 6722,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153476,
	},
	[356] = { -- Apple-Bobbing Fresh Fall Gorapples
		["collectibleId"] = 6737,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153486,
	},
	[357] = { -- Apple-Bobbing Cold Iron Cauldron
		["collectibleId"] = 6738,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153487,
	},
	[358] = { -- Apple-Bobbing Aged Fetid Fish
		["collectibleId"] = 6739,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153488,
	},
	[359] = { -- Apple-Bobbing Stale Creek Water
		["collectibleId"] = 6740,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153489,
	},
	[360] = { -- Apple-Bobbing Poise Guide
		["collectibleId"] = 6741,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153490,
	},
	[361] = { -- Apple-Bobbing Fenwood Ladle
		["collectibleId"] = 6743,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 153492,
	},
	[362] = { -- Bound Style Page: Battleground Runner Jack
		["collectibleId"] = 6728,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153493,
	},
	[363] = { -- Bound Style Page: Battleground Runner Bracers
		["collectibleId"] = 6733,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153494,
	},
	[364] = { -- Bound Style Page: Battleground Runner Guards
		["collectibleId"] = 6730,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153495,
	},
	[365] = { -- Bound Style Page: Battleground Runner Boots
		["collectibleId"] = 6732,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153496,
	},
	[366] = { -- Bound Style Page: Battleground Runner Arm Cops
		["collectibleId"] = 6731,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153497,
	},
	[367] = { -- Bound Style Page: Battleground Runner Helmet
		["collectibleId"] = 6729,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153498,
	},
	[368] = { -- Style Page: Chokethorn's Mask
		["collectibleId"] = 6744,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153499,
	},
	[369] = { -- Style Page: Chokethorn's Shoulder
		["collectibleId"] = 6745,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153500,
	},
	[370] = { -- Runebox: Siegemaster's Uniform
		["collectibleId"] = 6665,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 153537,
	},
	[371] = { -- Style Page: Glenmoril Wyrd Battle Axe
		["collectibleId"] = 6753,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153564,
	},
	[372] = { -- Style Page: Glenmoril Wyrd Maul
		["collectibleId"] = 6754,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153565,
	},
	[373] = { -- Style Page: Glenmoril Wyrd Greatsword
		["collectibleId"] = 6755,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153566,
	},
	[374] = { -- Style Page: Glenmoril Wyrd Axe
		["collectibleId"] = 6756,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153567,
	},
	[375] = { -- Style Page: Glenmoril Wyrd Bow
		["collectibleId"] = 6757,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153568,
	},
	[376] = { -- Style Page: Glenmoril Wyrd Dagger
		["collectibleId"] = 6758,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153569,
	},
	[377] = { -- Style Page: Glenmoril Wyrd Mace
		["collectibleId"] = 6759,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153570,
	},
	[378] = { -- Style Page: Glenmoril Wyrd Shield
		["collectibleId"] = 6760,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153571,
	},
	[379] = { -- Style Page: Glenmoril Wyrd Staff
		["collectibleId"] = 6761,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153572,
	},
	[380] = { -- Style Page: Glenmoril Wyrd Sword
		["collectibleId"] = 6762,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153573,
	},
	[381] = { -- Bound Style Page: Glenmoril Wyrd Battle Axe
		["collectibleId"] = 6753,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153574,
	},
	[382] = { -- Bound Style Page: Glenmoril Wyrd Maul
		["collectibleId"] = 6754,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153575,
	},
	[383] = { -- Bound Style Page: Glenmoril Wyrd Greatsword
		["collectibleId"] = 6755,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153576,
	},
	[384] = { -- Bound Style Page: Glenmoril Wyrd Axe
		["collectibleId"] = 6756,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153577,
	},
	[385] = { -- Bound Style Page: Glenmoril Wyrd Bow
		["collectibleId"] = 6757,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153578,
	},
	[386] = { -- Bound Style Page: Glenmoril Wyrd Dagger
		["collectibleId"] = 6758,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153579,
	},
	[387] = { -- Bound Style Page: Glenmoril Wyrd Mace
		["collectibleId"] = 6759,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153580,
	},
	[388] = { -- Bound Style Page: Glenmoril Wyrd Shield
		["collectibleId"] = 6760,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153581,
	},
	[389] = { -- Bound Style Page: Glenmoril Wyrd Staff
		["collectibleId"] = 6761,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153582,
	},
	[390] = { -- Bound Style Page: Glenmoril Wyrd Sword
		["collectibleId"] = 6762,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153583,
	},
	[391] = { -- Style Page: Spawn of Mephala's Mask
		["collectibleId"] = 6775,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153619,
	},
	[392] = { -- Style Page: Spawn of Mephala's Shoulder
		["collectibleId"] = 6776,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153620,
	},
	[393] = { -- Style Page: Opal Ilambris' Shoulder
		["collectibleId"] = 6911,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153740,
	},
	[394] = { -- Style Page: Opal Ilambris' Mask
		["collectibleId"] = 6910,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153741,
	},
	[395] = { -- Style Page: Opal Troll King's Shoulder
		["collectibleId"] = 6913,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153742,
	},
	[396] = { -- Style Page: Opal Troll King's Mask
		["collectibleId"] = 6912,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153743,
	},
	[397] = { -- Style Page: Opal Bloodspawn's Mask
		["collectibleId"] = 6906,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153744,
	},
	[398] = { -- Style Page: Opal Bloodspawn's Shoulder
		["collectibleId"] = 6907,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153745,
	},
	[399] = { -- Style Page: Opal Engine Guardian Shoulder
		["collectibleId"] = 6909,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153746,
	},
	[400] = { -- Style Page: Opal Engine Guardian Mask
		["collectibleId"] = 6908,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153747,
	},
	[401] = { -- Style Page: Glenmoril Wyrd Jerkin
		["collectibleId"] = 6787,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153776,
	},
	[402] = { -- Style Page: Glenmoril Wyrd Hat
		["collectibleId"] = 6788,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153777,
	},
	[403] = { -- Style Page: Glenmoril Wyrd Breeches
		["collectibleId"] = 6789,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153778,
	},
	[404] = { -- Style Page: Glenmoril Wyrd Epaulets
		["collectibleId"] = 6790,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153779,
	},
	[405] = { -- Style Page: Glenmoril Wyrd Sash
		["collectibleId"] = 6791,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153780,
	},
	[406] = { -- Style Page: Glenmoril Wyrd Shoes
		["collectibleId"] = 6792,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153781,
	},
	[407] = { -- Style Page: Glenmoril Wyrd Gloves
		["collectibleId"] = 6793,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153782,
	},
	[408] = { -- Style Page: Glenmoril Wyrd Robe
		["collectibleId"] = 6794,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153783,
	},
	[409] = { -- Bound Style Page: Glenmoril Wyrd Jerkin
		["collectibleId"] = 6787,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153784,
	},
	[410] = { -- Bound Style Page: Glenmoril Wyrd Hat
		["collectibleId"] = 6788,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153785,
	},
	[411] = { -- Bound Style Page: Glenmoril Wyrd Breeches
		["collectibleId"] = 6789,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153786,
	},
	[412] = { -- Bound Style Page: Glenmoril Wyrd Epaulets
		["collectibleId"] = 6790,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153787,
	},
	[413] = { -- Bound Style Page: Glenmoril Wyrd Sash
		["collectibleId"] = 6791,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153788,
	},
	[414] = { -- Bound Style Page: Glenmoril Wyrd Shoes
		["collectibleId"] = 6792,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153789,
	},
	[415] = { -- Bound Style Page: Glenmoril Wyrd Gloves
		["collectibleId"] = 6793,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153790,
	},
	[416] = { -- Bound Style Page: Glenmoril Wyrd Robe
		["collectibleId"] = 6794,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 153791,
	},
	[417] = { -- Style Page: Infernal Guardian Shoulder
		["collectibleId"] = 6949,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153883,
	},
	[418] = { -- Style Page: Infernal Guardian Mask
		["collectibleId"] = 6948,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153884,
	},
	[419] = { -- Style Page: Kra'gh Shoulder
		["collectibleId"] = 6957,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153885,
	},
	[420] = { -- Style Page: Kra'gh Mask
		["collectibleId"] = 6956,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 153886,
	},
	[421] = { -- Style Page: Sentinel of Rkugamz Shoulder
		["collectibleId"] = 6964,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 154834,
	},
	[422] = { -- Style Page: Sentinel of Rkugamz Mask
		["collectibleId"] = 6963,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 154835,
	},
	[423] = { -- Style Page: Kra'gh Mask
		["collectibleId"] = 6956,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156625,
	},
	[424] = { -- Runebox: Hollowjack Spectre Mask
		["collectibleId"] = 1338,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 156626,
	},
	[425] = { -- Bound Style Page: Battleground Runner Waster
		["collectibleId"] = 6786,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156672,
	},
	[426] = { -- Bound Style Page: Battleground Runner Staff
		["collectibleId"] = 6785,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156673,
	},
	[427] = { -- Bound Style Page: Battleground Runner Bow
		["collectibleId"] = 6783,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156674,
	},
	[428] = { -- Bound Style Page: Battleground Runner Bludgeon
		["collectibleId"] = 6782,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156675,
	},
	[429] = { -- Bound Style Page: Battleground Runner Shield
		["collectibleId"] = 6784,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156676,
	},
	[430] = { -- Style Page: Skaal Explorer Battle Axe
		["collectibleId"] = 7300,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156681,
	},
	[431] = { -- Style Page: Skaal Explorer Maul
		["collectibleId"] = 7301,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156682,
	},
	[432] = { -- Style Page: Skaal Explorer Greatsword
		["collectibleId"] = 7302,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156683,
	},
	[433] = { -- Style Page: Skaal Explorer Axe
		["collectibleId"] = 7303,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156684,
	},
	[434] = { -- Style Page: Skaal Explorer Bow
		["collectibleId"] = 7304,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156685,
	},
	[435] = { -- Style Page: Skaal Explorer Mace
		["collectibleId"] = 7305,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156686,
	},
	[436] = { -- Style Page: Skaal Explorer Shield
		["collectibleId"] = 7306,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156687,
	},
	[437] = { -- Style Page: Skaal Explorer Staff
		["collectibleId"] = 7307,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156688,
	},
	[438] = { -- Style Page: Skaal Explorer Sword
		["collectibleId"] = 7308,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156689,
	},
	[439] = { -- Style Page: Skaal Explorer Dagger
		["collectibleId"] = 7309,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156690,
	},
	[440] = { -- Style Page: Skaal Explorer Sash
		["collectibleId"] = 7299,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156691,
	},
	[441] = { -- Style Page: Skaal Explorer Jerkin
		["collectibleId"] = 7293,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156692,
	},
	[442] = { -- Style Page: Skaal Explorer Hat
		["collectibleId"] = 7294,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156693,
	},
	[443] = { -- Style Page: Skaal Explorer Breeches
		["collectibleId"] = 7295,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156694,
	},
	[444] = { -- Style Page: Skaal Explorer Epaulets
		["collectibleId"] = 7296,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156695,
	},
	[445] = { -- Style Page: Skaal Explorer Shoes
		["collectibleId"] = 7297,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156696,
	},
	[446] = { -- Style Page: Skaal Explorer Gloves
		["collectibleId"] = 7298,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156697,
	},
	[447] = { -- Bound Style Page: Skaal Explorer Battle Axe
		["collectibleId"] = 7300,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156698,
	},
	[448] = { -- Bound Style Page: Skaal Explorer Maul
		["collectibleId"] = 7301,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156699,
	},
	[449] = { -- Bound Style Page: Skaal Explorer Greatsword
		["collectibleId"] = 7302,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156700,
	},
	[450] = { -- Bound Style Page: Skaal Explorer Axe
		["collectibleId"] = 7303,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156701,
	},
	[451] = { -- Bound Style Page: Skaal Explorer Bow
		["collectibleId"] = 7304,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156702,
	},
	[452] = { -- Bound Style Page: Skaal Explorer Mace
		["collectibleId"] = 7305,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156703,
	},
	[453] = { -- Bound Style Page: Skaal Explorer Shield
		["collectibleId"] = 7306,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156704,
	},
	[454] = { -- Bound Style Page: Skaal Explorer Staff
		["collectibleId"] = 7307,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156705,
	},
	[455] = { -- Bound Style Page: Skaal Explorer Sword
		["collectibleId"] = 7308,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156706,
	},
	[456] = { -- Bound Style Page: Skaal Explorer Dagger
		["collectibleId"] = 7309,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156707,
	},
	[457] = { -- Bound Style Page: Skaal Explorer Sash
		["collectibleId"] = 7299,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156708,
	},
	[458] = { -- Bound Style Page: Skaal Explorer Jerkin
		["collectibleId"] = 7293,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156709,
	},
	[459] = { -- Bound Style Page: Skaal Explorer Hat
		["collectibleId"] = 7294,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156710,
	},
	[460] = { -- Bound Style Page: Skaal Explorer Breeches
		["collectibleId"] = 7295,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156711,
	},
	[461] = { -- Bound Style Page: Skaal Explorer Epaulets
		["collectibleId"] = 7296,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156712,
	},
	[462] = { -- Bound Style Page: Skaal Explorer Shoes
		["collectibleId"] = 7297,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156713,
	},
	[463] = { -- Bound Style Page: Skaal Explorer Gloves
		["collectibleId"] = 7298,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156714,
	},
	[464] = { -- Bound Style Page: Opal Ilambris' Shoulder
		["collectibleId"] = 6911,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156718,
	},
	[465] = { -- Bound Style Page: Opal Ilambris' Mask
		["collectibleId"] = 6910,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156719,
	},
	[466] = { -- Bound Style Page: Opal Troll King's Shoulder
		["collectibleId"] = 6913,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156720,
	},
	[467] = { -- Bound Style Page: Opal Troll King's Mask
		["collectibleId"] = 6912,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156721,
	},
	[468] = { -- Bound Style Page: Opal Bloodspawn's Mask
		["collectibleId"] = 6906,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156722,
	},
	[469] = { -- Bound Style Page: Opal Bloodspawn's Shoulder
		["collectibleId"] = 6907,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156723,
	},
	[470] = { -- Bound Style Page: Opal Engine Guardian Shoulder
		["collectibleId"] = 6909,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156724,
	},
	[471] = { -- Bound Style Page: Opal Engine Guardian Mask
		["collectibleId"] = 6908,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156725,
	},
	[472] = { -- Bound Style Page: Opal Ilambris' Battle Axe
		["collectibleId"] = 6814,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156726,
	},
	[473] = { -- Bound Style Page: Opal Ilambris' Bow
		["collectibleId"] = 6815,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156727,
	},
	[474] = { -- Bound Style Page: Opal Ilambris' Shield
		["collectibleId"] = 6816,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156728,
	},
	[475] = { -- Bound Style Page: Opal Ilambris' Staff
		["collectibleId"] = 6817,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156729,
	},
	[476] = { -- Bound Style Page: Opal Ilambris' Sword
		["collectibleId"] = 6818,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156730,
	},
	[477] = { -- Bound Style Page: Opal Engine Guardian Dagger
		["collectibleId"] = 6819,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156737,
	},
	[478] = { -- Bound Style Page: Opal Engine Guardian Staff
		["collectibleId"] = 6820,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156738,
	},
	[479] = { -- Bound Style Page: Opal Engine Guardian Greatsword
		["collectibleId"] = 6821,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156739,
	},
	[480] = { -- Bound Style Page: Opal Engine Guardian Bow
		["collectibleId"] = 6822,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156740,
	},
	[481] = { -- Bound Style Page: Opal Engine Guardian Shield
		["collectibleId"] = 6823,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156741,
	},
	[482] = { -- Bound Style Page: Opal Bloodspawn Battle Axe
		["collectibleId"] = 6824,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156742,
	},
	[483] = { -- Bound Style Page: Opal Bloodspawn Bow
		["collectibleId"] = 6825,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156743,
	},
	[484] = { -- Bound Style Page: Opal Bloodspawn Shield
		["collectibleId"] = 6826,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156744,
	},
	[485] = { -- Bound Style Page: Opal Bloodspawn Staff
		["collectibleId"] = 6827,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156745,
	},
	[486] = { -- Bound Style Page: Opal Bloodspawn Mace
		["collectibleId"] = 6828,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156746,
	},
	[487] = { -- Bound Style Page: Opal Troll King Axe
		["collectibleId"] = 6829,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156747,
	},
	[488] = { -- Bound Style Page: Opal Troll King Staff
		["collectibleId"] = 6830,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156748,
	},
	[489] = { -- Bound Style Page: Opal Troll King Battle Axe
		["collectibleId"] = 6831,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156749,
	},
	[490] = { -- Bound Style Page: Opal Troll King Bow
		["collectibleId"] = 6832,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156750,
	},
	[491] = { -- Bound Style Page: Opal Troll King Shield
		["collectibleId"] = 6833,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156751,
	},
	[492] = { -- Style Page: Legion Zero Cuirass
		["collectibleId"] = 7310,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156781,
	},
	[493] = { -- Style Page: Legion Zero Helm
		["collectibleId"] = 7311,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156782,
	},
	[494] = { -- Style Page: Legion Zero Greaves
		["collectibleId"] = 7312,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156783,
	},
	[495] = { -- Style Page: Legion Zero Pauldrons
		["collectibleId"] = 7313,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156784,
	},
	[496] = { -- Style Page: Legion Zero Sabatons
		["collectibleId"] = 7314,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156785,
	},
	[497] = { -- Style Page: Legion Zero Gauntlets
		["collectibleId"] = 7315,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156786,
	},
	[498] = { -- Style Page: Legion Zero Girdle
		["collectibleId"] = 7316,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156787,
	},
	[499] = { -- Bound Style Page: Legion Zero Cuirass
		["collectibleId"] = 7310,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156788,
	},
	[500] = { -- Bound Style Page: Legion Zero Helm
		["collectibleId"] = 7311,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156789,
	},
	[501] = { -- Bound Style Page: Legion Zero Greaves
		["collectibleId"] = 7312,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156790,
	},
	[502] = { -- Bound Style Page: Legion Zero Pauldrons
		["collectibleId"] = 7313,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156791,
	},
	[503] = { -- Bound Style Page: Legion Zero Sabatons
		["collectibleId"] = 7314,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156792,
	},
	[504] = { -- Bound Style Page: Legion Zero Gauntlets
		["collectibleId"] = 7315,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156793,
	},
	[505] = { -- Bound Style Page: Legion Zero Girdle
		["collectibleId"] = 7316,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 156794,
	},
	[506] = { -- Style Page: Opal Ilambris' Battle Axe
		["collectibleId"] = 6814,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156811,
	},
	[507] = { -- Style Page: Opal Ilambris' Bow
		["collectibleId"] = 6815,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156812,
	},
	[508] = { -- Style Page: Opal Ilambris' Shield
		["collectibleId"] = 6816,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156813,
	},
	[509] = { -- Style Page: Opal Ilambris' Staff
		["collectibleId"] = 6817,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156814,
	},
	[510] = { -- Style Page: Opal Ilambris' Sword
		["collectibleId"] = 6818,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156815,
	},
	[511] = { -- Style Page: Opal Engine Guardian Dagger
		["collectibleId"] = 6819,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156816,
	},
	[512] = { -- Style Page: Opal Engine Guardian Staff
		["collectibleId"] = 6820,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156817,
	},
	[513] = { -- Style Page: Opal Engine Guardian Greatsword
		["collectibleId"] = 6821,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156818,
	},
	[514] = { -- Style Page: Opal Engine Guardian Bow
		["collectibleId"] = 6822,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156819,
	},
	[515] = { -- Style Page: Opal Engine Guardian Shield
		["collectibleId"] = 6823,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156820,
	},
	[516] = { -- Style Page: Opal Bloodspawn Battle Axe
		["collectibleId"] = 6824,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156821,
	},
	[517] = { -- Style Page: Opal Bloodspawn Bow
		["collectibleId"] = 6825,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156822,
	},
	[518] = { -- Style Page: Opal Bloodspawn Shield
		["collectibleId"] = 6826,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156823,
	},
	[519] = { -- Style Page: Opal Bloodspawn Staff
		["collectibleId"] = 6827,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156824,
	},
	[520] = { -- Style Page: Opal Bloodspawn Mace
		["collectibleId"] = 6828,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156825,
	},
	[521] = { -- Style Page: Opal Troll King Axe
		["collectibleId"] = 6829,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156826,
	},
	[522] = { -- Style Page: Opal Troll King Staff
		["collectibleId"] = 6830,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156827,
	},
	[523] = { -- Style Page: Opal Troll King Battle Axe
		["collectibleId"] = 6831,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156828,
	},
	[524] = { -- Style Page: Opal Troll King Bow
		["collectibleId"] = 6832,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156829,
	},
	[525] = { -- Style Page: Opal Troll King Shield
		["collectibleId"] = 6833,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156830,
	},
	[526] = { -- Style Page: <SETNAME> Shoulder
		["collectibleId"] = 7411,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156833,
	},
	[527] = { -- Style Page: <SETNAME> Mask
		["collectibleId"] = 7410,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156834,
	},
	[528] = { -- Style Page: Slimecraw's Shoulder
		["collectibleId"] = 7330,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156835,
	},
	[529] = { -- Style Page: Slimecraw's Mask
		["collectibleId"] = 7329,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156836,
	},
	[530] = { -- Style Page: Stormfist Shoulder
		["collectibleId"] = 7425,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156837,
	},
	[531] = { -- Style Page: Stormfist Mask
		["collectibleId"] = 7424,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156838,
	},
	[532] = { -- Style Page: Jephrine Paladin Cuirass
		["collectibleId"] = 7331,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156839,
	},
	[533] = { -- Style Page: Knight of the Circle Cuirass
		["collectibleId"] = 7338,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156840,
	},
	[534] = { -- Style Page: Knight of the Circle Helm
		["collectibleId"] = 7339,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 156841,
	},
	[535] = { -- Style Page: Jephrine Paladin Helm
		["collectibleId"] = 7332,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159472,
	},
	[536] = { -- Style Page: Jephrine Paladin Greaves
		["collectibleId"] = 7333,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159473,
	},
	[537] = { -- Style Page: Jephrine Paladin Pauldrons
		["collectibleId"] = 7334,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159474,
	},
	[538] = { -- Style Page: Jephrine Paladin Sabatons
		["collectibleId"] = 7335,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159475,
	},
	[539] = { -- Style Page: Jephrine Paladin Gauntlets
		["collectibleId"] = 7336,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159476,
	},
	[540] = { -- Style Page: Jephrine Paladin Girdle
		["collectibleId"] = 7337,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159477,
	},
	[541] = { -- Style Page: Jephrine Paladin Greatsword
		["collectibleId"] = 7375,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159478,
	},
	[542] = { -- Style Page: Jephrine Paladin Bow
		["collectibleId"] = 7376,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159479,
	},
	[543] = { -- Style Page: Jephrine Paladin Shield
		["collectibleId"] = 7377,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159480,
	},
	[544] = { -- Style Page: Jephrine Paladin Staff
		["collectibleId"] = 7378,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159481,
	},
	[545] = { -- Style Page: Jephrine Paladin Sword
		["collectibleId"] = 7379,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159482,
	},
	[546] = { -- Bound Style Page: Jephrine Paladin Cuirass
		["collectibleId"] = 7331,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159483,
	},
	[547] = { -- Bound Style Page: Jephrine Paladin Helm
		["collectibleId"] = 7332,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159484,
	},
	[548] = { -- Bound Style Page: Jephrine Paladin Greaves
		["collectibleId"] = 7333,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159485,
	},
	[549] = { -- Bound Style Page: Jephrine Paladin Pauldrons
		["collectibleId"] = 7334,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159486,
	},
	[550] = { -- Bound Style Page: Jephrine Paladin Sabatons
		["collectibleId"] = 7335,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159487,
	},
	[551] = { -- Bound Style Page: Jephrine Paladin Gauntlets
		["collectibleId"] = 7336,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159488,
	},
	[552] = { -- Bound Style Page: Jephrine Paladin Girdle
		["collectibleId"] = 7337,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159489,
	},
	[553] = { -- Bound Style Page: Jephrine Paladin Greatsword
		["collectibleId"] = 7375,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159490,
	},
	[554] = { -- Bound Style Page: Jephrine Paladin Bow
		["collectibleId"] = 7376,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159491,
	},
	[555] = { -- Bound Style Page: Jephrine Paladin Shield
		["collectibleId"] = 7377,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159492,
	},
	[556] = { -- Bound Style Page: Jephrine Paladin Staff
		["collectibleId"] = 7378,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159493,
	},
	[557] = { -- Bound Style Page: Jephrine Paladin Sword
		["collectibleId"] = 7379,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 159494,
	},
	[558] = { -- Style Page: Knight of the Circle Greaves
		["collectibleId"] = 7340,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159505,
	},
	[559] = { -- Style Page: Knight of the Circle Pauldrons
		["collectibleId"] = 7341,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159506,
	},
	[560] = { -- Style Page: Knight of the Circle Sabatons
		["collectibleId"] = 7342,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159507,
	},
	[561] = { -- Style Page: Knight of the Circle Gauntlets
		["collectibleId"] = 7343,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159508,
	},
	[562] = { -- Style Page: Knight of the Circle Maul
		["collectibleId"] = 7380,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159509,
	},
	[563] = { -- Style Page: Knight of the Circle Bow
		["collectibleId"] = 7381,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159510,
	},
	[564] = { -- Style Page: Knight of the Circle Shield
		["collectibleId"] = 7382,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159511,
	},
	[565] = { -- Style Page: Knight of the Circle Staff
		["collectibleId"] = 7383,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159512,
	},
	[566] = { -- Style Page: Knight of the Circle Sword
		["collectibleId"] = 7384,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159513,
	},
	[567] = { -- Style Page: Balorgh's Mask
		["collectibleId"] = 7426,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159574,
	},
	[568] = { -- Style Page: Balorgh Shoulder
		["collectibleId"] = 7427,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159575,
	},
	[569] = { -- Style Page: Scourge Harvester Shoulder
		["collectibleId"] = 7683,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159691,
	},
	[570] = { -- Style Page: Scourge Harvester Mask
		["collectibleId"] = 7682,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 159692,
	},
	[571] = { -- Style Page: Domihaus Shoulder
		["collectibleId"] = 7750,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 160516,
	},
	[572] = { -- Style Page: Domihaus Mask
		["collectibleId"] = 7749,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 160517,
	},
	[573] = { -- Style Page: Nerien'eth's Shoulder
		["collectibleId"] = 7785,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 160526,
	},
	[574] = { -- Style Page: Nerien'eth's Mask
		["collectibleId"] = 7784,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 160527,
	},
	[575] = { -- Style Page: Snowhawk Mage Jerkin
		["collectibleId"] = 8116,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165900,
	},
	[576] = { -- Style Page: Snowhawk Mage Hat
		["collectibleId"] = 8117,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165901,
	},
	[577] = { -- Style Page: Snowhawk Mage Breeches
		["collectibleId"] = 8118,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165902,
	},
	[578] = { -- Style Page: Snowhawk Mage Epaulets
		["collectibleId"] = 8119,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165903,
	},
	[579] = { -- Style Page: Snowhawk Mage Shoes
		["collectibleId"] = 8120,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165904,
	},
	[580] = { -- Style Page: Snowhawk Mage Gloves
		["collectibleId"] = 8121,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165905,
	},
	[581] = { -- Style Page: Snowhawk Mage Robe
		["collectibleId"] = 8123,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165906,
	},
	[582] = { -- Style Page: Snowhawk Mage Sash
		["collectibleId"] = 8122,
		["containerType"] = lib.TYPE_STYLEPAGE,
		["containerItemId"] = 165907,
	},
	[583] = { -- Bound Style Page: Snowhawk Mage Jerkin
		["collectibleId"] = 8116,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165954,
	},
	[584] = { -- Bound Style Page: Snowhawk Mage Hat
		["collectibleId"] = 8117,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165955,
	},
	[585] = { -- Bound Style Page: Snowhawk Mage Breeches
		["collectibleId"] = 8118,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165956,
	},
	[586] = { -- Bound Style Page: Snowhawk Mage Epaulets
		["collectibleId"] = 8119,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165957,
	},
	[587] = { -- Bound Style Page: Snowhawk Mage Shoes
		["collectibleId"] = 8120,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165958,
	},
	[588] = { -- Bound Style Page: Snowhawk Mage Gloves
		["collectibleId"] = 8121,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165959,
	},
	[589] = { -- Bound Style Page: Snowhawk Mage Robe
		["collectibleId"] = 8123,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165960,
	},
	[590] = { -- Bound Style Page: Snowhawk Mage Sash
		["collectibleId"] = 8122,
		["containerType"] = lib.TYPE_BOUNDSTYLEPAGE,
		["containerItemId"] = 165961,
	},
	[591] = { -- Mount Pack: Hailcinder Vale Elk
		["collectibleId"] = 7524,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 166455,
	},
	[592] = { -- Mount Pack: Pineblossom Vale Elk
		["collectibleId"] = 7522,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 166457,
	},
	[593] = { -- Mount Pack: Snowdrift Vale Elk
		["collectibleId"] = 7523,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 166458,
	},
	[594] = { -- Runebox: Reach-Mage Ceremonial Skullcap
		["collectibleId"] = 7595,
		["containerType"] = lib.TYPE_CONTAINER,
		["containerItemId"] = 166468,
	},
	[595] = { -- Cartographer's Mask
		["collectibleId"] = 8135,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166700,
	},
	[596] = { -- Cartographer's Vest
		["collectibleId"] = 8136,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166701,
	},
	[597] = { -- Cartographer's Leggings
		["collectibleId"] = 8137,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166702,
	},
	[598] = { -- Cartographer's Gloves
		["collectibleId"] = 8138,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166703,
	},
	[599] = { -- Cartographer's Boots
		["collectibleId"] = 8139,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166704,
	},
	[600] = { -- Cartographer's Tricorn
		["collectibleId"] = 8140,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166705,
	},
	[601] = { -- Cartographer's Rucksack
		["collectibleId"] = 8141,
		["containerType"] = lib.TYPE_COLLECTIBLE_FRAGMENT,
		["containerItemId"] = 166706,
	},
}

-- These are all SPECIALIZED_ITEMTYPE_TROPHY_RUNEBOX_FRAGMENT for which GetItemLinkContainerCollectibleId does not work
lib.runeboxFragments = 
{
    [139464] =  -- [Runebox: Big-Eared Ginger Kitten Pet]
    {
        139456, -- [Big-Eared Ginger Kitten's "Care and Feeding" Guide]
        139455, -- [Big-Eared Ginger Kitten's Feather Toy]
        139454, -- [Big-Eared Ginger Kitten's Sleeping-Basket]
        139451, -- [Big-Eared Ginger Kitten's Tag]
        139452, -- [Big-Eared Ginger Kitten's Milk Saucer]
        139450, -- [Big-Eared Ginger Kitten's Collar]
        139453, -- [Big-Eared Ginger Kitten's Bait Mouse]
    },
    [139465] =  -- [Runebox: Psijic Glowglobe Emote]
    {
        139458, -- [Psijic Glowglobe's Conjectural Writings]
        139459, -- [Psijic Glowglobe's Updated Instructionals]
        139460, -- [Psijic Glowglobe's Wisp Animus]
        139461, -- [Psijic Glowglobe's Crystal Ball]
        139462, -- [Psijic Glowglobe's Meteoric Glass]
        139463, -- [Psijic Glowglobe's Purified Glow Dust]
        139457, -- [Psijic Glowglobe's Ancient Texts]
    },
    [124658] =  -- [Runebox: Dwarven Theodolite Pet]
    {
        124660, -- [Dwarven Theodolite Wheels]
        124661, -- [Dwarven Theodolite Torso]
        124662, -- [Dwarven Theodolite Shoulder]
        124663, -- [Dwarven Theodolite Neck]
        124664, -- [Dwarven Theodolite Head]
        124665, -- [Dwarven Theodolite Eye]
        124666, -- [Dwarven Theodolite Chassis]
    },
    [124659] =  -- [Runebox: Sixth House Robe Costume]
    {
        124673, -- [Sixth House Tailor's Bell]
        124672, -- [Sixth House Ornamental Fasteners]
        124667, -- [Sixth House Tailor's Shears]
        124668, -- [Sixth House Writhing Thread]
        124669, -- [Sixth House Incense of Toolwork]
        124670, -- [Sixth House Tailor's Hammer]
        124671, -- [Sixth House Patterned Bolt]
    },
    [147499] =  -- [Runebox: Guar Stomp Emote]
    {
        147492, -- [Guar Stomp Elucidating Hand-Scultpure]
        147493, -- [Guar Stomp Steps-Practice Rug]
        147494, -- [Guar Stomp Rehearsal Tuning Fork]
        147495, -- [Guar Stomp Noise Reports]
        147496, -- [Guar Stomp Illustrated Reports]
        147497, -- [Guar Stomp History in Street Theatre]
        147498, -- [Guar Stomp Skeletal Reconstruction]
    },
    [141749] =  -- [Runebox: Swamp Jelly]
    {
        141748, -- [Swamp Jelly Hunter's Lens]
        141742, -- [Swamp Jelly Fine-Mesh Net]
        141743, -- [Swamp Jelly Luminous Fishmeal]
        141744, -- [Swamp Jelly Luring Flute]
        141745, -- [Swamp Jelly Carrying Jar]
        141746, -- [Swamp Jelly Spawning Mud]
        141747, -- [Swamp Jelly Moss Bedding]
    },
	--[[ This one seems to now be SPECIALIZED_ITEMTYPE_TROPHY_COLLECTIBLE_FRAGMENT and not needed here anymore
    [141915] =  -- [Runebox: Apple-Bobbing Cauldron]
    {
        141908, -- [Apple-Bobbing Fresh Fall Gorapples]
        141909, -- [Apple-Bobbing Cold Iron Cauldron]
        141910, -- [Apple-Bobbing Aged Fetid Fish]
        141911, -- [Apple-Bobbing Stale Creek Water]
        141912, -- [Apple-Bobbing Poise Guide]
        141913, -- [Apple-Bobbing Viscous Slime]
        141914, -- [Apple-Bobbing Fenwood Ladle]
    },
	--]]

}

lib.fragmentsToRunebox = {}
for runeboxItemId, runeboxFragments in pairs(lib.runeboxFragments) do
	local runeboxData = lib.preloadedRuneboxList[runeboxItemId]
	for _, fragmentItemId in pairs(runeboxFragments) do
		lib.fragmentsToRunebox[ fragmentItemId ] = runeboxItemId
	end
end
--]]
