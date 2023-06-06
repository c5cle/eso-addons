local MY_MODULE_NAME = "Valve"
local MY_MODULE_VERSION = 8

local LCC = LibStub('LibCustomTitlesRN')
if not LCC then return end

local MY_MODULE = LCC:RegisterModule(MY_MODULE_NAME, MY_MODULE_VERSION)
if not MY_MODULE then return end

MY_MODULE:RegisterTitle("@Valve", nil, true, {en = "The Golden", de = "Die Goldene", fr = "la Dorée"}, {color = {"#F1DD98", "#C2AA49"}, hidden = true})
MY_MODULE:RegisterTitle("@AsmaeI", nil,	494, {en = "The Fluffy Salmon Genocider", de = "Der flauschige Fischgenozid", fr = "Mangeur de saumons génocidaire"})
MY_MODULE:RegisterTitle("@ItchyTheRat", nil, 494, {en = "Grand Master Angler", de = "Großmeisteranglerin", fr = "Grande maîtresse de pêche"}, {color = "#7FFF00"})
MY_MODULE:RegisterTitle("@ItchyTheRat",	nil, true, {en = "The Rat", de = "Die Ratte", fr = "le Rat"})
MY_MODULE:RegisterTitle("@ItchyTheRat", "A Pink Panther", true, {en = "Tamriel's Most Wanted"}, {color = "#FF69B4"})
MY_MODULE:RegisterTitle("@Eweroun", nil, 93, {en = "Iron Minion"})
