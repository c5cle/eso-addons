RDL.LATESTDLC_FIRSTANTIQUITY = 557


RDL.FURNISHING = GetString("SI_ITEMTYPE",ITEMTYPE_FURNISHING)
RDL.MAJOR_ADORNMENT = GetString("SI_COLLECTIBLECATEGORYTYPE",COLLECTIBLE_CATEGORY_TYPE_FACIAL_ACCESSORY)
RDL.MOTIF_CHAPTER = GetString("SI_SPECIALIZEDITEMTYPE",SPECIALIZED_ITEMTYPE_RACIAL_STYLE_MOTIF_CHAPTER)
RDL.BODY_MARKING = GetString("SI_COLLECTIBLECATEGORYTYPE",COLLECTIBLE_CATEGORY_TYPE_BODY_MARKING)
RDL.EMOTE = GetString("SI_COLLECTIBLECATEGORYTYPE",COLLECTIBLE_CATEGORY_TYPE_EMOTE)
RDL.HEAD_MARKING = GetString("SI_COLLECTIBLECATEGORYTYPE",COLLECTIBLE_CATEGORY_TYPE_HEAD_MARKING)
RDL.TREASURE = GetString("SI_SPECIALIZEDITEMTYPE",SPECIALIZED_ITEMTYPE_TREASURE)
RDL.CONTAINER = GetString("SI_SPECIALIZEDITEMTYPE",SPECIALIZED_ITEMTYPE_CONTAINER)
RDL.HAT = GetString("SI_COLLECTIBLECATEGORYTYPE",COLLECTIBLE_CATEGORY_TYPE_HAT)

RDL.ZONEID_SELSWEYR = 1133 
RDL.ZONEID_MURKMIRE =	726 
RDL.ZONEID_HEWSBANE = 816
RDL.ZONEID_GOLDCOAST = 823
RDL.ZONEID_CLOCKWORKCITY = 980
RDL.ZONEID_WROTHGAR = 684
RDL.ZONEID_WSKYRIM =	1160
RDL.ZONEID_WSKYRIMCAVERN = 1161
RDL.ZONEID_VVARDENFELL = 849
RDL.ZONEID_SUMMERSET = 1011
RDL.ZONEID_ARTAEUM =	1027
RDL.ZONEID_NELSWEYR = 1086
RDL.ZONEID_CYRODIIL = 181
RDL.ZONEID_IMPERIALCITY = 584
RDL.ZONEID_RIFT = 103
RDL.ZONEID_EASTMARCH = 101
RDL.ZONEID_THEREACH = 1207
RDL.ZONEID_THEREACHCAVERN = 1208
RDL.ZONEID_BLACKWOOD = 1261
RDL.ZONEID_DESHAAN = 57
RDL.ZONEID_SHADOWFEN = 117
RDL.ZONEID_BALFOYEN = 281
RDL.ZONEID_COLDHARBOUR = 347
RDL.ZONEID_CRAGLORN = 888
RDL.ZONEID_GLENUMBRA = 3
RDL.ZONEID_DEADLANDS = 1286
RDL.ZONEID_STONEFALLS = 41
RDL.ZONEID_AURIDON = 381
RDL.ZONEID_HIGHISLE = 1318
RDL.ZONEID_STORMHAVEN = 19
RDL.ZONEID_MALABALTOR = 58
RDL.ZONEID_REAPERSMARCH = 382
RDL.ZONEID_ALIKRDESERT = 104
RDL.ZONEID_GRAHTWOOD = 383
RDL.ZONEID_GALEN = 1383
RDL.ZONEID_RIVENSPIRE = 20



-- Fake Zoneids
RDL.ZONEID_ALLZONES = 101010
RDL.ZONEID_BGS = 101011
RDL.ZONEID_ARTAEUM_SUMMERSET = 101012
RDL.ZONEID_EASTMARCH_RIFT = 101013
RDL.ZONEID_CYRODIIL_IMPERIALCITY = 101014
RDL.ZONEID_THEREACH_WSKYRIM = 101015
RDL.ZONEID_UNKNOWN = 101016
RDL.ZONEID_GALEN_HIGHISLE = 101017

RDL.ZONENAME_SPECIAL = {
	[RDL.ZONEID_ALLZONES] = RDL.ZONENAME_ALLZONES,
	[RDL.ZONEID_BGS] = RDL.ZONENAME_BGS,
	[RDL.ZONEID_ARTAEUM_SUMMERSET] = ZO_CachedStrFormat("<<C:1>>, <<C:2>>",GetZoneNameById(RDL.ZONEID_ARTAEUM),GetZoneNameById(RDL.ZONEID_SUMMERSET)),
	[RDL.ZONEID_EASTMARCH_RIFT] = ZO_CachedStrFormat("<<C:1>>, <<C:2>>",GetZoneNameById(RDL.ZONEID_EASTMARCH),GetZoneNameById(RDL.ZONEID_RIFT)),
	[RDL.ZONEID_CYRODIIL_IMPERIALCITY] = ZO_CachedStrFormat("<<C:1>>, <<C:2>>",GetZoneNameById(RDL.ZONEID_CYRODIIL),GetZoneNameById(RDL.ZONEID_IMPERIALCITY)),
	[RDL.ZONEID_THEREACH_WSKYRIM] = ZO_CachedStrFormat("<<C:1>>, <<C:2>>",GetZoneNameById(RDL.ZONEID_THEREACH),GetZoneNameById(RDL.ZONEID_WSKYRIM)),
	[RDL.ZONEID_UNKNOWN] = RDL.LOCDATA_ZONENAME_UNKNOWN,
	[RDL.ZONEID_GALEN_HIGHISLE] = ZO_CachedStrFormat("<<C:1>>, <<C:2>>",GetZoneNameById(RDL.ZONEID_GALEN),GetZoneNameById(RDL.ZONEID_HIGHISLE)),
}



RDL.ZONETYPE_BASE = 1
RDL.ZONETYPE_DLC = 2
RDL.ZONETYPE_CHAPTER = 3


	
RDL.zoneType = {	
	[RDL.ZONEID_THEREACH] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_SELSWEYR] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_MURKMIRE] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_HEWSBANE] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_GOLDCOAST] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_CLOCKWORKCITY] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_WROTHGAR] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_WSKYRIM] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_VVARDENFELL] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_SUMMERSET] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_ARTAEUM] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_NELSWEYR] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_BLACKWOOD] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_DEADLANDS] = RDL.ZONETYPE_DLC,
	[RDL.ZONEID_HIGHISLE] = RDL.ZONETYPE_CHAPTER,
	[RDL.ZONEID_GALEN] = RDL.ZONETYPE_DLC,
}


RDL.DEFAULT_TEXT = ZO_ColorDef:New(0.4627, 0.737, 0.7647, 1) -- scroll list row text color
RDL.GREEN_TEXT = ZO_ColorDef:New("2DC50E")
RDL.BLUE_TEXT = ZO_ColorDef:New("3A92FF")
RDL.PURPLE_TEXT = ZO_ColorDef:New("A02EF7")
RDL.GOLD_TEXT = ZO_ColorDef:New("CCAA1A")
RDL.ORANGE_TEXT = ZO_ColorDef:New("E58B27")
RDL.YELLOW_TEXT = ZO_ColorDef:New("FFFF66")
RDL.RED_TEXT = ZO_ColorDef:New("FF6666")

-- list of antiquities that come from Group Dungeons
RDL.isGroupDungeon = {
	[68] = true,
	[69] = true,
	[74] = true,
	[116] = true,
	[122] = true,
	[127] = true,
	[136] = true,
	[138] = true,
	[254] = true,
	[289] = true,
	[341] = true,
	[342] = true,
	[386] = true,
	[389] = true,
	[392] = true,
	[398] = true,
	[443] = true,
	[448] = true,
	[449] = true,
	[531] = true,
	[533] = true,
	[546] = true,
	[549] = true,
	[554] = true,
	[557] = true,
	[583] = true,
--	[] = true,
}

-- GroupDungeonActivityID (normal) -> AntiquityId  
RDL.ActivityId2AntiquityId = {
	[3] = 138,   -- SC1
	[5] = 74,    -- DC1
	[7] = 122,   -- EH1
	[8] = 254,   -- AC
	[9] = 136,   -- COH1
	[11] = 116,	 -- DFK
	[12] = 68,   -- VF
	[15] = 127,  -- BHH
	[308] = 69,	 -- DC2
	[435] = 289, -- DOM
	[317] = 341, -- COH2
	[4] = 342,   -- BC1
	[17] = 386,  -- VoM
	[316] = 389, -- SC2
	[293] = 392, -- RoM
	[295] = 398, -- CoS
	[4] = 443, -- BCI
	[591] = 449, -- BDV
	[368] = 448, -- FKH
	[289] = 466, --IC
	[496] = 464, --LOM
	[494] = 463, -- MF
	[300] = 531, -- BC2
	[601] = 533, -- SRR
	[6] = 546, -- WRS1
	[22] = 549, -- WRS2
	[10] = 544, -- CoA1
	[18] = 583, -- FG2
	[613] = 557, -- BS
--	[] = , --
}

-- Leads with find location different from scry location: LeadId -> FoundZoneID
RDL.FindScryDifferentZones = {
[99] = RDL.ZONEID_ALLZONES,
[100] = RDL.ZONEID_ALLZONES,	
[101] = RDL.ZONEID_ALLZONES,
[114] = RDL.ZONEID_ARTAEUM_SUMMERSET,	
[119] = RDL.ZONEID_CYRODIIL,	
[134] = RDL.ZONEID_IMPERIALCITY,	
[140] = RDL.ZONEID_IMPERIALCITY,	
[253] = RDL.ZONEID_ALLZONES,	
[258] = RDL.ZONEID_CYRODIIL,	
[278] = RDL.ZONEID_IMPERIALCITY,	
[279] = RDL.ZONEID_BGS,	
[287] = RDL.ZONEID_ALLZONES,	
[290] = RDL.ZONEID_CYRODIIL_IMPERIALCITY,	
[297] = RDL.ZONEID_CYRODIIL_IMPERIALCITY,	
[304] = RDL.ZONEID_CYRODIIL,
[305] = RDL.ZONEID_CYRODIIL,	
[306] = RDL.ZONEID_CYRODIIL,	
[316] = RDL.ZONEID_THEREACH_WSKYRIM,	
[317] = RDL.ZONEID_THEREACH_WSKYRIM,	
[318] = RDL.ZONEID_THEREACH_WSKYRIM,	
[319] = RDL.ZONEID_THEREACH_WSKYRIM,	
[320] = RDL.ZONEID_THEREACH_WSKYRIM,	
[321] = RDL.ZONEID_THEREACH_WSKYRIM,	
[322] = RDL.ZONEID_THEREACH_WSKYRIM,	
[323] = RDL.ZONEID_THEREACH_WSKYRIM,	
[324] = RDL.ZONEID_THEREACH_WSKYRIM,	
[325] = RDL.ZONEID_THEREACH_WSKYRIM,	
[326] = RDL.ZONEID_THEREACH_WSKYRIM,	
[327] = RDL.ZONEID_THEREACH_WSKYRIM,	
[328] = RDL.ZONEID_THEREACH_WSKYRIM,	
[329] = RDL.ZONEID_THEREACH_WSKYRIM,	
[382] = RDL.ZONEID_IMPERIALCITY,
[383] = RDL.ZONEID_CYRODIIL,
[384] = RDL.ZONEID_CRAGLORN,
[385] = RDL.ZONEID_CRAGLORN,
[386] = RDL.ZONEID_COLDHARBOUR,
[387] = RDL.ZONEID_THEREACH,
[388] = RDL.ZONEID_CRAGLORN,
[389] = RDL.ZONEID_GLENUMBRA,
[392] = RDL.ZONEID_SHADOWFEN,
[393] = RDL.ZONEID_SHADOWFEN,
[394] = RDL.ZONEID_MURKMIRE,
[395] = RDL.ZONEID_BALFOYEN,
[397] = RDL.ZONEID_ALLZONES,
[398] = RDL.ZONEID_SHADOWFEN,
[399] = RDL.ZONEID_SHADOWFEN,
[400] = RDL.ZONEID_DESHAAN,
[438] = RDL.ZONEID_ALLZONES,
[439] = RDL.ZONEID_BLACKWOOD,
[440] = RDL.ZONEID_STONEFALLS,
[441] = RDL.ZONEID_ALLZONES,
[443] = RDL.ZONEID_AURIDON,
[446] = RDL.ZONEID_COLDHARBOUR,
[448] = RDL.ZONEID_CRAGLORN,
[449] = RDL.ZONEID_GOLDCOAST,
[450] = RDL.ZONEID_GOLDCOAST,
[451] = RDL.ZONEID_GOLDCOAST,
[460] = RDL.ZONEID_SELSWEYR,
[461] = RDL.ZONEID_NELSWEYR,
[462] = RDL.ZONEID_NELSWEYR,
[463] = RDL.ZONEID_NELSWEYR,
[464] = RDL.ZONEID_GRAHTWOOD,
[465] = RDL.ZONEID_DEADLANDS,
[466] = RDL.ZONEID_IMPERIALCITY,
[467] = RDL.ZONEID_DEADLANDS,
[469] = RDL.ZONEID_REAPERSMARCH,
[471] = RDL.ZONEID_SUMMERSET,
[474] = RDL.ZONEID_ALIKRDESERT,
[476] = RDL.ZONEID_ALLZONES,
[479] = RDL.ZONEID_RIFT,
[480] = RDL.ZONEID_MURKMIRE,
[481] = RDL.ZONEID_STORMHAVEN,
[482] = RDL.ZONEID_GLENUMBRA,
[483] = RDL.ZONEID_MALABALTOR,
[520] = RDL.ZONEID_HIGHISLE,
[521] = RDL.ZONEID_RIVENSPIRE,
[524] = RDL.ZONEID_HIGHISLE,
[528] = RDL.ZONEID_AURIDON,
[534] = RDL.ZONEID_SUMMERSET,
[538] = RDL.ZONEID_VVARDENFELL,
[544] = RDL.ZONEID_RIVENSPIRE,
[522] = RDL.ZONEID_GALEN_HIGHISLE,
[523] = RDL.ZONEID_GALEN_HIGHISLE,
[525] = RDL.ZONEID_GALEN_HIGHISLE,
[537] = RDL.ZONEID_HIGHISLE,
[545] = RDL.ZONEID_GALEN_HIGHISLE,
--[] = RDL.,
}

RDL.isSet = {
			[RDL.FURNISHING] = false, 
			[RDL.MAJOR_ADORNMENT] = false, 
			[RDL.MOTIF_CHAPTER] = false, 
			[RDL.BODY_MARKING] = false, 
			[RDL.EMOTE] = false, 
			[RDL.HEAD_MARKING] = false, 
			[RDL.TREASURE] = false,
			[RDL.CONTAINER] = false,
			[RDL.HAT] = false,
		}

-- strange nonexisting setids returned by GetAntiquitySetId(antiquityid)
RDL.SETID_BLOODLORDS_EMBRACE = 13
RDL.SETID_THRASSIAN_STRANGLERS = 8
RDL.SETID_SNOW_TREADERS = 9
RDL.SETID_RING_OF_THE_WILD_HUNT = 10 
RDL.SETID_MALACATHS_BAND_OF_BRUTALITY = 11
RDL.SETID_TORC_OF_TONAL_CONSTANCY = 12
RDL.SETID_RING_OF_THE_PALE_ORDER = 15
RDL.SETID_PEARLS_OF_ELHNOFEY = 16
RDL.SETID_DEATH_DEALER_FETE = 18
RDL.SETID_SHAPESHIFTER_CHAIN = 19
RDL.SETID_HARPOONER_WADING_KILT = 20
RDL.SETID_GAZE_OF_SITHIS = 21
RDL.SETID_SPAULDER_OF_RUIN = 23
RDL.SETID_MARKYN_RING_OF_MAJESTY = 24
RDL.SETID_BELHARZA_BAND = 25
RDL.SETID_DAEDRIC_ENCHANTING_STATION = 26
RDL.SETID_DOV_RHA_SABATONS = 28
RDL.SETID_MORAS_WHISPERS = 29
RDL.SETID_LEFTHANDERS_WAR_GIRDLE = 30
RDL.SETID_SEASERPENTS_COIL = 31
RDL.SETID_OAKENSOAL_RING = 32
RDL.SETID_DRUIDIC_PROVISIONING_STATION = 33
RDL.SETID_FAUN_LARK_CLADDING = 34
RDL.SETID_STORMWEAVER_CAVORT = 35
RDL.SETID_SYRABANE_WARD = 36
RDL.SETID_FORREST_SPIRIT = 37
RDL.SETID_DRUIDIC_MUSIC_BOX = 38
RDL.SETID_SHIPBUILDER_DRAFTING_TABLE = 39
RDL.SETID_CRYPTCANON_VESTMENTS = 40
RDL.SETID_ESOTERIC_ENVIRONMENT_GREAVES = 41
RDL.SETID_VELOTHI_URMAGE_AMULET = 43
RDL.SETID_SPORE_SAVANT_BODYMARKS = 44
RDL.SETID_SPORE_SAVANT_FACEMARKS = 45
RDL.SETID_APOCRYPHAL_WELL = 46
RDL.SETID_TRIFOLD_MIRROR_OF_ALTERNATIVES = 47
RDL.SETID_TELVANNI_ALCHEMY_STATION = 48
RDL.SETID_MUSICBOX_GLYPHIC_SECRETS = 49


-- itemids taken from libsets (so we can get Set Bonus with ZOS functions already localized
RDL.SETID_2_ITEMID = {
	[RDL.SETID_THRASSIAN_STRANGLERS] = 164291, 			-- realsetid = 501
	[RDL.SETID_RING_OF_THE_WILD_HUNT] = 163052, 		-- 503
	[RDL.SETID_TORC_OF_TONAL_CONSTANCY] = 163451,		-- 505
	[RDL.SETID_SNOW_TREADERS] = 165879, 				-- 519,
	[RDL.SETID_MALACATHS_BAND_OF_BRUTALITY] = 165880, 	-- 520,
	[RDL.SETID_BLOODLORDS_EMBRACE] =	165899, 		-- 521,
	[RDL.SETID_RING_OF_THE_PALE_ORDER] = 171436,
	[RDL.SETID_PEARLS_OF_ELHNOFEY] = 171437,
	[RDL.SETID_DEATH_DEALER_FETE] = 175527,
	[RDL.SETID_SHAPESHIFTER_CHAIN] = 175528,
	[RDL.SETID_HARPOONER_WADING_KILT] = 175524,
	[RDL.SETID_GAZE_OF_SITHIS] = 175525,
	[RDL.SETID_SPAULDER_OF_RUIN] = 181695,  -- 627
	[RDL.SETID_MARKYN_RING_OF_MAJESTY] = 182208, -- 625
	[RDL.SETID_BELHARZA_BAND] = 182209,  -- 626
	[RDL.SETID_DOV_RHA_SABATONS] = 187655, -- 655
	[RDL.SETID_MORAS_WHISPERS] = 187654, -- 654
	[RDL.SETID_LEFTHANDERS_WAR_GIRDLE] = 187656, -- 656
	[RDL.SETID_SEASERPENTS_COIL] = 187657, -- 657
	[RDL.SETID_OAKENSOAL_RING] = 187658, -- 658
	[RDL.SETID_FAUN_LARK_CLADDING] = 190886, --674
	[RDL.SETID_STORMWEAVER_CAVORT] = 190887, --675
	[RDL.SETID_SYRABANE_WARD] = 190888, --676
	[RDL.SETID_CRYPTCANON_VESTMENTS] = 194509,  --691
	[RDL.SETID_ESOTERIC_ENVIRONMENT_GREAVES] = 194510,  --692
	[RDL.SETID_VELOTHI_URMAGE_AMULET] = 194512, --694
}


-- DROPDOWN Menu index of fixed entries
RDL_DROPDOWN_MAJOR_CANFIND = 1
RDL_DROPDOWN_MAJOR_CANSCRY = 2
RDL_DROPDOWN_MAJOR_MISSINGCODEX = 3
RDL_DROPDOWN_MAJOR_NEVERDUGOUT = 4
RDL_DROPDOWN_MAJOR_ACTIONABLE = 5
RDL_DROPDOWN_MAJOR_ALL = 6
RDL_DROPDOWN_MAJOR_GROUPDUNGEONS = 7 
RDL_DROPDOWN_MAJOR_LATESTDLC = 8
RDL_DROPDOWN_ZONE_ALL = 1
RDL_DROPDOWN_ZONE_CURRENT = 2
RDL_DROPDOWN_ZONE_LATESTDLC = 3
RDL_DROPDOWN_ZONE_NODLC = 4
RDL_DROPDOWN_SETTYPE_ALL = 1
RDL_DROPDOWN_SETTYPE_NOOBVIOUS = 2
RDL_DROPDOWN_SETTYPE_MULTIPART = 3

