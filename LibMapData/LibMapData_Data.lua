local lib = _G["LibMapData"]

LIBMAPDATA_TAMRIEL_PSEUDOMAPINDEX = 1
LIBMAPDATA_GLENUMBRA_PSEUDOMAPINDEX = 2
LIBMAPDATA_RIVENSPIRE_PSEUDOMAPINDEX = 3
LIBMAPDATA_STORMHAVEN_PSEUDOMAPINDEX = 4
LIBMAPDATA_ALIKR_DESERT_PSEUDOMAPINDEX = 5
LIBMAPDATA_BANGKORAI_PSEUDOMAPINDEX = 6
LIBMAPDATA_GRAHTWOOD_PSEUDOMAPINDEX = 7
LIBMAPDATA_MALABAL_TOR_PSEUDOMAPINDEX = 8
LIBMAPDATA_SHADOWFEN_PSEUDOMAPINDEX = 9
LIBMAPDATA_DESHAAN_PSEUDOMAPINDEX = 10
LIBMAPDATA_STONEFALLS_PSEUDOMAPINDEX = 11
LIBMAPDATA_THE_RIFT_PSEUDOMAPINDEX = 12
LIBMAPDATA_EASTMARCH_PSEUDOMAPINDEX = 13
LIBMAPDATA_CYRODIIL_PSEUDOMAPINDEX = 14
LIBMAPDATA_AURIDON_PSEUDOMAPINDEX = 15
LIBMAPDATA_GREENSHADE_PSEUDOMAPINDEX = 16
LIBMAPDATA_REAPERS_MARCH_PSEUDOMAPINDEX = 17
LIBMAPDATA_BAL_FOYEN_PSEUDOMAPINDEX = 18
LIBMAPDATA_STROS_MKAI_PSEUDOMAPINDEX = 19
LIBMAPDATA_BETNIKH_PSEUDOMAPINDEX = 20
LIBMAPDATA_KHENARTHIS_ROOST_PSEUDOMAPINDEX = 21
LIBMAPDATA_BLEAKROCK_ISLE_PSEUDOMAPINDEX = 22
LIBMAPDATA_COLDHARBOUR_PSEUDOMAPINDEX = 23
LIBMAPDATA_THE_AURBIS_PSEUDOMAPINDEX = 24
LIBMAPDATA_CRAGLORN_PSEUDOMAPINDEX = 25
LIBMAPDATA_IMPERIAL_CITY_PSEUDOMAPINDEX = 26
LIBMAPDATA_WROTHGAR_PSEUDOMAPINDEX = 27
LIBMAPDATA_HEWS_BANE_PSEUDOMAPINDEX = 28
LIBMAPDATA_GOLD_COAST_PSEUDOMAPINDEX = 29
LIBMAPDATA_VVARDENFELL_PSEUDOMAPINDEX = 30
LIBMAPDATA_CLOCKWORK_CITY_PSEUDOMAPINDEX = 31
LIBMAPDATA_SUMMERSET_PSEUDOMAPINDEX = 32
LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX = 33
LIBMAPDATA_MURKMIRE_PSEUDOMAPINDEX = 34
LIBMAPDATA_NORG_TZEL_PSEUDOMAPINDEX = 35
LIBMAPDATA_NORTHERN_ELSWEYR_PSEUDOMAPINDEX = 36
LIBMAPDATA_SOUTHERN_ELSWEYR_PSEUDOMAPINDEX = 37
LIBMAPDATA_WESTERN_SKYRIM_PSEUDOMAPINDEX = 38
LIBMAPDATA_BLACKREACH_GREYMOOR_CAVERNS_PSEUDOMAPINDEX = 39
LIBMAPDATA_BLACKREACH_PSEUDOMAPINDEX = 40
LIBMAPDATA_BLACKREACH_ARKTHZAND_CAVERN_PSEUDOMAPINDEX = 41
LIBMAPDATA_THE_REACH_PSEUDOMAPINDEX = 42
LIBMAPDATA_BLACKWOOD_PSEUDOMAPINDEX = 43
-- mapsData is fargraveData rather then shamblesData for 44
LIBMAPDATA_FARGRAVE_PSEUDOMAPINDEX = 44
LIBMAPDATA_THE_DEADLANDS_PSEUDOMAPINDEX = 45
LIBMAPDATA_HIGH_ISLE_PSEUDOMAPINDEX = 46
LIBMAPDATA_FARGRAVE_CITY_PSEUDOMAPINDEX = 47
LIBMAPDATA_GALEN_PSEUDOMAPINDEX = 48
LIBMAPDATA_TELVANNI_PENINSULA_PSEUDOMAPINDEX = 49
LIBMAPDATA_APOCRYPHA_PSEUDOMAPINDEX = 50

lib.tamrielData = {
  ["subZones"] = { 108, },
  ["dungeons"] = { },
  [108] = {
    ["mapTexture"] = "guildmaps/eyevea_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_TAMRIEL_PSEUDOMAPINDEX,
  },
}

lib.glenumbraData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [1] = {
      ["Impresario"] = {
        x = 0.3420265614,
        y = 0.7411329746,
      },
      ["Chef_Donolon"] = {
        x = 0.2082464247,
        y = 0.7187666893,
      },
    },
  },
}

lib.rivenspireData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.stormhavenData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.alikr_DesertData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.bangkoraiData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.grahtwoodData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.malabal_TorData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.shadowfenData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.deshaanData = {
  ["subZones"] = { },
  ["dungeons"] = { 118, 1152, 1153 },
  ["events"] = { },
  [118] = {
    ["mapTexture"] = "deshaan/darkshadecaverns_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_DESHAAN_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0430215001,
      x = 0.7816408277,
      y = 0.5785392523,
    },
  },
  [1152] = {
    ["mapTexture"] = "deshaan/darkshadecaverns_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_DESHAAN_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0430215001,
      x = 0.7816408277,
      y = 0.5785392523,
    },
  },
  -- not the main entrance, have not been here yet
  [1153] = {
    ["pseudoMapIndex"] = LIBMAPDATA_DESHAAN_PSEUDOMAPINDEX,
  },
  [2042] = {
    ["mapTexture"] = "deshaan/cauldronmapboss5_0",
    ["pseudoMapIndex"] = LIBMAPDATA_DESHAAN_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0160155036,
      x = 0.0557703860,
      y = 0.5129439831,
    },
  },
}

lib.stonefallsData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [7] = {
      ["Impresario"] = {
        x = 0.9201570153,
        y = 0.4024004340,
      },
      ["Chef_Donolon"] = {
        x = 0.7826786637,
        y = 0.2969335913,
      },
      ["Witchmother Olyve"] = {
        x = 0.4950504899,
        y = 0.7059394121,
      },
      ["Witchmother Taerma"] = {
        x = 0.4963544607,
        y = 0.7065058946,
      },
    },
  },
}

lib.the_RiftData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.eastmarchData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [61] = {
      ["Petronius Galenus"] = {
        x = 0.48735749721527,
        y = 0.37827250361443,
      },
      ["Breda"] = {
        x = 0.48691499233246,
        y = 0.38149499893188,
      },
      ["Selvari Abello"] = {
        x = 0.48738500475883,
        y = 0.38356500864029,
      },
      ["Raeififeh"] = {
        x = 0.48627999424934,
        y = 0.37936249375343,
      },
    },
  },
}

lib.cyrodiilData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.auridonData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [143] = {
      ["Impresario"] = {
        x = 0.6482877135,
        y = 0.8675177097,
      },
      ["Chef_Donolon"] = {
        x = 0.6562538146,
        y = 0.9370744824,
      },
    },
  },
}

lib.greenshadeData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.reapers_MarchData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
  [997] = {
    ["mapTexture"] = "reapersmarch/maw_of_lorkaj_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_REAPERS_MARCH_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0085498988,
      x = 0.2280121892,
      y = 0.7320250272,
    },
  },
}

lib.bal_FoyenData = {
  ["subZones"] = { 56, },
  ["dungeons"] = { 713, },
  ["events"] = { },
  [56] = {
    ["mapTexture"] = "stonefalls/dhalmora_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BAL_FOYEN_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.2375039756,
      x = 0.4718720018,
      y = 0.4531199932,
    },
  },
  [713] = {
    ["mapTexture"] = "balfoyen/smugglertunnel_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BAL_FOYEN_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.2375039756,
      x = 0.4718720018,
      y = 0.4531199932,
    },
  },
}

lib.stros_MKaiData = {
  ["subZones"] = { 530, },
  ["dungeons"] = { 247, 295, 296, },
  ["events"] = { },
  [530] = {
    ["pseudoMapIndex"] = LIBMAPDATA_STROS_MKAI_PSEUDOMAPINDEX,
    ["mapTexture"] = "glenumbra/porthunding_base_0",
    ["mapScale"] = {
      zoom_factor = 0.4183864891,
      x = 0.4483701884,
      y = 0.2100436538,
    },
  },
  [247] = {
    ["pseudoMapIndex"] = LIBMAPDATA_STROS_MKAI_PSEUDOMAPINDEX,
    ["mapTexture"] = "glenumbra/bthzark_base_0",
    ["mapScale"] = {
      zoom_factor = 0.1503042280,
      x = 0.1867931485,
      y = 0.4390945136,
    },
  },
  [295] = {
    ["pseudoMapIndex"] = LIBMAPDATA_STROS_MKAI_PSEUDOMAPINDEX,
    ["mapTexture"] = "glenumbra/goblinminesstart_base_0",
    ["mapScale"] = {
      zoom_factor = 0.1095895171,
      x = 0.6883449554,
      y = -0.0239869542,
    },
  },
  [296] = {
    ["pseudoMapIndex"] = LIBMAPDATA_STROS_MKAI_PSEUDOMAPINDEX,
    ["mapTexture"] = "glenumbra/goblinminesend_base_0",
    ["mapScale"] = {
      zoom_factor = 0.1712402105,
      x = 0.5171047449,
      y = 0.0753274559,
    },
  },
}

lib.betnikhData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
  [649] = {
    ["pseudoMapIndex"] = LIBMAPDATA_BETNIKH_PSEUDOMAPINDEX,
    ["mapTexture"] = "glenumbra/stonetoothfortress_base_0",
    ["mapScale"] = {
      zoom_factor = 0.3335171044,
      x = 0.3742568195,
      y = 0.3294342160,
    },
  },
}

lib.khenarthis_RoostData = {
  ["subZones"] = { 567, },
  ["dungeons"] = { 605, 329, },
  ["events"] = { },
  [567] = {
    ["pseudoMapIndex"] = LIBMAPDATA_KHENARTHIS_ROOST_PSEUDOMAPINDEX,
    ["mapTexture"] = "auridon/mistral_base_0",
    ["mapScale"] = {
      zoom_factor = 0.2719750106,
      x = 0.3891499936,
      y = 0.3125,
    },
  },
  [605] = {
    ["pseudoMapIndex"] = LIBMAPDATA_KHENARTHIS_ROOST_PSEUDOMAPINDEX,
    ["mapTexture"] = "auridon/hazikslair_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0918000340,
      x = 0.6913999915123,
      y = 0.38135001063347,
    },
  },
  [329] = {
    ["pseudoMapIndex"] = LIBMAPDATA_KHENARTHIS_ROOST_PSEUDOMAPINDEX,
    ["mapTexture"] = "auridon/templeofthemourningspring_base_0",
    ["mapScale"] = {
      zoom_factor = 0.1640500426,
      x = 0.7446249723,
      y = 0.4790000021,
    },
  },
}

lib.bleakrock_IsleData = {
  ["subZones"] = { 8, },
  ["dungeons"] = { 87, 88, 726, },
  ["events"] = { },
  [8] = {
    ["pseudoMapIndex"] = LIBMAPDATA_BLEAKROCK_ISLE_PSEUDOMAPINDEX,
    ["mapTexture"] = "bleakrock/bleakrockvillage_base_0",
    ["mapScale"] = {
      zoom_factor = 0.3027249574,
      x = 0.2955639958,
      y = 0.4459442198,
    },
  },
  [87] = {
    ["pseudoMapIndex"] = LIBMAPDATA_BLEAKROCK_ISLE_PSEUDOMAPINDEX,
    ["mapTexture"] = "stonefalls/orkeyshollow_base_0",
    ["mapScale"] = {
      zoom_factor = 0.2217997610,
      x = 0.3898183405,
      y = 0.0246092099,
    },
  },
  [88] = {
    ["pseudoMapIndex"] = LIBMAPDATA_BLEAKROCK_ISLE_PSEUDOMAPINDEX,
    ["mapTexture"] = "stonefalls/hozzinsfolley_base_0",
    ["mapScale"] = {
      zoom_factor = 1.0000000027649,
      x = -0.00011784114758,
      y = -0.00011784114758,
    },
  },
  [726] = {
    ["pseudoMapIndex"] = LIBMAPDATA_BLEAKROCK_ISLE_PSEUDOMAPINDEX,
    ["mapTexture"] = "bleakrock/skyshroudbarrow_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0820236206,
      x = 0.7207013368,
      y = 0.3710604012,
    },
  },
}

lib.coldharbourData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.the_AurbisData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.craglornData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.imperial_CityData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.wrothgarData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.hews_BaneData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.gold_CoastData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.vvardenfellData = {
  ["subZones"] = { },
  ["dungeons"] = { 1162, 1310, },
  ["events"] = {
    [1060] = {
      ["Impresario"] = {
        x = 0.4671077430,
        y = 0.8333740830,
      },
    },
  },
  [1162] = {
    ["pseudoMapIndex"] = LIBMAPDATA_VVARDENFELL_PSEUDOMAPINDEX,
    ["mapTexture"] = "vvardenfell/nchuleft_base_0",
    ["mapScale"] = {
      x = 0.6046329141,
      y = 0.3318561316,
      zoom_factor = 0.0031403303,
    },
  },
  [1310] = {
    ["pseudoMapIndex"] = LIBMAPDATA_VVARDENFELL_PSEUDOMAPINDEX,
    ["mapTexture"] = "vvardenfell/nchuleftingth1_base_0",
    ["mapScale"] = {
      x = 0.6638011932,
      zoom_factor = 0.0039404035,
      y = 0.6520555615,
    },
  },
}

lib.clockwork_CityData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.summersetData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [1349] = {
      ["Impresario"] = {
        x = 0.2842602431,
        y = 0.5381632447,
      },
    },
  },
}

lib.artaeumData = {
  ["subZones"] = { },
  ["dungeons"] = { 1475, 1476, 1488, 1489, 1490, 1493, 1503, },
  ["events"] = { },
  [1475] = {
    ["pseudoMapIndex"] = LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX,
    ["mapTexture"] = "summerset/traitorsvault04_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0073818266,
      x = 0.3961500227,
      y = 0.4466728270,
    },
  },
  [1476] = {
    ["pseudoMapIndex"] = LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX,
    ["mapTexture"] = "summerset/dreamingcave02_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0348578095,
      x = 0.6414873004,
      y = 0.2571611404,
    },
  },
  [1488] = {
    ["pseudoMapIndex"] = LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX,
    ["mapTexture"] = "summerset/dreamingcave03_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0216386914,
      x = 0.6568168401,
      y = 0.2631108462,
    },
  },
  [1493] = {
    ["pseudoMapIndex"] = LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX,
    ["mapTexture"] = "summerset/collegeofpsijicsruins_btm_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0160962939,
      x = 0.5573176145,
      y = 0.4827489554,
    },
  },
  [1503] = {
    ["pseudoMapIndex"] = LIBMAPDATA_ARTAEUM_PSEUDOMAPINDEX,
    ["mapTexture"] = "summerset/collegeofpsijicsruins_base_0",
    ["mapScale"] = {
      zoom_factor = 0.0160962939,
      x = 0.5573176145,
      y = 0.4827489554,
    },
  },
}
lib.artaeumData[1489] = lib.artaeumData[1488] -- dreamingcave03_base_0
lib.artaeumData[1490] = lib.artaeumData[1488] -- dreamingcave03_base_0

lib.murkmireData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.norg_TzelData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.northern_ElsweyrData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [1555] = {
      ["Impresario"] = {
        x = 0.7474783062,
        y = 0.3210040330,
      },
      ["Captain Samara"] = {
        x = 0.1376450359,
        y = 0.7660769820,
      },
      ["Apprentice Taz"] = {
        x = 0.1333959847,
        y = 0.7631761431,
      },
    },
  },
}

lib.southern_ElsweyrData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.western_SkyrimData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = {
    [1719] = {
      ["Impresario"] = {
        x = 0.5106408596,
        y = 0.4133806228,
      },
    },
  },
}

lib.blackreach_Greymoor_CavernsData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.blackreachData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.blackreach_Arkthzand_CavernData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.the_ReachData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.blackwoodData = {
  ["subZones"] = { 1940, 1972, 2051, 2052 },
  ["dungeons"] = { 1939, 2031, 2032 },
  ["events"] = {
    [1887] = {
      ["Impresario"] = {
        x = 0.2744835615,
        y = 0.5430571436,
      },
    },
  },
  [1940] = {
    ["mapTexture"] = "blackwood/u30_leyawiincity_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BLACKWOOD_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0998815596,
      x = 0.1879221797,
      y = 0.5008402467,
    },
  },
  [1939] = {
    ["mapTexture"] = "blackwood/arpenial_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BLACKWOOD_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0123090744,
      x = 0.3725301027,
      y = 0.2471901476,
    },
  },
  [2031] = {
    ["mapTexture"] = "blackwood/arpeniah2_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BLACKWOOD_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0123090744,
      x = 0.3725301027,
      y = 0.2471901476,
    },
  },
  [2032] = {
    ["mapTexture"] = "blackwood/arpenial3_base_0",
    ["pseudoMapIndex"] = LIBMAPDATA_BLACKWOOD_PSEUDOMAPINDEX,
    ["mapScale"] = {
      zoom_factor = 0.0123090744,
      x = 0.3725301027,
      y = 0.2471901476,
    },
  },
}
lib.artaeumData[1972] = lib.artaeumData[1940] -- u30_leyawiincity_base_0
lib.artaeumData[2051] = lib.artaeumData[1940] -- u30_leyawiincity_base_0
lib.artaeumData[2052] = lib.artaeumData[1940] -- u30_leyawiincity_base_0

lib.fargraveData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.the_DeadlandsData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.high_IsleData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.fargraveCityData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.galenData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.telvanniPeninsulaData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.apocryphaData = {
  ["subZones"] = { },
  ["dungeons"] = { },
  ["events"] = { },
}

lib.mapIndexData = {
  [1] = {
    ["mapTexture"] = "",
    ["mapIndex"] = 1,
    ["mapId"] = 27, -- 0 zoneInfo
    ["zoneIndex"] = 1,
    ["zoneName"] = "Tamriel",
    ["zoneId"] = 0, -- 2  zoneInfo
    ["mapsData"] = lib.tamrielData,
  },
  [2] = {
    ["mapTexture"] = "glenumbra/glenumbra_base_0",
    ["mapIndex"] = 2,
    ["mapId"] = 1,
    ["zoneIndex"] = 2,
    ["zoneName"] = "Glenumbra",
    ["zoneId"] = 3,
    ["mapsData"] = lib.glenumbraData,
  },
  [3] = {
    ["mapTexture"] = "rivenspire/rivenspire_base_0",
    ["mapIndex"] = 3,
    ["mapId"] = 10,
    ["zoneIndex"] = 5,
    ["zoneName"] = "Rivenspire",
    ["zoneId"] = 20,
    ["mapsData"] = lib.rivenspireData,
  },
  [4] = {
    ["mapTexture"] = "stormhaven/stormhaven_base_0",
    ["mapIndex"] = 4,
    ["mapId"] = 12,
    ["zoneIndex"] = 4,
    ["zoneName"] = "Stormhaven",
    ["zoneId"] = 19,
    ["mapsData"] = lib.stormhavenData,
  },
  [5] = {
    ["mapTexture"] = "alikr/alikr_base_0",
    ["mapIndex"] = 5,
    ["mapId"] = 30,
    ["zoneIndex"] = 17,
    ["zoneName"] = "Alik'r Desert",
    ["zoneId"] = 104,
    ["mapsData"] = lib.alikr_DesertData,
  },
  [6] = {
    ["mapTexture"] = "bangkorai/bangkorai_base_0",
    ["mapIndex"] = 6,
    ["mapId"] = 20,
    ["zoneIndex"] = 14,
    ["zoneName"] = "Bangkorai",
    ["zoneId"] = 92,
    ["mapsData"] = lib.bangkoraiData,
  },
  [7] = {
    ["mapTexture"] = "grahtwood/grahtwood_base_0",
    ["mapIndex"] = 7,
    ["mapId"] = 9,
    ["zoneIndex"] = 180,
    ["zoneName"] = "Grahtwood",
    ["zoneId"] = 383,
    ["mapsData"] = lib.grahtwoodData,
  },
  [8] = {
    ["mapTexture"] = "malabaltor/malabaltor_base_0",
    ["mapIndex"] = 8,
    ["mapId"] = 22,
    ["zoneIndex"] = 11,
    ["zoneName"] = "Malabal Tor",
    ["zoneId"] = 58,
    ["mapsData"] = lib.malabal_TorData,
  },
  [9] = {
    ["mapTexture"] = "shadowfen/shadowfen_base_0",
    ["mapIndex"] = 9,
    ["mapId"] = 26,
    ["zoneIndex"] = 19,
    ["zoneName"] = "Shadowfen",
    ["zoneId"] = 117,
    ["mapsData"] = lib.shadowfenData,
  },
  [10] = {
    ["mapTexture"] = "deshaan/deshaan_base_0",
    ["mapIndex"] = 10,
    ["mapId"] = 13,
    ["zoneIndex"] = 10,
    ["zoneName"] = "Deshaan",
    ["zoneId"] = 57,
    ["mapsData"] = lib.deshaanData,
  },
  [11] = {
    ["mapTexture"] = "stonefalls/stonefalls_base_0",
    ["mapIndex"] = 11,
    ["mapId"] = 7,
    ["zoneIndex"] = 9,
    ["zoneName"] = "Stonefalls",
    ["zoneId"] = 41,
    ["mapsData"] = lib.stonefallsData,
  },
  [12] = {
    ["mapTexture"] = "therift/therift_base_0",
    ["mapIndex"] = 12,
    ["mapId"] = 125,
    ["zoneIndex"] = 16,
    ["zoneName"] = "The Rift",
    ["zoneId"] = 103,
    ["mapsData"] = lib.the_RiftData,
  },
  [13] = {
    ["mapTexture"] = "eastmarch/eastmarch_base_0",
    ["mapIndex"] = 13,
    ["mapId"] = 61,
    ["zoneIndex"] = 15,
    ["zoneName"] = "Eastmarch",
    ["zoneId"] = 101,
    ["mapsData"] = lib.eastmarchData,
  },
  [14] = {
    ["mapTexture"] = "cyrodiil/ava_whole_0",
    ["mapIndex"] = 14,
    ["mapId"] = 16,
    ["zoneIndex"] = 37,
    ["zoneName"] = "Cyrodiil",
    ["zoneId"] = 181,
    ["mapsData"] = lib.cyrodiilData,
  },
  [15] = {
    ["mapTexture"] = "auridon/auridon_base_0",
    ["mapIndex"] = 15,
    ["mapId"] = 143,
    ["zoneIndex"] = 178,
    ["zoneName"] = "Auridon",
    ["zoneId"] = 381,
    ["mapsData"] = lib.auridonData,
  },
  [16] = {
    ["mapTexture"] = "greenshade/greenshade_base_0",
    ["mapIndex"] = 16,
    ["mapId"] = 300,
    ["zoneIndex"] = 18,
    ["zoneName"] = "Greenshade",
    ["zoneId"] = 108,
    ["mapsData"] = lib.greenshadeData,
  },
  [17] = {
    ["mapTexture"] = "reapersmarch/reapersmarch_base_0",
    ["mapIndex"] = 17,
    ["mapId"] = 256,
    ["zoneIndex"] = 179,
    ["zoneName"] = "Reaper's March",
    ["zoneId"] = 382,
    ["mapsData"] = lib.reapers_MarchData,
  },
  [18] = {
    ["mapTexture"] = "stonefalls/balfoyen_base_0",
    ["mapIndex"] = 18,
    ["mapId"] = 75,
    ["zoneIndex"] = 110,
    ["zoneName"] = "Bal Foyen",
    ["zoneId"] = 281,
    ["mapsData"] = lib.bal_FoyenData,
  },
  [19] = {
    ["mapTexture"] = "glenumbra/strosmkai_base_0",
    ["mapIndex"] = 19,
    ["mapId"] = 201,
    ["zoneIndex"] = 304,
    ["zoneName"] = "Stros M'Kai",
    ["zoneId"] = 534,
    ["mapsData"] = lib.stros_MKaiData,
  },
  [20] = {
    ["mapTexture"] = "glenumbra/betnihk_base_0",
    ["mapIndex"] = 20,
    ["mapId"] = 227,
    ["zoneIndex"] = 305,
    ["zoneName"] = "Betnikh",
    ["zoneId"] = 535,
    ["mapsData"] = lib.betnikhData,
  },
  [21] = {
    ["mapTexture"] = "auridon/khenarthisroost_base_0",
    ["mapIndex"] = 21,
    ["mapId"] = 258,
    ["zoneIndex"] = 306,
    ["zoneName"] = "Khenarthi's Roost",
    ["zoneId"] = 537,
    ["mapsData"] = lib.khenarthis_RoostData,
  },
  [22] = {
    ["mapTexture"] = "stonefalls/bleakrock_base_0",
    ["mapIndex"] = 22,
    ["mapId"] = 74,
    ["zoneIndex"] = 109,
    ["zoneName"] = "Bleakrock Isle",
    ["zoneId"] = 280,
    ["mapsData"] = lib.bleakrock_IsleData,
  },
  [23] = {
    ["mapTexture"] = "coldharbor/coldharbour_base_0",
    ["mapIndex"] = 23,
    ["mapId"] = 255,
    ["zoneIndex"] = 154,
    ["zoneName"] = "Coldharbour",
    ["zoneId"] = 347,
    ["mapsData"] = lib.coldharbourData,
  },
  [24] = {
    ["mapTexture"] = "",
    ["mapIndex"] = 24,
    ["mapId"] = 439, -- 0 zoneInfo
    ["zoneIndex"] = 1,
    ["zoneName"] = "The Aurbis",
    ["zoneId"] = 0, -- 2 zoneInfo
    ["mapsData"] = lib.the_AurbisData,
  },
  [25] = {
    ["mapTexture"] = "craglorn/craglorn_base_0",
    ["mapIndex"] = 25,
    ["mapId"] = 1126,
    ["zoneIndex"] = 500,
    ["zoneName"] = "Craglorn",
    ["zoneId"] = 888,
    ["mapsData"] = lib.craglornData,
  },
  [26] = {
    ["mapTexture"] = "cyrodiil/imperialcity_base_0",
    ["mapIndex"] = 26,
    ["mapId"] = 660,
    ["zoneIndex"] = 346,
    ["zoneName"] = "Imperial City",
    ["zoneId"] = 584,
    ["mapsData"] = lib.imperial_CityData,
  },
  [27] = {
    ["mapTexture"] = "wrothgar/wrothgar_base_0",
    ["mapIndex"] = 27,
    ["mapId"] = 667,
    ["zoneIndex"] = 379,
    ["zoneName"] = "Wrothgar",
    ["zoneId"] = 684,
    ["mapsData"] = lib.wrothgarData,
  },
  [28] = {
    ["mapTexture"] = "thievesguild/hewsbane_base_0",
    ["mapIndex"] = 28,
    ["mapId"] = 994,
    ["zoneIndex"] = 442,
    ["zoneName"] = "Hew's Bane",
    ["zoneId"] = 816,
    ["mapsData"] = lib.hews_BaneData,
  },
  [29] = {
    ["mapTexture"] = "darkbrotherhood/goldcoast_base_0",
    ["mapIndex"] = 29,
    ["mapId"] = 1006,
    ["zoneIndex"] = 448,
    ["zoneName"] = "Gold Coast",
    ["zoneId"] = 823,
    ["mapsData"] = lib.gold_CoastData,
  },
  [30] = {
    ["mapTexture"] = "vvardenfell/vvardenfell_base_0",
    ["mapIndex"] = 30,
    ["mapId"] = 1060,
    ["zoneIndex"] = 467,
    ["zoneName"] = "Vvardenfell",
    ["zoneId"] = 849,
    ["mapsData"] = lib.vvardenfellData,
  },
  [31] = {
    ["mapTexture"] = "clockwork/clockwork_base_0",
    ["mapIndex"] = 31,
    ["mapId"] = 1313,
    ["zoneIndex"] = 589,
    ["zoneName"] = "Clockwork City",
    ["zoneId"] = 980,
    ["mapsData"] = lib.clockwork_CityData,
  },
  [32] = {
    ["mapTexture"] = "summerset/summerset_base_0",
    ["mapIndex"] = 32,
    ["mapId"] = 1349,
    ["zoneIndex"] = 616,
    ["zoneName"] = "Summerset",
    ["zoneId"] = 1011,
    ["mapsData"] = lib.summersetData,
  },
  [33] = {
    ["mapTexture"] = "summerset/artaeum_base_0",
    ["mapIndex"] = 33,
    ["mapId"] = 1429,
    ["zoneIndex"] = 632,
    ["zoneName"] = "Artaeum",
    ["zoneId"] = 1027,
    ["mapsData"] = lib.artaeumData,
  },
  [34] = {
    ["mapTexture"] = "murkmire/murkmire_base_0",
    ["mapIndex"] = 34,
    ["mapId"] = 1484,
    ["zoneIndex"] = 407,
    ["zoneName"] = "Murkmire",
    ["zoneId"] = 726,
    ["mapsData"] = lib.murkmireData,
  },
  [35] = {
    ["mapTexture"] = "murkmire/swampisland_ext_base_0",
    ["mapIndex"] = 35,
    ["mapId"] = 1552,
    ["zoneIndex"] = 668,
    ["zoneName"] = "Norg-Tzel",
    ["zoneId"] = 1072,
    ["mapsData"] = lib.norg_TzelData,
  },
  [36] = {
    ["mapTexture"] = "elsweyr/elsweyr_base_0",
    ["mapIndex"] = 36,
    ["mapId"] = 1555,
    ["zoneIndex"] = 681,
    ["zoneName"] = "Northern Elsweyr",
    ["zoneId"] = 1086,
    ["mapsData"] = lib.northern_ElsweyrData,
  },
  [37] = {
    ["mapTexture"] = "southernelsweyr/southernelsweyr_base_0",
    ["mapIndex"] = 37,
    ["mapId"] = 1654,
    ["zoneIndex"] = 720,
    ["zoneName"] = "Southern Elsweyr",
    ["zoneId"] = 1133,
    ["mapsData"] = lib.southern_ElsweyrData,
  },
  [38] = {
    ["mapTexture"] = "skyrim/westernskryim_base_0",
    ["mapIndex"] = 38,
    ["mapId"] = 1719,
    ["zoneIndex"] = 743,
    ["zoneName"] = "Western Skyrim",
    ["zoneId"] = 1160,
    ["mapsData"] = lib.western_SkyrimData,
  },
  [39] = {
    ["mapTexture"] = "skyrim/blackreach_base_0",
    ["mapIndex"] = 39,
    ["mapId"] = 1747,
    ["zoneIndex"] = 744,
    ["zoneName"] = "Blackreach: Greymoor Caverns",
    ["zoneId"] = 1161,
    ["mapsData"] = lib.blackreach_Greymoor_CavernsData,
  },
  [40] = -- nil dungeon nil main zone
  {
    ["mapTexture"] = "",
    ["mapIndex"] = 40,
    ["mapId"] = 1782, -- 0 zoneInfo
    ["zoneIndex"] = 1,
    ["zoneName"] = "Blackreach",
    ["zoneId"] = 0, -- 2 zoneInfo
    ["mapsData"] = lib.blackreachData,
  },
  [41] = {
    ["mapTexture"] = "reach/u28_blackreach_base_0",
    ["mapIndex"] = 41,
    ["mapId"] = 1850,
    ["zoneIndex"] = 784,
    ["zoneName"] = "Blackreach: Arkthzand Cavern",
    ["zoneId"] = 1208,
    ["mapsData"] = lib.blackreach_Arkthzand_CavernData,
  },
  [42] = {
    ["mapTexture"] = "reach/reach_base_0",
    ["mapIndex"] = 42,
    ["mapId"] = 1814,
    ["zoneIndex"] = 783,
    ["zoneName"] = "The Reach",
    ["zoneId"] = 1207,
    ["mapsData"] = lib.the_ReachData,
  },
  [43] = {
    ["mapTexture"] = "blackwood/blackwood_base_0",
    ["mapIndex"] = 43,
    ["mapId"] = 1887,
    ["zoneIndex"] = 834,
    ["zoneName"] = "Blackwood",
    ["zoneId"] = 1261,
    ["mapsData"] = lib.blackwoodData,
  },
  [44] = {
    --[[Map name is Fargrave, zoneName is The Shambles
    This is when you are looking down at Fargrave City and The Shambles
    before you zoom in. This main map is not considered a subzone,
    The map has a mapIndex, if you zoom into the map for The Shambles it does not
    and the specific Shambles map, is considered a subzone

    Because of the unique situtaion the mapsData is fargraveData rather then shamblesData.
    If there is a need for shamblesData at a later date then it will refer to the unique
    Shambles map itself.

    The zoneName is The Shambles rather then Fargrave because that's what the game will
    return for the zoneName using the zoneIndex as well as using GetZoneNameById if we used
    the zoneId]]--
    ["mapTexture"] = "deadlands/u32_fargravezone_base_0",
    ["mapIndex"] = 44,
    ["mapId"] = 2119,
    ["zoneIndex"] = 854,
    ["zoneName"] = "The Shambles",
    ["zoneId"] = 1283,
    ["mapsData"] = lib.fargraveData,
  },
  [45] = {
    -- The Deadlands Zone, nothing to do with Fargrave
    ["mapTexture"] = "deadlands/u32deadlandszone_base_0",
    ["mapIndex"] = 45,
    ["mapId"] = 2021,
    ["zoneIndex"] = 857,
    ["zoneName"] = "The Deadlands",
    ["zoneId"] = 1286,
    ["mapsData"] = lib.the_DeadlandsData,
  },
  [46] = {
    ["mapTexture"] = "systres/u34_systreszone_base_0",
    ["mapIndex"] = 46,
    ["mapId"] = 2114,
    ["zoneIndex"] = 883,
    ["zoneName"] = "High Isle",
    ["zoneId"] = 1318,
    ["mapsData"] = lib.high_IsleData,
  },
  [47] = {
    -- Map name is Fargrave City District
    -- zoneName is Fargrave
    -- This is when you are looking at the Fargrave City District itself
    ["mapTexture"] = "deadlands/u32_fargrave_base_0",
    ["mapIndex"] = 47,
    ["mapId"] = 2035,
    ["zoneIndex"] = 853,
    ["zoneName"] = "Fargrave",
    ["zoneId"] = 1282,
    ["mapsData"] = lib.fargraveCityData,
  },
  [48] = {
    ["mapTexture"] = "galen/u36_galenisland_base_0",
    ["mapIndex"] = 48,
    ["mapId"] = 2212,
    ["zoneIndex"] = 928,
    ["zoneName"] = "Galen",
    ["zoneId"] = 1383,
    ["mapsData"] = lib.galenData,
  },
        [49] =
        {
            ["mapTexture"] = "Art/maps/telvanni/u38_telvannipeninsula_base_0.dds",
            ["mapIndex"] = 49,
            ["mapId"] = 2274,
            ["zoneIndex"] = 958,
            ["zoneName"] = "Telvanni Peninsula",
            ["zoneId"] = 1414,
    ["mapsData"] = lib.telvanniPeninsulaData,
        },
        [50] =
        {
            ["mapTexture"] = "Art/maps/apocrypha/u38_apocrypha_base_0.dds",
            ["mapIndex"] = 50,
            ["mapId"] = 2275,
            ["zoneIndex"] = 957,
            ["zoneName"] = "Apocrypha",
            ["zoneId"] = 1413,
    ["mapsData"] = lib.apocryphaData,
        },
}
