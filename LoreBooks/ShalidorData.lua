--[[
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
-- LoreBooks, by Ayantir
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
This software is under : CreativeCommons CC BY-NC-SA 4.0
Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)

You are free to:

    Share — copy and redistribute the material in any medium or format
    Adapt — remix, transform, and build upon the material
    The licensor cannot revoke these freedoms as long as you follow the license terms.


Under the following terms:

    Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
    NonCommercial — You may not use the material for commercial purposes.
    ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.
    No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.


Please read full licence at :
http://creativecommons.org/licenses/by-nc-sa/4.0/legalcode
--]]


-- GetLoreBookInfo(categoryID, collectionID, bookID)
-- categoryID is always 1, so storing the rest

-- format: locX, locY, collectionID, bookID, moreInfo, zoneId, location text
--[[ For anything you need to skip, add nil
]]--
-- 	moreInfo:
-- 		nil or false = default
-- 		1 = on town map
-- 		2 = Delve (SI CONST)
-- 		3 = Public Dungeon (SI CONST)
-- 		4 = under ground
-- 		5 = Group Instance (SI CONST)
-- 		6 = Inside Inn
--       9999 = Breadcrumb so don't add to right click menu
-- 	zoneId:
-- 		Integer = group instance zoneId
-- location text:
-- ld = X where X is the arbitrary key for the location details
-- ld = 1, and then [1] = "Guest Room"
--[[ The location text will have to be localized so put it in the language files
The location text will be on a single line on the tooltip so you can't say
"In the Inn of the Seven Filthy Darves, on the second floor, through the doorway, up the stairs to the right of the guard, in the Guest Room."

You just put "Guest Room"
]]--
local internal = _G["LoreBooks_Internal"]

local lorebooksData = {
  -- alikr
  [30] = { -- alikr_base
    -- Alik'r Desert Lore
    { 0.162, 0.493, 5, 1 }, -- Redguards, History and Heroes, V. 1
    { 0.124, 0.516, 5, 1 },
    { 0.086, 0.505, 5, 1 },
    { 0.118, 0.470, 5, 1 },
    { 0.578656, 0.493981, 5, 2 }, -- Redguards, History and Heroes, V. 2
    { 0.594, 0.483, 5, 2 },
    { 0.634, 0.497, 5, 2 },
    { 0.617, 0.485, 5, 2 },
    { 0.8033, 0.3368, 5, 3 }, -- Redguards, History and Heroes, V. 3
    { 0.854, 0.358, 5, 3 },
    { 0.8167, 0.3293, 5, 3 },
    { 0.847, 0.330, 5, 3 },
    { 0.428, 0.517, 5, 4 }, -- Tu'whacca's Prayer
    { 0.404, 0.534, 5, 4 },
    { 0.469, 0.541, 5, 4 },
    { 0.504, 0.485, 5, 4 },
    { 0.556, 0.656, 5, 5, ld = { 1, } }, -- Varieties of Faith, Crown Redguards
    { 0.500, 0.640, 5, 5, ld = { 1, } },
    { 0.500, 0.663, 5, 5, ld = { 1, } },
    { 0.541, 0.629, 5, 5, ld = { 1, } },
    { 0.189, 0.452, 5, 6, ld = { 1, } }, -- Varieties of Faith, The Forebears
    { 0.247, 0.439, 5, 6, ld = { 1, } },
    { 0.222, 0.395, 5, 6, ld = { 1, } },
    { 0.205, 0.475, 5, 6, ld = { 1, } },
    { 0.755, 0.273, 5, 7 }, -- Motalion Necropolis Report
    { 0.753, 0.325, 5, 7 },
    { 0.785, 0.256, 5, 7 },
    { 0.755, 0.245, 5, 7 },
    { 0.250, 0.661, 5, 8 }, -- The Salas En Expedition
    { 0.264, 0.661, 5, 8 },
    { 0.234, 0.703, 5, 8 },
    { 0.239, 0.682, 5, 8 },
    { 0.257, 0.457, 5, 9, ld = { 1, } }, -- Sentinel, the Jewel of Alik'r
    { 0.248, 0.432, 5, 9, ld = { 1, } },
    { 0.300, 0.447, 5, 9, ld = { 1, } },
    { 0.297, 0.504, 5, 9, ld = { 1, } },
    { 0.2477, 0.476, 5, 9, ld = { 1, } },
    { 0.302, 0.648, 5, 10 }, -- Sacrilege and Mayhem in the Alik'r
    { 0.293, 0.694, 5, 10 },
    { 0.326, 0.685, 5, 10 },
    { 0.355, 0.700, 5, 10 },
    -- Daedric Princes
    { 0.302, 0.456, 8, 7, ld = { 1, } }, -- Opusculus Lamae Bal ta Mezzamortie
    { 0.268, 0.412, 8, 7 },
    { 0.290, 0.409, 8, 7 },
    { 0.2582, 0.3883, 8, 7 },
    { 0.604, 0.391, 8, 8 }, -- The Totems of Hircine
    { 0.563, 0.398, 8, 8 },
    { 0.591, 0.4141, 8, 8 },
    { 0.6223, 0.4072, 8, 8 },
    -- Dwemer
    { 0.222, 0.567, 12, 10, ld = { 2, } }, -- Ancient Scrolls of the Dwemer I-B
    { 0.186, 0.513, 12, 10 },
    { 0.217, 0.538, 12, 10 },
    { 0.213, 0.524, 12, 10 },
    { 0.608, 0.625, 12, 11 }, -- Guylaine's Dwemer Architecture
    { 0.591, 0.580, 12, 11 },
    { 0.620, 0.594, 12, 11 },
    { 0.901, 0.520, 12, 12, ld = { 2, } }, -- Ancient Scrolls of the Dwemer VIII
    { 0.873, 0.495, 12, 12 },
    { 0.875, 0.567, 12, 12 },
    { 0.884, 0.530, 12, 12 },
    -- Legends of Nirn
    { 0.779, 0.573, 13, 1 }, -- An Accounting of the Elder Scrolls
    { 0.710, 0.534, 13, 1 },
    { 0.779, 0.586, 13, 1 },
    { 0.7814, 0.5211, 13, 1 },
    { 0.498, 0.413, 13, 2 }, -- The Adabal-a
    { 0.471, 0.445, 13, 2 },
    { 0.478, 0.381, 13, 2 },
    { 0.4835, 0.4088, 13, 2 },
    { 0.746, 0.456, 13, 3, ld = { 1, } }, -- The Amulet of Kings
    { 0.766, 0.459, 13, 3, ld = { 1, } },
    { 0.772, 0.440, 13, 3, ld = { 1, } },
    { 0.7667, 0.4814, 13, 3, 1, ld = { 1, } },
    { 0.4369, 0.6918, 13, 4 }, -- The Cleansing of the Fane
    { 0.401, 0.689, 13, 4 },
    { 0.405, 0.689, 13, 4 },
    { 0.383, 0.697, 13, 4 },
    { 0.261, 0.566, 13, 5 }, -- The Exclusionary Mandates
    { 0.309, 0.603, 13, 5 },
    { 0.272, 0.624, 13, 5 },
    { 0.229, 0.574, 13, 5 },
    { 0.661, 0.583, 13, 6 }, -- The Last King of the Ayleids
    { 0.675, 0.628, 13, 6 },
    { 0.655, 0.549, 13, 6 },
    { 0.6202, 0.5724, 13, 6 },
    { 0.843, 0.497, 13, 7 }, -- The Order of the Ancestor Moth
    { 0.8262, 0.4768, 13, 7 },
    { 0.831, 0.4325, 13, 7 },
    { 0.449, 0.614, 13, 8 }, -- Tamrielic Artifacts, Part One
    { 0.417, 0.628, 13, 8 },
    { 0.440, 0.567, 13, 8 },
    { 0.831, 0.580, 13, 9, ld = { 2, } }, -- Tamrielic Artifacts, Part Two
    { 0.843, 0.567, 13, 9 },
    { 0.803, 0.503, 13, 9 },
    { 0.496, 0.548, 13, 10 }, -- Tamrielic Artifacts, Part Three
    { 0.530, 0.546, 13, 10 },
    { 0.502, 0.538, 13, 10 },
    { 0.5012, 0.5086, 13, 10 },
    -- Literature
    { 0.290, 0.441, 14, 4, ld = { 1, } }, -- The Lusty Argonian Maid, Volume 2
    -- Poetry and Songs
    { 0.546, 0.405, 18, 1, ld = { 4, } }, -- The Battle of Glenumbria Moors
    { 0.558, 0.428, 18, 1 },
    { 0.575, 0.434, 18, 1 },
    { 0.5829, 0.459, 18, 1 },
    { 0.672, 0.380, 18, 2 }, -- The Book of Dawn and Dusk
    { 0.648, 0.348, 18, 2, ld = { 2, } },
    { 0.610, 0.376, 18, 2, ld = { 2, } },
    { 0.5934, 0.3605, 18, 2 },
    { 0.355, 0.436, 18, 3 }, -- The Cantatas of Vivec
    { 0.322, 0.418, 18, 3 },
    { 0.338, 0.468, 18, 3 },
    { 0.3431, 0.3816, 18, 3 },
    { 0.692, 0.461, 18, 4 }, -- The Five Far Stars
    { 0.620, 0.433, 18, 4 },
    { 0.693, 0.525, 18, 4 },
    { 0.6871, 0.504, 18, 4 },
    { 0.557, 0.344, 18, 5 }, -- Flesh to Cut from Bone
    { 0.551, 0.335, 18, 5 },
    { 0.563, 0.248, 18, 5 },
    { 0.5557, 0.2680, 18, 5 },
    { 0.389, 0.517, 18, 6 }, -- Ode to the Tundrastriders
    { 0.376, 0.540, 18, 6 },
    { 0.3142, 0.571, 18, 6 },
    { 0.335, 0.510, 18, 6, ld = { 4, } },
    -- Dungeon Lore
    --[[TODO Check This ]]--
    { 0.873, 0.463, 11, 2, 3, ld = { 9999, } }, -- What is Volendrung?
  },
  [83] = { -- sentinel_base
    -- Alik'r Desert Lore
    { 0.103, 0.459, 5, 6 }, -- Varieties of Faith, The Forebears
    { 0.387, 0.398, 5, 6 },
    { 0.264, 0.187, 5, 6 },
    { 0.178178, 0.572218, 5, 6 },
    { 0.435072, 0.482186, 5, 9 }, -- Sentinel, the Jewel of Alik'r
    { 0.391, 0.577, 5, 9 },
    { 0.630, 0.715, 5, 9 },
    { 0.640, 0.437, 5, 9 },
    -- Daedric Princes
    { 0.646, 0.472, 8, 7, ld = { 4, } }, -- Opusculus Lamae Bal ta Mezzamortie
    { 0.439, 0.148, 8, 7 },
    -- Literature
    { 0.598, 0.413, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
    -- Poetry and Songs
    { 0.828, 0.542, 18, 3 }, -- The Cantatas of Vivec
    { 0.819, 0.747, 18, 6 }, -- Ode to the Tundrastriders
  },
  [539] = { -- bergama_base
    -- Alik'r Desert Lore
    { 0.259, 0.607, 5, 5 }, -- Varieties of Faith, Crown Redguards
    { 0.260474, 0.433393, 5, 5 },
    { 0.679, 0.558, 5, 5 },
    { 0.262, 0.434, 5, 5 },
    { 0.569, 0.351, 5, 5 },
  },
  [538] = { -- kozanset_base
    -- Legends of Nirn
    { 0.412, 0.481, 13, 3 }, -- The Amulet of Kings
    { 0.637, 0.376, 13, 3 },
    { 0.586, 0.696, 13, 3 },
    { 0.6014, 0.5290, 13, 3 },
  },
  [773] = { -- smugglerkingtunnel_base
    { 0.433, 0.455, 5, 3 }, -- Redguards, History and Heroes, V. 3
  },
  [231] = { -- aldunz_base
    -- Dwemer
    { 0.194, 0.743, 12, 11 }, -- Guylaine's Dwemer Architecture
  },
  [246] = { -- santaki_base
    -- Dwemer
    { 0.710, 0.792, 12, 10 }, -- Ancient Scrolls of the Dwemer I-B
  },
  [233] = { -- yldzuun_base
    -- Dwemer
    { 0.627, 0.291, 12, 12 }, -- Ancient Scrolls of the Dwemer VIII
  },
  [230] = { -- sandblownmine_base
    -- Legends of Nirn
    { 0.669, 0.446, 13, 9 }, -- Tamrielic Artifacts, Part Two
  },
  [224] = { -- coldrockdiggings_base
    -- Poetry and Song
    { 0.808, 0.438, 18, 2 }, -- The Book of Dawn and Dusk
  },
  [226] = { -- divadschagrinmine_base
    -- Legends of Nirn
    { 0.418, 0.698, 13, 8 }, -- Tamrielic Artifacts, Part One
  },
  [3] = { -- volenfell_base
    -- Dungeon Lore
    --[[TODO Check This ]]--
    { 0.141, 0.441, 11, 2, 3, ld = { 5, } }, -- What is Volendrung?
  }, --}

  -- auridon
  [143] = { -- auridon_base
    -- Auridon Lore
    { 0.3443, 0.1079, 25, 1 }, -- Crimes of the Daggerfall Covenant
    { 0.3359, 0.1450, 25, 1 },
    { 0.2898, 0.0910, 25, 1 },
    { 0.3188, 0.0538, 25, 1 },
    { 0.3757, 0.2378, 25, 2 }, -- Regarding the Ebonheart Pact
    { 0.3483, 0.2631, 25, 2 },
    { 0.3582, 0.3012, 25, 2 },
    { 0.3644, 0.1973, 25, 2 },
    { 0.4156, 0.3067, 25, 3 }, -- The Lay of Firsthold
    { 0.4479, 0.3182, 25, 3 },
    { 0.4020, 0.3625, 25, 3 },
    { 0.4486, 0.3595, 25, 3 },
    { 0.5220, 0.2981, 25, 4 }, -- Varieties of Faith: The High Elves
    { 0.5876, 0.2438, 25, 4 },
    { 0.4937, 0.2723, 25, 4 },
    { 0.5519, 0.2711, 25, 4 },
    { 0.601, 0.456, 25, 5 }, -- Why Don the Veil?
    { 0.5317, 0.4480, 25, 5 },
    { 0.5641, 0.4327, 25, 5 },
    { 0.5594, 0.4727, 25, 5 },
    { 0.2394, 0.2818, 25, 6 }, -- Fang of the Sea Vipers
    { 0.2255, 0.2336, 25, 6 },
    { 0.2099, 0.2815, 25, 6 },
    { 0.1800, 0.2287, 25, 6 },
    { 0.5226, 0.1726, 25, 7 }, -- The Rise of Queen Ayrenn
    { 0.5168, 0.2068, 25, 7 },
    { 0.5403, 0.2428, 25, 7 },
    { 0.5500, 0.1770, 25, 7 },
    { 0.2835, 0.1557, 25, 8, ld = { 1, } }, -- Kinlord Rilis and the Mages Guild
    { 0.3103, 0.2414, 25, 8, ld = { 1, } },
    { 0.3248, 0.1961, 25, 8, ld = { 1, } },
    { 0.2475, 0.1948, 25, 8, ld = { 1, } },
    { 0.4692, 0.1609, 25, 9 }, -- Life in the Eagle's Shadow
    { 0.4191, 0.1992, 25, 9 },
    { 0.3823, 0.1409, 25, 9 },
    { 0.4364, 0.1175, 25, 9 },
    { 0.2741, 0.3764, 25, 10 }, -- Thalmor Handbill
    { 0.3229, 0.3261, 25, 10 },
    { 0.2362, 0.3536, 25, 10 },
    { 0.3214, 0.3699, 25, 10 },
    -- Daedric Princes
    { 0.4937, 0.4330, 8, 1 }, -- Aedra and Daedra
    { 0.5075, 0.3945, 8, 1 },
    { 0.4685, 0.3674, 8, 1 },
    { 0.4992, 0.3322, 8, 1 },
    { 0.3970, 0.6462, 8, 2 }, -- Boethiah's Proving
    { 0.3917, 0.6822, 8, 2 },
    { 0.4257, 0.6994, 8, 2 },
    { 0.4475, 0.6829, 8, 2 },
    -- Biographies
    { 0.6254, 0.3253, 9, 1 }, -- Galerion the Mystic
    { 0.6185, 0.3068, 9, 1 },
    { 0.6703, 0.2992, 9, 1 },
    { 0.5763, 0.3225, 9, 1 },
    { 0.6347, 0.3916, 9, 2 }, -- Great Harbingers of the Companions
    { 0.5866, 0.3753, 9, 2 },
    { 0.6134, 0.4247, 9, 2 },
    { 0.6406, 0.4287, 9, 2 },
    { 0.8030, 0.5121, 9, 3 }, -- The Illusion of Death
    { 0.8008, 0.4835, 9, 3 },
    { 0.8323, 0.4959, 9, 3 },
    { 0.7080, 0.5466, 9, 4, ld = { 1, } }, -- Jorunn the Skald-King
    { 0.682, 0.522, 9, 4 },
    { 0.6415, 0.4992, 9, 4 },
    { 0.6896, 0.46, 9, 4 },
    { 0.579, 0.532, 9, 5 }, -- Triumphs of a Monarch, Ch. 3
    { 0.626, 0.561, 9, 5 },
    { 0.561, 0.504, 9, 5 },
    { 0.599, 0.489, 9, 5 },
    { 0.552, 0.530, 9, 6 }, -- Triumphs of a Monarch, Ch. 6
    { 0.559, 0.592, 9, 6 },
    { 0.565, 0.558, 9, 6 },
    { 0.521, 0.547, 9, 6 },
    { 0.4958, 0.5458, 9, 7 }, -- Triumphs of a Monarch, Ch. 10
    { 0.4532, 0.5154, 9, 7 },
    { 0.4428, 0.5532, 9, 7 },
    { 0.518, 0.499, 9, 7 },
    { 0.4958, 0.5732, 9, 8 }, -- Trials of St. Alessia
    { 0.5422, 0.6384, 9, 8 },
    { 0.5196, 0.6015, 9, 8 },
    { 0.4882, 0.6090, 9, 8 },
    -- Divines and Deities
    { 0.599, 0.590, 10, 1 }, -- The Anuad Paraphrased
    { 0.663, 0.636, 10, 1 },
    { 0.5668, 0.6381, 10, 1 },
    { 0.6300, 0.6002, 10, 1 },
    { 0.5013, 0.6463, 10, 2 }, -- The Lunar Lorkhan
    { 0.4567, 0.6556, 10, 2 },
    { 0.4428, 0.6232, 10, 2 },
    { 0.4886, 0.6713, 10, 2 },
    { 0.4909, 0.7656, 10, 3 }, -- Monomyth: Dragon God & Missing God
    { 0.3948, 0.7406, 10, 3 },
    { 0.4757, 0.7082, 10, 3 },
    { 0.4638, 0.7649, 10, 3 },
    -- Dwemer
    { 0.5515, 0.7174, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
    { 0.5298, 0.6611, 12, 1 },
    { 0.5198, 0.6925, 12, 1 },
    { 0.5460, 0.6965, 12, 1 },
    { 0.5913, 0.7095, 12, 2 }, -- Ancient Scrolls of the Dwemer II
    { 0.6204, 0.7191, 12, 2 },
    { 0.5930, 0.7669, 12, 2 },
    { 0.5629, 0.7388, 12, 2 },
    { 0.6805, 0.7111, 12, 3 }, -- Ancient Scrolls of the Dwemer III
    { 0.6453, 0.7579, 12, 3 },
    { 0.6787, 0.7833, 12, 3 },
    { 0.6715, 0.7455, 12, 3 },
    -- Tamriel History
    { 0.6808, 0.8618, 19, 1 }, -- Ayleid Inscriptions Translated
    { 0.7131, 0.8265, 19, 1 },
    { 0.6340, 0.8521, 19, 1 },
    { 0.6235, 0.8942, 19, 1, ld = { 1, } },
    { 0.6888, 0.9156, 19, 2, ld = { 1, } }, -- Frontier, Conquest
    { 0.6272, 0.9427, 19, 2, ld = { 1, } },
    { 0.6084, 0.9082, 19, 2, ld = { 1, } },
    { 0.5759, 0.9529, 19, 2, ld = { 1, } },
    { 0.5082, 0.9092, 19, 3 }, -- History of the Fighter's Guilds Pt.1
    { 0.5426, 0.8573, 19, 3 },
    { 0.5617, 0.8766, 19, 3 },
    { 0.5621, 0.9049, 19, 3, ld = { 1, } },
    { 0.5928, 0.8493, 19, 4 }, -- History of the Fighter's Guilds Pt.2
    { 0.6196, 0.8249, 19, 4 },
    { 0.5993, 0.7961, 19, 4 },
    { 0.5679, 0.8275, 19, 4 },
    { 0.5299, 0.8190, 19, 5 }, -- Origin of the Mages Guild
    { 0.4842, 0.8273, 19, 5 },
    { 0.5607, 0.7909, 19, 5 },
    { 0.5430, 0.7749, 19, 5 },
    -- Dungeon Lore
    { 0.322, 0.113, 11, 7, 279, ld = { 9999, } }, -- The Binding Stone
  },
  [540] = { -- firsthold_base
    -- Auridon Lore
    { 0.487, 0.314, 25, 8 }, -- Kinlord Rilis and the Mages Guild
    { 0.648, 0.834, 25, 8 },
    { 0.734, 0.558, 25, 8 },
  },
  [545] = { -- skywatch_base
    -- Biographies
    { 0.27, 0.051, 9, 2 }, -- Great Harbingers of the Companions
    { 0.27, 0.46, 9, 4 }, -- Jorunn the Skald-King
    { 0.50, 0.58, 9, 4 },
    { 0.54, 0.21, 9, 4 },
    { 0.66, 0.73, 9, 4 },
    { 0.014, 0.388, 9, 5 }, -- Triumphs of a Monarch, Ch. 3
  },
  [243] = { -- vulkhelguard_base
    -- Tamriel History
    { 0.509120, 0.387047, 19, 1 }, -- Ayleid Inscriptions Translated
    { 0.830, 0.490, 19, 2 }, -- Frontier, Conquest
    { 0.529, 0.626, 19, 2 },
    { 0.271, 0.675, 19, 2 },
    { 0.436, 0.455, 19, 2 },
    { 0.206, 0.437, 19, 3 }, -- History of the Fighters Guild Pt. 1
  },
  [279] = { -- thebanishedcells_base
    -- Dungeon Lore
    { 0.4846401513, 0.8386483192, 11, 7, 279, ld = { 5, } }, -- The Binding Stone
  },

  -- bangkorai
  [20] = { -- bangkorai_base
    -- Bangkorai Lore
    { 0.398, 0.301, 4, 1, ld = { 1, } }, -- The Legend of Fallen Grotto
    { 0.414, 0.417, 4, 1, ld = { 1, } },
    { 0.386, 0.368, 4, 1, ld = { 1, } },
    { 0.390, 0.393, 4, 1, ld = { 1, } },
    { 0.501, 0.355, 4, 2 }, -- Living with Lycanthropy
    { 0.504, 0.391, 4, 2 },
    { 0.555, 0.407, 4, 2 },
    { 0.5752, 0.4511, 4, 2 },
    { 0.627, 0.358, 4, 3 }, -- Bangkorai, Shield of High Rock
    { 0.557, 0.367, 4, 3 },
    { 0.612, 0.321, 4, 3 },
    { 0.592, 0.402, 4, 3 },
    { 0.562, 0.215, 4, 4 }, -- The Posting of the Hunt
    { 0.548, 0.259, 4, 4 },
    { 0.586, 0.291, 4, 4 },
    { 0.613, 0.265, 4, 4 },
    { 0.472, 0.336, 4, 5 }, -- Aspects of Lord Hircine
    { 0.472, 0.226, 4, 5 },
    { 0.452, 0.282, 4, 5 },
    { 0.528, 0.322, 4, 5 },
    { 0.359, 0.216, 4, 6 }, -- The Viridian Sentinel
    { 0.431, 0.201, 4, 6 },
    { 0.395, 0.202, 4, 6 },
    { 0.34, 0.293, 4, 6 },
    { 0.467, 0.169, 4, 7 }, -- The True-Told Tale of Hallin, Pt. 1
    { 0.532, 0.165, 4, 7 },
    { 0.511, 0.117, 4, 7 },
    { 0.5829, 0.0767, 4, 7 },
    { 0.690, 0.135, 4, 8 }, -- The True-Told Tale of Hallin, Pt 2
    { 0.603, 0.140, 4, 8 },
    { 0.625, 0.099, 4, 8 },
    { 0.639, 0.130, 4, 8 },
    { 0.627, 0.180, 4, 9 }, -- A Life Barbaric and Brutal
    { 0.614, 0.152, 4, 9 },
    { 0.661, 0.183, 4, 9 },
    { 0.579, 0.177, 4, 9 },
    { 0.625, 0.208, 4, 10 }, -- The Glenmoril Wyrd
    { 0.653, 0.249, 4, 10 },
    { 0.704, 0.207, 4, 10 },
    { 0.658, 0.208, 4, 10 },
    -- Dwemer
    { 0.678, 0.285, 12, 13 }, -- Dwemer Inquiries Volume I
    { 0.701, 0.288, 12, 13 },
    { 0.6879, 0.3396, 12, 13 },
    { 0.630, 0.434, 12, 14 }, -- Dwemer Inquiries Volume II
    { 0.700, 0.495, 12, 14 },
    { 0.655, 0.459, 12, 14 },
    { 0.664, 0.442, 12, 14 },
    { 0.627, 0.477, 12, 15 }, -- Dwemer Inquiries Volume III
    { 0.595, 0.532, 12, 15 },
    { 0.6588, 0.5664, 12, 15 },
    { 0.6616, 0.512, 12, 15 },
    { 0.573, 0.473, 12, 16 }, -- Ancient Scrolls of the Dwemer IV
    { 0.490, 0.511, 12, 16 },
    { 0.5256, 0.4929, 12, 16 },
    { 0.5435, 0.4869, 12, 16 },
    -- Literature
    { 0.440, 0.503, 14, 1 }, -- The Homilies of Blessed Almalexia
    { 0.353, 0.468, 14, 1 },
    { 0.475, 0.458, 14, 1 },
    { 0.4452, 0.4202, 14, 1 },
    { 0.327, 0.540, 14, 2 }, -- The Legendary Scourge
    { 0.343, 0.593, 14, 2 },
    { 0.450, 0.562, 14, 2 },
    { 0.329, 0.570, 14, 2 },
    { 0.25, 0.64, 14, 3, ld = { 3, } }, -- The Lusty Argonian Maid, Volume 1
    { 0.296, 0.609, 14, 3 },
    { 0.341, 0.606, 14, 3 },
    { 0.304, 0.659, 14, 3 },
    { 0.271, 0.726, 14, 4, ld = { 1, } }, -- The Lusty Argonian Maid, Volume 2
    { 0.258, 0.701, 14, 4, ld = { 1, } },
    { 0.22, 0.77, 14, 4, ld = { 1, } },
    { 0.2588, 0.8028, 14, 4, ld = { 1, } },
    { 0.273, 0.845, 14, 5 }, -- Myths of Sheogorath, Volume 1
    { 0.313, 0.814, 14, 5 },
    { 0.248, 0.879, 14, 5 },
    { 0.3069, 0.8715, 14, 5 },
    { 0.326, 0.935, 14, 6 }, -- Myths of Sheogorath, Volume 2
    { 0.351, 0.866, 14, 6 },
    { 0.376, 0.900, 14, 6, ld = { 2, } },
    { 0.394, 0.834, 14, 6 },
    { 0.44, 0.88, 14, 7, ld = { 3, } }, -- The Red Book of Riddles
    { 0.481, 0.923, 14, 7 },
    { 0.476, 0.872, 14, 7 },
    { 0.357, 0.747, 14, 8 }, -- 16 Accords of Madness, Vol. VI
    { 0.442, 0.736, 14, 8 },
    { 0.394, 0.782, 14, 8 },
    { 0.372, 0.681, 14, 9 }, -- Crow and Raven: Three Short Fables
    { 0.337, 0.691, 14, 9 },
    { 0.3827, 0.6531, 14, 9 },
    { 0.4107, 0.6483, 14, 9 },
    { 0.3915, 0.3464, 14, 9, ld = { 1, } },
    { 0.487, 0.659, 14, 10 }, -- Wabbajack
    { 0.521, 0.709, 14, 10 },
    { 0.523, 0.673, 14, 10 },
    { 0.471, 0.615, 14, 10 },
    -- Poetry and Song
    { 0.5859, 0.6375, 18, 7 }, -- Proper-Life: Three Chants
    { 0.559, 0.682, 18, 7 },
    { 0.5395, 0.6248, 18, 7 },
    { 0.5425, 0.7383, 18, 7 },
    { 0.633, 0.723, 18, 8 }, -- Song of the Askelde Men
    { 0.593, 0.726, 18, 8 },
    { 0.595, 0.696, 18, 8 },
    { 0.618, 0.7458, 18, 8 },
    { 0.606, 0.626, 18, 9 }, -- The Warrior's Charge
    { 0.647, 0.675, 18, 9 },
    { 0.690, 0.682, 18, 9 },
    { 0.668, 0.647, 18, 9 },
    { 0.495, 0.569, 18, 10 }, -- Words of the Wind
    { 0.490, 0.560, 18, 10 },
    { 0.5163, 0.5811, 18, 10 },
    -- Dungeon Lore
    { 0.372, 0.277, 11, 13, 347, ld = { 9999, } }, -- Civility and Etiquette V. 5: Undead
  },
  [84] = { -- evermore_base
    -- Bangkorai Lore
    { 0.423, 0.165, 4, 1 }, -- The Legend of Fallen Grotto
    { 0.354, 0.551, 4, 1 },
    { 0.512, 0.839, 4, 1 },
    { 0.374, 0.697, 4, 1 },
    { 0.6893230081, 0.8562661409, 14, 1, }, -- The Homilies of Blessed Almalexia
    { 0.382820, 0.431219, 14, 9 }, -- Crow and Raven: Three Short Fables
  },
  [431] = { -- onsisbreathmine_base
    -- Literature
    { 0.207, 0.640, 14, 6 }, -- Myths of Sheogorath, Volume 2
  },
  [360] = { -- hallinsstand_base
    -- Literature
    { 0.540, 0.376, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
    { 0.477, 0.259, 14, 4 },
    { 0.292, 0.574, 14, 4 },
  },
  [347] = { -- blackhearthavenarea1_base
    -- Dungeon Lore
    { 0.708, 0.486, 11, 13, 347, ld = { 5, } }, -- Civility and Etiquette V. 5: Undead
  },

  -- coldharbor
  [255] = { -- coldharbour_base
    { 0.285, 0.598, 29, 1 }, -- Exegesis of Merid-Nunda
    { 0.378, 0.639, 29, 1 },
    { 0.3259, 0.5192, 29, 1 },
    { 0.3971, 0.5496, 29, 1 },
    { 0.328, 0.643, 29, 2 }, -- The Whithering of Delodiil
    { 0.215, 0.612, 29, 2 },
    { 0.261, 0.697, 29, 2 },
    { 0.2911, 0.7205, 29, 2 },
    { 0.317, 0.822, 29, 3 }, -- Chaotic Creatia: The Azure Plasm
    { 0.422, 0.739, 29, 3 },
    { 0.365, 0.753, 29, 3 },
    { 0.387, 0.670, 29, 3 },
    { 0.513, 0.690, 29, 4, ld = { 1, } }, -- I was Summoned by a Mortal
    { 0.470, 0.693, 29, 4, ld = { 1, } },
    { 0.534, 0.657, 29, 4, ld = { 1, } },
    { 0.4899, 0.6550, 29, 4, ld = { 1, } },
    { 0.607, 0.717, 29, 5 }, -- A Life of Strife and Struggle
    { 0.573, 0.758, 29, 5 },
    { 0.582, 0.692, 29, 5 },
    { 0.6087, 0.6024, 29, 5 },
    { 0.759, 0.819, 29, 6 }, -- The Black Forge
    { 0.680, 0.643, 29, 6 },
    { 0.710, 0.761, 29, 6 },
    { 0.676, 0.700, 29, 6 },
    { 0.718, 0.534, 29, 7 }, -- The Lightless Oubliette
    { 0.594, 0.535, 29, 7 },
    { 0.676, 0.572, 29, 7 },
    { 0.718, 0.485, 29, 7 },
    { 0.639, 0.462, 29, 8 }, -- The Library of Dusk: Rare Books
    { 0.592, 0.407, 29, 8 },
    { 0.608, 0.451, 29, 8 },
    { 0.6228, 0.4399, 29, 8 },
    { 0.447, 0.416, 29, 9 }, -- Oath of a Dishonored Clan
    { 0.470, 0.390, 29, 9 },
    { 0.539, 0.385, 29, 9 },
    { 0.54, 0.39, 29, 9 },
    { 0.454, 0.510, 29, 10 }, -- Protocols of the Court of Contempt
    { 0.569, 0.507, 29, 10 },
    { 0.4482, 0.4566, 29, 10 },
    { 0.5474, 0.4550, 29, 10 },
    -- Dungeon Lore
    --[[TODO CHeck This ]]--
    { 0.579, 0.484, 11, 16, 454, ld = { 9999, } }, -- To All Who Pass Through
  },
  [422] = { -- hollowcity_base
    { 0.646, 0.569, 29, 4 }, -- I was Summoned by a Mortal
    { 0.301, 0.611, 29, 4 },
    { 0.839, 0.289, 29, 4 },
  },
  [454] = { -- vaultsofmadness1_base
    -- Dungeon Lore
    { 0.160, 0.850, 11, 16, 454, ld = { 5, } }, -- To All Who Pass Through
  },

  -- cyrodiil
  [16] = { -- ava_whole
    -- Daedric Princes
    { 0.526, 0.577, 8, 1 }, -- Aedra and Daedra
    { 0.734, 0.483, 8, 3 }, -- The Dreamstride
    { 0.271, 0.228, 8, 4 }, -- The House of Troubles
    { 0.721, 0.695, 8, 5, ld = { 2, } }, -- Invocation of Azura
    { 0.128, 0.385, 8, 6 }, -- Modern Heretics
    { 0.267, 0.228, 8, 9 }, -- Fragmentae Abyssum Hermaeus Morus
    { 0.339, 0.637, 8, 10 }, -- The Spawn of Molag Bal
    { 0.768, 0.5393, 8, 7 }, -- Opusculus Lamae Bal ta Mezzamortie
    { 0.6783, 0.5081, 8, 8 }, -- The Totems of Hircine
    -- Biographies
    { 0.4850, 0.5748, 9, 1 }, -- Galerion the Mystic
    { 0.338, 0.285, 9, 2 }, -- Great Harbingers of the Companions
    { 0.422, 0.147, 9, 4, ld = { 2, } }, -- Jorunn the Skald-King
    { 0.220, 0.244, 9, 5 }, -- Triumphs of a Monarch, Ch. 3
    { 0.624, 0.582, 9, 7 }, -- Triumphs of a Monarch, Ch. 10
    { 0.275, 0.704, 9, 8 }, -- Trials of St. Alessia
    { 0.293, 0.170, 9, 9 }, -- The All-Beneficent King Fahara'jad
    { 0.583, 0.195, 9, 10, ld = { 2, } }, -- Ayrenn: The Unforeseen Queen
    -- Divines and Deities
    { 0.4691, 0.5521, 10, 1 }, -- The Anuad Paraphrased
    { 0.754, 0.285, 10, 2 }, -- The Lunar Lorkhan
    { 0.4308, 0.1133, 10, 3 }, -- Monomyth: Dragon God & Missing God
    { 0.323, 0.152, 10, 4 }, -- Monomyth: Lorkhan and Satakal5
    { 0.759, 0.347, 10, 5, ld = { 2, } }, -- Monomyth: "Shezarr's Song"
    { 0.274, 0.669, 10, 7 }, -- Monomyth: The Heart of the World
    { 0.213, 0.398, 10, 8 }, -- Nine Commands of the Eight Divines
    { 0.321, 0.373, 10, 9 }, -- Gods and Worship In Tamriel
    { 0.365, 0.611, 10, 10 }, -- Vivec and Mephala
    -- Dungeon Lore
    { 0.203, 0.257, 11, 1 }, -- With Regards to the Ebony Blade
    { 0.754, 0.149, 11, 2 }, -- What is Volendrung?
    { 0.538, 0.810, 11, 3, ld = { 2, } }, -- The Thief God's Treasures
    { 0.381, 0.723, 11, 4 }, -- War Weather
    { 0.710, 0.490, 11, 5, ld = { 2, } }, -- Civility and Etiquette: Wood Orcs I -- Kodiak
    { 0.608, 0.451, 11, 6 }, -- The Art of Kwama Egg Cooking
    { 0.355, 0.135, 11, 7, ld = { 2, } }, -- The Binding Stone
    { 0.592, 0.388, 11, 8 }, -- Where Magical Paths Meet
    { 0.779, 0.216, 11, 9 }, -- Wayrest Sewers: A Short History
    { 0.714, 0.536, 11, 10 }, -- To Posterity
    -- Dwemer
    { 0.3053, 0.2204, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
    { 0.3756, 0.1541, 12, 3 }, -- Ancient Scrolls of the Dwemer III
    { 0.241, 0.397, 12, 5 }, -- Ancient Scrolls of the Dwemer VI
    { 0.6042, 0.3084, 12, 6 }, -- Ancient Scrolls of the Dwemer X
    { 0.6627, 0.5644, 12, 7 }, -- Ancient Scrolls of the Dwemer XI
    { 0.316, 0.563, 12, 8, ld = { 2, } }, -- Antecedents of Dwemer Law
    { 0.750, 0.474, 12, 9, }, -- Dwarven Automatons
    { 0.395, 0.688, 12, 10 }, -- Ancient Scrolls of the Dwemer I-B
    { 0.1707, 0.2661, 12, 11 }, -- Guylaine's Dwemer Architecture
    { 0.260, 0.530, 12, 12 }, -- Ancient Scrolls of the Dwemer VIII
    { 0.5837, 0.4395, 12, 13 }, -- Dwemer Inquiries Volume I
    { 0.719, 0.435, 12, 14 }, -- Dwemer Inquiries Volume II
    { 0.316, 0.172, 12, 15 }, -- Dwemer Inquiries Volume III
    { 0.184, 0.459, 12, 16 }, -- Ancient Scrolls of the Dwemer IV
    -- Legends of Nirn
    { 0.122, 0.272, 13, 1 }, -- An Accounting of the Elder Scrolls
    { 0.568, 0.841, 13, 1 },
    { 0.483, 0.611, 13, 1 },
    { 0.815, 0.180, 13, 1 },
    { 0.629, 0.684, 13, 2 }, -- The Adabal-a
    { 0.702, 0.376, 13, 3 }, -- The Amulet of Kings
    { 0.222, 0.489, 13, 4 }, -- The Cleansing of the Fane
    { 0.807, 0.279, 13, 5 }, -- The Exclusionary Mandates
    { 0.501, 0.761, 13, 6 }, -- The Last King of the Ayleids
    { 0.778, 0.204, 13, 7 }, -- The Order of the Ancestor Moth
    { 0.569, 0.835, 13, 7 },
    { 0.117, 0.271, 13, 7 },
    { 0.810, 0.180, 13, 7 },
    { 0.361, 0.221, 13, 8, ld = { 2, } }, -- Tamrielic Artifacts, Part One
    { 0.363, 0.698, 13, 9, ld = { 2, } }, -- Tamrielic Artifacts, Part Two
    { 0.363, 0.415, 13, 10 }, -- Tamrielic Artifacts, Part Three
    -- Literature
    { 0.408, 0.166, 14, 1 }, -- The Homilies of Blessed Almalexia
    { 0.462, 0.615, 14, 2 }, -- The Legendary Scourge
    { 0.309, 0.734, 14, 3 }, -- The Lusty Argonian Maid, Volume 1
    { 0.6397, 0.5342, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
    { 0.807, 0.461, 14, 5, ld = { 2, } }, -- Myths of Sheogorath, Volume 1
    { 0.391, 0.556, 14, 6 }, -- Myths of Sheogorath, Volume 29
    { 0.5327, 0.5788, 14, 7 }, -- The Red Book of Riddles
    { 0.305, 0.663, 14, 8 }, -- 16 Accords of Madness, Vol. VI
    { 0.790, 0.274, 14, 9 }, -- Crow and Raven: Three Short Fables
    { 0.7203, 0.1286, 14, 10 }, -- Wabbajack
    -- Magic and Magicka
    { 0.586, 0.660, 15, 1 }, -- Arcana Restored
    { 0.901, 0.346, 15, 2 }, -- Liminal Bridges
    { 0.5366, 0.1454, 15, 3 }, -- Magic from the Sky
    { 0.1953, 0.3091, 15, 4 }, -- Manual of Spellcraft
    { 0.673, 0.596, 15, 5, ld = { 2, } }, -- The Old Ways
    { 0.455, 0.725, 15, 6, ld = { 2, } }, -- On the Detachment of the Sheath
    { 0.670, 0.664, 15, 7 }, -- Reality and Other Falsehoods
    { 0.278, 0.711, 15, 8 }, -- Guild Memo on Soul Trapping
    { 0.720, 0.425, 15, 9 }, -- Wayshrines of Tamriel
    { 0.249, 0.550, 15, 10 }, -- Proposal: Schools of Magic
    -- Myths of the Mundus
    { 0.2655, 0.6676, 16, 1 }, -- Before the Ages of Man: Dawn Era
    { 0.3924, 0.2087, 16, 2 }, -- Before the Ages of Man: Merethic Era
    { 0.3659, 0.7413, 16, 4 }, -- Noxiphilic Sanguivoria
    { 0.720, 0.583, 16, 5 }, -- A Werewolf's Confession
    { 0.716, 0.669, 16, 6 }, -- The Firmament
    { 0.809, 0.297, 16, 7 }, -- The Pig Children
    { 0.587, 0.693, 16, 8 }, -- Ruminations on the Elder Scrolls
    { 0.289, 0.485, 16, 9, ld = { 2, } }, -- Sithis
    { 0.715, 0.533, 16, 10 }, -- The Consecrations of Arkay
    -- Oblivion Lore
    { 0.1202, 0.3911, 17, 1 }, -- The Book of Daedra
    { 0.316, 0.247, 17, 2 }, -- Darkest Darkness
    { 0.661, 0.611, 17, 3 }, -- The Doors of Oblivion, Part 1
    { 0.807, 0.251, 17, 4, ld = { 2, } }, -- The Doors of Oblivion, Part 2
    { 0.154, 0.241, 17, 5, ld = { 2, } }, -- On Oblivion
    { 0.375, 0.330, 17, 6 }, -- Spirit of the Daedra
    { 0.188, 0.263, 17, 7 }, -- Varieties of Daedra, Part 1
    { 0.613, 0.565, 17, 8 }, -- Varieties of Daedra, Part 2
    { 0.206, 0.507, 17, 9, ld = { 2, } }, -- The Slave Pits of Coldharbour
    { 0.707, 0.414, 17, 10, ld = { 4, } }, -- On the Nature of Coldharbour
    -- Poetry and Song
    { 0.647, 0.776, 18, 1 }, -- The Battle of Glenumbria Moors
    { 0.167, 0.373, 18, 2 }, -- The Book of Dawn and Dusk
    { 0.709, 0.229, 18, 3 }, -- The Cantatas of Vivec
    { 0.305, 0.715, 18, 4 }, -- The Five Far Stars
    { 0.503, 0.215, 18, 5, ld = { 2, } }, -- Flesh to Cut from Bone
    { 0.508, 0.822, 18, 6 }, -- Ode to the Tundrastriders
    { 0.719, 0.390, 18, 7 }, -- Proper-Life: Three Chants
    { 0.177, 0.273, 18, 8 }, -- Song of the Askelde Men
    { 0.525, 0.288, 18, 9 }, -- The Warrior's Charge -- ZOS BUG book have 2 spots
    { 0.3183, 0.7104, 18, 9 }, -- The Warrior's Charge -- ZOS BUG book have 2 spots
    { 0.630, 0.692, 18, 10 }, -- Words of the Wind
    -- Tamriel History
    { 0.3152, 0.5869, 19, 1 }, -- Ayleid Inscriptions Translated
    { 0.537, 0.809, 19, 2 }, -- Frontier, Conquest
    { 0.765, 0.386, 19, 5 }, -- Origin of the Mages Guild
    { 0.389, 0.404, 19, 6 }, -- Eulogy for Emperor Varen
    { 0.837, 0.258, 19, 7 }, -- House Tharn of Nibenay
    { 0.685, 0.690, 19, 8 }, -- The Order of the Black Worm
    { 0.471, 0.208, 19, 9 }, -- Return to Orsinium
    { 0.306, 0.663, 19, 10 }, -- The Second Akaviri Invasion
    { 0.6393, 0.2971, 19, 4 }, -- History of the Fighter's Guilds Pt.2
  },
  [469] = { -- bloodmaynecave_base
    -- Dungeon Lore
    { 0.451, 0.532, 11, 3 }, -- The Thief God's Treasures			-- bug #398,473
  },
  [285] = { -- breakneckcave_base
    { 0.537, 0.594, 16, 9 }, -- Sithis					, bug #798
  },
  [470] = { -- capstonecave_base
    { 0.635, 0.218, 9, 4 }, -- Jorunn the Skald-King
  },
  [474] = { -- crackedwoodcave_base
    { 0.345, 0.257, 15, 5 }, -- The Old Ways
  },
  [473] = { -- echocave_base
    { 0.664, 0.655, 11, 7 }, -- The Binding Stone
  },
  [286] = { -- haynotecave_base
    { 0.30, 0.43, 12, 8 }, -- Antecedents of Dwemer Law
  },
  [340] = { -- kingscrest_base
    { 0.687, 0.753, 17, 4 }, -- The Doors of Oblivion, Part 2
  },
  [290] = { -- lipsandtarn_base
    -- Oblivion Lore
    { 0.541, 0.394, 17, 5 }, -- On Oblivion
  },
  [287] = { -- muckvalleycavern_base
    { 0.226, 0.750, 11, 5 }, -- Civility and Etiquette: Wood Orcs I
  },
  [468] = { -- newtcave_base
    { 0.320, 0.465, 8, 5 }, -- Invocation of Azura
  },
  [467] = { -- nisincave_base
    -- Legends of Nirn
    { 0.490, 0.425, 13, 9 }, -- Tamrielic Artifacts, Part Two
  },
  [291] = { -- potholecavern_base
    { 0.615, 0.460, 15, 6 }, -- On the Detachment of the Sheath, bug #798
  },
  [471] = { -- quickwatercave_base
    { 0.473, 0.817, 10, 5, ld = { 2, } }, -- Monomyth: "Shezarr's Song"
  },
  [289] = { -- redrubycave_base
    -- Biographies
    { 0.300, 0.360, 9, 10 }, -- Ayrenn: The Unforeseen Queen
  },
  [466] = { -- serpenthollowcave_base
    -- Oblivion Lore
    { 0.276, 0.572, 17, 9 }, -- The Slave Pits of Coldharbour,798 addon comment
  },
  [294] = { -- toadstoolhollowlower_base
    -- Poetry and Song
    { 0.908, 0.368, 18, 5 }, -- Flesh to Cut from Bone
  },
  [288] = { -- underpallcave_base
    -- Legends of Nirn
    { 0.311, 0.181, 13, 8 }, -- Tamrielic Artifacts, Part One
  },
  [299] = { -- vahtacen_base
    -- Literature
    { 0.571, 0.642, 14, 5 }, -- Myths of Sheogorath, Volume 1
  },
  [660] = { -- imperialcity_base
    -- Legends of Nirn
    { 0.3669, 0.2425, 13, 1 }, -- An Accounting of the Elder Scrolls
    { 0.3106, 0.7851, 13, 3 }, -- The Amulet of Kings
    -- Oblivion Lore
    { 0.6691, 0.1456, 17, 8 }, -- Varieties of Daedra, Part 2
    -- Tamriel History
    { 0.7039, 0.5023, 19, 8 }, -- The Order of the Black Worm
  },
  [900] = { -- imperialsewer_daggerfall1_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [901] = { -- imperialsewer_daggerfall2_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [902] = { -- imperialsewer_daggerfall3_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [890] = { -- imperialsewers_ebon1_base
    -- Oblivion Lore
    { 0.547170, 0.264717, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [891] = { -- imperialsewers_ebon2_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [892] = { -- imperialsewers_ebon2_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [897] = { -- imperialsewers_aldmeri1_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [898] = { -- imperialsewers_aldmeri2_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [899] = { -- imperialsewers_aldmeri3_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },
  [657] = { -- imperialsewershub_base
    -- Oblivion Lore
    { 0.5470, 0.2651, 17, 1 }, -- The Book of Daedra
    -- Daedric Princes
    { 0.8644, 0.6991, 8, 10 }, -- The Spawn of Molag Bal
    -- Oblivion Lore
    { 0.0854, 0.6429, 17, 2 }, -- Darkest Darkness
  },

  -- deshaan
  [13] = { -- deshaan_base
    -- Deshaan Lore
    { 0.152, 0.447, 23, 1 }, -- The Living Gods
    { 0.121, 0.404, 23, 1 },
    { 0.202, 0.455, 23, 2 }, -- The Judgment of Saint Veloth
    { 0.185, 0.413, 23, 2 },
    { 0.138, 0.454, 23, 2 },
    { 0.1761, 0.4692, 23, 2 },
    { 0.436, 0.649, 23, 3 }, -- Kwama Mining for Fun and Profit
    { 0.338, 0.634, 23, 3 },
    { 0.367, 0.641, 23, 3 },
    { 0.429, 0.6771, 23, 3 },
    { 0.152, 0.494, 23, 4 }, -- Shad Astula Academy Handbook
    { 0.1930, 0.5548, 23, 4, ld = { 1, } },
    { 0.1646, 0.5519, 23, 4, ld = { 1, } },
    { 0.1718, 0.5108, 23, 4 },
    { 0.118, 0.565, 23, 5 }, -- Dwemer Dungeons: What I Know
    { 0.138, 0.619, 23, 5 },
    { 0.126, 0.618, 23, 5 },
    { 0.226, 0.587, 23, 6 }, -- Legend of the Ghost Snake
    { 0.200, 0.619, 23, 6 },
    { 0.188, 0.597, 23, 6 },
    { 0.2036, 0.5794, 23, 6 },
    { 0.302, 0.570, 23, 7 }, -- War of Two Houses
    { 0.307, 0.621, 23, 7 },
    { 0.288, 0.597, 23, 7 },
    { 0.256, 0.610, 23, 7 },
    { 0.240, 0.547, 23, 8 }, -- A Pocket Guide to Mournhold
    { 0.240, 0.524, 23, 8 },
    { 0.274, 0.524, 23, 8 },
    { 0.277, 0.5675, 23, 8 },
    { 0.314, 0.453, 23, 9 }, -- Sanctioned Murder
    { 0.395455, 0.428587, 23, 9 }, -- Sanctioned Murder
    { 0.350, 0.445, 23, 9 },
    { 0.3201, 0.4194, 23, 9, ld = { 2, } },
    { 0.244, 0.466, 23, 10 }, -- Dark Ruins
    { 0.237, 0.491, 23, 10 },
    { 0.223, 0.503, 23, 10 },
    { 0.2796, 0.4927, 23, 10 },
    -- Daedric Princes
    { 0.387, 0.620, 8, 3 }, -- The Dreamstride
    { 0.359, 0.582, 8, 3 },
    { 0.383, 0.562, 8, 3 },
    { 0.344, 0.551, 8, 3 },
    { 0.442, 0.376, 8, 4 }, -- The House of Troubles
    { 0.427, 0.417, 8, 4 },
    { 0.392, 0.382, 8, 4 },
    { 0.4617, 0.3769, 8, 4 },
    -- Divines and Deities
    { 0.572, 0.419, 10, 4 }, -- Monomyth: Lorkhan and Satakal
    { 0.588, 0.467, 10, 4 },
    { 0.538, 0.468, 10, 4 },
    { 0.609, 0.506, 10, 4 },
    { 0.5586, 0.5719, 10, 5 }, -- Monomyth: "Shezarr's Song"
    { 0.506, 0.564, 10, 5 },
    { 0.7121, 0.6333, 10, 5 },
    { 0.6975, 0.4558, 10, 5 },
    { 0.888, 0.518, 10, 6 }, -- Monomyth: The Myth of Aurbis
    { 0.909, 0.546, 10, 6 },
    { 0.870, 0.565, 10, 6 },
    { 0.845, 0.541, 10, 6 },
    -- Dwemer
    { 0.775, 0.475, 12, 4 }, -- Ancient Scrolls of the Dwemer V
    { 0.728, 0.467, 12, 4 },
    { 0.753, 0.462, 12, 4 },
    { 0.779, 0.441, 12, 4 },
    { 0.867, 0.410, 12, 5 }, -- Ancient Scrolls of the Dwemer VI
    { 0.894, 0.364, 12, 5 },
    { 0.835, 0.402, 12, 5 },
    { 0.853, 0.380, 12, 5 },
    { 0.611, 0.443, 12, 6 }, -- Ancient Scrolls of the Dwemer X
    { 0.650, 0.477, 12, 6 },
    { 0.673, 0.451, 12, 6 },
    { 0.714, 0.434, 12, 6 },
    -- Magic and Magicka
    { 0.405, 0.450, 15, 1 }, -- Arcana Restored
    { 0.404, 0.485, 15, 1, ld = { 1, } },
    { 0.4373, 0.4447, 15, 1, ld = { 1, } },
    { 0.751, 0.572, 15, 2 }, -- Liminal Bridges
    { 0.731, 0.512, 15, 2 },
    { 0.687, 0.508, 15, 2 },
    { 0.7688, 0.5397, 15, 2 },
    { 0.674, 0.425, 15, 3 }, -- Magic from the Sky
    { 0.646, 0.425, 15, 3 },
    { 0.7247, 0.3902, 15, 3 },
    { 0.662, 0.3884, 15, 3 },
    { 0.876, 0.481, 15, 4 }, -- Manual of Spellcraft
    { 0.865, 0.480, 15, 4 },
    { 0.835, 0.449, 15, 4 },
    { 0.846, 0.427, 15, 4 },
    { 0.646, 0.546, 15, 5 }, -- The Old Ways
    { 0.673, 0.590, 15, 5 },
    { 0.656, 0.525, 15, 5 },
    { 0.7057, 0.5456, 15, 5 },
    { 0.454, 0.532, 15, 6, ld = { 1, } }, -- On the Detachment of the Sheath
    { 0.4245, 0.4916, 15, 6 },
    { 0.494, 0.532, 15, 6, ld = { 1, } },
    { 0.407, 0.536, 15, 6, ld = { 1, } },
    { 0.815, 0.560, 15, 7 }, -- Reality and Other Falsehoods
    { 0.799, 0.508, 15, 7 },
    { 0.788, 0.561, 15, 7 },
    { 0.8381, 0.4838, 15, 7 },
    { 0.562, 0.391, 15, 8 }, -- Guild Memo on Soul Trapping
    { 0.593, 0.326, 15, 8 },
    { 0.6109, 0.3821, 15, 8 },
    -- Myths of the Mundus
    { 0.900, 0.416, 16, 1 }, -- Before the Ages of Man: Dawn Era
    { 0.908, 0.437, 16, 1 },
    { 0.9222, 0.4051, 16, 1 },
    { 0.9377, 0.4559, 16, 1 },
    { 0.767, 0.361, 16, 2 }, -- Before the Ages of Man: Merethic Era
    { 0.765, 0.394, 16, 2 },
    { 0.755, 0.387, 16, 2 },
    { 0.7822, 0.4094, 16, 2 },
    { 0.630, 0.609, 16, 3 }, -- Ebony Blade History
    { 0.674, 0.654, 16, 3 },
    { 0.7394, 0.6256, 16, 3 },
    { 0.6933, 0.6139, 16, 3 },
    { 0.100, 0.487, 16, 4 }, -- Noxiphilic Sanguivoria
    { 0.125, 0.497, 16, 4 },
    { 0.137, 0.539, 16, 4 },
    { 0.110, 0.516, 16, 4 },
    { 0.516, 0.565, 16, 5 }, -- A Werewolf's Confession
    { 0.460, 0.614, 16, 5 },
    { 0.435, 0.588, 16, 5 },
    { 0.4687, 0.5872, 16, 5 },
    -- Dungeon Lore
    { 0.790, 0.585, 11, 6, 118, ld = { 9999, } }, -- The Art of Kwama Egg Cooking
  },
  [205] = { -- mournhold_base
    -- Daedric Princes
    { 0.204, 0.733, 8, 3 }, -- The Dreamstride [OffMap]
    { 0.422, 0.030, 8, 4 }, -- The House of Troubles [OffMap]
    -- Divines and Deities
    { 0.957, 0.279, 10, 4 }, -- Monomyth: Lorkhan and Satakal [OffMap]
    { 0.801, 0.742, 10, 5 }, -- Monomyth: "Shezarr's Song"
    -- Magic and Magicka
    { 0.309, 0.362, 15, 1 }, -- Arcana Restored
    { 0.309, 0.194, 15, 1 }, -- [OffMap]
    { 0.743, 0.587, 15, 6 }, -- On the Detachment of the Sheath
    { 0.551, 0.589, 15, 6 },
    { 0.324, 0.605, 15, 6 },
    { 0.411368, 0.391360, 15, 6 },
    -- Myths of the Mundus
    { 0.853, 0.748, 16, 5 }, -- A Werewolf's Confession [OffMap]
    { 0.460, 0.860, 16, 5 },
  },
  [537] = { -- narsis_base
    -- Deshaan Lore
    { 0.606, 0.703, 23, 4 }, -- Shad Astula Academy Handbook
    { 0.370, 0.680, 23, 4 },
    { 0.855, 0.269, 23, 10 }, -- Dark Ruins
    -- Myths of the Mundus
    { 0.132, 0.568, 16, 4 }, -- Noxiphilic Sanguivoria
  },
  [547] = { -- obsidiangorge_base
    -- Deshaan Lore
    { 0.1687, 0.2554, 23, 9 }, -- Sanctioned Murder
  },
  [118] = { -- darkshadecaverns_base
    -- Dungeon Lore
    { 0.3099418581, 0.2209302336, 11, 6, 118, ld = { 5, } }, -- The Art of Kwama Egg Cooking
  },

  -- eastmarch
  [61] = { -- eastmarch_base
    -- Eastmarch Lore
    { 0.4976, 0.2865, 22, 1, ld = { 1, } }, -- The Brothers' War
    { 0.428, 0.622, 22, 1 },
    { 0.253, 0.621, 22, 1, ld = { 1, } },
    { 0.459, 0.6028, 22, 1 },
    { 0.4994, 0.5864, 22, 1 },
    { 0.547, 0.507, 22, 2 }, -- Second Invasion: Reports
    { 0.559, 0.544, 22, 2 },
    { 0.579, 0.532, 22, 2 },
    { 0.5648, 0.5511, 22, 2 },
    { 0.666, 0.530, 22, 3 }, -- The Ternion Monks
    { 0.727, 0.577, 22, 3 },
    { 0.626, 0.517, 22, 3 },
    { 0.691, 0.535, 22, 3 },
    { 0.582, 0.604, 22, 4 }, -- Orcs of Skyrim
    { 0.545, 0.617, 22, 4 },
    { 0.557, 0.581, 22, 4 },
    { 0.555, 0.638, 22, 4 },
    { 0.613, 0.601, 22, 5 }, -- The Crown of Freydis
    { 0.681, 0.586, 22, 5 },
    { 0.656, 0.598, 22, 5 },
    { 0.640, 0.578, 22, 5 },
    { 0.616, 0.568, 22, 6 }, -- Spirits of Skyrim
    { 0.661, 0.561, 22, 6 },
    { 0.652, 0.551, 22, 6 },
    { 0.594, 0.577, 22, 6 },
    { 0.638, 0.629, 22, 7 }, -- All About Giants
    { 0.606, 0.621, 22, 7 },
    { 0.680, 0.623, 22, 7 },
    { 0.662, 0.664, 22, 7 },
    { 0.716, 0.637, 22, 8 }, -- The Stormfist Clan
    { 0.687, 0.646, 22, 8 },
    { 0.710, 0.603, 22, 8 },
    { 0.707, 0.566, 22, 8 },
    { 0.7838774920, 0.4864549935, 22, 9, }, -- On Stepping Lightly
    { 0.819, 0.515, 22, 9 },
    { 0.837, 0.552, 22, 9 },
    { 0.854, 0.490, 22, 9 },
    { 0.714, 0.678, 22, 10 }, -- Dreamwalkers
    { 0.7384750247, 0.6922125220, 22, 10, },
    { 0.684, 0.689, 22, 10 },
    { 0.754, 0.659, 22, 10 },
    -- Daedric Princes
    { 0.558, 0.414, 8, 7 }, -- Opusculus Lamae Bal ta Mezzamortie
    { 0.506, 0.415, 8, 7 },
    { 0.494, 0.464, 8, 7 },
    { 0.518, 0.431, 8, 7 },
    { 0.157, 0.559, 8, 8 }, -- The Totems of Hircine
    { 0.164, 0.580, 8, 8 },
    { 0.143, 0.561, 8, 8 },
    { 0.1368, 0.5942, 8, 8 },
    -- Dwemer
    { 0.373, 0.277, 12, 10 }, -- Ancient Scrolls of the Dwemer I-B
    { 0.390, 0.248, 12, 10 },
    { 0.393, 0.320, 12, 10 },
    { 0.411, 0.2779, 12, 10 },
    { 0.551, 0.263, 12, 11 }, -- Guylaine's Dwemer Architecture
    { 0.4925, 0.2865, 12, 11 },
    { 0.4555, 0.3127, 12, 11 },
    { 0.463, 0.259, 12, 11, ld = { 1, } },
    { 0.583, 0.268, 12, 12 }, -- Ancient Scrolls of the Dwemer VIII
    { 0.584, 0.241, 12, 12 },
    { 0.600, 0.311, 12, 12 },
    { 0.592, 0.344, 12, 12 },
    -- Legends of Nirn
    { 0.475, 0.363, 13, 1 }, -- An Accounting of the Elder Scrolls
    { 0.437, 0.407, 13, 1 },
    { 0.445, 0.355, 13, 1 },
    { 0.413, 0.378, 13, 1 },
    { 0.350, 0.360, 13, 2 }, -- The Adabal-a
    { 0.384, 0.384, 13, 2 },
    { 0.365, 0.411, 13, 2 },
    { 0.3313, 0.3920, 13, 2 },
    { 0.471, 0.332, 13, 3 }, -- The Amulet of Kings
    { 0.556, 0.293, 13, 3 },
    { 0.525, 0.326, 13, 3 },
    { 0.5083, 0.3152, 13, 3 },
    { 0.520, 0.360, 13, 4 }, -- The Cleansing of the Fane
    { 0.494, 0.400, 13, 4 },
    { 0.552, 0.355, 13, 4 },
    { 0.464, 0.414, 13, 4 },
    { 0.417, 0.430, 13, 5 }, -- The Exclusionary Mandates
    { 0.446, 0.429, 13, 5 },
    { 0.453, 0.422, 13, 5 },
    { 0.459, 0.454, 13, 5 },
    { 0.306, 0.429, 13, 6 }, -- The Last King of the Ayleids
    { 0.344, 0.421, 13, 6 },
    { 0.321, 0.414, 13, 6 },
    { 0.256, 0.494, 13, 7 }, -- The Order of the Ancestor Moth
    { 0.249, 0.462, 13, 7 },
    { 0.226, 0.518, 13, 7 },
    { 0.331, 0.494, 13, 8 }, -- Tamrielic Artifacts, Part One
    { 0.334, 0.464, 13, 8 },
    { 0.376, 0.444, 13, 8 },
    { 0.288, 0.495, 13, 8 },
    { 0.226, 0.628, 13, 9, ld = { 1, } }, -- Tamrielic Artifacts, Part Two
    { 0.177, 0.611, 13, 9 },
    { 0.219, 0.680, 13, 9 },
    { 0.1957, 0.6503, 13, 9 },
    { 0.250, 0.625, 13, 10, ld = { 1, } }, -- Tamrielic Artifacts, Part Three
    { 0.306, 0.63, 13, 10, ld = { 1, } },
    { 0.248, 0.5955, 13, 10, ld = { 1, } },
    { 0.2743, 0.6563, 13, 10, ld = { 1, } },
    -- Poetry and Song
    { 0.433, 0.503, 18, 1 }, -- The Battle of Glenumbria Moors
    { 0.262, 0.555, 18, 1 },
    { 0.6184, 0.612, 18, 1 },
    { 0.325, 0.531, 18, 1 },
    { 0.3430500031, 0.6567025185, 18, 2, }, -- The Book of Dawn and Dusk
    { 0.389, 0.680, 18, 2 },
    { 0.325, 0.679, 18, 2 },
    { 0.397, 0.648, 18, 2 },
    { 0.363, 0.589, 18, 3 }, -- The Cantatas of Vivec
    { 0.3674924970, 0.6133900285, 18, 3, },
    { 0.381, 0.599, 18, 3 },
    { 0.411, 0.604, 18, 3 },
    { 0.394, 0.542, 18, 4 }, -- The Five Far Stars
    { 0.416, 0.544, 18, 4 },
    { 0.358, 0.557, 18, 4 },
    { 0.443, 0.556, 18, 4 },
    { 0.414, 0.491, 18, 5 }, -- Flesh to Cut from Bone
    { 0.419, 0.471, 18, 5 },
    { 0.370, 0.505, 18, 5 },
    { 0.3835, 0.4637, 18, 5 },
    { 0.4820699990, 0.5130450130, 18, 6, }, -- Ode to the Tundrastriders
    { 0.274, 0.565, 18, 6 },
    { 0.3047, 0.545, 18, 6 },
    { 0.4702, 0.5361, 18, 6 },
    -- Dungeon Lore
    { 0.737, 0.703, 11, 10, 348, ld = { 9999, } }, -- To Posterity
  },
  [578] = { -- fortamol_base
    -- Eastmarch Lore
    { 0.302, 0.441, 22, 1 }, -- The Brothers' War
    -- Legends of Nirn
    { 0.069, 0.481, 13, 9 }, -- Tamrielic Artifacts, Part Two
    { 0.274, 0.473, 13, 10 }, -- Tamrielic Artifacts, Part Three
    { 0.2511834800, 0.2144903392, 13, 10, },
    { 0.2481925040, 0.5947524905, 13, 10, ld = { 9999, } },
  },
  [160] = { -- windhelm_base
    { 0.5133, 0.4830, 22, 1 }, -- The Brothers' War
    -- Dwemer
    { 0.2580, 0.2827, 12, 11 }, -- Guylaine's Dwemer Architecture
    { 0.1972, 0.6798, 12, 11 },
    { 0.4748, 0.4821, 12, 11 },
    { 0.5945, 0.697, 13, 3 }, -- The Amulet of Kings
  },
  [348] = { -- direfrostkeep_base
    -- Dungeon Lore
    { 0.5414461493, 0.6521725059, 11, 10, 348, ld = { 5, } }, -- To Posterity
  },

  -- glenumbra
  [1] = { -- glenumbra_base
    -- Glenumbra Lore
    { 0.2823, 0.7946, 1, 1, ld = { 1, } }, -- The Code of Mauloch
    { 0.3304, 0.8083, 1, 1, ld = { 1, } },
    { 0.2399, 0.7798, 1, 1, ld = { 1, } },
    { 0.3052, 0.7376, 1, 1, ld = { 1, } },
    { 0.22, 0.68, 1, 2, ld = { 1, } }, -- A Warning to the Aldmeri Dominion
    { 0.2658, 0.6911, 1, 2 },
    { 0.2811, 0.7221, 1, 2 },
    { 0.3003, 0.73, 1, 2 },
    { 0.360, 0.715, 1, 3 }, -- True Heirs of the Empire
    { 0.407, 0.673, 1, 3 },
    { 0.316, 0.660, 1, 3 },
    { 0.3723, 0.633, 1, 3 },
    { 0.209, 0.590, 1, 4 }, -- The Werewolf's Hide
    { 0.251, 0.588, 1, 4 },
    { 0.242, 0.600, 1, 4 },
    { 0.235, 0.565, 1, 4 },
    { 0.316, 0.514, 1, 5 }, -- Guide to the Daggerfall Covenant
    { 0.259, 0.528, 1, 5 },
    { 0.351, 0.540, 1, 5 },
    { 0.359, 0.512, 1, 5 },
    { 0.300, 0.574, 1, 6 }, -- The True Nature of Orcs (Banned Ed.)
    { 0.343, 0.614, 1, 6 },
    { 0.294, 0.632, 1, 6 },
    { 0.3612, 0.5742, 1, 6 },
    { 0.452, 0.526, 1, 7 }, -- Varieties of Faith: The Bretons
    { 0.400, 0.427, 1, 7 },
    { 0.412, 0.536, 1, 7 },
    { 0.477, 0.548, 1, 7 },
    { 0.426, 0.576, 1, 7 },
    { 0.423, 0.797, 1, 8 }, -- Varieties of Faith: The Orcs
    { 0.506, 0.650, 1, 8 },
    { 0.434, 0.745, 1, 8 },
    { 0.448, 0.714, 1, 8 },
    { 0.499, 0.778, 1, 8 },
    { 0.564, 0.724, 1, 9 }, -- Wyresses: The Name-Daughters
    { 0.540, 0.711, 1, 9 },
    { 0.512, 0.693, 1, 9 },
    { 0.484, 0.748, 1, 9 },
    { 0.457, 0.640, 1, 10 }, -- Schemes of the Reachmage
    { 0.502, 0.641, 1, 10 },
    { 0.491, 0.623, 1, 10 },
    { 0.494, 0.673, 1, 10 },
    -- Daedric Princes
    { 0.651, 0.374, 8, 1 }, -- Aedra and Daedra
    { 0.693, 0.358, 8, 1 },
    { 0.634, 0.418, 8, 1 },
    { 0.692, 0.414, 8, 1 },
    { 0.608, 0.450, 8, 2 }, -- Boethiah's Proving
    { 0.590, 0.469, 8, 2 },
    { 0.550, 0.507, 8, 2 },
    { 0.5437, 0.4374, 8, 2 },
    -- Biographies
    { 0.294, 0.417, 9, 1 }, -- Galerion the Mystic
    { 0.196, 0.443, 9, 1 },
    { 0.234, 0.486, 9, 1 },
    { 0.2143, 0.4352, 9, 1 },
    { 0.554, 0.609, 9, 2 }, -- Great Harbingers of the Companions
    { 0.588, 0.607, 9, 2 },
    { 0.5546, 0.5779, 9, 2, ld = { 1, } },
    { 0.6094, 0.5634, 9, 2, ld = { 1, } },
    { 0.642, 0.513, 9, 3 }, -- The Illusion of Death
    { 0.689, 0.538, 9, 3 },
    { 0.641, 0.458, 9, 3 },
    { 0.710, 0.475, 9, 3 },
    { 0.744, 0.348, 9, 4 }, -- Jorunn the Skald-King
    { 0.755, 0.406, 9, 4 },
    { 0.721, 0.318, 9, 4 },
    { 0.7016, 0.3021, 9, 4 },
    { 0.520, 0.400, 9, 5 }, -- Triumphs of a Monarch, Ch. 3
    { 0.494, 0.394, 9, 5 },
    { 0.515, 0.450, 9, 5 },
    { 0.515, 0.433, 9, 5 },
    { 0.576, 0.372, 9, 6 }, -- Triumphs of a Monarch, Ch. 6
    { 0.615, 0.351, 9, 6 },
    { 0.615, 0.371, 9, 6 },
    { 0.535, 0.385, 9, 6 },
    { 0.518, 0.353, 9, 7 }, -- Triumphs of a Monarch, Ch. 10
    { 0.509, 0.344, 9, 7 },
    { 0.534, 0.341, 9, 7 },
    { 0.439, 0.349, 9, 8 }, -- Trials of St. Alessia
    { 0.424, 0.407, 9, 8 },
    { 0.448, 0.379, 9, 8 },
    { 0.405, 0.3668, 9, 8 },
    -- Divines and Deities
    { 0.324, 0.382, 10, 1 }, -- The Anuad Paraphrased
    { 0.322, 0.342, 10, 1 },
    { 0.347, 0.362, 10, 1 },
    { 0.377, 0.307, 10, 1 },
    { 0.806, 0.341, 10, 2 }, -- The Lunar Lorkhan
    { 0.548, 0.234, 10, 2 },
    { 0.817, 0.299, 10, 2 },
    { 0.8527, 0.2871, 10, 2 },
    { 0.755, 0.269, 10, 3 }, -- Monomyth: Dragon God & Missing God
    { 0.792, 0.312, 10, 3 },
    { 0.786, 0.232, 10, 3 },
    -- Dwemer
    { 0.7892, 0.1705, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
    { 0.8185, 0.1650, 12, 1 },
    { 0.8377, 0.1699, 12, 1 },
    { 0.8163, 0.1986, 12, 1 },
    { 0.773, 0.156, 12, 2 }, -- Ancient Scrolls of the Dwemer II
    { 0.686, 0.131, 12, 2 },
    { 0.734, 0.149, 12, 2 },
    { 0.754, 0.176, 12, 2 },
    { 0.740, 0.197, 12, 3 }, -- Ancient Scrolls of the Dwemer III
    { 0.723, 0.243, 12, 3 },
    { 0.7158, 0.2041, 12, 3 },
    { 0.7813, 0.2163, 12, 3 },
    -- Tamriel History
    { 0.690, 0.174, 19, 1 }, -- Ayleid Inscriptions Translated
    { 0.605, 0.185, 19, 1 },
    { 0.645, 0.2037, 19, 1 },
    { 0.6561, 0.1551, 19, 1 },
    { 0.603, 0.233, 19, 2 }, -- Frontier, Conquest
    { 0.637, 0.250, 19, 2 },
    { 0.653, 0.234, 19, 2 },
    { 0.684, 0.253, 19, 2 },
    { 0.640, 0.273, 19, 3 }, -- History of the Fighters Guild Pt. 1
    { 0.644, 0.318, 19, 3 },
    { 0.664, 0.339, 19, 3 },
    { 0.6715, 0.2979, 19, 3 },
    { 0.605, 0.324, 19, 4 }, -- History of the Fighters Guild Pt. 2
    { 0.577, 0.301, 19, 4 },
    { 0.590, 0.289, 19, 4 },
    { 0.611, 0.282, 19, 4 },
    { 0.573, 0.225, 19, 5 }, -- Origin of the Mages Guild
    { 0.571, 0.263, 19, 5 },
    { 0.557, 0.228, 19, 5 },
    { 0.522, 0.234, 19, 5 },
    -- Dungeon Lore
    { 0.714, 0.336, 11, 8, 174, ld = { 9999, } }, -- Where Magical Paths Meet
  },
  [531] = { -- aldcroft_base
    -- Biographies
    { 0.387, 0.648, 9, 2 }, -- Great Harbingers of the Companions
    { 0.381, 0.878, 9, 2 },
  },
  [541] = { -- crosswych_base
    -- Dwemer
    { 0.554, 0.822, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
    { 0.568, 0.621, 12, 1 },
    { 0.397, 0.654, 12, 1 },
    { 0.683, 0.648, 12, 1 },
  },
  [63] = { -- daggerfall_base
    -- Glenumbra Lore
    { 0.749, 0.699, 1, 1 }, -- The Code of Mauloch
    { 0.517, 0.636, 1, 1 },
    { 0.311, 0.566, 1, 1 },
    { 0.625, 0.361, 1, 1 },
    { 0.751869, 0.700414, 1, 1 },
    { 0.216, 0.089, 1, 2 }, -- A Warning to the Aldmeri Dominion
    { 0.431, 0.143, 1, 2 },
    { 0.511, 0.290, 1, 2 },
    { 0.606, 0.325, 1, 2 },
    { 0.892, 0.254, 1, 3 }, -- True Heirs of the Empire
  },
  [712] = { -- desolationsend_base
    -- Biographies
    { 0.856, 0.376, 9, 8 }, -- Trials of St. Alessia
  },
  [174] = { -- spindleclutch_base
    -- Dungeon Lore
    { 0.6787497401, 0.4772802889, 11, 8, 174, ld = { 5, } }, -- Where Magical Paths Meet
    { 0.671889, 0.471008, 11, 8, 174, ld = { 5, } },
  },
  [201] = { -- strosmkai_base
    -- Dwemer
    { 0.403, 0.509, 12, 11 }, -- Guylaine's Dwemer Architecture
  },

  -- grahtwood
  [9] = { -- grahtwood_base
    -- Grahtwood Lore
    { 0.430, 0.749, 26, 1 }, -- Varieties of Faith: The Khajiit
    { 0.406, 0.758, 26, 1 },
    { 0.383, 0.780, 26, 1 },
    { 0.417, 0.766, 26, 1 },
    { 0.384, 0.676, 26, 2 }, -- Varieties of Faith: The Wood Elves
    { 0.485, 0.617, 26, 2 },
    { 0.491, 0.560, 26, 2 },
    { 0.415, 0.656, 26, 2 },
    { 0.537, 0.682, 26, 3 }, -- The Book of the Great Tree
    { 0.501, 0.703, 26, 3 },
    { 0.4536, 0.6902, 26, 3 },
    { 0.5330, 0.6404, 26, 3 },
    { 0.646, 0.743, 26, 4 }, -- Common Arms of Valenwood
    { 0.564, 0.714, 26, 4 },
    { 0.588, 0.745, 26, 4 },
    { 0.650, 0.712, 26, 4 },
    { 0.549, 0.791, 26, 5 }, -- War Customs of the Tribal Bosmer
    { 0.512, 0.752, 26, 5 },
    { 0.456, 0.780, 26, 5 },
    { 0.491, 0.810, 26, 5 },
    { 0.664, 0.665, 26, 6 }, -- The Devouring of Gil-Var-Delle
    { 0.648, 0.589, 26, 6 },
    { 0.615, 0.639, 26, 6 },
    { 0.660, 0.645, 26, 6 },
    { 0.852, 0.568, 26, 7, ld = { 4, } }, -- Ayleid Survivals in Valenwood
    { 0.772, 0.521, 26, 7 },
    { 0.7146, 0.5597, 26, 7 },
    { 0.7432, 0.5659, 26, 7 },
    { 0.778, 0.504, 26, 8 }, -- Aurbic Enigma 4: The Elden Tree
    { 0.767, 0.602, 26, 8 },
    { 0.840, 0.632, 26, 8 },
    { 0.728, 0.602, 26, 8 },
    { 0.7412, 0.679, 26, 9, ld = { 1, } }, -- The Legend of Vastarie
    { 0.720, 0.728, 26, 9, ld = { 1, } },
    { 0.694, 0.748, 26, 9, ld = { 1, } },
    { 0.7084, 0.6689, 26, 9, ld = { 1, } },
    { 0.835, 0.765, 26, 10, ld = { 1, } }, -- In the Company of Wood Orcs
    { 0.829, 0.715, 26, 10, ld = { 1, } },
    { 0.7641, 0.7, 26, 10, ld = { 1, } },
    { 0.7529, 0.7466, 26, 10, ld = { 1, } },
    -- Daedric Princes
    { 0.562, 0.171, 8, 3 }, -- The Dreamstride
    { 0.596, 0.207, 8, 3 },
    { 0.6, 0.1775, 8, 3 },
    { 0.5811, 0.1869, 8, 3 },
    { 0.565, 0.261, 8, 4 }, -- The House of Troubles
    { 0.519, 0.271, 8, 4 },
    { 0.536, 0.233, 8, 4 },
    { 0.596, 0.2748, 8, 4 },
    -- Divines and Deities
    { 0.460, 0.530, 10, 4 }, -- Monomyth: Lorkhan and Satakal
    { 0.426, 0.580, 10, 4 },
    { 0.418, 0.517, 10, 4 },
    { 0.38, 0.5867, 10, 4 },
    { 0.323, 0.608, 10, 5 }, -- Monomyth: "Shezarr's Song"
    { 0.318, 0.626, 10, 5 },
    { 0.246, 0.598, 10, 5 },
    { 0.295, 0.560, 10, 5 },
    { 0.349, 0.549, 10, 6 }, -- Monomyth: The Myth of Aurbis
    { 0.303, 0.525, 10, 6 },
    { 0.300, 0.433, 10, 6 },
    { 0.301, 0.448, 10, 6 },
    -- Dwemer
    { 0.407, 0.466, 12, 4 }, -- Ancient Scrolls of the Dwemer V
    { 0.377, 0.512, 12, 4 },
    { 0.368, 0.433, 12, 4 },
    { 0.390, 0.425, 12, 4 },
    { 0.447, 0.428, 12, 5 }, -- Ancient Scrolls of the Dwemer VI
    { 0.456, 0.488, 12, 5 },
    { 0.478, 0.462, 12, 5 },
    { 0.445, 0.366, 12, 5 },
    { 0.354, 0.370, 12, 6 }, -- Ancient Scrolls of the Dwemer X
    { 0.373, 0.344, 12, 6 },
    { 0.3896, 0.2984, 12, 6 },
    { 0.431, 0.327, 12, 6 },
    -- Magic and Magica
    { 0.619, 0.550, 15, 1, ld = { 1, } }, -- Arcana Restored
    { 0.6149, 0.494, 15, 1 },
    { 0.5247, 0.4824, 15, 1 },
    { 0.5537, 0.4417, 15, 1 },
    { 0.510, 0.548, 15, 2, ld = { 1, } }, -- Liminal Bridges
    { 0.579, 0.532, 15, 2, ld = { 1, } },
    { 0.550, 0.566, 15, 2, ld = { 1, } },
    { 0.5925, 0.5856, 15, 2, ld = { 1, } },
    { 0.777, 0.485, 15, 3 }, -- Magic from the Sky
    { 0.701, 0.438, 15, 3 },
    { 0.757, 0.424, 15, 3 },
    { 0.698, 0.490, 15, 3 },
    { 0.680, 0.412, 15, 4 }, -- Manual of Spellcraft
    { 0.723, 0.372, 15, 4 },
    { 0.647, 0.387, 15, 4 },
    { 0.6968, 0.3546, 15, 4 },
    { 0.543, 0.381, 15, 5 }, -- The Old Ways
    { 0.585, 0.411, 15, 5 },
    { 0.577, 0.354, 15, 5 },
    { 0.5636, 0.3188, 15, 5 },
    { 0.507, 0.379, 15, 6 }, -- On the Detachment of the Sheath
    { 0.428, 0.294, 15, 6 },
    { 0.499, 0.299, 15, 6 },
    { 0.483, 0.358, 15, 6 },
    { 0.642, 0.334, 15, 7 }, -- Reality and Other Falsehoods
    { 0.654, 0.309, 15, 7 },
    { 0.608, 0.321, 15, 7 },
    { 0.6566, 0.2841, 15, 7 },
    { 0.474, 0.187, 15, 8 }, -- Guild Memo on Soul Trapping
    { 0.459, 0.268, 15, 8 },
    { 0.494, 0.234, 15, 8 },
    { 0.429, 0.230, 15, 8 },
    -- Myths of the Mundus
    { 0.380, 0.393, 16, 1 }, -- Before the Ages of Man: Dawn Era
    { 0.322, 0.404, 16, 1 },
    { 0.287, 0.334, 16, 1 },
    { 0.3408, 0.34, 16, 1 },
    { 0.268, 0.311, 16, 2 }, -- Before the Ages of Man: Merethic Er
    { 0.280, 0.226, 16, 2 },
    { 0.288, 0.257, 16, 2 },
    { 0.2078, 0.2211, 16, 2 },
    { 0.238, 0.130, 16, 3 }, -- Ebony Blade History
    { 0.335, 0.156, 16, 3, ld = { 1, } },
    { 0.278, 0.161, 16, 3, ld = { 1, } },
    { 0.284, 0.159, 16, 3, ld = { 1, } },
    { 0.340, 0.267, 16, 4 }, -- Noxiphilic Sanguivoria
    { 0.395, 0.269, 16, 4 },
    { 0.349, 0.230, 16, 4 },
    { 0.327, 0.234, 16, 4 },
    { 0.195, 0.157, 16, 5 }, -- A Werewolf's Confession
    { 0.194, 0.205, 16, 5 },
    { 0.224, 0.225, 16, 5 },
    { 0.256, 0.203, 16, 5 },
    -- Dungeon Lore
    { 0.526, 0.484, 11, 5, 28, ld = { 9999, } }, -- Civility and Etiquette: Wood Orcs I
  },
  [445] = { -- eldenrootgroundfloor_base
    -- Magic and Magica
    { 0.745, 0.733, 15, 1 }, -- Arcana Restored
    { 0.730, 0.484, 15, 1 },
    { 0.566, 0.655, 15, 2 }, -- Liminal Bridges
    { 0.440, 0.808, 15, 2 },
    { 0.6272, 0.8960, 15, 2 },
  },
  [512] = { -- haven_base
    -- Grahtwood Lore
    { 0.398, 0.252, 26, 9 }, -- The Legend of Vastarie
    { 0.235, 0.205, 26, 9 },
    { 0.294, 0.496, 26, 9 },
    { 0.170, 0.600, 26, 9 },
    { 0.829, 0.425, 26, 10 }, -- In the Company of Wood Orcs
    { 0.857, 0.675, 26, 10 },
    { 0.453, 0.586, 26, 10 },
    { 0.514, 0.355, 26, 10 },
  },
  [536] = { -- redfurtradingpost_base
    -- Myths of the Mundus
    { 0.778, 0.392, 16, 3 }, -- Ebony Blade History
    { 0.229, 0.439, 16, 3 },
    { 0.279, 0.419, 16, 3 },
  },
  [749] = { -- sacredleapgrotto_base
    -- Grahtwood Lore
    { 0.698, 0.528, 26, 7 }, -- Ayleid Survivals in Valenwood
  },
  [28] = { -- eldenhollow_base
    -- Dungeon Lore
    { 0.7873833776, 0.6233451962, 11, 5, 28, ld = { 5, } }, -- Civility and Etiquette: Wood Orcs I
  },

  -- greenshade
  [300] = { -- greenshade_base
    -- Greenshade Lore
    { 0.459, 0.299, 27, 1 }, -- Words of Clan Mother Ahnissi, Pt. 1
    { 0.432, 0.345, 27, 1 },
    { 0.403, 0.298, 27, 1 },
    { 0.4245, 0.3268, 27, 1 },
    { 0.553, 0.711, 27, 2 }, -- Words of Clan Mother Ahnissi, Pt. 2
    { 0.576, 0.653, 27, 2 },
    { 0.591, 0.635, 27, 2 },
    { 0.527, 0.717, 27, 2 },
    { 0.444, 0.727, 27, 3 }, -- The Ooze: A Fable
    { 0.479, 0.760, 27, 3 },
    { 0.510, 0.688, 27, 3 },
    { 0.4573, 0.6663, 27, 3 },
    { 0.505, 0.782, 27, 4 }, -- The Wilderking Legend
    { 0.492, 0.864, 27, 4 },
    { 0.457, 0.783, 27, 4 },
    { 0.448, 0.851, 27, 4 },
    { 0.625, 0.790, 27, 5 }, -- Visions of the Green Pact Bosmer
    { 0.611, 0.754, 27, 5 },
    { 0.6411, 0.8341, 27, 5 },
    { 0.5724, 0.8021, 27, 5 },
    { 0.363, 0.525, 27, 6 }, -- Woodhearth: A Pocket Guide
    { 0.313, 0.547, 27, 6 },
    { 0.295, 0.495, 27, 6 },
    { 0.338, 0.474, 27, 6 },
    { 0.384, 0.565, 27, 7 }, -- The Eldest: A Pilgrim's Tale
    { 0.359, 0.460, 27, 7 },
    { 0.413, 0.460, 27, 7 },
    { 0.3998, 0.5087, 27, 7 },
    { 0.251, 0.383, 27, 8 }, -- The Green Pact and the Dominion
    { 0.228, 0.298, 27, 8 },
    { 0.313, 0.381, 27, 8 },
    { 0.302, 0.356, 27, 8 },
    { 0.549, 0.446, 27, 9 }, -- Gifts of the Nereids
    { 0.481, 0.482, 27, 9 },
    { 0.481, 0.497, 27, 9, ld = { 2, } },
    { 0.5223, 0.4980, 27, 9 },
    { 0.569, 0.327, 27, 10 }, -- The Wood Elf Gourmet, Ch. 1
    { 0.605, 0.313, 27, 10 },
    { 0.535, 0.300, 27, 10 },
    { 0.589, 0.349, 27, 10 },
    -- Daedric Princes
    { 0.317, 0.803, 8, 5 }, -- Invocation of Azura
    { 0.258, 0.856, 8, 5 },
    { 0.376, 0.775, 8, 5 },
    { 0.353, 0.843, 8, 5 },
    { 0.485, 0.355, 8, 6 }, -- Modern Heretics
    { 0.471, 0.402, 8, 6 },
    { 0.526, 0.374, 8, 6 },
    { 0.556, 0.364, 8, 6 },
    -- Divines and Deities
    { 0.665, 0.510, 10, 7, ld = { 1, } }, -- Monomyth: The Heart of the World
    { 0.665, 0.546, 10, 7, ld = { 1, } },
    { 0.714, 0.555, 10, 7, ld = { 1, } },
    { 0.740, 0.508, 10, 7, ld = { 1, } },
    { 0.367, 0.297, 10, 8 }, -- Nine Commands of the Eight Divines
    { 0.332, 0.326, 10, 8 },
    { 0.293, 0.273, 10, 8 },
    { 0.377, 0.372, 10, 8 },
    { 0.705, 0.767, 10, 9 }, -- Gods and Worship In Tamriel
    { 0.770, 0.814, 10, 9 },
    { 0.752, 0.723, 10, 9 },
    { 0.766, 0.779, 10, 9 },
    { 0.717, 0.381, 10, 10 }, -- Vivec and Mephala
    { 0.644, 0.374, 10, 10 },
    { 0.637, 0.415, 10, 10 },
    { 0.682, 0.322, 10, 10 },
    -- Dwemer
    { 0.786, 0.675, 12, 7 }, -- Ancient Scrolls of the Dwemer XI
    { 0.748, 0.627, 12, 7 },
    { 0.692, 0.677, 12, 7 },
    { 0.727, 0.698, 12, 7 },
    { 0.343, 0.189, 12, 8 }, -- Antecedents of Dwemer Law
    { 0.308, 0.148, 12, 8 },
    { 0.260, 0.144, 12, 8 },
    { 0.361, 0.143, 12, 8 },
    { 0.656, 0.723, 12, 9 }, -- Dwarven Automatons
    { 0.605, 0.703, 12, 9 },
    { 0.648, 0.767, 12, 9 },
    { 0.618, 0.672, 12, 9 },
    -- Myths of the Mundus
    { 0.360, 0.568, 16, 6 }, -- The Firmament
    { 0.299, 0.571, 16, 6 },
    { 0.336, 0.675, 16, 6 },
    { 0.257, 0.669, 16, 7, ld = { 1, } }, -- The Pig Children
    { 0.240, 0.593, 16, 7, ld = { 1, } },
    { 0.253, 0.635, 16, 7, ld = { 1, } },
    { 0.217, 0.6631, 16, 7, ld = { 1, } },
    { 0.119, 0.524, 16, 8 }, -- Ruminations on the Elder Scrolls
    { 0.232, 0.549, 16, 8 },
    { 0.197, 0.585, 16, 8, ld = { 1, } },
    { 0.150, 0.548, 16, 8 },
    { 0.092, 0.618, 16, 9, ld = { 1, } }, -- Sithis
    { 0.158, 0.598, 16, 9, ld = { 1, } },
    { 0.167, 0.698, 16, 9, ld = { 1, } },
    -- Oblivion Lore
    { 0.261, 0.774, 17, 1 }, -- The Book of Daedra
    { 0.198, 0.755, 17, 1 },
    { 0.230, 0.776, 17, 1 },
    { 0.2144, 0.7184, 17, 1, ld = { 1, } },
    { 0.283, 0.747, 17, 2 }, -- Darkest Darkness
    { 0.2825, 0.6995, 17, 2 },
    { 0.294, 0.721, 17, 2 },
    { 0.349, 0.703, 17, 2 },
    { 0.451, 0.285, 17, 3 }, -- The Doors of Oblivion, Part 1
    { 0.502, 0.254, 17, 3 },
    { 0.451, 0.227, 17, 3 },
    { 0.471, 0.2248, 17, 3 },
    { 0.609, 0.879, 17, 4 }, -- The Doors of Oblivion, Part 2
    { 0.618, 0.912, 17, 4 },
    { 0.650, 0.890, 17, 4 },
    { 0.523, 0.903, 17, 4 },
    { 0.750, 0.846, 17, 5 }, -- On Oblivion
    { 0.728, 0.843, 17, 5 },
    { 0.686, 0.880, 17, 5 },
    { 0.6842, 0.8044, 17, 5, ld = { 4, } },
    { 0.348, 0.262, 17, 6 }, -- Spirit of the Daedra
    { 0.378, 0.273, 17, 6 },
    { 0.274, 0.272, 17, 6 },
    { 0.416, 0.216, 17, 6 },
    { 0.402, 0.737, 17, 7 }, -- Varieties of Daedra, Part 1
    { 0.405, 0.628, 17, 7 },
    { 0.378, 0.708, 17, 7 },
    { 0.397, 0.607, 17, 7 },
    { 0.335, 0.237, 17, 8 }, -- Varieties of Daedra, Part 2
    { 0.309, 0.241, 17, 8 },
    { 0.301, 0.195, 17, 8 },
    { 0.3407, 0.2105, 17, 8 },
    -- Dungeon Lore
    { 0.658, 0.300, 11, 12, 326, ld = { 9999, } }, -- Burning Vestige, Vol. I
  },
  [568] = { -- falinesticave_base
    -- Greenshade Lore
    { 0.398, 0.759, 27, 9 }, -- Gifts of the Nereids
  },
  [378] = { -- marbruk_base
    -- Divines and Deities
    { 0.245, 0.368, 10, 7 }, -- Monomyth: The Heart of the World
    { 0.245, 0.607, 10, 7 },
    { 0.565, 0.660, 10, 7 },
    { 0.734, 0.355, 10, 7 },
  },
  [529] = { -- woodhearth_base
    -- Myths of the Mundus
    { 0.795, 0.336, 16, 7 }, -- The Pig Children		-- bug #212, #293, #302
    { 0.841, 0.498, 16, 7 },
    { 0.860, 0.624, 16, 7 },
    { 0.629, 0.305, 16, 8 }, -- Ruminations on the Elder Scrolls
    { 0.229, 0.431, 16, 9 }, -- Sithis
    { 0.477, 0.357, 16, 9 },
    { 0.514, 0.737, 16, 9 }, -- comment on Nexus Mods
    -- Oblivion Lore
    { 0.692, 0.815, 17, 1 },
  },
  [592] = { -- shroudedhollowcenter_base
    -- Oblivion Lore
    { 0.6088, 0.8202, 17, 5 }, -- On Oblivion
  },
  [326] = { -- cityofashmain_base
    -- Dungeon Lore
    { 0.275009, 0.442950, 11, 12, 326, ld = { 5, } }, -- Burning Vestige, Vol. I
  },

  -- malabaltor
  [22] = { -- malabaltor_base
    -- Malabal Tor Lore
    { 0.728897, 0.493266, 21, 1 }, -- The Voice of the People
    { 0.748, 0.411, 21, 1 },
    { 0.708, 0.492, 21, 1, ld = { 2, } },
    { 0.758, 0.450, 21, 1 },
    { 0.200, 0.466, 21, 2 }, -- The Woodsmer
    { 0.208, 0.535, 21, 2 },
    { 0.2025, 0.4773, 21, 2 },
    { 0.1482, 0.5434, 21, 2 },
    { 0.783, 0.524, 21, 3 }, -- Green Lady, My Lady
    { 0.828, 0.493, 21, 3 },
    { 0.804, 0.3499, 21, 3, ld = { 1, } },
    { 0.843, 0.477, 21, 3, ld = { 2, } },
    { 0.231571, 0.489120, 21, 4 }, -- Valenwood: A Study
    { 0.216, 0.461, 21, 4 },
    { 0.236, 0.472, 21, 4 },
    { 0.2432, 0.4694, 21, 4 },
    { 0.57, 0.50, 21, 5, ld = { 1, } }, -- The Humor of Wood Elves
    { 0.602, 0.528, 21, 5 },
    { 0.5354, 0.5123, 21, 5 },
    { 0.5908, 0.5271, 21, 5 },
    { 0.231, 0.401, 21, 6 }, -- Pirates of the Abecean
    { 0.349, 0.412, 21, 6 },
    { 0.395, 0.397, 21, 6 },
    { 0.808, 0.233, 21, 7 }, -- The Wedding Feast: A Memoir
    { 0.804, 0.170, 21, 7 },
    { 0.7296, 0.2189, 21, 7 },
    { 0.471, 0.706, 21, 8 }, -- A Nereid Stole My Husband
    { 0.422, 0.657, 21, 8, ld = { 4, } },
    { 0.473, 0.563, 21, 8, ld = { 2, } },
    { 0.5359, 0.6413, 21, 8 },
    { 0.596028, 0.650186, 21, 9 }, -- The Red Paint
    { 0.602, 0.727, 21, 9 },
    { 0.573, 0.703, 21, 9 },
    { 0.614, 0.767, 21, 9 },
    { 0.493, 0.420, 21, 10 }, -- Ayleid Cities of Valenwood
    { 0.480948, 0.434498, 21, 10 },
    { 0.501, 0.398, 21, 10 },
    { 0.513, 0.430, 21, 10 },
    -- Daedric Princes
    { 0.335, 0.599, 8, 7 }, -- Opusculus Lamae Bal ta Mezzamortie
    { 0.367, 0.596, 8, 7 },
    { 0.376, 0.595, 8, 7 },
    { 0.435, 0.588, 8, 7 },
    { 0.642, 0.234, 8, 8 }, -- The Totems of Hircine
    { 0.616, 0.242, 8, 8 },
    { 0.661, 0.225, 8, 8 },
    { 0.680, 0.176, 8, 8 },
    -- Dwemer
    { 0.381, 0.623, 12, 10 }, -- Ancient Scrolls of the Dwemer I-B
    { 0.424, 0.644, 12, 10 },
    { 0.413, 0.656, 12, 10, ld = { 4, } },
    { 0.644, 0.312, 12, 11 }, -- Guylaine's Dwemer Architecture
    { 0.669, 0.328, 12, 11 },
    { 0.7147, 0.383, 12, 11 },
    { 0.7133, 0.3725, 12, 11 },
    { 0.477, 0.368, 12, 12 }, -- Ancient Scrolls of the Dwemer VIII
    { 0.479, 0.326, 12, 12 },
    { 0.537, 0.3191, 12, 12 },
    { 0.4339, 0.352, 12, 12 },
    -- Legends of Nirn
    { 0.186, 0.573, 13, 1 }, -- An Accounting of the Elder Scrolls
    { 0.192, 0.589, 13, 1 },
    { 0.218, 0.587, 13, 1 },
    { 0.197, 0.605, 13, 1 },
    { 0.722, 0.303, 13, 2 }, -- The Adabal-a
    { 0.773, 0.326, 13, 2 },
    { 0.751, 0.274, 13, 2 },
    { 0.788, 0.298, 13, 2, ld = { 2, } },
    { 0.5402, 0.4381, 13, 3, ld = { 1, } }, -- The Amulet of Kings
    { 0.581, 0.465, 13, 3 },
    { 0.611, 0.367, 13, 3 },
    { 0.600, 0.395, 13, 3 },
    { 0.283, 0.622, 13, 4 }, -- The Cleansing of the Fane
    { 0.313, 0.602, 13, 4 },
    { 0.292, 0.545, 13, 4 },
    { 0.306, 0.6063, 13, 4 },
    { 0.712, 0.657, 13, 5 }, -- The Exclusionary Mandates
    { 0.658, 0.619, 13, 5 },
    { 0.686, 0.595, 13, 5 },
    { 0.679, 0.648, 13, 5 },
    { 0.674, 0.833, 13, 6 }, -- The Last King of the Ayleids
    { 0.667, 0.821, 13, 6 },
    { 0.627, 0.870, 13, 6 },
    { 0.625, 0.827, 13, 6 },
    { 0.236, 0.543, 13, 7 }, -- The Order of the Ancestor Moth
    { 0.2633, 0.5527, 13, 7 },
    { 0.2691, 0.5002, 13, 7 },
    { 0.578, 0.734, 13, 8 }, -- Tamrielic Artifacts, Part One
    { 0.502, 0.736, 13, 8 },
    { 0.580, 0.793, 13, 8 },
    { 0.5345, 0.7578, 13, 8 },
    { 0.643, 0.386, 13, 9 }, -- Tamrielic Artifacts, Part Two
    { 0.643, 0.444, 13, 9 },
    { 0.646, 0.455, 13, 9 },
    { 0.667, 0.414, 13, 9 },
    { 0.8371, 0.2952, 13, 10, ld = { 1, } }, -- Tamrielic Artifacts, Part Three
    { 0.847, 0.257, 13, 10 },
    { 0.708, 0.492, 13, 10, ld = { 2, } },
    -- Poetry and Song
    { 0.639, 0.719, 18, 1 }, -- The Battle of Glenumbria Moors
    { 0.651, 0.714, 18, 1 },
    { 0.647, 0.766, 18, 1 },
    { 0.664, 0.789, 18, 1 },
    { 0.638, 0.505, 18, 2 }, -- The Book of Dawn and Dusk
    { 0.563, 0.605, 18, 2, ld = { 4, } },
    { 0.582, 0.624, 18, 2 },
    { 0.5798, 0.5650, 18, 2 },
    { 0.375, 0.508, 18, 3 }, -- The Cantatas of Vivec
    { 0.358, 0.555, 18, 3 },
    { 0.428, 0.520, 18, 3 },
    { 0.381, 0.458, 18, 3 },
    { 0.643, 0.335, 18, 4 }, -- The Five Far Stars
    { 0.648, 0.280, 18, 4 },
    { 0.6054, 0.2945, 18, 4 },
    { 0.6007, 0.2925, 18, 4 },
    { 0.1803, 0.4861, 18, 5, ld = { 1, } }, -- Flesh to Cut from Bone
    { 0.15, 0.42, 18, 5, ld = { 1, } },
    { 0.8418, 0.3289, 18, 5, ld = { 1, } },
    { 0.0915, 0.4302, 18, 5, ld = { 1, } },
    { 0.1701, 0.4491, 18, 5, ld = { 1, } },
    { 0.775, 0.576, 18, 6 }, -- Ode to the Tundrastriders
    { 0.728, 0.752, 18, 6 },
    { 0.794, 0.571, 18, 6 },
    { 0.755, 0.748, 18, 6 },
    -- Dungeon Lore
    { 0.460, 0.330, 11, 14, 292, ld = { 9999, } }, -- Tempest Island Briefing
  },
  [282] = { -- baandaritradingpost_base
    -- Malabal Toe Lore
    { 0.300, 0.613, 21, 3 }, -- Green Lady, My Lady
    -- Legends of Nirn
    { 0.097, 0.451, 13, 2 }, -- The Adabal-a
    { 0.532, 0.242, 13, 10 }, -- Tamrielic Artifacts, Part Three
    -- Poetry and Song
    { 0.565, 0.470, 18, 5 }, -- Flesh to Cut from Bone
  },
  [262] = { -- hoarvorpit_base
    -- Malabal Tore Lore
    { 0.454, 0.434, 21, 8 }, -- A Nereid Stole My Husband
  },
  [222] = { -- deadmansdrop_base
    -- Malabal Toe Lore
    { 0.517, 0.399, 21, 6 }, -- Pirates of the Abecean
  },
  [534] = { -- vulkwasten_base
    -- Malabal Tor Lore
    { 0.607276, 0.587338, 21, 5 }, -- The Humor of Wood Elves,495
    { 0.409, 0.669, 21, 5 },
    -- Legends of Nirn
    { 0.437, 0.212, 13, 3 }, -- The Amulet of Kings
    { 0.694, 0.378, 13, 3 },
  },
  [273] = { -- ouze_base
    { 0.274, 0.471, 21, 3 }, -- Green Lady, My Lady
  },
  [267] = { -- rootsofsilvenar_base
    -- Malabal Tor Lore
    { 0.260, 0.447, 21, 1 }, -- The Voice of the People
    -- Legends of Nirn
    { 0.249, 0.644, 13, 10 }, -- Tamrielic Artifacts, Part Three
  },
  [275] = { -- velynharbor_base
    -- Malabal Tor Lore
    { 0.880, 0.603, 21, 2 }, -- The Woodsmer
    { 0.843, 0.309, 21, 2 },
    -- Poetry and Song
    { 0.760, 0.395, 18, 5 }, -- Flesh to Cut from Bone
    { 0.637, 0.106, 18, 5 },
    { 0.373, 0.150, 18, 5 },
  },
  [199] = { -- blackvineruins_base
    -- Legends of Nirn
    { 0.154, 0.484, 13, 2 }, -- The Adabal-a
  },
  [292] = { -- tempestisland_base
    -- Dungeon Lore
    { 0.4463876784, 0.3658108711, 11, 4, 292, ld = { 5, } }, -- War Weather
    { 0.3651288450, 0.8106396198, 11, 14, 292, ld = { 5, } }, -- Tempest Island Briefing
  },

  -- reapersmarch
  [256] = { -- reapersmarch_base
    -- Reaper's March Lore
    { 0.460, 0.107, 28, 1 }, -- The Moon Cats and their Dance
    { 0.562, 0.738, 28, 1 },
    { 0.550, 0.685, 28, 1 },
    { 0.512, 0.648, 28, 1 },
    { 0.5096, 0.7466, 28, 1 },
    { 0.737, 0.151, 28, 2 }, -- Litter-Mates of Darkness
    { 0.710, 0.202, 28, 2 },
    { 0.768, 0.187, 28, 2 },
    { 0.6761, 0.1956, 28, 2 },
    { 0.690, 0.237, 28, 3 }, -- Yours for the Taking!
    { 0.723, 0.251, 28, 3 },
    { 0.769, 0.216, 28, 3 },
    { 0.760, 0.303, 28, 3 },
    { 0.79, 0.33, 28, 4, ld = { 1, } }, -- A Looter's Paradise
    { 0.778, 0.405, 28, 4, ld = { 1, } },
    { 0.7258, 0.3918, 28, 4, ld = { 1, } },
    { 0.7646, 0.3429, 28, 4, ld = { 1, } },
    { 0.639, 0.286, 28, 5 }, -- The Eagle and the Cat
    { 0.601, 0.234, 28, 5 },
    { 0.590, 0.357, 28, 5 },
    { 0.5759, 0.3119, 28, 5 },
    { 0.73, 0.33, 28, 6, ld = { 1, } }, -- Elven Eyes, Elven Spies
    { 0.69, 0.35, 28, 6 },
    { 0.725, 0.283, 28, 6 },
    { 0.691, 0.313, 28, 6 },
    { 0.569, 0.408, 28, 7 }, -- Moon-Sugar for Glossy Fur? Yes!
    { 0.520, 0.444, 28, 7 },
    { 0.5381, 0.3472, 28, 7 },
    { 0.5324, 0.3694, 28, 7 },
    { 0.572, 0.382, 28, 8 }, -- Master Zoaraym's Tale, Part 1
    { 0.624, 0.397, 28, 8 },
    { 0.651, 0.388, 28, 8 },
    { 0.49, 0.48, 28, 9 }, -- Master Zoaraym's Tale, Part 2
    { 0.537, 0.452, 28, 9 },
    { 0.546, 0.506, 28, 9 },
    { 0.472, 0.457, 28, 9 },
    { 0.590, 0.499, 28, 10 }, -- Cohort Briefing: Arenthia
    { 0.610, 0.543, 28, 10 },
    { 0.577, 0.605, 28, 10 },
    { 0.584, 0.548, 28, 10 },
    -- Dwemer
    { 0.412, 0.247, 12, 13 }, -- Dwemer Inquiries Volume I
    { 0.407, 0.191, 12, 13 },
    { 0.373, 0.276, 12, 13 },
    { 0.3810, 0.313, 12, 13 },
    { 0.463, 0.274, 12, 14 }, -- Dwemer Inquiries Volume II
    { 0.539, 0.274, 12, 14 },
    { 0.509, 0.307, 12, 14 },
    { 0.5235, 0.2273, 12, 14 },
    { 0.443, 0.388, 12, 15 }, -- Dwemer Inquiries Volume III
    { 0.410, 0.422, 12, 15 },
    { 0.391, 0.371, 12, 15 },
    { 0.460, 0.335, 12, 15 },
    { 0.217, 0.422, 12, 16 }, -- Ancient Scrolls of the Dwemer IV
    { 0.220, 0.400, 12, 16 },
    { 0.152, 0.426, 12, 16 },
    { 0.2372, 0.3707, 12, 16 },
    -- Literature
    { 0.285, 0.449, 14, 1 }, -- The Homilies of Blessed Almalexia
    { 0.369, 0.445, 14, 1 },
    { 0.324, 0.427, 14, 1 },
    { 0.283, 0.353, 14, 1 },
    { 0.276, 0.482, 14, 2 }, -- The Legendary Scourge
    { 0.300, 0.546, 14, 2 },
    { 0.349, 0.493, 14, 2 },
    { 0.281, 0.522, 14, 2 },
    { 0.282, 0.623, 14, 3 }, -- The Lusty Argonian Maid, Volume 1
    { 0.252, 0.558, 14, 3 },
    { 0.314, 0.592, 14, 3 },
    { 0.2536, 0.6002, 14, 3 },
    { 0.267, 0.653, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
    { 0.240, 0.660, 14, 4 },
    { 0.241, 0.743, 14, 4 },
    { 0.266, 0.713, 14, 4 },
    { 0.305, 0.807, 14, 5 }, -- Myths of Sheogorath, Volume 1
    { 0.230, 0.793, 14, 5 },
    { 0.306, 0.874, 14, 5 },
    { 0.262, 0.850, 14, 5 },
    { 0.329, 0.725, 14, 6 }, -- Myths of Sheogorath, Volume 2
    { 0.373, 0.800, 14, 6 },
    { 0.295, 0.736, 14, 6 },
    { 0.356, 0.762, 14, 6 },
    { 0.468, 0.564, 14, 7, ld = { 1, } }, -- The Red Book of Riddles
    { 0.462, 0.494, 14, 7 },
    { 0.469, 0.5268, 14, 7 },
    { 0.3915, 0.5767, 14, 7 },
    { 0.446, 0.618, 14, 8 }, -- 16 Accords of Madness, Vol. VI
    { 0.464, 0.655, 14, 8 },
    { 0.415, 0.645, 14, 8 },
    { 0.457, 0.6887, 14, 8 },
    { 0.390, 0.664, 14, 9 }, -- Crow and Raven: Three Short Fables
    { 0.331, 0.689, 14, 9 },
    { 0.343, 0.607, 14, 9 },
    { 0.316, 0.660, 14, 9 },
    { 0.426, 0.789, 14, 10 }, -- Wabbajack
    { 0.385, 0.734, 14, 10 },
    { 0.485, 0.771, 14, 10 },
    { 0.442, 0.725, 14, 10 },
    -- Poetry and Song
    { 0.320, 0.128, 18, 7 }, -- Proper-Life: Three Chants
    { 0.336, 0.206, 18, 7 },
    { 0.284, 0.261, 18, 7 },
    { 0.2441, 0.1619, 18, 7 },
    { 0.466, 0.129, 18, 8 }, -- Song of the Askelde Men
    { 0.481, 0.210, 18, 8 },
    { 0.5064, 0.1741, 18, 8, ld = { 1, } },
    { 0.4054, 0.1284, 18, 8 },
    { 0.5577, 0.1901, 18, 9, ld = { 1, } }, -- The Warrior's Charge
    { 0.56, 0.16, 18, 9, ld = { 1, } },
    { 0.278, 0.343, 18, 10 }, -- Words of the Wind
    { 0.331, 0.330, 18, 10 },
    { 0.235, 0.341, 18, 10 },
    { 0.3285, 0.3591, 18, 10 },
    -- Dungeon Lore
    { 0.206, 0.795, 11, 15, 334, ld = { 9999, } }, -- Soul-Trapping I: An Introduction
  },
  [535] = { -- arenthia_base
    -- Poetry and Song
    { 0.157, 0.700, 18, 8 }, -- Song of the Askelde Men
    { 0.459, 0.643, 18, 9 }, -- The Warrior's Charge
    { 0.429, 0.782, 18, 9 },
  },
  [533] = { -- dune_base
    -- Reaper's March Lore
    { 0.480, 0.104, 28, 3 }, -- Yours for the Taking!
    { 0.645, 0.229, 28, 4 }, -- A Looter's Paradise
    { 0.312, 0.554, 28, 4 },
    { 0.5748, 0.6286, 28, 4 },
    { 0.327, 0.228, 28, 6 }, -- Elven Eyes, Elven Spies
    { 0.126, 0.350, 28, 6 },
  },
  [312] = { -- rawlkha_base
    -- Literature
    { 0.551, 0.611, 14, 7 }, -- The Red Book of Riddles
    { 0.555, 0.323, 14, 7 },
  },
  [334] = { -- selenesweb_base
    -- Dungeon Lore
    { 0.706, 0.916, 11, 15, 334, ld = { 5, } }, -- Soul-Trapping I: An Introduction
  },

  -- rivenspire
  [10] = { -- rivenspire_base
    -- Rivenspire Lore
    { 0.184, 0.664, 3, 1 }, -- The Barrows of Westmark Moor
    { 0.183, 0.624, 3, 1 },
    { 0.147, 0.593, 3, 1 },
    { 0.1903, 0.5915, 3, 1 },
    { 0.707, 0.413, 3, 2 }, -- The Story of Princess Eselde
    { 0.678, 0.411, 3, 2 },
    { 0.718, 0.375, 3, 2 },
    { 0.751, 0.382, 3, 2 },
    { 0.726, 0.327, 3, 3 }, -- Bloodfiends of Rivenspire
    { 0.667, 0.332, 3, 3 },
    { 0.682, 0.301, 3, 3 },
    { 0.670, 0.381, 3, 3 },
    { 0.853, 0.308, 3, 4 }, -- The Remnant of Light
    { 0.787, 0.328, 3, 4 },
    { 0.824, 0.355, 3, 4 },
    { 0.826, 0.332, 3, 4 },
    { 0.423169, 0.400568, 3, 5 }, -- The Horse-Folk of Silverhoof
    { 0.387, 0.359, 3, 5 },
    { 0.397, 0.408, 3, 5 },
    { 0.388, 0.442, 3, 5 },
    { 0.472, 0.318, 3, 6 }, -- Dire Legends of the Doomcrag
    { 0.349, 0.317, 3, 6 },
    { 0.400, 0.304, 3, 6 },
    { 0.399, 0.331, 3, 6 },
    { 0.687, 0.258, 3, 7 }, -- House Tamrith: A Recent History
    { 0.656, 0.229, 3, 7 },
    { 0.730, 0.229, 3, 7 },
    { 0.700, 0.215, 3, 7 },
    { 0.727, 0.168, 3, 8, ld = { 1, } }, -- Shornhelm, Crown City of the North
    { 0.687, 0.136, 3, 8 },
    { 0.708, 0.116, 3, 8 },
    { 0.680, 0.175, 3, 8 },
    { 0.826, 0.169, 3, 9, ld = { 1, } }, -- Northpoint: An Assessment
    { 0.760, 0.221, 3, 9, ld = { 1, } },
    { 0.797, 0.194, 3, 9, ld = { 1, } },
    { 0.735, 0.258, 3, 10 }, -- House Ravenwatch Proclamation
    { 0.724, 0.201, 3, 10 },
    { 0.750, 0.152, 3, 10 },
    { 0.810, 0.168, 3, 10 },
    -- Daedric Princes
    { 0.617, 0.686, 8, 5 }, -- Invocation of Azura
    { 0.650, 0.646, 8, 5 },
    { 0.644, 0.679, 8, 5 },
    { 0.600, 0.632, 8, 5 },
    { 0.648, 0.589, 8, 6 }, -- Modern Heretics
    { 0.699, 0.646, 8, 6 },
    { 0.639, 0.629, 8, 6 },
    { 0.695, 0.621, 8, 6 },
    -- Divines and Deities
    { 0.298, 0.634, 10, 7 }, -- Monomyth: The Heart of the World
    { 0.358, 0.690, 10, 7 },
    { 0.367, 0.654, 10, 7 },
    { 0.306, 0.678, 10, 7 },
    { 0.475, 0.676, 10, 8 }, -- Nine Commands of the Eight Divines
    { 0.482, 0.713, 10, 8 },
    { 0.434, 0.689, 10, 8 },
    { 0.418, 0.694, 10, 8 },
    { 0.491, 0.605, 10, 9 }, -- Gods and Worship In Tamriel
    { 0.480, 0.658, 10, 9 },
    { 0.422, 0.635, 10, 9 },
    { 0.4133, 0.6611, 10, 9 },
    { 0.4574, 0.5764, 10, 10 }, -- Vivec and Mephala
    { 0.4038, 0.5917, 10, 10 },
    -- Dwemer
    { 0.40, 0.53, 12, 7, ld = { 1, } }, -- Ancient Scrolls of the Dwemer XI
    { 0.448, 0.5247, 12, 7, ld = { 1, } },
    { 0.3992, 0.5478, 12, 7, ld = { 1, } },
    { 0.4168, 0.5191, 12, 7, ld = { 1, } },
    { 0.572, 0.688, 12, 8 }, -- Antecedents of Dwemer Law
    { 0.526, 0.670, 12, 8 },
    { 0.511, 0.638, 12, 8 },
    { 0.5902, 0.6597, 12, 8 },
    { 0.258, 0.507, 12, 9 }, -- Dwarven Automatons
    { 0.235, 0.564, 12, 9 },
    { 0.201, 0.538, 12, 9 },
    { 0.273, 0.521, 12, 9 },
    -- Myths of the Mundus
    { 0.331, 0.557, 16, 6 }, -- The Firmament
    { 0.310, 0.516, 16, 6 },
    { 0.333, 0.492, 16, 6 },
    { 0.3583, 0.5384, 16, 6 },
    { 0.800, 0.303, 16, 7 }, -- The Pig Children
    { 0.748, 0.310, 16, 7 },
    { 0.754, 0.261, 16, 7, ld = { 1, } },
    { 0.827, 0.262, 16, 7, ld = { 1, } },
    { 0.300, 0.575, 16, 8 }, -- Ruminations on the Elder Scrolls
    { 0.360, 0.625, 16, 8 },
    { 0.339, 0.592, 16, 8 },
    { 0.307, 0.601, 16, 8 },
    { 0.534, 0.584, 16, 9 }, -- Sithis
    { 0.539, 0.615, 16, 9 },
    { 0.584, 0.616, 16, 9 },
    { 0.5555, 0.5843, 16, 9 },
    -- Oblivion Lore
    { 0.504, 0.561, 17, 1 }, -- The Book of Daedra
    { 0.557, 0.553, 17, 1 },
    { 0.506, 0.510, 17, 1 },
    { 0.4922, 0.5194, 17, 1 },
    { 0.366, 0.426, 17, 2 }, -- Darkest Darkness
    { 0.3038, 0.363, 17, 2 },
    { 0.263, 0.651, 17, 3 }, -- The Doors of Oblivion, Part 1
    { 0.252, 0.642, 17, 3 },
    { 0.271, 0.614, 17, 3 },
    { 0.216, 0.611, 17, 3 },
    { 0.579, 0.542, 17, 4 }, -- The Doors of Oblivion, Part 2
    { 0.630, 0.555, 17, 4 },
    { 0.578, 0.570, 17, 4, ld = { 1, } },
    { 0.6156, 0.6, 17, 4, ld = { 1, } },
    { 0.626, 0.514, 17, 5 }, -- On Oblivion
    { 0.600, 0.510, 17, 5 },
    { 0.581, 0.479, 17, 5 },
    { 0.575, 0.494, 17, 5 },
    { 0.687, 0.670, 17, 6 }, -- Spirit of the Daedra
    { 0.689, 0.703, 17, 6 },
    { 0.706, 0.729, 17, 6 },
    { 0.711, 0.698, 17, 6 },
    { 0.633, 0.716, 17, 7 }, -- Varieties of Daedra, Part 1
    { 0.587, 0.740, 17, 7 },
    { 0.599, 0.705, 17, 7 },
    { 0.616, 0.753, 17, 7 },
    { 0.598, 0.452, 17, 8 }, -- Varieties of Daedra, Part 2
    { 0.611, 0.439, 17, 8 },
    { 0.635, 0.474, 17, 8 },
    { 0.6502, 0.423, 17, 8 },
    -- Tamriel History
    { 0.677, 0.466, 19, 2 }, -- Frontier, Conquest
    { 0.700, 0.450, 19, 2 },
    { 0.725, 0.450, 19, 2 },
    { 0.6955, 0.4972, 19, 2 },
    -- Dungeon Lore
    { 0.721, 0.736, 11, 3, 151, ld = { 9999, } }, -- The Thief God's Treasures
  },
  [528] = { -- hoarfrost_base
    -- Oblivion Lore
    { 0.386, 0.385, 17, 4 }, -- The Doors of Oblivion, Part 2
    { 0.400, 0.094, 17, 4 },
    { 0.776, 0.694, 17, 4 },
  },
  [85] = { -- shornhelm_base
    -- Divines and Deities
    { 0.681, 0.633, 10, 10 }, -- Vivec and Mephala
    { 0.339, 0.736, 10, 10 },
    -- Dwemer
    { 0.307, 0.453, 12, 7 }, -- Ancient Scrolls of the Dwemer XI
    { 0.418, 0.271, 12, 7 },
    { 0.627, 0.309, 12, 7 },
    -- Oblivion Lore
    { 0.979, 0.533, 17, 1 }, -- The Book of Daedra
  },
  [513] = { -- northpoint_base
    -- Rivenspire Lore
    { 0.087, 0.604, 3, 7 }, -- House Tamrith: A Recent History
    { 0.072, 0.213, 3, 8 }, -- Shornhelm, Crown City of the North
    { 0.708, 0.226, 3, 9 }, -- Northpoint: An Assessment
    { 0.706412, 0.224542, 3, 9 },
    { 0.277, 0.560, 3, 9 },
    { 0.519, 0.390, 3, 9 },
    { 0.598, 0.602, 3, 9 },
    { 0.597, 0.214, 3, 10 }, -- House Ravenwatch Proclamation
    { 0.213, 0.115, 3, 10 },
    -- Myths of the Mundus
    { 0.243, 0.811, 16, 7 }, -- The Pig Children
  },
  [477] = { -- shroudedpass_base
    -- Oblivion Lore
    { 0.183, 0.263, 17, 2 }, -- Darkest Darkness
  },
  [151] = { -- cryptofhearts_base
    { 0.457, 0.240, 11, 3, 151, ld = { 5, } }, -- The Thief God's Treasures
    { 0.678, 0.181, 11, 3, 151, ld = { 5, } },
  },

  -- shadowfen
  [26] = { -- shadowfen_base
    -- Shadowfen Lore
    { 0.187, 0.748, 6, 1 }, -- Suril's Journal
    { 0.177, 0.805, 6, 1 },
    { 0.149, 0.820, 6, 1 },
    { 0.093, 0.811, 6, 1 },
    { 0.605, 0.385, 6, 2 }, -- The Right Mattock for the Job
    { 0.367, 0.638, 6, 2 },
    { 0.185, 0.826, 6, 2 },
    { 0.2876, 0.7604, 6, 2 },
    { 0.457, 0.836, 6, 3 }, -- Dust's Shadow
    { 0.491, 0.744, 6, 3 },
    { 0.467, 0.775, 6, 3 },
    { 0.521, 0.837, 6, 3 },
    { 0.452, 0.650, 6, 4 }, -- Remember Me
    { 0.445, 0.623, 6, 4 },
    { 0.480, 0.705, 6, 4 },
    { 0.419, 0.687, 6, 4 },
    { 0.302, 0.574, 6, 5 }, -- Fair Argonian Maiden
    { 0.270, 0.609, 6, 5 },
    { 0.166, 0.586, 6, 5 },
    { 0.274, 0.519, 6, 5 },
    { 0.307, 0.497, 6, 6 }, -- A Shallow Pool
    { 0.372, 0.450, 6, 6 },
    { 0.329, 0.523, 6, 6 },
    { 0.3425, 0.4778, 6, 6 },
    { 0.185, 0.658, 6, 7 }, -- Freedom's Price
    { 0.257, 0.695, 6, 7 },
    { 0.193, 0.693, 6, 7 },
    { 0.236, 0.654, 6, 7 },
    { 0.425, 0.562, 6, 8 }, -- A Mother's Nursery Rhyme
    { 0.380, 0.597, 6, 8 },
    { 0.409, 0.494, 6, 8 },
    { 0.3255, 0.5992, 6, 8 },
    { 0.285, 0.676, 6, 9 }, -- The Ruby Necklace
    { 0.384, 0.758, 6, 9 },
    { 0.385, 0.669, 6, 9 },
    { 0.330, 0.676, 6, 9 },
    { 0.529, 0.724, 6, 10 }, -- On the Knahaten Flu
    { 0.553, 0.705, 6, 10 },
    { 0.571, 0.654, 6, 10 },
    { 0.505, 0.659, 6, 10 },
    -- Daedric Princes
    { 0.679, 0.375, 8, 5 }, -- Invocation of Azura
    { 0.665, 0.407, 8, 5 },
    { 0.630, 0.378, 8, 5 },
    { 0.636, 0.429, 8, 5 },
    { 0.605, 0.226, 8, 6 }, -- Modern Heretics
    { 0.527, 0.233, 8, 6 },
    { 0.622, 0.288, 8, 6 },
    { 0.572, 0.265, 8, 6 },
    -- Divines and Deities
    { 0.450, 0.430, 10, 7 }, -- Monomyth: The Heart of the World
    { 0.409, 0.412, 10, 7 },
    { 0.456, 0.377, 10, 7 },
    { 0.4983, 0.4243, 10, 7 },
    { 0.560, 0.327, 10, 8 }, -- Nine Commands of the Eight Divines
    { 0.585, 0.359, 10, 8 },
    { 0.519, 0.394, 10, 8 },
    { 0.5974, 0.3877, 10, 8 },
    { 0.208, 0.356, 10, 9 }, -- Gods and Worship In Tamriel
    { 0.284, 0.294, 10, 9 },
    { 0.288, 0.341, 10, 9 },
    { 0.272, 0.384, 10, 9 },
    { 0.4962, 0.2716, 10, 10, ld = { 1, } }, -- Vivec and Mephala
    { 0.444, 0.258, 10, 10, ld = { 1, } },
    { 0.455, 0.303, 10, 10, ld = { 1, } },
    -- Dwemer
    { 0.352, 0.362, 12, 7 }, -- Ancient Scrolls of the Dwemer XI
    { 0.353, 0.305, 12, 7 },
    { 0.335, 0.404, 12, 7 },
    { 0.312, 0.317, 12, 7 },
    { 0.451, 0.157, 12, 8 }, -- Antecedents of Dwemer Law
    { 0.517, 0.185, 12, 8 },
    { 0.488, 0.208, 12, 8 },
    { 0.457, 0.2156, 12, 8 },
    { 0.362, 0.182, 12, 9 }, -- Dwarven Automatons
    { 0.404, 0.201, 12, 9 },
    { 0.367, 0.225, 12, 9 },
    { 0.305, 0.154, 12, 9 },
    -- Myths of the Mundus
    { 0.271, 0.244, 16, 6 }, -- The Firmament
    { 0.327, 0.255, 16, 6 },
    { 0.247, 0.212, 16, 6 },
    { 0.7862, 0.5967, 16, 6 },
    { 0.553, 0.298, 16, 7 }, -- The Pig Children
    { 0.5103, 0.3017, 16, 7 },
    { 0.5022, 0.3471, 16, 7 },
    { 0.4807, 0.3293, 16, 7 },
    { 0.733, 0.445, 16, 8 }, -- Ruminations on the Elder Scrolls
    { 0.814, 0.421, 16, 8 },
    { 0.836, 0.447, 16, 8 },
    { 0.769, 0.501, 16, 8 },
    { 0.848, 0.512, 16, 9 }, -- Sithis
    { 0.851, 0.595, 16, 9 },
    { 0.786, 0.605, 16, 9 },
    { 0.766, 0.563, 16, 9 },
    -- Oblivion Lore
    { 0.504, 0.519, 17, 1 }, -- The Book of Daedra
    { 0.532, 0.568, 17, 1 },
    { 0.475, 0.543, 17, 1 },
    { 0.691, 0.502, 17, 2 }, -- Darkest Darkness
    { 0.625, 0.529, 17, 2 },
    { 0.6996, 0.5453, 17, 2 },
    { 0.6105, 0.5058, 17, 2 },
    { 0.6662, 0.6514, 17, 3, ld = { 1, } }, -- The Doors of Oblivion, Part 1
    { 0.543, 0.607, 17, 3 },
    { 0.615, 0.623, 17, 3 },
    { 0.699, 0.6047, 17, 3, ld = { 1, } },
    { 0.581, 0.815, 17, 4 }, -- The Doors of Oblivion, Part 2
    { 0.672, 0.861, 17, 4 },
    { 0.656, 0.812, 17, 4 },
    { 0.5942, 0.7634, 17, 4 },
    { 0.703, 0.691, 17, 5 }, -- On Oblivion
    { 0.624, 0.721, 17, 5 },
    { 0.590, 0.705, 17, 5 },
    { 0.6643, 0.7562, 17, 5 },
    { 0.760, 0.775, 17, 6 }, -- Spirit of the Daedra
    { 0.770, 0.671, 17, 6 },
    { 0.793, 0.714, 17, 6 },
    { 0.827, 0.694, 17, 6 },
    { 0.855, 0.777, 17, 7 }, -- Varieties of Daedra, Part 1
    { 0.894, 0.763, 17, 7 },
    { 0.823, 0.783, 17, 7 },
    { 0.780, 0.811, 17, 8 }, -- Varieties of Daedra, Part 2
    { 0.720, 0.817, 17, 8 },
    { 0.807, 0.828, 17, 8 },
    { 0.727, 0.847, 17, 8 },
    -- Dungeon Lore
    { 0.165, 0.584, 11, 11, 141, ld = { 9999, } }, -- Arx Corinium - First Seed Report
  },
  [217] = { -- stormhold_base
    -- Divines and Deities
    { 0.768, 0.490, 10, 10 }, -- Vivec and Mephala
    { 0.441, 0.407, 10, 10 },
    { 0.509, 0.691, 10, 10 },
    -- Dwemer
    { 0.710, 0.084, 12, 8 }, -- Antecedents of Dwemer Law
    { 0.525, 0.138, 12, 8 },
    -- Myths of the Mundus
    { 0.860, 0.678, 16, 7 }, -- The Pig Children
  },
  [544] = { -- altencorimont_base
    -- Oblivion Lore
    { 0.405, 0.821, 17, 3 }, -- The Doors of Oblivion, Part 1
    { 0.570, 0.592, 17, 3 },
    { 0.153, 0.680, 17, 3 },
  },
  [141] = { -- arxcorinium_base
    -- Dungeon Lore
    { 0.1416442841, 0.3164515197, 11, 11, 141, ld = { 5, } }, -- Arx Corinium - First Seed Report
  },

  -- stonefalls
  [7] = { -- stonefalls_base
    -- Stonefalls Lore
    { 0.755, 0.647, 20, 1 }, -- Ancestors and the Dunmer (Abridged)
    { 0.707942, 0.622916, 20, 1 },
    { 0.776, 0.584, 20, 1 },
    { 0.795, 0.620, 20, 1 },
    { 0.777, 0.555, 20, 2 }, -- The Brothers of Strife
    { 0.770, 0.514, 20, 2 },
    { 0.820, 0.512, 20, 2 },
    { 0.348, 0.338, 20, 3 }, -- The Great Houses and Their Uses
    { 0.325, 0.361, 20, 3 },
    { 0.315, 0.406, 20, 3 },
    { 0.2995, 0.374, 20, 3 },
    { 0.229, 0.357, 20, 4 }, -- Argonians Among Us
    { 0.226, 0.378, 20, 4 },
    { 0.169714, 0.406697, 20, 4 },
    { 0.2063, 0.4004, 20, 4 },
    { 0.57, 0.51, 20, 5, ld = { 1, } }, -- Nords of Skyrim
    { 0.5421, 0.5315, 20, 5, ld = { 1, } },
    { 0.5031, 0.4552, 20, 5, ld = { 1, } },
    { 0.5835, 0.5008, 20, 5, ld = { 1, } },
    { 0.5586, 0.4844, 20, 5, ld = { 1, } },
    { 0.354, 0.512, 20, 6 }, -- Mottos of the Dunmeri Great Houses
    { 0.393, 0.468, 20, 6 },
    { 0.282, 0.492, 20, 6 },
    { 0.3165, 0.4344, 20, 6 },
    { 0.284, 0.290, 20, 7 }, -- Varieties of Faith: The Argonians
    { 0.283, 0.262, 20, 7 },
    { 0.245, 0.233, 20, 7 },
    { 0.225, 0.207, 20, 7 },
    { 0.547, 0.699, 20, 8 }, -- Varieties of Faith: The Dark Elves
    { 0.632, 0.693, 20, 8 },
    { 0.651, 0.687, 20, 8 },
    { 0.5897, 0.6778, 20, 8 },
    { 0.166, 0.365, 20, 9 }, -- Varieties of Faith: The Nords
    { 0.192, 0.363, 20, 9 },
    { 0.200, 0.319, 20, 9 },
    { 0.202, 0.293, 20, 9 },
    { 0.146, 0.569, 20, 10 }, -- Guide to the Ebonheart Pact
    { 0.135, 0.605, 20, 10 },
    { 0.182860, 0.583598, 20, 10 },
    { 0.186, 0.593, 20, 10 },
    -- Daedric Princes
    { 0.859, 0.430, 8, 1 }, -- Aedra and Daedra
    { 0.808, 0.380, 8, 1 },
    { 0.820, 0.404, 8, 1 },
    { 0.788, 0.431, 8, 1 },
    { 0.575, 0.572, 8, 2 }, -- Boethiah's Proving
    { 0.585, 0.605, 8, 2 },
    { 0.580, 0.588, 8, 2 },
    { 0.583, 0.594, 8, 2, ld = { 2, } },
    -- Biographies
    { 0.470, 0.601, 9, 1 }, -- Galerion the Mystic
    { 0.446, 0.593, 9, 1 },
    { 0.499, 0.614, 9, 1 },
    { 0.498, 0.583, 9, 1 },
    { 0.269, 0.671, 9, 2 }, -- Great Harbingers of the Companions
    { 0.305, 0.677, 9, 2 },
    { 0.288, 0.621, 9, 2 },
    { 0.297, 0.635, 9, 2 },
    { 0.251, 0.503, 9, 3 }, -- The Illusion of Death
    { 0.275, 0.578, 9, 3 },
    { 0.219, 0.554, 9, 3 },
    { 0.358, 0.449, 9, 3, ld = { 2, } },
    { 0.930, 0.410, 9, 4 }, -- Jorunn the Skald-King
    { 0.896, 0.436, 9, 4 },
    { 0.947, 0.467, 9, 4 },
    { 0.90, 0.38, 9, 4, ld = { 1, } },
    { 0.412, 0.543, 9, 5 }, -- Triumphs of a Monarch, Ch. 3
    { 0.414, 0.440, 9, 5 },
    { 0.429, 0.475, 9, 5 },
    { 0.434, 0.445, 9, 5 },
    { 0.779, 0.349, 9, 6 }, -- Triumphs of a Monarch, Ch. 6
    { 0.698, 0.357, 9, 6 },
    { 0.769, 0.389, 9, 6 },
    { 0.7836, 0.3106, 9, 6, ld = { 1, } },
    { 0.180, 0.210, 9, 7 }, -- Triumphs of a Monarch, Ch. 10
    { 0.205, 0.204, 9, 7 },
    { 0.173, 0.226, 9, 7 },
    { 0.153, 0.199, 9, 7 },
    { 0.228, 0.497, 9, 8 }, -- Trials of St. Alessia
    { 0.202, 0.458, 9, 8 },
    { 0.200, 0.482, 9, 8 },
    { 0.252, 0.4678, 9, 8 },
    -- Divines and Deities
    { 0.379, 0.593, 10, 1 }, -- The Anuad Paraphrased
    { 0.326, 0.584, 10, 1 },
    { 0.337, 0.578, 10, 1 },
    { 0.345, 0.559, 10, 1 },
    { 0.168, 0.486, 10, 2 }, -- The Lunar Lorkhan
    { 0.122, 0.453, 10, 2 },
    { 0.1087, 0.4783, 10, 2 },
    { 0.390, 0.370, 10, 3 }, -- Monomyth: Dragon God & Missing God
    { 0.376, 0.376, 10, 3 },
    { 0.361, 0.408, 10, 3 },
    { 0.290, 0.558, 10, 3, ld = { 2, } },
    -- Dungeon Lore
    { 0.094, 0.447, 11, 1, 77, ld = { 9999, } }, -- With Regards to the Ebony Blade
    -- Dwemer
    { 0.656, 0.373, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
    { 0.688, 0.367, 12, 1 },
    { 0.606, 0.407, 12, 1 },
    { 0.717, 0.393, 12, 1, ld = { 2, } },
    { 0.720, 0.530, 12, 2 }, -- Ancient Scrolls of the Dwemer II
    { 0.680, 0.530, 12, 2 },
    { 0.7575, 0.5052, 12, 2 },
    { 0.339, 0.718, 12, 3 }, -- Ancient Scrolls of the Dwemer III
    { 0.338, 0.675, 12, 3 },
    -- Tamriel History
    { 0.651, 0.559, 19, 1 }, -- Ayleid Inscriptions Translated
    { 0.6007, 0.4912, 19, 1 },
    { 0.595, 0.463, 19, 1 },
    { 0.64, 0.5355, 19, 1 },
    { 0.474, 0.637, 19, 2 }, -- Frontier, Conquest
    { 0.484, 0.720, 19, 2 },
    { 0.383, 0.745, 19, 2 },
    { 0.495, 0.670, 19, 2 },
    { 0.526, 0.362, 19, 3 }, -- History of the Fighters Guild Pt. 1
    { 0.552, 0.339, 19, 3 },
    { 0.544, 0.371, 19, 3 },
    { 0.5574, 0.3642, 19, 3 },
    { 0.24, 0.65, 19, 4, ld = { 1, } }, -- History of the Fighters Guild Pt. 2
    { 0.2564, 0.6318, 19, 4, ld = { 1, } },
    { 0.225, 0.61, 19, 4, ld = { 1, } },
    { 0.1821, 0.6372, 19, 4, ld = { 1, } },
    { 0.8531, 0.3256, 19, 5 }, -- Origin of the Mages Guild
    { 0.8868, 0.3622, 19, 5 },
    { 0.9199, 0.3228, 19, 5 },
    { 0.9014, 0.291, 19, 5 },
  },
  [24] = { -- davonswatch_base
    -- Biographies
    { 0.708, 0.665, 9, 4 }, -- Jorunn the Skald-King
    { 0.687, 0.962, 9, 4 },
    { 0.859, 0.830, 9, 4 },
    { 0.117, 0.332, 9, 6 }, -- Triumphs of a Monarch, Ch. 6
    -- Daedric Princes
    { 0.256, 0.679, 8, 1 }, -- Aedra and Daedra
    { 0.504, 0.931, 8, 1 },
    -- Tamriel History
    { 0.799, 0.395, 19, 5 }, -- Origin of the Mages Guild
    { 0.464, 0.409, 19, 5 },
    { 0.634, 0.592, 19, 5 },
    { 0.706, 0.237, 19, 5 },
  },
  [511] = { -- ebonheart_base
    -- Stonefalls Lore
    { 0.632, 0.579, 20, 5 }, -- Nords of Skyrim
    { 0.455, 0.755, 20, 5 },
    { 0.535, 0.535, 20, 5 },
    { 0.272, 0.396, 20, 5 },
    { 0.6525, 0.6123, 20, 5 },
  },
  [510] = { -- kragenmoor_base
    -- Tamriel History
    { 0.515, 0.367, 19, 4 }, -- History of the Fighters Guild Pt. 2
    { 0.597, 0.623, 19, 4 },
    { 0.702, 0.497, 19, 4 },
    { 0.257, 0.524, 19, 4 },
  },
  [97] = { -- hightidehollow_base
    -- Biographies
    { 0.140, 0.328, 9, 3 }, -- The Illusion of Death
  },
  [90] = { -- innerseaarmature_base
    -- Dwemer
    { 0.539, 0.229, 12, 1 }, -- Ancient Scrolls of the Dwemer I-A
  },
  [114] = { -- mephalasnest_base
    -- Daedric Princes
    { 0.564, 0.292, 8, 2 }, -- Boethiah's Proving
  },
  [110] = { -- softloamcavern_base
    -- Divines and Deities
    { 0.428, 0.435, 10, 3 }, -- Monomyth: Dragon God & Missing God
  },
  [77] = { -- fungalgrotto_base
    -- Dungeon Lore
    { 0.331, 0.785, 11, 1, 77, ld = { 5, } }, -- With Regards to the Ebony Blade
  },

  -- stormhaven
  [12] = { -- stormhaven_base
    -- Stormhaven Lore
    { 0.245, 0.198, 2, 1 }, -- Once
    { 0.179, 0.232, 2, 1, ld = { 1, } },
    { 0.212, 0.225, 2, 1, ld = { 1, } },
    { 0.180, 0.472, 2, 2 }, -- Founding of the Spirit Wardens
    { 0.202, 0.441, 2, 2 },
    { 0.1696, 0.3808, 2, 2 },
    { 0.1366, 0.4233, 2, 2 },
    { 0.166, 0.510, 2, 3 }, -- The Knightly Orders of High Rock
    { 0.200, 0.594, 2, 3 },
    { 0.181, 0.620, 2, 3 },
    { 0.135, 0.580, 2, 3 },
    { 0.262, 0.299, 2, 4 }, -- The Bretons: Mongrels or Paragons?
    { 0.310, 0.350, 2, 4 },
    { 0.320, 0.316, 2, 4 },
    { 0.299, 0.286, 2, 4 },
    { 0.382, 0.390, 2, 5 }, -- Sacred Rites of the Stonechewers
    { 0.556, 0.417, 2, 5 },
    { 0.329, 0.374, 2, 5 },
    { 0.349, 0.349, 2, 5 },
    { 0.369, 0.352, 2, 5 },
    { 0.272, 0.434, 2, 6 }, -- Orcs: The Vermin Among Us
    { 0.360, 0.423, 2, 6 },
    { 0.323, 0.471, 2, 6 },
    { 0.308, 0.4322, 2, 6 },
    { 0.279, 0.493, 2, 7 }, -- Our Calling, Our Pledge
    { 0.251, 0.489, 2, 7 },
    { 0.214, 0.536, 2, 7 },
    { 0.281, 0.529, 2, 7 },
    { 0.303, 0.588, 2, 8 }, -- To Dream Beyond Dreams
    { 0.273, 0.656, 2, 8 },
    { 0.333, 0.663, 2, 8 },
    { 0.302, 0.635, 2, 8 },
    { 0.376, 0.651, 2, 9 }, -- Tower of Adamant
    { 0.395, 0.594, 2, 9 },
    { 0.354, 0.565, 2, 9 },
    { 0.341, 0.608, 2, 9 },
    { 0.236, 0.275, 2, 10 }, -- Wayrest, Jewel of the Bay
    { 0.208, 0.298, 2, 10 },
    { 0.201, 0.261, 2, 10 },
    { 0.1657, 0.2813, 2, 10, ld = { 1, } },
    -- Daedric Princes
    { 0.261, 0.413, 8, 3 }, -- The Dreamstride
    { 0.256, 0.362, 8, 3 },
    { 0.236, 0.328, 8, 3 },
    { 0.256, 0.391, 8, 3 },
    { 0.147, 0.335, 8, 4 }, -- The House of Troubles
    { 0.161, 0.303, 8, 4 },
    { 0.149, 0.348, 8, 4 },
    { 0.2004, 0.3351, 8, 4 },
    -- Divines and Deities
    { 0.5067, 0.5829, 10, 4, ld = { 1, } }, -- Monomyth: Lorkhan and Satakal
    { 0.5822, 0.5608, 10, 4, ld = { 1, } },
    { 0.5227, 0.5438, 10, 4, ld = { 1, } },
    { 0.5908, 0.5141, 10, 4, ld = { 1, } },
    { 0.625, 0.5758, 10, 5 }, -- Monomyth: "Shezarr's Song"
    { 0.554, 0.6134, 10, 5, ld = { 1, } },
    { 0.6189, 0.6111, 10, 5, ld = { 1, } },
    { 0.5986, 0.6701, 10, 5, ld = { 1, } },
    { 0.476, 0.633, 10, 6 }, -- Monomyth: The Myth of Aurbis
    { 0.4802, 0.6027, 10, 6 },
    { 0.446, 0.607, 10, 6 },
    { 0.5386, 0.6215, 10, 6 },
    -- Dwemer
    { 0.461, 0.491, 12, 4 }, -- Ancient Scrolls of the Dwemer V
    { 0.408, 0.510, 12, 4 },
    { 0.486, 0.511, 12, 4 },
    { 0.4426, 0.5453, 12, 4 },
    { 0.417, 0.414, 12, 5 }, -- Ancient Scrolls of the Dwemer VI
    { 0.416, 0.458, 12, 5 },
    { 0.449, 0.415, 12, 5 },
    { 0.4539, 0.4562, 12, 5 },
    { 0.538, 0.347, 12, 6 }, -- Ancient Scrolls of the Dwemer X
    { 0.422, 0.352, 12, 6 },
    { 0.485, 0.358, 12, 6 },
    { 0.5013, 0.3495, 12, 6 },
    -- Magic and Magica
    { 0.418, 0.547, 15, 1 }, -- Arcana Restored
    { 0.435, 0.582, 15, 1 },
    { 0.461, 0.553, 15, 1 },
    { 0.5046, 0.5209, 15, 1 },
    { 0.667, 0.366, 15, 2 }, -- Liminal Bridges
    { 0.654, 0.347, 15, 2 },
    { 0.641, 0.391, 15, 2 },
    { 0.672, 0.395, 15, 2 },
    { 0.736, 0.437, 15, 3 }, -- Magic from the Sky
    { 0.716, 0.450, 15, 3 },
    { 0.7549, 0.3909, 15, 3 },
    { 0.775, 0.412, 15, 4 }, -- Manual of Spellcraft
    { 0.773, 0.447, 15, 4 },
    { 0.805, 0.428, 15, 4 },
    { 0.8517, 0.397, 15, 4 },
    { 0.812, 0.459, 15, 5 }, -- The Old Ways
    { 0.738, 0.472, 15, 5 },
    { 0.785, 0.495, 15, 5 },
    { 0.8372, 0.5003, 15, 5 },
    { 0.654, 0.592, 15, 6 }, -- On the Detachment of the Sheath
    { 0.659, 0.539, 15, 6 },
    { 0.683, 0.599, 15, 6 },
    { 0.692, 0.558, 15, 6 },
    { 0.744, 0.507, 15, 7 }, -- Reality and Other Falsehoods
    { 0.703, 0.514, 15, 7 },
    { 0.746, 0.541, 15, 7 },
    { 0.781, 0.539, 15, 7 },
    { 0.839, 0.464, 15, 8 }, -- Guild Memo on Soul Trapping
    { 0.884, 0.449, 15, 8 },
    { 0.878, 0.442, 15, 8 },
    { 0.885, 0.498, 15, 8 },
    { 0.8563, 0.4283, 15, 8 },
    -- Myths of the Mundus
    { 0.527, 0.384, 16, 1 }, -- Before the Ages of Man: Dawn Era
    { 0.495, 0.403, 16, 1 },
    { 0.5053, 0.456, 16, 1 },
    { 0.5588, 0.4491, 16, 1 },
    { 0.532, 0.460, 16, 2 }, -- Before the Ages of Man: Merethic Era
    { 0.574, 0.501, 16, 2 },
    { 0.587, 0.463, 16, 2 },
    { 0.5332, 0.5177, 16, 2 },
    { 0.553, 0.376, 16, 3 }, -- Ebony Blade History
    { 0.571, 0.368, 16, 3 },
    { 0.605, 0.422, 16, 3 },
    { 0.618, 0.363, 16, 3 },
    { 0.695, 0.425, 16, 4 }, -- Noxiphilic Sanguivoria
    { 0.686, 0.464, 16, 4 },
    { 0.6613, 0.4513, 16, 4 },
    { 0.6390, 0.4193, 16, 4 },
    { 0.629, 0.514, 16, 5 }, -- A Werewolf's Confession
    { 0.647, 0.484, 16, 5 },
    { 0.700, 0.493, 16, 5 },
    { 0.655, 0.510, 16, 5 },
    -- Dungeon Lore
    { 0.562, 0.577, 11, 9, 46, ld = { 9999, } }, -- Wayrest Sewers: A Short History
    { 0.549, 0.536, 9, 9, 33, ld = { 9999, } }, -- The All-Beneficent King Fahara'jad
  },
  [34] = { -- alcairecastle_base
    -- Stormhaven Lore
    { 0.603, 0.351, 2, 1 }, -- Once
    { 0.863, 0.293, 2, 1 },
    { 0.600620, 0.354265, 2, 1 },
    { 0.770, 0.593, 2, 10 }, -- Wayrest, Jewel of the Bay
    { 0.496, 0.753, 2, 10 },
  },
  [532] = { -- koeglinvillage_base
    -- Stormhaven Lore
    { 0.245, 0.672, 2, 2 }, -- Founding of the Spirit Wardens
    { 0.523477, 0.303099, 2, 2 }
  },
  [33] = { -- wayrest_base
    -- Divines and Deities
    { 0.226, 0.410, 10, 4 }, -- Monomyth: Lorkhan and Satakal
    { 0.610, 0.298, 10, 4 },
    { 0.308, 0.212, 10, 4 },
    { 0.465, 0.564, 10, 5 }, -- Monomyth: "Shezarr's Song"
    { 0.827, 0.374, 10, 5 },
    { 0.6906, 0.8492, 10, 5 },
    { 0.075, 0.660, 10, 6 }, -- Monomyth: The Myth of Aurbis
    { 0.0959, 0.5078, 10, 6 },
    { 0.3891, 0.6048, 10, 6 },
    -- Magic and Magica
    { 0.215, 0.096, 15, 1 }, -- Arcana Restored
    { 0.970, 0.454, 15, 6 }, -- On the Detachment of the Sheath
    -- Myths of the Mundus
    { 0.361, 0.080, 16, 2 }, -- Before the Ages of Man: Merethic Era
    -- Dungeon Lore
    --[[TODO Check this ]]--
    { 0.486861, 0.115856, 9, 9, ld = { 6, 7, } }, -- The All-Beneficent King Fahara'jad
  },
  [46] = { -- wayrestsewers_base
    -- Dungeon Lore
    { 0.8309859037, 0.0996567607, 11, 9, 5, 46 }, -- Wayrest Sewers: A Short History
  },

  -- therift
  [125] = { -- therift_base
    -- The Rift Lore
    { 0.497, 0.291, 24, 1 }, -- Songs of the Return, Volume 49
    { 0.482, 0.280, 24, 1 },
    { 0.510, 0.333, 24, 1 },
    { 0.589, 0.344, 24, 2 }, -- Songs of the Return, Volume 27
    { 0.582, 0.268, 24, 2 },
    { 0.617, 0.285, 24, 2, ld = { 2, } },
    { 0.646, 0.275, 24, 2 },
    { 0.619, 0.522, 24, 3 }, -- The Wandering Skald
    { 0.543, 0.532, 24, 3 },
    { 0.558, 0.502, 24, 3 },
    { 0.586, 0.488, 24, 3 },
    { 0.834, 0.534, 24, 4 }, -- Thenephan's Mysteries of Mead
    { 0.836, 0.571, 24, 4 },
    { 0.851, 0.524, 24, 4 },
    { 0.849, 0.521, 24, 4 },
    { 0.412, 0.530, 24, 5 }, -- Unexpected Allies
    { 0.390, 0.438, 24, 5 },
    { 0.365, 0.474, 24, 5 },
    { 0.433, 0.478, 24, 5 },
    { 0.512, 0.550, 24, 6 }, -- The Road to Sovngarde
    { 0.510, 0.601, 24, 6 },
    { 0.4792, 0.6019, 24, 6 },
    { 0.475, 0.557, 24, 6 },
    { 0.183, 0.407, 24, 7 }, -- Songs of the Return, Volume 5
    { 0.197, 0.421, 24, 7 },
    { 0.201, 0.392, 24, 7 },
    { 0.212, 0.403, 24, 7 },
    { 0.376, 0.316, 24, 8 }, -- Touch of the Worm's Tongue
    { 0.4917, 0.4029, 24, 8 },
    { 0.444, 0.353, 24, 8 },
    { 0.470, 0.432, 24, 8 },
    { 0.685, 0.515, 24, 9, ld = { 1, } }, -- Rivers of Profit in Riften
    { 0.721, 0.509, 24, 9, ld = { 1, } },
    { 0.6489, 0.4969, 24, 9, ld = { 1, } },
    { 0.655, 0.311, 24, 10, ld = { 1, } }, -- Clans of the Reach: A Guide
    { 0.670, 0.289, 24, 10, ld = { 1, } },
    { 0.6855, 0.3037, 24, 10 },
    { 0.6684, 0.335, 24, 10 },
    -- Dwemer
    { 0.734, 0.401, 12, 13 }, -- Dwemer Inquiries Volume I
    { 0.718, 0.404, 12, 13, ld = { 2, } },
    { 0.773, 0.397, 12, 13 },
    { 0.7484, 0.3757, 12, 13 },
    { 0.393, 0.562, 12, 14 }, -- Dwemer Inquiries Volume II
    { 0.398, 0.577, 12, 14 },
    { 0.419, 0.567, 12, 14 },
    { 0.385, 0.574, 12, 14, ld = { 2, } },
    { 0.716, 0.665, 12, 15 }, -- Dwemer Inquiries Volume III
    { 0.736, 0.635, 12, 15 },
    { 0.654, 0.618, 12, 15 },
    { 0.7463, 0.6612, 12, 15 },
    { 0.370, 0.263, 12, 16 }, -- Ancient Scrolls of the Dwemer IV
    { 0.294, 0.270, 12, 16 },
    { 0.3381, 0.2662, 12, 16 },
    -- Literature
    { 0.923, 0.623, 14, 1 }, -- The Homilies of Blessed Almalexia
    { 0.898, 0.587, 14, 1 },
    { 0.859, 0.592, 14, 1 },
    { 0.110, 0.451, 14, 2 }, -- The Legendary Scourge
    { 0.130, 0.411, 14, 2 },
    { 0.1288, 0.4650, 14, 2 },
    { 0.789, 0.502, 14, 3 }, -- The Lusty Argonian Maid, Volume 1
    { 0.821, 0.489, 14, 3 },
    { 0.777, 0.450, 14, 3 },
    { 0.7518, 0.4905, 14, 3 },
    { 0.685, 0.375, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
    { 0.645, 0.369, 14, 4 },
    { 0.647, 0.404, 14, 4 },
    { 0.80, 0.62, 14, 5 }, -- Myths of Sheogorath, Volume 1
    { 0.783, 0.602, 14, 5, ld = { 2, } },
    { 0.79, 0.5832, 14, 5, ld = { 2, } },
    { 0.157, 0.448, 14, 6 }, -- Myths of Sheogorath, Volume 2
    { 0.164, 0.475, 14, 6 },
    { 0.180, 0.479, 14, 6 },
    { 0.209, 0.463, 14, 6 },
    { 0.191, 0.335, 14, 7 }, -- The Red Book of Riddles
    { 0.251, 0.273, 14, 7 },
    { 0.198, 0.310, 14, 7 },
    { 0.157, 0.262, 14, 7 },
    { 0.658, 0.574, 14, 8 }, -- 16 Accords of Madness, Vol. VI
    { 0.719, 0.559, 14, 8 },
    { 0.6881, 0.5498, 14, 8 },
    { 0.6913, 0.5835, 14, 8 },
    { 0.083, 0.273, 14, 9 }, -- Crow and Raven: Three Short Fables
    { 0.120, 0.322, 14, 9 },
    { 0.092, 0.296, 14, 9 },
    { 0.1246, 0.3622, 14, 9 },
    { 0.317, 0.423, 14, 10 }, -- Wabbajack
    { 0.371, 0.388, 14, 10 },
    { 0.3324, 0.4349, 14, 10 },
    { 0.3053, 0.4043, 14, 10 },
    -- Potery and Song
    { 0.259, 0.413, 18, 7, ld = { 1, } }, -- Proper-Life: Three Chants
    { 0.233, 0.392, 18, 7, ld = { 1, } },
    { 0.2413, 0.3982, 18, 7, ld = { 1, } },
    { 0.2566, 0.3728, 18, 7, ld = { 1, } },
    { 0.504, 0.443, 18, 8 }, -- Song of the Askelde Men
    { 0.498, 0.471, 18, 8 },
    { 0.519, 0.470, 18, 8 },
    { 0.531, 0.403, 18, 9 }, -- The Warrior's Charge
    { 0.498, 0.367, 18, 9 },
    { 0.5819, 0.3952, 18, 9 },
    { 0.5214, 0.3368, 18, 9 },
    { 0.862, 0.630, 18, 10 }, -- Words of the Wind
    { 0.806, 0.680, 18, 10 },
    { 0.806, 0.684, 18, 10, ld = { 2, } },
    { 0.8058, 0.7746, 18, 10, ld = { 2, } },
    -- Dungeon Lore
    { 0.891, 0.646, 11, 17, 403, ld = { 9999, } }, -- Josef the Intolerant
  },
  [198] = { -- riften_base
    -- The Rift Lore
    { 0.552, 0.677, 24, 9 }, -- Rivers of Profit in Riften
    { 0.813, 0.634, 24, 9 },
    { 0.298, 0.551, 24, 9 },
  },
  [542] = { -- shorsstone_base
    -- The Rift Lore
    { 0.354, 0.586, 24, 10 }, -- Clans of the Reach: A Guide
    { 0.451, 0.434, 24, 10 },
    { 0.566, 0.540, 24, 10 },
    { 0.4452, 0.7681, 24, 10 },
  },
  [543] = { -- nimalten_base
    -- Poetry and Song
    { 0.494, 0.523, 18, 7 }, -- Proper-Life: Three Chants
    { 0.606, 0.619, 18, 7 },
    { 0.582, 0.380, 18, 7 },
    { 0.443, 0.489, 18, 7 },
  },
  [169] = { -- avancheznel_base
    -- Dwemer
    { 0.770, 0.526, 12, 14 }, -- Dwemer Inquiries Volume II
  },
  [703] = { -- brokenhelm_base
    -- Literature
    { 0.305, 0.582, 14, 5 }, -- Myths of Sheogorath, Volume 1
  },
  [214] = { -- ebonmeretower_base
    -- Poetry and Song
    { 0.342, 0.378, 18, 8 }, -- Song of the Askelde Men
  },
  [460] = { -- fallowstonevault_base
    -- The Rift Lore
    { 0.101, 0.448, 24, 2 }, -- Songs of the Return, Volume 27
  },
  [463] = { -- forelhost_base
    -- Literature
    { 0.281, 0.613, 14, 5 }, -- Myths of Sheogorath, Volume 1
  },
  [254] = { -- fortgreenwall_base
    -- Dwemer
    { 0.454, 0.672, 12, 13 }, -- Dwemer Inquiries Volume  I
  },
  [265] = { -- snaplegcave_base
    -- Dwemer
    { 0.74, 0.59, 12, 16 }, -- Ancient Scrolls of Dwemer IV
  },
  [176] = { -- trolhettacave_base
    -- Poetry and Song
    { 0.502, 0.261, 18, 10 }, -- Words of the Wind
  },
  [398] = { -- blessedcrucible2_base
    -- Dungeon Lore
    { 0.240, 0.443, 11, 17 }, -- Josef the Intolerant
  },
  [400] = { -- blessedcrucible4_base
    { 0.240, 0.443, 11, 17 }, -- Josef the Intolerant
  },
  [401] = { -- blessedcrucible5_base
    { 0.2401482016, 0.4415628016, 11, 17, }, -- Josef the Intolerant
  },
  [402] = { -- blessedcrucible6_base
    { 0.240, 0.443, 11, 17 }, -- Josef the Intolerant
  },
  [403] = { -- blessedcrucible7_base
    { 0.240, 0.443, 11, 17, 403, ld = { 5, } }, -- Josef the Intolerant
  },

  -- wrothgar
  [667] = { -- wrothgar_base
    { 0.6349, 0.3096, 11, 5 }, -- Civility and etiquette : Wood Orcs I
    { 0.6498, 0.3292, 11, 5 },
    { 0.5396, 0.3988, 11, 5 },
    { 0.7211, 0.3429, 11, 5 },
    { 0.4765, 0.5451, 16, 7 }, -- The Pig Children
    { 0.4629, 0.5118, 16, 7 },
    { 0.4601, 0.4575, 16, 7 },
    { 0.5108, 0.6943, 14, 2 }, -- The Legendary Scourge
    { 0.575, 0.6734, 14, 2 },
    { 0.5575, 0.5874, 14, 2 },
    { 0.4855, 0.6009, 14, 2 },
    { 0.8069, 0.3259, 8, 3 }, -- The Dreamstride
    { 0.7309, 0.2572, 8, 3 },
    { 0.8346, 0.2591, 8, 3 },
    { 0.8205, 0.2146, 8, 3 },
    { 0.2834, 0.7076, 19, 9 }, -- Return to Orsinium
    { 0.2868, 0.6946, 19, 9 },
    { 0.2484, 0.7306, 19, 9 },
    { 0.345, 0.6865, 19, 9 },
  },

  -- thievesguild
  [994] = { -- hewsbane_base
    { 0.3432, 0.6059, 11, 3 }, -- The Thief God's Treasures
    { 0.3844, 0.5982, 11, 3 },
    { 0.3855, 0.8008, 11, 3 },
    { 0.4609, 0.7099, 11, 3 },
    { 0.4531, 0.4467, 18, 5 }, -- Flesh to Cut from Bone
    { 0.4034, 0.4732, 18, 5 },
    { 0.5417, 0.5365, 18, 5 },
    { 0.4469, 0.5925, 18, 5 },
  },

  -- darkbrotherhood
  [1006] = { -- goldcoast_base
    { 0.8587, 0.5059, 19, 6 }, -- Eulogy for Emperor Varen
    { 0.7735, 0.4055, 9, 8, ld = { 1, } }, -- Trials of St. Alessia
    { 0.8283, 0.6145, 18, 7 }, -- Proper-Life: Three Chants
    { 0.8692, 0.5962, 13, 4 }, -- The Cleansing of the Fane
    { 0.8222, 0.3747, 13, 2, ld = { 1, } }, -- The Adabal-a
    { 0.6805, 0.625, 18, 5 }, -- Flesh to Cut from Bone
    { 0.5397, 0.3190, 16, 9 }, -- Sithis
  },
  [1064] = { -- kvatchcity_base
    { 0.5650, 0.3459, 13, 2 }, -- The Adabal-a
    { 0.2924, 0.5143, 9, 8 }, -- Trials of Saint Alessia",
  },

  -- vvardenfell
  [1060] = { -- vvardenfell_base
    { 0.4040, 0.8088, 20, 3 }, -- The Great Houses and Their Uses
    { 0.8816, 0.6117, 20, 3 },
    { 0.3299, 0.5284, 20, 3 },
    { 0.5019, 0.2445, 8, 4 }, -- The House of Troubles
    { 0.4052, 0.2688, 8, 4 },
    { 0.3203, 0.6273, 8, 4 },
    { 0.1686, 0.2911, 8, 4 },
    { 0.6482, 0.5707, 8, 5 }, -- Invocation of Azura
    { 0.5571, 0.7558, 8, 5 },
    { 0.7404, 0.5302, 8, 5 },
    { 0.5970, 0.7596, 8, 5 },
    { 0.2896, 0.2204, 10, 10 }, -- Vivec and Mephala
    { 0.7795, 0.6233, 10, 10 },
    { 0.4412, 0.7472, 10, 10 },
    { 0.8780, 0.7064, 11, 6 }, -- The Art of Kwama Egg Cooking
    { 0.7412, 0.8345, 11, 6 },
    { 0.2427, 0.2308, 11, 6 },
    { 0.6517, 0.2801, 11, 6 },
    { 0.6274, 0.813, 20, 8 }, -- Varieties of Faith: The Dark Elves
    { 0.4444, 0.2062, 20, 8 },
    { 0.6695, 0.8487, 20, 8 },
    { 0.4235, 0.1985, 20, 8 },
    { 0.4852, 0.6504, 22, 9 }, -- On Stepping Lightly
    { 0.1655, 0.3742, 22, 9 },
    { 0.7201, 0.8283, 22, 9 },
    { 0.2865, 0.2902, 23, 1 }, -- The Living Gods
    { 0.7785, 0.7153, 23, 1 },
    { 0.7514, 0.2607, 23, 1 },
    { 0.9008, 0.5337, 23, 1 },
    { 0.6072, 0.9108, 23, 3 }, -- Kwama Mining for Fun and Profit
    { 0.3112, 0.3379, 23, 3 },
    { 0.3889, 0.7220, 23, 3 },
    { 0.5789, 0.7001, 23, 3 },
    { 0.1930, 0.4266, 23, 9 }, -- Sanctioned Murder
    { 0.3298, 0.4749, 23, 9 },
    { 0.6858, 0.6227, 23, 9 },
    { 0.7125, 0.4565, 23, 9 },
  },

  -- clockwork
  [1313] = { -- clockwork_base
    { 0.7863, 0.5314, 8, 4 }, -- The House of Troubles
    { 0.4110, 0.4609, 14, 9, ld = { 4, } }, -- Crow and Raven: Three Short Fables
    { 0.4423, 0.5048, 15, 5 }, -- The Old Ways
    { 0.8767, 0.6055, 17, 4 }, -- The Doors of Oblivion, Part 2
    { 0.6890, 0.6311, 20, 8 }, -- Varieties of Faith: The Dark Elves
    { 0.6872, 0.4288, 23, 1 }, -- The Living Gods
    { 0.4130, 0.5751, 26, 6 }, -- The Devouring of Gil-Var-Delle
  },
  [1335] = { -- ccunderground_base
    -- Literature
    { 0.4920, 0.9400, 14, 9, ld = { 4, } }, -- Crow and Raven: Three Short Fables
  },
  [1362] = { -- ccunderground02_base
    -- Literature
    { 0.4920, 0.9400, 14, 9, 4 }, -- Crow and Raven: Three Short Fables
  },
  [1348] = { -- brassfortress_base
    -- Literature
    { 0.4576, 0.5555, 14, 9, ld = { 4, } }, -- Crow and Raven: Three Short Fables
  },

  -- summerset
  [1349] = { -- summerset_base
    { 0.6650, 0.7887, 16, 1 }, -- Before the Ages of Man: Dawn Era
    { 0.5072, 0.6602, 16, 1 },
    { 0.7203, 0.7285, 16, 1 },
    { 0.4392, 0.4343, 25, 4 }, -- Varieties of Faith: The High Elves
    { 0.4287, 0.4702, 25, 4 },
    { 0.3716, 0.5270, 25, 4 },
    { 0.1801, 0.6377, 15, 4 }, -- Manual of Spellcraft
    { 0.2318, 0.6262, 15, 4 },
    { 0.3371, 0.4875, 15, 4 },
    { 0.2647, 0.4988, 15, 4 },
    { 0.2684, 0.5325, 25, 6 }, -- Fang of the Sea Vipers
    { 0.6080, 0.5235, 25, 6 },
    { 0.5762, 0.4323, 25, 6 },
    { 0.5123, 0.5444, 15, 5 }, -- The Old Ways
    { 0.1829, 0.3082, 15, 5 },
    { 0.5583, 0.5436, 15, 5 },
    { 0.3185, 0.3355, 23, 6 }, -- Legend of the Ghost Snake
    { 0.3079, 0.3175, 3, 2 }, -- The Story of Princess Eselde
    { 0.4696, 0.1323, 16, 2 }, -- Before the Ages of Man: Merethic Era
    { 0.6081, 0.2773, 9, 10, }, -- Ayrenn: The Unforeseen Queen
    { 0.2989, 0.2591, 9, 10, },
    { 0.2716, 0.2413, 9, 10, },
    { 0.6260, 0.3079, 9, 10, },
    { 0.6503, 0.5976, 25, 10 }, -- Thalmor Handbill
    { 0.6975, 0.6456, 25, 10 },
    { 0.6076, 0.5236, 25, 10 },
    { 0.5282, 0.2976, 25, 10 },
  },
  [1431] = { -- shimmerene_base
    { 0.3013, 0.4342, 25, 6, ld = { 1, } }, -- Fang of the Sea Vipers
  },

  -- murkmire
  [1484] = { -- murkmire_base
    { 0.7377, 0.5599, 14, 3 }, -- The Lusty Argonian Maid, Volume 1
    { 0.7376, 0.5599, 14, 4 }, -- The Lusty Argonian Maid, Volume 2
  }, --}

  -- elsweyr
  [1555] = { -- elsweyr_base
    { 0.2353, 0.5703, 6, 10 }, -- On the Knahaten Flu
    { 0.4122, 0.6014, 25, 7 }, -- The Rise of Queen Ayrenn
    { 0.4998, 0.1661, 26, 1 }, -- Varieties of Faith: The Khajiit
    { 0.3633, 0.3044, 26, 9 }, -- The Legend of Vastarie
    { 0.5792, 0.6901, 28, 1 }, -- The Moon Cats and their Dance
    { 0.7272, 0.3986, 28, 2 }, -- Litter-Mates of Darkness
    { 0.7139, 0.2661, 28, 7 }, -- Moon-Sugar for Glossy Fur? Yes!
    { 0.7853, 0.2872, 28, 8 }, -- Master Zoaraym's Tale, Part 1
    { 0.3869, 0.5218, 28, 9 }, -- Master Zoaraym's Tale, Part 2
    { 0.1382, 0.7498, 1, 2 }, -- A Warning to the Aldmeri Dominion
  },
  [1576] = { -- rimmen_base
    { 0.4391, 0.5035, 28, 8, ld = { 1, } }, -- Master Zoaraym's Tale, Part 1
  },
  [1663] = { -- stitches_base
    { 0.5773617029, 0.5049619079, 28, 9, ld = { 1, } }, -- Master Zoaraym's Tale, Part 2",
  },
  [1591] = { -- riverholdcity_base
    { 0.5424, 0.6056, 26, 1, ld = { 1, } }, -- Varieties of Faith: The Khajiit
  },

  -- southernelsweyr
  [1654] = { -- southernelsweyr_base
    { 0.1826, 0.6512, 6, 8 }, -- A Mother's Nursery Rhyme
    { 0.3996, 0.6158, 6, 10 }, -- On the Knahaten Flu
    { 0.664, 0.696, 21, 6 }, --Pirates of Abecean
    { 0.5043, 0.5094, 21, 8 }, -- A Nereid Stole My Husband
    { 0.298, 0.459, 26, 1 }, --Varieties of Faith: The Khajiit
    { 0.184, 0.313, 28, 1 }, --The Moon Cats and Their Dance
    { 0.3855, 0.3836, 28, 5 }, -- The Eagle and the Cat
    { 0.3718, 0.2511, 28, 6 }, -- Elven Eyes, Elven Spies
    { 0.4481, 0.3572, 28, 8 }, -- Master Zoaraym's Tale, Part 1
    { 0.9184, 0.7123, 28, 9 }, -- Master Zoaraym's Tale, Part 2
  },
  [1675] = { -- senchal_base
    { 0.5307, 0.4735, 21, 8, ld = { 1, } }, -- A Nereid Stole My Husband
  },
  [1690] = { -- senchalpalace01_base
    { 0.1460, 0.4266, 21, 8, ld = { 1, } }, -- A Nereid Stole My Husband
  },
  [1684] = { -- els_dragonguard_island01_base
    { 0.6481, 0.2633, 28, 9, ld = { 1, } }, -- Master Zoaraym's Tale, Part 2
  },
  [1682] = { -- els_dg_sanctuary_base
    { 0.2834, 0.4420, 28, 9, ld = { 1, } }, -- Master Zoaraym's Tale, Part 2
  },

  -- skyrim
  [1719] = { -- westernskryim_base
    { 0.148019, 0.507949, 22, 4 }, -- Orcs of Skyrim
    { 0.705610, 0.615015, 22, 5, ld = { 4, } }, -- The Crown of Freydis
    { 0.603897, 0.425017, 22, 1, }, -- The Brothers' War
    { 0.264192, 0.667194, 20, 5 }, -- Nords of Skyrim
    { 0.745340, 0.323121, 22, 7, ld = { 2, } }, -- All About Giants
  },
  [1773] = { -- solitudecity_base
    { 0.774210, 0.771555, 22, 1 }, -- The Brothers' War
  },
  [1747] = { -- blackreach_base
    { 0.342268, 0.805844, 24, 6, }, -- The Road to Sovngarde
    { 0.946860, 0.468109, 20, 9, ld = { 4, } }, -- Varieties of Faith: The Nords
    { 0.101889, 0.515470, 24, 3, }, -- The Wandering Skald
  },
  [1754] = { -- morthalburialcave_base
    { 0.373737, 0.712121, 22, 5, ld = { 4, } }, -- The Crown of Freydis
  },
  [1750] = { -- frozencoast_base
    { 0.230608, 0.741918, 22, 7, ld = { 2, } }, -- All About Giants
  },
  [1809] = { -- lightlesshollow_mines01_base
    { 0.699904, 0.810099, 20, 9, ld = { 4, } }, -- Varieties of Faith: The Nords
  },

  -- The Reach
  [1814] = { -- reach_base_0
    { .415, .599, 1, 4 }, --The Werewolf's Hide
    --{ .346, .487, 3, 3 }, --Bloodfiends of Rivenspire
    { 0.573139, 0.492006, 4, 2, }, --Living with Lycanthropy
    { 0.439162, 0.685270, 4, 9 }, --A Life Barbaric and Brutal
    { 0.583863, 0.440658, 22, 5 }, --The Crown of Freydis
    { 0.540232, 0.289004, 22, 7 }, --All About Giants
    { 0.504645, 0.626682, 24, 10 }, --Clans of the Reach: A Guide
    { 0.390826, 0.674602, 24, 4 }, --Thenephan's Mysteries of Mead
  },

  -- Deadlands
  [2021] = { -- u32deadlandszone_base_0
    { 0.7190, 0.3690, 17, 1 }, --The Book of Daedra
    { 0.1790, 0.5880, 17, 5 }, --On Oblivion
    { 0.3510, 0.7000, 17, 7 }, --Varieties of Daedra, Part 1
    { 0.2680, 0.5980, 17, 8 }, --Varieties of Daedra, Part 2
    { 0.6960, 0.5070, 8, 4 }, --The House of Troubles
    { 0.7070, 0.4530, 29, 9 }, --Oath of a Dishonored Clan
    { 0.4320, 0.4840, 29, 4 }, --I was Summoned by a Mortal
    { 0.4380, 0.6530, 23, 10 },
  },
  [2119] = {-- u32_fargravezone_base_0
    { 0.5270, 0.2390, 14, 5 }, -- Myths of Sheogorath, Volume 1
    { 0.3450, 0.6160, 2, 8 }, --To Dream Beyond Dreams
  },
  [2035] = { -- u32_fargrave_base_0
    { 0.4060, 0.1760, 2, 8 },
  },
  [2082] = { -- u32_theshambles_base_0
    { 0.3660, 0.3200, 14, 5 },
  },

  -- blackwood
  [1887] = { -- blackwood/blackwood_base_0
    { 0.736023, 0.525641, 6, 7 }, -- Freedom's Price, blackwood_base
    { 0.230263, 0.630419, 19, 6 }, -- Eulogy for Emperor Varen
    { 0.160210, 0.376422, 19, 7 }, -- House Tharn of Nibenay
    { 0.381502, 0.388252, 9, 8 }, -- Trials of Saint Alessia
    { 0.477046, 0.559935, 13, 7 }, -- The Order of the Ancestor Moth, blackwood_base
    { 0.482390, 0.633230, 15, 7 }, -- Reality and Other Falsehoods, blackwood_base
    { 0.627011, 0.737126, 20, 7 }, -- Varieties of Faith: The Argonians, blackwood_base
    { 0.533433, 0.187075, 19, 1 }, -- Ayleid Inscriptions Translated, blackwood_base
    { 0.701570, 0.245042, 26, 1 }, -- Varieties of Faith: The Khajiit, blackwood_base
    { 0.3741942644, 0.1428848952, 29, 4, 1991 }, -- I was Summoned by a Mortal
    { 0.3741942644, 0.1428848952, 29, 3, 1991 }, -- Chaotic Creatia: The Azure Plasm
    -- in Chapel
    { 0.213265, 0.545964, 10, 8, ld = { 4, } }, -- Nine Commands of the Eight Divines
    -- non zone guide
    { 0.679473, 0.252154, 21, 6 }, -- Pirates of the Abecean, blackwood_base
  },
  [1940] = { -- u30_leyawiincity_base
    { 0.253902, 0.455195, 10, 8, ld = { 4, } }, -- Nine Commands of the Eight Divines
  },
  [1991] = { -- blackwood/u30_shattered_vault_1_base_0
    { 0.450474, 0.607235, 29, 4 }, -- I was Summoned by a Mortal
    { 0.447890, 0.596899, 29, 3 }, -- Chaotic Creatia: The Azure Plasm
  },


  [2114] = { -- systres/u34_systreszone_base_0
    { 0.5080, 0.8420, 1, 5 }, --Guide to the Daggerfall Covenant
    { 0.5280, 0.6990, 9, 7 }, --Triumphs of a Monarch, Ch. 10
    { 0.5390, 0.5300, 2, 4 }, --The Bretons: Mongrels or Paragons?
    { 0.3140, 0.4720, 2, 10 }, --Wayrest, Jewel of the Bay
    { 0.6010, 0.8660, 1, 7 }, --Varieties of Faith: The Bretons
    { 0.1960, 0.6160, 1, 9 }, --Wyresses: The Name-Daughters
    { 0.1620, 0.7550, 2, 3 }, --The Knightly Orders of High Rock
    { 0.6640, 0.2300, 9, 5 }, --Triumphs of a Monarch, Ch. 3
    { 0.8530, 0.2670, 9, 6 }, --Triumphs of a Monarch, Ch. 6
    { 0.8550, 0.3370, 18, 5 }, --Flesh to Cut from Bone
  },

  [2212] = { -- galen/u36_galenisland_base_0
    { 0.5230, 0.4810, 2, 4 }, --The Bretons: Mongrels or Paragons?
    { 0.2810, 0.7380, 1, 5 }, --Guide to the Daggerfall Covenant
    { 0.1170, 0.2750, 9, 6 }, --Triumphs of a Monarch, Ch. 6
    { 0.5740, 0.1740, 9, 7 }, --Triumphs of a Monarch, Ch. 10
    { 0.5360, 0.5710, 18, 5 }, --Flesh to Cut from Bone
  },

  -- guild maps
  [563] = { -- abagarlas_base
    -- Coldharbour Lore
    { 0.247, 0.548, 29, 1 }, -- Exegesis of Merid-Nunda
  },
  [102] = { -- mzendeldt_base
    -- Coldharbour Lore
    { 0.39, 0.92, 29, 2 }, -- The Whithering of Delodiil
  },
  [600] = { -- chateaumasterbedroom_base
    -- The Trial of Eyevea
    { 0.4159089029, 0.4866060317, 7, 2, }, -- A Gift of Sanctuary
  },
  [106] = { -- circusofcheerfulslaughter_base
    -- The Trial of Eyevea
    { 0.279, 0.699, 7, 3 }, -- Robier's Vegetable Garden
  },
  [319] = { -- gladeofthedivineshivering_base
    -- The Trial of Eyevea
    { 0.516, 0.561, 7, 4 }, -- Circus of Cheerful Slaughter
  },
  [105] = { -- cheesemongershollow_base
    -- The Trial of Eyevea
    { 0.790, 0.253, 7, 1 }, -- How the Kwama Lost His Shoes
  },
  [2343] = { -- telvanni/u38_necrom_base_0
    { 0.3584167659, 0.5731035471, 8, 1 }, -- Aedra and Daedra, 
    { 0.582, 0.524, 8, 4 }, -- The House of Troubles
  },
  [2275] = { -- apocrypha/u38_apocrypha_base_0
    { 0.7145946622, 0.8545875549, 17, 1 }, -- The Book of Daedra
    { 0.577, 0.548, 8, 9 }, --Fragmentae Abyssum Hermaeus Morus
  },
  [2274] = { -- telvanni/u38_telvannipeninsula_base_0
    { 0.4495556355, 0.5568020940, 11, 8 }, -- Where Magical Paths Meet
    { 0.787, 0.355, 8, 1 }, -- Aedra and Daedra
    { 0.840, 0.343, 8, 4 }, --The House of Troubles
    { 0.588, 0.681, 20, 1 }, -- Ancestors and the Dunmer (Abridged)
  },
  [2317] = { -- apocrypha/u38_disquiet_study_base_0
    { 0.4920897484, 0.3628119528, 8, 6 }, -- Modern Heretics 
  },
}

--[[TODO Update this to use any new libraries for tracking character
information as achievements are now account wide
]]--
local lorebooksExplorationIDs = {
  [2] = 964,
  [3] = 966,
  [4] = 965,
  [5] = 967,
  [6] = 968,
  [7] = 977,
  [8] = 979,
  [9] = 972,
  [10] = 971,
  [11] = 970,
  [12] = 974,
  [13] = 973,
  [14] = 766,
  [15] = 976,
  [16] = 978,
  [17] = 980,
  [18] = 975,
  [19] = 981,
  [20] = 981,
  [21] = 768,
  [22] = 975,
  [23] = 984,
  [25] = { 986, 1126 },
  [26] = 1169,
  [27] = 1323,
  [28] = 1359,
  [29] = 1428,
  [30] = 1866,
  [31] = 2018, -- CLOCKWORK
  [32] = 2010, -- SUMMERSET
  -- [33] ARTAEUM
  [34] = 2288,
  -- [35] NORG_TZEL
  [36] = 2404, -- NORTHERN_ELSWEYR
  [37] = 2559, -- SOUTHERN_ELSWEYR
  [38] = 2647, -- WESTERN_SKYRIM
  -- [39] = , -- BLACKREACH_GREYMOOR
  -- [40] = , -- BLACKREACH
  -- [41] = , -- BLACKREACH_ARKTHZAND
  [42] = 2854, -- THE_REACH
  [43] = 2973, -- BLACKWOOD
  -- [44] = , -- FARGRAVE
  [45] = 3137, -- THE_DEADLANDS
  [46] = 3272, -- HIGH_ISLE
  -- [47] = , -- FARGRAVE_CITY
  [48] = 3491, -- GALEN
}

local lorebooksMainQuestIDs = {
  [2] = 953,
  [3] = 955,
  [4] = 954,
  [5] = 956,
  [6] = 958,
  [7] = 944,
  [8] = 946,
  [9] = 950,
  [10] = 949,
  [11] = 948,
  [12] = 952,
  [13] = 951,
  [14] = 993,
  [15] = 943,
  [16] = 945,
  [17] = 947,
  [18] = 194,
  [19] = 415,
  [20] = 415,
  [21] = 525,
  [22] = 194,
  [23] = 957,
  [25] = 1143,
  [26] = 1175,
  [27] = 1260,
  [28] = 1363,
  [29] = 1444,
  [30] = 1852,
  [31] = 2064, -- CLOCKWORK
  -- [32] = , -- SUMMERSET
  -- [33] ARTAEUM
  -- [34] = ,
  -- [35] NORG_TZEL
  -- [36] = , -- NORTHERN_ELSWEYR
  -- [37] = , -- SOUTHERN_ELSWEYR
  -- [38] = , -- WESTERN_SKYRIM
  -- [39] = , -- BLACKREACH_GREYMOOR
  -- [40] = , -- BLACKREACH
  -- [41] = , -- BLACKREACH_ARKTHZAND
  -- [42] = , -- THE_REACH
  -- [43] = , -- BLACKWOOD
  -- [44] = , -- FARGRAVE
  -- [45] = , -- THE_DEADLANDS
  -- [46] = , -- HIGH_ISLE
  -- [47] = , -- FARGRAVE_CITY
  -- [48] = , -- GALEN
}

local lorebooksZoneQuestIDs = {
  [2] = 34,
  [3] = 58,
  [4] = 57,
  [5] = 59,
  [6] = 60,
  [7] = 608,
  [8] = 611,
  [9] = 596,
  [10] = 595,
  [11] = 593,
  [12] = 603,
  [13] = 600,
  [14] = { 758, 759, 760, 761, 762 },
  [15] = 604,
  [16] = 610,
  [17] = 602,
  [18] = 194,
  [19] = 415,
  [20] = 415,
  [21] = 525,
  [22] = 194,
  [23] = 616,
  [25] = 1143,
  [26] = 1175,
  [27] = 1328,
  [28] = 1366,
  [29] = 1433,
  [30] = 1867,
  [31] = 2068, -- CLOCKWORK Clockwork City Adventurer
  -- [32] = 2209, -- SUMMERSET
  -- [33] ARTAEUM
  -- [34] = ,
  -- [35] NORG_TZEL
  -- [36] = 2508, -- NORTHERN_ELSWEYR
  -- [37] = , -- SOUTHERN_ELSWEYR
  -- [38] = , -- WESTERN_SKYRIM
  -- [39] = , -- BLACKREACH_GREYMOOR
  -- [40] = , -- BLACKREACH
  -- [41] = , -- BLACKREACH_ARKTHZAND
  -- [42] = , -- THE_REACH
  -- [43] = , -- BLACKWOOD
  -- [44] = , -- FARGRAVE
  -- [45] = , -- THE_DEADLANDS
  -- [46] = 3301, -- HIGH_ISLE
  -- [47] = , -- FARGRAVE_CITY
  -- [48] = , -- GALEN
}

local function AreAllWayshrinesUnlocked()

  for nodeIndex = 1, GetNumFastTravelNodes() do
    local known, _, _, _, _, _, poiType, isShownInCurrentMap = GetFastTravelNodeInfo(nodeIndex)
    if isShownInCurrentMap and poiType == POI_TYPE_WAYSHRINE and not known then
      return false
    end
  end

  return true

end

function LoreBooks_GetImmersiveModeCondition(mode, mapIndex)
  if mode == internal.LBOOKS_IMMERSIVE_ZONEMAINQUEST then
    return lorebooksMainQuestIDs[mapIndex]
  elseif mode == internal.LBOOKS_IMMERSIVE_WAYSHRINES then
    return AreAllWayshrinesUnlocked()
  elseif mode == internal.LBOOKS_IMMERSIVE_EXPLORATION then
    return lorebooksExplorationIDs[mapIndex]
  elseif mode == internal.LBOOKS_IMMERSIVE_ZONEQUESTS then
    return lorebooksZoneQuestIDs[mapIndex]
  end
end

function LoreBooks_GetLocalData(mapId)
  return lorebooksData[mapId]
end

function LoreBooks_GetDataOfBook(categoryIndex, collectionIndex, bookIndex)

  local results = {}
  if categoryIndex == internal.LORE_LIBRARY_SHALIDOR then
    if collectionIndex and bookIndex then
      for mapId, mapData in pairs(lorebooksData) do
        for _, bookData in pairs(mapData) do
          if bookData[internal.SHALIDOR_COLLECTIONINDEX] == collectionIndex and bookData[internal.SHALIDOR_BOOKINDEX] == bookIndex then
            results[#results + 1] = { data = bookData, mapId = mapId, locX = bookData[internal.SHALIDOR_LOCATION_X], locY = bookData[internal.SHALIDOR_LOCATION_Y] }
          end
        end
      end
    end
  end

  return results

end

function LoreBooks_GetAllData()
  return lorebooksData
end