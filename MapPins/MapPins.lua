--MapPins - The Elder Scrolls Online addon by Hoft, active support of art1ink and many players that helps with a new pins and localizations.
--Adds additional pins on your ingame map. Was made to work the fast as posible and with minimal memory usage.
--Supports CustomCompassPins, that can be installed separately.
--Apologize for the "one file" format. This was made to use all data and functions as local (stupid views of the author to safety and memory usage).
--Slash commands: /pinsize 16-40 - sets a size of the pins. /loc - receives current player map and coords. /loc2 - receives player waypoint coords.
--Full instruction how you can help to add new pins is here (ru, en version): https://forum.bandits-clan.ru/topic/75303-map-pins-collecting-data/?tab=comments#comment-1198876
--Thanks for help to: GaelicCat, Gamer1986PAN, Runs, Gandalf, Kibert, Bence, Daniel, Kelly, Danzio, demidaddy, Teva, Akotar, Zym, SuppeFuss165, remosito, Telmatoscopus and other players.

local AddonName="MapPins"
local Localization={
	en={
		--Water
		Lake="Lake",Foul="Foul",River="River",Salt="Salt",Oily="Oily",Mystic="Mystic",Running="Running",
		--Portals
		Portals="Portals",Celestial_Rifts="Celestial rifts",Dark_Fissures="Dark fissures",Oblivion_Portals="Oblivion portals",Shadow_Fissures="Shadow fissures",Lava_Lashers="Lava lashers",
		--Filters
		Delve_bosses="Delve bosses",Delve_bosses_done="Delve bosses (done)",
		Skyshards="Skyshards",Skyshards_done="Skyshards (done)",
		Lore_books="Lore books",Lore_books_done="Lore books (done)",
		Treasure_Maps="Treasure maps",
		Treasure_Chests="Treasure chests",
		Unknown_POI="Unknown POI",
		Undaunted="Undaunted",
		Time_Rifts="Time Rifts",
		Shrines="Shrines",
		Fishing_Nodes="Fishing nodes",
		Volendrung="Volendrung",
		Antiquities="Antiquities",Antiquity_Leads="Antiquity leads",
		Imperial_City="Imperial City",IC_Bosses="Bosses",IC_Respawns="Respawns",
		Cunning_Scamp="Cunning Scamp",Trove_Scamp="Trove Scamp",
		World_achievements="World achievements",
		Orsinium_world_event="Random encounters",
		Summerset_world_event="Random encounters",
		Random_Encounters="Random encounters",
		--DLC
		Orsinium="Orsinium",
		Thieves_guild="Thieves guild",
		Morrowind="Morrowind",
		Summerset="Summerset",
		Clockwork_City="Clockwork City",
		Murkmire="Murkmire",
		Elsweyr="Elsweyr",
		Blackwood="Blackwood",
		Greymoor="Greymoor",
		High_Isle="High Isle",
		Necrom="Necrom",
		},
	ru={
		--Water
		Lake="озерная вода",Foul="сточная вода",River="речная вода",Salt="морская вода",Oily="маслянистая вода",Mystic="мистическая вода",Running="речная вода",
		--Portals
		Portals="Порталы",Celestial_Rifts="Небесные разломы",Dark_Fissures="Темные трещины",Oblivion_Portals="Порталы Обливиона",Shadow_Fissures="Теневые трещины",Lava_Lashers="Лавовые запруды",
		--Filters
		Delve_bosses="Босы подземелий",Delve_bosses_done="Босы подземелий (выполнено)",
		Skyshards="Небесные осколки",Skyshards_done="Небесные осколки (выполнено)",
		Lore_books="Книги",Lore_books_done="Книги (выполнено)",
		Treasure_Maps="Карты сокровищ",
		Treasure_Chests="Сундуки",
		Unknown_POI="Неизведанные места",
		Undaunted="Неустрашимые",
		Time_Rifts="Временные бреши",
		Shrines="Алтари",
		Fishing_Nodes="Рыбалка",
		Volendrung="Волендранг",
		Antiquities="Древности", Antiquity_Leads="Подсказки древностей",
		Imperial_City="Имперский город",
		IC_Bosses="Босы",
		IC_Respawns="Места возрождений",
		Cunning_Scamp="Хитрые скампы",
		Trove_Scamp="Рыщущие скампы",
		World_achievements="Случайные встречи",
		Orsinium_world_event="Случайные встречи",
		Summerset_world_event="Случайные встречи",
		Random_Encounters="Случайные встречи",
		--DLC
		Orsinium="Орсиниум",
		Thieves_guild="Гильдия воров",
		Morrowind="Моровинд",
		Summerset="Саммерсет",
		Clockwork_City="Заводной город",
		Murkmire="Мрачные Трясины",
		Elsweyr="Эльсвейр",
		Greymoor="Западный скайрим",
		Blackwood="Черный лес",
		High_Isle="Высокий Остров",
		Necrom="Некром",
		},
	de={--provided by Neverlands 1.89
		--Water
		Lake="Seewasser",Foul="Brackwasser",River="Flusswasser",Salt="Salzwasser",Oily="Ölwasser",Mystic="Mythenwasser",Running="Fließgewässer",
		--Portals
		Portals="Portale",Celestial_Rifts="Himmlische Risse",Dark_Fissures="Dunkle Risse",Oblivion_Portals="Oblivion Portale",Shadow_Fissures="Schattenrisse",Lava_Lashers="Lavaschlote",
		--Filters
		Delve_bosses="Anführer in Gewölben",Delve_bosses_done="Besiegte Anführer in Gewölben",
		Skyshards="Himmelsscherben",Skyshards_done="Gesammelte Himmelsscherben",
		Lore_books="Lorebücher",Lore_books_done="Gesammelte Lorebücher",
		Treasure_Maps="Schatzkarten",
		Treasure_Chests="Schatztruhen",
		Unknown_POI="Unbekannter, markanter Ort",
		Undaunted="Unerschrockene",
		Thieves_guild="Thieves Guild",
		Time_Rifts="Zeitrisse",
		Shrines="Schreine",
		Fishing_Nodes="Fischgründe",
		Clockwork_City="Clockwork City",
		Antiquities="Antiquitäten", Antiquity_Leads="Fundorte von Spuren",
		IC_Bosses="Anführer",
		IC_Respawns="Respawns",
		Cunning_Scamp="Listskampen",
		Trove_Scamp="Gierskampen",
		High_Isle="High Isle",
		World_achievements="Weltweite Errungenschaften",
		Orsinium_world_event="Zufällige Begegnungen",
		Summerset_world_event="Zufällige Begegnungen",
		Random_Encounters="Zufällige Begegnungen",
		Necrom="Necrom",
		},
	fr={
		--Water
		Lake="Lac",Foul="Sale",River="Rivière",Salt="Mer",Oily="Huile",Mystic="Mystique",Running="courante",
		--Portals
		Portals="Portails",Celestial_Rifts="Failles célestes",Dark_Fissures="Fissures noires",Oblivion_Portals="Portails d'Oblivion",Shadow_Fissures="Fissures d'ombres",Lava_Lashers="Fouetteurs de lave",
		--Filters
		Delve_bosses="Boss d'Antre",Delve_bosses_done="Boss d'Antre (fini)",
		Skyshards="Éclats célestes",Skyshards_done="Éclats célestes (fini)",
		Lore_books="Livres",Lore_books_done="Livres (fini)",
		Treasure_Maps="Cartes au trésor",
		Treasure_Chests="Coffres au trésor",
		Unknown_POI="POI inconnu",
		Undaunted="Les Indomptables",
		Time_Rifts="Failles temporelles",
		Shrines="Autels",
		Fishing_Nodes="Trous de Pêche",
		Volendrung="Volendrung",
		Antiquities="Antiquités",Antiquity_Leads="Pistes d'antiquités",
		Imperial_City="Cité impériale",IC_Bosses="Boss",IC_Respawns="Réapparitions",
		Cunning_Scamp="Galopin rusé",Trove_Scamp="Galopin avare",
		World_achievements="Succès Globaux",
		Orsinium_world_event="Rencontres aléatoires",
		Summerset_world_event="Rencontres aléatoires",
		Random_Encounters="Rencontres aléatoires",
		--DLC
		Orsinium="Orsinium",
		Thieves_guild="La Guilde des voleurs",
		Morrowind="Morrowind",
		Summerset="Le Couchant",
		Clockwork_City="La Cité mécanique",
		Murkmire="Tourbevase",
		Elsweyr="Elsweyr",
		Blackwood="Le Bois Noir",
		Greymoor="Greymoor",
		High_Isle="L'Île Haute",
		Necrom="Necrom",
		},
	br={
		--Water
		Lake="Lake",Foul="Foul",River="River",Salt="Salt",Oily="Oily",Mystic="Mystic",Running="Running",
		--Portais
		Portals="Portais",Celestial_Rifts="Fendas Celestiais",Dark_Fissures="Fendas Negras",Oblivion_Portals="Portais de Oblivion",Shadow_Fissures="Shadow Fissures",Lava_Lashers="Lava lashers",
		--Filtros
		Delve_bosses="Chefes de Masmorras",Delve_bosses_done="Chefes de Masmorras Concluidas",
		Skyshards="Fragmento Celeste",Skyshards_done="Fragmento Celeste Coletados",
		Lore_books="Livros de História",Lore_books_done="Livros de História Coletados",
		Treasure_Maps="Mapas do tesouro",
		Treasure_Chests="Baús de tesouro",
		Unknown_POI="Locais Desconhecidos",
		Undaunted="Destemidos",
		Time_Rifts="Fendas Temporais",
		Shrines="Santuários Vampiro/Lobisomem",
		Fishing_Nodes="Locais de Pesca",
		Volendrung="Volendrung",
		Antiquities="Antiguidades", Antiquity_Leads="Pistas de Antiguidades",
		Imperial_City="Cidade Imperial",
		IC_Bosses="Chefes do Mundo",
		IC_Respawns="Reaparição",
		Cunning_Scamp="Pirraça Astuto",
		Trove_Scamp="Pirraça Acumulador",
		World_achievements="Conquistas Mundiais",
		Orsinium_world_event="Eventos Aleatórios Orsinium",
		Summerset_world_event="Eventos Aleatórios Summerset",
		Random_Encounters="Encontros Aleatórios",
		--DLC
		Orsinium="Orsinium",
		Thieves_guild="Guilda dos Ladrões",
		Morrowind="Morrowind",
		Summerset="Summerset",
		Clockwork_City="Cidade Mecânica",
		Murkmire="Mangueturvo",
		Elsweyr="Elsweyr",
		Blackwood="Blackwood",
		Greymoor="Greymoor",
		High_Isle="Alta Ilha",
		Necrom="Necrom",
		},
	ua={--provided by Astaro'I, Eric_m 1.89
		--Lake="озерна вода",Foul="брудна вода",River="річкова вода",Salt="солона вода",Oily="масляниста вода",Mystic="містична вода",Running="проточна вода",--Water
		Lake="Lake",Foul="Foul",River="River",Salt="Salt",Oily="Oily",Mystic="Mystic",Running="Running",--Water
		--Portals
		Portals="Портали",Celestial_Rifts="Небесні розколини",Dark_Fissures="Темні тріщини",Oblivion_Portals="Портали Облівіона",Shadow_Fissures="Тіньові тріщини",Lava_Lashers="Лавові жерла",
		--Filters
		Delve_bosses="Боси западин",Delve_bosses_done="Боси западин (виконано)",
		Skyshards="Небесні уламки",Skyshards_done="Небесні уламки (виконано)",
		Lore_books="Книги знань",Lore_books_done="Книги знань (виконано)",
		Treasure_Maps="Карти скарбів",Treasure_Chests="Скрині зі скарбами",
		Unknown_POI="Невідома точка інтересу",
		Undaunted="Безстрашні",
		Orsinium="Орсініум",
		Thieves_guild="Гільдія крадіїв",
		Morrowind="Морровінд",
		Summerset="Саммерсет",
		Time_Rifts="Розриви часу",
		Shrines="Святині",
		Fishing_Nodes="Місце для рибалки",
		Clockwork_City="Заводне місто",
		Murkmire="Муркмайр",
		Elsweyr="Ельсвейр",
		Volendrung="Волендранг",
		Greymoor="Греймур",
		Antiquities="Антикваріат",
		Antiquity_Leads="Підказки антикваріату",
		Blackwood="Блеквуд",
		Imperial_City="Імперське місто",
		IC_Bosses="Боси Імперського міста",
		IC_Respawns="Точки відродження Імперського міста",
		Cunning_Scamp="Хитрий скамп",
		Trove_Scamp="Скамп скарбниця",
		High_Isle="Високий Острів",
		World_achievements="Світові досягнення",
		Orsinium_world_event="Світові події Орсініума",
		Summerset_world_event="Світові події Саммерсету",
		Random_Encounters="Випадкові зустрічі",
		Necrom="Necrom",
		},
	it={	--provided by windedsilver 1.91
		--Water
		Lake="Lago",Foul="Acqua Sporca",River="Fiume",Salt="Mare",Oily="Oleosa",Mystic="Mistico",Running="Fluente",
		--Portals
		Portals="Portali",Celestial_Rifts="Fenditura Celeste",Dark_Fissures="Fenditure Oscure",Oblivion_Portals="Portali Oblivion",Shadow_Fissures="Fenditure d'Ombra",Lava_Lashers="Sfiati di Lava",
		--Filters
		Delve_bosses="Boss",Delve_bosses_done="Boss Uccisi",
		Skyshards="Frammenti Celesti",Skyshards_done="Frammenti Celesti trovati",
		Lore_books="Libri Storici",Lore_books_done="Libri Storici trovati",
		Treasure_Maps="Mappe del Tesoro",
		Treasure_Chests="Forzieri del Tesoro",
		Unknown_POI="POI Sconosciuto",
		Undaunted="Temerari",
		Orsinium="Orsinium",
		Thieves_guild="Gilda dei Ladri",
		Morrowind="Morrowind",
		Summerset="Summerset",
		Time_Rifts="Fenditure Temporali",
		Shrines="Tempi",
		Fishing_Nodes="Zone di Pesca",
		Clockwork_City="Città Meccanica",
		Murkmire="Murkmire",
		Elsweyr="Elsweyr",
		Volendrung="Volendrung",
		Greymoor="Greymoor",
		Antiquities="Antichità", Antiquity_Leads="Indizi di Antichità",
		Blackwood="Blackwood",
		Imperial_City="Città Imperiale",
		IC_Bosses="Boss",
		IC_Respawns="Respawn",
		Cunning_Scamp="Furfante Astuto",
		Trove_Scamp="Furfante Raccoglitore",
		High_Isle="Isola Alta",
		World_achievements="Ricompense Globali",
		Orsinium_world_event="Incontri Casuali",
		Summerset_world_event="Incontri Casuali",
		Random_Encounters="Incontri Casuali",
		Necrom="Necrom",
		},
}
local lang=GetCVar("language.2") if not Localization[lang] then lang="en" end
local function Loc(string)
	return Localization[lang][string] or Localization[lang]["en"] or string
end

--Data base
local Bosses={
--Necrom Provided by art1ink.
u38_eggmine={{.513,.464,3620}},--Anchre Egg Mine Explorer
u38_camonnaruhn={{.587,.214,3621}},--Camonnaruhn Explorer
u38_quires_wind={{.25,.725,3622}},--Quires Wind Explorer
u38_disquiet_study={{.442,.628,3623}},--Disquiet Study Explore
U38_CorpuscleBight_01_Base_0={{.52,.113,3624}},--Fathoms Drift Explorer
u38_apogee_wind={{.53,.795,3625}},--Apogee Explorer
U38_underweave_central={
{.498,.796,3659,1},--Caz'iunes the Executioner
{.371,.191,3659,2},--Creepclaw
{.593,.35,3657},--All-Seeing Ky'zuu (Group Event)
},
U38_underweave_process02={--The Underweave Conqueror
{.327,.311,3659,3},--Qacath the Silent
},
U38_underweave_heart={{.517,.847,3659,4}},--Kynreve Kev'ni
U38_underweave_process01={{.872,.736,3659,5}},--Loremaster Trigom
u38_gorne_main_0={--Gorne Conqueror
{.579,.126,3660,1},--Stupulag
{.154,.215,3660,2},--Zygiite
{.885,.593,3660,3},--Solenm
{.6,.68,3660,4},--Staxuira
{.121,.548,3660,5},--Keeag
{.567,.421,3658},--Gorne Group Event
},
--Firesong Provided by art1ink.
u36_galenisland={
{.493,.45,3548},--Preserver of Galen Hunter
{.138,.298,3548},--Preserver of Galen Hunter
{.486,.315,3548},--Preserver of Galen Hunter
},
u36_embervine={{.252,.304,3489}},--Embervine Explorer
u36_LKH={{.583,.523,3490}},--Fauns' Thicket Explorer
--High Isle. Provided by art1ink.
u34_firepotcave={{.642,.476,3275}},--Esh'curnu the Bahemoth
u34_hauntedsepulcherint={{.353,.472,3277}},--Lord Leobet
u34_breakwatercave={{.104,.673,3276}},--Brineclaw
u34_shipwreckshoalsint={{.295,.832,3278}},--Reef Viper & Captine Ithala
u34_whalefall_cay={{.401,.303,3279}},--Jailer Mannick
u34_coralcliffsext={{.557,.718,3280}},--Madena Bracques
u34_ghosthaven={--Ghost Haven Bay Conqueror
{.478,.618,3282,3},--Captain Tuvacca
{.406,.466,3282.4},--Captain Marlay
{.484,.244,3282,5},--Captain Fauvette
},
u34_ghosthavenEXT={--Ghost Haven Bay Conqueror & Ghost Haven Bay Group Event]
{.791,.518,3281},--Hadilid Broodmother
{.575,.203,3282,2},--Razor Fangs
{.672,.801,3282,1},--Captain Altait
},
u34_TOTS_Crypt_Intt={{.51,.653,3283}},--The Crimson Mother (Crimson Coin Group Event)
u34_crimsoncoin_EXT={
{.383,.631,3284,1},--Blighted Carapace
{.551,.334,3284,2},--Anya Mouz thr Unclean
{.694,.699,3284,3},--Chillspine
{.838,.478,3284,4},--Crimson Apprentice
{.691,.245,3284,5},--Shambleback
},
--The Deadlands. Provided by art1ink.
u32_dreaded_refuge_int={{.501,.443,3135}},--The Brandfire Reformatory (Kynreeve Brosuroth)
u32_folly_delve={{.547,.451,3136}},--False Martyrs' Folly (Kurkron the Mangler)
u30_oblivion_portal={{.411,.217,3076},{.208,.599,3076},{.223,.43,3076},{.427,.454,3076},{.442,.549,3076},{.538,.485,3076},{.771,.555,3076},{.551,.706,3076},{.585,.294,3076}},--Atoll of Immolation
u30_oblivion_portal_tower={{.478,.574,3076}},
u30_oblivion_portal_boss={{.745,.493,3076}},
u32deadlandszone={{.234,.636,3197},{.465,.612,3197},{.786,.291,3197},{.619,.47,3197}},--Havocrel Spawn Locations
--Blackwood. Provided by art1ink.
u30_undertowcavern={{.501,.152,2971,1}},--Druvaakh the Smasher
u30_xanmeeroverlook_ext={{.516,.457,2971,2}},--Raj-Kall Ioraxeek
VaultDelve_INT03={{.36,.653,2971,3}},--Karzikon the Razorsworn
arpeniaH={{.166,.38,2971,4}},arpeniaH2={{.163,.38,2971,4}},arpeniaL={{.163,.38,2971,4}},arpeniaL3={{.163,.38,2971,4}},--Shadow Knight Nassuphae
u30_bloodruncave={{.289,.648,2971,5}},--Tumma-Maxath
vunalk1={{.29,.427,2971,6}},vunalk2={{.29,.427,2971,6}},--Choking Vine
ZHMain={--Zenithar's Abbey
{.354,.47,2997,1},--Grapnur the Crusher and Burthar Meatwise
{.205,.719,2997,2},--The Frigid Temptress
{.366,.174,2997,3},--Gloom-Tooth
{.546,.487,2997,4},--Arbitrator Tasellis
{.88,.535,2997,5},--Fulciinius the Bone Miser
},
ZHGroupEvent={{.613,.518,2995}},--Ra'back the Trap Master
u30_silenthalls_ext01={--The Silent Halls
{.604,.348,2996,1},--Kao'kuul
{.328,.709,2996,2},--The Silent Sentry
},
u30_silenthalls_int01={--The Silent Halls
{.229,.593,2996,3},--The Rootwhisperer
{.556,.178,2996,4},--Vor'chul the Beastbreaker
},
u30_silenthalls_int02={--The Silent Halls
{.455,.756,2996,5},--Dread Irenan
{.623,.281,2994},--Warlord Iaza
},
briarrockruins_ext={{.121,.583,2853,1,{167824,167526}}},
Gloomreach={{.287,.513,2852}},Gloomreach2={{.287,.513,2852}},Gloomreach2B={{.287,.513,2852}},Gloomreach2C={{.287,.513,2852}},Gloomreach3={{.287,.513,2852}},Gloomreach5={{.287,.513,2852}},
labyrinthian={{.812,.697,2717,1},{.842,.286,2717,2}},labyrinthianb={{.391,.572,2717,3},{.688,.408,2717,4},{.833,.598,2717,5},{.137,.516,2714}},
nchuthnkarst={{.099,.557,2718,1},{.379,.112,2718,2},{.616,.25,2718,3},{.623,.425,2718,4},{.34,.472,2718,5},{.774,.511,2715}},
frozencoast={{.715,.183,2641}},
dragonhome={{.351,.293,2640}},
chillwinddepths={{.44,.197,2639}},
shadowgreen_upper={{.304,.472,2643}},shadowgreen_lower={{.356,.484,2643,1,{160769,160733,160897,160878,160922,161122,161047}}},
thescraps={{.279,.606,2644,1,{160769,160733,160897,160878,160922,161122,161047}}},
midnightbarrow={{.631,.113,2642,1,{160769,160733,160897,160878,160922,161122,161047}}},
houseofembersoutside={{.457,.277,2557}},moonlitcove01={{.431,.42,2558}},moonlitcove02={{.431,.42,2558}},moonlitcove05={{.431,.42,2558}},
RimmenNecropolis_Base_0={{.09,.475,2441,1},{.91,.745,2441,2},{.8,.402,2441,3},{.106,.678,2441,4},{.491,.253,2441,5},{.5,.658,2444}},
orcrest_Base_0={{.54,.641,2443,1},{.275,.787,2443,2},{.601,.425,2443,3},{.429,.437,2443,4},{.39,.573,2443,5},{.781,.292,2445}},orcrest2_Base_0={{.543,.644,2443,1},{.273,.787,2443,2},{.597,.424,2443,3},{.422,.438,2443,4},{.393,.568,2443,5},{.784,.289,2445}},orcrestsewer_Base_0={{.492,.49,2443,5,{149468,149511}}},tombofserpents={{.506,.46,2399,1,{149552,149179,149325,149487,149094,149361}}},abodeofignominy={{.175,.753,2396,1,{149552,149179,149325,149487,149094,149361}}},predatorrise={{.566,.426,2397,1,{149552,149179,149325,149487,149094,149361}}},DesertWind={{.557,.18,2398,1,{149552,149179,149325,149487,149094,149361}}},DesertWind2A={{.557,.18,2398,1,{149552,149179,149325,149487,149094,149361}}},thetangle={{.454,.624,2401,1,{149552,149179,149325,149487,149094,149361}}},thescab={{.475,.191,2400,1,{149552,149179,149325,149487,149094,149361}}},
UI_Map_tsofeercavern01_0={{.778,.354,2286,1,{142439,142574,142297,142372,142643,142700}}},teethofsithis02b={{.53,.681,2287,1,{142742,142664,142397,142352,142559,142574}}},
kingshavenext={{.153,.423,2007,1}},etonnir_01={{.132,.772,2007,2}},archonsgrove={{.125,.581,2007,3}},torhamekhard_01={{.661,.16,2007,4}},torhamekhard_02={{.658,.158,2007,4}},wastencoraldale={{.61,.342,2007,5}},TraitorsVault01={{.713,.767,2007,6}},
sunhold={{.418,.157,2095,1},{.65,.421,2182,1},{.805,.763,2182,2},{.439,.803,2182,3},{.596,.376,2182,5},{.453,.265,2182,4}},
Sum_Karnwasten={{.905,.732,2096,1},{.215,.458,2181,1},{.18,.678,2181,2},{.642,.816,2181,3},{.657,.512,2181,4},{.525,.604,2181,5}},
["aba-loria"]={{.752,.632,432,1}},
aldunz={{.719,.554,416,1}},
argentmine2={{.718,.247,1299,1}},
atanazruins={{.559,.461,245,1}},
avancheznel={{.517,.551,331,1}},
badmanscave={{.72,.73,1053,1},{.59,.44,1053,2},{.43,.72,1053,3},{.53,.68,1053,4},{.18,.40,380,1}},
bahrahasgloom={{.656,.680,1355,1}},
barrowtrench={{.310,.602,559,1}},
bearclawmine={{.281,.621,225,1}},
bewan={{.569,.284,293,1}},
blackvineruins={{.549,.259,281,1}},
bloodmaynecave={{.137,.353,730,1},{.475,.386,730,2},{.392,.446,730,3}},
bonesnapruinssecret={{.596,.59,1054,1},{.66,.42,1054,2},{.44,.33,1054,3},{.33,.54,1054,4},{.28,.73,1054,5},{.50,.78,1054,6},{.40,.17,714,1}},
breakneckcave={{.271,.301,731,1},{.277,.588,731,2}},
brokenhelm={{.575,.705,330,1}},
brokentuskcave={{.340,.273,246,1}},
burrootkwamamine={{.775,.505,576,1}},
capstonecave={{.718,.166,736,1}},
caracdena={{.582,.631,553,1}},
caveoftrophies={{.568,.362,434,1}},
chidmoskaruins={{.680,.386,247,1}},
clawsstrike={{.876,.691,456,1},{.876,.691,456,1}},
coldperchcavern={{.750,.484,1298,1}},
coldrockdiggings={{.212,.826,419,1}},
corpsegarden={{.255,.416,269,1}},
crackedwoodcave={{.701,.380,742,1},{.329,.085,742,2},{.344,.356,742,3}},
molavar={{.47,.41,884,1}},
rkundzelft={{.49,.37,885,1}},
kardala={{.62,.36,888,1}},
rkhardahrk_0={{.15,.49,890,1}},
haddock={{.74,.32,891,1}},
chiselshriek={{.68,.25,892,1}},
burriedsands={{.74,.30,893,1}},
mtharnaz={{.17,.62,894,1},{.392,.549,894,1}},
balamath={{.77,.26,896,1}},
thaliasretreat={{.28,.15,899,1}},
cryptoftarishzizone={{.56,.65,900,1}},
hircineshaunt={{.21,.77,901,1}},
serpentsnest={{.49,.23,886,1}},
ilthagsundertower={{.21,.46,887,1}},
lothna={{.61,.34,889,1}},
howlingsepulchersoverland={{.78,.46,895,1}},
fearfang={{.19,.59,897,1}},
exarchsstronghold={{.40,.82,898,1}},
crestshademine={{.451,.438,227,1}},
crimsoncove={
{.597,.102,1051,6}, -- Reja Laransdottir
{.599,.76,460,1}, -- Flat Tooth (Group Challenge)
{.531,.467,1051,2}, -- Povaren One-Eye
{.343,.555,1051,4}, -- Old Strongclaw
{.682,.526,1051,5}, -- Rokut the Mauler
{.546,.314,1051,3}},  -- Yiralai the Wicked
crimsoncove02={
{.871,.292,1051,7}, -- Viro Redhands
{.687,.338,1051,1}}, -- Pilot Ostrala 
crowswood={{.37,.52,368,1},{.60,.41,368,2},{.29,.58,368,3},{.25,.86,368,4},{.56,.37,368,5},{.67,.57,379,1}},
cryptoftheexiles={{.175,.592,541,1}},
cryptwatchfort={{.461,.803,220,1}},
deadmansdrop={{.378,.713,274,1}},
delsclaim={{.803,.165,288,1}},
depravedgrotto={{.707,.580,433,1}},
desolatecave={{.802,.377,268,1}},
dessicatedcave={{.357,.248,574,1}},
divadschagrinmine={{.731,.558,414,1},{.731,.558,414,1}},
eboncrypt={{.665,.470,219,1}},
ebonmeretower={{.543,.845,329,1}},
echocave={{.280,.188,737,1}},
emberflintmine={{.425,.683,203,1}},
enduum={{.701,.088,217,1}},
entilasfolly={{.133,.453,290,1}},
erokii={{.699,.698,231,1},{.699,.698,231,1},{.699,.698,231,1}},
fardirsfolly={{.760,.159,457,1}},
farangelsdelve={{.267,.492,224,1}},
flyleafcatacombs={{.680,.193,228,1}},
forgottencrypts={{.76,.55,370,1},{.72,.27,370,2},{.56,.42,370,3},{.48,.16,370,4},{.58,.91,388,1}},
fortgreenwall={{.675,.835,332,1}},
gandranen={{.760,.606,248,1}},
garlasagea={{.593,.420,1427,1}},
gurzagsmine={{.751,.469,555,1}},
hallofthedead={{.76,.79,376,1},{.42,.90,376,2},{.24,.75,376,3},{.66,.93,376,4},{.34,.88,376,5},{.42,.22,376,6},{.76,.50,381,1}},
harridanslair={{.212,.769,558,1}},
haynotecave={{.316,.483,732,1},{.549,.193,732,2}},
hightidehollow={{.487,.290,206,1}},
hildunessecretrefuge={{.841,.277,232,1},{.841,.277,232,1},{.841,.277,232,1}},
hoarvorpit={{.681,.451,298,1}},
hrotacave={{.864,.797,1426,1}},
icehammersvault={{.472,.487,252,1}},
ilessantower={{.421,.489,215,1}},
innerseaarmature={{.262,.831,202,1}},
jaggerjaw={{.472,.112,544,1}},
jodeslight={{.520,.588,458,1},{.520,.588,458,1}},
kennelrun={{.425,.351,1297,1}},
kingscrest={{.846,.512,743,1}},
koeglinmine={{.442,.340,222,1}},
kunasdelve={{.193,.303,453,1}},
kwamacolony={{.539,.751,264,1}},
lipsandtarn={{.392,.177,738,1},{.253,.586,738,2}},
lostcity={{.42,.88,396,1},{.66,.72,396,2},{.66,.45,396,3},{.34,.58,396,4},{.46,.94,396,5},{.34,.63,707,1}},
lowerbthanuel={{.535,.426,265,1}},
malsorrastomb={{.779,.374,436,1}},
mehrunesspite={{.296,.393,292,1}},
mephalasnest={{.109,.493,205,1}},
minesofkhuras={{.327,.224,218,1}},
mobarmine={{.098,.622,578,1}},
muckvalleycavern={{.187,.690,744,1},{.782,.159,744,2},{.375,.888,744,3}},
murciensclaim={{.621,.358,540,1},{.621,.358,540,1},{.621,.358,540,1}},
narilnagaia={{.756,.618,567,1}},
nesalas={{.637,.722,573,1}},
newtcave={{.148,.319,745,1},{.611,.733,745,2}},
nisincave={{.108,.645,733,1},{.600,.601,733,2}},
norvulkruins={{.601,.675,226,1}},
obsidianscar={{.68,.75,378,1},{.56,.88,378,2},{.89,.44,378,3},{.71,.23,378,4},{.24,.39,378,5},{.59,.17,378,6},{.24,.42,378,7},{.38,.14,713,1}},
oldorsiniummap01={{.089,.926,1239,1},{.089,.926,1239,2},{.089,.926,1239,3},{.089,.926,1239,4},{.089,.926,1239,5},{.089,.926,1238,1}},
oldorsiniummap02={{.169,.851,1239,3},{.528,.489,1239,1},{.528,.489,1239,2},{.528,.489,1239,4},{.528,.489,1239,5},{.528,.489,1238,1}},
oldorsiniummap03={{.310,.891,1239,1},{.685,.875,1239,3},{.316,.044,1239,2},{.316,.044,1239,4},{.316,.044,1239,5},{.316,.044,1238,1}},
oldorsiniummap04={{.070,.521,1239,4},{.980,.655,1239,1},{.980,.655,1239,3},{.980,.655,1239,2},{.980,.655,1239,5},{.980,.655,1238,1}},
oldorsiniummap05={{.489,.271,1239,2},{.333,.959,1239,1},{.333,.959,1239,3},{.777,.663,1239,5},{.114,.295,1239,4},{.201,.205,1238,1}},
oldorsiniummap06={{.759,.571,1239,5},{.021,.669,1238,1},{.021,.669,1239,1},{.021,.669,1239,2},{.021,.669,1239,3},{.021,.669,1239,4}},
oldorsiniummap07={{.154,.741,1238,1},{.338,.958,1239,1},{.338,.958,1239,2},{.338,.958,1239,3},{.338,.958,1239,4},{.338,.958,1239,5},{.711,.987,1239,1},{.711,.987,1239,2},{.711,.987,1239,3},{.711,.987,1239,4},{.711,.987,1239,5}},
oldsordscave={{.855,.153,253,1},{.855,.153,253,1},{.855,.153,253,1}},
ondil={{.500,.270,289,1}},
onkobrakwamamine={{.643,.552,249,1}},
orcsfingerruins={{.770,.745,230,1}},
pariahcatacombs={{.307,.217,223,1}},
portdunwatch={{.611,.443,221,1},{.611,.443,221,1}},
potholecavern={{.620,.462,734,1},{.604,.697,734,2},{.537,.133,734,3}},
--quickwatercave={{.329,.443,746,1},{.402,.437,746,2}},
quickwatercave={{.401,.916,746,1},{.390,.840,746,2}},	--By Kelinmiriel
quickwaterdepths={{.183,.456,746,2}},
razakswheel={{.79,.36,1055,1},{.43,.42,1055,2},{.77,.62,1055,3},{.37,.58,1055,4},{.71,.51,1055,5},{.68,.79,1055,6},{.86,.52,708,1}},
rkindaleftoutside={{.108,.468,1236,2},{.273,.395,1236,3},{.566,.438,1235,1},{.569,.743,1236,4},{.580,.527,1236,1}},
rkindaleftint01={{.687,.789,1236,4},{.960,.487,1236,1},{.960,.487,1236,2},{.960,.487,1236,3},{.960,.487,1235,1}},
rkindaleftint02={{.518,.466,1235,1}},
redrubycave={{.379,.220,739,1},{.780,.262,739,2}},
rootsofsilvenar={{.859,.583,282,1}},
rootsunder={{.59,.60,1049,1},{.22,.56,1049,2},{.89,.45,1049,3},{.75,.46,1049,4},{.60,.75,1049,5},{.51,.34,1049,6},{.66,.17,470,1}},
rubblebutte={{.628,.459,543,1}},
rulanyilsfall={{.26,.55,1050,1},{.34,.35,1050,2},{.64,.44,1050,3},{.79,.39,1050,4},{.50,.44,1050,5},{.13,.38,1050,6},{.83,.66,445,1}},
sandblownmine={{.908,.670,420,1},{.908,.670,420,1}},
sanguinesdemesne={{.06,.51,300,1},{.81,.69,300,2},{.39,.44,300,3},{.51,.19,300,4},{.53,.28,300,5},{.85,.55,300,6},{.19,.26,372,1}},
santaki={{.358,.211,412,1}},
serpenthollowcave={{.225,.571,735,1},{.402,.267,735,2}},
shaelruins={{.751,.709,286,1}},
sharktoothgrotto1={{.165,.621,1356,1}},
sharktoothgrotto2={{.165,.621,1356,1}},
sheogorathstongue={{.214,.615,208,1},{.214,.615,208,1}},
shrineofblackworm={{.637,.706,250,1}},
shroudhearth={{.614,.518,333,1}},
silumm={{.814,.478,216,1}},
snaplegcave={{.510,.384,334,1}},
softloamcavern={{.687,.659,207,1}},
stormcragcrypt={{.795,.151,255,1}},
thebastardstomb={{.803,.735,256,1}},
thechillhollow={{.658,.409,251,1}},
thelionsden={{.66,.31,374,1},{.73,.34,374,2},{.70,.57,374,3},{.33,.22,374,4},{.82,.20,374,5},{.38,.13,374,6},{.68,.53,374,7},{.11,.87,371,1}},
theunderroot={{.339,.270,550,1}},
thefrigidgrotto={{.729,.301,254,1}},
thevilemansefirstfloor={{.36,.55,1052,2},{.69,.28,1052,3},{.69,.51,1052,4},{.33,.13,1052,5},{.47,.90,469 ,1}},
thevilemansesecondfloor={{.33,.61,1052,1},{.65,.41,1052,6}},
thibautscairn={{.218,.207,454,1}},
thukozods={{.787,.743,1300,1}},
toadstoolhollow={{.266,.306,740,5}},
toadstoolhollowlower={{.085,.527,740,1},{.279,.522,740,2},{.307,.751,740,3},{.303,.344,740,4}},
tomboftheapostates={{.616,.597,297,1}},
toothmaulgully={{.48,.78,390,1},{.24,.27,390,2},{.61,.67,390,3},{.28,.43,390,4},{.45,.63,390,5},{.48,.65,468,1}},
tribulationcrypt={{.688,.206,229,1}},
triplecirclemine={{.564,.322,266,1}},
trollstoothpick={{.578,.520,539,1}},
underpallcave={{.301,.172,741,1},{.717,.607,741,2}},
unexploredcrag={{.470,.550,267,1}},
vahtacen={{.145,.653,747,1}},
vaultofhamanforgefire={{.676,.670,435,1}},
villageofthelost={{.85,.41,1056,1},{.19,.67,1056,2},{.32,.27,1056,3},{.34,.67,1056,4},{.72,.35,1056,5},{.77,.57,1056,6},{.48,.45,1056,7},{.38,.23,874,1}},
vindeathcave={{.319,.769,575,1}},
viridianwatch={{.723,.488,542,1}},
wailingmaw={{.606,.349,437,1}},
wansalen={{.369,.866,291,1}},
watchershold={{.634,.250,1301,1}},
weepingwindcave={{.643,.310,455,1}},
wormrootdepths={{.687,.371,577,1}},
yldzuun={{.818,.779,423,1}},
Zthenganaz={{.893,.332,1302,1}},
hallsofregulation_2={{.728,.403,2019,1}},
shadowcleft={{.360,.214,2017,1}},
drinithtombfw01={{.723,.813,1857,1}},
koradurfw02={{.271,.746,1857,2}},
cavernsofkogoruhnfw03={{.097,.242,1857,3}},
forgottendepthsfw04={{.195,.497,1857,4}},
forgottenwastesext={{.579,.502,1857,5},{.225,.552,1855,1}},
nchuleftingth2={{.465,.666,1854,2}},
nchuleftingth3={{.361,.266,1854,3}},
nchuleftingth4={{.121,.464,1854,1},{.435,.439,1854,4}},
nchuleftingth5={{.478,.404,1854,5}},
nchuleftingth6={{.499,.591,1846,1}},
matusakin={{.543,.620,1861,1}},
pulklower={{.800,.508,1862,1}},
nchuleftdepths={{.485,.417,1863,1}},
zainsipilu={{.137,.782,1860,1}},
khartagpoint={{.757,.195,1858,1}},
ashalmawia02={{.349,.315,1859,1}},
hallsofregulation_2={{.728,.402,2016,1}},
}
local BossesAchievements={[3660]=true,[3659]=true,[3658]=true,[3657]=true,[3625]=true,[3624]=true,[3623]=true,[3622]=true,[3621]=true,[3620]=true,[3490]=true,[3489]=true,[3284]=true,[3283]=true,[3282]=true,[3281]=true,[3280]=true,[3279]=true,[3278]=true,[3277]=true,[3276]=true,[3275]=true,[2996]=true,[2997]=true,[2971]=true,[2714]=true,[2715]=true,[2717]=true,[2718]=true,[2440]=true,[2442]=true,[2444]=true,[2445]=true,[744]=true,[734]=true,[741]=true,[742]=true,[733]=true,[732]=true,[377]=true,[738]=true,[739]=true,[740]=true,[1238]=true,[1239]=true,[1052]=true,[2095]=true,[2096]=true,[2181]=true,[2182]=true,[2007]=true,[300]=true,[470]=true,[1235]=true,[1236]=true,[1855]=true,[1846]=true,[1057]=true,[1058]=true,[1059]=true,[1061]=true,[1062]=true,[1063]=true,[1064]=true,[1425]=true,[1857]=true,[1691]=true,[1523]=true,[1856]=true,[1854]=true,[368]=true,[370]=true,[374]=true,[376]=true,[390]=true,[396]=true,}
local SkyShards={
u38_apocrypha={--Necrom Provided by art1ink
{.68,.497,3672,5,532},
{.893,.566,3672,6,533},
{.502,.458,3672,7,534},
{.512,.314,3672,8,535},
{.415,.442,3672,9,536},
{.219,.33,3672,10,537},
{.403,.499,3672,11,538},
{.578,.734,3672,14,541},
{.904,.665,3672,15,542},
{.39,.191,3672,16,543},
{.333,.386,3672,18,545}},
U38_underweave_central={{.351,.619,3672,11}},
u38_disquiet_study={{.452,.299,3672,14,541}},
u38_quires_wind={{.564,.656,3672,15,542}},
U38_CorpuscleBight_02_Base_0={{.424,.121,3672,16,543}},
u38_apogee_wind={{.481,.471,3672,18,545}},
u38_telvannipeninsula={
{.699,.362,3672,1,528},
{.317,.364,3672,2,529},
{.517,.781,3672,3,530},
{.67,.608,3672,4,531},
{.719,.319,3672,12,539},
{.787,.502,3672,13,540},
{.242,.69,3672,17,544}},
u38_camonnaruhn={{.54,.512,3672,17,544}},
u38_eggmine={{.289,.529,3672,13,540}},
u38_gorne_main_0={{.404,.332,3672,12,539}},
--ancher u38_telvannipeninsula={{.786,.499,0}},
--ancher u38_eggmine={{.289,.529,750}},
u38_Tunnel2={{.589,.115,3672,7,534}},
u36_galenisland={--Firesong Provided by art1ink
{.261,.265,3499,1,522},
{.575,.319,3499,2,523},
{.52,.545,3499,3,524},
{.289,.531,3499,4,525},
{.157,.462,3499,5,526},
{.559,.450,3499,6,527}},
u36_LKH={{.457,.751,3499,5,526}},
u36_embervine={{.377,.193,3499,6,527}},
u34_systreszone={--High Isle. Provided by art1ink
{.291,.75,3270,1,504},
{.514,.782,3270,2,505},
{.26,.852,3270,3,506},
{.143,.566,3270,4,507},
{.312,.34,3270,5,508},
{.323,.62,3270,6,509},
{.5,.654,3270,7,510},
{.782,.451,3270,8,511},
{.8,.263,3270,9,512},
{.668,.206,3270,10,513},
{.864,.404,3270,11,514},
{.62,.689,3270,12,515},
{.33,.912,3270,13,516},
{.214,.446,3270,14,517},
{.275,.706,3270,15.518},
{.48,.485,3270,16,519},
{.816,.202,3270,17,520},
{.602,.356,3270,18,521}},
u34_ghosthaven={{.628,.591,3270,11,514}},
u34_ghosthavenEXT={{.833,.733,3270,11,514}},
u34_crimsoncoin_EXT={{.773,.512,3270,12,515}},
u34_breakwatercave={{.517,.195,3270,13,516}},
u34_hauntedsepulcherext={{.484,.926,3270,14,517}},
u34_firepotcave={{.372,.605,3270,15,518}},
u34_shipwreckshoalsext={{.359,.658,3270,16,519}},
u34_coralcliffsint={{.316,.346,3270,17,520}},
u34_whalefall_cay={{.472,.589,3270,18,521}},
u32deadlandszone={--Deadland. Provided by art1ink.
{.464,.677,3140,1,496},
{.711,.389,3140,2,497},
{.656,.302,3140,3,498},
{.131,.542,3140,5,500},
{.888,.269,3140,6,501}},
u32_dreaded_refuge_ext={{.263,.248,3140,5,500}},
u32_folly_delve={{.755,.552,3140,6,501}},
u32_fargravezone={{.601,.347,3140,4,499}},
u32_theshambles={{.489,.502,3140,4,499}},
blackwood={--Blackwood. Provided by art1ink.
{.293,.641,2982,1,478},
{.703,.911,2982,2,479},
{.164,.447,2982,3,480},
{.302,.226,2982,4,481},
{.753,.363,2982,5,482},
{.581,.182,2982,6,483},
{.536,.457,2982,7,484},
{.813,.706,2982,8,485},
{.588,.765,2982,9,486},
{.467,.563,2982,10,487},
{.577,.645,2982,11,488},
{.458,.312,2982,12,489},
{.548,.772,2982,13,490},
{.207,.501,2982,14,491},
{.743,.515,2982,15,492},
{.371,.262,2982,16,493},
{.641,.182,2982,17,494},
{.839,.694,2982,18,495}},
u30_silenthalls_ext02={{.452,.731,2982,11,488}},
ZHMain={{.777,.623,2982,12,489}},
u30_xanmeeroverlook_ext={{.683,.514,2982,13,490}},
u30_undertowcavern={{.524,.403,2982,14,491}},
VaultDelve_EXT02={{.878,.348,2982,15,492}},
arpeniaH={{.857,.45,2982,16,493}},
arpeniaH2={{.857,.45,2982,16,493}},
arpeniaL={{.857,.45,2982,16,493}},
arpeniaL3={{.857,.45,2982,16,493}},
u30_bloodruncave={{.536,.298,2982,17,494}},
vunalk1={{.856,.21,2982,18,495}},
vunalk2={{.856,.21,2982,18,495}},
westernskryim={-- Western Skyrim
{.269,.556,2687,5,458},
{.62,.432,2687,6,459},
{.316,.705,2687,7,460},
{.67,.651,2687,8,461},
{.243,.441,2687,9,462},
{.505,.578,2687,10,463},
{.75,.68,2687,11,464},
{.368,.611,2687,13,466},
{.117,.437,2687,14,467},
{.745,.323,2687,15,468},
{.485,.302,2687,17,470}},
blackreach={
{.912,.465,2687,1,454},
{.165,.716,2687,2,455},
{.671,.212,2687,3,456},
{.535,.751,2687,4,457},
{.587,.587,2687,12,465},
{.767,.368,2687,16,469},
{.083,.366,2687,18,471}},
briarrockruins_ext={{.341,.621,2857,5,458}},
Gloomreach={{.648,.406,2857,6,459}},
Gloomreach2={{.648,.406,2857,6,459}},
Gloomreach2B={{.648,.406,2857,6,459}},
Gloomreach2C={{.648,.406,2857,6,459}},
Gloomreach3={{.648,.406,2857,6,459}},
Gloomreach5={{.648,.406,2857,6,459}},
labyrinthian={{.563,.473,2687,11,464}},
nchuthnkarst={{.683,.601,2687,12,465}},
chillwinddepths={{.864,.551,2687,13,466}},
dragonhome={{.586,.611,2687,14,467}},
frozencoast={{.357,.583,2687,15,468}},
midnightbarrow={{.704,.405,2687,16,469}},
shadowgreen_upper={{.452,.615,2687,17,470}},
thescraps={{.725,.504,2687,18,471}},
solitudecity={{.912,.832,2687,6,459}},
reach={
{.469,.309,2857,1,454},
{.821,.717,2857,2,455}},
U28_blackreach={
{.406,.371,2857,3,456},
{.914,.731,2857,4,457}},
southernelsweyr={-- Southern Elsweyr
{.588,.243,2562,1,448},
{.448,.551,2562,2,449},
{.344,.567,2562,3,450},
{.257,.32,2562,4,451},
{.165,.619,2562,5,452},
{.482,.307,2562,6,453}},
houseofembersinside={{.396,.384,2562,6,453}},
moonlitcove01={{.759,.228,2562,5,452}},
moonlitcove02={{.759,.228,2562,5,452}},
moonlitcove05={{.759,.228,2562,5,452}},
senchal={{.246,.687,2562,2,449}},
elsweyr={-- Northern Elsweyr
{.442,.17,2461,1,430},
{.35,.354,2461,2,431},
{.661,.471,2461,3,432},
{.732,.258,2461,4,433},
{.391,.52,2461,5,434},
{.234,.72,2461,6,435},
{.386,.689,2461,7,436},
{.536,.591,2461,8,437},
{.292,.605,2461,9,438},
{.564,.362,2461,10,439},
{.515,.473,2461,11,440},
{.704,.381,2461,12,441},
{.397,.43,2461,13,442},
{.262,.429,2461,14,443},
{.405,.224,2461,15,444},
{.151,.608,2461,16,445},
{.623,.586,2461,17,446},
{.614,.23,2461,18,447}},
tombofserpents={{.12,.359,2461,18,447}},
predatorrise={{.631,.273,2461,14,443}},
abodeofignominy={{.75,.788,2461,15,444}},
DesertWind={{.379,.845,2461,13,442}},
thetangle={{.102,.613,2461,17,442}},
thescab={{.56,.496,2461,16,441}},
stitches={{.618,.491,2461,5,434}},
orcrestsewer_Base_0={{.58,.586,2461,11,440}},
orcrest_Base_0={{.416,.584,2461,11,440}},
orcrest2_Base_0={{.409,.577,2461,11,440}},
RimmenNecropolis={{.815,.451,2461,12,441}},
murkmire={-- Murkmire
{.637,.76,2291,1,424},
{.925,.691,2291,2,425},
{.542,.466,2291,3,426},
{.192,.278,2291,4,427},
{.203,.516,2291,5,428},
{.465,.369,2291,6,429}},
UI_Map_tsofeercavern01_0={{.266,.83,2291,5,428}},
teethofsithis01={{.654,.552,2291,6,2,425}},
summerset={-- Summerset & Artaeum
{.285,.568,1845,1,406},
{.366,.552,1845,2,407},
{.178,.293,1845,3,408},
{.295,.195,1845,4,409},
{.493,.171,1845,5,410},
{.543,.42,1845,6,411},
{.554,.525,1845,7,412},
{.704,.773,1845,8,413},
{.469,.496,1845,9,414},
{.233,.42,1845,10,415},
{.301,.208,1845,11,416},
{.452,.707,1845,12,417},
{.489,.275,1845,13,418},
{.358,.324,1845,13,418},
{.509,.327,1845,14,419},
{.578,.583,1845,15,420},
{.496,.544,1845,16,421},
{.266,.521,1845,17,422}},
artaeum={{.398,.447,1845,18,423}},
TraitorsVault01={{.581,.478,1845,18,423}},
TraitorsVault02={{.581,.478,1845,18,423}},
TraitorsVault03={{.581,.478,1845,18,423}},
TraitorsVault04={{.581,.478,1845,18,423}},
Sum_Karnwasten={{.599,.595,1845,11,416}},
sunhold={{.373,.346,1845,12,417}},
kingshavenint1={{.197,.383,1845,13,418}},
etonnir_01={{.148,.596,1845,14,419}},
etonnir_02={{.148,.596,1845,14,419}},
archonsgrove={{.542,.704,1845,15,420}},
torhamekhard_01={{.468,.712,1845,16,421}},
torhamekhard_02={{.468,.712,1845,16,421}},
wastencoraldale={{.384,.451,1845,17,422}},
alikr={-- Alik'r Desert
{.246,.490,556,1,227},
{.407,.627,556,2,228},
{.231,.701,556,3,229},
{.521,.664,556,4,230},
{.585,.500,556,5,231},
{.558,.347,556,6,232},
{.773,.436,556,7,233},
{.751,.409,556,8,234},
{.881,.549,556,9,235},
{.641,.643,556,10,236},
{.648,.348,556,11,237},
{.405,.589,556,12,238},
{.831,.580,556,13,239},
{.222,.567,556,14,240},
{.900,.520,556,15,241},
{.705,.389,556,16,242}},
sentinel={{.381,.645,556,1,227}},
bergama={{.426,.616,556,4,230}},
kozanset={{.650,.334,556,7,233}},
aldunz={{.146,.436,556,10,236}},
coldrockdiggings={{.903,.262,556,11,237}},
divadschagrinmine={{.408,.533,556,12,238}},
sandblownmine={{.854,.347,556,13,239}},
santaki={{.917,.709,556,14,240}},
yldzuun={{.695,.329,556,15,241}},
lostcity={{.471,.580,556,16,242}},
auridon={-- Auridon
{.600,.898,695,1,93},
{.708,.83,695,2,93},
{.432,.775,695,3,95},
{.689,.515,695,4,96},
{.596,.397,695,5,97},
{.472,.532,695,6,98},
{.418,.318,695,7,99},
{.472,.352,695,8,100},
{.415,.129,695,9,101},
{.434,.402,695,10,102},
{.581,.854,695,11,103},
{.560,.558,695,12,104},
{.195,.211,695,13,105},
{.543,.698,695,14,106},
{.577,.321,695,15,107},
{.419,.675,695,16,108}},
vulkhelguard={{.396,.405,695,1,93}},
skywatch={{.546,.553,695,4,96}},
bewan={{0.869,0.7,695,10,102}},
delsclaim={{.316,.219,695,11,103}},
entilasfolly={{.818,.791,695,12,104}},
mehrunesspite={{.694,.256,695,13,105}},
ondil={{.835,.624,695,14,106}},
wansalen={{.276,.544,695,15,107}},
toothmaulgully={{.635,.669,695,16,108}},
khenarthisroost={-- Khenarthi's Roost
{.589,.809,431,1,87},
{.537,.700,431,2,88},
{.162,.555,431,3,89},
{.682,.578,431,4,90},
{.429,.406,431,5,91},
{.280,.364,431,6,92}},
mistral={{.147,.344,431,5,91}},
bangkorai={-- Bangkorai
{.387,.390,557,1,243},
{.582,.248,557,2,244},
{.602,.096,557,3,245},
{.560,.476,557,4,246},
{.377,.448,557,5,247},
{.539,.332,557,6,248},
{.465,.830,557,7,249},
{.358,.590,557,8,250},
{.630,.725,557,9,251},
{.454,.504,557,10,252},
{.557,.752,557,11,253},
{.332,.270,557,12,254},
{.246,.660,557,13,255},
{.712,.198,557,14,256},
{.647,.421,557,15,257},
{.233,.899,557,16,258}},
evermore={{.355,.680,557,1,243}},
cryptoftheexiles={{.678,.342,557,10,252}},
jaggerjaw={{.532,.826,557,11,253}},
murciensclaim={{.188,.237,557,12,254}},
rubblebutte={{.656,.857,557,13,255}},
trollstoothpick={{.656,.334,557,14,256}},
viridianwatch={{.119,.333,557,15,257}},
razakswheel={{.69,.45,557,16,258}},
coldharbour={-- Coldharbour
{.414,.625,686,1,260},
{.455,.738,686,2,261},
{.203,.628,686,3,262},
{.613,.648,686,4,263},
{.698,.646,686,5,264},
{.674,.786,686,6,265},
{.479,.582,686,7,266},
{.445,.414,686,8,267},
{.675,.403,686,9,268},
{.412,.534,686,10,269},
{.683,.724,686,11,270},
{.422,.787,686,12,271},
{.454,.509,686,13,272},
{.670,.574,686,14,273},
{.660,.375,686,15,274},
{.711,.635,686,16,275}},
["aba-loria"]={{.269,.430,686,10,269}},
vaultofhamanforgefire={{.526,.148,686,11,270}},
depravedgrotto={{.282,.267,686,12,271}},
malsorrastomb={{.366,.410,686,13,272}},
caveoftrophies={{.561,.743,686,14,273}},
wailingmaw={{.767,.701,686,15,274}},
villageofthelost={{.327,.500,686,16,275}},
craglorn={-- Craglorn 
{.747,.725,727,1,322},
{.685,.599,727,2,323},
{.284,.459,727,3,324},
{.441,.468,727,4,325},
{.667,.673,727,5,326},
{.719,.438,727,6,327},
{.146,.459,727,7,328},
{.214,.575,727,8,329},
{.813,.575,727,9,330},
{.468,.663,727,10,331},
{.321,.654,727,11,332},
{.537,.540,727,12,333},
{.282,.264,912,13,334},-- Upper Craglorn
{.582,.425,912,14,335},
{.400,.309,912,15,336},
{.662,.331,912,16,337},
{.086,.306,912,17,338},
{.547,.251,912,18,339}},
molavar={{.747,.352,727,1,322}},
rkundzelft={{.715,.382,727,2,323}},
kardala={{.612,.455,727,3,324}},
rkhardahrk_0={{.463,.381,727,4,325}},
haddock={{.656,.233,727,5,326}},
chiselshriek={{.863,.224,727,6,327}},
burriedsands={{.692,.151,727,7,328}},
mtharnaz={{.884,.625,727,8,329}},
balamath={{.643,.575,727,9,330}},
thaliasretreat={{.463,.292,727,10,331}},
cryptoftarishzizone={{.830,.446,727,11,332}},
hircineshaunt={{.329,.661,727,12,333}},
serpentsnest={{.632,.507,912,13,334}},
ilthagsundertower={{.370,.147,912,14,335}},
lothna={{.416,.425,912,15,336}},
howlingsepulchersoverland={{.528,.534,912,16,337}},
fearfang={{.572,.510,912,17,338}},
exarchsstronghold={{.626,.558,912,18,339}},
ava_whole_0={-- Cyrodiil
{.810,.167,692,1,276},-- Ebonheart
{.887,.329,692,2,277},
{.702,.625,692,3,278},
{.779,.387,692,4,279},
{.723,.508,692,5,280},
{.654,.378,692,6,281},
{.806,.304,692,7,282},
{.779,.208,692,8,283},
{.678,.185,692,9,284},
{.672,.596,692,10,285},
{.807,.250,692,11,286},
{.710,.490,692,12,287},
{.721,.694,692,13,288},
{.758,.347,692,14,289},
{.806,.461,692,15,290},
{.105,.267,693,16,291},-- Daggerfall
{.153,.152,693,17,292},
{.176,.371,693,18,293},
{.467,.172,693,19,294},
{.210,.397,693,20,295},
{.375,.330,693,21,296},
{.271,.229,693,22,297},
{.294,.128,693,23,298},
{.535,.224,693,24,299},
{.421,.146,693,25,300},
{.354,.134,693,26,301},
{.154,.241,693,27,302},
{.583,.194,693,28,303},
{.502,.214,693,29,304},
{.361,.221,693,30,305},
{.574,.851,694,31,306},-- Aldmeri
{.413,.842,694,32,307},
{.311,.659,694,33,308},
{.629,.681,694,34,309},
{.482,.534,694,35,310},
{.184,.458,694,36,311},
{.259,.531,694,37,312},
{.501,.761,694,38,313},
{.330,.770,694,39,314},
{.537,.810,694,40,315},
{.289,.484,694,41,316},
{.316,.562,694,42,317},
{.362,.698,694,43,318},
{.454,.725,694,44,319},
{.205,.507,694,45,320},
{.752,.296,748,46,321}},-- Mountain
crackedwoodcave={{.355,.370,692,10,285}},-- Ebonheart
kingscrest={{.725,.453,692,11,286}},
muckvalleycavern={{.175,.696,692,12,287}},
newtcave={{.380,.324,692,13,288}},
quickwatercave={{.396,.549,692,14,289}},
vahtacen={{.14,.78,692,15,290}},
capstonecave={{.694,.134,693,25,300}},-- Daggerfall
echocave={{.421,.227,693,26,301}},
lipsandtarn={{.733,.196,693,27,302}},
redrubycave={{.760,.291,693,28,303}},
toadstoolhollowlower={{.40,.64,693,29,304}},
toadstoolhollow={{.48,.53,693,30,305}},
underpallcave={{.770,.441,693,31,306}},
bloodmaynecave={{.153,.486,694,40,315}},-- Aldmeri
breakneckcave={{.488,.242,694,41,316}},
haynotecave={{.539,.186,694,42,317}},
nisincave={{.194,.723,694,43,318}},
potholecavern={{.60,.45,694,44,319}},
serpenthollowcave={{.257,.637,694,45,320}},
imperialcity={{.611,.637,1160,1,340},{.839,.381,1160,2,341},{.393,.360,1160,3,342},{.415,.346,1160,4,343},{.158,.541,1160,5,344},{.467,.671,1160,6,345}},-- Imperial City
Imperialsewers_ebon1={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewers_ebon2={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewer_ebonheart3={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewers_aldmeri1={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewers_aldmeri2={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewers_aldmeri3={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewer_daggerfall1={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewer_daggerfall2={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewer_daggerfall3={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
Imperialsewershub={{.447,.330,1160,7,346},{.414,.402,1160,8,374},{.9,.621,1160,9,348},{.754,.550,1160,10,349},{.197,.631,1160,11,350},{.320,.557,1160,12,351},{.525,.548,1160,13,352}},
deshaan={-- Deshaan
{.088,.472,547,1,23},
{.183,.514,547,2,24},
{.331,.639,547,3,25},
{.418,.480,547,4,26},
{.472,.395,547,5,27},
{.673,.652,547,6,28},
{.779,.588,547,7,29},
{.804,.472,547,8,30},
{.859,.487,547,9,31},
{.201,.448,547,10,32},
{.912,.438,547,11,33},
{.237,.460,547,12,34},
{.304,.568,547,13,35},
{.579,.457,547,14,36},
{.624,.611,547,15,37},
{.729,.388,547,16,38}},
narsis={{.526,.366,547,2,24}},
mournhold={{.377,.340,547,4,26}},
forgottencrypts={{.590,.305,547,10,32}},
desolatecave={{.500,.641,547,11,33}},
kwamacolony={{.527,.702,547,12,34}},
lowerbthanuel={{.512,.185,547,13,35}},
triplecirclemine={{.508,.364,547,14,36}},
unexploredcrag={{.388,.367,547,15,37}},
corpsegarden={{.576,.807,547,16,38}},
eastmarch={-- Eastmarch
{.333,.408,688,1,55},
{.584,.346,688,2,56},
{.611,.254,688,3,57},
{.406,.503,688,4,58},
{.308,.582,688,5,59},
{.143,.592,688,6,60},
{.653,.512,688,7,61},
{.634,.585,688,8,62},
{.558,.650,688,9,63},
{.725,.623,688,10,64},
{.624,.264,688,11,65},
{.176,.558,688,12,66},
{.564,.432,688,13,67},
{.511,.618,688,14,68},
{.637,.653,688,15,69},
{.474,.283,688,16,70}},
fortamol={{.733,.109,688,5,59}},
thebastardstomb={{.543,.133,688,10,64}},
thechillhollow={{.338,.887,688,11,65}},
thefrigidgrotto={{.541,.719,688,12,66}},
icehammersvault={{.130,.376,688,13,67}},
oldsordscave={{.314,.731,688,14,68}},
stormcragcrypt={{.322,.317,688,15,69}},
hallofthedead={{.505,.525,688,16,70}},
windhelm={{.334,.454,688,16,70}},
glenumbra={-- Glenumbra
{.319,.755,409,1,179},
{.454,.540,409,2,180},
{.274,.628,409,3,181},
{.386,.418,409,4,182},
{.459,.485,409,5,183},
{.676,.442,409,6,184},
{.695,.191,409,7,185},
{.782,.309,409,8,186},
{.787,.116,409,9,187},
{.350,.727,409,10,188},
{.272,.678,409,11,189},
{.698,.530,409,12,190},
{.343,.333,409,13,191},
{.608,.185,409,14,192},
{.766,.138,409,15,193},
{.200,.739,409,16,194}},
daggerfall={{.695,.447,409,1,179}},
crosswych={
{.377,.325,409,9,187},
{.253,.461,409,15,193}},
ilessantower={{.841,.312,409,10,188}},
silumm={{.256,.213,409,11,189}},
minesofkhuras={{.446,.664,409,12,190}},
enduum={{.406,.861,409,13,191}},
eboncrypt={{.402,.116,409,14,192}},
cryptwatchfort={{.746,.264,409,15,193}},
badmanscave={{.332,.509,409,16,194}},
betnihk={-- Betnikh
{.407,.271,408,1,176},
{.619,.605,408,2,177},
{.370,.595,408,3,178}},
strosmkai={-- Stros M'Kai
{.424,.516,407,1,173},
{.643,.397,407,2,174},
{.540,.806,407,3,175}},
porthunding={{.465,.448,407,2,174}},
grahtwood={-- Grahtwood
{.739,.678,682,1,109},
{.446,.723,682,2,110},
{.649,.667,682,3,111},
{.621,.526,682,4,112},
{.648,.363,682,5,113},
{.590,.319,682,6,114},
{.288,.224,682,7,115},
{.325,.599,682,8,116},
{.474,.537,682,9,117},
{.562,.665,682,10,118},
{.806,.509,682,11,119},
{.484,.445,682,12,120},
{.722,.362,682,13,121},
{.185,.145,682,14,122},
{.523,.598,682,15,123},
{.658,.597,682,16,124}},
haven={{.384,.249,682,1,109}},
eldenrootgroundfloor={{.754,.626,682,4,112}},
nesalas={{.575,.577,682,10,118}},
dessicatedcave={{.620,.463,682,11,119}},
burrootkwamamine={{.781,.443,682,12,120}},
vindeathcave={{.738,.746,682,13,121}},
wormrootdepths={{.186,.706,682,14,122}},
mobarmine={{.396,.477,682,15,123}},
rootsunder={{.289,.661,682,16,124}},
greenshade={-- Greenshade
{.629,.795,683,1,125},
{.528,.656,683,2,126},
{.679,.484,683,3,127},
{.159,.699,683,4,128},
{.345,.733,683,5,129},
{.297,.573,683,6,130},
{.302,.156,683,7,131},
{.558,.473,683,8,132},
{.603,.404,683,9,133},
{.742,.613,683,10,134},
{.579,.895,683,11,135},
{.369,.684,683,12,136},
{.308,.399,683,13,137},
{.630,.450,683,14,138},
{.294,.152,683,15,139},
{.388,.449,683,16,140}},
marbruk={{.334,.197,683,3,127}},
woodhearth={{.486,.741,683,4,128}},
gurzagsmine={{.613,.573,683,10,134}},
caracdena={{.541,.492,683,11,135}},
narilnagaia={{.266,.732,683,12,136}},
theunderroot={{.47,.24,683,13,137}},
harridanslair={{.737,.748,683,14,138}},
barrowtrench={{.540,.562,683,15,139}},
rulanyilsfall={{.681,.415,683,16,140}},
malabaltor={-- Malabal Tor
{.187,.499,684,1,141},
{.214,.451,684,2,142},
{.341,.594,684,3,143},
{.507,.585,684,4,144},
{.545,.444,684,5,145},
{.491,.668,684,6,146},
{.788,.571,684,7,147},
{.774,.341,684,8,148},
{.647,.242,684,9,149},
{.788,.298,684,10,150},
{.349,.412,684,11,151},
{.473,.563,684,12,152},
{.708,.492,684,13,153},
{.623,.829,684,14,154},
{.380,.623,684,15,155},
{.385,.406,684,16,156}},
velynharbor={{.790,.450,684,1,141}},
vulkwasten={{.462,.250,684,5,145}},
baandaritradingpost={{.196,.259,684,10,150}},
blackvineruins={{.379,.875,684,10,150}},
deadmansdrop={{.191,.135,684,11,151}},
hoarvorpit={{.440,.128,684,12,152}},
rootsofsilvenar={{.571,.403,684,13,153}},
shaelruins={{.312,.898,684,14,154}},
tomboftheapostates={{.541,.168,684,15,155}},
crimsoncove02={{.824,.464,684,16,156}},
crimsoncove01={{.824,.464,684,16,156}},
reapersmarch={-- Reaper's March
{.378,.199,685,1,157},
{.429,.334,685,2,158},
{.343,.149,685,3,159},
{.334,.538,685,4,160},
{.281,.624,685,5,161},
{.397,.644,685,6,162},
{.780,.349,685,7,163},
{.768,.166,685,8,164},
{.507,.364,685,9,165},
{.541,.301,685,10,166},
{.361,.409,685,11,167},
{.505,.755,685,12,168},
{.239,.607,685,13,169},
{.753,.128,685,14,170},
{.633,.395,685,15,171},
{.282,.163,685,16,172}},
dune={{.587,.338,685,7}},
kunasdelve={{.752,.434,685,10,166}},
thibautscairn={{.778,.666,685,11,167}},
weepingwindcave={{.376,.830,685,12,168}},
clawsstrike={{.116,.395,685,13,169}},
fardirsfolly={{.332,.402,685,14,170}},
jodeslight={{.151,.262,685,15,171}},
thevilemansefirstfloor={{.40,.42,685,16,172}},
thevilemansesecondfloor={{.65,.33,685,16,172}},
rivenspire={-- Rivenspire
{.447,.602,554,1,211},
{.155,.568,554,2,212},
{.297,.507,554,3,213},
{.593,.539,554,4,214},
{.640,.543,554,5,215},
{.831,.166,554,6,216},
{.386,.366,554,7,217},
{.700,.127,554,8,218},
{.579,.441,554,9,219},
{.357,.490,554,10,220},
{.400,.311,554,11,221},
{.145,.592,554,12,222},
{.699,.184,554,13,223},
{.809,.351,554,14,224},
{.670,.604,554,15,225},
{.556,.456,554,16,226}},
shornhelm={
{.614,.804,554,1,211},
{.036,.077,554,10,220}},
northpoint={{.731,.201,554,6,216}},
crestshademine={{.522,.444,554,10,220}},
erokii={{.526,.879,554,11,221}},
flyleafcatacombs={{.611,.354,554,12,222}},
hildunessecretrefuge={{.578,.502,554,13,223}},
orcsfingerruins={{.179,.348,554,14,224}},
tribulationcrypt={{.334,.774,554,15,225}},
obsidianscar={{.846,.595,554,16,226}},
shadowfen={-- Shadowfen
{.445,.272,687,1,39},
{.226,.285,687,2,40},
{.567,.415,687,3,41},
{.657,.591,687,4,42},
{.791,.712,687,5,43},
{.574,.799,687,6,44},
{.373,.721,687,7,45},
{.123,.782,687,8,46},
{.251,.549,687,9,47},
{.849,.595,687,10,48},
{.826,.377,687,11,49},
{.254,.795,687,12,50},
{.448,.621,687,13,51},
{.668,.768,687,14,52},
{.289,.169,687,15,53},
{.651,.271,687,16,54}},
stormhold={{.446,.494,687,1,39}},
altencorimont={{.362,.526,687,4,42}},
atanazruins={{.360,.731,687,10,48}},
brokentuskcave={{.352,.346,687,11,49}},
chidmoskaruins={{.815,.759,687,12,50}},
gandranen={{.772,.315,687,13,51}},
onkobrakwamamine={{.737,.521,687,14,52}},
shrineofblackworm={{.859,.690,687,15,53}},
sanguinesdemesne={{.643,.605,687,16,54}},
stonefalls={-- Stonefalls
{.777,.346,397,1,7},
{.943,.471,397,2,8},
{.613,.611,397,3,9},
{.391,.467,397,4,10},
{.253,.411,397,5,11},
{.466,.603,397,6,12},
{.336,.681,397,7,13},
{.086,.445,397,8,14},
{.129,.610,397,9,15},
{.716,.393,397,10,16},
{.643,.591,397,11,17},
{.583,.594,397,12,18},
{.357,.448,397,13,19},
{.290,.558,397,14,20},
{.211,.540,397,15,21},
{.933,.360,397,16,22}},
davonswatch={
{.095,.511,397,1,7},
{.875,.585,397,16,22}},
innerseaarmature={{.438,.272,397,10,16}},
emberflintmine={{.728,.586,397,11,17}},
mephalasnest={{.561,.349,397,12,18}},
hightidehollow={{.671,.666,397,13,19}},
softloamcavern={{.419,.705,397,14,20}},
sheogorathstongue={{.581,.262,397,15,21}},
crowswood={{.244,.963,397,16,22}},
balfoyen={-- Bal Foyen
{.550,.560,405,1,4},
{.246,.744,405,2,5},
{.377,.316,405,3,6}},
dhalmora={{.331,.453,405,1,4}},
bleakrock={-- Bleakrock Isle
{.774,.438,398,1,1},
{.498,.225,398,2,2},
{.278,.402,398,3,3}},
hozzinsfolley={{.329,.809,398,3,2}},
stormhaven={-- Stormhaven
{.150,.348,515,1,195},
{.220,.203,515,2,196},
{.222,.466,515,3,197},
{.644,.383,515,4,198},
{.684,.492,515,5,199},
{.394,.640,515,6,200},
{.776,.414,515,7,201},
{.825,.423,515,8,202},
{.867,.464,515,9,203},
{.786,.433,515,10,204},
{.389,.653,515,11,205},
{.237,.494,515,12,206},
{.605,.367,515,13,207},
{.458,.430,515,14,208},
{.308,.323,515,15,209},
{.317,.496,515,16,210}},
bearclawmine={{.178,.479,515,10,204}},
farangelsdelve={{.754,.087,515,11,205}},
koeglinmine={{.40,.12,515,12,206}},
norvulkruins={{.352,.532,515,13,207}},
pariahcatacombs={{.752,.319,515,14,208}},
portdunwatch={{.706,.446,515,15,209}},
bonesnapruinssecret={{.25,.73,515,16,210,}},
bonesnapruins={{.25,.64,515,16,210}},
therift={-- The Rift
{.429,.272,689,1,71},
{.647,.291,689,2,72},
{.319,.378,689,3,73},
{.330,.513,689,4,74},
{.393,.563,689,5,75},
{.110,.451,689,6,76},
{.837,.512,689,7,77},
{.782,.621,689,8,78},
{.719,.445,689,9,79},
{.385,.574,689,10,80},
{.828,.588,689,11,81},
{.498,.472,689,12,82},
{.718,.404,689,13,83},
{.134,.294,689,14,84},
{.317,.234,689,15,85},
{.059,.427,689,16,86}},
shorsstone={{.292,.446,689,2,72}},
riften={{.798,.185,689,9,79}},
avancheznel={{.110,.640,689,10,80}},
brokenhelm={{.872,.645,689,11,81}},
ebonmeretower={{.398,.419,689,12,82}},
fortgreenwall={{.525,.447,689,13,83}},
shroudhearth={{.779,.612,689,14,84}},
snaplegcave={{.801,.770,689,15,85}},
thelionsden={{.630,.399,689,16,86}},
wrothgar={-- Wrothgar
{.194,.828,1320,1,353},
{.334,.752,1320,2,354},
{.188,.674,1320,3,355},
{.530,.785,1320,4,356},
{.465,.462,1320,5,357},
{.432,.627,1320,6,358},
{.531,.354,1320,7,359},
{.641,.495,1320,8,360},
{.844,.429,1320,9,361},
{.171,.659,1320,10,362},
{.895,.471,1320,11,363},
{.540,.582,1320,12,364},
{.811,.596,1320,13,365},
{.295,.738,1320,14,366},
{.710,.377,1320,15,367},
{.568,.696,1320,16,368},
{.198,.845,1320,17,369}},
morkul={{.124,.460,1320,5,357}},
oldorsiniummap06={{.609,.727,1320,10,362}},
rkindaleftoutside={{.264,.388,1320,11,363}},
argentmine2={{.185,.843,1320,12,364}},
coldperchcavern={{.328,.827,1320,13,365}},
thukozods={{.286,.465,1320,14,366}},
Zthenganaz={{.116,.116,1320,15,367}},
kennelrun={{.900,.707,1320,16,368}},
watchershold={{.764,.661,1320,17,369}},
hewsbane={-- Hew's Bane
{.681,.409,1347,1,370},
{.440,.484,1347,2,371},
{.418,.763,1347,3,372},
{.466,.665,1347,4,373},
{.471,.424,1347,5,374},
{.324,.789,1347,6,375}},
abahslanding={{.552,.421,1347,1,370}},
bahrahasgloom={{.256,.524,1347,5,374}},
bahrahasgloom_secret1={{.256,.524,1347,5,374}},
bahrahasgloom_secret2={{.256,.524,1347,5,374}},
bahrahasgloom_secret3={{.256,.524,1347,5,374}},
sharktoothgrotto1={{.661,.386,1347,6,375}},
sharktoothgrotto2={{.661,.386,1347,6,375}},
goldcoast={-- Gold Coast 
{.255,.582,1342,1,376},
{.298,.192,1342,2,377},
{.856,.507,1342,3,378},
{.879,.604,1342,4,379},
{.391,.452,1342,5,380},
{.579,.453,1342,6,381}},
hrotacave={{.678,.456,1342,5,380}},
garlasagea={{.774,.664,1342,6,381}},
vvardenfell={-- Vvardenfell
{.760,.686,1843,1,382},
{.819,.405,1843,2,383},
{.652,.555,1843,3,384},
{.779,.366,1843,4,385},
{.769,.834,1843,5,386},
{.406,.825,1843,6,387},
{.492,.708,1843,7,388},
{.253,.636,1843,8,389},
{.423,.255,1843,9,390},
{.160,.297,1843,10,390},
{.668,.657,1843,11,392},
{.522,.256,1843,12,393},
{.245,.499,1843,13,394},
{.232,.271,1843,14,395},
{.358,.751,1843,15,396},
{.798,.689,1843,16,397},
{.667,.422,1843,17,398},
{.612,.329,1843,18,399}},
nchuleftingth1={
{.253,.632,1843,11,392},
{.848,.331,1843,11,392}},
nchuleftingth3={{.901,.444,1843,11,392}},
nchuleftingth4={{.721,.39,1843,11,392}},
nchuleftingth5={{.309,.595,1843,11,392}},
cavernsofkogoruhnfw03={{.400,.442,1843,12,393}},
khartagpoint={{.608,.461,1843,13,397}},
ashalmawia02={{.336,.931,1843,14,395}},
zainsipilu={{.778,.255,1843,15,396}},
matusakin={{.531,.732,1843,16,397}},
pulklower={{.477,.366,1843,17,398}},
pulkupper={{.477,.366,1843,17,398}},
nchuleftdepths={{.607,.581,1843,18,399}},
clockwork={-- Clockwork
{.463,.504,1844,1,400},
{.495,.655,1844,2,401},
{.411,.460,1844,3,402},
{.445,.359,1844,4,403},
{.840,.651,1844,5,404},
{.268,.576,1844,6,405}},
ccunderground={{.850,.720,1844,3,402}},
ccunderground02={{.850,.720,1844,3,402}},
brassfortress={
{.457,.555,1844,3,402},
{.345,.553,1844,4,403}},
hallsofregulation={{.369,.564,1844,5,404}},
hallsofregulation_2={{.728,.402,1844,5,404}},
shadowcleft={{.836,.570,1844,6,405}},
}
local SkyShardsAchievements={[3672]=true,[3499]=true,[3270]=true,[3140]=true,[2982]=true,[2687]=true,[2562]=true,[2461]=true,[2291]=true,[556]=true,[695]=true,[405]=true,[557]=true,[408]=true,[398]=true,[686]=true,[727]=true,[912]=true,[694]=true,[693]=true,[692]=true,[547]=true,[688]=true,[409]=true,[682]=true,[683]=true,[431]=true,[684]=true,[748]=true,[685]=true,[554]=true,[687]=true,[397]=true,[515]=true,[407]=true,[689]=true,[1160]=true,[1320]=true,[1347]=true,[1342]=true,[1843]=true,[1844]=true,[1845]=true}
local Lorebooks={
--Necrom Provided by art1ink.
u38_telvannipeninsula={
{.787,.355,8,1},-- Aedra and Daedra
{.840,.343,8,4},--The House of Troubles
{.449,.556,11,8},-- Where Magical Paths Meet
{.588,.681,20,1},-- Ancestors and the Dunmer (Abridged)
},
u38_apocrypha={
{.714,.854,17,1},--The Book of Daedra
{.577,.548,8,9},--Fragmentae Abyssum Hermaeus Morus
},
u38_disquiet_study={{.491,.364,8,6}},--Modern Heretics
u38_ciphersmidden_city={{.447,.46,8,9}},--Fragmentae Abyssum Hermaeus Morus
u38_teldreloth_ext={{.418,.687,20,1}},-- Ancestors and the Dunmer (Abridged)
u38_Necrom={
{.582,.524,8,4},--The House of Troubles
{.36,.573,8,1},--Aedra and Daedra
},
--Firesong Provided by art1ink.
u36_galenisland={
{.523,.481,2,4},--The Bretons: Mongrels or Paragons?
{.281,.738,1,5},--Guide to the Daggerfall Covenant
{.117,.275,9,6},--Triumphs of a Monarch, Ch. 6
{.574,.174,9,7},--Triumphs of a Monarch, Ch. 10
{.536,.571,18,5},--Flesh to Cut from Bone
{.22,.582,2,10},--Wayrest, Jewel of the Bay
{.268,.244,1,9},--Wyresses: The Name-Daughters
{.214,.658,1,7},--Varieties of Faith: The Bretons
{.200,.659,9,5},--Triumphs of a Monarch, Ch. 3
{.31,.401,2,3},--The Knightly Orders of High Rock
},
u36_VastyrCity={
{.766,.664,1,5},--Guide to the Daggerfall Covenant
{.464,.372,9,5},--Triumphs of a Monarch, Ch. 3
{.517,.366,1,7}},--Varieties of Faith: The Bretons
u36_VastyrCityCastle2ndFl={{.563,.669,1,7}},--Varieties of Faith: The Bretons
--High Isle. Provided by art1ink.
u34_systreszone={
{.508,.842,1,5},--Guide to the Daggerfall Covenant
{.528,.699,9,7},--Triumphs of a Monarch, Ch. 10
{.539,.53,2,4},--The Bretons: Mongrels or Paragons?
{.314,.472,2,10},--Wayrest, Jewel of the Bay
{.601,.866,1,7},--Varieties of Faith: The Bretons
{.196,.616,1,9},--Wyresses: The Name-Daughters
{.162,.755,2,3},--The Knightly Orders of High Rock
{.664,.23,9,5},--Triumphs of a Monarch, Ch. 3
{.853,.267,9,6},--Triumphs of a Monarch, Ch. 6
{.855,.337,18,5}},--Flesh to Cut from Bone
u34_navirecommander={{.405,.537,2,3}},--The Knightly Orders of High Rock
u34_stoneloregrove={{.657,.501,1,9}},--Wyresses: The Name-Daughters
u34_gonfalonbaycity={
{.919,.614,1,7},--Varieties of Faith: The Bretons
{.265,.443,1,5},--Guide to the Daggerfall Covenant
},
--The Deadlands Provided by art1ink
u32_fargravezone={
{.527,.239,14,5},-- Myths of Sheogorath, Volume 1
{.345,.616,2,8}},--To Dream Beyond Dreams
u32_theshambles={{.366,.32,14,5}},-- Myths of Sheogorath, Volume 1
u32_fargrave={{.406,.176,2,8}},--To Dream Beyond Dreams
u32deadlandszone={
{.719,.369,17,1},--The Book of Daedra
{.179,.588,17,5},--On Oblivion
{.351,.7,17,7},--Varieties of Daedra, Part 1
{.268,.598,17,8},--Varieties of Daedra, Part 2
{.696,.507,8,4},--The House of Troubles
{.707,.453,29,9},--Oath of a Dishonored Clan
{.432,.484,29,4},--I was Summoned by a Mortal
{.438,.653,23,10}},--Dark Ruins
--Blackwood Provided by art1ink
u30_leyawiincity={{.253,.455,10,8}},--Nine Commands of the Eight Divines
blackwood={--Provided by art1ink
{.381,.388,9,8},--Trials of Saint Alessia
{.477,.56,13,7},--The Order of the Ancestor Moth
{.482,.633,15,7},--Reality and Other Falsehoods
{.533,.187,19,1},--Ayleid Inscriptions Translated
{.23,.63,19,6},--Eulogy for Emperor Varen
{.16,.376,19,7},--House Tharn of Nibenay
{.736,.525,6,7},--Freedom's Price
{.627,.737,20,7},--Varieties of Faith: The Argonians
{.701,.245,26,1},--Varieties of Faith: The Khajiit
{.679,.252,21,6}},--Pirates of the Abecean
markunderstonekeep={--Provided by art1ink
{.63,.172,20,5},--Nords of Skyrim
{.238,.162,20,8}},--Varieties of Faith: The Nords
reach={--Provided by art1ink
{.415,.599,1,4},--The Werewolf's Hide
{.346,.487,3,3},--Bloodfiends of Rivenspire
{.573,.491,4,2},--Living with Lycanthropy
{.439,.685,4,9},--A Life Barbaric and Brutal
{.583,.44,22.5},--The Crown of Freydis
{.54,.288,22,7},--All About Giants
{.504,.626,24,10},--Clans of the Reach: A Guide
{.39,.674,24,4}},--Thenephan's Mysteries of Mead
--Northern Elsweyr	provided by art1ink
rimmen={{.439,.503,28,8}},--Master Zoaraym's Tale, Part 1
riverholdcity={{.543,.606,26,1}},--Varieties of Faith: The Khajiit
stitches={{.575,.505,28,9}},--Master Zoaraym's Tale, Part 2
elsweyr={
{.500,.166,26,1},--Varieties of Faith: The Khajiit
{.714,.265,28,7},--Moon-Sugar for Glossy Fur? Yes!
{.785,.287,28,8},--Master Zoaraym's Tale, Part 1
{.387,.521,28,9},--Master Zoaraym's Tale, Part 2
{.363,.304,5,1},--The Legend of Vastarie
{.235,.57,6,10},--On the Knahaten Flu
{.138,.75,1,2},--A Warning to the Aldmeri Dominion
{.412,.6,25,7},--The Rise of Queen Ayrenn
{.579,.69,28,1},--The Moon Cats and their Dance
{.727,.398,28,2}},--Litter-Mates of Darkness
--Southern Elsweyr	provided by art1ink
Senchalpalace01={{.145,.425,21,8}},--A Nereid Stole My Husband
ELS_DG_Sanctuary={{.278,.438,28,9}},--Master Zoaraym's Tale, Part 2
ELS_Dragonguard_island01={{.645,.261,28,9}},--Master Zoaraym's Tale, Part 2
southernelsweyr={
{.183,.651,6,8},--A Mother's Nursery Rhyme
{.399,.615,6,10},--On The Knahaten Flu
{.664,.696,21,6},--Pirates of Abecean
{.298,.459,26,1},--Varieties of Faith: The Khajiit
{.184,.313,28,1},--The Moon Cats and Their Dance
{.385,.383,28,5},--The Eagle and the Cat
{.371,.25,28,6},--Elven Eyes, Elven Spies
{.448,.356,28,8},--Master Zoaraym's Tale, Part 1
{.918,.712,28,9},--Master Zoaraym's Tale, Part 2
},
--Western Skyrim provided by art1ink
morthalburialcave={{.368,.713,22,5}},--The Crown of Freydis 
solitudecity={{.774,.77,22,1}},--The Brothers' War
frozencoast={{.23,.742,22,7}},--All About Giants
lightlesshollow_mines01={{.705,.809,20,9}},--Varieties of Faith: The Nords
knightfall3={{.123,.767,3,10}},--House Ravenwatch Proclamation
blackreach={
{.947,.468,20,9},--Varieties of Faith: The Nords
{.342,.805,24,6},--The Road to Sovngarde
{.102,.515,24,3},--The Wandering Skald
{.453,.135,3,10},--House Ravenwatch Proclamation
},
westernskryim={
{.604,.425,22,1},--The Brothers' War
{.264,.667,20,5},--Nords of Skyrim
{.147,.507,22,4},--Orcs of Skyrim
{.705,.614,22,5},--The Crown of Freydis 
{.744,.323,22,7},--All About Giants
},
belarata={{.668,.795,18,1}},
abahslanding={{.183,.781,18,5}},
garlasagea={{0.581,0.75,19,1}},
goldcoast={{0.858,0.505,19,6},{.828,.615,18,7}},
kvatchcity={{.287,.514,9,8}},
clockwork={{.786,.531,8,4},{.442,.505,15,5},{.877,.606,17,4},{.689,.631,20,8},{.687,.429,23,1},{.413,.575,26,6}},
shimmerene={{.302,.435,25,6}},
summerset={{.268,.532,25,6},{.65,.597,25,10},{.72,.728,16,1},{.664,.788,16,1},{.564,.683,16,1},{.507,.66,16,1},{.607,.277,9,10},{.298,.259,9,10},{.469,.131,16,2},{.512,.544,15,5},{.439,.434,25,4}},
alikr={
{.62,.433,18,4},
{.558,.345,18,5},
{.39,.52,18,6},
{.162,.493,5,1},{.124,.516,5,1},{.086,.505,5,1},{.118,.470,5,1},
{.578,.493,5,2},{.594,.483,5,2},{.634,.497,5,2},{.617,.485,5,2},
{.791,.329,5,3},{.854,.358,5,3},{.804,.336,5,3},{.847,.330,5,3},
{.428,.517,5,4},{.404,.534,5,4},{.469,.541,5,4},{.504,.485,5,4},
{.556,.656,5,5},{.500,.640,5,5},{.500,.663,5,5},{.541,.629,5,5},
{.189,.452,5,6},{.247,.439,5,6},{.222,.395,5,6},{.205,.475,5,6},
{.755,.273,5,7},{.753,.325,5,7},{.785,.256,5,7},{.755,.245,5,7},
{.250,.661,5,8},{.264,.661,5,8},{.234,.703,5,8},{.239,.682,5,8},
{.257,.457,5,9},{.248,.432,5,9},{.300,.447,5,9},{.297,.504,5,9},
{.302,.648,5,10},{.293,.694,5,10},{.326,.685,5,10},{.355,.700,5,10},
{.302,.456,8,7},{.268,.412,8,7},{.290,.409,8,7},
{.563,.407,8,8},{.604,.391,8,8},{.563,.398,8,8},
{.222,.567,12,10},{.186,.513,12,10},{.217,.538,12,10},{.213,.524,12,10},
{.608,.625,12,11},{.591,.580,12,11},{.620,.594,12,11},
{.901,.520,12,12},{.873,.495,12,12},{.875,.567,12,12},{.884,.530,12,12},
{.779,.573,13,1},{.710,.534,13,1},{.779,.586,13,1},
{.498,.413,13,2},{.471,.445,13,2},{.478,.381,13,2},
{.746,.456,13,3},{.766,.459,13,3},{.772,.440,13,3},
{.433,.691,13,4},{.401,.689,13,4},{.405,.689,13,4},{.383,.697,13,4},
{.261,.566,13,5},{.309,.603,13,5},{.272,.624,13,5},{.229,.574,13,5},
{.661,.583,13,6},{.675,.628,13,6},{.655,.549,13,6},
{.843,.497,13,7},
{.449,.614,13,8},{.417,.628,13,8},{.440,.567,13,8},
{.831,.580,13,9},{.843,.567,13,9},{.803,.503,13,9},
{.496,.548,13,10},{.530,.546,13,10},{.502,.538,13,10},
{.290,.441,14,4},
{.673,.381,18,2}},
sentinel={{.103,.459,5,6},{.387,.398,5,6},{.264,.187,5,6},{.179,.572,5,6},{.436,.483,5,9},{.391,.577,5,9},{.630,.715,5,9},{.640,.437,5,9},{.646,.472,8,7},{.439,.148,8,7},{.598,.413,14,4},{.828,.542,18,3},{.819,.747,18,6}},
bergama={{.259,.607,5,5},{.679,.558,5,5},{.262,.434,5,5},{.569,.351,5,5}},
kozanset={{.412,.481,13,3},{.637,.376,13,3},{.586,.696,13,3}},
smugglerkingtunnel={{.433,.455,5,3}},
aldunz={{.194,.743,12,11}},
santaki={{.710,.792,12,10}},
yldzuun={{.627,.291,12,12}},
sandblownmine={{.669,.446,13,9}},
coldrockdiggings={{.808,.438,18,2}},
divadschagrinmine={{.418,.698,13,8}},
volenfell={{.141,.441,11,2}},
auridon={{.349,.115,25,1},{.341,.152,25,1},{.295,.098,25,1},{.324,.062,25,1},{.381,.244,25,2},{.354,.268,25,2},{.364,.306,25,2},{.369,.203,25,2},{.420,.312,25,3},{.451,.323,25,3},{.407,.366,25,3},{.452,.363,25,3},{.525,.303,25,4},{.590,.249,25,4},{.497,.278,25,4},{.601,.456,25,5},{.535,.451,25,5},{.566,.436,25,5},{.562,.476,25,5},{.246,.287,25,6},{.232,.239,25,6},{.216,.286,25,6},{.187,.234,25,6},{.526,.178,25,7},{.520,.213,25,7},{.539,.243,25,7},{.553,.183,25,7},{.28,.16,25,8},{.469,.16,25,9},{.423,.205,25,9},{.387,.148,25,9},{.440,.125,25,9},{.280,.380,25,10},{.329,.330,25,10},{.242,.358,25,10},{.327,.374,25,10},{.497,.436,8,1},{.511,.398,8,1},{.472,.372,8,1},{.502,.337,8,1},{.401,.646,8,2},{.396,.682,8,2},{.429,.700,8,2},{.451,.683,8,2},{.627,.330,9,1},{.620,.312,9,1},{.671,.304,9,1},{.578,.327,9,1},{.636,.395,9,2},{.588,.379,9,2},{.615,.428,9,2},{.642,.432,9,2},{.802,.514,9,3},{.800,.486,9,3},{.831,.498,9,3},{.710,.550,9,4},{.682,.522,9,4},{.579,.532,9,5},{.626,.561,9,5},{.561,.504,9,5},{.599,.489,9,5},{.552,.530,9,6},{.559,.592,9,6},{.565,.558,9,6},{.521,.547,9,6},{.499,.547,9,7},{.457,.518,9,7},{.447,.554,9,7},{.518,.499,9,7},{.499,.575,9,8},{.545,.640,9,8},{.522,.602,9,8},{.491,.610,9,8},{.599,.590,10,1},{.663,.636,10,1},{.569,.638,10,1},{.631,.601,10,1},{.504,.647,10,2},{.460,.655,10,2},{.446,.624,10,2},{.492,.671,10,2},{.494,.764,10,3},{.400,.739,10,3},{.479,.709,10,3},{.467,.764,10,3},{.554,.716,12,1},{.533,.661,12,1},{.522,.693,12,1},{.548,.696,12,1},{.593,.710,12,2},{.622,.719,12,2},{.595,.765,12,2},{.564,.738,12,2},{.682,.711,12,3},{.644,.754,12,3},{.680,.782,12,3},{.673,.745,12,3},{.682,.859,19,1},{.713,.825,19,1},{.635,.850,19,1},{.625,.892,19,1},{.689,.912,19,2},{.578,.949,19,2},{.629,.939,19,2},{.610,.905,19,2},{.511,.906,19,3},{.545,.855,19,3},{.564,.874,19,3},{.566,.902,19,3},{.595,.847,19,4},{.622,.822,19,4},{.601,.794,19,4},{.570,.825,19,4},{.533,.817,19,5},{.488,.826,19,5},{.563,.790,19,5},{.546,.774,19,5},{.322,.113,11,7}},
firsthold={{.487,.314,25,8},{.648,.834,25,8},{.734,.558,25,8}},
skywatch={{.27,.051,9,2},{.27,.46,9,4},{.50,.58,9,4},{.54,.21,9,4},{.66,.73,9,4},{.014,.388,9,5}},
vulkhelguard={{.508,.387,19,1},{.830,.490,19,2},{.529,.626,19,2},{.271,.675,19,2},{.436,.455,19,2},{.206,.437,19,3}},
thebanishedcells={{.481,.838,11,7}},
bangkorai={{.306,.871,14,5},{.398,.301,4,1},{.414,.417,4,1},{.386,.368,4,1},{.390,.393,4,1},{.501,.355,4,2},{.504,.391,4,2},{.555,.407,4,2},{.627,.358,4,3},{.557,.367,4,3},{.612,.321,4,3},{.592,.402,4,3},{.562,.215,4,4},{.548,.259,4,4},{.586,.291,4,4},{.613,.265,4,4},{.472,.336,4,5},{.472,.226,4,5},{.452,.282,4,5},{.528,.322,4,5},{.359,.216,4,6},{.431,.201,4,6},{.395,.202,4,6},{.583,.077,4,7},{.467,.169,4,7},{.532,.165,4,7},{.511,.117,4,7},{.690,.135,4,8},{.603,.140,4,8},{.625,.099,4,8},{.639,.130,4,8},{.627,.180,4,9},{.614,.152,4,9},{.661,.183,4,9},{.579,.177,4,9},{.625,.208,4,10},{.653,.249,4,10},{.704,.207,4,10},{.658,.208,4,10},{.678,.285,12,13},{.701,.288,12,13},{.630,.434,12,14},{.700,.495,12,14},{.655,.459,12,14},{.664,.442,12,14},{.627,.477,12,15},{.595,.532,12,15},{.573,.473,12,16},{.490,.511,12,16},{.440,.503,14,1},{.353,.468,14,1},{.475,.458,14,1},{.327,.540,14,2},{.343,.593,14,2},{.450,.562,14,2},{.329,.570,14,2},{.25,.64,14,3},{.296,.609,14,3},{.341,.606,14,3},{.304,.659,14,3},{.271,.726,14,4},{.258,.701,14,4},{.273,.845,14,5},{.313,.814,14,5},{.248,.879,14,5},{.326,.935,14,6},{.351,.866,14,6},{.376,.900,14,6},{.394,.834,14,6},{.44,.88,14,7},{.481,.923,14,7},{.476,.872,14,7},{.357,.747,14,8},{.442,.736,14,8},{.394,.782,14,8},{.39,.35,14,9},{.372,.681,14,9},{.337,.691,14,9},{.487,.659,14,10},{.521,.709,14,10},{.523,.673,14,10},{.471,.615,14,10},{.58,.63,18,7},{.559,.682,18,7},{.633,.723,18,8},{.593,.726,18,8},{.595,.696,18,8},{.606,.626,18,9},{.647,.675,18,9},{.690,.682,18,9},{.668,.647,18,9},{.495,.569,18,10},{.490,.560,18,10},{.372,.277,11,13}},
evermore={{.423,.165,4,1},{.354,.551,4,1},{.512,.839,4,1},{.374,.697,4,1},{.686,.858,14,1},{.38,.43,14,9}},
onsisbreathmine={{.207,.640,14,6}},
blackhearthavenarea1={{.708,.486,11,13}},
hallinsstand={{.540,.376,14,4},{.477,.259,14,4},{.292,.574,14,4}},
coldharbour={{.285,.598,29,1},{.378,.639,29,1},{.328,.643,29,2},{.215,.612,29,2},{.261,.697,29,2},{.317,.822,29,3},{.422,.739,29,3},{.365,.753,29,3},{.387,.670,29,3},{.513,.690,29,4},{.470,.692,29,4},{.534,.657,29,4},{.607,.717,29,5},{.573,.758,29,5},{.582,.692,29,5},{.759,.819,29,6},{.680,.643,29,6},{.710,.761,29,6},{.676,.700,29,6},{.718,.534,29,7},{.594,.535,29,7},{.676,.572,29,7},{.718,.485,29,7},{.639,.462,29,8},{.592,.407,29,8},{.608,.451,29,8},{.447,.416,29,9},{.470,.390,29,9},{.539,.385,29,9},{.54,.39,29,9},{.454,.510,29,10},{.569,.507,29,10},{.684,.806,7,1},{.579,.484,11,16}},
hollowcity={{.646,.569,29,4},{.301,.611,29,4},{.839,.289,29,4}},
vaultsofmadness1={{.16,.85,11,16}},
ava_whole_0={{.526,.577,8,1},{.734,.483,8,3},{.271,.228,8,4},{.721,.695,18,5},{.128,.385,8,6},{.267,.228,8,9},{.339,.637,8,10},{.338,.285,9,2},{.422,.147,9,4},{.220,.244,9,5},{.624,.582,9,7},{.275,.704,9,8},{.293,.170,9,9},{.583,.195,9,10},{.754,.285,10,2},{.323,.152,10,4},{.759,.347,10,5},{.274,.669,10,7},{.213,.398,10,8},{.321,.373,10,9},{.365,.611,10,10},{.203,.257,11,1},{.754,.149,11,2},{.538,.810,11,3},{.381,.723,11,4},{.710,.490,11,5},{.608,.451,11,6},{.355,.135,11,7},{.592,.388,11,8},{.779,.216,11,9},{.714,.536,11,10},{.241,.397,12,5},{.316,.563,12,8},{.750,.474,12,9},{.395,.688,12,10},{.260,.530,12,12},{.719,.435,12,14},{.316,.172,12,15},{.184,.459,12,16},{.122,.272,13,1},{.568,.841,13,1},{.483,.611,13,1},{.815,.180,13,1},{.629,.684,13,2},{.702,.376,13,3},{.222,.489,13,4},{.807,.279,13,5},{.501,.761,13,6},{.778,.204,13,7},{.569,.835,13,7},{.117,.271,13,7},{.810,.180,13,7},{.361,.221,13,8},{.363,.698,13,9},{.363,.415,13,10},{.408,.166,14,1},{.462,.615,14,2},{.309,.734,14,3},{.807,.461,14,5},{.391,.556,14,6},{.305,.663,14,8},{.790,.274,14,9},{.586,.660,15,1},{.901,.346,15,2},{.673,.596,15,5},{.455,.725,15,6},{.670,.664,15,7},{.278,.711,15,8},{.720,.425,15,9},{.249,.550,15,10},{.720,.583,16,5},{.716,.669,16,6},{.809,.297,16,7},{.587,.693,16,8},{.289,.485,16,9},{.715,.533,16,10},{.316,.247,17,2},{.661,.611,17,3},{.807,.251,17,4},{.154,.241,17,5},{.375,.330,17,6},{.188,.263,17,7},{.613,.565,17,8},{.206,.507,17,9},{.707,.414,17,10},{.647,.776,18,1},{.167,.373,18,2},{.709,.229,18,3},{.305,.715,18,4},{.503,.215,18,5},{.508,.822,18,6},{.719,.390,18,7},{.177,.273,18,8},{.525,.288,18,9},{.630,.692,18,10},{.537,.809,19,2},{.765,.386,19,5},{.389,.404,19,6},{.837,.258,19,7},{.685,.690,19,8},{.471,.208,19,9},{.306,.663,19,10}},
bloodmaynecave={{.451,.532,11,3}},
breakneckcave={{.537,.594,16,9}},
capstonecave={{.635,.218,9,4}},
crackedwoodcave={{.345,.257,15,5}},
echocave={{.664,.655,11,7}},
haynotecave={{.30,.43,12,8}},
kingscrest={{.687,.753,17,4}},
lipsandtarn={{.541,.394,17,5}},
muckvalleycavern={{.226,.750,11,5}},
newtcave={{.320,.465,8,5}},
nisincave={{.490,.425,13,9}},
potholecavern={{.615,.460,15,6}},
quickwatercave={{.473,.817,10,5}},
redrubycave={{.300,.360,9,10}},
serpenthollowcave={{.276,.572,17,9}},
toadstoolhollowlower={{.908,.368,18,5}},
underpallcave={{.311,.181,13,8}},
vahtacen={{.571,.642,14,5}},
imperialcity={{.366,.242,13,1},{.669,.145,17,8},{.703,.502,19,8}},
imperialsewer_daggerfall1={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
imperialsewer_daggerfall2={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
imperialsewer_daggerfall3={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewers_ebon1={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewers_ebon2={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
imperialsewer_ebonheart3={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewers_aldmeri1={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewers_aldmeri2={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewers_aldmeri3={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
Imperialsewershub={{.547,.265,17,1},{.864,.699,8,10},{.085,.642,17,2}},
deshaan={{.152,.447,23,1},{.121,.404,23,1},{.202,.455,23,2},{.185,.413,23,2},{.138,.454,23,2},{.436,.649,23,3},{.338,.634,23,3},{.367,.641,23,3},{.152,.494,23,4},{.19,.56,23,4},{.16,.55,23,4},{.118,.565,23,5},{.138,.619,23,5},{.126,.618,23,5},{.226,.587,23,6},{.200,.619,23,6},{.188,.597,23,6},{.302,.570,23,7},{.307,.621,23,7},{.288,.597,23,7},{.256,.610,23,7},{.240,.547,23,8},{.240,.524,23,8},{.274,.524,23,8},{.314,.453,23,9},{.395,.428,23,9},{.350,.445,23,9},{.244,.466,23,10},{.237,.491,23,10},{.223,.503,23,10},{.387,.620,8,3},{.359,.582,8,3},{.383,.562,8,3},{.344,.551,8,3},{.442,.376,8,4},{.427,.417,8,4},{.392,.382,8,4},{.572,.419,10,4},{.588,.467,10,4},{.538,.468,10,4},{.609,.506,10,4},{.558,.562,10,5},{.506,.564,10,5},{.888,.518,10,6},{.909,.546,10,6},{.870,.565,10,6},{.845,.541,10,6},{.775,.475,12,4},{.728,.467,12,4},{.753,.462,12,4},{.779,.441,12,4},{.867,.410,12,5},{.894,.364,12,5},{.835,.402,12,5},{.853,.380,12,5},{.611,.443,12,6},{.650,.477,12,6},{.673,.451,12,6},{.714,.434,12,6},{.405,.450,15,1},{.404,.485,15,1},{.751,.572,15,2},{.731,.512,15,2},{.687,.508,15,2},{.674,.425,15,3},{.646,.425,15,3},{.876,.481,15,4},{.865,.480,15,4},{.835,.449,15,4},{.846,.427,15,4},{.646,.546,15,5},{.673,.590,15,5},{.656,.525,15,5},{.454,.532,15,6},{.494,.532,15,6},{.407,.536,15,6},{.815,.560,15,7},{.799,.508,15,7},{.788,.561,15,7},{.562,.391,15,8},{.593,.326,15,8},{.900,.416,16,1},{.908,.437,16,1},{.767,.361,16,2},{.765,.394,16,2},{.755,.387,16,2},{.630,.609,16,3},{.674,.654,16,3},{.100,.487,16,4},{.125,.497,16,4},{.137,.539,16,4},{.110,.516,16,4},{.516,.565,16,5},{.460,.614,16,5},{.435,.588,16,5},{.790,.585,11,6}},
mournhold={{.204,.733,8,3},{.422,.030,8,4},{.957,.279,10,4},{.801,.742,10,5},{.309,.362,15,1},{.309,.194,15,1},{.743,.587,15,6},{.551,.589,15,6},{.324,.605,15,6},{.408,.392,15,6},{.853,.748,16,5},{.460,.860,16,5}},
narsis={{.606,.703,23,4},{.370,.680,23,4},{.855,.269,23,10},{.132,.568,16,4}},
darkshadecaverns={{.309,.222,11,6}},
eastmarch={{.50,.28,22,1},{.428,.622,22,1},{.253,.621,22,1},{.547,.507,22,2},{.559,.544,22,2},{.579,.532,22,2},{.666,.530,22,3},{.727,.577,22,3},{.626,.517,22,3},{.691,.535,22,3},{.582,.604,22,4},{.545,.617,22,4},{.557,.581,22,4},{.555,.638,22,4},{.613,.601,22,5},{.681,.586,22,5},{.656,.598,22,5},{.640,.578,22,5},{.616,.568,22,6},{.661,.561,22,6},{.652,.551,22,6},{.594,.577,22,6},{.638,.629,22,7},{.606,.621,22,7},{.680,.623,22,7},{.662,.664,22,7},{.716,.637,22,8},{.687,.646,22,8},{.710,.603,22,8},{.707,.566,22,8},{.784,.487,22,9},{.819,.515,22,9},{.837,.552,22,9},{.854,.490,22,9},{.714,.678,22,10},{.738,.692,22,10},{.684,.689,22,10},{.754,.659,22,10},{.558,.414,8,7},{.506,.415,8,7},{.494,.464,8,7},{.518,.431,8,7},{.157,.559,8,8},{.164,.580,8,8},{.143,.561,8,8},{.564,.432,10,8},{.373,.277,12,10},{.390,.248,12,10},{.393,.320,12,10},{.551,.263,12,11},{.463,.259,12,11},{.583,.268,12,12},{.584,.241,12,12},{.600,.311,12,12},{.592,.344,12,12},{.475,.363,13,1},{.437,.407,13,1},{.445,.355,13,1},{.413,.378,13,1},{.350,.360,13,2},{.384,.384,13,2},{.365,.411,13,2},{.471,.332,13,3},{.556,.293,13,3},{.525,.326,13,3},{.520,.360,13,4},{.494,.400,13,4},{.552,.355,13,4},{.464,.414,13,4},{.417,.430,13,5},{.446,.429,13,5},{.453,.422,13,5},{.459,.454,13,5},{.306,.429,13,6},{.344,.421,13,6},{.321,.414,13,6},{.256,.494,13,7},{.249,.462,13,7},{.226,.518,13,7},{.331,.494,13,8},{.334,.464,13,8},{.376,.444,13,8},{.288,.495,13,8},{.226,.628,13,9},{.177,.611,13,9},{.219,.680,13,9},{.250,.625,13,10},{.433,.503,18,1},{.262,.555,18,1},{.343,.657,18,2},{.389,.680,18,2},{.325,.679,18,2},{.397,.648,18,2},{.363,.589,18,3},{.368,.613,18,3},{.381,.599,18,3},{.411,.604,18,3},{.394,.542,18,4},{.416,.544,18,4},{.358,.557,18,4},{.443,.556,18,4},{.414,.491,18,5},{.419,.471,18,5},{.370,.505,18,5},{.482,.513,18,6},{.274,.565,18,6},{.737,.703,11,10}},
fortamol={{.302,.441,22,1},{.069,.481,13,9},{.274,.473,13,10},{.252,.220,13,10}},
windhelm={{.511,.573,22,1},{.509,.483,22,1},{.475,.571,12,11},{.201,.773,12,11},{.256,.378,12,11}},
icehammersvault={{.086,.328,10,8}},
direfrostkeep={{.541,.653,11,10}},
glenumbra={{.27,.74,1,1},{.22,.68,1,2},{.360,.715,1,3},{.373,.632,1,3},{.407,.673,1,3},{.316,.660,1,3},{.209,.590,1,4},{.251,.588,1,4},{.242,.600,1,4},{.235,.565,1,4},{.316,.514,1,5},{.259,.528,1,5},{.351,.540,1,5},{.359,.512,1,5},{.300,.574,1,6},{.343,.614,1,6},{.294,.632,1,6},{.352,.592,1,6},{.452,.526,1,7},{.400,.427,1,7},{.412,.536,1,7},{.477,.548,1,7},{.426,.576,1,7},{.423,.797,1,8},{.506,.650,1,8},{.434,.745,1,8},{.448,.714,1,8},{.499,.778,1,8},{.564,.724,1,9},{.540,.711,1,9},{.512,.693,1,9},{.484,.748,1,9},{.457,.640,1,10},{.502,.641,1,10},{.491,.623,1,10},{.494,.673,1,10},{.651,.374,8,1},{.693,.358,8,1},{.634,.418,8,1},{.692,.414,8,1},{.608,.450,8,2},{.590,.469,8,2},{.550,.507,8,2},{.294,.417,9,1},{.196,.443,9,1},{.234,.486,9,1},{.554,.609,9,2},{.588,.607,9,2},{.56,.58,9,2},{.642,.513,9,3},{.689,.538,9,3},{.641,.458,9,3},{.710,.475,9,3},{.744,.348,9,4},{.755,.406,9,4},{.721,.318,9,4},{.520,.400,9,5},{.494,.394,9,5},{.515,.450,9,5},{.515,.433,9,5},{.576,.372,9,6},{.615,.351,9,6},{.615,.371,9,6},{.553,.398,9,6},{.535,.385,9,6},{.518,.353,9,7},{.509,.344,9,7},{.534,.341,9,7},{.439,.349,9,8},{.424,.407,9,8},{.448,.379,9,8},{.324,.382,10,1},{.322,.342,10,1},{.347,.362,10,1},{.377,.307,10,1},{.806,.341,10,2},{.548,.234,10,2},{.817,.299,10,2},{.755,.269,10,3},{.792,.312,10,3},{.786,.232,10,3},{.82,.16,12,1},{.773,.156,12,2},{.686,.131,12,2},{.734,.149,12,2},{.754,.176,12,2},{.740,.197,12,3},{.723,.243,12,3},{.690,.174,19,1},{.605,.185,19,1},{.603,.233,19,2},{.637,.250,19,2},{.653,.234,19,2},{.684,.253,19,2},{.640,.273,19,3},{.644,.318,19,3},{.664,.339,19,3},{.605,.324,19,4},{.577,.301,19,4},{.590,.289,19,4},{.611,.282,19,4},{.573,.225,19,5},{.571,.263,19,5},{.557,.228,19,5},{.522,.234,19,5},{.714,.336,11,8}},
aldcroft={{.387,.648,9,2},{.381,.878,9,2}},
crosswych={{.554,.822,12,1},{.568,.621,12,1},{.397,.654,12,1},{.683,.648,12,1}},
daggerfall={{.749,.699,1,1},{.517,.636,1,1},{.311,.566,1,1},{.216,.089,1,2},{.431,.143,1,2},{.511,.290,1,2},{.606,.325,1,2},{.892,.254,1,3}},
desolationsend={{.856,.376,9,8}},
spindleclutch={{.677,.475,11,8}},
strosmkai={{.403,.509,12,11}},
grahtwood={{.743,.566,26,7},{.430,.749,26,1},{.406,.758,26,1},{.383,.780,26,1},{.417,.766,26,1},{.384,.676,26,2},{.485,.617,26,2},{.491,.560,26,2},{.415,.656,26,2},{.537,.682,26,3},{.533,.640,26,3},{.501,.703,26,3},{.646,.743,26,4},{.564,.714,26,4},{.588,.745,26,4},{.650,.712,26,4},{.549,.791,26,5},{.512,.752,26,5},{.456,.780,26,5},{.491,.810,26,5},{.664,.665,26,6},{.648,.589,26,6},{.615,.639,26,6},{.660,.645,26,6},{.852,.568,26,7},{.772,.521,26,7},{.778,.504,26,8},{.767,.602,26,8},{.840,.632,26,8},{.728,.602,26,8},{.739,.671,26,9},{.720,.728,26,9},{.694,.748,26,9},{.835,.765,26,10},{.829,.715,26,10},{.562,.171,8,3},{.596,.207,8,3},{.565,.261,8,4},{.519,.271,8,4},{.536,.233,8,4},{.460,.530,10,4},{.426,.580,10,4},{.418,.517,10,4},{.323,.608,10,5},{.318,.626,10,5},{.246,.598,10,5},{.295,.560,10,5},{.349,.549,10,6},{.303,.525,10,6},{.300,.433,10,6},{.301,.448,10,6},{.407,.466,12,4},{.377,.512,12,4},{.368,.433,12,4},{.390,.425,12,4},{.447,.428,12,5},{.456,.488,12,5},{.478,.462,12,5},{.445,.366,12,5},{.354,.370,12,6},{.373,.344,12,6},{.431,.327,12,6},{.619,.550,15,1},{.510,.548,15,2},{.579,.532,15,2},{.550,.566,15,2},{.777,.485,15,3},{.701,.438,15,3},{.757,.424,15,3},{.698,.490,15,3},{.680,.412,15,4},{.723,.372,15,4},{.647,.387,15,4},{.543,.381,15,5},{.585,.411,15,5},{.577,.354,15,5},{.507,.379,15,6},{.428,.294,15,6},{.499,.299,15,6},{.483,.358,15,6},{.642,.334,15,7},{.654,.309,15,7},{.608,.321,15,7},{.474,.187,15,8},{.459,.268,15,8},{.494,.234,15,8},{.429,.230,15,8},{.380,.393,16,1},{.322,.404,16,1},{.287,.334,16,1},{.268,.311,16,2},{.280,.226,16,2},{.288,.257,16,2},{.238,.130,16,3},{.335,.156,16,3},{.278,.161,16,3},{.284,.159,16,3},{.340,.267,16,4},{.395,.269,16,4},{.349,.230,16,4},{.327,.234,16,4},{.195,.157,16,5},{.194,.205,16,5},{.224,.225,16,5},{.256,.203,16,5},{.526,.484,11,5}},
eldenhollow={{.786,.624,11,5}},
eldenrootgroundfloor={{.745,.733,15,1},{.730,.484,15,1},{.566,.655,15,2},{.440,.808,15,2}},
haven={{.398,.252,26,9},{.235,.205,26,9},{.294,.496,26,9},{.170,.600,26,9},{.829,.425,26,10},{.857,.675,26,10},{.453,.586,26,10},{.514,.355,26,10}},
redfurtradingpost={{.778,.392,16,3},{.229,.439,16,3},{.279,.419,16,3}},
sacredleapgrotto={{.698,.528,26,7}},
greenshade={{.459,.299,27,1},{.432,.345,27,1},{.403,.298,27,1},{.553,.711,27,2},{.576,.653,27,2},{.591,.635,27,2},{.527,.717,27,2},{.444,.727,27,3},{.479,.760,27,3},{.510,.688,27,3},{.505,.782,27,4},{.492,.864,27,4},{.457,.783,27,4},{.448,.851,27,4},{.625,.790,27,5},{.611,.754,27,5},{.363,.525,27,6},{.313,.547,27,6},{.295,.495,27,6},{.338,.474,27,6},{.384,.565,27,7},{.359,.460,27,7},{.413,.460,27,7},{.251,.383,27,8},{.228,.298,27,8},{.313,.381,27,8},{.302,.356,27,8},{.549,.446,27,9},{.481,.482,27,9},{.569,.327,27,10},{.605,.313,27,10},{.535,.300,27,10},{.589,.349,27,10},{.317,.803,8,5},{.258,.856,8,5},{.376,.775,8,5},{.353,.843,8,5},{.485,.355,8,6},{.471,.402,8,6},{.526,.374,8,6},{.556,.364,8,6},{.665,.510,10,7},{.665,.546,10,7},{.714,.555,10,7},{.740,.508,10,7},{.367,.297,10,8},{.332,.326,10,8},{.293,.273,10,8},{.377,.372,10,8},{.705,.767,10,9},{.770,.814,10,9},{.752,.723,10,9},{.766,.779,10,9},{.717,.381,10,10},{.644,.374,10,10},{.637,.415,10,10},{.682,.322,10,10},{.786,.675,12,7},{.748,.627,12,7},{.692,.677,12,7},{.727,.698,12,7},{.343,.189,12,8},{.308,.148,12,8},{.260,.144,12,8},{.361,.143,12,8},{.656,.723,12,9},{.605,.703,12,9},{.648,.767,12,9},{.618,.672,12,9},{.360,.568,16,6},{.299,.571,16,6},{.336,.675,16,6},{.257,.669,16,7},{.240,.593,16,7},{.253,.635,16,7},{.119,.524,16,8},{.232,.549,16,8},{.197,.585,16,8},{.150,.548,16,8},{.092,.618,16,9},{.158,.598,16,9},{.167,.698,16,9},{.261,.774,17,1},{.198,.755,17,1},{.230,.776,17,1},{.21,.72,17,1},{.283,.747,17,2},{.294,.721,17,2},{.349,.703,17,2},{.451,.285,17,3},{.502,.254,17,3},{.451,.227,17,3},{.609,.879,17,4},{.618,.912,17,4},{.650,.890,17,4},{.523,.903,17,4},{.750,.846,17,5},{.728,.843,17,5},{.686,.880,17,5},{.348,.262,17,6},{.378,.273,17,6},{.274,.272,17,6},{.416,.216,17,6},{.402,.737,17,7},{.405,.628,17,7},{.378,.708,17,7},{.397,.607,17,7},{.335,.237,17,8},{.309,.241,17,8},{.301,.195,17,8},{.658,.300,11,12}},
falinesticave={{.398,.759,27,9}},
marbruk={{.245,.368,10,7},{.245,.607,10,7},{.565,.660,10,7},{.734,.355,10,7}},
woodhearth={{.795,.336,16,7},{.841,.498,16,7},{.860,.624,16,7},{.629,.305,16,8},{.229,.431,16,9},{.477,.357,16,9},{.514,.737,16,9},{.692,.815,17,1}},
cityofashmain={{.275,.444,11,12}},
malabaltor={{.728,.494,21,1},{.748,.411,21,1},{.708,.492,21,1},{.758,.450,21,1},{.200,.466,21,2},{.208,.535,21,2},{.783,.524,21,3},{.828,.493,21,3},{.80,.35,21,3},{.843,.477,21,3},{.231,.489,21,4},{.216,.461,21,4},{.236,.472,21,4},{.57,.50,21,5},{.602,.528,21,5},{.231,.401,21,6},{.349,.412,21,6},{.395,.397,21,6},{.808,.233,21,7},{.804,.170,21,7},{.471,.706,21,8},{.422,.657,21,8},{.473,.563,21,8},{.597,.650,21,9},{.602,.727,21,9},{.573,.703,21,9},{.614,.767,21,9},{.493,.420,21,10},{.481,.435,21,10},{.501,.398,21,10},{.513,.430,21,10},{.335,.599,8,7},{.367,.596,8,7},{.376,.595,8,7},{.435,.588,8,7},{.642,.234,8,8},{.616,.242,8,8},{.661,.225,8,8},{.680,.176,8,8},{.381,.623,12,10},{.424,.644,12,10},{.413,.656,12,10},{.644,.312,12,11},{.669,.328,12,11},{.477,.368,12,12},{.479,.326,12,12},{.186,.573,13,1},{.192,.589,13,1},{.218,.587,13,1},{.197,.605,13,1},{.722,.303,13,2},{.773,.326,13,2},{.751,.274,13,2},{.788,.298,13,2},{.54,.43,13,3},{.581,.465,13,3},{.611,.367,13,3},{.600,.395,13,3},{.283,.622,13,4},{.313,.602,13,4},{.292,.545,13,4},{.712,.657,13,5},{.658,.619,13,5},{.686,.595,13,5},{.679,.648,13,5},{.674,.833,13,6},{.667,.821,13,6},{.627,.870,13,6},{.625,.827,13,6},{.236,.543,13,7},{.578,.734,13,8},{.502,.736,13,8},{.580,.793,13,8},{.643,.386,13,9},{.643,.444,13,9},{.646,.455,13,9},{.667,.414,13,9},{.84,.30,13,10},{.847,.257,13,10},{.708,.492,13,10},{.639,.719,18,1},{.651,.714,18,1},{.647,.766,18,1},{.664,.789,18,1},{.579,.564,18,2},{.638,.505,18,2},{.563,.605,18,2},{.582,.624,18,2},{.375,.508,18,3},{.358,.555,18,3},{.428,.520,18,3},{.381,.458,18,3},{.643,.335,18,4},{.648,.280,18,4},{.601,.293,18,4},{.18,.49,18,5},{.15,.42,18,5},{.775,.576,18,6},{.728,.752,18,6},{.794,.571,18,6},{.755,.748,18,6},{.460,.330,11,14}},
baandaritradingpost={{.300,.613,21,3},{.097,.451,13,2},{.532,.242,13,10},{.565,.470,18,5}},
hoarvorpit={{.454,.434,21,8}},
deadmansdrop={{.517,.399,21,6}},
vulkwasten={{.607,.587,21,5},{.409,.669,21,5},{.437,.212,13,3},{.694,.378,13,3}},
ouze={{.274,.471,21,3}},
tempestisland={{.445,.367,11,4},{.365,.812,11,14}},
rootsofsilvenar={{.260,.447,21,1},{.249,.644,13,10}},
velynharbor={{.880,.603,21,2},{.843,.309,21,2},{.760,.395,18,5},{.637,.106,18,5},{.373,.150,18,5}},
blackvineruins={{.154,.484,13,2}},
reapersmarch={{.460,.107,28,1},{.562,.738,28,1},{.550,.685,28,1},{.512,.648,28,1},{.737,.151,28,2},{.710,.202,28,2},{.768,.187,28,2},{.690,.237,28,3},{.723,.251,28,3},{.769,.216,28,3},{.760,.303,28,3},{.79,.33,28,4},{.778,.405,28,4},{.639,.286,28,5},{.601,.234,28,5},{.590,.357,28,5},{.73,.33,28,6},{.69,.35,28,6},{.725,.283,28,6},{.691,.313,28,6},{.569,.408,28,7},{.520,.444,28,7},{.572,.382,28,8},{.624,.397,28,8},{.651,.388,28,8},{.49,.48,28,9},{.537,.452,28,9},{.546,.506,28,9},{.472,.457,28,9},{.590,.499,28,10},{.610,.543,28,10},{.577,.605,28,10},{.584,.548,28,10},{.412,.247,12,13},{.407,.191,12,13},{.373,.276,12,13},{.463,.274,12,14},{.539,.274,12,14},{.509,.307,12,14},{.443,.388,12,15},{.410,.422,12,15},{.391,.371,12,15},{.460,.335,12,15},{.217,.422,12,16},{.220,.400,12,16},{.152,.426,12,16},{.285,.449,14,1},{.369,.445,14,1},{.324,.427,14,1},{.283,.353,14,1},{.276,.482,14,2},{.300,.546,14,2},{.349,.493,14,2},{.281,.522,14,2},{.282,.623,14,3},{.252,.558,14,3},{.314,.592,14,3},{.267,.653,14,4},{.240,.660,14,4},{.241,.743,14,4},{.266,.713,14,4},{.305,.807,14,5},{.230,.793,14,5},{.306,.874,14,5},{.262,.850,14,5},{.329,.725,14,6},{.373,.800,14,6},{.295,.736,14,6},{.356,.762,14,6},{.468,.564,14,7},{.462,.494,14,7},{.446,.618,14,8},{.464,.655,14,8},{.415,.645,14,8},{.390,.664,14,9},{.331,.689,14,9},{.343,.607,14,9},{.316,.660,14,9},{.426,.789,14,10},{.385,.734,14,10},{.485,.771,14,10},{.442,.725,14,10},{.320,.128,18,7},{.336,.206,18,7},{.284,.261,18,7},{.466,.129,18,8},{.481,.210,18,8},{.51,.17,18,8},{.55,.19,18,9},{.56,.16,18,9},{.278,.343,18,10},{.331,.330,18,10},{.235,.341,18,10},{.206,.795,11,15}},
arenthia={{.157,.700,18,8},{.459,.643,18,9},{.429,.782,18,9}},
dune={{.480,.104,28,3},{.645,.229,28,4},{.312,.554,28,4},{.605,.559,28,4},{.327,.228,28,6},{.126,.350,28,6}},
rawlkha={{.551,.611,14,7},{.555,.323,14,7}},
selenesweb={{.706,.916,11,15}},
rivenspire={{.184,.664,3,1},{.183,.624,3,1},{.147,.593,3,1},{.707,.413,3,2},{.678,.411,3,2},{.718,.375,3,2},{.751,.382,3,2},{.726,.327,3,3},{.667,.332,3,3},{.682,.301,3,3},{.670,.381,3,3},{.853,.308,3,4},{.787,.328,3,4},{.824,.355,3,4},{.826,.332,3,4},{.423,.399,3,5},{.387,.359,3,5},{.397,.408,3,5},{.388,.442,3,5},{.472,.318,3,6},{.349,.317,3,6},{.400,.304,3,6},{.399,.331,3,6},{.687,.258,3,7},{.656,.229,3,7},{.730,.229,3,7},{.700,.215,3,7},{.727,.168,3,8},{.687,.136,3,8},{.708,.116,3,8},{.680,.175,3,8},{.826,.169,3,9},{.760,.221,3,9},{.797,.194,3,9},{.735,.258,3,10},{.724,.201,3,10},{.750,.152,3,10},{.810,.168,3,10},{.617,.686,8,5},{.650,.646,8,5},{.644,.679,8,5},{.600,.632,8,5},{.648,.589,8,6},{.699,.646,8,6},{.639,.629,8,6},{.695,.621,8,6},{.298,.634,10,7},{.358,.690,10,7},{.367,.654,10,7},{.306,.678,10,7},{.475,.676,10,8},{.482,.713,10,8},{.434,.689,10,8},{.418,.694,10,8},{.491,.605,10,9},{.480,.658,10,9},{.422,.635,10,9},{.40,.53,12,7},{.572,.688,12,8},{.526,.670,12,8},{.511,.638,12,8},{.258,.507,12,9},{.235,.564,12,9},{.201,.538,12,9},{.273,.521,12,9},{.331,.557,16,6},{.310,.516,16,6},{.333,.492,16,6},{.800,.303,16,7},{.748,.310,16,7},{.754,.261,16,7},{.827,.262,16,7},{.300,.575,16,8},{.360,.625,16,8},{.339,.592,16,8},{.307,.601,16,8},{.534,.584,16,9},{.539,.615,16,9},{.584,.616,16,9},{.504,.561,17,1},{.557,.553,17,1},{.506,.510,17,1},{.366,.426,17,2},{.299,.363,17,2},{.263,.651,17,3},{.252,.642,17,3},{.271,.614,17,3},{.216,.611,17,3},{.579,.542,17,4},{.630,.555,17,4},{.578,.570,17,4},{.626,.514,17,5},{.600,.510,17,5},{.581,.479,17,5},{.575,.494,17,5},{.687,.670,17,6},{.689,.703,17,6},{.706,.729,17,6},{.711,.698,17,6},{.633,.716,17,7},{.587,.740,17,7},{.599,.705,17,7},{.616,.753,17,7},{.65,.423,17,8},{.598,.452,17,8},{.611,.439,17,8},{.635,.474,17,8},{.677,.466,19,2},{.700,.450,19,2},{.725,.450,19,2},{.721,.736,11,3}},
hoarfrost={{.386,.385,17,4},{.400,.094,17,4},{.776,.694,17,4}},
shornhelm={{.259,.668,7,4},{.681,.633,10,10},{.339,.736,10,10},{.642,.648,10,10},{.307,.453,12,7},{.418,.271,12,7},{.627,.309,12,7},{.979,.533,17,1}},
northpoint={{.087,.604,3,7},{.072,.213,3,8},{.708,.226,3,9},{.277,.560,3,9},{.519,.390,3,9},{.598,.602,3,9},{.597,.214,3,10},{.213,.115,3,10},{.243,.811,16,7}},
shroudedpass={{.183,.263,17,2}},
cryptofhearts={{.457,.240,11,3},{.678,.181,11,3}},
shadowfen={{.187,.748,6,1},{.177,.805,6,1},{.149,.820,6,1},{.093,.811,6,1},{.605,.385,6,2},{.367,.638,6,2},{.185,.826,6,2},{.457,.836,6,3},{.491,.744,6,3},{.467,.775,6,3},{.521,.837,6,3},{.452,.650,6,4},{.445,.623,6,4},{.480,.705,6,4},{.419,.687,6,4},{.302,.574,6,5},{.270,.609,6,5},{.166,.586,6,5},{.274,.519,6,5},{.307,.497,6,6},{.372,.450,6,6},{.329,.523,6,6},{.185,.658,6,7},{.257,.695,6,7},{.193,.693,6,7},{.236,.654,6,7},{.425,.562,6,8},{.380,.597,6,8},{.409,.494,6,8},{.285,.676,6,9},{.384,.758,6,9},{.385,.669,6,9},{.330,.676,6,9},{.529,.724,6,10},{.553,.705,6,10},{.571,.654,6,10},{.505,.659,6,10},{.44,.29,7,4},{.679,.375,8,5},{.665,.407,8,5},{.630,.378,8,5},{.636,.429,8,5},{.605,.226,8,6},{.527,.233,8,6},{.622,.288,8,6},{.572,.265,8,6},{.450,.430,10,7},{.409,.412,10,7},{.456,.377,10,7},{.560,.327,10,8},{.585,.359,10,8},{.519,.394,10,8},{.208,.356,10,9},{.284,.294,10,9},{.288,.341,10,9},{.272,.384,10,9},{.49,.27,10,10},{.444,.258,10,10},{.455,.303,10,10},{.352,.362,12,7},{.353,.305,12,7},{.335,.404,12,7},{.312,.317,12,7},{.451,.157,12,8},{.517,.185,12,8},{.488,.208,12,8},{.362,.182,12,9},{.404,.201,12,9},{.367,.225,12,9},{.305,.154,12,9},{.271,.244,16,6},{.327,.255,16,6},{.247,.212,16,6},{.553,.298,16,7},{.733,.445,16,8},{.814,.421,16,8},{.836,.447,16,8},{.769,.501,16,8},{.848,.512,16,9},{.851,.595,16,9},{.786,.605,16,9},{.766,.563,16,9},{.504,.519,17,1},{.532,.568,17,1},{.475,.543,17,1},{.609,.506,17,2},{.691,.502,17,2},{.625,.529,17,2},{.665,.647,17,3},{.543,.607,17,3},{.615,.623,17,3},{.581,.815,17,4},{.672,.861,17,4},{.656,.812,17,4},{.703,.691,17,5},{.624,.721,17,5},{.590,.705,17,5},{.760,.775,17,6},{.770,.671,17,6},{.793,.714,17,6},{.827,.694,17,6},{.855,.777,17,7},{.894,.763,17,7},{.823,.783,17,7},{.780,.811,17,8},{.720,.817,17,8},{.807,.828,17,8},{.727,.847,17,8},{.165,.584,11,11}},
stormhold={{.420,.655,7,4},{.768,.490,10,10},{.441,.407,10,10},{.509,.691,10,10},{.710,.084,12,8},{.525,.138,12,8},{.860,.678,16,7}},
altencorimont={{.405,.821,17,3},{.570,.592,17,3},{.153,.680,17,3}},
arxcorinium={{.143,.315,11,11}},
stonefalls={{.589,.678,20,8},{.755,.647,20,1},{.706,.622,20,1},{.776,.584,20,1},{.795,.620,20,1},{.777,.555,20,2},{.770,.514,20,2},{.820,.512,20,2},{.348,.338,20,3},{.325,.361,20,3},{.315,.406,20,3},{.229,.357,20,4},{.226,.378,20,4},{.168,.407,20,4},{.57,.51,20,5},{.354,.512,20,6},{.393,.468,20,6},{.282,.492,20,6},{.284,.290,20,7},{.283,.262,20,7},{.245,.233,20,7},{.225,.207,20,7},{.547,.699,20,8},{.632,.693,20,8},{.651,.687,20,8},{.166,.365,20,9},{.192,.363,20,9},{.200,.319,20,9},{.202,.293,20,9},{.146,.569,20,10},{.135,.605,20,10},{.181,.583,20,10},{.186,.593,20,10},{.859,.430,8,1},{.808,.380,8,1},{.820,.404,8,1},{.788,.431,8,1},{.575,.572,8,2},{.585,.605,8,2},{.580,.588,8,2},{.583,.594,8,2},{.470,.601,9,1},{.446,.593,9,1},{.499,.614,9,1},{.498,.583,9,1},{.269,.671,9,2},{.305,.677,9,2},{.288,.621,9,2},{.297,.635,9,2},{.251,.503,9,3},{.275,.578,9,3},{.219,.554,9,3},{.290,.558,9,3},{.930,.410,9,4},{.896,.436,9,4},{.947,.467,9,4},{.90,.38,9,4},{.412,.543,9,5},{.414,.440,9,5},{.429,.475,9,5},{.434,.445,9,5},{.779,.349,9,6},{.698,.357,9,6},{.769,.389,9,6},{.78,.31,9,6},{.180,.210,9,7},{.205,.204,9,7},{.173,.226,9,7},{.153,.199,9,7},{.228,.497,9,8},{.202,.458,9,8},{.200,.482,9,8},{.379,.593,10,1},{.326,.584,10,1},{.337,.578,10,1},{.345,.559,10,1},{.168,.486,10,2},{.122,.453,10,2},{.390,.370,10,3},{.376,.376,10,3},{.361,.408,10,3},{.358,.449,10,3},{.094,.447,11,1},{.656,.373,12,1},{.688,.367,12,1},{.606,.407,12,1},{.717,.393,12,1},{.720,.530,12,2},{.755,.505,12,2},{.680,.530,12,2},{.339,.718,12,3},{.338,.675,12,3},{.651,.559,19,1},{.609,.496,19,1},{.595,.463,19,1},{.474,.637,19,2},{.484,.720,19,2},{.383,.745,19,2},{.495,.670,19,2},{.526,.362,19,3},{.552,.339,19,3},{.544,.371,19,3},{.24,.65,19,4},{.85,.32,19,5}},
davonswatch={{.708,.665,9,4},{.687,.962,9,4},{.859,.830,9,4},{.117,.332,9,6},{.256,.679,8,1},{.504,.931,8,1},{.799,.395,19,5},{.464,.409,19,5},{.634,.592,19,5},{.706,.237,19,5}},
ebonheart={{.632,.579,20,5},{.455,.755,20,5},{.535,.535,20,5},{.272,.396,20,5}},
kragenmoor={{.515,.367,19,4},{.597,.623,19,4},{.702,.497,19,4},{.257,.524,19,4}},
hightidehollow={{.140,.328,9,3}},
innerseaarmature={{.539,.229,12,1}},
mephalasnest={{.564,.292,8,2}},
softloamcavern={{.428,.435,10,3}},
fungalgrotto={{.331,.785,11,1}},
stormhaven={{.480,.602,10,6},{.245,.198,2,1},{.179,.232,2,1},{.212,.225,2,1},{.180,.472,2,2},{.202,.441,2,2},{.166,.510,2,3},{.200,.594,2,3},{.181,.620,2,3},{.135,.580,2,3},{.262,.299,2,4},{.310,.350,2,4},{.320,.316,2,4},{.299,.286,2,4},{.382,.390,2,5},{.556,.417,2,5},{.329,.374,2,5},{.349,.349,2,5},{.369,.352,2,5},{.272,.434,2,6},{.360,.423,2,6},{.323,.471,2,6},{.279,.493,2,7},{.251,.489,2,7},{.214,.536,2,7},{.281,.529,2,7},{.303,.588,2,8},{.273,.656,2,8},{.333,.663,2,8},{.302,.635,2,8},{.376,.651,2,9},{.395,.594,2,9},{.354,.565,2,9},{.341,.608,2,9},{.236,.275,2,10},{.208,.298,2,10},{.17,.28,2,10},{.261,.413,8,3},{.256,.362,8,3},{.236,.328,8,3},{.256,.391,8,3},{.147,.335,8,4},{.161,.303,8,4},{.149,.348,8,4},{.50,.58,10,4},{.476,.633,10,6},{.446,.607,10,6},{.562,.577,11,9},{.461,.491,12,4},{.408,.510,12,4},{.486,.511,12,4},{.417,.414,12,5},{.416,.458,12,5},{.449,.415,12,5},{.538,.347,12,6},{.422,.352,12,6},{.485,.358,12,6},{.418,.547,15,1},{.435,.582,15,1},{.461,.553,15,1},{.667,.366,15,2},{.654,.347,15,2},{.641,.391,15,2},{.672,.395,15,2},{.736,.437,15,3},{.716,.450,15,3},{.775,.412,15,4},{.773,.447,15,4},{.805,.428,15,4},{.812,.459,15,5},{.738,.472,15,5},{.785,.495,15,5},{.654,.592,15,6},{.659,.539,15,6},{.683,.599,15,6},{.692,.558,15,6},{.744,.507,15,7},{.703,.514,15,7},{.746,.541,15,7},{.781,.539,15,7},{.839,.464,15,8},{.884,.449,15,8},{.878,.442,15,8},{.885,.498,15,8},{.527,.384,16,1},{.495,.403,16,1},{.532,.460,16,2},{.574,.501,16,2},{.587,.463,16,2},{.553,.376,16,3},{.571,.368,16,3},{.605,.422,16,3},{.618,.363,16,3},{.695,.425,16,4},{.686,.464,16,4},{.629,.514,16,5},{.647,.484,16,5},{.700,.493,16,5},{.655,.510,16,5},{.443,.545,12,4}},
alcairecastle={{.603,.351,2,1},{.863,.293,2,1},{.770,.593,2,10},{.496,.753,2,10}},
koeglinvillage={{.245,.672,2,2},{.525,.303,2,2}},
wayrest={{.226,.410,10,4},{.610,.298,10,4},{.308,.212,10,4},{.465,.564,10,5},{.827,.374,10,5},{.075,.660,10,6},{.215,.096,15,1},{.970,.454,15,6},{.361,.080,16,2},{.486,.115,9,9}},
wayrestsewers={{.830,.100,11,9}},
therift={{.497,.291,24,1},{.482,.280,24,1},{.510,.333,24,1},{.589,.344,24,2},{.582,.268,24,2},
--{.617,.285,24,2},{.646,.275,24,2},
{.619,.522,24,3},{.543,.532,24,3},{.558,.502,24,3},{.586,.488,24,3},{.834,.534,24,4},{.836,.571,24,4},{.851,.524,24,4},{.849,.521,24,4},{.412,.530,24,5},{.390,.438,24,5},{.365,.474,24,5},{.433,.478,24,5},{.512,.550,24,6},{.510,.601,24,6},{.476,.603,24,6},{.475,.557,24,6},{.183,.407,24,7},{.197,.421,24,7},{.201,.392,24,7},{.212,.403,24,7},{.376,.316,24,8},{.488,.401,24,8},{.444,.353,24,8},{.470,.432,24,8},{.685,.515,24,9},{.721,.509,24,9},{.655,.311,24,10},{.670,.289,24,10},{.734,.401,12,13},{.718,.404,12,13},{.773,.397,12,13},{.393,.562,12,14},{.398,.577,12,14},{.419,.567,12,14},{.385,.574,12,14},{.716,.665,12,15},{.736,.635,12,15},{.361,.524,12,15},{.654,.618,12,15},{.370,.263,12,16},{.294,.270,12,16},{.07,.483,13,9},{.923,.623,14,1},{.898,.587,14,1},{.859,.592,14,1},{.110,.451,14,2},{.130,.411,14,2},{.789,.502,14,3},{.821,.489,14,3},{.777,.450,14,3},{.685,.375,14,4},{.645,.369,14,4},{.647,.404,14,4},{.80,.62,14,5},{.836,.613,14,5},{.783,.602,14,5},{.157,.448,14,6},{.164,.475,14,6},{.180,.479,14,6},{.209,.463,14,6},{.191,.335,14,7},{.251,.273,14,7},{.198,.310,14,7},{.157,.262,14,7},{.658,.574,14,8},{.719,.559,14,8},{.082,.237,14,9},{.083,.273,14,9},{.120,.322,14,9},{.092,.296,14,9},{.317,.423,14,10},{.371,.388,14,10},{.329,.435,14,10},{.259,.413,18,7},{.233,.392,18,7},{.504,.443,18,8},{.498,.471,18,8},{.519,.470,18,8},{.531,.403,18,9},{.498,.367,18,9},{.862,.630,18,10},{.806,.680,18,10},{.806,.684,18,10},{.891,.646,11,17}},
riften={{.552,.677,24,9},{.813,.634,24,9},{.298,.551,24,9}},
shorsstone={{.354,.586,24,10},{.451,.434,24,10},{.566,.540,24,10}},
nimalten={{.494,.523,18,7},{.606,.619,18,7},{.582,.380,18,7},{.443,.489,18,7}},
avancheznel={{.770,.526,12,14}},
brokenhelm={{.305,.582,14,5}},
ebonmeretower={{.342,.378,18,8}},
fallowstonevault={{.101,.448,24,2}},
forelhost={{.281,.613,14,5}},
fortgreenwall={{.454,.672,12,13}},
snaplegcave={{.74,.59,12,16}},
trolhettacave={{.502,.261,18,10}},
blessedcrucible2={{.240,.443,11,17}},
blessedcrucible4={{.240,.443,11,17}},
blessedcrucible5={{.240,.443,11,17}},
blessedcrucible6={{.240,.443,11,17}},
blessedcrucible7={{.240,.443,11,17}},
wrothgar={{.634,.309,11,5},{.649,.329,11,5},{.476,.545,16,7},{.462,.511,16,7},{.460,.457,16,7},{.510,.694,14,2},{.806,.325,8,3},{.730,.257,8,3},{.283,.707,19,9},{.286,.694,19,9}},
abagarlas={{.247,.548,29,1}},
mzendeldt={{.39,.92,29,2}},
chateaumasterbedroom={{.422,.482,7,2}},
circusofcheerfulslaughter={{.279,.699,7,3}},
gladeofthedivineshivering={{.516,.561,7,4}},
cheesemongershollow={{.790,.253,7,1}},
dbsanctuary={{.802,.532,16,9}},
--vvardenfell={{.648,.571,8,5},{.403,.808,20,3},{.319,.627,8,4},{.441,.747,10,10},{.557,.754,8,5},{.595,.756,8,5},{.627,.813,20,8},{.720,.828,22,9},{.778,.715,23,1},{.879,.705,11,6},{.901,.533,23,1},{.713,.456,23,9},{.750,.259,23,1},{.447,.206,20,8},{.423,.195,20,8},{.405,.267,8,4},{.288,.220,10,10},{.242,.23,11,6},{.288,.289,23,1},{.169,.289,8,4},{.329,.474,23,9}},
vvardenfell={{.404,.809,20,3},{.882,.612,20,3},{.34,.528,20,3},{.502,.244,8,4},{.405,.269,8,4},{.32,.627,8,4},{.169,.291,8,4},{.648,.57,8,5},{.557,.756,8,5},{.74,.53,8,5},{.597,.76,8,5},{.29,.22,10,10},{.78,.62,10,10},{.441,.747,10,10},{.878,.706,11,6},{.741,.834,11,6},{.243,.231,11,6},{.652,.28,11,6},{.627,.813,20,8},{.444,.206,20,8},{.67,.849,20,8},{.423,.198,20,8},{.485,.65,22,9},{.165,.374,22,9},{.72,.828,22,9},{.286,.29,23,1},{.778,.715,23,1},{.751,.26,23,1},{.9,.534,23,1},{.607,.911,23,3},{.311,.338,23,3},{.389,.722,23,3},{.579,.7,23,3},{.193,.427,23,9},{.33,.475,23,9},{.686,.622,23,9},{.712,.456,23,9}},
--Need to confirm:
--["coldharbour"]={{.683,.806}},
hewsbane={{.382,.595,11,3},{.446,.592,18,5}},
}
local TreasureMaps={
u38_telvannipeninsula={--Provided by Gamer1986PAN
{.374,.621,196201},--Telvanni Peninsula CE Treasure Map I
{.662,.664,196202},--Telvanni Peninsula CE Treasure Map II
{.626,.584,198097},--Telvanni Peninsula Treasure Map I
{.769,.540,198098},--Telvanni Peninsula Treasure Map II
{.637,.498,198099},--Telvanni Peninsula Treasure Map III
{.289,.385,198100},--Telvanni Peninsula Treasure Map IV
{.732,.551,198291},--Blacksmith Survey: Telvanni Peninsula
{.597,.504,198297},--Woodworker Survey: Telvanni Peninsula
{.488,.756,198294},--Jewelry Crafting Survey: Telvanni Peninsula
{.214,.456,197842}}, -- Hand of Almalexia Clue
u38_apocrypha={--Provided by Gamer1986PAN
{.384,.465,196203},--Apocrypha CE Treasure Map
{.754,.400,198101},--Apocrypha Treasure Map I
{.454,.338,198102},--Apocrypha Treasure Map II
{.798,.7089,198290},--Clothier Survey: Apocrypha
{.696,.4008,198289},--Enchanter Survey: Apocrypha
{.400,.388,198288}},--Alchemist Survey: Apocrypha
u36_galenisland={--Provided by art1ink
{.44,.247,192370},--Galen Treasure Map I
{.403,.413,192371},--Galen Treasure Map II
{.593,.355,191158}},--Druid King Vestments Clue (Galen and Y'ffelon)
u34_gonfalonbaycity={--Provided by art1ink
{.92,.63,187668}},--High Isle CE Treasure Map I
u34_systreszone={--Provided by art1ink
{.156,.779,187906},--Knight Commander Clue (High Isle and Amenos) 
{.538,.629,188191,1},--Alchemy Survey (Provided by ApoAlaia)
{.671,.343,188193,1},--Blacksmith Survey
{.897,.373,188194,1},--Clothier Survey
{.292,.405,188195,1},--Enchanter Survey
{.415,.806,188196,1},--Jewelry Survey
{.242,.530,188197,1},--Woodworker Survey
{.601,.868,187668},--High Isle CE Treasure Map I
{.243,.832,187669},--High Isle CE Treasure Map II
{.319,.825,187670},--High Isle CE Treasure Map III
{.168,.537,187671},--High Isle Treasure Map I
{.934,.321,187672},--High Isle Treasure Map II
{.74,.316,187673},--High Isle Treasure Map III
{.674,.245,187674},--High Isle Treasure Map IV
{.61,.749,187675},--High Isle Treasure Map V
{.459,.606,187676}},--High Isle Treasure Map VI
u32deadlandszone={--Provided by art1ink
{.245,.806,183005},--The Deadlands Treasure Map I
{.763,.385,183006}},--The Deadlands Treasure Map II
blackwood={--Provided by Shantoo
{.366,.19,178465,1},--Woodworker Survey
{.564,.146,178468,1},--Enchanter Survey
{.732,.558,178466,1},--Jewellery Survey
{.519,.651,178464,1},--Blacksmith Survey
{.463,.449,178467,1},--Clothier Survey
{.746,.803,178469,1},--Alchemy Survey
--Provided by art1ink:
{.311,.647,175547},--Treasure Map I
{.149,.441,175548},--Treasure Map II
{.822,.766,175549},--Treasure Map III
{.554,.149,175550},--Treasure Map IV
{.527,.7,175551},--Treasure Map V
{.389,.102,175552},--Treasure Map VI
{.765,.854,175544},--CE Treasure Map I
{.651,.427,175545},--CE Treasure Map II
{.317,.354,175546}},--CE Treasure Map III
reach={{.386,.681,171474}},U28_blackreach={{.156,.725,171475}},--Provided by SuppeFuss165
westernskryim={{.33,.297,166460,1},{.567,.684,166461,1},{.194,.430,166462,1},{.755,.571,166465,1},{.562,.488,166459,1},{.44,.58,166464,4},{.407,.51,166035},{.54,.4627,166040},{.537,.591,166041},{.289,.62,166042},{.264,.554,166043}},
blackreach={{.824,.482,166036},{.894,.554,166037},{.21,.674,166038},{.224,.587,166039}},
southernelsweyr={{.468,.636,156716},{.293,.256,156715}},
elsweyr={{.319,.725,147922},{.699,.251,147923},{.811,.361,147924},{.6116,.4083,151613},{.4213,.2241,151614},{.4007,.5826,151615},{.2691,.7504,151616},{.4872,.6790,151617},{.6343,.4535,151618},{.4410,.3880,151602,1},{.3157,.5561,151599,1},{.4283,.4209,151601,1},{.2685,.4400,151598,1},{.4918,.6791,151600,1},{.6120,.6430,151603,4}},
murkmire={{.546,.378,145510},{.45,.408,145512}},
summerset={{.335,.324,139008},{.204,.626,139009},{.598,.56,139007},{.486,.197,43748},{.367,.4,43750},{.356,.568,43751},{.169,.32,43752},{.672,.782,43753},{.701,.678,43749}},
khenarthisroost={{.611,.757,43695},{.225,.314,43696},{.410,.584,43697},{.773,.337,43698},{.616,.832,44939},{.399,.366,45010}},
auridon={
{.512,.906,187892},--Summerset (Raid) Sacking Clue (Auridon) 
{.577,.328,187894},--Psijic Relicmaster Clue (Auridon, Wansalen)
{.2,.217,153640,"staff"},{.493,.888,43625},{.485,.641,43626},{.441,.507,43627},{.664,.411,43628},{.5,.253,43629},{.335,.127,43630},{.685,.963,44927},{.545,.302,57744,1},{.447,.285,57733,1},{.548,.465,57741,1},{.635,.695,57687,1},{.408,.700,57738,1},{.399,.61,139422,4}},
grahtwood={
{.428,.569,188203},--Grand Larceny Clue (Grahtwood)
{.395,.675,43631},{.649,.477,43632},{.629,.381,43633},{.473,.340,43634},{.355,.356,43635},{.469,.471,43636},{.312,.600,44937},{.767,.469,57747,1},{.314,.582,57750,1},{.457,.787,57754,1},{.612,.380,57771,1},{.425,.264,57816,1},{.389,.393,139425,4}},
eldenrootgroundfloor={{.882,.410,43632}},
greenshade={
{.264,.144,187902},--Serpentguard Rider Clue (Greenshade) 
{.654,.834,43637},{.722,.741,43638},{.363,.505,43639},{.340,.323,43640},{.250,.149,43641},{.597,.383,43642},{.593,.811,44938},{.556,.395,57757,1},{.764,.826,57774,1},{.599,.627,57788,1},{.502,.289,57802,1},{.299,.813,57819,1},{.231,.401,139427,4}},
malabaltor={{.825,.446,153644,"2hsword"},{.202,.499,43643},{.054,.477,43644},{.501,.681,43645},{.653,.703,43646},{.800,.286,43647},{.662,.230,43648},{.123,.525,44940},{.802,.161,57777,1},{.277,.627,57760,1},{.832,.494,57791,1},{.584,.797,57805,1},{.585,.586,57822,1},{.413,.658,139430,4}},
velynharbor={{.208,.358,43644},{.513,.564,44940}},
reapersmarch={
{.324,.521,188204},--Ring's Guile Clue (Reaper's March)
{.298,.153,153645,"bow"},{.378,.431,43649},{.334,.127,43650},{.270,.651,43651},{.441,.692,43652},{.551,.416,43653},{.668,.240,43654},{.408,.543,44941},{.329,.736,57808,1},{.592,.518,57763,1},{.300,.361,57780,1},{.645,.220,57793,1},{.428,.848,57825,1},{.247,.531,139432,4}},
rawlkha={{.075,.450,44941},{-1.209,.357,139432,4}},
bleakrock={{.438,.406,43699},{.426,.220,43700},{.463,.649,44931}},
bleakrockvillage={{.554,.671,44931}},
balmora={{.256,.526,187888}},--House Embassy Clue (Vvardenfell) 
balfoyen={{.600,.709,43701},{.24,.53,43702},{.52,.42,44928}},
stonefalls={
{.940,.373,187726},--Blackfeather Knave Clue (Stonefalls, Crow's Wood)
{.823,.401,153648,"1haxe"},{.793,.575,43655},{.603,.489,43656},{.471,.592,43657},{.177,.451,43658},{.193,.550,43659},{.362,.702,43660},{.520,.612,44944},{.671,.574,57737,1},{.311,.435,57740,1},{.159,.559,57743,1},{.559,.390,57746,1},{.747,.582,57735,1},{.683,.639,139424,4}},
ebonheart={{.540,.091,57746,1}},
deshaan={
{.18,.48,187890},--Hlaalu Councilor Clue (Deshaan)
{.526,.569,197843},--Mercymother Elite Clue
{.259,.550,43661},{.184,.472,43662},{.463,.405,43663},{.758,.561,43664},{.899,.549,43665},{.792,.509,43666},{.352,.640,44934},{.476,.420,57748,1},{.787,.408,57751,1},{.238,.481,57755,1},{.148,.496,57772,1},{.637,.550,57817,1},{.485,.615,139426,4}},
shadowfen={{.483,.701,153647,"shield"},{.369,.150,43667},{.708,.392,43668},{.704,.701,43669},{.609,.611,43670},{.406,.469,43671},{.238,.564,43672},{.642,.455,44943},{.751,.430,57758,1},{.358,.265,57775,1},{.795,.852,57789,1},{.400,.695,57803,1},{.580,.679,57820,1},{.888,.686,139428,4}},
eastmarch={{.431,.587,153643,"2haxe"},{.441,.374,43673},{.313,.458,43674},{.430,.591,43675},{.366,.598,43676},{.736,.660,43677},{.605,.539,43678},{.713,.583,44935},{.680,.612,57761,1},{.379,.604,57778,1},{.353,.288,57801,1},{.530,.414,57807,1},{.452,.497,57823,1},{.392,.686,139440,4}},
therift={
{.541,.391,187898},--Blood Sacrifice Clue (The Rift)
{.354,.336,194360},--Rift Treasure Map, Scrivener's Treasure
{.741,.378,43679},{.471,.433,43680},{.227,.362,43681},{.479,.556,43682},{.838,.571,43683},{.751,.639,43684},{.581,.609,44947},{.629,.357,57765,1},{.417,.422,57782,1},{.714,.558,57794,1},{.151,.296,57809,1},{.497,.336,57826,1},{.803,.42,139433,4}},
nimalten={{.415,.323,43681}},
strosmkai={
{.085,.599,188205},--Grand Oratory Clue (Stros M'Kai)
{.545,.640,43691},{.098,.612,43692},{.70,.33,44946}},
betnihk={{.173,.313,43693},{.568,.875,43694},{.455,.436,44930}},
glenumbra={
{.672,.364,187886},--Murder of Crows Clue (Glenumbra)
{.607,.204,153642,"dagger"},{.526,.761,43507},{.492,.454,43525},{.659,.261,43527},{.733,.528,43600},{.275,.528,43509},{.515,.254,43526},{.703,.466,44936},{.715,.303,57734,1},{.414,.596,57739,1},{.646,.503,57742,1},{.343,.493,57745,1},{.365,.840,57736,1},{.222,.514,139423,4}},
stormhaven={{.231,.522,43601},{.256,.346,43602},{.402,.473,43603},{.419,.592,43604},{.690,.501,43605},{.798,.519,43606},{.475,.447,44945},{.340,.565,57749,1},{.344,.344,57752,1},{.268,.316,57756,1},{.794,.500,57773,1},{.571,.446,57818,1},{.261,.456,139408,4}},
rivenspire={
{.713,.73,191157},--Wispheart Totem Clue (Rivenspire)
{.706,.696,153646,"1hhammer"},{.328,.509,43607},{.177,.628,43608},{.717,.436,43609},{.720,.719,43610},{.758,.319,43611},{.409,.299,43612},{.759,.162,44942},{.297,.641,57759,1},{.806,.329,57776,1},{.692,.624,57790,1},{.618,.431,57804,1},{.544,.643,57821,1},{.674,.117,139429,4}},
northpoint={{.276,.177,44942}},
alikr={
{.713,.57,188206},-- Ansei's Victory Clue (Alik'r Desert)
{.854,.557,153639,"1hsword"},{.380,.699,43613},{.111,.521,43614},{.626,.630,43615},{.583,.256,43616},{.786,.525,43617},{.717,.469,43618},{.324,.367,44926},{.613,.610,57762,1},{.415,.632,57779,1},{.150,.482,57792,1},{.782,.362,57806,1},{.587,.379,57824,1},{.9,.532,139431,4}},
sentinel={{.774,.050,44926}},
kozanset={{.226,.596,43618}},
evermore={{.191,.648,57781,1}},
bangkorai={
{.407,.484,190927},--Legion's Arrival Clue (Bangkorai) 
{.522,.544,187904},--Knights of Saint Pelin Clue (Bangkorai) 
{.59,.4,153641,"2hhammer"},{.433,.270,43619},{.614,.208,43620},{.718,.383,43621},{.325,.455,43622},{.329,.693,43623},{.644,.692,43624},{.609,.759,44929},{.527,.162,57810,1},{.580,.376,57764,1},{.358,.384,57781,1},{.473,.615,57795,1},{.670,.702,57827,1},{0.467,0.693,139434,4}},
coldharbour={
{.657,.376,187896},--Ceporah's Insight Clue (Coldharbour, The Wailing Maw)
{.406,.832,43685},{.409,.568,43686},{.603,.692,43687},{.755,.776,43688},{.432,.454,43689},{.497,.399,43690},{.552,.414,44932},{.745,.664,57796,1},{.731,.703,57797,1},{.672,.760,57766,1},{.630,.699,57767,1},{.248,.618,57811,1},{.261,.676,57812,1},{.413,.775,57783,1},{.426,.700,57784,1},{.454,.505,57828,1},{.550,.447,57829,1},{.546,.74,139435,4},{.413,.813,139436,4}},
crowswood={{.272,.752,187726}},--Blackfeather Knave Clue (Stonefalls, Crow's Wood)
ava_whole_0={{.407,.490,43703},{.511,.820,43704},{.273,.699,43705},{.637,.752,43706},{.486,.535,43707},{.239,.555,43708},{.537,.144,43709},{.185,.383,43710},{.314,.373,43711},{.305,.167,43712},{.379,.153,43713},{.474,.176,43714},{.807,.269,43715},{.690,.510,43716},{.674,.470,43717},{.679,.632,43718},{.772,.467,43719},{.736,.514,43720}},
craglorn={{.286,.621,43721},{.418,.475,43722},{.705,.559,43723},{.655,.671,43724},{.596,.368,43725},{.360,.448,43726},{.680,.375,57798,1},{.464,.328,57799,1},{.435,.448,57800,1},{.461,.535,57768,1},{.398,.480,57769,1},{.310,.458,57770,1},{.089,.338,57830,1},{.653,.368,57831,1},{.424,.506,57832,1},{.342,.563,57785,1},{.539,.490,57786,1},{.201,.409,57787,1},{.582,.524,57813,1},{.169,.377,57814,1},{.676,.429,57815,1},{.75,.463,139437,4},{.352,.54,139439,4},{.441,.673,139438,4}},
wansalen={{.311,.864,187894}},--Psijic Relicmaster Clue (Auridon, Wansalen)
wailingmaw={{.394,.692,187896}},--Ceporah's Insight Clue (Coldharbour, The Wailing Maw)
wrothgar={
{.384,.809,187900},--Hagraven Matron Clue (Wrothgar) 
{.479,.786,43727},{.764,.565,43728},{.272,.678,43729},{.444,.485,43730},{.730,.318,43731},{.185,.760,43732},{.461,.589,71065,1},{.506,.648,71066,1},{.624,.263,71067,1},{.133,.758,71068,1},{.478,.552,71069,1},{.808,.395,71070,1},{.606,.325,71080,1},{.545,.520,71081,1},{.820,.308,71082,1},{.235,.706,71083,1},{.787,.273,71084,1},{.188,.805,71085,1},{.205,.819,71086,1},{.437,.668,71087,1},{.689,.443,71088,1},{.823,.588,139441,4},{.444,.589,139442,4},{.193,.681,139443,4}},
morkul={{-.067,.687,43730}},
hewsbane={{.414,.844,43733},{.386,.580,43734}},
goldcoast={{.644,.329,43735},{.488,.321,43736}},
vvardenfell={
{.367,.654,187888},--House Embassy Clue (Vvardenfell) 
{.44,.243,126122,1},{.841,.731,126111,1},{.672,.627,126110,1},{.291,.323,126113,1},{.337,.774,126112,1},{.662,.528,43743},{.634,.700,43744},{.283,.571,43745},{.666,.872,43737},{.755,.315,43738},{.197,.430,43739},{.448,.693,43740},{.564,.256,43741},{.668,.719,43742},{.441,.244,12612,1},{.841,.731,12611,1},{.290,.325,12611,1},{.671,.626,12611,1},{.336,.773,12611,1},{.174,.409,139444,4}},
clockwork={{.181,.597,43746},{.803,.424,43747}},
}
local UnknownPOI={
[1413]={--Apocrypha
[1]={"Portal to Necrom",17},
[2]={"Portal to Necrom",17},
[3]={"Rectory Corporea",6},
[4]={"The Feral Gallery",10},
[5]={"Cenotaph of the Remnants",17},
[6]={"Cipher's Midden",32},
[7]={"The Sidereal Cloisters",22},
[8]={"The Ravening Morass",15},
[9]={"Quires Wind",3},
[10]={"The Disquiet Study",3},
[11]={"The Underweave",13},
[12]={"Apogee of the Tormenting Eye",3},
[13]={"Fathoms Drift",3},
[14]={"Libram Cathedral",18},
[15]={"Deepreave Quag",18},
[16]={"Runemaster's Acropolis",18},
[17]={"Chthon Plaza",18},
[18]={"Versicolor Carrels",8,{195335,7}},
[19]={"Artisan's Hermitage",8,{194575,5}},
[20]={"The Tranquil Catalog",31},
[21]={"Fractured Monolith",2},
[22]={"Chthonic Landing",2},
[23]={"Writhing Wastes Edifice",44},
[24]={"Fallen Hues Edifice",44},
[26]={"Still Shallows Wayshrine",1},
[27]={"Soundless Bight Wayshrine",1},
[28]={"Cipher's Midden Wayshrine",1},
[29]={"Speiran Tarn Wayshrine",1},
[30]={"Writhing Wastes Wayshrine",1},
[31]={"Tranquil Catalog Wayshrine",1},
[32]={"Apogee Nadir Wayshrine",1},
[33]={"Forlorn Palisades Wayshrine",1},
[34]={"Feral Gallery Wayshrine",1},
[37]={"Syzygial Rostrum",2},
[38]={"Study of the Lost Cipher",2},
[39]={"Altar of the One Who Knows",2},
},
[1414]={--Telvanni Peninsula
[1]={"Anchre Egg Mine",3},
[2]={"Camonnaruhn",3},
[3]={"Ald Isra",45},
[4]={"Kemel-Ze",14},
[5]={"Sailenmora",9},
[6]={"Tel Dreloth",45},
[8]={"Necrom",7},
[9]={"Tomb of the Nameless Master",2},
[10]={"Tel Baro",45},
[11]={"Tel Rendys",45},
[12]={"Clamorclap Bowl",18},
[13]={"Nightmare Den",18},
[14]={"Alavelis",32},
[15]={"Tel Hlurag Ven",8,{194955,3}},
[16]={"Gorne",13},
[18]={"Fungal Downs Edifice",44},
[19]={"Trial: Sanity's Edge",27},
[20]={"Glasscrag Edifice",44},
[21]={"Necrom Outskirts Wayshrine",1},
[22]={"Necrom Wayshrine",1},
[23]={"Fungal Lowlands Wayshrine",1},
[24]={"Ald Isra Wayshrine",1},
[25]={"Padomaic Crest Wayshrine",1},
[26]={"Great Arm Wayshrine",1},
[33]={"Bal Foyen Passage",17},
[30]={"Alavelis Wayshrine",1},
[31]={"House Dres Encampment",2},
[32]={"Deshaan Gate",17},
},
[1383]={--Galen and Y'ffelon 
[1]={"Vastyr",32},
[2]={"Y'ffre's Path",31},
[3]={"Llanshara",21},
[4]={"Embervine",3},
[5]={"Fauns' Thicket",3},
[6]={"Valley of the Watcher",18},
[7]={"Grove of the Chimera",18},
[8]={"Old Port Mornard",8,{191625,3}},
[9]={"Fort Avrippe",8,{191245,3}},
[10]={"Oaken Forge",8,{192005,3}},
[11]={"Vastyr Outskirts Volcanic Vent",26},
[12]={"Farpoint Volcanic Vent",26},
[13]={"Llanshara Volcanic Vent",26},
[14]={"Telling Stone Volcanic Vent",26},
[15]={"Eastern Shores Volcanic Vent",26},
[16]={"Windwrack Fort",2},
[17]={"Tuinh",32},
[18]={"Suncleft Grotto",5},
[19]={"Castle Tonnere",2},
[20]={"Glimmertarn",2},
[21]={"Clohaigh",2},
[22]={"Westport",12},
[23]={"Ivyhame",2},
[25]={"The Telling Stone",2},
[26]={"Vastyr Outskirts Wayshrine",1},
[27]={"Glimmertarn Wayshrine",1},
[28]={"Embervine Wayshrine",1},
[29]={"Llanshara Wayshrine",1},
[30]={"Y'free's Path Wayshrine",1},
[31]={"Vastyr Wayshrine",1},
[32]={"Eastern Shores Wayshrine",1},
},
[1318]={ --High Isle
[1]={"Gonfalon Bay",32},
[2]={"Castle Navire",31},
[3]={"Steadfast Manor",31},
[4]={"Stonelore Grove",21},
[5]={"Garick's Rest",31},
[6]={"All Flags Islet",31},
[7]={"Tor Draioch",31},
[8]={"Amenos Station",31},
[9]={"Brokerock Mine",31},
[10]={"Skulltooth Coast",12},
[11]={"Spire of the Crimson Coin",13},
[12]={"Ghost Haven Bay",13},
[13]={"Breakwater Cave",3},
[14]={"The Firepot",3},
[15]={"Death's Valor Keep",3},
[16]={"Shipwreck Shoals",3},
[17]={"Whalefall",3},
[18]={"Coral Cliffs",3},
[19]={"Y'ffre's Cauldron",18},
[20]={"Serpent Bog",18},
[21]={"Faun Falls",18},
[22]={"Dark Stone Hollow",18},
[23]={"Amenos Basin",18},
[24]={"Mornard Falls",18},
[26]={"Coral Road  Wayshrine",1},
[27]={"Tor Draioch Wayshrine",1},
[28]={"Steadfast Manor Wayshrine",1},
[29]={"Castle Navire Wayshrine",1},
[30]={"Garick's Rest Wayshrine",1},
[31]={"Stonelore Grove Wayshrine",1},
[32]={"Dufort Shipyards Wayshrine",1},
[33]={"Amenos Station Wayshrine",1},
[34]={"Brokerock Wayshrine",1},
[36]={"Stonelore Forge and Craft",8,{185164,5}},
[37]={"Steadfast Hammer and Saw",8,{184784,3}},
[38]={"Hidden Foundry",8,{185544,7}},
[39]={"All Flags Wayshrine",1},
--[40] = {"Trial: Dreadsail Reef",2}
[41]={"Volcanic Vent",26},
[42]={"Volcanic Vent",26},
[43]={"Volcanic Vent",26},
[44]={"Volcanic Vent",26},
[45]={"Volcanic Vent",26},
[46]={"Volcanic Vent",26},
[47]={"Volcanic Vent",26},
[48]={"Trappers Peak Wayshrine",1},
[49]={"Spriggan's Crown",2},
[50]={"Port Navire",12},
[52]={"Druid's Gate",28},
[53]={"Gonfalon Head Lighthouse",23},
[54]={"Westbay Wayshrine",1},
[56]={"Abhain Chapel",9},
[61]={"Augury Monoliths",2},
[63]={"Jheury's Cove",12},
[66]={"Dufort Shipyards",12},
[68]={"Gonfalon Square Wayshrine",1},
[72]={"Serpents Hollow Wayshrine",1},
[73]={"Flooded Coast Wayshrine",1},
[78]={"Green Serpent Getaway",2},
[79]={"Banished Refuge",2},
[80]={"Albatross Leap",2},
[81]={"Colossus View Lighthouse",23},
[82]={"Gonfalon Bay",32},
[83]={"Gonfalon Bay",32},
[84]={"Stonelore Falls",2},
},
[1286]={ --The Deadlands
[1]={"Raging Coast Wayshrine",1},
[2]={"The Blood Pit Wayshrine",1},
[3]={"Ardent Hope Wayshrine",1},
[4]={"Wretched Spire Wayshrine",1},
[5]={"False Martyrs' Folly Wayshrine",1},
[6]={"Annihilarch's Summit Wayshrine",1},
[7]={"The Blood Pit",29},
[8]={"Burning Gyre Keep",31},
[9]={"Ardent Hope",17},
[11]={"The Brandfire Reformatory",3},
[12]={"Destruction's Solace",9},
[13]={"The Abomination Cradle",18},
[14]={"Annihilarch's Summit",5},
[15]={"False Martyrs' Folly",3},
[16]={"Wretched Spire",32},
[17]={"Portal to Fargrave",26},
[18]={"Portal to Fargrave",26},
[19]={"Stormwright's Cleft",8,{178819,3}},
[20]={"The Razorworks",8,{179193,7}},
[22]={"The Tempest Engine",2},
[23]={"Traitor's Ascent",2},
[24]={"Charnel Pulpit",2},
[25]={"Chantry of the Moon Reiver",2},
[26]={"Ravaged Crossing",2},
[27]={"Zynoahz's Gaol",10},
[28]={"Jynd's Foundry",10},
[29]={"Wounded Crossing Wayshrine",1},
[30]={"The Scourshales Wayshrine",1},
[31]={"Den of the Unmaker",18},
},
[1282]={ --Fargrave
[2]={"Fargrave Outskirts Wayshrine",1},
[5]={"Fargrave Wayshrine",1},
},
[1283]={ --The Shambles
[1]={"Forgotten Feretory",8,{179567,5}},
[2]={"Skein Row",2},
[3]={"The Bathhouse",28},
[4]={"The Shambles Wayshrine",1},
},
[1261]={ --Blackwood
[1]={"Borderwatch",31},
[2]={"White Stallion Inn",2},
[3]={"Undertow Cavern",3},
[4]={"Leyawiin",7},
[6]={"Plateau of the Traveler",2},
[7]={"Tidewater Cave",5},
[8]={"Deepscorn Hollow",5},
[9]={"Shardius's Excavation",18},
[10]={"Fort Blueblood",2},
[12]={"Veyond",11},
[14]={"Fort Redmane",31},
[15]={"Doomvault Vulpinaz",10},
[16]={"Toad-Tongue War Camp",18},
[17]={"Arpenia",3},
[18]={"Shrine to Nocturnal",2},
[19]={"Zenithar's Abbey",13},
[20]={"Sul-Xan Ritual Site",18},
[21]={"Welke",11},
[22]={"Bloodrun Cave",3},
[23]={"Bloodrun Wayshrine",1},
[24]={"Farmer's Nook",32},
[25]={"Old Deathwart's Pond",18},
[26]={"Salvitto Estate",2},
[28]={"Hutan-Tzel",32},
[29]={"Doomvault Porcixid",3},
[31]={"Gideon",7},
[32]={"The Silent Halls",13},
[33]={"Glenbridge",28},
[34]={"Vunalk",3},
[35]={"Xeemhok's Lagoon",18},
[39]={"Ojel-Bak",2},
[40]={"Stonewastes",32},
[41]={"The Shattered Xanmeer",18},
[42]={"Xi-Tsei",3},
[43]={"Leyawiin Wayshrine",1},
[44]={"Gideon Wayshrine",1},
[45]={"Borderwatch Wayshrine",1},
[46]={"Fort Redmane Wayshrine",1},
[47]={"Blueblood Wayshrine",1},
[48]={"Stonewastes Wayshrine",1},
[50]={"Pentric Run",8,{173216,5}},
[51]={"Sariellen's Sword",8,{172842,7}},
[52]={"Withered Root",8,{172468,3}},
[68]={"Ayleid Well",11},
[69]={"Ayleid Well",11},
[70]={"Ayleid Well",11},
[71]={"Ayleid Well",11},
[72]={"Ayleid Well",11},
[73]={"Doomvault Vulpinaz Wayshrine",1},
[74]={"Blackwood Crossroads Wayshrine",1},
[75]={"Hutan-Tzel Wayshrine",1},
[76]={"Vunalk Wayshrine",1},
},
[1208]={
[1]={"Nchuand-Zel",14},
[2]={"Library of Arkthzand",15},
[3]={"Bthar-Zel",14},
[4]={"Sentinel Point",18},
[5]={"Nighthollow Keep",9},
[6]={"Gloomreach",3},
[7]={"Nalzthdbar Great Lift",42},
[8]={"Arkthzand Great Lift",42},
[9]={"Arkthzand Wayshrine",1},
[10]={"Nighthollow Wayshrine",1},
[11]={"Philosopher's Cradle",8,{168760,9}},
[12]={"Ghostlight Grotto",2},
[13]={"Mistgloom Thicket",2},
},
[1207]={--The Reach
[1]={"Markarth",7},
[2]={"Karthwasten",32},
[3]={"Briar Rock Ruins",3},
[4]={"Druadach Redoubt",8,{168386,6}},
[6]={"Arkthzand Great Lift",42},
[7]={"Four Skull Lookout",18},
[8]={"Ragnvald Ritual Site",26},
[9]={"Witchborne Ritual Site",26},
[10]={"Deep Folk Crossing",2},
[11]={"Rebel's Retreat",2},
[12]={"Nalzthdbar Great Lift",42},
[13]={"Harrowed Haunt Ritual Site",26},
[14]={"Reachwind Ritual Site",26},
[15]={"Understone Keep",15},
[16]={"Bthardamz",2},
[17]={"Red Eagle Redoubt",8,{168012,3}},
[18]={"Reachwind Depths",14},
--[19]={"Arena: Vateshran Hollows",1},
[20]={"Wildspear Clan Camp",4},
[21]={"Valthume",6},
[22]={"Lost Valley Redoubt",28},
[23]={"Gloomreach",3},
[24]={"Cinder-Heart Clan Camp",4},
[25]={"North Markarth Wayshrine",1},
[26]={"Karthwasten Wayshrine",1},
[27]={"Briar Rock Wayshrine",1},
[28]={"Rebel's Retreat Wayshrine",1},
[29]={"Lost Valley Wayshrine",1},
[30]={"Shadefeather Clan Camp",4},
[31]={"Black-Moon Clan Camp",4},
[32]={"Hroldan Ring",2},
[33]={"Druadach Mountains Wayshrine",1},
[34]={"Markarth Wayshrine",1},
},
[1161]={--Greymoor caverns
[1]={"Dusktown",32},
[2]={"Greymoor Keep",15},
[3]={"The Lightless Hollow",5},
[4]={"Dusktown Wayshrine",1},
[5]={"Greymoor Keep Wayshrine",1},
[6]={"Lightless Hollow Wayshrine",1},
[7]={"Dark Moon Grotto Wayshrine",1},
[8]={"Dark Moon Grotto",5},
[9]={"Lightless Hollow Great Lift",42},
[10]={"Dark Moon Grotto Great Lift",42},
[12]={"Greymoor Cavern Great Lift",42},
[13]={"Midnight Barrow",3},
[14]={"The Scraps",3},
[15]={"Vampire Feeding Grounds",18},
[16]={"Colossus Charging Station",18},
[17]={"Nchuthnkarst",13},
[18]={"Gloomforest Ritual Site",26},
[19]={"Dwarf's Bane Ritual Site",26},
[20]={"Miner's Lament Ritual Site",26},
[21]={"Nightstone Ritual Site",26},
[22]={"Parasite's Cave",8,{163070,3}},
[23]={"Dwarven Run Wayshrine",1},
[24]={"Grotto Falls Wayshrine",1},
[25]={"Deep Overlook Wayshrine",1},
[26]={"Western Greymoor Wayshrine",1},
[27]={"Darkrise Overlook",2},
[28]={"Gloomstalker Village",2},
},
[1160]={--Western Skryim
[1]={"Solitude",7},
[2]={"Morthal",32},
[3]={"Karthwatch",32},
[4]={"Dragon Bridge",32},
[5]={"Kilkreath Temple",10},
[6]={"Mor Khazgur",24},
[7]={"The Silver Cormorant",43},
[8]={"Frozen Coast",3},
[9]={"Shadowgreen",3},
[10]={"Chillwind Depths",3},
[11]={"Dragonhome",3},
[12]={"Labyrinthian",13},
[13]={"Karthald Great Lift",42},
[15]={"Hjaalmarch Great Lift",42},
[16]={"Eastern Great Lift",42},
[17]={"Kilkreath Temple Wayshrine",1},
[18]={"Morthal Wayshrine",1},
[19]={"Mor Khazgur Wayshrine",1},
[20]={"Dragon Bridge Wayshrine",1},
[21]={"Southern Watch Wayshrine",1},
[22]={"Frozen Coast Wayshrine",1},
[23]={"Solitude Wayshrine",1},
[24]={"Hordrek's Hunting Grounds",18},
[26]={"Circle of Champions",18},
[27]={"Ysmgar's Beach",18},
[28]={"Shademother's Haven",18},
[29]={"Old Karth Ritual Site",26},
[30]={"Black Morass Ritual Site",26},
[31]={"Giant's Coast Ritual Site",26},
[32]={"Chilblain Peak Ritual Site",26},
[33]={"Hailstone Valley Ritual Site",26},
[34]={"Northern Watch Ritual Site",26},
[35]={"Coastal Giant Camp",4},
[36]={"Karthald Giant Camp",4},
[37]={"Kilkreath Giant Camp",4},
[38]={"Highland Giant Camp",4},
--[39]={"Trial: Kyne's Aegis",2},
[40]={"Solitude Docks Wayshrine",1},
[42]={"Deepwood Vale Wayshrine",1},
[43]={"Deepwood Giant Camp",4},
[48]={"Hunter's House",8,{161234,5}},
[49]={"Dragon's Belly",8,{161608,7}},
[50]={"Lendoran Ruin",2},
[51]={"Storm-Hawk's Altar",2},--?
[52]={"Sword's Point Watchtower",2},
[53]={"Wolf's Eye Lighthouse",2},--?
[54]={"Mor Khazgur Giant Camp",4},
[58]={"Giant's Coast Wayshrine",1},
[59]={"Northern Watch Wayshrine",1},
},
[726]={--Murkmire
[1]={"Lilmoth",7},
[2]={"Bright-Throat Village",32},
[3]={"Dead-Water Village",32},
[4]={"Alten Meerhleel",2},
[5]={"Lilmoth Wayshrine",1},
[6]={"Bright-Throat Wayshrine",1},
[7]={"Dead-Water Wayshrine",1},
[8]={"Arena: Blackrose Prison",6},
[9]={"Echoing Hollow",18},
[10]={"Bok-Xul",18},
[11]={"Tsofeer Cavern",3},
[12]={"Teeth of Sithis",3},
[13]={"The Dominus Fatum",2},
[14]={"Ruined Guardhouse",2},
[15]={"Root-Whisper Wayshrine",1},
[16]={"Root-Whisper Village",2},
[17]={"Ruined Village",8,{143544,4}},
[18]={"Deep Swamp Forge",8,{143174,2}},
[19]={"Sweet Breeze Overlook",8,{142804,7}},
[20]={"Xinchei-Konu Monument",2},
[22]={"Path of the Lily",2},
[23]={"Blackrose Prison Wayshrine",1},
},
[1027]={--Artaeum
[1]={"Artaeum Craftworks",8,{136080,6}},
[2]={"Ceporah Tower",31},
[3]={"Artaeum Wayshrine",1},
[4]={"Traitor's Vault",3},
[5]={"Colosseum of the Old Ways",2},
},
[1011]={--Summerset
[1]={"King's Haven Pass Wayshrine",1},
[2]={"Shimmerene Wayshrine",1},
[3]={"Sil-Var-Woad Wayshrine",1},
[4]={"Russafeld Heights Wayshrine",1},
[5]={"Cey-Tarn Keep Wayshrine",1},
[6]={"Ebon Stadmont Wayshrine",1},
[7]={"Alinor",7},
[8]={"Shimmerene",32},
[9]={"Lillandril",32},
[10]={"Direnni Acropolis",17},
[11]={"Russafeld",16},
[12]={"Sil-Var-Woad",21},
[13]={"Rellenthil",28},
[14]={"Cey-Tarn Keep",17},
[15]={"Ebon Stadmont",21},
[16]={"Sea Keep",17},
[17]={"Illumination Academy",15},
[18]={"Corgrad Wastes",4},
[19]={"King's Haven Pass",3},
[20]={"King's Haven Pass",3},
[21]={"Eton Nir Grotto",3},
[22]={"Archon's Grove",3},
[23]={"Tor-Hame-Khard",3},
[24]={"Wasten Coraldale",3},
[25]={"Sunhold",13},
[26]={"Karnwasten",13},
[27]={"Graveld's Hideaway",18},
[28]={"Keelsplitter's Nest",18},
[29]={"Gryphon Run",18},
[30]={"The Queen's Hatchery",18},
[31]={"Welenkin Cove",18},
[32]={"Indrik Frolic",18},
[33]={"Shimmerene Dockworks",8,{135730,3}},
[34]={"Augury Basin",8,{136430,9}},
[35]={"Cathedral of Webs",2},
[36]={"Alinor Docks",2},
[37]={"Ald Mora Ruins",2},
[38]={"Gryphon Aerie",2},
[39]={"Keep of the Eleven Forces",2},
[40]={"Garden of the Sacred Numbers",2},
[41]={"Alinor Wayshrine",1},
[42]={"Lillandril Wayshrine",1},
[43]={"Eastern Pass Wayshrine",1},
[44]={"Direnni Abyssal Geyser",26},
[45]={"The Crystal Tower Wayshrine",1},
[46]={"Sil-Var-Woad Abyssal Geyser",26},
[47]={"Eldbur Ruins Wayshrine",1},
[49]={"Rellenthil Abyssal Geyser",26},
[50]={"Eldbur Ruins",2},
[51]={"Corgrad Abyssal Geyser",26},
[52]={"Welenkin Abyssal Geyser",26},
[53]={"Dusk Keep",2},
[54]={"Cloudrest",27},
[55]={"Sunhold Wayshrine",1},
[56]={"Alaxon'ald",2},
[57]={"Veyond Wyte Wayshrine",1},
[58]={"Sunhold Abyssal Geyser",26},
[62]={"Dungeon: Coral Aerie",20},
},
[3]={--Glenumbra
[1]={"Red Rook Camp",4},
[2]={"Hag Fen",21},
[3]={"Burial Mounds",9},
[4]={"Daggerfall",7},
[5]={"Deleyn's Mill",16},
[6]={"Aldcroft",32},
[7]={"Shrieking Scar",4},
[8]={"Glenumbra Moors",33},
[9]={"Westtry",32},
[10]={"Lion Guard Redoubt",4},
[11]={"Vale of the Guardians",21},
[12]={"Eagle's Brook",32},
[13]={"Camlorn",7},
[14]={"Beldama Wyrd Tree",21},
[15]={"Tomb of Lost Kings",9},
[16]={"Crosswych",32},
[17]={"Cath Bedraud",6},
[18]={"Dresan Keep",28},
[19]={"Baelborne Rock",28},
[20]={"Ilessan Tower",3},
[21]={"Silumm",3},
[22]={"Mines of Khuras",3},
[23]={"Enduum",3},
[24]={"Ebon Crypt",3},
[25]={"Cryptwatch Fort",3},
[26]={"Wyrd Tree Wayshrine",1},
[27]={"Aldcroft Wayshrine",1},
[28]={"Deleyn's Mill Wayshrine",1},
[29]={"Eagle's Brook Wayshrine",1},
[30]={"North Hag Fen Wayshrine",1},
[31]={"Lion Guard Redoubt Wayshrine",1},
[32]={"Crosswych Wayshrine",1},
[33]={"Farwatch Wayshrine",1},
[34]={"Baelborne Rock Wayshrine",1},
[35]={"Daggerfall Wayshrine",1},
[36]={"Burial Tombs Wayshrine",1},
[37]={"The Lover",25,13981},
[38]={"The Lady",25,13976},
[39]={"Dwynnarth Ruins",11},
[40]={"Cambray Pass",28},
[41]={"Bad Man's Hallows",13},
[42]={"Dungeon: Spindleclutch I",20},
[43]={"Daenia Dolmen",26},
[44]={"Cambray Hills Dolmen",26},
[45]={"King's Guard Dolmen",26},
[46]={"The Harborage",5},
[47]={"Seaview Point",18},
[48]={"Western Overlook",18},
[49]={"The Wolf's Camp",18},
[50]={"North Shore Point",18},
[51]={"Trapjaw's Cove",18},
[52]={"Balefire Island",18},
[53]={"Valewatch Tower",2},
[54]={"Merovec's Folly",2},
[55]={"Tangle Rock",2},
[56]={"Mesanthano's Tower",8,{43815,2}},
[57]={"Mire Falls",2},
[58]={"Miltrin's Fishing Cabin",2},
[59]={"Gaudet Farm",2},
[60]={"Chill House",8,{43803,2}},
[61]={"Par Molag",8,{43871,2}},
[62]={"Dourstone Isle",2},
[65]={"Hag Fen Wayshrine",1},
[66]={"Dungeon: Spindleclutch II",20},
},
[101]={--Eastmarch
[1]={"Thulvald's Logging Camp",4},
[2]={"The Thief",25,13975},
[3]={"The Warrior",25,13940},
[4]={"The Ritual",25,13980},
[5]={"Lower Yorgrim",32},
[6]={"Kynesgrove",21},
[7]={"Windhelm",7},
[8]={"Fort Morvunskar",31},
[9]={"Cradlecrush",31},
[10]={"Mzulft",14},
[11]={"Wittestadr",32},
[12]={"Bonestrewn Crest",9},
[13]={"Fort Amol",31},
[14]={"Windhelm Wayshrine",1},
[15]={"Fort Morvunskar Wayshrine",1},
[16]={"Kynesgrove Wayshrine",1},
[17]={"Voljar Meadery Wayshrine",1},
[18]={"Cradlecrush Wayshrine",1},
[19]={"Fort Amol Wayshrine",1},
[20]={"Wittestadr Wayshrine",1},
[21]={"Mistwatch Wayshrine",1},
[22]={"Jorunn's Stand Wayshrine",1},
[23]={"Logging Camp Wayshrine",1},
[24]={"Skuldafn Wayshrine",1},
[25]={"Mistwatch",31},
[26]={"The Chill Hollow",3},
[27]={"Icehammer's Vault",3},
[28]={"Old Sord's Cave",3},
[29]={"The Frigid Grotto",3},
[30]={"Stormcrag Crypt",3},
[31]={"The Bastard's Tomb",3},
[32]={"Voljar's Meadery",32},
[33]={"Lost Knife Cave",24},
[34]={"Cragwallow",32},
[35]={"Jorunn's Stand",4},
[36]={"Skuldafn",28},
[37]={"Hall of the Dead",13},
[38]={"Giant's Run Dolmen",26},
[39]={"Frostwater Tundra Dolmen",26},
[40]={"Icewind Peaks Dolmen",26},
[41]={"Dungeon: Direfrost Keep",20},
[42]={"Rageclaw's Den",18},
[43]={"Dragon Mound",18},
[44]={"Ratmaster's Prowl",18},
[45]={"Dragon's Hallow",18},
[46]={"Ammabani's Pride",18},
[47]={"Swiftblade's Camp",18},
[48]={"Darkwater Crossing",32},
[49]={"Giant's Heart",2},
[50]={"Ragnthar",2},
[51]={"Cragwallow Cave",2},
[52]={"Hammerhome",8,{44019,5}},
[53]={"Bitterblade's Camp",2},
[54]={"Tinkerer Tobin's Workshop",8,{44013,5}},
[55]={"Crimson Kada's Crafting Cavern",8,{43831,5}},
[56]={"Hermit's Hideout",2},
[57]={"Thane Jeggi's Drinking Hole",2},
},
[103]={--The Rift
[1]={"Shor's Stone",32},
[2]={"Vernim Woods",21},
[3]={"Boulderfall Pass",31},
[4]={"Pinepeak Cavern",5},
[5]={"Nimalten",32},
[6]={"Fallowstone Hall",31},
[7]={"Northwind Mine",24},
[8]={"Honrich Tower",28},
[9]={"Taarengrav",28},
[10]={"Skald's Retreat",15},
[11]={"Treva's Farm",16},
[12]={"Trolhetta",33},
[13]={"Forelhost",9},
[14]={"Riften Wayshrine",1},
[15]={"Skald's Retreat Wayshrine",1},
[16]={"Trolhetta Wayshrine",1},
[17]={"Trolhetta Summit Wayshrine",1},
[18]={"Lost Prospect",33},
[19]={"Geirmund's Hall",32},
[20]={"The Steed",25,13977},
[21]={"Riften",7},
[22]={"Fullhelm Fort",31},
[23]={"Honrich Tower Wayshrine",1},
[24]={"Fallowstone Hall Wayshrine",1},
[25]={"Northwind Mine Wayshrine",1},
[26]={"Geirmund's Hall Wayshrine",1},
[27]={"Taarengrav Wayshrine",1},
[28]={"Nimalten Wayshrine",1},
[29]={"Ragged Hills Wayshrine",1},
[30]={"Fullhelm Fort Wayshrine",1},
[31]={"Lion's Den",13},
[32]={"Broken Helm Hollow",3},
[33]={"Fort Greenwall",3},
[34]={"Faldar's Tooth",3},
[35]={"Avanchnzel",3},
[36]={"Snapleg Cave",3},
[37]={"Shroud Hearth Barrow",3},
[38]={"Ivarstead",32},
[39]={"Ragged Hills Dolmen",26},
[40]={"Stony Basin Dolmen",26},
[41]={"Smokefrost Peaks Dolmen",26},
[42]={"Dungeon: Blessed Crucible",20},
[43]={"The Apprentice",25,13979},
[44]={"Hunter Camp",18},
[45]={"Troll Cave",18},
[46]={"Frozen Ruins",18},
[47]={"Angarvunde Mound",18},
[48]={"Giant Camp",18},
[49]={"Wisplight Glen",18},
[50]={"Linele Skullcarver's Camp",2},
[51]={"Three Tribes Camp",2},
[52]={"Autumnshade Clearing",2},
[53]={"Smokefrost Vigil",8,{44001,6}},
[54]={"Mammoth Ridge",2},
[55]={"Honeystrand Hill",2},
[56]={"Grethel's Vigil",2},
[57]={"Eldbjorg's Hideaway",8,{43859,6}},
[58]={"Jenedusil's Claw",2},
[59]={"Trollslayer's Gully",8,{44007,6}},
[60]={"Frostmoon Farmstead",16},
},
[104]={--Alik'r Desert
[1]={"Sentinel Docks",12},
[2]={"Ancestor's Landing",28},
[3]={"Rain Catcher Fields",4},
[4]={"Morwha's Bounty",4},
[5]={"Tu'whacca's Throne",28},
[6]={"Kulati Mines",24},
[7]={"Leki's Blade",32},
[8]={"Sep's Spine",4},
[9]={"Bergama",7},
[10]={"Tava's Blessing",7},
[11]={"HoonDing's Watch",28},
[12]={"Satakalaam",7},
[13]={"Kozanset",7},
[14]={"Sentinel",7},
[15]={"Salas En",11},
[16]={"Motalion Necropolis",6},
[17]={"Morwha's Bounty Wayshrine",1},
[18]={"Sentinel Wayshrine",1},
[19]={"Bergama Wayshrine",1},
[20]={"Leki's Blade Wayshrine",1},
[21]={"Satakalaam Wayshrine",1},
[22]={"Santaki",3},
[23]={"Divad's Chagrin Mine",3},
[24]={"Aldunz",3},
[25]={"Coldrock Diggings",3},
[26]={"Sandblown Mine",3},
[27]={"Yldzuun",3},
[28]={"Lost City of the Na-Totambu",13},
[29]={"Divad's Chagrin Mine Wayshrine",1},
[30]={"Kulati Mines Wayshrine",1},
[31]={"Aswala Stables Wayshrine",1},
[32]={"Sep's Spine Wayshrine",1},
[33]={"Ogre's Bluff",21},
[34]={"Shrikes' Aerie Wayshrine",1},
[35]={"HoonDing's Watch Wayshrine",1},
[36]={"Myrkwasa Dolmen",26},
[37]={"Hollow Waste Dolmen",26},
[38]={"Tigonus Dolmen",26},
[39]={"The Warrior",25,13940},
[40]={"The Ritual",25,13980},
[41]={"The Thief",25,13975},
[42]={"Dungeon: Volenfell",20},
[43]={"Goat's Head Oasis Wayshrine",1},
[44]={"Lost Caravan",18},
[45]={"Lesser Circle",18},
[46]={"Giant Camp",18},
[47]={"Forsaken Hearts Cave",18},
[48]={"Hag Camp",18},
[49]={"King's Rest",18},
[50]={"Saltwalker Militia Camp",4},
[51]={"Aswala's Remembrance",2},
[52]={"Tears of the Dishonored",4},
[53]={"Ragnthar",2},
[54]={"Rkulftzel",8,{44013,5}},
[55]={"Alezer Kotu",8,{44019,5}},
[56]={"Easterly Aerie",2},
[57]={"Hatiha's Camp",2},
[58]={"Na-Totambu's Landing",2},
[59]={"Artisan's Oasis",8,{43831,5}},
[60]={"Duneripper Downs",2},
[61]={"Wayfarer's Wharf",2},
},
[41]={--Stonefalls
[1]={"Fort Arand",31},
[2]={"Vivec's Antlers",33},
[3]={"Starved Plain",33},
[4]={"Davon's Watch",7},
[5]={"Hrogar's Hold",16},
[6]={"Othrenis",9},
[7]={"Sathram Plantation",16},
[8]={"Brothers of Strife",28},
[9]={"Heimlyn Keep",31},
[10]={"Kragenmoor",7},
[11]={"Lukiul Uxith",32},
[12]={"Senie",32},
[13]={"Sulfur Pools",16},
[14]={"Iliath Temple",15},
[15]={"Ebonheart",7},
[16]={"Tormented Spire",5},
[17]={"Ash Mountain",10},
[18]={"Crow's Wood",13},
[19]={"Fort Virak",31},
[20]={"Davon's Watch Wayshrine",1},
[21]={"Othrenis Wayshrine",1},
[22]={"Fort Arand Wayshrine",1},
[23]={"Ebonheart Wayshrine",1},
[24]={"Vivec's Antlers Wayshrine",1},
[25]={"Brothers of Strife Wayshrine",1},
[26]={"Hrogar's Hold Wayshrine",1},
[27]={"Fort Virak Wayshrine",1},
[28]={"Iliath Temple Wayshrine",1},
[29]={"Sathram Plantation Wayshrine",1},
[30]={"Kragenmoor Wayshrine",1},
[31]={"Ashen Road Wayshrine",1},
[32]={"The Lady",25,13976},
[33]={"The Lover",25,13981},
[34]={"Dungeon: Fungal Grotto I",20},
[35]={"Inner Sea Armature",3},
[36]={"Mephala's Nest",3},
[37]={"Softloam Cavern",3},
[38]={"Emberflint Mine",3},
[39]={"Sulfur Pools Wayshrine",1},
[40]={"Senie Wayshrine",1},
[41]={"Hightide Hollow",3},
[42]={"Sheogorath's Tongue",3},
[43]={"Daen Seeth Dolmen",26},
[44]={"Zabamat Dolmen",26},
[45]={"Varanis Dolmen",26},
[46]={"The Harborage",5},
[47]={"Strifeswarm Hive",18},
[48]={"The Matron's Clutch",18},
[49]={"Shivering Shrine",18},
[50]={"Cave of Memories",18},
[51]={"Shipwreck Strand",18},
[52]={"Still-Water's Camp",2},
[53]={"Strifeswarm Kwama Mine",2},
[54]={"Armature's Upheaval",8,{43803,2}},
[55]={"Stonefang Isle",2},
[56]={"Steamfont Cavern",8,{43815,2}},
[57]={"Dagger's Point Invasion Camp",2},
[58]={"Davenas Farm",2},
[59]={"Magmaflow Overlook",8,{43871,2}},
[60]={"Greymist Falls",2},
[61]={"Steamlake Encampment",2},
[62]={"The Brahma's Grove",18},
[66]={"Dungeon: Fungal Grotto II",20},
},
[684]={--Wrothgar
[1]={"Paragon's Remembrance",28},
[2]={"Old Orsinium",13},
[3]={"Watcher's Hold",3},
[4]={"Honor's Rest",6},
[6]={"Poacher's Encampment",18},
[7]={"Sorrow",5},
[8]={"Thukhozod's Sanctum",3},
[9]={"Fharun Stronghold",15},
[11]={"Frostbreak Fortress",31},
[12]={"Unfinished Dolmen",18},
[13]={"Graystone Quarry",24},
[14]={"King-Chief's Throne",18},
[15]={"The Accursed Nursery",18},
[16]={"The Mad Ogre's Altar",18},
[17]={"Nyzchaleft Falls",18},
[19]={"Argent Mine",3},
[21]={"Nikolvara's Kennel",3},
[23]={"Zthenganaz",3},
[24]={"Coldperch Cavern",3},
[25]={"Bonerock Cavern",5},
[26]={"Morkul Stronghold",15},
[27]={"Shatul Range",16},
[28]={"Exile's Barrow",28},
[29]={"Rkindaleft",13},
[30]={"Frozen Fleet",4},
[33]={"Orsinium",7},
[34]={"Siege Road Wayshrine",1},
[35]={"Frostbreak Ridge Wayshrine",1},
[36]={"Trader's Road Wayshrine",1},
[37]={"Orsinium Wayshrine",1},
[38]={"Shatul Wayshrine",1},
[39]={"Great Bay Wayshrine",1},
[40]={"Two Rivers Wayshrine",1},
[41]={"Icy Shore Wayshrine",1},
[42]={"Morkul Plain Wayshrine",1},
[43]={"Aqueduct Rock",2},
[44]={"Grudge-Rock Falls",2},
[45]={"Shipwreck Cove",2},
[46]={"Forlorn Watchtower",2},
[47]={"Jehanna Docks",2},
[48]={"Torug's Arch",2},
[49]={"Friendship Gate",17},
[50]={"Merchant's Gate",17},
[51]={"Malacath Statue",8,{69949,3}},
[52]={"Boreal Forge",8,{69606,6}},
[53]={"Morkuldin Forge",8,{70642,9}},
[54]={"Merchant's Gate Wayshrine",1},
[55]={"Arena: Maelstrom",30},
},
[888]={--Craglorn
[1]={"Belkarth",32},
[2]={"Bangkorai Gate",2},
[3]={"Proving Grounds Dolmen",2},
[4]={"Crossroads Encampment",2},
[5]={"Rahni'Za,School of Warriors",23},
[6]={"The Seeker's Archive",15},
[7]={"Shada's Tear",28},
[8]={"Elinhir",23},
[9]={"Spellscar",5},
[10]={"Dragonstar",32},
[11]={"Dragonstar Arena",17},
[12]={"Atelier of the Twice-Born Star",8,{58153,9}},
[13]={"Molavar",3},
[14]={"Rkundzelft",19},
[15]={"Serpent's Nest",3},
[16]={"Ruins of Kardala",19},
[17]={"Ilthag's Undertower",3},
[18]={"Loth'Na Caverns",3},
[19]={"Rkhardahrk",19},
[20]={"Haddock's Market",3},
[21]={"Chiselshriek Mine",19},
[22]={"Buried Sands",3},
[23]={"Mtharnaz",19},
[24]={"The Howling Sepulchers",3},
[25]={"Balamath",3},
[26]={"Fearfangs Cavern",3},
[27]={"Exarch's Stronghold",3},
[28]={"Zalgaz's Den",19},
[29]={"Tombs of the Na-Totambu",3},
[30]={"Hircine's Haunt",19},
[31]={"Trial: Hel Ra Citadel",27},
[32]={"Trial: Aetherian Archive",27},
[33]={"Trial: Sanctum Ophidia",27},
[34]={"Skyreach Pinnacle",28},
[35]={"Skyreach Catacombs",6},
[36]={"Skyreach Hold",22},
[37]={"Taborra's Camp",2},
[38]={"Inazzur's Hold",2},
[39]={"Thunder Falls Camp",2},
[40]={"Scorpion Ravine",2},
[41]={"Lake of Teeth",2},
[42]={"Ogondar's Winery",2},
[43]={"Lanista's Waystation",8,{54787,8}},
[44]={"Sunken Lair",2},
[45]={"Skyreach Overlook",2},
[46]={"Conflagrant Anomaly",18},
[47]={"Fulminant Anomaly",18},
[48]={"Adamant Anomaly",18},
[49]={"Cyclonic Anomaly",18},
[50]={"Boreal Anomaly",18},
[51]={"Anka-Ra's Vigil",18},
[52]={"Anka-Ra's Plight",18},
[53]={"Anka-Ra's Avowal",18},
[54]={"Anka-Ra's Crucible",18},
[55]={"Anka-Ra's Mettle",18},
[56]={"Fortified Nirncrux Mine",18},
[57]={"Overrun Nirncrux Mine",18},
[58]={"Neglected Nirncrux Mine",18},
[59]={"Secluded Nirncrux Mine",18},
[60]={"Pillaged Nirncrux Mine",18},
[61]={"Seeker's Archive Wayshrine",1},
[62]={"Sandy Path Wayshrine",1},
[63]={"Shada's Tear Wayshrine",1},
[64]={"Belkarth Wayshrine",1},
[65]={"Elinhir Wayshrine",1},
[66]={"Spellscar Wayshrine",1},
[67]={"Mountain Overlook Wayshrine",1},
[68]={"Inazzur's Hold Wayshrine",1},
[69]={"Dragonstar Wayshrine",1},
[70]={"Skyreach Wayshrine",1},
[71]={"Valley of Scars Wayshrine",1},
},
[108]={--Greenshade
[1]={"Rulanyil's Fall",13},
[2]={"Bramblebreach",21},
[3]={"Woodhearth",7},
[4]={"Rootwater Grove",21},
[5]={"Verrant Morass",21},
[6]={"Shademist Moors",21},
[7]={"Moonhenge",11},
[8]={"Shadows Crawl",28},
[9]={"Driladan Pass",17},
[10]={"Shrouded Vale",5},
[11]={"Serpent's Grotto",5},
[12]={"Spinner's Cottage",32},
[13]={"Seaside Sanctuary",28},
[14]={"Greenheart",23},
[15]={"Dread Vullain",32},
[16]={"Hectahame",11},
[17]={"Greenheart Wayshrine",1},
[18]={"Marbruk Wayshrine",1},
[19]={"Labyrinth Wayshrine",1},
[20]={"Falinesti Wayshrine",1},
[21]={"Seaside Sanctuary Wayshrine",1},
[22]={"Verrant Morass Wayshrine",1},
[23]={"Woodhearth Wayshrine",1},
[24]={"Moonhenge Wayshrine",1},
[25]={"Serpent's Grotto Wayshrine",1},
[26]={"The Atronach",25,13982},
[27]={"The Serpent",25,13974},
[28]={"The Shadow",25,13984},
[29]={"Green's Marrow Dolmen",26},
[30]={"Drowned Coast Dolmen",26},
[31]={"Wilderking Court Dolmen",26},
[32]={"Marbruk",7},
[33]={"Gurzag's Mine",3},
[34]={"Carac Dena",3},
[35]={"Naril Nagaia",3},
[36]={"The Underroot",3},
[37]={"Harridan's Lair",3},
[38]={"Barrow Trench",3},
[39]={"Dungeon: City of Ash I",20},
[40]={"Reconnaissance Camp",18},
[41]={"Pelda Tarn",18},
[42]={"Gathongor's Mire",18},
[43]={"Rootwater Spring",18},
[44]={"Thodundor's View",18},
[45]={"Maormer Camp",18},
[46]={"Falinesti Spring Site",21},
[47]={"Seaside Overlook",2},
[48]={"Twin Falls Rest",2},
[49]={"Echo Pond",2},
[50]={"Lanalda Pond",8,{43819,4}},
[51]={"Hollow Den",2},
[52]={"Arananga",8,{43847,4}},
[53]={"Tower Rocks Vale",2},
[54]={"Camp Gushnukbur",2},
[55]={"Rootwatch Tower",8,{43995,4}},
[56]={"Fisherman's Rest",2},
[57]={"Labyrinth",11},
[58]={"Dungeon: City of Ash II",20},
},
[537]={--Khenrati's Roost
[1]={"Eagle's Strand",4},
[2]={"Temple of the Mourning Springs",28},
[3]={"Shattered Shoals",12},
[4]={"Mistral",7},
[5]={"Khenarthi's Roost Wayshrine",1},
[6]={"Mistral Wayshrine",1},
[7]={"Hazak's Hollow",5},
[8]={"Cat's Eye Quay",12},
[9]={"Windcatcher Plantation",16},
[10]={"Speckled Shell Plantation",16},
[11]={"Laughing Moons Plantation",16},
[12]={"Bolga's Hunting Camp",2},
[13]={"Temple of the Crescent Moons",2},
[14]={"Temple of Two-Moons Dance",2},
[15]={"Temple of the Dark Moon",2},
[16]={"Rid-Thar's Solace",2},
},
[117]={--Shadowfen
[1]={"Alten Corimont",12},
[2]={"Stormhold",7},
[3]={"Stillrise Village",32},
[4]={"Zuuk",11},
[5]={"Hissmir",28},
[6]={"Xal Ithix",16},
[7]={"Deep Graves",6},
[8]={"Ten-Maur-Wolk",10},
[9]={"Murkwater",12},
[11]={"Bogmother",28},
[12]={"Forsaken Hamlet",32},
[13]={"Hatching Pools",21},
[14]={"Sunscale Strand",28},
[15]={"Mud Tree Village",24},
[16]={"Percolating Mire",15},
[17]={"Atronach Stone",25,13982},
[18]={"The Shadow",25,13984},
[19]={"Serpent Stone",25,13974},
[20]={"Stillrise Wayshrine",1},
[21]={"Stormhold Wayshrine",1},
[22]={"Hatching Pools Wayshrine",1},
[23]={"Bogmother Wayshrine",1},
[24]={"Alten Corimont Wayshrine",1},
[25]={"White Rose Prison",31},
[26]={"Percolating Mire Wayshrine",1},
[27]={"Hissmir Wayshrine",1},
[28]={"Loriasel Wayshrine",1},
[30]={"Venomous Fens Wayshrine",1},
[31]={"Forsaken Hamlet Wayshrine",1},
[32]={"Loriasel",11},
[33]={"Shrine of the Black Maw",3},
[34]={"Broken Tusk",3},
[35]={"Atanaz Ruins",3},
[36]={"Onkobra Kwama Mine",3},
[37]={"Chid-Moska Ruins",3},
[38]={"Gandranen Ruins",3},
[39]={"Dungeon: Arx Corinium",20},
[40]={"Sanguine's Demesne",13},
[41]={"Reticulated Spine Dolmen",26},
[42]={"Leafwater Dolmen",26},
[43]={"Venomous Fens Dolmen",26},
[44]={"Haynekhtnamet's Lair",18},
[45]={"Captain Bones' Ship",18},
[46]={"Bitterroot Cave",18},
[47]={"Nen Ria",18},
[48]={"Xal Thak",18},
[49]={"Slaver Camp",18},
[50]={"Xal Haj-Ei Shrine",8,{43847,4}},
[51]={"Camp Silken Snare",2},
[52]={"The Vile Pavilion",2},
[53]={"Camp Merciful Reduction",2},
[54]={"Tsonashap Mine",2},
[55]={"The Graceful Dominator",2},
[56]={"Camp Crystal Abattoir",2},
[57]={"Hatchling's Crown",8,{43995,4}},
[58]={"Telvanni Acquisition Camp",2},
[59]={"Weeping Wamasu Falls",8,{43819,4}},
[60]={"Hei-Halai",2},
[61]={"Dungeon: Cradle of Shadows",20},
[62]={"Dungeon: Ruins of Mazzatun",20},
},
[584]={--Imperial City
[3]={"Sewer Entrance",29},
[4]={"Sewer Entrance",29},
[5]={"Sewer Entrance",29},
[6]={"Sewer Entrance",29},
[8]={"Sewer Entrance",29},
[9]={"Sewer Entrance",29},
[22]={"Arboretum Armory",8,{60618,7}},
[23]={"Nobles Armory",8,{60280,5}},
[24]={"Memorial Armory",8,{60973,9}},
[25]={"Arboretum",32},
[26]={"Arena District",32},
[27]={"Elven Gardens District",32},
[28]={"Memorial District",32},
[29]={"Nobles District",32},
[30]={"Temple District",32},
[31]={"Dungeon: Imperial City Prison",20},
[32]={"Legionary Trophy Vault",39},
[33]={"Planar Armor Trophy Vault",35},
[34]={"Bone Shard Trophy Vault",38},
[35]={"Ethereal Trophy Vault",40},
[36]={"Clawed Trophy Vault",36},
[37]={"Monstrous Tooth Trophy Vault",37},
},
[643]={--Imperial Sewers
[4]={"Aldmeri Dominion Base",29},
[8]={"Ebonheart Pact Base",29},
[13]={"Daggerfall Covenant Base",29},
[19]={"Ladder to Memorial District",29},
[20]={"Ladder to Arena District",29},
[21]={"Ladder to Temple District",29},
[22]={"Ladder to Arboretum",29},
[23]={"Ladder to Nobles District",29},
[24]={"Ladder to Elven Gardens",29},
[25]={"Ebral the Betrayer",33},
[26]={"Emperor Leovic",33},
[27]={"Gati the Storm Sister",33},
[28]={"Hzu-Hakan",33},
[29]={"Lady of the Depths",33},
[30]={"Otholug gro-Goldfolly",33},
[31]={"Secundinus the Despoiler",33},
[32]={"Taebod the Gatekeeper",33},
[33]={"Wadracki",33},
[34]={"Drain-Dweller's Outpost",2},
[35]={"Unfinished Memoirs",2},
[36]={"Alik'ri Alcove",2},
[44]={"General Nazenaechar",33},
[45]={"General Kryozote",33},
[46]={"General Zamachar",33},
[47]={"Bloodmist Slaughterhouse",2},
[48]={"Headsman's Bone Pile",2},
[49]={"Inquisitor's Retreat",2},
[50]={"Dungeon: White-Gold Tower",20},
[51]={"Dungeon: White-Gold Tower",20},
[52]={"Dungeon: White-Gold Tower",20},
},
[816]={--Hew's Bane
[1]={"Shark's Teeth Grotto",3},
[2]={"Bahraha's Gloom",3},
[4]={"Thrall Cove",18},
[5]={"Ko Estaran",18},
[6]={"Tava's Beak",2},
[7]={"Hubalajad's Reflection",2},
[8]={"Prince Hew's Shuttered Tomb",2},
[9]={"Abah's Landing",7},
[11]={"No Shira Citadel",28},
[14]={"Abah's Landing Wayshrine",1},
[15]={"Zeht's Displeasure Wayshrine",1},
[16]={"No Shira Citadel Wayshrine",1},
[17]={"Placations of Zeht",2},
[19]={"The Lost Pavilion",8,{72502,9}},
[21]={"Forebear's Junction",8,{71795,5}},
[24]={"No Shira Workshop",8,{72145,7}},
},
[281]={--Bal Foyen
[1]={"Dhalmora",32},
[2]={"Dhalmora Wayshrine",1},
[3]={"Fort Zeren Wayshrine",1},
[4]={"Foyen Docks Wayshrine",1},
[5]={"Bal Foyen Dockyards",12},
[6]={"Fort Zeren",22},
[7]={"Hidden Dagger Landing Site",2},
[8]={"Plantation Point Overlook",2},
},
[823]={--Goald Coast
[1]={"Anvil Wayshrine",1},
[2]={"Kvatch Wayshrine",1},
[3]={"Strid River Wayshrine",1},
[4]={"Gold Coast Wayshrine",1},
[5]={"Kvatch",7},
[6]={"Anvil",7},
[7]={"Hrota Cave",3},
[8]={"Garlas Agea",3},
[9]={"Knightsgrave",28},
[10]={"Tribune's Folly",18},
[11]={"At-Himah Family Estate",2},
[12]={"Beldaburo",2},
[13]={"Enclave of the Hourglass",22},
[14]={"Jarol Estate",2},
[15]={"Anvil Lighthouse",2},
[16]={"Varen's Wall Gatehouse",2},
[17]={"Garlas Malatar",2},
[18]={"Marja's Mill",8,{75397,5}},
[19]={"Strid River Artisans Camp",8,{75747,7}},
[20]={"Colovian Revolt Forge Yard",8,{76120,9}},
[21]={"Kvatch Arena",18},
[22]={"Dark Brotherhood Sanctuary",41},
},
[19]={--Stormhaven
[1]={"Aphren's Hold",9},
[2]={"Shinji's Scarp",32},
[3]={"Dro-Dara Plantation",16},
[4]={"Soulshriven Tower",28},
[5]={"Farangel's Landing",12},
[6]={"Pariah Abbey",15},
[7]={"Wind Keep",32},
[8]={"Dreughside",7},
[9]={"Cumberland's Watch",31},
[10]={"at-Tura Estate",15},
[11]={"Koeglin Lighthouse",23},
[12]={"Steelheart Moorings",12},
[13]={"Firebrand Keep",22},
[14]={"Moonlit Maw",5},
[15]={"Nurin Farm",16},
[16]={"Vanne Farm",16},
[17]={"Alcaire Castle",22},
[18]={"Koeglin Village",32},
[19]={"Windridge Cave",5},
[20]={"Dungeon: Wayrest Sewers I",20},
[21]={"Bonesnap Ruins",13},
[22]={"Koeglin Village Wayshrine",1},
[23]={"Alcaire Castle Wayshrine",1},
[24]={"Firebrand Keep Wayshrine",1},
[25]={"Wind Keep Wayshrine",1},
[26]={"Dro-Dara Plantation Wayshrine",1},
[27]={"Soulshriven Wayshrine",1},
[28]={"Pariah Abbey Wayshrine",1},
[29]={"Portdun Watch",3},
[30]={"Koeglin Mine",3},
[31]={"Pariah Catacombs",3},
[32]={"Farangel's Delve",3},
[33]={"Bearclaw Mine",3},
[34]={"Norvulk Ruins",3},
[35]={"Weeping Giant Wayshrine",1},
[36]={"The Tower",25,13985},
[37]={"The Mage",25,13943},
[38]={"The Lord",25,13978},
[39]={"Gavaudon Dolmen",26},
[40]={"Alcaire Dolmen",26},
[41]={"Menevia Dolmen",26},
[42]={"Wayrest Wayshrine",1},
[43]={"Bonesnap Ruins Wayshrine",1},
[44]={"Spider Nest",18},
[45]={"Mudcrab Beach",18},
[46]={"Dreugh Waters",18},
[47]={"Abandoned Farm",18},
[48]={"Scrag's Larder",18},
[49]={"Ancient Altar",18},
[50]={"Supernal Dreamers Camp",2},
[51]={"Nightmare Crag",2},
[52]={"Cave of Dreams",2},
[53]={"Shrine to Azura",2},
[54]={"Cumberland Falls",2},
[55]={"Stonechewer Goblin Camp",2},
[56]={"Hammerdeath Workshop",8,{43977,3}},
[57]={"Fisherman's Island",8,{43827,3}},
[58]={"Travelers' Rest",2},
[59]={"Windridge Warehouse",8,{43807,3}},
[60]={"Weeping Giant",28},
[61]={"Friendship Gate",17},
[62]={"Dungeon: Wayrest Sewers II",20},
[63]={"Hammerdeath Arena",33},
},
[20]={--Rivenspire
[1]={"Hinault Farm",16},
[2]={"Moira's Hope",32},
[3]={"Silverhoof Vale",21},
[4]={"Northpoint",7},
[5]={"Crestshade",33},
[6]={"Camp Tamrith",4},
[7]={"Fell's Run",32},
[8]={"Traitor's Tor",33},
[9]={"Sanguine Barrows",9},
[10]={"Shornhelm",7},
[11]={"Edrald Estate",15},
[12]={"Breagha-Fin",5},
[13]={"Ravenwatch Castle",6},
[14]={"The Doomcrag",11},
[15]={"Lorkrata Hills",28},
[16]={"Obsidian Scar",13},
[17]={"Dungeon: Crypt of Hearts I",20},
[18]={"Oldgate Wayshrine",1},
[19]={"Crestshade Wayshrine",1},
[20]={"Camp Tamrith Wayshrine",1},
[21]={"Hoarfrost Downs",32},
[22]={"Boralis Wayshrine",1},
[23]={"Staging Grounds Wayshrine",1},
[24]={"Northpoint Wayshrine",1},
[25]={"Fell's Run Wayshrine",1},
[26]={"Hoarfrost Downs Wayshrine",1},
[27]={"Shornhelm Wayshrine",1},
[28]={"The Atronach",25,13982},
[29]={"The Shadow",25,13984},
[30]={"The Serpent",25,13974},
[31]={"Crestshade Mine",3},
[32]={"Flyleaf Catacombs",3},
[33]={"Tribulation Crypt",3},
[34]={"Orc's Finger Ruins",3},
[35]={"Erokii Ruins",3},
[36]={"Hildune's Secret Refuge",3},
[37]={"Sanguine Barrows Wayshrine",1},
[38]={"Eyebright Feld Dolmen",26},
[39]={"Westmark Moor Dolmen",26},
[40]={"Boralis Dolmen",26},
[41]={"Shrouded Pass Wayshrine",1},
[42]={"Aesar's Web",18},
[43]={"Valeguard Tower",18},
[44]={"Old Kalgon's Keep",18},
[45]={"Magdelena's Haunt",18},
[46]={"East-Rock Landing",18},
[47]={"Siren's Cove",18},
[48]={"Shadowfate Cavern",2},
[49]={"Old Fell's Fort",2},
[50]={"Lagra's Pearl",2},
[51]={"Northsalt Village",2},
[52]={"Veawend Ede",8,{43847,4}},
[53]={"Westwind Lighthouse",8,{43819,4}},
[54]={"Dorell Farmhouse",2},
[55]={"Southgard Tower",2},
[56]={"Old Shornhelm Ruins",2},
[57]={"Trader's Rest",8,{43995,4}},
[58]={"Dungeon: Crypt of Hearts II",20},
[61]={"Dungeon: Shipwright's Regret",20},
},
[181]={--Cyrodiil
[1]={"Sardavar Leed",11},
[2]={"Gray Viper Outpost",4},
[3]={"Homestead Ruins",28},
[4]={"Culotte",11},
[5]={"Juras' Fall",11},
[7]={"Howling Cave",5},
[8]={"Ceyatatar",11},
[9]={"Haynote Cave",3},
[10]={"Lunar Fang Docks",12},
[11]={"Pothole Caverns",3},
[12]={"Newt Cave",3},
[13]={"Abbey of the Eight",32},
[14]={"Nornalhorst",11},
[15]={"Nisin Cave",3},
[16]={"Narsinfel",11},
[17]={"Wooden Hand Outlook",2},
[18]={"Fanacasecul",11},
[19]={"Hackdirt",32},
[20]={"Wenyandawik",11},
[21]={"Bloodmayne Cave",3},
[22]={"Chorrol",32},
[23]={"Red Ruby Cave",3},
[24]={"Capstone Cave",3},
[25]={"Ninendava",11},
[26]={"Moranda",11},
[27]={"Piukanda",11},
[28]={"Sercen",11},
[29]={"Anga",11},
[30]={"Hrotanda Vale",11},
[31]={"Echo Cave",3},
[32]={"Lindai",11},
[33]={"Empire Tower",2},
[34]={"Lake Mist Ruins",11},
[35]={"Waterside Mine",24},
[36]={"Lipsand Tarn",3},
[37]={"Cracked Wood Cave",3},
[38]={"Kingscrest Cavern",3},
[39]={"Muck Valley Cavern",3},
[40]={"Quickwater Cave",3},
[41]={"Vahtacen",3},
[42]={"Breakneck Cave",3},
[43]={"Serpent Hollow Cave",3},
[44]={"Nornal",11},
[45]={"Cheydinhal",7},
[46]={"Harlun's Watch",15},
[47]={"Belda",11},
[48]={"Burned Estate",15},
[51]={"Temple of the Ancestor Moths",32},
[52]={"North High Rock Gate Wayshrine",1},
[53]={"South High Rock Gate Wayshrine",1},
[54]={"Eastern Elsweyr Gate Wayshrine",1},
[55]={"Western Elsweyr Gate Wayshrine",1},
[56]={"North Morrowind Gate Wayshrine",1},
[57]={"South Morrowind Gate Wayshrine",1},
[58]={"Greenmead Dolmen",26},
[59]={"Great Forest Dolmen",26},
[60]={"Nibenay Valley Dolmen",26},
[61]={"Applewatch Wood Dolmen",26},
[62]={"Winter's Reach Dolmen",26},
[63]={"Northwestern Shore Dolmen",26},
[64]={"Eastern Shore Dolmen",26},
[65]={"Niben Basin Dolmen",26},
[66]={"Cheydinhal Foothills Dolmen",26},
[67]={"The Apprentice",25,13979},
[68]={"The Atronach",25,13982},
[69]={"The Lady",25,13976},
[70]={"The Warrior",25,13940},
[71]={"The Mage",25,13943},
[72]={"The Thief",25,13975},
[73]={"The Lover",25,13981},
[74]={"The Serpent",25,13974},
[75]={"The Ritual",25,13980},
[76]={"The Tower",25,13985},
[77]={"The Steed",25,13977},
[78]={"The Shadow",25,13984},
[79]={"Cloud Ruler Temple",26},
[80]={"Riverwatch",23},
[81]={"Zimar's Winery",15},
[82]={"Thalara's Winery",15},
[83]={"Wilminn's Winery",15},
[84]={"Sedor",11},
[85]={"Coldcorn Ruin",28},
[86]={"Fanacas",11},
[87]={"Hedoran Estate",15},
[88]={"Weynon Priory",32},
[89]={"Crooked Finger Redoubt",31},
[90]={"Underpall Cave",3},
[91]={"Highlander Camp",4},
[92]={"Ice-Heart Home",15},
[93]={"Weye",32},
[94]={"Shurgak Clan Estate",15},
[95]={"Toadstool Hollow",3},
[96]={"Abandoned Orchard",2},
[97]={"Nagastani",11},
[98]={"Barren Cave",5},
[99]={"Moffka's Lament",2},
[100]={"White Fall Mountain",2},
[104]={"Dungeon: Imperial City Prison",20},
[105]={"Dungeon: White-Gold Tower",20},
[106]={"Bruma",26},
},
[534]={--Stros M'Kai
[1]={"Saintsport",32},
[2]={"Bthzark",14},
[3]={"Port Hunding",7},
[4]={"Port Hunding Wayshrine",1},
[5]={"The Grave",29},
[6]={"Sandy Grotto Wayshrine",1},
[7]={"Saintsport Wayshrine",1},
[8]={"Rash Merchant's Plummet",2},
[9]={"Dogeater Goblin Camp",2},
[10]={"Pillar of the Singing Sun",2},
},
[535]={--Betnikh
[1]={"Grimfield",6},
[2]={"Carved Hills",21},
[3]={"Stonetooth Wayshrine",1},
[4]={"Grimfield Wayshrine",1},
[5]={"Carved Hills Wayshrine",1},
[6]={"Moriseli",11},
[7]={"Carzog's Demise",11},
[8]={"Gilbard's Nook",2},
[9]={"Eyearata",2},
},
[280]={--Bleakrock Isle
[1]={"Orkey's Hollow",5},
[2]={"Skyshroud Barrow",28},
[3]={"Bleakrock Wayshrine",1},
[4]={"Hozzin's Folly",24},
[5]={"Bleakrock Village",32},
[6]={"Frostedge Camp",4},
[7]={"Hunter's Camp",4},
[8]={"Halmaera's House",15},
[9]={"Companions Point",2},
[10]={"Paddlefloe Fishing Camp",2},
[11]={"Deathclaw's Lair",2},
},
[57]={--Deshaan
[1]={"Malak's Maw",4},
[2]={"Silent Mire",32},
[3]={"Muth Gnaar",32},
[4]={"Deepcrag Den",24},
[5]={"Quarantine Serk",4},
[6]={"Narsis",32},
[7]={"Tal'Deic Fortress",22},
[8]={"Mzithumz",14},
[9]={"Vale of the Ghost Snake",4},
[10]={"Obsidian Gorge",28},
[11]={"Eidolon's Hollow",10},
[12]={"Mournhold",7},
[13]={"Tribunal Temple",31},
[14]={"The Tower",25,13985},
[15]={"The Mage",25,13943},
[16]={"The Lord",25,13978},
[17]={"Shrine of Saint Veloth",28},
[18]={"Shad Astula",15},
[19]={"Selfora",32},
[20]={"Forgotten Crypts",13},
[21]={"Dungeon: Darkshade Caverns I",20},
[22]={"West Narsis Wayshrine",1},
[23]={"Muth Gnaar Hills Wayshrine",1},
[24]={"Quarantine Serk Wayshrine",1},
[25]={"Ghost Snake Vale Wayshrine",1},
[26]={"Mournhold Wayshrine",1},
[27]={"Tal'Deic Grounds Wayshrine",1},
[28]={"Obsidian Gorge Wayshrine",1},
[29]={"Mzithumz Wayshrine",1},
[30]={"Selfora Wayshrine",1},
[31]={"Silent Mire Wayshrine",1},
[32]={"Eidolon's Hollow Wayshrine",1},
[33]={"Lady Llarel's Shelter",3},
[34]={"Lower Bthanual",3},
[35]={"Triple Circle Mine",3},
[36]={"Taleon's Crag",3},
[37]={"Knife Ear Grotto",3},
[38]={"The Corpse Garden",3},
[39]={"Bthanual",14},
[40]={"Redolent Loam Dolmen",26},
[41]={"Lagomere Dolmen",26},
[42]={"Siltreen Dolmen",26},
[43]={"Shad Astula Wayshrine",1},
[44]={"Short-Tusk's Hillock",18},
[45]={"Grove of the Abomination",18},
[46]={"Dire Bramblepatch",18},
[47]={"Mabrigash Burial Circle",18},
[48]={"Druitularg's Ritual Altar",18},
[49]={"Caravan Crest",18},
[50]={"House Dres Farmstead",2},
[51]={"Avayan's Farm",8,{43807,3}},
[52]={"Lake Hlaalu Retreat",8,{43977,3}},
[53]={"Berezan's Mine",8,{43827,3}},
[54]={"Old Ida's Cottage",2},
[55]={"Shrine to Saint Rilms",2},
[56]={"Coiled Path Landing",2},
[57]={"Smuggler's Slip",2},
[58]={"Redoran Pier",2},
[59]={"Hlanii's Hovel",2},
[60]={"Dungeon: Darkshade Caverns I",20},
},
[58]={--Malabal Tor
[1]={"Ouze",28},
[2]={"Dra'bul Wayshrine",1},
[3]={"Ilayas Ruins Wayshrine",1},
[4]={"Velyn Harbor Wayshrine",1},
[5]={"Vulkwasten Wayshrine",1},
[6]={"Abamath Wayshrine",1},
[7]={"Wilding Run Wayshrine",1},
[8]={"Baandari Post Wayshrine",1},
[9]={"Bloodtoil Valley Wayshrine",1},
[10]={"Valeguard Wayshrine",1},
[11]={"The Thief",25,13975},
[12]={"The Ritual",25,13980},
[13]={"The Warrior",25,13940},
[14]={"Jathsogur",28},
[15]={"Bloodtoil Valley",32},
[16]={"Wilding Run",21},
[17]={"Vulkwasten",32},
[18]={"Fuller's Break",12},
[19]={"Jode's Pocket",4},
[20]={"Silvenar",7},
[21]={"Ilayas Ruins",11},
[22]={"Abamath",11},
[23]={"Dra'bul",4},
[24]={"Treehenge",21},
[25]={"Valeguard",21},
[26]={"Velyn Harbor",32},
[27]={"Baandari Trading Post",7},
[28]={"Deepwoods",21},
[29]={"Dead Man's Drop",3},
[30]={"Black Vine Ruins",3},
[31]={"Roots of Silvenar",3},
[32]={"Shael Ruins",3},
[34]={"Hoarvor Pit",3},
[35]={"Tomb of the Apostates",3},
[36]={"Belarata",11},
[37]={"Crimson Cove",13},
[38]={"Broken Coast Dolmen",26},
[39]={"Xylo River Basin Dolmen",26},
[40]={"Silvenar Vale Dolmen",26},
[41]={"Dungeon: Tempest Island",20},
[42]={"Bone Grappler's Nest",18},
[43]={"Bitterpoint Strand",18},
[44]={"Dugan's Knoll",18},
[45]={"River Edge",18},
[46]={"Jagged Grotto",18},
[47]={"Windshriek Strand",18},
[48]={"Horseshoe Island",2},
[49]={"Supplication House",2},
[50]={"Ogrim's Yawn",2},
[51]={"Tanglehaven",32},
[52]={"Falinesti Summer Site",21},
[53]={"Sleepy Senche Overlook",8,{44013,5}},
[54]={"Stranglewatch",2},
[55]={"Ragnthar",2},
[56]={"Chancel of Divine Entreaty",8,{44019,5}},
[57]={"Starwalk Cavern",2},
[58]={"Matthild's Last Venture",8,{43831,5}},
[59]={"Four Quarry Islet",2},
},
[347]={--Coldharbour
[1]={"The Everfull Flagon",32},
[2]={"The Lost Fleet",23},
[3]={"Cliffs of Failure",33},
[4]={"The Moonless Walk",21},
[5]={"Library of Dusk Wayshrine",1},
[6]={"Great Shackle Wayshrine",1},
[7]={"The Chasm Wayshrine",1},
[8]={"Hollow City Wayshrine",1},
[9]={"Endless Stair Wayshrine",1},
[10]={"Everfull Flagon Wayshrine",1},
[11]={"Moonless Walk Wayshrine",1},
[12]={"Haj Uxith Wayshrine",1},
[13]={"Manor of Revelry Wayshrine",1},
[14]={"Reaver Citadel Wayshrine",1},
[15]={"The Orchard Wayshrine",1},
[16]={"Aba-Loria",3},
[17]={"The Grotto of Depravity",3},
[18]={"The Cave of Trophies",3},
[19]={"Vault of Haman Forgefire",3},
[20]={"Mal Sorra's Tomb",3},
[21]={"The Wailing Maw",3},
[22]={"Tower of Lies",24},
[23]={"Haj Uxith",32},
[24]={"Court of Contempt",10},
[25]={"The Chasm",33},
[26]={"The Orchard",6},
[27]={"Shrouded Plains Wayshrine",1},
[28]={"The Black Forge",10},
[29]={"Court of Contempt Wayshrine",1},
[30]={"The Vile Laboratory",14},
[31]={"Library of Dusk",11},
[32]={"Spurned Peak",31},
[33]={"The Lightless Oubliette",10},
[34]={"The Manor of Revelry",10},
[35]={"The Reaver Citadel",31},
[36]={"The Hollow City",7},
[37]={"The Great Shackle",10},
[38]={"The Endless Stair",10},
[39]={"Dungeon: Vaults of Madness",20},
[40]={"Village of the Lost",13},
[41]={"Aba-Darre",18},
[42]={"Duriatundur's Killing Field",18},
[43]={"Zemarek's Hollow",18},
[44]={"Daedroth Larder",18},
[45]={"Risen Court",18},
[46]={"Cynhamoth's Grove",18},
[47]={"Deathspinner's Lair",8,{43971,8}},
[48]={"Cadwell's Hovel",2},
[49]={"Shrine of Kyne",2},
[50]={"Endless Overlook",2},
[51]={"Forsaken Village",2},
[52]={"Survivor's Camp",2},
[54]={"Mages Guildhall",2},
[55]={"Fighters Guildhall",2},
[56]={"Font of Schemes",8,{43965,8}},
},
[92]={--Bangkorai
[1]={"Jackdaw Cove",4},
[2]={"Northglen",16},
[3]={"Halcyon Lake",11},
[4]={"Pelin Graveyard",9},
[5]={"Fallen Grotto",21},
[6]={"Nilata Ruins",11},
[7]={"Hall of Heroes",9},
[8]={"Kerbol's Hollow",32},
[9]={"Hallin's Stand",7},
[10]={"Onsi's Breath",24},
[11]={"Qharroa Ruins",28},
[12]={"Bangkorai Garrison",31},
[13]={"Martyr's Crossing",4},
[14]={"Evermore",7},
[15]={"Viridian Woods",21},
[16]={"Razak's Wheel",13},
[17]={"The Steed",25,13977},
[18]={"The Apprentice",25,13979},
[19]={"Evermore Wayshrine",1},
[20]={"Troll's Toothpick Wayshrine",1},
[21]={"Viridian Woods Wayshrine",1},
[22]={"Bangkorai Pass Wayshrine",1},
[23]={"Nilata Ruins Wayshrine",1},
[24]={"Hallin's Stand Wayshrine",1},
[25]={"Old Tower Wayshrine",1},
[26]={"Onsi's Breath Wayshrine",1},
[27]={"Sunken Road Wayshrine",1},
[28]={"Old Tower",31},
[29]={"Murcien's Hamlet",32},
[30]={"Torog's Spite",3},
[31]={"Troll's Toothpick",3},
[32]={"Viridian Watch",3},
[33]={"Crypt of the Exiles",3},
[34]={"Klathzgar",3},
[35]={"Rubble Butte",3},
[36]={"Dungeon: Blackheart Haven",20},
[37]={"Mournoth Dolmen",26},
[38]={"Ephesus Dolmen",26},
[39]={"Fallen Wastes Dolmen",26},
[40]={"Eastern Evermore Wayshrine",1},
[41]={"Halcyon Lake Wayshrine",1},
[42]={"Blighted Isle",18},
[43]={"Lakewatch Tower",18},
[44]={"Arlimahera's Sanctum",18},
[45]={"Summoner's Camp",18},
[46]={"Nilata Falls",18},
[47]={"Telesubi Ruins",18},
[48]={"Damar Farmstead",16},
[49]={"Silaseli Ruins",8,{43859,6}},
[50]={"Sunken Road",5},
[51]={"Yanurah's Respite",2},
[52]={"Ash'abahs' Oasis",2},
[53]={"Gjarma's Rock",2},
[54]={"Strastnoc's Landing",2},
[55]={"Viridian Hideaway",8,{44001,6}},
[56]={"Basking Grounds",2},
[57]={"Wethers' Cleft",8,{44007,6}},
[58]={"Sacred Springs",2},
[59]={"Howlers' Nook",2},
[60]={"Merchant's Gate",17},
},
[381]={--Auridon
[1]={"Ezduiin",11},
[2]={"Tanzelwil",11},
[3]={"South Beacon",23},
[4]={"Glister Vale",31},
[5]={"Del's Claim",3},
[6]={"Ondil",3},
[7]={"Entila's Folly",3},
[8]={"Wansalen",3},
[9]={"Silsailen",32},
[10]={"Mehrunes' Spite",3},
[11]={"Bewan",3},
[12]={"The Lady",25,13976},
[13]={"Firsthold",7},
[14]={"Phaer",32},
[15]={"Shattered Grove",32},
[16]={"North Beacon",23},
[17]={"Vulkhel Guard",7},
[18]={"Torinaan",11},
[19]={"Mathiisen",32},
[20]={"Vulkhel Guard Wayshrine",1},
[21]={"Greenwater Cove",32},
[22]={"The Lover",25,13981},
[23]={"Phaer Wayshrine",1},
[24]={"Tanzelwil Wayshrine",1},
[25]={"Firsthold Wayshrine",1},
[26]={"Mathiisen Wayshrine",1},
[27]={"Skywatch Wayshrine",1},
[28]={"Quendeluun Wayshrine",1},
[29]={"College Wayshrine",1},
[30]={"Greenwater Wayshrine",1},
[31]={"Quendeluun",11},
[32]={"College of Aldmeri Propriety",32},
[33]={"Windy Glade Wayshrine",1},
[34]={"Dawnbreak",32},
[35]={"Castle Rilis",28},
[36]={"Skywatch",7},
[37]={"Iluvamir Dolmen",26},
[38]={"Calambar Dolmen",26},
[39]={"Vafe Dolmen",26},
[40]={"Toothmaul Gully",13},
[41]={"Dungeon: The Banished Cells I",20},
[42]={"The Harborage",5},
[43]={"Soulfire Plateau",18},
[44]={"Seaside Scarp Camp",18},
[45]={"Wreck of the Raptor",18},
[46]={"Heretic's Summons",18},
[47]={"Nestmother's Den",18},
[48]={"Heritance Proving Ground",18},
[49]={"Maormer Invasion Camp",2},
[50]={"Hightide Keep",8,{43815,2}},
[51]={"Buraniim Isle",2},
[52]={"Errinorne Isle",2},
[53]={"Nine-Prow Landing",2},
[54]={"Isle of Contemplation",2},
[55]={"Beacon Falls",8,{43871,2}},
[56]={"Eastshore Islets Camp",8,{43803,2}},
[57]={"Monkey's Rest",2},
[58]={"Smuggler's Cove",2},
[61]={"Dungeon: The Banished Cells II",20},
},
[382]={--Reaper's March
[1]={"Thormar",11},
[2]={"Fort Grimwatch",31},
[3]={"Moonmont",9},
[4]={"Vinedusk Village",32},
[5]={"Senalana",11},
[6]={"Falinesti Autumn Site",28},
[7]={"S'ren-ja",32},
[8]={"Do'Krin Monastery",15},
[9]={"Dune",7},
[10]={"Hadran's Caravan",4},
[11]={"Greenhill",32},
[12]={"Pa'alat",32},
[13]={"Arenthia",7},
[14]={"Thizzrini Arena",4},
[15]={"Kuna's Delve",3},
[16]={"Thibaut's Cairn",3},
[17]={"Weeping Wind Cave",3},
[18]={"Claw's Strike",3},
[19]={"Fardir's Folly",3},
[20]={"Jode's Light",3},
[21]={"Two Moons Path",28},
[22]={"Willowgrove",32},
[23]={"The Vile Manse",13},
[24]={"Northern Woods Dolmen",26},
[25]={"Jodewood Dolmen",26},
[26]={"Dawnmead Dolmen",26},
[27]={"The Steed",25,13977},
[28]={"The Apprentice",25,13979},
[29]={"Dungeon: Selene's Web",20},
[30]={"Vinedusk Wayshrine",1},
[31]={"Fort Grimwatch Wayshrine",1},
[32]={"Fort Sphinxmoth Wayshrine",1},
[33]={"Rawl'kha",7},
[34]={"Arenthia Wayshrine",1},
[35]={"Dune Wayshrine",1},
[36]={"Willowgrove Wayshrine",1},
[37]={"Moonmont Wayshrine",1},
[38]={"Rawl'kha Wayshrine",1},
[39]={"S'ren-ja Wayshrine",1},
[40]={"Fort Sphinxmoth",28},
[41]={"Deathsong Cleft",18},
[42]={"Big Ozur's Valley",18},
[43]={"Waterdancer Falls",18},
[44]={"Reaper's Henge",18},
[45]={"Old S'ren-ja Docks",18},
[46]={"Ushmal's Rest",18},
[47]={"Willowgrove Cavern",2},
[48]={"Old Town Cavern",8,{43859,6}},
[49]={"Researcher's Camp",2},
[50]={"Crescent River Camp",2},
[51]={"Broken Arch",8,{44007,6}},
[52]={"Greenspeaker's Grove",8,{44001,6}},
[53]={"Dawnmead Brigand Camp",2},
[54]={"Little Ozur's Camp",2},
[55]={"Fishing Dock",2},
[56]={"Dawnmead Ruin Camp",2},
[57]={"Trial: Maw of Lorkhaj",27},
},
[383]={--Grahtwood
[1]={"Reliquary of Stars",11},
[2]={"Root Sunder Ruins",13},
[3]={"Haven",12},
[4]={"Reman's Bluff",17},
[5]={"Bone Orchard",6},
[6]={"Gil-Var-Delle",21},
[7]={"Cave of Broken Sails",5},
[8]={"Dungeon: Elden Hollow I",20},
[9]={"The Gray Mire",16},
[10]={"Brackenleaf",21},
[11]={"Ossuary of Telacar",28},
[12]={"The Tower",25,13985},
[13]={"The Mage",25,13943},
[14]={"The Lord",25,13978},
[15]={"Elden Root Wayshrine",1},
[16]={"Gil-Var-Delle Wayshrine",1},
[17]={"Elden Root Temple Wayshrine",1},
[18]={"Haven Wayshrine",1},
[19]={"Redfur Trading Post Wayshrine",1},
[20]={"Southpoint Wayshrine",1},
[21]={"Cormount Wayshrine",1},
[22]={"Ossuary Wayshrine",1},
[23]={"Laeloria",11},
[24]={"Elden Root",7},
[25]={"Southpoint",22},
[26]={"Long Coast Dolmen",26},
[27]={"Green Hall Dolmen",26},
[28]={"Tarlain Heights Dolmen",26},
[29]={"Falinesti Winter Site",28},
[30]={"Karthdar",32},
[31]={"Cormount",32},
[32]={"Redfur Trading Post",32},
[33]={"Goldfolly",28},
[34]={"Ne Salas",3},
[35]={"The Scuttle Pit",3},
[36]={"Vinedeath Cave",3},
[37]={"Burroot Kwama Mine",3},
[38]={"Wormroot Depths",3},
[39]={"Mobar Mine",3},
[40]={"Gray Mire Wayshrine",1},
[41]={"Falinesti Winter Wayshrine",1},
[42]={"Hircine's Henge",18},
[43]={"Nindaeril's Perch",18},
[44]={"Lady Solace's Fen",18},
[45]={"Poacher Camp",18},
[46]={"Thugrub's Cave",18},
[47]={"Valanir's Rest",18},
[48]={"Tarlain Bandit Camp",2},
[49]={"Vineshade Lodge",8,{43807,3}},
[50]={"Boar's Run Overlook",2},
[51]={"Battle of Cormount Memorial",2},
[52]={"Temple of the Eight",8,{43827,3}},
[53]={"Sweetbreeze Cottage",2},
[54]={"Sacred Leap Grotto",2},
[55]={"Fisherman's Isle",8,{43977,3}},
[56]={"Forked Root Camp",2},
[57]={"Faltonia's Mine",2},
[58]={"Dungeon: Elden Hollow II",20},
},
[849]={--Vvardenfell
[1]={"Gnisis",32},
[2]={"Khartag Point",3},
[3]={"Ashalmawia",3},
[4]={"Zainsipilu",3},
[5]={"Matus-Akin Egg Mine",3},
[6]={"Pulk",3},
[7]={"Nchuleft",3},
[8]={"Vos",32},
[9]={"West Gash Wayshrine",1},
[10]={"Tel Aruhn",32},
[11]={"Sadrith Mora",7},
[12]={"Halls of Fabrication",27},
[13]={"Urshilaku Camp Wayshrine",1},
[14]={"Suran",32},
[15]={"Balmora",7},
[16]={"Nilthog's Hollow",18},
[17]={"Sulipund Grange",18},
[18]={"Shipwreck Cove",18},
[19]={"Missir-Dadalit Egg Mine",18},
[20]={"Dubdil Alar Tower",18},
[21]={"Salothan's Council",18},
[22]={"Gnisis Wayshrine",1},
[23]={"Ald'ruhn Wayshrine",1},
[24]={"Balmora Wayshrine",1},
[25]={"Seyda Neen Wayshrine",1},
[26]={"Suran Wayshrine",1},
[27]={"Molag Mar Wayshrine",1},
[28]={"Tel Branora Wayshrine",1},
[29]={"Vivec City Wayshrine",1},
[30]={"Nchuleftingth Wayshrine",1},
[31]={"Tel Mora Wayshrine",1},
[32]={"Sadrith Mora Wayshrine",1},
[33]={"Seyda Neen",32},
[34]={"Nchuleftingth",13},
[35]={"Forgotten Wastes",13},
[44]={"Marandus",8,{121551,3}},
[45]={"Randas Ancestral Tomb",8,{121921,8}},
[46]={"Zergonipal",8,{122251,6}},
[47]={"Vassir-Didanat Mine",24},
[48]={"Ald'ruhn",4},
[64]={"Veloth Ancestral Tomb",6},
[65]={"Urshilaku Camp",4},
[66]={"Zainab Camp",4},
[67]={"Erabenimsun Camp",4},
[72]={"Valley of the Wind Wayshrine",1},
[74]={"Molag Mar",32},
[75]={"Vivec City",7},
[76]={"Yasammidan",2},
[77]={"Ashalmimilkala",2},
[78]={"Shrine of Azura",2},
[79]={"Holamayan Monastery",2},
[80]={"Ald Sotha",2},
[81]={"Hanud Tower",2},
[82]={"Ahemmusa Camp",4},
[83]={"Aleft",2},
[84]={"Falensarano Ruins",2},
[85]={"Vivec Temple Wayshrine",1},
[86]={"Valenvaryon",2},
[87]={"Ald Carac",17},
[88]={"Ularra",17},
[89]={"Foyada Quarry",17},
[90]={"Dreloth Ancestral Tomb",6},
},
[980]={--Clockwork City
[1]={"Halls of Regulation",3},
[2]={"The Shadow Cleft",3},
[4]={"Clockwork Crossroads Wayshrine",1},
[5]={"Mire Mechanica Wayshrine",1},
[6]={"Everwound Wellspring",16},
[7]={"Mnemonic Planisphere",14},
[9]={"Elegiac Replication",2},
[10]={"Insalubrious Effluvium",2},
[11]={"Vale of Tiers",2},
[12]={"Ventral Terminus",2},
[14]={"Sanctuary of Verification",18},
[15]={"Exarchs' Egress",18},
[16]={"Mire Mechanica",2},
[17]={"The Brass Fortress",7},
[18]={"Sanctuary Wayshrine",1},
[19]={"The Refurbishing Yard",8,{130460,2}},	--Innate Axiom
[20]={"Pavilion of Artifice",8,{131168,6}},	--Mechanical Acuity
[21]={"Barilzar's Eighth Laboratory",2},
},
[981]={--Brass Fortress
[2]={"Brass Fortress Wayshrine",1},
[3]={"Restricted Brassworks",8,{130803,4}},	--Fortified Brass
},
[1086]={--Northern Elsweyr
[1]={"The Bone Pit",18},
[2]={"Scar's Edge",18},
[3]={"Red Hands Run",18},
[4]={"Hill of Shattered Swords",18},
[5]={"Talon Gulch",18},
[6]={"Nightmare Plateau",18},
[7]={"Abode of Ignominy",3},
[8]={"Predator Mesa",3},
[10]={"Tomb of the Serpents",3},
[11]={"Darkpool Mine",3},
[12]={"The Tangle",3},
[13]={"Rimmen Necropolis",13},
[14]={"Orcrest",13},
[15]={"Riverhold",32},
[16]={"Rimmen",7},
[17]={"Hakoshae",32},
[18]={"The Prowl",33},
[19]={"Anequina Aqueduct",31},
[20]={"Weeping Scar",5},
[21]={"Cicatrice",5},
[22]={"Ashen Scar",6},
[23]={"The Stitches",32},
[24]={"Two Moons at Tenmar Temple",15},
[25]={"Merryvale Farms",16},
[26]={"Starlight Adeptorium",8,{148331,5}},
[27]={"Valenwood Border Artisan Camp",8,{147961,8}},
[28]={"Rimmen Masterworks",8,{148701,3}},
[32]={"Star Haven Adeptorium",2},
[33]={"Shadow Dance Ruins",2},
[34]={"Moon Gate of Anequina",2},
[35]={"Sleepy Senche Mine",2},
[36]={"Defense Force Outpost",2},
[37]={"Sandswirl Manor",2},
[38]={"Riverhold Wayshrine",1},
[39]={"Rimmen Wayshrine",1},
[40]={"The Stitches Wayshrine",1},
[41]={"Tenmar Temple Wayshrine",1},
[43]={"Scar's End Wayshrine",1},
[44]={"Hakoshae Wayshrine",1},
[45]={"Desert Wind Caverns",3},
[46]={"Valenwood Gate",2},
[52]={"Star Haven Wayshrine",1},
},
[1133]={--Southern Elsweyr
[1]={"Senchal Wayshrine",1},
[2]={"South Guard Ruins Wayshrine",1},
[3]={"Western Plains Wayshrine",1},
[4]={"Black Heights Wayshrine",1},
[5]={"Pridehome Wayshrine",1},
[6]={"Senchal",7},
[7]={"South Guard Ruins",28},
[8]={"Black Heights",32},
[9]={"Moonlit Cove",3},
[10]={"Forsaken Citadel",3},
[11]={"Fur-Forge Cove",8,{156165,9}},
[12]={"Cat's-Claw Station",8,{155417,3}},
[14]={"Shrine of the Reforged",18},
[15]={"Ri'Atahrashi's Training Ground",18},
[16]={"Zazaradi's Quarry and Mine",2},
[17]={"Pridehome",2},
[18]={"Doomstone Keep",2},
[19]={"The Forgotten Mane",2},
[21]={"Purring Rock",2},
[22]={"Khenarthi's Arch",2},
}
}
local UnknownPOItexture={
[1]="/esoui/art/icons/poi/poi_wayshrine_incomplete.dds",
[2]="/esoui/art/icons/poi/poi_areaofinterest_incomplete.dds",
[3]="/esoui/art/icons/poi/poi_delve_incomplete.dds",
[4]="/esoui/art/icons/poi/poi_camp_incomplete.dds",
[5]="/esoui/art/icons/poi/poi_cave_incomplete.dds",
[6]="/esoui/art/icons/poi/poi_cemetery_incomplete.dds",
[7]="/esoui/art/icons/poi/poi_city_incomplete.dds",
[8]="/esoui/art/icons/poi/poi_crafting_incomplete.dds",
[9]="/esoui/art/icons/poi/poi_crypt_incomplete.dds",
[10]="/esoui/art/icons/poi/poi_daedricruin_incomplete.dds",
[11]="/esoui/art/icons/poi/poi_ayleidruin_incomplete.dds",
[12]="/esoui/art/icons/poi/poi_dock_incomplete.dds",
[13]="/esoui/art/icons/poi/poi_dungeon_incomplete.dds",
[14]="/esoui/art/icons/poi/poi_dwemerruin_incomplete.dds",
[15]="/esoui/art/icons/poi/poi_estate_incomplete.dds",
[16]="/esoui/art/icons/poi/poi_farm_incomplete.dds",
[17]="/esoui/art/icons/poi/poi_gate_incomplete.dds",
[18]="/esoui/art/icons/poi/poi_groupboss_incomplete.dds",
[19]="/esoui/art/icons/poi/poi_groupdelve_incomplete.dds",
[20]="/esoui/art/icons/poi/poi_groupinstance_incomplete.dds",
[21]="/esoui/art/icons/poi/poi_grove_incomplete.dds",
[22]="/esoui/art/icons/poi/poi_keep_incomplete.dds",
[23]="/esoui/art/icons/poi/poi_lighthouse_incomplete.dds",
[24]="/esoui/art/icons/poi/poi_mine_incomplete.dds",
[25]="/esoui/art/icons/poi/poi_mundus_incomplete.dds",
[26]="/esoui/art/icons/poi/poi_portal_incomplete.dds",
[27]="/esoui/art/icons/poi/poi_raiddungeon_incomplete.dds",
[28]="/esoui/art/icons/poi/poi_ruin_incomplete.dds",
[29]="/esoui/art/icons/poi/poi_sewer_incomplete.dds",
[30]="/esoui/art/icons/poi/poi_solotrial_incomplete.dds",
[31]="/esoui/art/icons/poi/poi_tower_incomplete.dds",
[32]="/esoui/art/icons/poi/poi_town_incomplete.dds",
[33]="/esoui/art/icons/poi/poi_battlefield_incomplete.dds",
[35]="/esoui/art/icons/poi/poi_ic_planararmorscraps_incomplete.dds",
[36]="/esoui/art/icons/poi/poi_ic_tinyclaw_incomplete.dds",
[37]="/esoui/art/icons/poi/poi_ic_monstrousteeth_incomplete.dds",
[38]="/esoui/art/icons/poi/poi_ic_boneshard_incomplete.dds",
[39]="/esoui/art/icons/poi/poi_ic_marklegion_incomplete.dds",
[40]="/esoui/art/icons/poi/poi_ic_darkether_incomplete.dds",
[41]="/esoui/art/icons/poi/poi_darkbrotherhood_incomplete.dds",
[42]="/esoui/art/icons/poi/poi_u26_dwemergear_incomplete.dds",
[43]="/esoui/art/icons/poi/poi_u26_nord_boat_incomplete.dds",
[44]="/esoui/art/icons/poi/poi_group_portal_incomplete.dds",
[45]="/esoui/art/icons/poi/poi_mushromtower_incomplete.dds"
}
--function ShowPoiIcons()for i,icon in pairs(UnknownPOItexture) do d("["..i.."]|t26:26:"..icon.."|t")end end
local MundusDescription={
[13940]="Increases Weapon Damage",
[13943]="Increases Maximum Magicka",
[13974]="Increases Stamina recovery",
[13975]="Increases Critical Strike chance",
[13976]="Increases Physical and Spell Resistance",
[13977]="Increases run speed by 5% & increases Health recovery",
[13978]="Increases Maximum Health",
[13979]="Increases Spell Damage",
[13980]="Increases healing effectiveness",
[13981]="Increases Physical and Spell Penetration",
[13982]="Increases Magicka recovery",
[13984]="Increases Critical Strike damage",
[13985]="Increases Maximum Stamina",
}
local ChestData={
blackwood={
[1]={{.6806,.5714},{.5976,.7887},{.2178,.3269},{.2389,.326},{.3249,.2742},{.1383,.594},{.1762,.5768},{.3772,.5909},{.4069,.5939},{.4441,.6135},{.4812,.6868},{.2704,.4945},{.5516,.8252},{.3785,.1246},{.7252,.823},{.7456,.8421},{.8145,.7872},{.6678,.5191},{.378,.5376},{.6201,.486},{.6458,.4488},{.5811,.3414},{.6641,.3445},{.6207,.1586},{.5308,.1415},{.6717,.2822},{.7418,.869},{.616,.3455},{.6302,.3946},{.589,.4075},{.5227,.4286},{.4791,.4639},{.4363,.451},{.4295,.5026},{.487,.5723},{.4567,.6665},{.5433,.7863},{.6732,.7723},{.7502,.7344},{.7543,.7631},{.7845,.8419},{.8354,.8388},{.6701,.8275},{.7944,.7231},{.7076,.7996},{.3814,.220},{.3714,.273},{.3442,.2329},{.3357,.4232},{.341,.5551},{.6936,.880},{.2013,.4344},{.1493,.410},{.2592,.3803},{.2766,.3425},{.4816,.545},{.3389,.5057},{.2871,.5428},{.1837,.4611},{.3092,.3579},{.2429,.3543},{.2862,.5904},{.6054,.7139},{.7613,.4091}},
[2]={{.3567,.266},{.2694,.5002},{.5428,.4635},{.4423,.3215},{.220,.357},{.6213,.7072}},
},
summerset={
[1]={{.5940,.3580},{.6963,.7736},{.6714,.7940},{.2313,.6253},{.1910,.6366},{.2451,.5789},{.2481,.6164},{.6421,.3628},{.3659,.5265},{.5577,.2544},{.4846,.1889},{.4962,.1723},{.2240,.4214},{.2679,.4283},{.4837,.7502},{.7461,.6808},{.6342,.6185},{.6648,.6875},{.2874,.5632},{.3622,.5539},{.3056,.3127},{.1712,.3165},{.5971,.3145},{.6002,.5555},{.3356,.5120},{.4208,.4555},{.5233,.2650},{.5092,.2861},{.5449,.6842},{.5873,.6518},{.5343,.3815},{.2562,.2578},{.2555,.4530},{.7362,.6723},{.5074,.3134},{.2789,.5188},{.5353,.2191},{.6024,.2465},{.5757,.6817},{.6847,.7819},{.7281,.7313},{.3840,.4631},{.6031,.6198},{.4939,.2082},{.3511,.5131},{.5265,.2286},{.2281,.6065},{.2875,.5633},{.1713,.3166},{.5688,.6475},{.5616,.6828},{.2138,.4088},{.2886,.2222},{.2992,.1925},{.3370,.5066},{.3912,.5148},{.2791,.5190},{.2329,.5723},{.2036,.3158},{.7286,.7313},{.7156,.7662},{.6423,.3630},{.4846,.1887},{.5233,.2648},{.5186,.2450},{.3537,.5391},{.6126,.5020},{.6962,.7738},{.5572,.4262},{.4836,.7503},{.5643,.2262},{.6581,.2895},{.5357,.2194},{.2435,.3971},{.5673,.2888},{.2554,.4531},{.2676,.4283},{.3622,.5537},{.5577,.2545},{.3746,.3985},{.3395,.4891},{.1812,.4126},{.7363,.6724},{.2281,.6065},{.2482,.6165},{.5343,.3811},{.2085,.2707},{.6671,.5306},{.4939,.2083},{.6841,.7821},{.2573,.5582},{.2709,.5143},{.2684,.5320},{.5610,.6549},{.4978,.6620},{.6199,.2744}},
[2]={{.4965,.6939},{.5201,.6598},{.2719,.5503},{.2919,.4966},{.3000,.3518},{.6717,.7956},{.3491,.4726},{.4473,.4544},{.2788,.3793},{.3646,.3723},{.5140,.7624},{.2702,.2570}}
},
FanglairExt={[1]={{.4147,.2233},{.2190,.4920},{.6928,.3968},{.5087,.1631},{.5946,.4401},{.5743,.2953},{.2099,.4263},{.2307,.5596},{.5193,.5768},{.2543,.2559}}},
MazzatunEXT={[1]={{.7498,.7296},{.3691,.2740},{.6866,.2538},{.3977,.2659},{.3298,.7071}}},
FalkreathsDemise_i={[1]={{.270,.400},{.416,.882},{.416,.297},{.591,.089},{.415,.874},{.264,.395},{.411,.889}}},
FalkreathsDemise={[1]={{.323,.718},{.263,.461},{.304,.601},{.289,.645},{.186,.604},{.365,.591},{.533,.475},{.250,.534},{.391,.554},{.279,.557},{.219,.567},{.382,.461}}},
UI_CradleOfShadowsINT={[1]={{.194,.491},{.347,.487},{.318,.521},{.4576,.2127},{.4775,.4754},{.4171,.4942},{.7356,.4002},{.4696,.6602},{.4828,.4771},{.5557,.6350},{.3924,.3854},{.1956,.7402},{.8011,.8196},{.6228,.8359},{.4568,.2087},{.5376,.3971},{.1457,.1915},{.3217,.5220},{.4214,.2845}}},
Sum_Karnwasten={[1]={{.5217,.5104}}},
archonsgrove={[1]={{.4180,.6491},{.6738,.5009}}},
shimmerene={[1]={{.5025,.7351},{.5030,.7339}}},
artaeum={[1]={{.3407,.3934},{.7299,.4576},{.5174,.3217},{.4303,.3574},{.6407,.3576},{.4287,.3578},{.6706,.2482},{.6780,.3983},{.6912,.5107},{.7287,.4576},{.7392,.3745},{.5806,.2921},{.5176,.3215}}},
BloodRootExt1={[1]={{.4371,.2315}}},
BloodRootINT1={[1]={{.1388,.5331},{.1148,.5845},{.1417,.5990},{.5365,.4199},{.7780,.4790},{.5371,.4186}}},
BloodRootINT2={[1]={{.5739,.6473},{.5129,.5857},{.4931,.5538},{.5119,.5835},{.5710,.6470}}},
TraitorsVault02={[1]={{.7853,.3569}}},
TraitorsVault03={[1]={{.8428,.4766}}},
sunhold={[1]={{.4138,.7594},{.6628,.4727}}},
ScaleCaller001={[1]={{.6087,.4828},{.4394,.3536},{.4391,.3505},{.6057,.4843}}},
ScaleCaller002={[1]={{.5230,.7059},{.2915,.5319},{.1099,.7340},{.6504,.2561},{.3005,.5216},{.6509,.2545},{.5232,.7062},{.6436,.2542}}},
ScaleCaller003={[1]={{.3050,.3820},{.6999,.3999},{.0551,.3966},{.4868,.6430},{.2995,.3782},{.5397,.5131},{.5156,.3375}}},
ScaleCaller004={[1]={{.2215,.5027}}},
MHKmoonHunterKeep={[1]={{.6404,.6195}}},
MHKmoonHunterKeep2={[1]={{.5209,.5232},{.5242,.5209}}},
MHKmoonHunterKeep3={[1]={{.2546,.3535},{.2604,.4060}}},
torhamekhard_01={[1]={{.4914,.4711},{.5233,.2944}}},
etonnir_01={[1]={{.7936,.4109},{.3343,.2988},{.0971,.7521}}},
kingshavenext={[1]={{.6336,.5554},{.5285,.5808},{.3645,.6304},{.2458,.4709},{.3627,.6341},{.4615,.6299}}},
wastencoraldale={[1]={{.7321,.4322},{.5218,.3764},{.6283,.3765},{.4280,.6005},{.4559,.5571},{.5584,.4516},{.6965,.4004},{.6924,.2593}}},
redfurtradingpost={[1]={{.230,.763},{.137,.310},{.808,.570},{.750,.807},{.150,.311},{.238,.762},{.138,.664},{.168,.872},{.139,.317},{.132,.657},{.758,.814},{.813,.565},{.761,.806},{.814,.573},{.224,.758},{.799,.566},}},
mobarmine={[1]={{.256,.580},{.098,.632},{.411,.576},{.477,.232},{.413,.568},{.465,.233},{.378,.479},{.278,.474},{.318,.571},{.467,.245},{.404,.574},{.223,.558},{.671,.478},{.385,.475},{.332,.589},{.237,.573},{.383,.484},{.673,.486},{.455,.232},{.256,.572},{.301,.557},}},
thebanishedcells={[1]={{.674,.635},{.68,.458},{.678,.466},{.270,.154},{.678,.642},{.815,.716},{.489,.095},{.272,.105},{.479,.169},{.734,.662},{.571,.444},{.477,.327},{.346,.361},{.432,.192},{.442,.658},{.434,.551},{.615,.810},{.342,.131},{.234,.309},{.280,.515},{.299,.195},{.427,.147},{.482,.577},{.823,.709},{.691,.515},{.417,.454},{.239,.243},{.355,.367},{.226,.306},{.389,.450},{.672,.461},{.438,.295},{.232,.241},{.484,.567},{.396,.454},{.269,.117},{.338,.139},{.473,.316},{.243,.249},{.227,.314},{.276,.113},{.671,.641},{.482,.097},{.292,.199},{.235,.300},{.385,.457},{.731,.656}}},
mawlorkajsuthaysanctuary={[1]={{.464,.829},{.462,.819},{.471,.832},{.515,.830},{.479,.829},{.515,.821}}},
vulkwasten={[1]={{.575,.233},{.773,.769},{.355,.288},{.896,.350},{.641,.749},{.163,.260},{.956,.090},{.487,.044},{.151,.093},{.75,.304},{.432,.905},{.573,.114}},[2]={{.744,.755},{.655,.703}}},
deadmansdrop={[1]={{.529,.35},{.214,.626},{.400,.176},{.223,.143},{.394,.403},{.412,.172},{.268,.112},{.705,.154},{.676,.285},{.297,.576},{.161,.136},{.254,.251},{.536,.414},{.437,.602},{.369,.151},{.526,.346},{.418,.703},{.115,.249},{.628,.156},{.192,.746},{.374,.679},{.223,.150},{.303,.676},{.417,.711},{.164,.143},{.249,.255},{.222,.631},{.433,.702},{.310,.685},{.372,.144},{.121,.254}}},
nesalas={[1]={{.504,.438},{.423,.394},{.167,.225},{.496,.432},{.585,.848},{.636,.774},{.311,.854},{.500,.263},{.155,.229},{.311,.146},{.431,.398},{.121,.624},{.695,.591},{.589,.864},{.635,.765},{.303,.844},{.129,.619},{.592,.853},{.119,.615},{.318,.145}}},
delsclaim={[1]={{.374,.098},{.708,.274},{.627,.400},{.717,.411},{.596,.511},{.333,.697},{.422,.400},{.727,.144},{.536,.223},{.913,.173},{.416,.681},{.406,.472},{.447,.288},{.557,.555},{.391,.101},{.489,.457},{.779,.401},{.506,.077},{.709,.265},{.337,.221},{.655,.555},{.440,.477},{.721,.142},{.601,.519},{.482,.454},{.701,.266},{.384,.097},{.438,.467},{.649,.564},{.401,.476},{.530,.229},{.493,.465},{.925,.172},{.427,.407},{.328,.219},{.528,.218},{.509,.085},{.780,.409}}},
clawsstrike={[1]={{.365,.805},{.810,.352},{.340,.489},{.123,.289},{.358,.550},{.130,.300},{.177,.687},{.123,.403},{.875,.685},{.811,.341},{.720,.421},{.824,.299},{.262,.579},{.874,.588},{.412,.654},{.389,.796},{.347,.475},{.181,.297},{.875,.773},{.762,.735},{.459,.534},{.350,.552},{.136,.292},{.463,.524},{.567,.690},{.816,.348},{.265,.571},{.343,.481},{.763,.745},{.559,.692},{.877,.692},{.372,.802},{.466,.531},{.351,.466},{.455,.525},{.753,.744}}},
skywatch={[1]={{.657,.725},{.379,.502},{.394,.674},{.378,.127},{.316,.180},{.328,.324},{.535,.386},{.664,.727}},[2]={{.785,.460},{.658,.737},{.378,.704}}},
fardirsfolly={[1]={{.064,.883},{.741,.762},{.195,.845},{.433,.757},{.57,.623},{.776,.167},{.649,.251},{.562,.630},{.437,.741},{.842,.320},{.566,.515},{.648,.682},{.643,.436},{.298,.530},{.734,.759},{.361,.442},{.287,.641},{.912,.560},{.563,.594},{.759,.548},{.575,.715},{.324,.761},{.070,.887},{.464,.398},{.768,.163},{.440,.757},{.650,.435},{.368,.448},{.907,.567}}},
thevilemansefirstfloor={[1]={{.524,.340},{.429,.688},{.335,.428},{.525,.510},{.492,.917},{.576,.456},{.531,.505},{.473,.381},{.447,.376},{.582,.462},{.561,.166},{.368,.287},{.498,.912},{.546,.41},{.619,.535},{.520,.560},{.342,.423},{.359,.455},{.552,.225},{.516,.338},{.424,.696},{.671,.295},{.434,.692},{.417,.843},{.678,.296},{.499,.919}}},
rawlkha={[1]={{.513,.785},{.175,.476},{.461,.130},{.759,.332},{.843,.502},{.277,.464}},[2]={{.071,.410}}},
maw_of_lorkaj={[1]={{.588,.362},{.163,.731},{.162,.724},{.596,.361}}},
vindeathcave={[1]={{.765,.558},{.722,.442},{.638,.711},{.504,.44},{.783,.573},{.211,.769},{.644,.722},{.731,.492},{.755,.753},{.707,.434},{.199,.776},{.235,.755},{.765,.573},{.505,.432},{.571,.443},{.741,.504},{.648,.84},{.197,.766},{.249,.763},{.632,.715},{.565,.453},{.741,.484},{.738,.748},{.712,.443},{.257,.754},{.578,.449},{.635,.846}}},
dune={[1]={{.623,.436},{.485,.159},{.378,.484},{.595,.776},{.685,.620},{.547,.130},{.657,.555},{.461,.781},{.119,.293}},[2]={{.117,.349},{.319,.430},{.423,.611},{.484,.533},{.427,.042}}},
blackvineruins={[1]={{.827,.733},{.232,.591},{.568,.736},{.613,.536},{.276,.714},{.424,.927},{.664,.268},{.636,.711},{.502,.143},{.455,.339},{.402,.683},{.634,.132},{.416,.480},{.400,.742},{.815,.732},{.555,.743},{.503,.259},{.217,.592},{.507,.619},{.694,.485},{.342,.623},{.839,.481},{.832,.657},{.499,.132},{.471,.333},{.511,.141},{.407,.751},{.547,.743},{.500,.253},{.225,.593},{.680,.481},{.837,.473},{.492,.124},{.343,.630},{.612,.543},{.463,.329},{.563,.744}}},
shatteredshoals={[1]={{.009,.306},{.001,.349}},[2]={{.371,.632},{.370,.657}}},
kunasdelve={[1]={{.618,.668},{.568,.340},{.390,.294},{.572,.483},{.555,.294},{.521,.134},{.616,.661},{.768,.521},{.397,.296},{.450,.301},{.490,.332},{.790,.425},{.471,.14},{.557,.624},{.562,.347},{.631,.368},{.136,.301},{.315,.204},{.162,.308},{.766,.350},{.602,.214},{.561,.654},{.791,.315},{.794,.418},{.782,.530},{.445,.306},{.498,.338},{.787,.435},{.554,.614},{.628,.384},{.162,.319},{.480,.145},{.777,.524},{.557,.339},{.153,.322},{.311,.210},{.798,.316},{.130,.295},{.395,.289},{.569,.477},{.552,.287},{.798,.323},{.638,.367}}},
wansalen={[1]={{.535,.317},{.201,.792},{.610,.226},{.609,.218},{.544,.477},{.408,.119},{.550,.482},{.603,.229},{.391,.118},{.335,.888},{.764,.431},{.283,.157},{.539,.323},{.456,.762},{.282,.556},{.687,.408},{.316,.298},{.406,.241},{.523,.179},{.357,.208},{.223,.664},{.443,.231},{.731,.537},{.677,.463},{.285,.549},{.547,.470},{.341,.881},{.201,.783},{.527,.321},{.452,.776},{.352,.216},{.72,.527}}},
baandaritradingpost={[1]={{.106,.522},{.387,.827},{.635,.321},{.015,.382},{.724,.011},{.642,.326}},[2]={{.537,.236},{.434,.583},{.540,.229},{.351,.528}}},
malabaltor={[1]={{.276,.631},{.216,.585},{.591,.453},{.767,.536},{.634,.462},{.812,.203},{.814,.191},{.852,.207},{.841,.246},{.211,.539},{.835,.207},{.852,.251},{.203,.426},{.677,.829},{.356,.599},{.602,.872},{.721,.271},{.579,.617},{.192,.590},{.554,.320},{.282,.418},{.425,.531},{.405,.505},{.564,.440},{.600,.424},{.562,.421},{.655,.847},{.753,.754},{.542,.648},{.671,.651},{.760,.497},{.866,.261},{.864,.192},{.871,.166},{.838,.146},{.794,.182},{.782,.171},{.766,.225},{.791,.217},{.595,.530},{.238,.572},{.500,.690},{.660,.654},{.733,.214},{.785,.232},{.373,.597},{.813,.219},{.465,.562},{.756,.183},{.508,.719},{.266,.531},{.441,.653},{.571,.774},{.781,.394},{.765,.409},{.331,.414},{.284,.556},{.311,.418},{.411,.477},{.514,.641},{.509,.320},{.812,.211},{.742,.200},{.811,.153},{.728,.746},{.403,.572},{.250,.503},{.242,.440},{.740,.801},{.362,.617},{.309,.479},{.218,.563},{.466,.626},{.201,.606},{.614,.858},{.264,.57},{.203,.509},{.342,.597},{.258,.565},{.539,.552},{.743,.649},{.572,.582},{.205,.596},{.515,.560},{.577,.712},{.802,.269},{.761,.316},{.212,.515},{.287,.549},{.423,.644},{.673,.394},{.415,.627},{.422,.522},{.562,.603},{.701,.288},{.464,.352},{.162,.606},{.788,.440},{.237,.464},{.372,.605},{.612,.567},{.634,.807},{.781,.214},{.794,.481},{.722,.669},{.479,.318},{.612,.542},{.578,.638},{.626,.534},{.514,.659},{.616,.461},{.625,.447},{.612,.493},{.515,.422},{.655,.625},{.423,.592},{.225,.465},{.495,.445},{.798,.231},{.745,.417},{.716,.406},{.653,.418},{.773,.337},{.645,.680},{.626,.417},{.474,.711},{.548,.410},{.218,.410},{.725,.763},{.221,.486},{.357,.400},{.743,.488},{.399,.417},{.611,.301},{.586,.685},{.275,.610},{.569,.712},{.560,.698},{.439,.677},{.669,.283},{.493,.418},{.305,.613},{.203,.527},{.816,.381},{.576,.527},{.852,.307},{.613,.514},{.152,.430}},[2]={{.376,.594},{.412,.655},{.389,.405},{.454,.631},{.639,.330},{.605,.294},{.678,.648},{.722,.520},{.846,.256},{.423,.440},{.433,.586},{.172,.627},{.231,.401},{.282,.621},{.207,.534},{.590,.527},{.696,.757},{.715,.405},{.650,.768},{.294,.399},{.235,.636},{.377,.617},{.449,.651},{.416,.566},{.367,.394},{.480,.435},{.494,.565},{.639,.508},{.577,.386},{.579,.318},{.571,.315},{.617,.578},{.516,.332},{.572,.703},{.186,.572},{.794,.432},{.769,.440},{.714,.288},{.690,.250},{.728,.224},{.820,.421},{.532,.759},{.867,.156},{.536,.767},{.816,.271},{.633,.881},{.768,.195},{.266,.628},{.229,.505},{.123,.538}}},
vetcirtyash03={[1]={{.787,.824},{.717,.837},{.870,.832},{.603,.505},{.709,.835}}},
selenesweb={[1]={{.473,.332},{.392,.470},{.539,.596},{.755,.332},{.324,.448},{.614,.533},{.315,.259},{.251,.326},{.388,.476},{.456,.391},{.748,.322},{.262,.328},{.318,.442}}},
tempestislandncave={[1]={{.843,.628},{.772,.594},{.731,.663},{.779,.592}}},
hollowlair={[2]={{.122,.774}}},
oldcreepycave={[2]={{.374,.629},{.372,.623}}},
karthdar={[2]={{.337,.867},{.329,.862}}},
tempestislandswcave={[1]={{.585,.168},{.542,.465},{.571,.298},{.558,.293},{.563,.300},{.534,.465}}},
velynharbor={[1]={{.689,.306},{.531,.628},{.185,.372},{.458,.425},{.839,.663},{.637,.154},{.347,.268},{.859,.575},{.759,.477},{.890,.621},{.809,.845},{.526,.616},{.922,.731},{.340,.270}},[2]={{.270,.612},{.255,.414},{.509,.622},{.604,.360},{.716,.221},{.647,.557},{.405,.269},{.878,.604},{.306,.628}}},
vulkhelguard={[1]={{.574,.682},{.739,.606},{.827,.321},{.934,.177},{.745,.432},{.249,.374},{.628,.336},{.161,.678},{.831,.168},{.188,.096},{.932,.630}},[2]={{.207,.437},{.953,.218},{.789,.221},{.339,.328}}},
rootsunder={[1]={{.469,.264},{.700,.549},{.587,.704},{.479,.423},{.705,.558},{.879,.450},{.359,.365},{.755,.164},{.362,.291},{.683,.42},{.473,.430},{.753,.304},{.460,.270},{.395,.428},{.290,.670},{.523,.730},{.580,.590},{.791,.541},{.459,.316},{.726,.404},{.517,.359},{.773,.215},{.584,.697},{.213,.630},{.747,.611},{.422,.437},{.249,.701},{.809,.363},{.708,.552},{.654,.153},{.815,.412},{.425,.363},{.751,.498},{.850,.380},{.780,.212},{.257,.697},{.530,.729},{.252,.686},{.816,.361},{.825,.421},{.418,.354},{.871,.456},{.732,.5},{.522,.352},{.429,.440},{.536,.733},{.433,.447},{.758,.310},{.284,.675},{.843,.38},{.474,.321},{.783,.538},{.294,.661}}},
narilnagaia={[1]={{.490,.353},{.791,.722},{.521,.597},{.168,.565},{.320,.495},{.208,.369},{.51,.835},{.463,.475},{.194,.366},{.540,.221},{.702,.677},{.492,.350},{.700,.668},{.526,.214},{.526,.227},{.453,.476},{.307,.499},{.781,.727},{.505,.367},{.460,.485},{.205,.362},{.531,.222}}},
woodhearth={[1]={{.385,.637},{.698,.490},{.795,.330},{.593,.237},{.449,.666},{.587,.696},{.555,.242},{.517,.284},{.708,.310},{.322,.086},{.448,.168},{.967,.757},{.694,.478},{.437,.666},{.548,.237},{.444,.661},{.701,.482},{.376,.628},{.584,.236},{.592,.691}}},
eldenrootservices={[1]={{.437,.070},{.429,.077},{.002,.330},{.009,.324}}},
grahtwood={[1]={{.803,.539},{.752,.531},{.331,.361},{.466,.256},{.494,.194},{.240,.091},{.214,.137},{.192,.131},{.640,.330},{.654,.306},{.674,.312},{.640,.317},{.225,.286},{.249,.250},{.235,.149},{.188,.192},{.601,.655},{.646,.644},{.757,.581},{.687,.624},{.560,.175},{.269,.287},{.289,.258},{.299,.319},{.531,.205},{.566,.779},{.319,.310},{.310,.306},{.532,.332},{.339,.340},{.204,.287},{.202,.276},{.193,.207},{.238,.182},{.250,.189},{.265,.310},{.249,.232},{.367,.316},{.235,.159},{.377,.327},{.777,.581},{.733,.554},{.195,.158},{.563,.318},{.615,.247},{.479,.227},{.507,.324},{.628,.254},{.268,.183},{.441,.690},{.269,.148},{.660,.784},{.320,.338},{.599,.180},{.663,.614},{.654,.656},{.625,.660},{.651,.569},{.498,.561},{.227,.184},{.51,.201},{.417,.328},{.641,.609},{.477,.819},{.380,.374},{.555,.385},{.621,.708},{.751,.572},{.391,.730},{.506,.633},{.817,.766},{.662,.401},{.845,.754},{.240,.123},{.796,.762},{.826,.724},{.286,.230},{.603,.226},{.203,.206},{.371,.536},{.385,.746},{.843,.651},{.273,.207},{.556,.349},{.603,.327},{.483,.187},{.580,.163},{.473,.214},{.568,.810},{.567,.172},{.646,.387},{.428,.752},{.501,.772},{.212,.223},{.642,.737},{.278,.193},{.559,.362},{.458,.229},{.226,.222},{.202,.239},{.211,.195},{.772,.522},{.664,.362},{.537,.389},{.670,.343},{.517,.272},{.236,.251},{.223,.250},{.361,.333},{.258,.150},{.840,.634},{.418,.76},{.840,.581},{.459,.310},{.546,.399},{.446,.624},{.530,.639},{.486,.615},{.229,.263},{.238,.219},{.51,.343},{.647,.318},{.462,.326},{.560,.764},{.450,.305},{.516,.782},{.603,.216},{.649,.280},{.720,.625},{.597,.347},{.608,.381},{.431,.326},{.330,.308},{.274,.326},{.462,.341},{.371,.332},{.511,.546},{.665,.710},{.387,.753},{.676,.763},{.682,.715},{.595,.470},{.528,.462},{.698,.699},{.484,.630},{.567,.423}},[2]={{.830,.714},{.381,.782},{.593,.15},{.607,.320},{.587,.746},{.335,.554},{.234,.145},{.373,.556},{.366,.525},{.323,.607},{.321,.567},{.755,.470},{.542,.381},{.488,.425},{.296,.559},{.233,.557},{.257,.528},{.453,.307},{.683,.352},{.447,.287},{.563,.17},{.290,.367},{.399,.661},{.823,.590},{.484,.798},{.343,.467},{.656,.304},{.474,.186},{.713,.558},{.386,.72},{.680,.412},{.516,.793},{.475,.657},{.451,.662},{.304,.370},{.364,.333},{.734,.429},{.516,.595},{.697,.347},{.550,.372},{.380,.390},{.245,.087},{.228,.23},{.217,.242},{.287,.333},{.411,.460},{.301,.447},{.378,.512},{.610,.374},{.823,.567},{.825,.792},{.420,.492},{.802,.675},{.411,.291},{.446,.767},{.466,.767},{.222,.336},{.701,.625}}},
wormrootdepths={[1]={{.317,.529},{.311,.515},{.311,.722},{.774,.188},{.247,.774},{.173,.618},{.827,.281},{.301,.718},{.186,.545},{.867,.623},{.820,.282},{.603,.438},{.171,.633},{.432,.469},{.184,.626},{.308,.535},{.419,.468},{.247,.782},{.874,.617},{.176,.545},{.309,.528},{.593,.437},{.301,.538},{.430,.458}}},
barkbitemine={[1]={{.165,.622}}},
caveofbrokensails={[1]={{.297,.365},{.292,.360}}},
boneorchard={[1]={{.706,.193},{.716,.196}}},
campgushnukbur={[1]={{.650,.389},{.596,.686},{.577,.724},{.642,.362},{.560,.707}},[2]={{.586,.721},{.567,.729},{.807,.716}}},
crimsoncove={[1]={{.532,.499},{.521,.472},{.321,.426},{.539,.714},{.373,.433},{.341,.559},{.628,.616},{.534,.495},{.479,.348},{.508,.351},{.430,.550},{.430,.484},{.634,.546},{.552,.303},{.341,.485},{.404,.461},{.399,.536},{.441,.486},{.568,.509},{.410,.353},{.620,.616},{.531,.509},{.381,.443},{.475,.342},{.628,.505},{.406,.472},{.627,.758},{.587,.542},{.630,.507},{.312,.422},{.437,.550},{.400,.467},{.628,.749},{.578,.537},{.399,.550},{.625,.624},{.638,.510},{.618,.547},{.399,.544},{.335,.493},{.620,.762},{.623,.605},{.345,.491}}},
coromount={[1]={{.184,.992},{.182,.970}}},
burrootkwamamine={[1]={{.765,.423},{.389,.722},{.306,.78},{.804,.494},{.683,.353},{.730,.454},{.762,.434},{.507,.764},{.675,.629},{.382,.713},{.792,.495},{.905,.429},{.277,.682},{.682,.626},{.297,.769},{.507,.752},{.374,.720}}},
jodeslight={[1]={{.458,.436},{.574,.620},{.475,.623},{.483,.198},{.483,.250},{.178,.536},{.628,.851},{.205,.48},{.411,.520},{.841,.448},{.470,.437},{.405,.333},{.467,.634},{.165,.170},{.788,.319},{.612,.334},{.569,.571},{.857,.675},{.147,.706},{.571,.611},{.113,.481},{.171,.541},{.637,.845},{.195,.481},{.397,.515},{.793,.312},{.577,.572},{.567,.642},{.863,.680},{.198,.473},{.465,.431},{.467,.621},{.786,.309},{.575,.639}}},
gurzagsmine={[1]={{.387,.725},{.392,.71},{.249,.759},{.596,.766},{.644,.383},{.318,.522},{.780,.593},{.259,.773},{.382,.714},{.624,.458},{.584,.769},{.897,.460},{.313,.775},{.791,.479},{.617,.457},{.899,.470},{.656,.386},{.304,.776},{.782,.477},{.266,.763},{.320,.514}}},
tomboftheapostates={[1]={{.678,.425},{.755,.689},{.647,.907},{.483,.115},{.743,.803},{.288,.857},{.617,.644},{.669,.219},{.330,.836},{.635,.905},{.495,.219},{.687,.414},{.615,.346},{.684,.481},{.483,.128},{.292,.844},{.437,.573},{.421,.805},{.572,.267},{.503,.346},{.744,.692},{.740,.812},{.686,.427},{.680,.495},{.474,.127},{.733,.811},{.561,.269},{.293,.852},{.504,.217},{.634,.914},{.435,.580}}},
haven={[1]={{.772,.688},{.106,.430},{.297,.492},{.669,.657},{.717,.441},{.650,.583},{.025,.411},{.187,.358},{.077,.669}},[2]={{.633,.671},{.229,.687},{.695,.239}}},
thibautscairn={[1]={{.464,.802},{.401,.585},{.906,.605},{.820,.826},{.83,.575},{.265,.493},{.290,.701},{.585,.839},{.399,.849},{.722,.515},{.460,.794},{.548,.706},{.789,.403},{.854,.512},{.762,.663},{.826,.583},{.897,.598},{.890,.769},{.810,.823},{.407,.576},{.595,.835},{.409,.831},{.45,.836},{.265,.486},{.413,.708},{.749,.762},{.728,.520},{.789,.715},{.205,.554},{.297,.714},{.779,.671},{.820,.824},{.415,.836},{.407,.700},{.754,.745},{.794,.721},{.455,.842},{.882,.767},{.442,.853},{.450,.790},{.255,.495},{.850,.494}}},
marbruk={[1]={{.387,.805},{.390,.796},{.395,.802}}},
tempestislandsecave={[1]={{.195,.435},{.204,.431},{.233,.636},{.744,.298},{.446,.525},{.449,.642},{.738,.291},{.459,.640},{.224,.625}}},
khenarthisroost={[1]={{.56,.833},{.630,.789},{.671,.753},{.743,.688},{.767,.664},{.682,.509},{.771,.512},{.779,.529},{.827,.522},{.799,.408},{.631,.486},{.331,.301},{.275,.284},{.230,.288},{.187,.333},{.737,.655},{.706,.587},{.827,.471},{.217,.404},{.092,.487},{.105,.497},{.254,.647},{.257,.631},{.387,.772},{.517,.716},{.403,.815},{.407,.747},{.640,.632},{.660,.514},{.566,.586},{.249,.348},{.103,.510},{.175,.429},{.744,.424},{.581,.543},{.619,.747},{.509,.816},{.496,.794},{.213,.628},{.61,.502},{.347,.545},{.110,.532},{.411,.84},{.502,.58},{.513,.633},{.414,.558},{.326,.378},{.169,.617},{.109,.565},{.630,.625},{.688,.533},{.407,.655},{.700,.727},{.385,.593},{.579,.189},{.168,.535},{.509,.505},{.351,.356},{.523,.732},{.408,.444},{.459,.589},{.615,.267},{.322,.595},{.423,.760},{.185,.462},{.290,.318},{.310,.554},{.399,.391},{.775,.303},{.424,.322},{.605,.366},{.67,.680},{.263,.653},{.379,.747},{.214,.424},{.343,.781},{.322,.752},{.787,.599},{.192,.611},{.347,.816},{.310,.680},{.824,.553},{.305,.750},{.680,.647},{.636,.306},{.564,.675},{.420,.589},{.244,.406},{.406,.367},{.256,.512},{.233,.461},{.417,.756},{.633,.727},{.252,.338},{.207,.357},{.608,.832},{.494,.732}},[2]={{.424,.55},{.115,.497},{.824,.488},{.368,.431},{.675,.548},{.700,.608},{.767,.345},{.606,.647},{.635,.683},{.549,.664},{.660,.420},{.612,.515},{.404,.715},{.210,.478},{.244,.515},{.284,.442},{.298,.404},{.241,.338},{.235,.562},{.740,.474},{.779,.316},{.740,.498},{.461,.648},{.344,.405},{.376,.64},{.405,.391},{.359,.735},{.761,.432},{.739,.428},{.331,.569}}},
eldenrootgroundfloor={[1]={{.351,.241},{.330,.337},{.736,.521},{.456,.257},{.506,.159},{.610,.920},{.255,.720},{.418,.051},{.371,.002},{.347,.239},{.451,.260},{.514,.156},{.733,.532},{.638,.372}},[2]={{.279,.944}}},
barkbitecave={[2]={{.676,.811},{.677,.819}}},
shaelruins={[1]={{.309,.417},{.301,.407},{.699,.177},{.411,.505},{.813,.768},{.623,.658},{.472,.552},{.129,.626},{.310,.630},{.560,.099},{.519,.261},{.453,.892},{.329,.905},{.131,.706},{.785,.606},{.696,.825},{.415,.264},{.316,.626},{.353,.307},{.796,.763},{.703,.185},{.118,.852},{.408,.511},{.777,.597},{.409,.255},{.69,.828},{.567,.103},{.805,.757},{.402,.507},{.566,.111},{.341,.303},{.342,.907},{.379,.311},{.525,.249},{.686,.836}}},
theunderroot={[1]={{.496,.400},{.375,.223},{.633,.209},{.384,.234},{.483,.401},{.287,.284},{.576,.118},{.481,.448},{.349,.269},{.488,.396},{.513,.498},{.600,.315},{.408,.589},{.358,.270},{.376,.235},{.643,.213},{.515,.509},{.607,.31},{.631,.218},{.407,.598}}},
eldenhollow={[1]={{.447,.269},{.783,.635},{.452,.274},{.684,.706},{.774,.663},{.729,.512},{.341,.437},{.515,.292},{.566,.588},{.675,.621},{.887,.489},{.762,.644},{.542,.661},{.744,.602},{.788,.701},{.758,.360},{.342,.438},{.733,.505},{.659,.387},{.692,.704},{.577,.532},{.786,.437},{.784,.638},{.875,.549},{.731,.499},{.536,.236},{.646,.369},{.566,.555},{.915,.550},{.254,.449},{.435,.513},{.750,.364},{.342,.447},{.562,.554},{.737,.596},{.776,.698},{.771,.438},{.755,.647},{.934,.552},{.425,.506},{.536,.236},{.665,.383},{.544,.236},{.747,.594},{.742,.586},{.882,.496},{.572,.596},{.680,.614}}},
crimsoncove02={[1]={{.796,.515},{.885,.504},{.663,.506},{.804,.507},{.662,.498},{.611,.176},{.595,.379},{.536,.191},{.895,.497},{.897,.49},{.531,.304},{.593,.376},{.625,.269},{.532,.312}}},
sacredleapgrotto={[2]={{.172,.453}}},
caracdena={[1]={{.449,.398},{.317,.808},{.606,.640},{.741,.717},{.620,.627},{.375,.135},{.457,.403},{.738,.709},{.131,.234},{.453,.739},{.202,.202},{.609,.633},{.390,.130},{.477,.528},{.310,.812},{.212,.199},{.478,.535},{.390,.141}}},
seleneswebfinalbossarea={[1]={{.334,.134},{.158,.133},{.344,.197},{.313,.154},{.221,.147},{.194,.143},{.274,.122},{.23,.071},{.355,.154}}},
hoarvorpit={[1]={{.460,.769},{.597,.453},{.726,.619},{.613,.080},{.774,.739},{.516,.163},{.707,.130},{.55,.697},{.629,.442},{.655,.344},{.716,.237},{.465,.780},{.264,.432},{.686,.914},{.615,.065},{.578,.684},{.744,.402},{.256,.255},{.432,.185},{.751,.365},{.593,.346},{.605,.535},{.256,.263},{.584,.34},{.707,.241},{.457,.781},{.257,.426},{.737,.405},{.642,.440},{.758,.372},{.253,.432},{.420,.184},{.605,.526},{.709,.234},{.471,.784},{.768,.744},{.742,.411},{.619,.076},{.249,.26}}},
barrowtrench={[1]={{.302,.549},{.383,.491},{.092,.631},{.247,.568},{.214,.447},{.319,.514},{.456,.232},{.239,.574},{.325,.521},{.214,.44},{.671,.477},{.419,.528},{.465,.315},{.291,.554},{.411,.537}}},
thevilemansesecondfloor={[1]={{.731,.386},{.51,.744},{.442,.861},{.296,.551},{.840,.274},{.689,.456},{.329,.593},{.806,.375},{.733,.389},{.352,.365},{.657,.377},{.525,.903},{.294,.558},{.299,.301},{.810,.388},{.220,.573},{.436,.868},{.527,.894}}},
weepingwindcave={[1]={{.202,.905},{.430,.929},{.377,.904},{.434,.920},{.500,.832},{.590,.684},{.499,.825},{.227,.663},{.215,.622},{.335,.378},{.369,.898},{.540,.562},{.532,.902},{.577,.675},{.197,.812},{.686,.118},{.494,.486},{.450,.678},{.393,.526},{.439,.925},{.462,.586},{.700,.197},{.418,.188},{.203,.898},{.647,.308},{.432,.249},{.368,.905},{.551,.563},{.691,.184},{.633,.304},{.341,.384},{.542,.903},{.444,.682},{.437,.931},{.691,.193},{.424,.179},{.435,.240},{.354,.380},{.201,.625},{.400,.525}}},
mistral={[1]={{.814,.695},{.168,.488},{.069,.481},{.157,.495},{.040,.289},{.346,.407},{.435,.700},{.131,.025},{.875,.646},{.054,.200},{.806,.697},{.092,.906},{.416,.985},{.339,.413},{.447,.697},{.885,.650},{.127,.032},{.063,.476},{.884,.641},{.808,.690},{.352,.412},{.033,.285},{.056,.209}},[2]={{.051,.293},{.817,.750},{.059,.289}}},
hazikslair={[2]={{.772,.556},{.761,.558},{.521,.506},{.523,.513},{.510,.502}}},
entilasfolly={[1]={{.604,.397},{.303,.645},{.475,.435},{.482,.428},{.364,.353},{.813,.648},{.333,.362},{.144,.437},{.310,.649},{.820,.867},{.378,.600},{.462,.307},{.365,.645},{.669,.432},{.623,.584},{.926,.744},{.202,.396},{.131,.481},{.133,.440},{.620,.381},{.087,.458},{.608,.428},{.596,.403},{.587,.489},{.374,.357},{.821,.875},{.134,.489},{.384,.597},{.191,.393},{.932,.751},{.578,.498},{.367,.346}}},
auridon={[1]={{.435,.692},{.535,.468},{.330,.105},{.413,.124},{.505,.235},{.712,.827},{.421,.405},{.412,.135},{.435,.544},{.536,.506},{.534,.683},{.604,.753},{.712,.855},{.800,.485},{.659,.425},{.643,.321},{.538,.236},{.416,.244},{.414,.127},{.395,.265},{.593,.851},{.469,.778},{.396,.624},{.828,.477},{.463,.812},{.437,.152},{.688,.744},{.514,.497},{.666,.688},{.415,.719},{.515,.865},{.628,.747},{.561,.695},{.456,.197},{.327,.261},{.435,.152},{.545,.486},{.486,.156},{.469,.486},{.437,.507},{.614,.391},{.409,.263},{.708,.746},{.559,.736},{.393,.634},{.671,.830},{.695,.707},{.718,.634},{.614,.435},{.368,.138},{.581,.334},{.655,.344},{.377,.192},{.675,.316},{.576,.403},{.587,.369},{.534,.452},{.505,.453},{.619,.849},{.664,.701},{.578,.699},{.681,.711},{.651,.297},{.605,.302},{.576,.232},{.659,.399},{.441,.569},{.217,.236},{.632,.458},{.456,.522},{.393,.154},{.613,.774},{.612,.562},{.482,.182},{.452,.540},{.719,.814},{.679,.815},{.843,.517},{.811,.515},{.806,.543},{.380,.680},{.595,.344},{.664,.381},{.612,.262},{.509,.92},{.705,.628},{.701,.610},{.702,.771},{.693,.780},{.500,.213},{.463,.180},{.508,.242},{.444,.336},{.494,.272},{.558,.301},{.550,.190},{.492,.259},{.431,.195},{.711,.947},{.424,.723},{.612,.697},{.596,.287},{.598,.232},{.487,.872},{.410,.233},{.479,.176},{.459,.132},{.481,.132},{.467,.187},{.437,.169},{.432,.215},{.182,.244},{.232,.256},{.549,.183},{.389,.147},{.528,.498},{.278,.070},{.439,.245},{.230,.306},{.439,.114},{.424,.078},{.459,.174},{.365,.157},{.396,.173},{.334,.130},{.473,.130},{.197,.265},{.365,.132},{.237,.277},{.260,.050},{.709,.544},{.539,.794},{.557,.774},{.526,.745},{.525,.789},{.490,.776},{.467,.533},{.464,.857},{.412,.606},{.596,.783},{.538,.752},{.512,.755},{.536,.718},{.557,.796},{.688,.849},{.650,.696},{.554,.823},{.401,.249}},[2]={{.525,.176},{.471,.163},{.519,.210},{.51,.913},{.496,.545},{.346,.112},{.533,.823},{.257,.045},{.507,.256},{.715,.864},{.506,.82},{.398,.749},{.619,.311},{.493,.434},{.527,.301},{.473,.624},{.358,.301},{.703,.802},{.678,.71},{.674,.671},{.713,.606},{.663,.640},{.568,.642},{.559,.593},{.576,.322},{.546,.307},{.335,.144},{.352,.265},{.471,.829},{.390,.681},{.433,.466},{.404,.366},{.354,.355},{.237,.355},{.183,.232},{.421,.203},{.566,.435},{.560,.479},{.468,.541},{.491,.629},{.545,.642},{.417,.615},{.601,.700},{.652,.838},{.459,.856},{.595,.866},{.677,.314},{.438,.543},{.441,.077},{.432,.286},{.475,.566},{.657,.381},{.472,.824},{.708,.547},{.660,.541}}},
cityofashboss={[1]={{.618,.657},{.605,.722},{.781,.798},{.661,.637}}},
torinaan1={[1]={{.254,.261}}},
cityofashmain={[1]={{.385,.335},{.221,.627},{.370,.573},{.154,.637},{.466,.197},{.448,.183},{.302,.552},{.382,.284},{.349,.632},{.347,.480},{.285,.378},{.285,.436},{.294,.629},{.246,.347},{.229,.597},{.398,.514},{.294,.497},{.394,.483},{.304,.406},{.260,.642},{.273,.465},{.285,.606},{.340,.560},{.350,.606},{.386,.291},{.309,.558},{.306,.544},{.278,.607}}},
mawlorkajsevenriddles={[1]={{.698,.524},{.707,.480},{.745,.515}}},
greenshade={[1]={{.526,.718},{.698,.867},{.604,.700},{.286,.705},{.524,.817},{.117,.490},{.315,.343},{.330,.272},{.257,.256},{.276,.153},{.622,.928},{.536,.904},{.465,.904},{.386,.517},{.232,.397},{.232,.381},{.266,.275},{.501,.793},{.508,.791},{.501,.784},{.479,.759},{.571,.644},{.300,.162},{.693,.661},{.341,.798},{.400,.187},{.365,.14},{.724,.674},{.747,.851},{.568,.678},{.358,.543},{.296,.406},{.799,.694},{.792,.686},{.735,.692},{.275,.13},{.245,.138},{.580,.328},{.593,.281},{.263,.192},{.366,.211},{.257,.286},{.254,.219},{.410,.457},{.261,.322},{.383,.708},{.598,.670},{.504,.746},{.565,.784},{.377,.278},{.264,.615},{.391,.447},{.401,.449},{.368,.624},{.261,.865},{.231,.155},{.268,.415},{.309,.744},{.795,.672},{.121,.453},{.115,.527},{.211,.291},{.423,.716},{.626,.609},{.314,.113},{.554,.662},{.522,.350},{.702,.874},{.542,.855},{.249,.838},{.317,.230},{.292,.348},{.583,.341},{.634,.407},{.626,.596},{.212,.357},{.150,.549},{.264,.853},{.729,.745},{.504,.335},{.286,.695},{.537,.803},{.304,.343},{.258,.592},{.218,.303},{.221,.321},{.726,.624},{.509,.687},{.498,.350},{.605,.748},{.533,.652},{.359,.523},{.302,.808},{.441,.727},{.18,.424},{.555,.748},{.495,.285},{.448,.224},{.479,.212},{.466,.267},{.472,.235},{.216,.315},{.432,.365},{.220,.344},{.442,.218},{.371,.228},{.508,.267},{.345,.724},{.331,.327},{.481,.704},{.745,.641},{.337,.276},{.622,.870},{.688,.436},{.378,.543},{.752,.724},{.388,.333},{.303,.073},{.688,.719},{.724,.844},{.686,.874},{.458,.889},{.309,.786},{.280,.122},{.478,.373},{.424,.226},{.410,.209},{.412,.271},{.443,.394},{.451,.423},{.325,.521},{.523,.905},{.566,.855},{.768,.775},{.650,.89},{.451,.904},{.356,.460},{.330,.062},{.533,.311},{.611,.348},{.593,.300},{.631,.887},{.644,.374},{.596,.641},{.395,.148},{.180,.404},{.153,.423},{.590,.369},{.688,.315},{.680,.316},{.684,.308},{.690,.294},{.684,.300},{.716,.317},{.695,.287},{.712,.323}},[2]={{.259,.142},{.765,.779},{.245,.214},{.484,.353},{.683,.320},{.464,.309},{.704,.418},{.692,.617},{.748,.634},{.534,.431},{.237,.338},{.574,.334},{.173,.743},{.291,.329},{.592,.636},{.685,.821},{.125,.480},{.648,.388},{.312,.379},{.467,.403},{.295,.276},{.346,.263},{.402,.272},{.497,.301},{.595,.305},{.564,.310},{.627,.343},{.336,.184},{.361,.142},{.481,.482},{.276,.233},{.313,.548},{.473,.488},{.498,.484},{.308,.301},{.315,.803},{.401,.736},{.398,.611},{.751,.849},{.415,.290},{.499,.787},{.437,.680},{.219,.382},{.566,.772},{.643,.833},{.607,.880},{.616,.670},{.726,.697},{.357,.567},{.726,.854},{.690,.852},{.414,.214},{.476,.822},{.378,.708},{.254,.55},{.312,.075},{.620,.914},{.453,.356},{.792,.689},{.803,.689}}},
reapersmarch={[1]={{.359,.103},{.488,.124},{.358,.765},{.416,.666},{.222,.721},{.237,.692},{.437,.745},{.574,.706},{.479,.793},{.419,.442},{.473,.497},{.440,.150},{.311,.674},{.516,.734},{.473,.383},{.437,.684},{.271,.842},{.429,.671},{.432,.096},{.560,.276},{.289,.225},{.244,.161},{.515,.304},{.249,.539},{.466,.655},{.412,.689},{.265,.713},{.213,.781},{.263,.881},{.522,.656},{.579,.672},{.571,.600},{.494,.490},{.641,.266},{.760,.314},{.761,.178},{.238,.250},{.26,.137},{.426,.473},{.659,.230},{.510,.590},{.722,.194},{.239,.514},{.226,.497},{.193,.444},{.506,.548},{.606,.219},{.631,.327},{.555,.306},{.426,.655},{.689,.238},{.343,.142},{.486,.193},{.772,.308},{.560,.326},{.239,.600},{.385,.585},{.554,.613},{.386,.277},{.441,.386},{.252,.831},{.302,.874},{.427,.832},{.463,.700},{.688,.340},{.284,.260},{.324,.7},{.183,.437},{.221,.347},{.411,.763},{.405,.725},{.150,.423},{.343,.300},{.342,.275},{.406,.205},{.372,.334},{.584,.290},{.753,.229},{.262,.274},{.651,.216},{.700,.304},{.328,.533},{.409,.888},{.439,.216},{.255,.286},{.240,.346},{.457,.503},{.597,.499},{.247,.441},{.445,.617},{.524,.618},{.255,.649},{.496,.66},{.259,.792},{.449,.432},{.576,.249},{.597,.594},{.511,.650},{.258,.746},{.322,.620},{.471,.708},{.369,.725},{.600,.287},{.511,.670},{.411,.247},{.676,.212},{.481,.334},{.388,.599},{.470,.401},{.200,.390},{.509,.195},{.674,.195},{.403,.755},{.357,.623},{.168,.423},{.421,.741},{.557,.553},{.574,.265},{.719,.164},{.537,.420},{.767,.266},{.629,.223},{.585,.232},{.375,.424},{.499,.355},{.557,.361},{.350,.501},{.601,.228},{.308,.834},{.563,.250},{.451,.829},{.301,.552},{.701,.199},{.761,.133},{.779,.200},{.399,.618},{.379,.679},{.421,.649},{.524,.498},{.388,.820},{.463,.585},{.423,.545},{.494,.528},{.434,.544},{.193,.781},{.277,.171},{.233,.735},{.268,.169}},[2]={{.295,.445},{.239,.744},{.385,.583},{.442,.724},{.482,.727},{.243,.491},{.350,.426},{.375,.403},{.441,.389},{.464,.335},{.449,.126},{.409,.423},{.537,.337},{.567,.425},{.583,.462},{.748,.290},{.328,.358},{.236,.346},{.511,.690},{.511,.563},{.363,.523},{.379,.824},{.559,.726},{.571,.694},{.567,.682},{.433,.600},{.515,.731},{.231,.772},{.152,.426},{.301,.143},{.657,.381},{.581,.602},{.276,.570},{.327,.636},{.331,.689},{.707,.189},{.364,.534},{.748,.255},{.709,.201},{.620,.386},{.269,.543},{.683,.330},{.599,.235},{.746,.131},{.348,.315},{.481,.211},{.565,.581},{.687,.351},{.485,.259},{.413,.385},{.309,.535},{.381,.224},{.390,.874},{.396,.080},{.488,.478},{.759,.388},{.560,.094},{.408,.538}}},
rootsofsilvenar={[1]={{.603,.374},{.214,.664},{.593,.372},{.716,.413},{.540,.569},{.415,.401},{.541,.409},{.737,.601},{.727,.422},{.716,.344},{.221,.660},{.853,.633},{.695,.435},{.264,.509},{.702,.752},{.759,.436},{.310,.597},{.804,.451},{.656,.444},{.566,.750},{.546,.490},{.709,.384},{.536,.419},{.706,.345},{.214,.655},{.857,.641},{.687,.436},{.271,.493},{.740,.436},{.306,.592},{.801,.444},{.648,.439},{.552,.479},{.707,.373},{.669,.438}}},
harridanslair={[1]={{.643,.852},{.590,.720},{.629,.678},{.385,.706},{.643,.837},{.632,.833},{.726,.415},{.262,.824},{.393,.709},{.635,.683},{.724,.51},{.479,.778},{.252,.71},{.641,.679},{.732,.513},{.709,.412},{.602,.727},{.635,.849},{.385,.713},{.272,.818},{.299,.610},{.459,.776},{.719,.408}}},
dessicatedcave={[1]={{.470,.885},{.476,.550},{.340,.625},{.624,.511},{.480,.398},{.55,.849},{.646,.393},{.466,.878},{.485,.458},{.580,.127},{.612,.651},{.477,.458},{.475,.542},{.329,.625},{.633,.513},{.473,.393},{.563,.852},{.471,.401},{.62,.650}}},
tempestisland={[1]={{.369,.662},{.729,.462},{.840,.323},{.516,.318},{.453,.815},{.442,.355},{.401,.394},{.772,.339},{.378,.651},{.416,.432},{.467,.726},{.468,.359},{.749,.283},{.421,.813},{.357,.738},{.446,.743},{.368,.582}}},
themangroves={[1]={{.823,.486},{.168,.076}}},
arenthia={[1]={{.925,.358},{.258,.601},{.605,.479},{.308,.692},{.053,.807},{.598,.382},{.416,.757}},[2]={{.446,.272}}},
toothmaulgully={[1]={{.369,.855},{.420,.586},{.434,.855},{.759,.260},{.247,.393},{.387,.210},{.712,.448},{.311,.262},{.775,.471},{.226,.443},{.416,.650},{.350,.527},{.295,.882},{.337,.844},{.479,.266},{.292,.903},{.486,.698},{.729,.505},{.787,.498},{.609,.692},{.474,.415},{.526,.575},{.444,.262},{.712,.459},{.479,.667},{.417,.315},{.595,.490},{.434,.220},{.422,.513},{.303,.376},{.222,.439},{.421,.645},{.608,.700},{.250,.232},{.730,.500},{.528,.566},{.536,.569},{.436,.262},{.412,.594},{.425,.320},{.596,.484},{.480,.660},{.424,.226}}},
ondil={[1]={{.397,.330},{.303,.159},{.402,.728},{.294,.155},{.376,.514},{.403,.253},{.306,.165},{.692,.706},{.210,.577},{.562,.097},{.138,.390},{.304,.298},{.448,.372},{.208,.210},{.369,.518},{.826,.635},{.401,.719},{.624,.361},{.078,.475},{.206,.339},{.519,.277},{.943,.648},{.833,.635},{.139,.677},{.518,.433},{.303,.151},{.405,.329},{.392,.721},{.134,.688},{.517,.443},{.147,.391},{.296,.163},{.138,.405},{.936,.654},{.301,.308},{.525,.263},{.453,.367},{.816,.629},{.614,.360},{.289,.160},{.197,.211},{.625,.368},{.511,.450}}},
greymire={[2]={{.146,.417},{.159,.420},{.450,.414}}},
mehrunesspite={[1]={{.541,.199},{.301,.712},{.436,.714},{.577,.878},{.591,.591},{.791,.172},{.299,.515},{.112,.522},{.488,.406},{.546,.204},{.460,.783},{.231,.647},{.290,.387},{.637,.402},{.180,.401},{.788,.236},{.534,.332},{.186,.509},{.288,.520},{.802,.189},{.103,.525},{.785,.243},{.578,.885},{.583,.591},{.405,.805},{.446,.724},{.787,.302},{.762,.587},{.805,.172},{.481,.407},{.295,.716},{.219,.649},{.401,.794},{.443,.714},{.778,.306},{.789,.258},{.538,.338},{.28,.383},{.453,.778},{.786,.313},{.104,.516},{.795,.253},{.439,.708}}},
rootsoftreehenge={[1]={{.315,.192}}},
rulanyilsfall={[1]={{.377,.327},{.446,.694},{.393,.385},{.418,.647},{.438,.686},{.466,.81},{.374,.319},{.458,.588},{.773,.377},{.829,.587},{.477,.812},{.832,.721},{.546,.341},{.476,.207},{.258,.511},{.416,.639},{.263,.583},{.197,.24},{.330,.268},{.823,.594},{.418,.587},{.241,.239},{.370,.184},{.491,.586},{.537,.495},{.673,.345},{.159,.415},{.551,.635},{.461,.596},{.439,.695},{.517,.373},{.829,.714},{.553,.491},{.678,.351},{.311,.323},{.153,.427},{.408,.641},{.459,.511},{.280,.410},{.551,.623},{.397,.668},{.795,.350},{.366,.327},{.566,.535},{.303,.317},{.833,.593},{.471,.816},{.305,.330},{.295,.414},{.377,.185},{.766,.372},{.545,.493},{.148,.413},{.322,.269}}},
vetcirtyash02={[1]={{.298,.806},{.246,.708},{.232,.783},{.168,.657},{.262,.729},{.550,.446},{.441,.376},{.465,.363},{.523,.361},{.277,.785}}},
cryptofheartsheroic={[1]={{.894,.127},{.887,.200},{.886,.128}}},
bangkorai={[1]={{.543,.744},{.589,.447},{.629,.681},{.718,.383},{.472,.435},{.473,.181},{.470,.223},{.507,.343},{.634,.344},{.349,.450},{.581,.475},{.526,.446},{.369,.584},{.720,.665},{.421,.765},{.338,.810},{.264,.886},{.321,.818},{.459,.271},{.519,.234},{.501,.170},{.640,.086},{.670,.237},{.571,.279},{.451,.523},{.530,.502},{.702,.492},{.281,.600},{.265,.593},{.298,.879},{.669,.668},{.590,.263},{.538,.282},{.606,.505},{.497,.410},{.677,.340},{.561,.506},{.607,.092},{.476,.539},{.525,.185},{.678,.491},{.273,.681},{.558,.555},{.359,.710},{.411,.637},{.509,.574},{.495,.560},{.321,.889},{.398,.444},{.371,.762},{.606,.262},{.495,.525},{.571,.230},{.478,.149},{.599,.237},{.327,.813},{.332,.836},{.361,.945},{.514,.109},{.499,.376},{.564,.527},{.463,.828},{.463,.845},{.478,.891},{.460,.882},{.685,.692},{.408,.561},{.359,.587},{.382,.514},{.412,.518},{.565,.106},{.350,.213},{.648,.441},{.610,.220},{.586,.721},{.492,.511},{.447,.858},{.664,.127},{.703,.205},{.700,.156},{.471,.924},{.684,.170},{.664,.714},{.387,.433},{.363,.604},{.353,.743},{.229,.662},{.473,.615},{.495,.624},{.257,.841},{.691,.679},{.591,.615},{.647,.675},{.392,.782},{.66,.661},{.688,.118},{.498,.446},{.652,.247},{.459,.441},{.351,.469},{.484,.513},{.446,.440},{.6,.707},{.427,.16},{.641,.354},{.492,.474},{.493,.463},{.551,.406},{.662,.509},{.643,.305},{.37,.771},{.645,.509},{.605,.759},{.569,.759},{.483,.659},{.608,.482},{.613,.343},{.673,.223},{.420,.481},{.622,.329},{.631,.563},{.574,.452},{.594,.675},{.607,.469},{.408,.492},{.401,.871},{.585,.386},{.500,.095},{.590,.520},{.644,.42},{.628,.515},{.628,.475},{.467,.493},{.479,.464},{.363,.451},{.418,.500},{.389,.186},{.407,.676},{.587,.077},{.673,.169},{.595,.533},{.622,.533},{.341,.615},{.375,.544},{.334,.761},{.608,.542},{.667,.498},{.475,.532},{.295,.748},{.319,.938},{.248,.810},{.371,.398},{.233,.692},{.314,.782},{.256,.810},{.346,.442}},[2]={{.583,.078},{.367,.271},{.661,.581},{.446,.484},{.345,.816},{.676,.136},{.273,.844},{.325,.658},{.595,.725},{.355,.472},{.480,.906},{.390,.541},{.508,.417},{.489,.228},{.570,.741},{.571,.665},{.356,.434},{.617,.529},{.348,.745},{.439,.502},{.319,.538},{.266,.879},{.393,.828},{.349,.452},{.323,.455},{.342,.592},{.385,.509},{.631,.433},{.272,.598},{.633,.710},{.438,.644},{.392,.776},{.286,.843},{.661,.182},{.653,.25},{.467,.170},{.629,.355},{.585,.168},{.395,.200},{.560,.499},{.554,.221},{.531,.164},{.704,.206},{.696,.295},{.418,.237},{.616,.301},{.506,.302},{.525,.322},{.559,.184},{.525,.300},{.353,.881},{.363,.697},{.495,.149},{.451,.301},{.649,.571},{.308,.787}}},
wayrest={[1]={{.396,.729},{.201,.089},{.742,.360},{.258,.777},{.152,.307},{.124,.278},{.683,.829},{.513,.094},{.436,.601},{.578,.094},{.231,.472}},[2]={{.996,.187},{.789,.736},{.604,.685},{.587,.758}}},
obsidianscar={[1]={{.754,.269},{.699,.760},{.507,.753},{.691,.760},{.445,.739},{.874,.220},{.530,.242},{.706,.744},{.901,.381},{.362,.310},{.507,.742},{.445,.746},{.523,.234},{.702,.750},{.507,.742},{.329,.683},{.871,.367},{.891,.223},{.113,.607},{.758,.320},{.403,.117},{.125,.441},{.807,.200},{.833,.661},{.812,.391},{.629,.323},{.604,.870},{.676,.427},{.573,.173},{.672,.230},{.530,.651},{.890,.384},{.545,.873},{.756,.257},{.665,.595},{.452,.744},{.529,.230},{.211,.306},{.115,.446},{.354,.597},{.194,.533},{.601,.751},{.690,.752},{.359,.405},{.827,.665},{.809,.384},{.668,.222},{.524,.648},{.763,.263},{.220,.308},{.208,.522},{.351,.417},{.666,.425},{.120,.435},{.216,.532},{.117,.601},{.514,.745},{.840,.666},{.604,.878},{.541,.654},{.637,.323},{.374,.309}}},
lostcity={[1]={{.421,.461},{.453,.640},{.601,.719},{.425,.467},{.485,.492},{.473,.565},{.705,.725},{.481,.486},{.463,.383},{.324,.641},{.560,.230},{.472,.416},{.440,.596},{.396,.605},{.618,.488},{.370,.656},{.435,.858},{.559,.163},{.361,.5},{.556,.627},{.405,.668},{.444,.544},{.491,.692},{.431,.623},{.349,.446},{.411,.898},{.420,.51},{.571,.699},{.477,.597},{.606,.724},{.405,.558},{.453,.650},{.350,.474},{.551,.257},{.426,.457},{.624,.484},{.357,.447},{.499,.694}}},
orcsfingerruins={[1]={{.406,.514},{.272,.443},{.418,.510},{.523,.587},{.655,.827},{.514,.593},{.665,.820},{.287,.447},{.507,.585},{.775,.762},{.603,.814},{.210,.396},{.352,.838},{.205,.275},{.287,.435},{.672,.816},{.819,.69},{.352,.829},{.272,.454},{.410,.504},{.512,.577},{.346,.822}}},
yldzuun={[1]={{.635,.743},{.390,.506},{.618,.300},{.552,.745},{.682,.831},{.420,.294},{.428,.371},{.693,.588},{.814,.778},{.639,.737},{.392,.435},{.686,.358},{.580,.676},{.849,.619},{.651,.087},{.743,.406},{.636,.728},{.414,.399},{.404,.648},{.384,.253},{.698,.594},{.412,.597}}},
tribulationcrypt={[1]={{.585,.309},{.536,.868},{.539,.88},{.688,.176},{.232,.195},{.550,.499},{.246,.192},{.598,.891},{.309,.282},{.324,.194},{.592,.324},{.689,.190},{.552,.869},{.565,.401},{.753,.279},{.531,.880},{.568,.420},{.740,.276},{.745,.281},{.315,.190}}},
wayrestsewers={[1]={{.585,.381},{.361,.721},{.406,.296},{.201,.059},{.228,.115},{.778,.420},{.781,.720},{.628,.696},{.411,.772},{.740,.550},{.528,.293},{.732,.319},{.675,.671},{.502,.625},{.288,.178},{.734,.724},{.730,.179},{.705,.483},{.832,.124},{.606,.647},{.354,.413},{.683,.586},{.359,.575},{.291,.665},{.787,.110},{.730,.367},{.394,.740}}},
evermore={[1]={{.265,.730},{.203,.356},{.361,.930},{.993,.804},{.372,.938},{.703,.972}},[2]={{.730,.171},{.232,.621},{.223,.617}}},
jaggerjaw={[1]={{.486,.270},{.495,.662},{.353,.734},{.384,.749},{.588,.807},{.542,.448},{.495,.662},{.588,.807},{.710,.593},{.701,.750},{.359,.205},{.520,.518},{.529,.148},{.799,.624},{.575,.209},{.511,.58},{.812,.591},{.493,.260},{.805,.592},{.437,.529},{.512,.823},{.541,.752},{.453,.265},{.517,.508},{.356,.718},{.497,.580},{.523,.819},{.391,.741},{.708,.748},{.459,.104},{.505,.574},{.527,.747},{.518,.500},{.573,.225},{.399,.742},{.430,.530},{.594,.811},{.500,.657},{.711,.600}}},
cryptwatchfort={[1]={{.677,.399},{.450,.316},{.512,.303},{.383,.296},{.460,.242},{.320,.169},{.449,.527},{.283,.424},{.586,.228},{.562,.823},{.311,.170},{.443,.319},{.318,.298},{.738,.258},{.626,.569},{.519,.163},{.498,.835},{.443,.535},{.673,.392},{.407,.454},{.279,.454},{.336,.382},{.687,.245},{.314,.247},{.703,.576},{.454,.235},{.511,.311},{.579,.221},{.273,.460},{.311,.238},{.508,.324},{.684,.401},{.329,.379},{.506,.317},{.325,.301},{.564,.816}}},
crestshademine={[1]={{.526,.331},{.676,.512},{.526,.323},{.715,.462},{.632,.365},{.526,.715},{.456,.379},{.494,.186},{.425,.301},{.511,.426},{.551,.272},{.679,.526},{.708,.473},{.516,.433}}},
spindleclutch={[1]={{.401,.420},{.653,.323},{.286,.350},{.410,.834},{.412,.835},{.505,.635},{.441,.612},{.424,.703},{.348,.647},{.772,.259},{.812,.506},{.635,.439},{.579,.266},{.347,.812},{.409,.866},{.341,.650},{.582,.164},{.404,.591},{.641,.434},{.277,.329},{.366,.867},{.627,.466},{.269,.331},{.67,.500},{.342,.688},{.641,.615},{.681,.547},{.369,.874},{.643,.606},{.634,.459},{.649,.316},{.466,.615},{.807,.509},{.288,.340},{.836,.406},{.502,.647},{.403,.582},{.293,.346},{.688,.553},{.422,.696},{.338,.681},{.624,.459},{.374,.860},{.408,.418},{.689,.544},{.780,.251},{.404,.871}}},
hildunessecretrefuge={[1]={{.463,.782},{.795,.304},{.633,.413},{.695,.307},{.794,.294},{.646,.428},{.584,.753},{.694,.291},{.575,.759},{.869,.455},{.475,.671},{.851,.319},{.804,.292},{.707,.469},{.395,.661},{.475,.781},{.867,.459},{.854,.310},{.387,.658},{.576,.751},{.707,.456}}},
aldcroft={[1]={{.329,.172},{.756,.757},{.264,.784},{.264,.777},{.337,.178}},[2]={{.494,.491},{.502,.49}}},
the_portal_chamber_map={[1]={{.626,.516},{.62,.525}}},
stormhaven={[1]={{.134,.570},{.185,.576},{.384,.660},{.788,.439},{.158,.540},{.163,.623},{.077,.303},{.180,.484},{.27,.414},{.254,.307},{.484,.349},{.136,.561},{.313,.622},{.298,.577},{.747,.430},{.434,.486},{.457,.541},{.711,.492},{.243,.481},{.442,.368},{.652,.362},{.740,.418},{.188,.329},{.270,.364},{.262,.446},{.415,.548},{.434,.533},{.350,.308},{.441,.613},{.672,.500},{.692,.583},{.755,.383},{.822,.473},{.264,.513},{.656,.529},{.224,.285},{.261,.421},{.471,.479},{.865,.503},{.884,.497},{.750,.498},{.277,.299},{.602,.480},{.640,.501},{.249,.368},{.263,.651},{.679,.564},{.832,.540},{.444,.573},{.468,.427},{.615,.402},{.649,.511},{.692,.601},{.146,.532},{.244,.400},{.545,.407},{.546,.463},{.652,.546},{.666,.367},{.686,.402},{.512,.654},{.719,.403},{.726,.380},{.619,.498},{.848,.507},{.141,.522},{.643,.532},{.473,.385},{.380,.388},{.662,.578},{.566,.427},{.876,.468},{.775,.508},{.669,.469},{.282,.650},{.611,.441},{.125,.350},{.670,.416},{.439,.629},{.571,.466},{.194,.213},{.303,.331},{.273,.432},{.25,.502},{.251,.488},{.213,.317},{.675,.585},{.744,.509},{.802,.524},{.221,.453},{.322,.469},{.391,.640},{.343,.344},{.349,.361},{.310,.505},{.704,.590},{.249,.348},{.424,.600},{.084,.356},{.125,.322},{.363,.432},{.636,.529},{.414,.484},{.451,.465},{.585,.450},{.703,.336},{.314,.498},{.777,.551},{.492,.434},{.675,.422},{.303,.498},{.549,.360},{.869,.427},{.643,.345},{.828,.401},{.339,.371},{.479,.476},{.477,.647},{.541,.447},{.258,.523},{.185,.311},{.472,.438},{.808,.408},{.535,.421},{.701,.544},{.309,.586},{.138,.578},{.838,.461},{.276,.531},{.292,.497},{.455,.521},{.422,.520},{.404,.593},{.473,.422},{.652,.393},{.507,.595},{.547,.620},{.162,.420}},[2]={{.391,.64},{.235,.327},{.49,.641},{.279,.555},{.685,.464},{.476,.443},{.776,.502},{.805,.475},{.837,.432},{.094,.307},{.214,.197},{.330,.339},{.136,.581},{.308,.432},{.308,.325},{.552,.377},{.559,.497},{.634,.369},{.672,.429},{.274,.537},{.275,.474},{.755,.390},{.416,.413},{.462,.489},{.476,.646},{.682,.599},{.466,.525},{.124,.357},{.653,.347},{.395,.379},{.489,.476},{.532,.459},{.640,.389},{.659,.538},{.843,.411},{.863,.437},{.772,.446},{.318,.463},{.181,.620},{.455,.434},{.237,.275},{.375,.651},{.852,.501},{.486,.511},{.168,.517},{.447,.420},{.851,.397},{.340,.606},{.085,.353},{.617,.648},{.227,.449},{.830,.398},{.345,.373},{.578,.651},{.604,.365}}},
hoarfrost={[1]={{.624,.764},{.989,.984},{.075,.364},{.852,.481},{.244,.969},{.657,.438},{.720,.903},{.442,.835}},[2]={{.976,.615}}},
enduum={[1]={{.424,.293},{.507,.307},{.420,.301},{.401,.692},{.710,.855},{.689,.293},{.348,.389},{.445,.346},{.642,.204},{.627,.465},{.511,.386},{.439,.416},{.483,.299},{.717,.075},{.553,.600},{.568,.462},{.688,.079},{.350,.523},{.323,.437},{.324,.281},{.682,.661},{.641,.192},{.430,.418}}},
coldrockdiggings={[1]={{.192,.872},{.911,.270},{.726,.579},{.734,.364},{.331,.217},{.767,.408},{.265,.899},{.685,.274},{.226,.858},{.661,.405},{.747,.357},{.607,.621},{.49,.329},{.64,.318},{.335,.692},{.553,.344},{.714,.451},{.630,.316},{.193,.856},{.412,.291},{.710,.461},{.720,.569},{.723,.585},{.734,.582},{.740,.357},{.703,.281},{.403,.289},{.600,.629},{.604,.556},{.259,.681},{.268,.669},{.714,.473},{.256,.668},{.319,.214},{.707,.293},{.719,.461},{.728,.572}}},
norvulkruins={[1]={{.252,.254},{.246,.457},{.821,.649},{.445,.374},{.239,.247},{.460,.381},{.246,.444},{.347,.830},{.816,.659},{.537,.590},{.673,.545},{.737,.791},{.576,.55},{.244,.256},{.464,.666},{.446,.382},{.820,.665},{.526,.591},{.756,.773},{.596,.555},{.345,.843},{.538,.579},{.75,.785},{.454,.384}}},
sentinel={[1]={{.777,.490},{.715,.826},{.360,.448},{.042,.455},{.690,.374},{.399,.175},{.383,.635}},[2]={{.820,.744},{.255,.176}}},
rivenspire={[1]={{.47,.606},{.547,.568},{.180,.581},{.207,.619},{.162,.569},{.147,.595},{.153,.564},{.188,.601},{.653,.228},{.819,.314},{.645,.678},{.162,.634},{.599,.489},{.856,.316},{.584,.477},{.657,.641},{.586,.679},{.526,.588},{.566,.687},{.854,.305},{.795,.116},{.750,.150},{.622,.455},{.823,.357},{.250,.505},{.242,.570},{.179,.665},{.738,.385},{.680,.605},{.695,.622},{.460,.621},{.594,.661},{.733,.429},{.207,.673},{.732,.254},{.687,.139},{.557,.668},{.255,.552},{.564,.483},{.381,.301},{.707,.225},{.309,.628},{.282,.539},{.520,.654},{.684,.131},{.544,.518},{.683,.297},{.258,.580},{.618,.677},{.212,.526},{.643,.498},{.375,.401},{.500,.541},{.244,.603},{.502,.512},{.387,.440},{.85,.258},{.203,.696},{.770,.154},{.760,.203},{.306,.387},{.610,.619},{.396,.408},{.393,.357},{.690,.662},{.655,.424},{.701,.215},{.428,.310},{.402,.296},{.747,.309},{.686,.324},{.233,.597},{.753,.239},{.836,.283},{.615,.685},{.526,.668},{.497,.632},{.624,.672},{.317,.567},{.787,.343},{.310,.474},{.701,.122},{.546,.637},{.255,.496},{.732,.225},{.684,.648},{.716,.153},{.761,.333},{.631,.718},{.700,.644},{.689,.642},{.689,.629},{.698,.726},{.752,.272},{.675,.697},{.703,.266},{.500,.673},{.454,.631},{.347,.316},{.658,.369},{.690,.353},{.689,.608},{.728,.206},{.751,.383},{.588,.740},{.207,.682},{.265,.569},{.274,.590},{.565,.627},{.528,.531},{.692,.702},{.535,.639},{.563,.643},{.583,.614},{.625,.579},{.506,.621},{.725,.699},{.723,.721},{.515,.648},{.805,.116},{.840,.329},{.490,.605},{.539,.623},{.635,.628},{.803,.301},{.512,.636},{.599,.632},{.398,.377},{.755,.228},{.788,.118},{.817,.179},{.782,.197},{.799,.146},{.833,.158},{.829,.176},{.845,.199},{.792,.170},{.451,.513},{.440,.551},{.350,.521},{.619,.752},{.362,.555},{.604,.575}},[2]={{.574,.660},{.341,.678},{.268,.514},{.305,.679},{.394,.686},{.671,.609},{.649,.611},{.636,.592},{.619,.518},{.625,.513},{.586,.495},{.591,.431},{.593,.465},{.573,.481},{.73,.454},{.666,.325},{.678,.466},{.691,.500},{.764,.276},{.724,.221},{.331,.492},{.292,.495},{.278,.547},{.270,.590},{.296,.633},{.785,.327},{.811,.351},{.833,.283},{.602,.456},{.503,.607},{.534,.528},{.551,.591},{.248,.511},{.433,.688},{.687,.636},{.555,.555},{.647,.499},{.638,.645},{.715,.712},{.705,.731},{.148,.590},{.524,.214},{.396,.407},{.231,.612},{.219,.610},{.218,.700},{.607,.418},{.441,.319},{.273,.673},{.415,.695},{.666,.410},{.594,.667},{.259,.503},{.691,.198},{.211,.532},{.476,.657},{.358,.556}}},
blackhearthavenarea1={[1]={{.707,.480},{.661,.492},{.711,.620},{.632,.484},{.798,.559},{.572,.519},{.666,.589},{.752,.544}}},
shornhelm={[1]={{.531,.198},{.807,.751},{.239,.527},{.765,.830},{.710,.930},{.671,.989},{.643,.229},{.945,.997},{.999,.927},{.892,.794},{.068,.493},{.899,.821},{.938,.973},{.002,.272},{.667,.995},{.635,.230}},[2]={{.430,.203},{.425,.209},{.352,.501},{.443,.448}}},
rubblebutte={[1]={{.683,.344},{.200,.610},{.211,.674},{.279,.411},{.547,.124},{.361,.122},{.283,.421},{.272,.333},{.664,.885},{.243,.503},{.423,.059},{.219,.671},{.420,.839},{.202,.598},{.347,.130},{.575,.822},{.239,.424},{.669,.465},{.315,.605},{.43,.329},{.286,.414},{.500,.269},{.709,.274},{.343,.677},{.317,.121},{.420,.068},{.271,.322},{.210,.602},{.351,.673},{.688,.355},{.555,.122},{.662,.895},{.243,.433},{.323,.602}}},
cryptofhearts={[1]={{.191,.634},{.766,.616},{.195,.321},{.748,.270},{.701,.574},{.678,.189},{.683,.291},{.547,.177},{.447,.205},{.438,.383},{.546,.271},{.881,.371},{.468,.41},{.461,.793},{.289,.320},{.510,.759},{.717,.343},{.552,.808},{.747,.576},{.514,.144},{.459,.275},{.729,.295},{.646,.430},{.361,.142},{.472,.356}}},
silumm={[1]={{.669,.247},{.150,.355},{.298,.730},{.583,.735},{.297,.802},{.150,.345},{.818,.470},{.654,.568},{.509,.508},{.349,.896},{.814,.383},{.288,.728},{.736,.898},{.433,.211},{.887,.738},{.602,.273},{.673,.240},{.859,.489},{.707,.302},{.216,.349},{.857,.497},{.576,.785},{.456,.444},{.854,.463},{.644,.566},{.717,.302},{.292,.737},{.213,.358},{.852,.505}}},
volenfell_pledge={[1]={{.216,.343},{.649,.351},{.208,.337},{.220,.321},{.663,.348},{.662,.366},{.668,.348},{.228,.327},{.636,.348},{.644,.345},{.656,.344}}},
crosswych={[1]={{.185,.833},{.348,.78},{.43,.842},{.224,.422},{.273,.612},{.269,.621},{.232,.424}},[2]={{.448,.337},{.684,.649},{.320,.382},{.708,.530}}},
volenfell={[1]={{.26,.277},{.912,.575},{.217,.645},{.207,.578},{.667,.409},{.332,.359},{.768,.423},{.262,.285},{.438,.853},{.633,.249},{.631,.365},{.782,.491},{.914,.586},{.763,.264},{.341,.281},{.409,.789},{.291,.494},{.641,.256},{.209,.571},{.782,.483}}},
pariahcatacombs={[1]={{.739,.247},{.840,.759},{.411,.686},{.731,.273},{.711,.751},{.603,.347},{.635,.740},{.564,.482},{.833,.448},{.524,.834},{.607,.156},{.841,.449},{.606,.163},{.716,.758},{.831,.764}}},
viridianwatch={[1]={{.507,.863},{.737,.387},{.503,.849},{.629,.504},{.193,.158},{.464,.612},{.467,.626},{.735,.377},{.624,.492},{.189,.171},{.194,.165},{.189,.305},{.208,.307},{.200,.322},{.275,.491},{.721,.636},{.096,.461},{.913,.508},{.313,.860},{.437,.775},{.636,.500},{.187,.431},{.446,.773},{.407,.590},{.432,.789},{.324,.842},{.405,.674},{.417,.592},{.728,.648},{.631,.485},{.361,.200},{.728,.390},{.202,.302},{.508,.843},{.285,.491},{.505,.52},{.824,.458},{.125,.448},{.189,.179},{.384,.453},{.311,.415},{.476,.623},{.183,.310},{.641,.487},{.466,.635},{.109,.461},{.850,.441},{.517,.536},{.193,.292},{.322,.849},{.286,.484},{.920,.517},{.502,.533},{.857,.450},{.121,.441},{.193,.446},{.108,.442}}},
sandblownmine={[1]={{.357,.589},{.471,.425},{.600,.503},{.286,.477},{.768,.725},{.509,.663},{.694,.862},{.845,.365},{.610,.632},{.918,.690},{.622,.356},{.743,.757},{.600,.710},{.612,.785},{.355,.596},{.538,.482},{.607,.626},{.470,.415},{.603,.521},{.777,.713},{.752,.618},{.188,.277},{.421,.668},{.269,.337},{.607,.507},{.745,.611},{.197,.283},{.606,.716},{.349,.585},{.472,.416}}},
blackhearthavenarea3={[1]={{.523,.642},{.500,.906},{.514,.385},{.583,.571},{.568,.575},{.516,.061},{.530,.403},{.535,.535}}},
northpoint={[1]={{.234,.680},{.528,.065},{.490,.239},{.272,.433},{.747,.154},{.329,.120},{.834,.413},{.421,.402},{.248,.529},{.648,.290},{.519,.400},{.252,.597},{.100,.583},{.852,.795},{.558,.655},{.726,.270},{.222,.879},{.000,.122},{.778,.964},{.217,.100},{.077,.453},{.106,.767},{.774,.958},{.230,.674},{.214,.091},{.098,.763},{.724,.278},{.078,.446},{.336,.125},{.235,.687},{.533,.077},{.248,.522},{.238,.674},{.526,.079},{.850,.802},{.489,.232},{.747,.164},{.328,.131},{.823,.412},{.717,.269},{.093,.579},{.637,.290},{.280,.438},{.64,.286},{.487,.246},{.273,.441},{.250,.607},{.856,.789},{.831,.424},{.843,.795},{.565,.652},{.857,.801},{.336,.134},{.643,.276}},[2]={{.310,.916},{.051,.554},{.747,.953}}},
santaki={[1]={{.369,.182},{.724,.691},{.085,.416},{.203,.515},{.712,.478},{.900,.617},{.238,.375},{.457,.251},{.529,.502},{.203,.507},{.741,.441},{.655,.401},{.432,.233},{.727,.699},{.617,.663},{.265,.268},{.614,.793},{.597,.404},{.092,.424},{.51,.451},{.617,.285},{.820,.626},{.656,.402},{.635,.462},{.511,.442},{.639,.473},{.702,.482},{.628,.291},{.520,.5},{.625,.282}}},
flyleafcatacombs={[1]={{.730,.676},{.520,.857},{.745,.669},{.232,.187},{.221,.185},{.330,.296},{.746,.264},{.326,.307},{.525,.848},{.630,.421},{.322,.287},{.517,.849},{.721,.674},{.321,.193},{.611,.168},{.544,.496},{.579,.309},{.731,.265},{.327,.187},{.541,.503},{.617,.436},{.738,.669},{.585,.317},{.592,.154},{.239,.189},{.726,.663},{.609,.156}}},
strosmkai={[1]={{.560,.773},{.367,.295},{.543,.652},{.610,.785},{.602,.319},{.337,.288},{.777,.346},{.439,.24},{.496,.403},{.891,.235},{.769,.550},{.414,.338},{.809,.472},{.771,.574},{.454,.568},{.382,.860},{.513,.875},{.596,.785},{.347,.674},{.278,.538},{.768,.166},{.461,.633},{.438,.919},{.789,.211},{.515,.767},{.912,.195},{.230,.439},{.276,.652},{.174,.563},{.145,.649},{.278,.364},{.830,.255},{.782,.085},{.713,.217},{.312,.587},{.674,.086},{.798,.160},{.389,.781},{.336,.441},{.743,.260},{.869,.248},{.450,.171},{.309,.375},{.587,.241},{.460,.106},{.466,.330},{.582,.644}},[2]={{.358,.495},{.322,.394},{.421,.401},{.689,.168},{.349,.735},{.444,.913},{.551,.824},{.602,.827},{.599,.759},{.669,.802},{.510,.621},{.082,.613},{.547,.498},{.753,.301}}},
onsisbreathmine={[1]={{.534,.727},{.527,.726},{.127,.651}},[2]={{.411,.667}}},
aldunz={[1]={{.585,.446},{.100,.484},{.415,.490},{.847,.577},{.407,.250},{.389,.678},{.690,.288},{.564,.275},{.581,.454},{.421,.498},{.511,.789},{.204,.754},{.196,.470},{.378,.684},{.419,.691},{.431,.638},{.802,.518},{.107,.483},{.715,.533},{.577,.510},{.223,.552},{.797,.426},{.476,.366},{.534,.301},{.200,.470},{.573,.275},{.102,.477},{.710,.527},{.423,.491},{.468,.369},{.207,.465},{.802,.506},{.572,.455},{.419,.629},{.414,.498},{.431,.630},{.467,.371},{.425,.635},{.585,.511}}},
viridianhideaway={[1]={{.118,.803},{.103,.794},{.111,.813}}},
erokii={[1]={{.745,.627},{.485,.691},{.688,.808},{.137,.534},{.631,.717},{.262,.515},{.286,.859},{.535,.619},{.478,.693},{.121,.278},{.718,.696},{.685,.794},{.738,.630},{.625,.706},{.279,.516},{.471,.680}}},
eboncrypt={[1]={{.491,.067},{.745,.370},{.503,.141},{.742,.392},{.296,.290},{.504,.151},{.529,.907},{.580,.287},{.197,.310},{.409,.756},{.484,.080},{.640,.105},{.486,.142},{.554,.133},{.886,.674},{.768,.441},{.740,.385},{.86,.592},{.598,.737},{.863,.789},{.299,.146},{.300,.152},{.614,.512},{.543,.113},{.209,.159},{.738,.590},{.539,.898},{.620,.743},{.371,.176},{.888,.656},{.409,.745},{.759,.442},{.862,.584},{.86,.805},{.732,.606},{.372,.167}}},
ui_map_scalecaller003={[1]={{.297,.381}}},
bearclawmine={[1]={{.158,.607},{.214,.571},{.049,.529},{.312,.460},{.485,.236},{.246,.335},{.479,.230},{.231,.569},{.491,.245},{.285,.647},{.165,.605},{.311,.468},{.269,.636},{.229,.588},{.242,.639},{.402,.281},{.058,.530},{.392,.270},{.437,.192},{.443,.176},{.469,.243},{.289,.657},{.396,.278}}},
murciensclaim={[1]={{.654,.208},{.231,.359},{.662,.204},{.588,.408},{.223,.188},{.814,.296},{.520,.638},{.340,.092},{.448,.091},{.687,.310},{.520,.307},{.160,.459},{.647,.206},{.776,.445},{.222,.349},{.337,.353},{.515,.234},{.574,.415},{.621,.258},{.771,.452},{.120,.312},{.326,.354},{.218,.202},{.514,.629},{.337,.596},{.303,.661},{.570,.320},{.689,.318},{.291,.362},{.515,.298},{.155,.465},{.282,.354},{.466,.093},{.332,.585},{.338,.100},{.575,.315}}},
ilessantower={[1]={{.205,.790},{.399,.769},{.751,.351},{.404,.717},{.556,.835},{.205,.782},{.390,.716},{.483,.805},{.273,.565},{.693,.340},{.409,.776},{.649,.334},{.735,.241},{.386,.371},{.207,.590},{.645,.481},{.445,.478},{.564,.832},{.837,.419},{.447,.554},{.814,.283},{.814,.493},{.301,.377},{.6,.340},{.753,.341},{.803,.441},{.816,.501},{.454,.476},{.395,.381},{.801,.430},{.396,.713},{.199,.796},{.809,.276},{.446,.568},{.680,.329},{.205,.576},{.648,.487},{.460,.482},{.299,.370},{.695,.330},{.274,.576},{.376,.370},{.562,.840},{.193,.792},{.447,.577}}},
badmanscave={[1]={{.525,.672},{.463,.864},{.453,.624},{.186,.458},{.617,.404},{.587,.784},{.624,.406},{.651,.519},{.261,.642},{.684,.547},{.744,.729},{.558,.895},{.591,.584},{.168,.403},{.454,.486},{.575,.365},{.411,.568},{.268,.672},{.424,.518},{.734,.673},{.549,.602},{.457,.630},{.572,.446},{.585,.389},{.470,.867},{.335,.515},{.489,.613},{.563,.798},{.305,.489},{.517,.673},{.502,.924},{.222,.629},{.292,.486},{.215,.626},{.159,.407},{.568,.367},{.577,.452},{.577,.390}}},
daggerfall={[1]={{.752,.125},{.805,.709},{.492,.720},{.682,.200},{.754,.498},{.714,.398},{.714,.274},{.897,.791},{.551,.128},{.499,.718}},[2]={{.843,.657},{.192,.228},{.198,.171},{.420,.667},{.778,.293}}},
blackhearthavenarea2={[1]={{.399,.700},{.817,.273},{.738,.263},{.782,.239},{.560,.320},{.779,.231},{.520,.372},{.411,.695},{.727,.257},{.737,.296},{.405,.691},{.558,.327},{.740,.289},{.826,.271},{.830,.280},{.730,.264}}},
razakswheel={[1]={{.763,.776},{.316,.506},{.915,.176},{.787,.623},{.897,.268},{.785,.530},{.899,.211},{.877,.509},{.852,.617},{.532,.534},{.63,.301},{.699,.534},{.489,.479},{.259,.464},{.537,.542},{.523,.466},{.869,.509},{.467,.487},{.856,.176},{.523,.645},{.748,.8},{.617,.660},{.616,.776},{.528,.488},{.643,.736},{.548,.711},{.497,.705},{.766,.198},{.712,.259},{.476,.553},{.755,.769},{.806,.353},{.838,.290},{.692,.527},{.897,.219},{.527,.540},{.739,.803},{.623,.785},{.655,.735},{.918,.168},{.629,.309},{.620,.672},{.552,.722},{.78,.526},{.686,.523},{.730,.797},{.267,.463},{.519,.473},{.613,.669},{.620,.769},{.758,.785}}},
koeglinmine={[1]={{.522,.342},{.600,.390},{.596,.377},{.303,.192},{.450,.124},{.693,.344},{.668,.515},{.297,.199},{.759,.422},{.388,.288},{.515,.350},{.784,.530},{.501,.267},{.677,.505},{.305,.201},{.740,.429},{.524,.353},{.783,.538}}},
stonetoothfortress={[1]={{.488,.216},{.343,.252},{.545,.074},{.822,.922},{.044,.451},{.112,.826},{.619,.002},{.619,.070},{.679,.714},{.028,.753},{.076,.403},{.089,.561}},[2]={{.824,.669},{.419,.255}}},
porthunding={[1]={{.112,.464},{.021,.851},{.042,.286},{.858,.630},{.790,.326},{.699,.454},{.766,.814},{.373,.263},{.811,.003},{.714,.125},{.903,.104},{.102,.805},{.327,.071},{.857,.461},{.631,.013},{.771,.871},{.099,.797},{.027,.847},{.788,.315},{.860,.448},{.868,.636},{.767,.806}},[2]={{.527,.453},{.293,.479},{.646,.268},{.560,.200},{.728,.221},{.743,.598},{.231,.694},{.348,.875},{.148,.982}}},
koeglinvillage={[1]={{.144,.054},{.150,.050},{.471,.249},{.455,.644},{.469,.248},{.463,.637}},[2]={{.403,.607},{.538,.614},{.268,.738},{.398,.613},{.136,.105},{.282,.742}}},
cryptoftheexiles={[1]={{.634,.734},{.504,.471},{.558,.282},{.458,.66},{.629,.720},{.431,.397},{.637,.720},{.773,.257},{.815,.324},{.462,.651},{.644,.475},{.702,.766},{.246,.679},{.890,.418},{.693,.767},{.286,.621},{.784,.668},{.437,.405},{.131,.676},{.560,.271},{.902,.631},{.632,.714},{.408,.438},{.503,.388},{.579,.675},{.791,.612},{.499,.462},{.836,.674},{.448,.401},{.57,.677},{.807,.324},{.460,.641},{.416,.442},{.584,.664},{.438,.395}}},
alikr={[1]={{.366,.524},{.505,.411},{.671,.553},{.506,.533},{.572,.326},{.756,.246},{.468,.394},{.489,.305},{.245,.624},{.493,.534},{.747,.239},{.444,.498},{.473,.555},{.766,.271},{.068,.499},{.581,.568},{.456,.354},{.769,.395},{.75,.41},{.313,.705},{.476,.549},{.492,.551},{.490,.608},{.478,.639},{.525,.549},{.578,.6},{.618,.635},{.475,.406},{.509,.402},{.589,.394},{.572,.412},{.562,.402},{.587,.269},{.582,.257},{.677,.630},{.710,.578},{.721,.580},{.725,.590},{.665,.448},{.712,.515},{.765,.576},{.781,.584},{.837,.462},{.871,.568},{.802,.544},{.124,.518},{.549,.318},{.414,.538},{.242,.565},{.246,.658},{.473,.512},{.406,.682},{.681,.6},{.602,.283},{.763,.559},{.835,.556},{.250,.519},{.789,.291},{.680,.610},{.553,.291},{.354,.562},{.317,.571},{.248,.603},{.226,.551},{.281,.603},{.270,.624},{.304,.648},{.221,.680},{.673,.381},{.679,.562},{.612,.609},{.561,.346},{.880,.547},{.842,.498},{.779,.573},{.548,.406},{.592,.360},{.611,.291},{.406,.582},{.595,.632},{.617,.601},{.221,.544},{.263,.567},{.605,.579},{.675,.589},{.306,.689},{.531,.592},{.852,.332},{.499,.507},{.468,.445},{.326,.641},{.334,.644},{.620,.340},{.773,.347},{.439,.689},{.619,.433},{.447,.466},{.313,.550},{.691,.543},{.440,.569},{.540,.340},{.561,.282},{.376,.539},{.127,.472},{.454,.413},{.573,.434},{.626,.490},{.725,.552},{.657,.282},{.832,.581},{.783,.527},{.740,.545},{.712,.532},{.679,.618},{.624,.427},{.621,.407},{.831,.434},{.843,.337},{.832,.354},{.493,.675},{.756,.283},{.367,.585},{.631,.308},{.348,.705},{.275,.346},{.307,.383},{.811,.440},{.535,.553},{.821,.494},{.504,.444},{.326,.689},{.533,.547},{.475,.394},{.360,.419},{.872,.496},{.327,.458},{.757,.412},{.755,.496},{.797,.568}},[2]={{.086,.505},{.263,.535},{.352,.683},{.280,.666},{.260,.667},{.467,.542},{.384,.527},{.686,.593},{.599,.541},{.586,.512},{.573,.273},{.474,.362},{.481,.325},{.531,.400},{.528,.441},{.517,.498},{.769,.401},{.895,.522},{.838,.425},{.787,.336},{.779,.307},{.762,.306},{.780,.266},{.786,.285},{.235,.703},{.377,.608},{.449,.615},{.402,.641},{.399,.687},{.619,.532},{.35,.586},{.442,.475},{.444,.585},{.618,.485},{.634,.592},{.903,.545},{.502,.539},{.868,.516},{.469,.404},{.542,.331},{.837,.457},{.436,.691},{.746,.295},{.766,.315},{.875,.566},{.797,.335},{.795,.362},{.293,.548},{.128,.447},{.118,.469},{.672,.553},{.336,.510},{.351,.401}}},
farangelsdelve={[1]={{.435,.550},{.350,.388},{.134,.520},{.702,.182},{.785,.350},{.438,.688},{.422,.689},{.156,.513},{.251,.531},{.434,.568},{.776,.349},{.270,.538},{.618,.400},{.705,.201},{.422,.551},{.769,.322},{.629,.403},{.470,.324},{.449,.316},{.351,.381},{.370,.389},{.444,.694},{.143,.495},{.786,.330},{.716,.19},{.144,.515},{.616,.386},{.150,.509},{.423,.559},{.715,.200}}},
glenumbra={[1]={{.483,.610},{.568,.220},{.622,.198},{.631,.163},{.725,.336},{.388,.798},{.283,.531},{.401,.296},{.596,.263},{.491,.577},{.608,.174},{.699,.128},{.754,.390},{.593,.636},{.597,.403},{.354,.592},{.506,.268},{.352,.712},{.416,.371},{.423,.295},{.421,.798},{.563,.164},{.658,.134},{.592,.228},{.751,.136},{.700,.478},{.49,.394},{.437,.412},{.261,.547},{.601,.232},{.791,.231},{.811,.223},{.795,.220},{.415,.280},{.785,.362},{.749,.216},{.729,.148},{.455,.387},{.765,.328},{.67,.125},{.325,.558},{.695,.497},{.514,.426},{.746,.262},{.523,.230},{.487,.423},{.516,.682},{.557,.286},{.335,.564},{.297,.539},{.571,.139},{.760,.132},{.560,.227},{.463,.784},{.429,.595},{.523,.247},{.686,.237},{.625,.229},{.548,.231},{.600,.129},{.794,.202},{.781,.191},{.675,.134},{.710,.308},{.560,.234},{.466,.284},{.392,.757},{.391,.553},{.776,.341},{.289,.687},{.829,.297},{.368,.847},{.695,.325},{.242,.547},{.420,.303},{.614,.235},{.382,.566},{.396,.513},{.629,.371},{.775,.254},{.769,.165},{.758,.360},{.613,.278},{.518,.395},{.720,.134},{.434,.349},{.345,.489},{.664,.250},{.355,.729},{.755,.201},{.617,.387},{.276,.863},{.350,.704},{.786,.313},{.727,.533},{.275,.827},{.462,.445},{.437,.453},{.496,.257},{.753,.310},{.404,.723},{.714,.14},{.573,.186},{.596,.137},{.547,.514},{.360,.744},{.331,.688},{.538,.597},{.354,.817},{.339,.842},{.487,.684},{.468,.369},{.540,.431},{.605,.593},{.446,.269},{.271,.679},{.704,.426},{.633,.322},{.503,.736},{.515,.450},{.506,.395},{.475,.401},{.587,.240},{.655,.325},{.532,.250},{.557,.257},{.517,.264},{.558,.623},{.570,.261},{.581,.256},{.563,.422},{.541,.655},{.534,.219},{.741,.414},{.505,.645},{.418,.443},{.450,.531},{.360,.826},{.341,.81},{.428,.523},{.609,.202},{.596,.349},{.491,.532},{.408,.320},{.772,.156},{.239,.629},{.209,.591},{.236,.585},{.516,.534},{.443,.684},{.375,.770},{.495,.452},{.643,.263}},[2]={{.428,.659},{.395,.517},{.541,.463},{.349,.799},{.749,.220},{.605,.203},{.382,.756},{.485,.770},{.360,.599},{.314,.657},{.446,.576},{.241,.6},{.220,.517},{.292,.416},{.449,.417},{.380,.419},{.689,.537},{.494,.565},{.492,.511},{.516,.355},{.423,.333},{.573,.323},{.576,.251},{.754,.265},{.687,.131},{.657,.152},{.588,.468},{.692,.154},{.493,.266},{.527,.295},{.502,.588},{.694,.286},{.199,.584},{.488,.621},{.638,.462},{.658,.403},{.463,.426},{.429,.271},{.315,.366},{.553,.742},{.709,.474},{.852,.287},{.494,.441},{.632,.547},{.786,.231},{.671,.297},{.455,.499},{.805,.341}}},
ui_map_fanglairext={[1]={{.231,.560}}},
trollstoothpick={[1]={{.423,.388},{.581,.431},{.261,.327},{.477,.251},{.579,.423},{.372,.377},{.276,.191},{.483,.866},{.779,.387},{.275,.205},{.344,.664},{.657,.734},{.486,.395},{.338,.654},{.361,.370},{.571,.370},{.285,.506},{.671,.735},{.601,.258},{.364,.381},{.384,.523},{.267,.321},{.465,.211},{.232,.502},{.580,.366},{.327,.553},{.279,.501},{.529,.338},{.405,.256},{.590,.259},{.431,.395},{.585,.417},{.533,.346},{.401,.245},{.595,.265}}},
ui_map_scalecaller002={[1]={{.522,.703}}},
divadschagrinmine={[1]={{.727,.795},{.327,.545},{.806,.404},{.698,.568},{.266,.314},{.507,.875},{.698,.56},{.424,.696},{.189,.498},{.858,.576},{.719,.793},{.750,.696},{.329,.557},{.405,.663},{.460,.633},{.356,.79},{.411,.372},{.301,.709},{.659,.325},{.808,.410},{.450,.300},{.765,.708},{.310,.706},{.747,.538},{.723,.457},{.274,.316},{.329,.67},{.755,.701},{.416,.366},{.746,.546},{.456,.305},{.752,.714},{.391,.659},{.318,.671},{.732,.450},{.753,.543}}},
secret_tunnel={[1]={{.542,.195},{.546,.179},{.544,.203},{.545,.187},{.555,.172}}},
the_guardians_skull={[1]={{.348,.558},{.353,.563}}},
portdunwatch={[1]={{.161,.730},{.133,.820},{.835,.408},{.141,.717},{.278,.744},{.539,.269},{.479,.551},{.548,.260},{.311,.544},{.133,.812},{.825,.413},{.503,.336},{.157,.704},{.364,.825},{.182,.441},{.166,.464},{.281,.753}}},
betnihk={[1]={{.684,.594},{.431,.314},{.338,.534},{.257,.512},{.325,.497},{.146,.489},{.403,.515},{.642,.650},{.605,.853},{.544,.301},{.189,.598},{.499,.670},{.398,.463},{.343,.507},{.625,.359},{.599,.568},{.306,.302},{.568,.642},{.238,.318},{.370,.438},{.541,.311},{.388,.479},{.383,.580},{.349,.252},{.325,.361},{.369,.650},{.326,.624},{.448,.254},{.304,.469},{.421,.748},{.425,.783},{.565,.755},{.649,.637},{.581,.330},{.601,.284},{.412,.604},{.447,.863},{.712,.781},{.726,.642},{.543,.807},{.383,.360},{.217,.702},{.581,.353},{.293,.749},{.388,.833},{.451,.644},{.457,.399},{.557,.353}},[2]={{.167,.304},{.268,.517},{.606,.608},{.628,.828},{.696,.765},{.188,.591},{.259,.623},{.299,.464},{.323,.496},{.302,.542},{.338,.364},{.439,.771},{.622,.742},{.268,.697},{.193,.533},{.412,.283},{.207,.432},{.345,.292},{.514,.414}}},
hallinsstand={[1]={{.738,.638},{.471,.765},{.825,.547},{.474,.202},{.846,.770},{.356,.221},{.428,.764},{.548,.180},{.645,.479},{.469,.911},{.795,.781},{.912,.454},{.339,.087},{.822,.537},{.732,.634}},[2]={{.708,.660},{.618,.483},{.603,.917}}},
minesofkhuras={[1]={{.254,.383},{.362,.284},{.375,.752},{.420,.340},{.368,.356},{.395,.452},{.245,.391},{.330,.133},{.671,.506},{.286,.100},{.242,.678},{.697,.817},{.360,.350},{.127,.392},{.399,.461},{.305,.369},{.376,.757},{.335,.143},{.384,.719},{.319,.393},{.282,.473},{.373,.579},{.714,.616},{.235,.413},{.296,.619},{.700,.809},{.389,.703},{.291,.469},{.412,.336},{.376,.572},{.367,.275},{.252,.677},{.419,.348}}},
bonesnapruinssecret={[1]={{.500,.728},{.543,.643},{.346,.628},{.529,.698},{.543,.643},{.652,.540},{.353,.545},{.519,.322},{.478,.632},{.235,.539},{.615,.872},{.548,.464},{.361,.450},{.328,.501},{.426,.181},{.434,.511},{.397,.477},{.337,.764},{.441,.593},{.568,.737},{.544,.380},{.425,.636},{.731,.840},{.564,.772},{.556,.461},{.635,.420},{.604,.605},{.494,.727},{.297,.472},{.32,.498},{.246,.590},{.495,.383},{.350,.639},{.593,.649},{.431,.178},{.587,.494},{.728,.847},{.66,.542},{.420,.183},{.542,.650},{.524,.329},{.501,.737},{.485,.629},{.438,.504},{.394,.471}}},
alcairecastle={[1]={{.644,.993},{.971,.776},{.721,.198},{.86,.348},{.849,.358},{.854,.352}}},
kozanset={[1]={{.615,.011},{.379,.415},{.482,.304},{.781,.333},{.523,.132},{.458,.127},{.406,.321},{.493,.308},{.396,.330},{.488,.299}},[2]={{.509,.658},{.612,.808},{.586,.689},{.404,.72}}},
blackhearthavenarea4={[1]={{.848,.702},{.828,.677},{.854,.696},{.819,.707},{.840,.666},{.822,.691},{.835,.683}}},
bergama={[1]={{.380,.394},{.213,.703},{.187,.188},{.385,.358},{.425,.474},{.098,.420},{.975,.369}},[2]={{.515,.310}}},
toadstoolhollowlower={[1]={{.589,.347},{.418,.623},{.539,.286},{.308,.342},{.311,.761},{.318,.336},{.241,.626},{.596,.335},{.718,.209},{.468,.309},{.459,.470},{.630,.244},{.295,.519},{.328,.568},{.122,.545},{.315,.701},{.083,.524},{.315,.754},{.711,.215},{.471,.313},{.632,.235},{.290,.511},{.315,.701},{.242,.641},{.245,.633},{.321,.711},{.586,.334},{.601,.343},{.306,.335},{.584,.341},{.116,.533}}},
ilthagsundertower={[1]={{.435,.238},{.430,.224},{.335,.651},{.411,.236},{.422,.225}}},
imperialsewer_daggerfall2={[1]={{.335,.569},{.283,.520},{.304,.574},{.266,.538},{.278,.559},{.324,.553},{.313,.563},{.335,.523}}},
newtcave={[1]={{.234,.309},{.608,.614},{.520,.681},{.513,.684},{.434,.314},{.448,.731},{.637,.717},{.596,.750},{.315,.487},{.131,.308},{.330,.371},{.137,.278},{.530,.615},{.549,.740},{.358,.253},{.615,.617},{.079,.344},{.234,.309},{.564,.744},{.627,.713},{.600,.753},{.140,.316},{.147,.270},{.144,.307},{.617,.716},{.346,.257},{.323,.384},{.443,.314},{.526,.680},{.625,.725},{.528,.624},{.606,.606},{.145,.261},{.522,.693},{.235,.317},{.226,.310},{.594,.759},{.220,.317}}},
imperialsewers_aldmeri3={[1]={{.641,.578},{.645,.566},{.644,.548},{.637,.517},{.664,.550}}},
lothna={[1]={{.307,.448},{.388,.364},{.739,.586},{.466,.214},{.486,.506},{.425,.777},{.310,.458},{.389,.354},{.458,.206},{.494,.500}}},
imperialsewers_ebon2={[1]={{.380,.380},{.451,.353},{.436,.386},{.400,.387},{.412,.388},{.457,.388},{.402,.360},{.437,.418},{.411,.405},{.426,.414},{.383,.369},{.464,.423},{.439,.371},{.468,.409},{.385,.407}}},
wgtvoid1={[1]={{.731,.707},{.330,.787},{.278,.739}}},
nisincave={[1]={{.078,.64},{.232,.517},{.664,.448},{.079,.647},{.595,.607},{.616,.44},{.687,.296},{.231,.748},{.489,.416},{.626,.430},{.670,.436},{.126,.662},{.292,.554},{.169,.552},{.330,.525},{.222,.588},{.185,.554},{.622,.579},{.222,.588},{.140,.680},{.310,.723},{.482,.421},{.134,.688},{.237,.509},{.126,.669},{.312,.721},{.130,.678},{.208,.594},{.211,.585}}},
imperialprisondistrictdun={[1]={{.308,.407},{.300,.404},{.299,.416}}},
craglorn_dragonstar={[1]={{.310,.968},{.511,.176},{.225,.650},{.251,.274},{.745,.897}}},
redrubycave={[1]={{.415,.176},{.803,.324},{.486,.325},{.782,.33},{.858,.280},{.750,.180},{.262,.372},{.362,.283},{.224,.268},{.370,.086},{.491,.114},{.746,.297},{.797,.164},{.847,.186},{.297,.158},{.779,.148},{.858,.280},{.409,.162},{.270,.367},{.358,.290},{.831,.186},{.824,.182},{.364,.090},{.794,.321},{.257,.381},{.781,.319},{.760,.296},{.743,.176},{.487,.344},{.782,.170},{.288,.153},{.749,.191},{.798,.313},{.372,.069},{.251,.367},{.851,.192},{.767,.303},{.786,.164},{.402,.169},{.797,.177},{.789,.334},{.378,.073}}},
belkarth={[1]={{.542,.046},{.781,.112}},[2]={{.682,.830},{.470,.792},{.526,.655},{.518,.166},{.317,.075}}},
imperialprisondunint03={[1]={{.556,.528},{.102,.587},{.131,.851},{.367,.598},{.765,.354},{.561,.534},{.756,.355}}},
vaultsofmadness1={[1]={{.617,.178},{.736,.513},{.586,.174},{.728,.533},{.68,.217},{.453,.208},{.653,.135},{.664,.549},{.696,.310},{.744,.503},{.709,.434},{.645,.536},{.692,.452},{.591,.098},{.470,.152},{.710,.546},{.196,.332},{.257,.233},{.678,.355},{.752,.460},{.799,.417},{.721,.362},{.678,.461}}},
skyreachcatacombs1={[1]={{.686,.521},{.444,.827},{.592,.319},{.677,.519},{.399,.610},{.446,.284}}},
imperialcity={[1]={{.347,.377},{.213,.346},{.632,.355},{.351,.210},{.319,.579},{.261,.554},{.459,.714},{.568,.745},{.646,.671},{.560,.821},{.417,.775},{.614,.817},{.390,.363},{.230,.476},{.615,.390},{.815,.546},{.213,.555},{.601,.655},{.339,.688},{.151,.431},{.642,.314},{.360,.662},{.380,.264},{.854,.435},{.811,.584},{.720,.519},{.666,.556},{.282,.701},{.694,.567},{.414,.705},{.552,.176},{.711,.275},{.262,.728},{.658,.454},{.572,.665},{.765,.558},{.782,.368},{.391,.801},{.630,.258},{.617,.200},{.662,.478},{.796,.637},{.684,.759},{.138,.534},{.676,.730},{.72,.331},{.357,.246},{.344,.321},{.647,.184},{.177,.555},{.845,.404},{.339,.181},{.220,.267},{.439,.809},{.74,.58},{.766,.339},{.711,.417},{.687,.349},{.281,.261},{.145,.594},{.212,.383},{.165,.354},{.770,.281},{.611,.778},{.529,.311},{.390,.302},{.542,.145},{.613,.281},{.178,.386},{.385,.826},{.417,.323},{.329,.754},{.792,.517},{.598,.309},{.234,.293},{.659,.629},{.461,.334},{.505,.319},{.446,.150},{.635,.711},{.264,.335},{.517,.158},{.569,.328},{.324,.483},{.570,.284},{.534,.341},{.587,.153},{.297,.325},{.483,.165},{.330,.535},{.410,.277},{.194,.588},{.271,.519},{.180,.450},{.583,.699},{.820,.668},{.304,.353},{.766,.415},{.679,.803},{.727,.235},{.429,.746},{.483,.771}}},
trl_so_map03={[1]={{.467,.419},{.255,.114},{.268,.847},{.482,.428},{.291,.111},{.525,.632},{.620,.417},{.260,.888},{.595,.454},{.310,.932},{.208,.729},{.303,.585},{.373,.639},{.506,.382},{.340,.520},{.226,.587},{.290,.676},{.417,.466},{.528,.651},{.149,.431}}},
cryptoftarishzizone={[1]={{.127,.623},{.248,.597},{.431,.434},{.186,.518},{.755,.242},{.798,.527},{.243,.592},{.602,.341}}},
howlingsepulcherscave={[1]={{.322,.297},{.330,.296},{.322,.308},{.330,.312}}},
skyreachhold2={[1]={{.405,.145},{.797,.584},{.790,.583}}},
wgtlibraryhall={[1]={{.162,.531},{.777,.769},{.202,.736},{.835,.495},{.516,.224}}},
aetherianarchiveislandc={[1]={{.294,.822},{.583,.395},{.577,.402},{.303,.824},{.298,.817},{.587,.403},{.583,.516},{.656,.191},{.494,.441},{.548,.219},{.248,.887},{.570,.437},{.641,.143},{.509,.108},{.612,.421},{.238,.848},{.794,.240},{.78,.351},{.555,.216},{.643,.151}}},
wgtimperialthroneroom={[1]={{.400,.818},{.403,.245},{.675,.553},{.250,.363},{.251,.705}}},
molavar={[1]={{.713,.614},{.721,.623},{.644,.575},{.229,.630},{.857,.696},{.236,.638},{.495,.617},{.367,.391},{.636,.578},{.714,.621},{.483,.616}}},
imperialsewer_daggerfall3={[1]={{.411,.568},{.419,.578},{.384,.569},{.400,.543},{.399,.558}}},
capstonecave={[1]={{.482,.214},{.290,.566},{.591,.167},{.456,.621},{.507,.397},{.492,.220},{.312,.671},{.438,.671},{.546,.127},{.672,.168},{.349,.568},{.636,.120},{.739,.138},{.551,.238},{.346,.626},{.498,.387},{.477,.214},{.586,.172},{.631,.114},{.736,.122},{.601,.168},{.466,.618},{.503,.41},{.743,.130},{.552,.117},{.543,.244},{.494,.399},{.342,.647},{.671,.179}}},
kardala={[1]={{.455,.518}}},
skyreachcatacombs3={[1]={{.677,.765}}},
balamathlibrary={[1]={{.894,.684},{.887,.690}}},
imperialprisondunint02={[1]={{.537,.755},{.682,.56},{.537,.758},{.536,.762}}},
bleakrockvillage={[1]={{.438,.998},{.278,.688},{.937,.546},{.881,.525},{.345,.512},{.087,.689},{.091,.680},{.934,.556},{.268,.696},{.335,.513},{.883,.536},{.276,.694}},[2]={{.146,.036},{.392,.597},{.161,.565},{.184,.474},{.148,.029},{.625,.912},{.162,.559}}},
helracitadelhallofwarrior={[1]={{.759,.464},{.912,.547},{.125,.508},{.108,.435},{.915,.554},{.126,.512},{.103,.439},{.216,.573},{.160,.378},{.211,.566}}},
imperialsewer_daggerfall1={[1]={{.200,.629},{.226,.639},{.142,.632},{.211,.610},{.137,.619},{.096,.586},{.226,.671},{.106,.594},{.186,.596},{.162,.656},{.142,.605},{.140,.586},{.190,.657},{.17,.606},{.111,.624}}},
ui_map_falkreathsdemise_b={[1]={{.384,.248}}},
wailingmaw={[1]={{.611,.719},{.678,.329},{.579,.341},{.703,.580},{.682,.858},{.595,.320},{.825,.787},{.204,.648},{.617,.730},{.275,.601},{.502,.378},{.346,.310},{.494,.441},{.441,.731},{.698,.432},{.462,.354},{.579,.537},{.420,.583},{.477,.874},{.634,.376},{.717,.920},{.829,.776},{.571,.532},{.270,.598},{.481,.442},{.706,.426},{.438,.721},{.481,.882},{.718,.928},{.597,.312},{.268,.608},{.605,.310}}},
hollowcity={[1]={{.177,.903},{.097,.714},{.294,.173},{.119,.896},{.112,.896}},[2]={{.775,.816},{.703,.256},{.789,.692},{.432,.868},{.789,.683}}},
helracitadel={[1]={{.625,.761},{.411,.737},{.409,.731},{.453,.646},{.422,.724},{.53,.591},{.535,.611},{.466,.614},{.564,.678},{.494,.543},{.562,.733},{.520,.526},{.454,.766},{.495,.668},{.508,.749},{.527,.627}}},
wgtimperialguardquarters={[1]={{.803,.754},{.726,.300},{.810,.535}}},
wgtpinnacle={[1]={{.311,.388}}},
bloodmaynecave={[1]={{.265,.540},{.457,.425},{.510,.675},{.342,.490},{.398,.602},{.504,.680},{.173,.365},{.405,.451},{.108,.371},{.481,.390},{.400,.593},{.571,.435},{.468,.411},{.452,.426},{.114,.454},{.264,.538},{.23,.429},{.168,.558},{.110,.553},{.109,.449},{.457,.416},{.119,.434},{.093,.557},{.099,.543},{.164,.544},{.514,.669},{.218,.405},{.411,.456},{.474,.386},{.332,.494},{.103,.550},{.238,.430},{.124,.441},{.157,.560},{.411,.442},{.096,.372},{.112,.441}}},
crgwamasucave={[1]={{.650,.658},{.632,.662}}},
imperialsewer_ebonheart3={[1]={{.427,.455},{.419,.447},{.410,.499},{.404,.483}}},
vaultofhamanforgefire={[1]={{.178,.568},{.304,.569},{.310,.200},{.465,.097},{.736,.196},{.393,.533},{.284,.540},{.587,.568},{.360,.758},{.545,.288},{.72,.256},{.750,.493},{.187,.563},{.314,.578},{.488,.349},{.684,.680},{.801,.712},{.578,.445},{.266,.349},{.770,.579},{.317,.204},{.512,.208},{.409,.519},{.287,.533},{.596,.556},{.745,.487},{.666,.682},{.796,.719},{.777,.578},{.476,.104},{.6,.558},{.526,.287},{.184,.578},{.497,.347},{.682,.689},{.793,.710},{.317,.211},{.692,.683},{.573,.451},{.538,.281},{.400,.530},{.472,.097},{.729,.184},{.672,.686},{.744,.497}}},
villageofthelost={[1]={{.295,.591},{.817,.353},{.728,.345},{.222,.662},{.485,.319},{.849,.427},{.851,.358},{.403,.451},{.211,.685},{.402,.653},{.774,.339},{.488,.461},{.355,.684},{.721,.363},{.837,.321},{.806,.322},{.847,.345},{.464,.616},{.363,.504},{.485,.434},{.220,.579},{.79,.570},{.325,.275},{.449,.423},{.808,.354}}},
skyreachhold3={[1]={{.645,.845},{.627,.592},{.909,.499},{.653,.845}}},
underpallcave={[1]={{.433,.242},{.569,.370},{.153,.598},{.282,.125},{.714,.478},{.575,.373},{.777,.520},{.296,.118},{.791,.505},{.411,.251},{.368,.495},{.286,.109},{.779,.385},{.157,.590},{.583,.499},{.777,.339},{.433,.380},{.725,.489},{.734,.109},{.399,.614},{.365,.484},{.570,.516},{.721,.495},{.723,.098},{.397,.627},{.156,.604},{.427,.250},{.374,.500},{.577,.504},{.432,.389},{.740,.468},{.148,.604}}},
toadstoolhollow={[1]={{.215,.533}}},
rkundzelft={[1]={{.172,.63},{.721,.341},{.821,.591},{.164,.629},{.566,.714},{.266,.470},{.708,.351},{.810,.839},{.621,.246},{.365,.388},{.823,.591},{.418,.251},{.167,.622},{.429,.256},{.718,.352},{.615,.499},{.357,.383},{.178,.623},{.569,.704},{.814,.584}}},
imperialprisondunint04={[1]={{.581,.890}}},
wgtregentsquarters={[1]={{.678,.799},{.342,.601}}},
imperialprisondunint01={[1]={{.236,.665},{.431,.856},{.212,.183},{.205,.433},{.229,.670},{.057,.589},{.198,.425},{.229,.670},{.213,.176},{.24,.673},{.198,.432},{.238,.666}}},
skyreachhold1={[1]={{.585,.883},{.587,.887}}},
quickwatercave={[1]={{.492,.529},{.508,.931},{.562,.546},{.550,.552},{.425,.631},{.601,.825},{.329,.438},{.559,.864},{.428,.795},{.485,.585},{.508,.923},{.437,.851},{.525,.827},{.462,.625},{.563,.550},{.570,.766},{.337,.546},{.483,.533},{.482,.479},{.415,.622},{.579,.773},{.422,.791},{.543,.875},{.484,.470},{.445,.620},{.477,.527},{.498,.480},{.549,.871},{.488,.575},{.49,.474},{.409,.619},{.521,.818},{.470,.623}}},
haddock={[1]={{.563,.732},{.288,.469},{.407,.622},{.501,.798},{.719,.197},{.771,.604},{.605,.166},{.346,.374},{.508,.202},{.346,.387},{.616,.163},{.558,.724},{.730,.193}}},
fearfang={[1]={{.573,.341},{.184,.351},{.809,.597},{.864,.304},{.151,.645},{.575,.334},{.178,.355},{.801,.596},{.871,.304}}},
exarchsstronghold={[1]={{.359,.675},{.402,.236},{.538,.196},{.589,.581},{.589,.581},{.529,.193},{.594,.574}}},
mtharnaz={[1]={{.510,.375},{.506,.383},{.173,.663},{.860,.663},{.376,.518},{.860,.651},{.866,.655},{.163,.667}}},
imperialsewer_dagfall3b={[1]={{.419,.579}}},
ilthagsundertower02={[1]={{.45,.373},{.445,.355},{.495,.165},{.461,.437},{.429,.911},{.677,.605},{.402,.561},{.425,.905},{.452,.365},{.488,.159},{.464,.446},{.469,.455},{.689,.590},{.400,.554},{.462,.368},{.696,.594},{.395,.545},{.498,.156},{.442,.364}}},
serpentsnest={[1]={{.407,.331},{.820,.653},{.412,.325},{.290,.257},{.439,.170},{.516,.508},{.812,.652},{.695,.534},{.695,.524},{.434,.169}}},
coldharbour={[1]={{.634,.667},{.480,.436},{.621,.384},{.551,.727},{.691,.842},{.710,.759},{.644,.648},{.629,.601},{.223,.583},{.315,.707},{.226,.630},{.614,.590},{.396,.838},{.430,.465},{.455,.406},{.436,.405},{.596,.731},{.274,.812},{.417,.807},{.334,.652},{.707,.684},{.571,.464},{.639,.627},{.706,.645},{.603,.700},{.577,.652},{.565,.660},{.198,.623},{.623,.683},{.585,.566},{.493,.446},{.654,.548},{.571,.51},{.613,.755},{.223,.657},{.310,.571},{.469,.642},{.555,.699},{.634,.406},{.569,.577},{.395,.725},{.551,.409},{.625,.440},{.505,.433},{.391,.538},{.367,.573},{.406,.676},{.312,.633},{.260,.682},{.670,.799},{.441,.746},{.390,.826},{.375,.662},{.294,.843},{.293,.787},{.280,.725},{.316,.589},{.556,.673},{.604,.595},{.428,.501},{.439,.517},{.478,.419},{.475,.406},{.468,.409},{.427,.446},{.525,.496},{.642,.383},{.635,.466},{.313,.780},{.424,.774},{.540,.494},{.474,.510},{.471,.474},{.359,.726},{.295,.801},{.331,.550},{.514,.474},{.443,.557},{.627,.714},{.231,.696},{.261,.711},{.708,.536},{.452,.45},{.587,.390},{.245,.579},{.296,.859},{.676,.482},{.323,.521},{.674,.656},{.312,.858},{.571,.563},{.708,.696},{.348,.763},{.332,.702},{.526,.528},{.559,.574},{.263,.581},{.399,.767},{.622,.425},{.609,.603},{.428,.633},{.693,.683},{.705,.665},{.563,.425},{.654,.367},{.598,.666},{.581,.637},{.573,.682},{.675,.708},{.627,.463},{.452,.422},{.540,.459},{.547,.713},{.630,.541},{.756,.778},{.586,.42},{.519,.436},{.557,.439},{.305,.547},{.539,.441},{.409,.565},{.441,.544},{.558,.741},{.662,.572},{.461,.437},{.445,.481},{.473,.462},{.556,.480},{.576,.497},{.579,.551},{.462,.424},{.601,.530},{.587,.537},{.620,.562},{.540,.521},{.422,.438},{.488,.463},{.614,.447},{.600,.623},{.676,.572},{.516,.525},{.561,.653}},[2]={{.609,.774},{.574,.758},{.563,.493},{.68,.726},{.670,.572},{.560,.396},{.435,.418},{.425,.422},{.402,.748},{.454,.510},{.427,.511},{.592,.407},{.477,.528},{.580,.412},{.505,.756},{.581,.769},{.641,.672},{.277,.611},{.485,.507},{.762,.831},{.432,.654},{.330,.661},{.675,.783},{.286,.609},{.309,.530},{.393,.615},{.617,.435},{.637,.448},{.540,.494},{.738,.696},{.637,.643},{.610,.597},{.515,.393},{.635,.628},{.710,.760},{.307,.789},{.316,.826},{.313,.843},{.276,.718},{.432,.694},{.517,.588},{.293,.722},{.699,.797},{.526,.717},{.510,.557},{.312,.709},{.382,.707},{.260,.695},{.214,.612},{.525,.490},{.474,.597},{.564,.571},{.369,.710},{.518,.409},{.433,.469},{.392,.827}}},
imperialsewers_ebon1={[1]={{.482,.332},{.479,.282},{.450,.286},{.439,.289},{.495,.310},{.450,.298},{.487,.266},{.459,.244}}},
["aba-loria"]={[1]={{.339,.543},{.149,.472},{.602,.205},{.248,.588},{.438,.297},{.880,.542},{.445,.302},{.782,.630},{.674,.720},{.785,.637},{.160,.471},{.495,.447},{.096,.305},{.125,.398},{.780,.586},{.237,.755},{.256,.579},{.234,.835},{.674,.558},{.419,.865},{.682,.557},{.601,.213},{.348,.226},{.775,.642},{.162,.461},{.346,.545},{.592,.387},{.118,.396},{.232,.760},{.888,.544},{.397,.160},{.346,.550},{.102,.314},{.400,.153},{.749,.568},{.888,.537},{.478,.446},{.104,.300},{.775,.576},{.438,.313},{.757,.573}}},
craglorn={[1]={{.439,.457},{.457,.457},{.621,.449},{.444,.326},{.416,.313},{.236,.378},{.304,.39},{.401,.415},{.357,.446},{.385,.467},{.508,.331},{.471,.323},{.525,.263},{.569,.269},{.583,.290},{.587,.374},{.704,.416},{.617,.389},{.717,.470},{.711,.481},{.661,.483},{.701,.533},{.747,.450},{.734,.518},{.744,.532},{.764,.486},{.793,.502},{.81,.512},{.786,.491},{.833,.600},{.768,.551},{.802,.529},{.690,.435},{.706,.558},{.704,.579},{.728,.586},{.810,.596},{.667,.566},{.678,.688},{.680,.660},{.715,.656},{.761,.732},{.870,.629},{.719,.637},{.639,.601},{.518,.593},{.511,.582},{.467,.480},{.431,.498},{.408,.488},{.503,.531},{.564,.492},{.532,.434},{.563,.472},{.528,.511},{.556,.447},{.490,.483},{.363,.564},{.451,.603},{.448,.639},{.388,.722},{.367,.711},{.362,.705},{.390,.671},{.389,.647},{.353,.585},{.262,.639},{.231,.592},{.285,.615},{.223,.561},{.249,.553},{.326,.620},{.180,.369},{.222,.524},{.142,.426},{.237,.493},{.225,.474},{.191,.460},{.431,.608},{.307,.508},{.333,.479},{.299,.534},{.102,.362},{.063,.316},{.082,.329},{.692,.601},{.373,.414},{.645,.614},{.221,.382},{.271,.421},{.712,.425},{.754,.600},{.552,.540},{.194,.330},{.412,.348},{.393,.464},{.431,.443},{.300,.427},{.783,.612},{.336,.471},{.285,.437},{.196,.222},{.238,.300},{.565,.625},{.399,.526},{.445,.669},{.381,.700},{.756,.515},{.289,.359},{.589,.444},{.152,.337},{.176,.550},{.434,.329},{.296,.464},{.820,.610},{.262,.472},{.322,.427},{.359,.645},{.289,.448},{.323,.547},{.527,.492},{.560,.579},{.500,.473},{.136,.446},{.234,.407},{.154,.505},{.607,.404},{.657,.345},{.081,.351},{.356,.568},{.485,.634},{.387,.311},{.663,.606},{.472,.542},{.391,.445},{.535,.257},{.365,.509},{.39,.397},{.577,.356},{.547,.288},{.177,.487},{.577,.308},{.461,.383},{.449,.438},{.090,.389},{.599,.635},{.537,.250},{.282,.429},{.896,.608},{.387,.206},{.896,.619},{.403,.173},{.452,.416},{.394,.172},{.904,.607},{.302,.439},{.891,.629},{.580,.420},{.397,.206},{.396,.182},{.460,.406},{.410,.172},{.407,.180},{.399,.19},{.436,.398},{.474,.376},{.581,.411},{.144,.306}},[2]={{.339,.481},{.736,.658},{.623,.434},{.377,.463},{.271,.309},{.536,.312},{.684,.386},{.576,.371},{.718,.434},{.742,.621},{.897,.660},{.730,.619},{.442,.460},{.337,.503},{.384,.705},{.150,.391},{.340,.493},{.283,.492},{.664,.671},{.114,.334},{.294,.428},{.315,.416},{.206,.573},{.068,.336},{.450,.652},{.25,.317},{.283,.270},{.186,.469},{.640,.636},{.759,.484},{.677,.665},{.737,.500},{.533,.629},{.645,.614},{.423,.460},{.208,.514},{.340,.560},{.615,.458},{.197,.403},{.741,.459},{.705,.611},{.400,.432},{.312,.370},{.382,.271},{.388,.285},{.498,.314},{.273,.580},{.860,.704},{.322,.615},{.577,.468},{.514,.371},{.339,.425},{.654,.618},{.794,.698},{.666,.458},{.563,.711}}},
imperialsewers_aldmeri2={[1]={{.734,.601},{.737,.520},{.754,.557},{.731,.587},{.745,.537},{.748,.578},{.706,.539},{.717,.560},{.775,.588},{.733,.505},{.731,.558},{.763,.561},{.705,.514},{.780,.570},{.738,.555},{.757,.593}}},
skyreachcatacombs2={[1]={{.314,.772}}},
malsorrastomb={[1]={{.398,.489},{.546,.672},{.384,.730},{.468,.4},{.751,.388},{.693,.691},{.532,.548},{.434,.350},{.361,.423},{.511,.764},{.799,.360},{.211,.405},{.254,.641},{.659,.612},{.153,.361},{.666,.489},{.839,.448},{.696,.307},{.345,.509},{.744,.390},{.388,.488},{.247,.630},{.248,.646},{.457,.382},{.740,.397},{.162,.357},{.696,.307},{.352,.509},{.386,.496},{.240,.634},{.499,.755},{.748,.397},{.351,.517},{.695,.316}}},
lipsandtarn={[1]={{.369,.086},{.601,.522},{.375,.401},{.519,.155},{.671,.259},{.661,.613},{.169,.503},{.637,.736},{.594,.515},{.374,.097},{.523,.663},{.749,.294},{.518,.498},{.665,.390},{.530,.095},{.176,.68},{.387,.656},{.509,.156},{.661,.612},{.736,.286},{.598,.525},{.657,.389},{.375,.090},{.517,.096},{.387,.656},{.528,.158},{.742,.280},{.732,.294},{.168,.674},{.741,.298},{.664,.383},{.664,.268},{.531,.662},{.522,.088}}},
trl_so_map02={[1]={{.385,.527},{.544,.508},{.499,.275},{.270,.537},{.293,.506},{.453,.533}}},
chiselshriek={[1]={{.505,.564},{.887,.794},{.531,.87},{.364,.403},{.883,.714},{.880,.707},{.878,.801},{.354,.409},{.239,.417},{.524,.880},{.534,.884},{.247,.415}}},
imperialsewers_aldmeri1={[1]={{.849,.643},{.897,.655},{.869,.627},{.866,.647},{.871,.657},{.826,.655},{.834,.618},{.898,.624}}},
aetherianarchiveislanda={[1]={{.618,.833},{.609,.901},{.626,.422},{.600,.900},{.622,.417},{.631,.414},{.730,.898},{.717,.886},{.413,.438},{.602,.495},{.613,.839},{.525,.318},{.701,.579},{.66,.419},{.600,.829},{.590,.827}}},
rkhardahrk_0={[1]={{.229,.592},{.232,.599},{.545,.251},{.512,.643},{.373,.459}}},
wailingprison4={[1]={{.524,.890}}},
skyreachhold4={[1]={{.263,.760},{.556,.147},{.409,.586},{.266,.753},{.330,.218},{.390,.279}}},
breakneckcave={[1]={{.653,.226},{.700,.640},{.467,.172},{.558,.655},{.659,.236},{.668,.232},{.678,.302},{.445,.227},{.456,.234},{.473,.217},{.472,.177},{.651,.236},{.285,.214},{.486,.248},{.288,.277},{.657,.227},{.676,.317},{.510,.313},{.271,.624},{.597,.262},{.460,.172},{.261,.292},{.407,.164},{.590,.275},{.271,.304},{.476,.204},{.694,.636},{.562,.648},{.293,.210},{.483,.214},{.261,.299},{.295,.272},{.502,.311},{.695,.645},{.587,.267}}},
kingscrest={[1]={{.857,.522},{.582,.508},{.867,.485},{.578,.476},{.613,.205},{.603,.181},{.587,.499},{.777,.251},{.755,.753},{.872,.466},{.715,.421},{.755,.763},{.772,.769},{.777,.596},{.628,.190},{.623,.738},{.309,.474},{.850,.524},{.699,.409},{.773,.604},{.554,.276},{.563,.484},{.759,.747},{.366,.445},{.456,.278},{.674,.503},{.746,.271},{.543,.750},{.302,.472},{.765,.268},{.833,.521},{.627,.732},{.573,.276},{.765,.744},{.771,.259},{.855,.477},{.638,.515},{.533,.742},{.617,.764},{.579,.263},{.569,.478},{.374,.442},{.862,.481},{.855,.477},{.782,.748},{.549,.746},{.452,.270},{.659,.726},{.781,.768},{.575,.254},{.436,.256},{.630,.177},{.707,.422},{.448,.281},{.380,.438},{.571,.510},{.854,.484},{.615,.748},{.840,.519}}},
aetherianarchiveislandb={[1]={{.238,.400},{.24,.419},{.240,.409},{.238,.399},{.242,.407},{.091,.195},{.620,.335},{.221,.399},{.226,.421},{.616,.341},{.399,.835},{.104,.190},{.606,.332},{.406,.830},{.230,.396}}},
serpenthollowcave={[1]={{.511,.448},{.346,.526},{.258,.535},{.177,.493},{.163,.543},{.301,.512},{.407,.457},{.667,.328},{.554,.297},{.212,.462},{.290,.658},{.404,.273},{.332,.598},{.246,.537},{.165,.489},{.466,.596},{.150,.539},{.218,.458},{.554,.321},{.321,.595},{.294,.672},{.510,.440},{.311,.511},{.171,.474},{.302,.521},{.549,.287},{.467,.595},{.561,.331},{.520,.433},{.141,.531},{.416,.451},{.176,.482},{.405,.258},{.266,.522},{.476,.599},{.341,.508},{.329,.583}}},
wgtbattlemage={[1]={{.227,.291},{.655,.801},{.336,.291}}},
crackedwoodcave={[1]={{.717,.364},{.524,.162},{.682,.236},{.222,.372},{.789,.428},{.537,.527},{.432,.284},{.389,.209},{.625,.262},{.694,.468},{.279,.369},{.409,.114},{.344,.310},{.661,.368},{.759,.253},{.734,.359},{.791,.424},{.435,.275},{.623,.269},{.534,.512},{.414,.106},{.341,.322},{.381,.223},{.700,.460},{.274,.375},{.381,.209},{.699,.453},{.667,.362},{.752,.250},{.691,.247},{.279,.370},{.540,.520},{.347,.318},{.384,.216},{.769,.252},{.230,.370}}},
burriedsands={[1]={{.528,.355},{.459,.422},{.564,.363},{.344,.298},{.299,.469},{.535,.352},{.886,.308},{.805,.563},{.603,.655}}},
vaultsofmadness2={[1]={{.832,.817},{.713,.821},{.791,.833},{.702,.582},{.844,.812},{.793,.796}}},
potholecavern={[1]={{.717,.614},{.598,.451},{.711,.622},{.414,.412},{.406,.416},{.710,.389},{.770,.545},{.494,.223},{.651,.163},{.807,.219},{.365,.588},{.589,.698},{.718,.607},{.747,.426},{.601,.450},{.777,.532},{.715,.394},{.593,.466},{.689,.393},{.504,.209},{.528,.122},{.812,.21},{.580,.479},{.672,.508},{.637,.159},{.523,.128},{.357,.587},{.491,.228},{.641,.154},{.718,.619},{.582,.700},{.740,.432},{.756,.436},{.682,.513},{.595,.482},{.574,.701},{.712,.380},{.587,.470},{.608,.445},{.680,.393}}},
haynotecave={[1]={{.615,.089},{.592,.451},{.506,.171},{.644,.510},{.647,.525},{.556,.182},{.625,.083},{.465,.405},{.464,.183},{.533,.249},{.456,.409},{.567,.241},{.545,.193},{.700,.232},{.224,.504},{.593,.444},{.524,.253},{.217,.505},{.542,.180},{.694,.227}}},
balamath={[1]={{.120,.559},{.128,.560},{.415,.785},{.526,.588},{.609,.763},{.391,.188},{.247,.621},{.341,.329},{.647,.406},{.734,.783},{.338,.743},{.212,.253},{.265,.445},{.120,.551},{.390,.195},{.916,.570},{.648,.414},{.419,.794}}},
wgtvoid2={[1]={{.451,.706}}},
hircineshaunt={[1]={{.570,.411},{.428,.367},{.473,.596},{.600,.452},{.702,.408},{.396,.136},{.314,.785},{.421,.367},{.470,.131},{.757,.483},{.190,.659},{.319,.791},{.425,.226},{.401,.805}}},
caveoftrophies={[1]={{.552,.385},{.176,.394},{.474,.643},{.154,.432},{.610,.292},{.344,.173},{.180,.385},{.442,.785},{.268,.200},{.638,.523},{.471,.379},{.278,.207},{.600,.886},{.453,.891},{.358,.295},{.561,.381},{.356,.418},{.347,.180},{.528,.272},{.526,.871},{.822,.518},{.444,.793},{.567,.566},{.698,.263},{.482,.651},{.67,.39},{.267,.210},{.594,.882},{.355,.283},{.517,.875},{.449,.782},{.553,.561},{.359,.426},{.461,.894},{.180,.378},{.705,.259},{.560,.566},{.527,.265},{.616,.289}}},
depravedgrotto={[1]={{.625,.502},{.787,.593},{.254,.483},{.765,.556},{.615,.503},{.661,.206},{.414,.117},{.552,.919},{.724,.370},{.561,.735},{.779,.586},{.555,.472},{.273,.838},{.257,.254},{.167,.412},{.428,.557},{.749,.827},{.405,.112},{.555,.932},{.724,.370},{.570,.733},{.263,.480},{.400,.229},{.531,.360},{.440,.500},{.426,.590},{.664,.196},{.397,.112},{.280,.842},{.393,.235},{.164,.405},{.748,.81},{.548,.925},{.741,.817},{.783,.592},{.415,.124},{.619,.497}}},
ava_whole_0={[1]={{.449,.525},{.409,.469},{.340,.636},{.197,.212},{.830,.388},{.270,.135},{.250,.299},{.571,.441},{.677,.187},{.596,.678},{.259,.662},{.219,.500},{.823,.225},{.476,.706},{.599,.123},{.274,.700},{.671,.468},{.266,.229},{.422,.221},{.199,.358},{.353,.701},{.549,.752},{.852,.445},{.809,.544},{.658,.254},{.308,.194},{.282,.399},{.351,.795},{.663,.563},{.147,.279},{.325,.247},{.715,.668},{.321,.524},{.464,.611},{.280,.433},{.538,.641},{.549,.701},{.515,.825},{.730,.240},{.216,.314},{.379,.366},{.648,.773},{.774,.468},{.367,.549},{.458,.799},{.412,.657},{.454,.107},{.604,.309},{.528,.238},{.500,.312},{.169,.232},{.204,.258},{.114,.366},{.752,.296},{.323,.337},{.614,.563},{.683,.665},{.351,.105},{.748,.575},{.383,.169},{.662,.534},{.536,.617},{.742,.435},{.422,.327},{.656,.336},{.552,.308},{.591,.388},{.553,.149},{.637,.310},{.709,.409},{.313,.738},{.742,.512},{.45,.210},{.363,.654},{.749,.604},{.742,.365},{.198,.416},{.256,.602},{.810,.250},{.497,.209},{.758,.357},{.504,.205}}},
muckvalleycavern={[1]={{.698,.213},{.134,.783},{.708,.383},{.411,.714},{.7,.198},{.232,.764},{.849,.286},{.224,.761},{.387,.784},{.123,.767},{.629,.370},{.415,.696},{.353,.440},{.516,.611},{.401,.699},{.164,.656},{.717,.368},{.378,.831},{.350,.717},{.365,.641},{.327,.452},{.378,.831},{.135,.761},{.358,.724},{.398,.782},{.510,.614},{.703,.206},{.364,.657},{.220,.768},{.384,.798},{.620,.361},{.359,.710},{.422,.700},{.691,.209},{.378,.847},{.164,.656},{.706,.366},{.623,.379},{.328,.436},{.408,.692},{.857,.292},{.169,.648},{.342,.720}}},
aetherianarchiveend={[1]={{.347,.720},{.360,.729},{.37,.747},{.356,.752},{.324,.717},{.334,.720},{.354,.723},{.315,.753},{.347,.730},{.350,.743},{.357,.740},{.325,.752},{.333,.730},{.322,.729},{.337,.744},{.311,.737},{.345,.758},{.367,.738},{.365,.758},{.313,.721},{.354,.784},{.324,.737},{.301,.737},{.324,.790},{.342,.738},{.313,.729},{.298,.750},{.305,.727},{.360,.767},{.331,.766},{.347,.750},{.305,.778},{.311,.744},{.341,.778}}},
howlingsepulchersoverland={[1]={{.527,.203},{.517,.202},{.422,.579},{.467,.271},{.583,.202},{.390,.388},{.380,.738},{.523,.550},{.144,.393},{.527,.557}}},
imperialsewer_ebonheart3b={[1]={{.431,.481},{.446,.473},{.404,.483}}},
thaliasretreat={[1]={{.466,.802},{.452,.597},{.464,.793},{.218,.232},{.547,.185},{.567,.724},{.455,.584}}},
echocave={[1]={{.394,.081},{.452,.296},{.250,.169},{.507,.284},{.541,.233},{.454,.694},{.603,.737},{.734,.658},{.455,.246},{.688,.489},{.386,.084},{.629,.662},{.340,.249},{.437,.426},{.467,.087},{.636,.631},{.623,.654},{.506,.303},{.687,.490},{.649,.639},{.443,.307},{.340,.233},{.422,.422},{.633,.652},{.652,.624},{.390,.067},{.747,.664},{.509,.292},{.331,.240},{.329,.248},{.728,.657},{.239,.168},{.447,.686},{.691,.497},{.392,.090},{.647,.632},{.456,.091}}},
vahtacen={[1]={{.063,.518},{.637,.333},{.114,.802},{.051,.772},{.653,.181},{.213,.505},{.611,.247},{.639,.180},{.250,.720},{.61,.255},{.513,.544},{.242,.599},{.053,.783},{.655,.654},{.182,.793},{.213,.513},{.243,.714},{.649,.186},{.657,.338},{.234,.726},{.127,.515},{.114,.802},{.111,.507},{.067,.634},{.615,.261},{.070,.512},{.808,.183},{.12,.512},{.815,.176},{.115,.788},{.647,.333},{.642,.652},{.649,.341},{.243,.722},{.111,.795},{.120,.794},{.221,.505},{.249,.603},{.059,.774},{.622,.256}}},
drinithtombfw01={[1]={{.365,.497},{.705,.877},{.694,.876},{.705,.865},{.422,.145},{.408,.147},{.372,.494},{.712,.884},{.410,.134},{.414,.117},{.416,.142},{.697,.866},{.372,.504}}},
nchuleftdepths={[1]={{.394,.335},{.266,.193},{.387,.327},{.258,.415},{.659,.713},{.730,.336},{.730,.344},{.222,.174},{.274,.204},{.272,.187},{.258,.198},{.459,.656},{.408,.327},{.538,.457},{.740,.345},{.451,.656},{.559,.324},{.545,.459},{.677,.500},{.495,.55},{.655,.721},{.679,.507},{.645,.725},{.397,.114},{.400,.324},{.488,.552},{.747,.451},{.223,.167},{.404,.123},{.460,.430},{.578,.502},{.723,.339},{.577,.158},{.537,.448},{.556,.318},{.454,.663}}},
morkul={[1]={{.563,.827},{.383,.880},{.141,.468},{.720,.187},{.203,.954},{.908,.065},{.193,.951},{.135,.464},{.381,.886}},[2]={{.416,.419},{.239,.187},{.231,.192}}},
hallsofregulation_2={[1]={{.341,.670},{.324,.570},{.812,.482},{.648,.356},{.373,.484},{.830,.447},{.742,.351},{.783,.476},{.803,.327},{.646,.356},{.788,.483},{.736,.346},{.829,.449},{.318,.574},{.391,.394}}},
ccunderground={[1]={{.792,.407},{.876,.737},{.277,.581},{.731,.272},{.597,.589},{.268,.729},{.350,.454},{.531,.269},{.344,.457},{.362,.855},{.651,.456},{.098,.746},{.658,.456},{.528,.276},{.360,.862},{.799,.412},{.882,.734},{.882,.741},{.092,.752},{.591,.593}}},
nchuleftingth3={[1]={{.439,.449},{.453,.369},{.832,.720},{.593,.481},{.378,.509},{.469,.382},{.857,.548},{.350,.302},{.419,.489},{.240,.612},{.116,.584},{.350,.310},{.079,.512},{.449,.376},{.445,.453}}},
coldperchcavern={[1]={{.412,.166},{.479,.284},{.286,.685},{.228,.692},{.619,.682},{.542,.628},{.481,.275},{.146,.692},{.512,.749},{.231,.581},{.711,.641},{.562,.892},{.240,.409},{.708,.842},{.419,.168},{.784,.291},{.285,.673},{.719,.487},{.185,.537},{.576,.820},{.526,.676},{.290,.679},{.778,.297},{.273,.557},{.774,.460},{.140,.701},{.702,.647},{.584,.818},{.773,.470},{.716,.841}}},
thukozods={[1]={{.831,.427},{.275,.815},{.190,.358},{.331,.711},{.786,.883},{.885,.819},{.699,.557},{.194,.366},{.647,.445},{.323,.707},{.380,.662},{.283,.811},{.530,.768},{.516,.388},{.838,.427},{.355,.639},{.387,.667},{.414,.463},{.601,.306},{.162,.523},{.135,.495},{.187,.366},{.780,.877},{.778,.665},{.838,.417},{.290,.868},{.361,.327},{.300,.603},{.764,.510},{.701,.566},{.887,.826},{.163,.515}}},
koradurfw02={[1]={{.201,.715},{.525,.807},{.689,.696},{.700,.697},{.512,.816},{.196,.709},{.195,.719},{.684,.705}}},
hewsbane={[1]={{.62,.703},{.297,.626},{.450,.461},{.275,.681},{.421,.854},{.407,.832},{.501,.742},{.490,.794},{.410,.688},{.445,.398},{.662,.656},{.373,.673},{.477,.777},{.470,.747},{.426,.54},{.458,.538},{.41,.548},{.425,.495},{.398,.661},{.494,.394},{.298,.658},{.447,.627},{.283,.588},{.421,.386},{.387,.422},{.401,.465},{.350,.638},{.382,.544},{.553,.807},{.320,.672},{.478,.502},{.516,.414},{.62,.703},{.652,.695},{.687,.676},{.552,.718},{.464,.605},{.336,.705},{.324,.581},{.487,.604},{.488,.453},{.580,.668},{.416,.723},{.320,.506},{.264,.538},{.347,.572},{.751,.734},{.392,.512},{.411,.770},{.330,.556},{.514,.516},{.265,.726},{.260,.743},{.286,.710},{.281,.735},{.256,.717},{.688,.688}},[2]={{.365,.712},{.411,.444},{.390,.512},{.354,.758},{.729,.677},{.511,.403},{.475,.802},{.514,.673},{.504,.447},{.506,.722},{.372,.551},{.475,.556},{.281,.573},{.267,.538},{.324,.704},{.656,.702},{.411,.416},{.440,.584},{.596,.646},{.251,.685}}},
ashalmawia02={[1]={{.446,.599},{.533,.349},{.327,.275},{.628,.291},{.315,.272},{.298,.679},{.634,.3},{.569,.272},{.373,.918},{.288,.760},{.438,.598},{.447,.463},{.704,.244},{.708,.234},{.411,.188},{.713,.241},{.290,.677},{.462,.465},{.581,.270},{.340,.350},{.344,.344},{.357,.351},{.454,.459},{.377,.908},{.540,.361},{.295,.770},{.705,.408},{.419,.192},{.352,.342},{.325,.286},{.569,.259}}},
balmora={[1]={{.196,.516},{.351,.254}},[2]={{.530,.166}}},
ui_map_hofabrichall1={[1]={{.216,.220}}},
forgottendepthsfw04={[1]={{.210,.453},{.204,.447},{.200,.457}}},
nchuleftingth5={[1]={{.616,.191},{.464,.397},{.732,.682},{.457,.402},{.461,.391},{.784,.549},{.731,.691},{.787,.559},{.361,.217},{.758,.340},{.361,.217},{.739,.685},{.780,.543},{.778,.553},{.365,.210}}},
zainsipilu={[1]={{.483,.598},{.768,.292},{.194,.869},{.187,.869},{.423,.334},{.693,.816},{.436,.815},{.488,.603},{.294,.562},{.139,.826},{.547,.433},{.276,.648},{.437,.814},{.697,.809},{.833,.271},{.355,.784},{.705,.692},{.144,.820},{.325,.628},{.269,.734},{.353,.695},{.547,.428},{.321,.813},{.653,.533},{.099,.793},{.150,.747},{.301,.556},{.415,.332},{.429,.816},{.190,.876}}},
sharktoothgrotto1={[1]={{.758,.414},{.610,.401},{.630,.364},{.660,.375},{.749,.413},{.55,.587},{.471,.272},{.598,.176},{.593,.658},{.606,.395},{.702,.532},{.600,.169},{.666,.374},{.756,.416},{.479,.274}}},
hallsofregulation={[1]={{.534,.438},{.366,.164},{.361,.620},{.388,.394},{.311,.267},{.34,.423},{.359,.472},{.400,.319},{.493,.259},{.530,.437},{.334,.321},{.491,.278},{.362,.242},{.358,.627},{.342,.670},{.491,.265},{.535,.430},{.329,.326},{.362,.242},{.487,.278},{.339,.429},{.326,.574},{.336,.326},{.650,.355},{.354,.242},{.490,.287}}},
hrotacave02={[1]={{.423,.643},{.655,.241},{.496,.147},{.527,.188},{.652,.221},{.439,.619},{.505,.160},{.648,.238},{.521,.180},{.437,.648}}},
zthenganaz={[1]={{.753,.675},{.629,.848},{.746,.683},{.571,.489},{.335,.396},{.195,.732},{.604,.523},{.770,.425},{.327,.396},{.467,.745},{.159,.165},{.629,.320},{.778,.255},{.506,.549},{.857,.430},{.257,.650},{.444,.851},{.154,.171},{.283,.343},{.637,.346},{.520,.850},{.635,.696},{.204,.187},{.452,.853},{.782,.246},{.570,.499},{.531,.849},{.631,.689}}},
ccunderground02={[1]={{.656,.727},{.587,.687},{.734,.420},{.888,.748},{.632,.413},{.589,.680},{.535,.88},{.677,.121},{.894,.751},{.649,.731},{.624,.415},{.271,.729},{.365,.857},{.648,.453}}},
shadowcleft={[1]={{.685,.597},{.438,.706},{.157,.484},{.645,.671},{.831,.543},{.637,.793},{.548,.797},{.526,.681},{.133,.685},{.305,.330},{.376,.479},{.258,.495},{.755,.775},{.481,.194},{.507,.461},{.266,.470},{.76,.433},{.572,.547},{.796,.657},{.271,.466},{.48,.186},{.547,.789},{.135,.694},{.350,.534},{.266,.498},{.824,.539},{.163,.488},{.748,.778},{.300,.324},{.834,.536},{.571,.549},{.473,.19},{.357,.535},{.499,.462},{.129,.690},{.166,.480},{.383,.481},{.159,.476}}},
wrothgar={[1]={{.339,.776},{.226,.849},{.205,.833},{.136,.749},{.085,.789},{.211,.740},{.200,.698},{.215,.690},{.583,.692},{.365,.812},{.103,.778},{.302,.705},{.340,.640},{.463,.648},{.507,.684},{.680,.291},{.766,.288},{.422,.641},{.795,.284},{.561,.610},{.462,.698},{.156,.773},{.514,.587},{.178,.725},{.371,.734},{.487,.534},{.462,.604},{.360,.586},{.364,.714},{.749,.297},{.297,.756},{.500,.654},{.424,.621},{.699,.436},{.532,.352},{.593,.548},{.201,.802},{.798,.557},{.449,.582},{.434,.521},{.521,.543},{.458,.709},{.269,.832},{.586,.464},{.711,.336},{.415,.484},{.329,.660},{.248,.745},{.356,.742},{.525,.294},{.529,.262},{.635,.486},{.572,.505},{.373,.579},{.507,.605},{.390,.567},{.609,.451},{.575,.423},{.171,.669},{.394,.650},{.514,.781},{.817,.441},{.567,.442},{.823,.324},{.246,.685},{.542,.649},{.586,.645},{.279,.715},{.535,.577},{.544,.569},{.550,.693},{.304,.728},{.564,.363},{.777,.203},{.724,.396},{.417,.617},{.525,.689},{.456,.621},{.513,.570},{.243,.667},{.380,.687},{.328,.602},{.376,.599},{.246,.729},{.215,.672},{.629,.361},{.740,.540},{.402,.684},{.267,.758},{.515,.747},{.564,.315},{.655,.235},{.704,.322},{.213,.757},{.311,.810},{.703,.369},{.766,.387},{.459,.743},{.517,.764},{.621,.284},{.647,.404},{.870,.385},{.384,.627},{.774,.380},{.626,.554},{.614,.519},{.854,.505},{.870,.483},{.536,.759},{.545,.421},{.485,.797},{.494,.589},{.281,.698},{.241,.859},{.593,.586},{.613,.495},{.482,.733},{.644,.291},{.854,.407},{.799,.247},{.510,.499},{.465,.549},{.260,.744},{.567,.650},{.584,.306},{.628,.428},{.27,.703},{.422,.735},{.472,.513},{.541,.603},{.087,.760},{.091,.754},{.357,.784},{.365,.694},{.221,.734},{.197,.781},{.481,.606},{.437,.627},{.433,.595},{.412,.533},{.718,.315},{.526,.433},{.392,.613},{.491,.505},{.297,.743}},[2]={{.360,.846},{.346,.713},{.337,.691},{.451,.495},{.484,.640},{.170,.661},{.344,.747},{.819,.312},{.283,.692},{.134,.800},{.513,.601},{.211,.695},{.440,.685},{.554,.542},{.394,.649},{.294,.802},{.279,.827},{.840,.461},{.813,.262},{.436,.601},{.677,.329},{.404,.836},{.171,.737},{.088,.761},{.197,.797},{.402,.684},{.405,.554},{.588,.675},{.610,.468},{.668,.487},{.384,.566},{.424,.630},{.476,.714},{.351,.609},{.763,.238},{.521,.614},{.196,.846},{.527,.403},{.791,.514},{.604,.254},{.546,.619},{.51,.695},{.495,.457},{.528,.768},{.843,.314},{.618,.245},{.672,.374},{.239,.859},{.575,.673},{.321,.627},{.833,.351},{.559,.355},{.547,.306},{.476,.433},{.665,.522},{.595,.289},{.578,.564},{.367,.843},{.552,.590},{.269,.790}}},
forgottenwastesext={[1]={{.574,.517},{.446,.624},{.186,.704},{.788,.532},{.676,.432},{.169,.749},{.294,.544},{.597,.601},{.443,.617},{.605,.591},{.473,.449},{.183,.711},{.157,.546},{.395,.398},{.174,.740},{.153,.689},{.471,.441}}},
abahslanding={[1]={{.097,.726},{.153,.954},{.115,.891},{.538,.935},{.118,.868},{.166,.682},{.242,.849}},[2]={{.506,.266},{.301,.453},{.368,.278},{.364,.845},{.345,.423},{.595,.249},{.595,.443}}},
firemothisland={[1]={{.268,.616},{.378,.634}}},
cavernsofkogoruhnfw03={[1]={{.062,.274}}},
ui_map_hofabrichall2={[1]={{.869,.692},{.848,.718},{.425,.731},{.844,.717},{.210,.546},{.874,.697},{.435,.730},{.212,.554}}},
brassfortress={[1]={{.332,.561},{.128,.371},{.699,.53},{.795,.641},{.346,.711},{.740,.649},{.638,.638},{.508,.641},{.525,.618}}},
kennelrun={[1]={{.463,.562},{.543,.362},{.462,.323},{.115,.383},{.246,.288},{.566,.453},{.507,.381},{.455,.566},{.256,.478},{.706,.484},{.850,.662},{.788,.535},{.803,.443},{.307,.564},{.875,.695},{.511,.492},{.780,.531},{.449,.312},{.403,.325},{.524,.430},{.772,.467},{.305,.465}}},
viviccity={[1]={{.497,.015},{.801,.290},{.834,.718},{.855,.596},{.924,.065}},[2]={{.258,.493},{.348,.295},{.850,.644},{.730,.205}}},
nchuleft={[1]={{.354,.206},{.584,.769},{.579,.759},{.354,.199},{.577,.767},{.345,.194},{.592,.755},{.589,.775}}},
vvardenfell={[1]={{.875,.813},{.641,.846},{.499,.638},{.264,.346},{.400,.813},{.675,.510},{.297,.211},{.704,.243},{.642,.562},{.597,.253},{.345,.476},{.639,.399},{.387,.242},{.531,.239},{.345,.782},{.532,.743},{.633,.874},{.735,.856},{.627,.614},{.373,.492},{.528,.664},{.427,.263},{.783,.914},{.722,.834},{.277,.475},{.250,.518},{.584,.905},{.581,.926},{.574,.851},{.108,.295},{.185,.285},{.736,.841},{.896,.764},{.865,.726},{.807,.558},{.779,.339},{.149,.354},{.632,.647},{.695,.686},{.421,.861},{.227,.468},{.340,.639},{.449,.601},{.291,.59},{.390,.565},{.666,.742},{.718,.682},{.303,.479},{.191,.436},{.255,.391},{.301,.509},{.755,.317},{.676,.420},{.802,.664},{.683,.707},{.674,.725},{.521,.802},{.285,.426},{.485,.738},{.603,.308},{.619,.341},{.711,.391},{.271,.405},{.881,.618},{.848,.672},{.799,.617},{.325,.738},{.873,.445},{.852,.451},{.876,.595},{.603,.645},{.452,.743},{.306,.618},{.541,.244},{.683,.237},{.809,.619},{.553,.280},{.130,.325},{.536,.269},{.667,.285},{.875,.686},{.580,.615},{.793,.747},{.622,.634},{.794,.399},{.228,.335},{.305,.389},{.648,.239},{.647,.392},{.429,.578},{.405,.235},{.417,.193},{.348,.208},{.654,.386},{.698,.438},{.729,.891},{.887,.565},{.730,.445},{.305,.726},{.648,.357},{.637,.256},{.596,.625},{.819,.429},{.786,.736},{.649,.857},{.346,.541},{.225,.367},{.537,.676},{.547,.608},{.699,.342},{.667,.301},{.766,.662},{.388,.447},{.757,.56},{.727,.344},{.784,.753},{.460,.218},{.797,.445},{.229,.268},{.826,.738},{.744,.352},{.786,.716},{.251,.487},{.375,.723},{.152,.291},{.826,.785},{.638,.332},{.740,.815},{.785,.857},{.662,.439},{.694,.755},{.270,.693},{.876,.764},{.241,.470},{.753,.400},{.867,.760},{.293,.296},{.713,.510},{.408,.528},{.319,.561},{.225,.409},{.860,.791},{.690,.876},{.596,.811},{.797,.824},{.218,.314},{.823,.705},{.659,.547},{.618,.284},{.607,.591},{.335,.802},{.687,.849},{.634,.294},{.776,.273},{.889,.514},{.375,.628},{.360,.652},{.674,.656},{.231,.275},{.684,.661},{.664,.656},{.668,.668},{.674,.677},{.768,.583},{.442,.313},{.465,.341},{.475,.341},{.484,.336},{.479,.325},{.444,.339},{.774,.580}},[2]={{.401,.842},{.615,.357},{.673,.695},{.652,.430},{.644,.764},{.323,.314},{.562,.835},{.270,.411},{.914,.508},{.583,.913},{.446,.720},{.795,.790},{.771,.356},{.829,.423},{.297,.721},{.410,.769},{.254,.460},{.705,.347},{.558,.282},{.333,.563},{.770,.558},{.410,.452},{.743,.306},{.750,.896},{.511,.789},{.755,.645},{.519,.714},{.100,.295},{.272,.242},{.390,.71},{.743,.492},{.495,.751},{.714,.818},{.251,.631},{.585,.643},{.753,.257},{.667,.288},{.829,.710},{.339,.487},{.313,.652},{.425,.561},{.223,.309},{.657,.555},{.726,.690},{.569,.710},{.629,.295},{.393,.619},{.354,.191},{.762,.406},{.392,.273},{.632,.825},{.841,.790},{.650,.497},{.853,.621},{.470,.220},{.247,.366},{.361,.768},{.560,.774},{.495,.852},{.479,.886}}},
ashalmawia={[1]={{.801,.245},{.066,.371},{.795,.241},{.058,.367},{.051,.373},{.059,.376}}},
nchuleftingth4={[1]={{.748,.538},{.418,.441},{.409,.617}}},
pulkupper={[1]={{.635,.517},{.618,.465},{.473,.393},{.161,.406},{.480,.399},{.501,.529},{.365,.267},{.493,.423},{.510,.701},{.629,.524},{.375,.270},{.485,.416},{.507,.705},{.618,.472},{.502,.540},{.380,.432},{.472,.403},{.385,.425},{.564,.680},{.559,.686}}},
castleanvil01={[1]={{.607,.787},{.606,.789},{.599,.785}}},
ui_map_hofabricboss3={[1]={{.378,.279},{.501,.279},{.371,.266},{.497,.264},{.378,.272}}},
drinithtombfw01b={[1]={{.424,.147},{.409,.148},{.415,.145}}},
orsinium={[2]={{.590,.2},{.585,.201},{.449,.146}}},
pulklower={[1]={{.161,.406},{.446,.541},{.354,.415},{.230,.695},{.506,.554},{.828,.466},{.835,.469},{.510,.701},{.242,.694},{.437,.537},{.183,.618},{.375,.524},{.517,.551},{.573,.571},{.567,.567},{.236,.699},{.509,.547},{.476,.374},{.164,.414},{.432,.543},{.476,.366},{.386,.525},{.385,.581}}},
argentmine2={[1]={{.462,.258},{.458,.245},{.386,.904},{.714,.218},{.463,.251},{.388,.679},{.452,.253},{.811,.587},{.395,.673},{.706,.289},{.252,.895},{.428,.551},{.396,.505},{.674,.516},{.743,.213},{.771,.501},{.210,.808},{.802,.603},{.329,.904},{.468,.644},{.694,.538},{.232,.869},{.606,.847},{.596,.743},{.384,.894},{.796,.607},{.399,.684},{.724,.225},{.673,.517},{.766,.507},{.436,.555},{.723,.218},{.743,.206}}},
nchuleft2={[1]={{.637,.507},{.659,.513},{.65,.502},{.640,.497},{.645,.515}}},
sharktoothgrotto2={[1]={{.724,.176},{.656,.474},{.576,.443},{.222,.470},{.213,.298},{.720,.183},{.641,.102},{.226,.200},{.542,.309},{.293,.554},{.363,.316},{.229,.468},{.210,.291},{.221,.477}}},
watchershold={[1]={{.670,.685},{.539,.654},{.272,.675},{.554,.652},{.563,.477},{.273,.674},{.392,.646},{.696,.661},{.631,.211},{.527,.796},{.680,.317},{.625,.556},{.456,.488},{.176,.655},{.671,.765},{.722,.759},{.670,.686},{.719,.319},{.604,.327},{.651,.711},{.703,.393},{.763,.356},{.695,.653}}},
nchuleftingth6={[1]={{.785,.449}}},
matusakin={[1]={{.811,.444},{.258,.372},{.474,.845},{.428,.475},{.800,.404},{.081,.844},{.425,.819},{.374,.094},{.428,.607},{.625,.679},{.471,.852},{.419,.826},{.088,.855},{.374,.094},{.620,.672},{.426,.607},{.757,.747},{.490,.252},{.368,.460},{.461,.498},{.702,.815},{.411,.311},{.410,.709},{.302,.438},{.500,.849},{.373,.086}}},
ui_map_hofabricext1={[1]={{.735,.669},{.769,.693}}},
khartagpoint={[1]={{.522,.143},{.415,.354},{.755,.455},{.461,.092},{.814,.361},{.703,.734},{.423,.307},{.491,.412},{.745,.464},{.514,.143},{.420,.298},{.469,.086},{.758,.606},{.493,.315},{.462,.085},{.747,.456},{.295,.765},{.431,.295},{.806,.618},{.476,.618},{.558,.669},{.550,.445},{.777,.167},{.482,.623},{.765,.611},{.220,.272},{.303,.763},{.498,.415},{.821,.359},{.430,.302},{.810,.611},{.494,.306},{.917,.304},{.468,.094},{.616,.465},{.774,.057},{.707,.743},{.411,.349}}},
bahrahasgloom={[1]={{.644,.791},{.662,.682},{.667,.686},{.484,.555},{.634,.786},{.207,.532},{.444,.466},{.450,.600},{.093,.505},{.591,.607},{.670,.679},{.543,.467},{.760,.426},{.095,.494},{.545,.557},{.492,.553},{.537,.461},{.660,.674}}},
evergloam={[1]={{.440,.625},{.329,.654},{.383,.236},{.389,.321},{.479,.246},{.384,.305},{.468,.423},{.429,.552},{.377,.395}}},
ashalmawia03={[1]={{.682,.468},{.688,.461},{.609,.152},{.484,.143},{.513,.512},{.602,.142},{.504,.510},{.684,.471},{.794,.311},{.506,.519},{.790,.318},{.596,.153}}},
garlasagea={[1]={{.419,.581},{.551,.610},{.541,.663},{.808,.711},{.612,.445},{.668,.789},{.803,.724},{.813,.577},{.626,.654},{.805,.536},{.559,.604},{.517,.060},{.526,.310},{.543,.095},{.691,.532},{.433,.585},{.618,.400},{.384,.658},{.549,.665},{.678,.343},{.397,.114},{.716,.687},{.574,.738},{.479,.517},{.324,.621},{.811,.719},{.796,.547},{.694,.539},{.581,.740},{.673,.348}}},
goldcoast={[1]={{.288,.543},{.291,.201},{.209,.272},{.419,.323},{.456,.323},{.834,.655},{.591,.334},{.616,.317},{.216,.200},{.508,.475},{.632,.647},{.273,.495},{.151,.438},{.206,.319},{.674,.270},{.932,.602},{.779,.700},{.866,.595},{.683,.705},{.702,.580},{.681,.623},{.545,.449},{.664,.415},{.610,.367},{.226,.145},{.252,.402},{.636,.556},{.605,.521},{.572,.550},{.556,.563},{.206,.365},{.632,.408},{.735,.449},{.868,.501},{.287,.326},{.260,.186},{.335,.248},{.576,.451},{.254,.602},{.516,.354},{.671,.589},{.524,.312},{.379,.370},{.625,.349},{.827,.604},{.756,.662},{.464,.316},{.623,.729},{.294,.562},{.729,.628},{.248,.367},{.571,.647},{.638,.377},{.471,.325},{.489,.389},{.265,.302},{.775,.339},{.759,.359},{.389,.443}},[2]={{.737,.488},{.641,.553},{.744,.288},{.568,.552},{.811,.628},{.662,.419},{.626,.645},{.857,.507},{.602,.520},{.751,.435},{.374,.499}}},
clockwork={[1]={{.413,.464},{.718,.732},{.661,.774},{.803,.458},{.581,.532},{.692,.439},{.564,.516},{.894,.632},{.498,.53},{.37,.617},{.243,.562},{.342,.640},{.336,.414},{.719,.455},{.640,.686},{.476,.701},{.746,.553},{.204,.562},{.839,.674},{.159,.507},{.598,.488},{.568,.509},{.796,.666},{.687,.489},{.703,.620},{.699,.442},{.165,.556},{.212,.626},{.233,.529},{.816,.611},{.192,.639},{.381,.649},{.202,.498},{.571,.747},{.766,.606},{.188,.647},{.368,.710},{.662,.509},{.477,.682},{.482,.570},{.834,.647},{.496,.395},{.264,.579},{.833,.655},{.493,.387}},[2]={{.263,.403},{.265,.553},{.825,.481},{.422,.567},{.427,.532},{.574,.601},{.330,.612},{.546,.665},{.815,.542},{.183,.575},{.403,.649},{.620,.528},{.227,.507},{.754,.465},{.591,.673},{.233,.447},{.709,.501},{.876,.607},{.562,.581},{.353,.526},{.338,.419},{.293,.569},{.463,.634},{.377,.615},{.652,.592},{.686,.440},{.404,.501},{.453,.545},{.599,.628},{.639,.676}}},
hrotacave={[1]={{.881,.685},{.051,.341},{.180,.344},{.859,.899},{.236,.528},{.055,.334},{.333,.772},{.650,.657},{.858,.889},{.307,.816},{.433,.737},{.487,.626},{.895,.694},{.361,.497},{.745,.830},{.524,.455},{.179,.334},{.380,.351},{.305,.150},{.266,.562},{.554,.580},{.562,.576},{.356,.502},{.237,.521},{.050,.329}}},
sadrithmora={[1]={{.873,.544},{.074,.974}}},
nchuleftingth1={[1]={{.697,.357},{.705,.366},{.697,.369},{.713,.367},{.711,.360}}},
--anvilcity={[1]={{.906,.060}},[2]={{.399,.413},{.463,.197},{.834,.371},{.464,.330},{.208,.237},{.580,.559},{.468,.365},{.531,.194},{.324,.162},{.363,.503},{.327,.489}}},
blessedcrucible5={[1]={{.414,.469},{.409,.502},{.251,.443},{.356,.465},{.210,.425},{.384,.412},{.271,.387}}},
altencorimont={[1]={{.243,.706},{.211,.334},{.647,.416},{.506,.235},{.688,.867},{.212,.829},{.639,.419}},[2]={{.407,.526},{.462,.577},{.388,.531},{.682,.550},{.612,.637}}},
deshaan={[1]={{.108,.500},{.569,.531},{.273,.521},{.207,.612},{.607,.417},{.588,.397},{.628,.417},{.871,.422},{.244,.495},{.794,.359},{.915,.428},{.704,.633},{.670,.634},{.823,.454},{.323,.577},{.681,.395},{.846,.426},{.844,.398},{.330,.575},{.585,.563},{.388,.442},{.830,.428},{.896,.359},{.334,.426},{.790,.539},{.292,.501},{.395,.507},{.766,.593},{.764,.535},{.711,.451},{.746,.539},{.333,.651},{.797,.512},{.904,.506},{.939,.456},{.814,.462},{.439,.681},{.646,.405},{.892,.489},{.197,.495},{.178,.607},{.259,.456},{.885,.367},{.537,.37},{.793,.571},{.864,.422},{.497,.595},{.205,.600},{.341,.622},{.563,.451},{.762,.517},{.739,.604},{.450,.599},{.898,.406},{.243,.544},{.909,.365},{.809,.562},{.753,.601},{.371,.575},{.341,.433},{.384,.67},{.645,.438},{.247,.592},{.617,.495},{.899,.382},{.934,.520},{.629,.537},{.890,.560},{.388,.526},{.835,.521},{.812,.523},{.733,.590},{.725,.469},{.341,.589},{.474,.596},{.255,.516},{.635,.484},{.811,.514},{.388,.634},{.386,.463},{.513,.428},{.524,.391},{.902,.439},{.664,.616},{.834,.559},{.149,.609},{.518,.568},{.779,.587},{.235,.526},{.286,.506},{.903,.429},{.856,.449},{.891,.472},{.290,.527},{.361,.616},{.351,.640},{.341,.647},{.291,.585},{.227,.548},{.607,.592},{.643,.482},{.182,.480},{.315,.574},{.684,.647},{.355,.586},{.645,.608},{.218,.584},{.259,.511},{.437,.624},{.382,.584},{.58,.497},{.667,.523},{.635,.392},{.567,.501},{.139,.377},{.758,.563},{.474,.376},{.116,.543},{.193,.464},{.176,.378},{.552,.482},{.342,.580},{.352,.650},{.642,.367},{.551,.449},{.104,.536},{.474,.357},{.593,.311},{.629,.332},{.642,.388},{.928,.411},{.845,.356},{.18,.403},{.687,.635},{.428,.648},{.593,.495},{.510,.419},{.919,.547},{.791,.558},{.659,.382},{.513,.585},{.338,.616},{.220,.488},{.329,.615},{.574,.571},{.381,.406},{.557,.556},{.443,.366},{.649,.527},{.205,.589},{.154,.515},{.895,.483}},[2]={{.877,.482},{.595,.524},{.823,.466},{.732,.536},{.574,.355},{.909,.548},{.768,.441},{.869,.489},{.317,.461},{.182,.486},{.136,.455},{.781,.384},{.798,.368},{.877,.429},{.873,.513},{.242,.524},{.366,.641},{.237,.492},{.261,.536},{.309,.457},{.119,.562},{.398,.454},{.526,.570},{.600,.477},{.395,.392},{.568,.409},{.221,.482},{.445,.635},{.128,.388},{.374,.585},{.287,.523},{.438,.383},{.605,.445},{.626,.579},{.731,.614},{.684,.471},{.693,.508},{.780,.563},{.656,.398},{.854,.518},{.910,.485},{.774,.473},{.474,.583},{.196,.571},{.286,.630},{.297,.598},{.94,.509},{.115,.410},{.613,.467},{.648,.5},{.093,.6},{.493,.494},{.480,.456},{.151,.491}}},
ui_cradleofshadowsint_001={[1]={{.737,.403},{.171,.455},{.735,.396},{.415,.492}}},
shadowfen={[1]={{.47,.653},{.849,.725},{.564,.323},{.348,.208},{.394,.397},{.256,.741},{.156,.809},{.241,.143},{.863,.752},{.595,.213},{.575,.283},{.550,.373},{.306,.302},{.658,.427},{.806,.389},{.665,.731},{.492,.794},{.268,.837},{.36,.674},{.177,.593},{.440,.587},{.705,.692},{.711,.386},{.533,.395},{.301,.531},{.743,.451},{.803,.478},{.532,.612},{.306,.709},{.201,.675},{.741,.682},{.553,.244},{.392,.454},{.318,.167},{.350,.261},{.380,.780},{.546,.281},{.721,.448},{.182,.627},{.323,.334},{.457,.849},{.845,.529},{.805,.590},{.881,.699},{.243,.320},{.227,.768},{.186,.724},{.548,.743},{.553,.779},{.702,.775},{.341,.557},{.626,.279},{.359,.823},{.345,.408},{.342,.322},{.703,.478},{.396,.361},{.632,.500},{.848,.651},{.838,.578},{.800,.579},{.415,.560},{.315,.591},{.213,.579},{.626,.653},{.243,.830},{.314,.801},{.136,.712},{.361,.493},{.107,.766},{.142,.688},{.645,.762},{.300,.737},{.298,.662},{.414,.751},{.481,.790},{.130,.813},{.242,.714},{.269,.661},{.477,.499},{.467,.495},{.442,.188},{.397,.178},{.261,.799},{.362,.282},{.291,.769},{.280,.751},{.489,.423},{.492,.214},{.276,.681},{.265,.228},{.304,.211},{.520,.322},{.459,.749},{.687,.532},{.318,.788},{.651,.355},{.570,.653},{.486,.538},{.502,.344},{.697,.72},{.723,.660},{.276,.373},{.836,.782},{.621,.330},{.330,.737},{.490,.618},{.364,.148},{.491,.772},{.727,.419},{.841,.468},{.447,.365},{.792,.628},{.322,.370},{.246,.614},{.124,.727},{.229,.172},{.511,.699},{.806,.434},{.796,.779},{.426,.655},{.613,.841},{.625,.818},{.721,.497},{.370,.633},{.632,.675},{.596,.578},{.525,.831},{.671,.45},{.466,.814},{.583,.618},{.256,.347},{.652,.689},{.678,.867},{.783,.673},{.287,.242},{.160,.696},{.294,.615},{.678,.799},{.438,.697},{.526,.662},{.253,.302},{.598,.459},{.841,.684},{.596,.866},{.663,.821},{.373,.368},{.316,.534},{.398,.212},{.626,.551},{.467,.286},{.436,.292},{.633,.628},{.356,.716},{.282,.393},{.231,.232},{.224,.229},{.466,.445},{.452,.434}},[2]={{.359,.412},{.605,.224},{.34,.279},{.250,.371},{.301,.185},{.685,.376},{.383,.712},{.555,.525},{.515,.582},{.741,.470},{.771,.533},{.800,.448},{.573,.766},{.777,.809},{.478,.704},{.456,.796},{.758,.724},{.655,.720},{.284,.680},{.185,.647},{.349,.785},{.457,.839},{.176,.822},{.12,.764},{.299,.503},{.444,.633},{.247,.583},{.368,.527},{.353,.573},{.294,.540},{.297,.207},{.650,.404},{.279,.231},{.568,.373},{.845,.808},{.812,.576},{.612,.265},{.790,.601},{.164,.779},{.428,.836},{.804,.578},{.240,.791},{.806,.427},{.257,.296},{.527,.239},{.462,.372},{.580,.791},{.283,.837}}},
gandranen={[1]={{.521,.520},{.819,.589},{.368,.332},{.160,.325},{.090,.398},{.474,.356},{.806,.719},{.151,.557},{.722,.385},{.497,.831},{.824,.595},{.374,.337},{.486,.340},{.730,.395},{.502,.837}}},
desolatecave={[1]={{.800,.392},{.320,.334},{.530,.382},{.464,.147},{.355,.556},{.327,.338},{.643,.164},{.805,.397},{.369,.493},{.732,.246},{.720,.154},{.459,.152},{.797,.502},{.652,.160},{.327,.346},{.792,.398},{.358,.500},{.794,.407},{.749,.248}}},
thefrigidgrotto={[1]={{.706,.325},{.314,.382},{.639,.422},{.773,.235},{.572,.414},{.361,.123},{.808,.620},{.589,.775},{.351,.119},{.774,.844},{.660,.588},{.563,.414},{.801,.616},{.539,.285},{.574,.777},{.470,.761},{.623,.89},{.702,.505},{.383,.250},{.551,.192},{.766,.223},{.870,.519},{.710,.610},{.355,.130},{.759,.170},{.640,.430},{.561,.873},{.703,.332},{.580,.781},{.763,.231},{.868,.511},{.546,.879},{.555,.180},{.349,.13},{.541,.277},{.755,.177},{.780,.840}}},
dhalmora={[1]={{.059,.814},{.205,.878},{.205,.885},{.650,.905},{.634,.901},{.783,.924},{.645,.898},{.856,.664},{.742,.334},{.795,.453},{.199,.872},{.479,.809},{.865,.661},{.441,.505},{.431,.504},{.734,.329},{.491,.805},{.746,.342},{.796,.446},{.748,.339},{.424,.507},{.626,.903},{.207,.871},{.055,.807},{.477,.802}},[2]={{.741,.619},{.722,.647}}},
fortamol={[1]={{.224,.816},{.863,.930},{.786,.605},{.216,.816},{.691,.737},{.037,.877},{.067,.587},{.094,.275},{.641,.510},{.676,.728},{.062,.583},{.215,.806},{.682,.736},{.629,.504},{.101,.283},{.781,.615}},[2]={{.295,.139},{.195,.514}}},
ebonheart={[1]={{.734,.450},{.383,.766},{.342,.651},{.342,.574},{.273,.636},{.281,.300},{.694,.683},{.552,.915}},[2]={{.731,.753},{.270,.804},{.474,.219},{.270,.311}}},
icehammersvault={[1]={{.476,.302},{.575,.814},{.322,.224},{.729,.769},{.170,.228},{.108,.340},{.573,.806},{.483,.300},{.186,.550},{.694,.616},{.243,.432},{.457,.486},{.254,.424},{.537,.482},{.308,.649},{.476,.563},{.891,.587},{.452,.496},{.308,.640},{.223,.336},{.404,.282},{.186,.418},{.575,.799},{.530,.478},{.484,.801},{.303,.654},{.895,.595},{.404,.289},{.482,.555},{.478,.797},{.444,.492},{.250,.432}}},
sanguinesdemesne={[1]={{.569,.665},{.575,.659},{.381,.606},{.445,.457},{.390,.692},{.202,.420},{.235,.461},{.457,.387},{.249,.665},{.384,.402},{.497,.287},{.294,.441},{.776,.512},{.296,.241},{.568,.651},{.640,.671},{.493,.410},{.126,.478},{.188,.225},{.605,.629},{.067,.529},{.084,.491},{.190,.557},{.805,.589},{.19,.598},{.443,.517},{.821,.700},{.462,.683},{.826,.543},{.862,.561},{.256,.530},{.566,.658},{.600,.616},{.091,.480},{.430,.496},{.817,.547},{.448,.465},{.492,.293},{.438,.458},{.235,.452},{.647,.676},{.439,.525},{.817,.539},{.768,.510},{.177,.223},{.458,.677},{.824,.551},{.857,.568}}},
blessedcrucible1={[1]={{.535,.273}}},
shroudhearth={[1]={{.239,.506},{.793,.290},{.828,.405},{.252,.469},{.773,.290},{.130,.185},{.558,.648},{.787,.282},{.066,.468},{.756,.700},{.676,.261},{.136,.196},{.558,.659},{.626,.566},{.657,.729},{.358,.213},{.463,.381},{.169,.590},{.185,.526},{.856,.718},{.836,.414},{.528,.623},{.094,.503},{.902,.411},{.334,.672},{.679,.253},{.908,.425},{.259,.473},{.651,.736},{.170,.581},{.835,.407},{.230,.503},{.476,.378},{.626,.556},{.859,.708},{.234,.494},{.064,.475},{.757,.688},{.469,.387},{.823,.41},{.914,.416},{.204,.523},{.333,.679}}},
hallofthedead={[1]={{.789,.563},{.346,.136},{.402,.227},{.319,.287},{.683,.613},{.564,.325},{.734,.48},{.425,.858},{.730,.604},{.312,.742},{.364,.845},{.790,.575},{.351,.766},{.250,.753},{.540,.504},{.447,.315},{.773,.801},{.563,.563},{.765,.668},{.337,.715},{.757,.761},{.416,.190},{.559,.585},{.291,.753},{.792,.497},{.354,.873},{.427,.278},{.500,.901},{.337,.577},{.660,.919},{.636,.913},{.416,.232},{.723,.615},{.352,.775},{.243,.755},{.335,.723},{.541,.497},{.320,.740},{.286,.750},{.628,.905}}},
ebonmeretower={[1]={{.565,.899},{.666,.454},{.546,.474},{.445,.207},{.567,.906},{.640,.627},{.283,.341},{.409,.292},{.705,.389},{.579,.201},{.405,.236},{.671,.468},{.521,.400},{.359,.267},{.37,.160},{.319,.548},{.524,.252},{.363,.472},{.406,.383},{.645,.623},{.537,.465},{.317,.674},{.560,.295},{.575,.303},{.409,.243},{.537,.457},{.368,.153},{.319,.557},{.568,.294},{.310,.544},{.419,.301}}},
atanazruins={[1]={{.865,.687},{.341,.760},{.536,.423},{.867,.679},{.404,.358},{.350,.727},{.646,.447},{.467,.644},{.532,.429},{.859,.682},{.337,.738},{.423,.272},{.333,.632},{.558,.506},{.554,.500},{.636,.442},{.410,.272},{.638,.445},{.357,.728},{.340,.731},{.544,.425},{.878,.691},{.326,.634}}},
fortgreenwall={[1]={{.433,.461},{.748,.824},{.752,.813},{.305,.859},{.784,.650},{.458,.468},{.837,.454},{.527,.754},{.703,.596},{.843,.466},{.717,.596},{.223,.256},{.543,.751},{.242,.497},{.557,.483},{.577,.442},{.734,.817},{.454,.735},{.464,.263},{.581,.432},{.246,.504},{.343,.623},{.382,.163},{.704,.605},{.830,.459},{.741,.828},{.465,.758},{.781,.665},{.764,.650},{.757,.808},{.295,.841},{.520,.392},{.477,.869},{.650,.784},{.479,.248},{.558,.476},{.585,.188},{.210,.258},{.721,.427},{.527,.762},{.246,.490},{.337,.628},{.381,.150},{.472,.755},{.765,.657},{.292,.848},{.503,.390},{.471,.251},{.576,.185},{.207,.268},{.641,.769},{.510,.393},{.764,.665},{.593,.437},{.645,.792},{.343,.641}}},
blessedcrucible3={[1]={{.476,.709},{.570,.669},{.458,.784},{.523,.778},{.512,.673},{.557,.692}}},
ui_cradleofshadowsint_002={[1]={{.422,.283},{.801,.816},{.794,.818}}},
emberflintmine={[1]={{.139,.611},{.189,.622},{.860,.299},{.762,.634},{.457,.701},{.690,.632},{.329,.644},{.537,.380},{.146,.611},{.736,.254},{.748,.625},{.789,.561},{.865,.305},{.784,.508},{.437,.832},{.449,.700},{.801,.521},{.517,.760},{.897,.488},{.173,.614},{.542,.416},{.424,.648},{.180,.635},{.145,.567},{.335,.648},{.753,.632},{.805,.560},{.138,.568},{.795,.565},{.701,.635}}},
nimalten={[1]={{.445,.801},{.547,.308},{.379,.198},{.661,.538},{.408,.752},{.618,.056},{.205,.378},{.158,.829},{.753,.799},{.661,.548},{.441,.794}}},
lowerbthanuel={[1]={{.737,.826},{.423,.281},{.769,.607},{.493,.220},{.635,.258},{.644,.678},{.761,.821},{.779,.610},{.411,.450},{.412,.276},{.500,.662},{.781,.438},{.412,.267},{.625,.256},{.675,.442},{.645,.685},{.746,.821},{.415,.439},{.491,.219},{.653,.685},{.675,.442},{.631,.678},{.776,.603},{.785,.429},{.406,.282},{.510,.657},{.629,.248},{.421,.264},{.774,.614},{.667,.442},{.419,.272}}},
thelionsden={[1]={{.832,.186},{.762,.515},{.346,.648},{.701,.566},{.248,.342},{.708,.469},{.147,.185},{.740,.473},{.643,.222},{.688,.505},{.102,.866},{.121,.282},{.624,.435},{.714,.540},{.149,.244},{.655,.262},{.137,.901},{.263,.272},{.381,.121},{.781,.533},{.656,.304},{.135,.864},{.322,.219},{.692,.259},{.698,.573},{.752,.426},{.723,.514},{.722,.765},{.703,.476},{.708,.46}}},
bleakrock={[1]={{.476,.125},{.445,.207},{.845,.330},{.683,.614},{.647,.645},{.280,.321},{.251,.521},{.776,.500},{.795,.477},{.429,.748},{.245,.675},{.248,.554},{.661,.338},{.781,.638},{.703,.503},{.554,.085},{.305,.424},{.397,.811},{.475,.782},{.412,.832},{.719,.689},{.205,.689},{.648,.273},{.499,.195},{.313,.427},{.551,.207},{.563,.356},{.791,.279},{.861,.326},{.743,.450},{.47,.081},{.818,.387},{.234,.497},{.580,.614},{.601,.187},{.295,.468},{.92,.374},{.249,.631},{.698,.283},{.321,.653},{.157,.704},{.266,.154},{.330,.231},{.664,.701},{.741,.397},{.267,.261},{.282,.356},{.401,.600},{.562,.604}},[2]={{.386,.196},{.438,.206},{.354,.241},{.314,.424},{.688,.678},{.68,.299},{.261,.418},{.339,.456},{.324,.315},{.439,.439},{.740,.504},{.769,.593},{.641,.283},{.667,.253},{.284,.165},{.484,.721},{.441,.403},{.344,.616},{.352,.588},{.413,.626}}},
riften={[1]={{.781,.509},{.778,.501},{.718,.040},{.710,.043}},[2]={{.124,.008},{.607,.497},{.563,.677}}},
lionsden_hiddentunnel={[1]={{.711,.409},{.682,.387},{.691,.396}}},
hightidehollow={[1]={{.741,.549},{.703,.369},{.323,.401},{.375,.410},{.57,.321},{.741,.684},{.447,.756},{.445,.300},{.446,.743},{.739,.561},{.460,.369},{.698,.386},{.385,.374},{.413,.434},{.428,.293},{.455,.668},{.320,.355},{.225,.274},{.447,.438},{.514,.332},{.735,.697},{.156,.328},{.327,.392},{.432,.517},{.575,.326},{.391,.355},{.448,.283},{.462,.672},{.460,.356},{.375,.419},{.693,.378},{.380,.401},{.383,.363},{.440,.307},{.166,.328},{.427,.511},{.690,.370},{.436,.290},{.566,.328},{.708,.388},{.383,.354},{.231,.279},{.521,.337}}},
mephalasnest={[1]={{.764,.462},{.352,.397},{.527,.494},{.053,.469},{.131,.384},{.123,.590},{.176,.497},{.385,.445},{.354,.404},{.560,.294},{.054,.460},{.558,.404},{.057,.422},{.735,.594},{.653,.624},{.534,.499},{.695,.657},{.648,.402},{.135,.583},{.615,.487},{.399,.582},{.468,.394},{.480,.298},{.734,.604},{.658,.613},{.771,.460},{.205,.535},{.139,.383},{.399,.573},{.061,.474},{.549,.409},{.472,.297},{.385,.437},{.759,.459},{.164,.496},{.548,.497},{.743,.606},{.126,.584},{.561,.413},{.539,.494},{.145,.378},{.128,.377},{.616,.478},{.569,.408},{.210,.527}}},
mudtreemine={[1]={{.779,.580},{.592,.434},{.781,.596}}},
triplecirclemine={[1]={{.650,.569},{.583,.355},{.720,.384},{.642,.497},{.713,.382},{.659,.576},{.433,.332},{.785,.332},{.722,.392},{.665,.294},{.653,.490},{.452,.606},{.767,.236},{.787,.473},{.574,.352},{.66,.287},{.650,.498},{.451,.615},{.800,.473},{.661,.568},{.791,.336},{.451,.603},{.669,.286},{.726,.382}}},
kragenmoor={[1]={{.538,.357},{.410,.648},{.717,.459},{.276,.312},{.614,.607},{.705,.684},{.329,.278},{.297,.183},{.323,.519},{.357,.262},{.209,.307},{.536,.702},{.787,.745},{.962,.545},{.918,.441},{.356,.269},{.788,.737},{.283,.314}},[2]={{.515,.674},{.473,.575},{.370,.509},{.315,.578},{.234,.190},{.316,.571}}},
ui_map_mazzatunext={[1]={{.375,.272},{.400,.269},{.743,.800},{.368,.273},{.750,.800},{.368,.273},{.794,.229},{.328,.707},{.302,.553},{.748,.728},{.397,.262},{.410,.763},{.599,.176},{.303,.518},{.523,.849},{.687,.253}}},
oldsordscave={[1]={{.434,.570},{.925,.214},{.716,.303},{.658,.706},{.705,.416},{.912,.219},{.497,.616},{.438,.275},{.623,.459},{.436,.562},{.874,.140},{.687,.515},{.463,.199},{.706,.307},{.730,.433},{.646,.384},{.495,.763},{.333,.265},{.663,.836},{.698,.419},{.908,.211},{.758,.168},{.664,.713},{.417,.864},{.605,.505},{.304,.622},{.698,.518},{.721,.429},{.342,.265},{.423,.873},{.307,.632},{.645,.376},{.425,.863},{.664,.843},{.675,.843}}},
onkobrakwamamine={[1]={{.623,.444},{.728,.560},{.664,.708},{.258,.783},{.632,.450},{.311,.687},{.380,.725},{.782,.476},{.634,.589},{.885,.401},{.269,.721},{.386,.720},{.660,.719},{.257,.768},{.620,.460},{.786,.488},{.723,.566},{.274,.733},{.668,.723},{.301,.673},{.620,.451},{.304,.679},{.872,.384}}},
balfoyen={[1]={{.365,.584},{.657,.396},{.555,.387},{.586,.434},{.469,.405},{.384,.262},{.402,.415},{.428,.473},{.485,.643},{.623,.668},{.429,.564},{.355,.542},{.542,.382},{.723,.524},{.346,.622},{.367,.311},{.314,.424},{.289,.441},{.479,.320},{.594,.359},{.659,.671},{.663,.410},{.743,.624},{.343,.421},{.562,.390},{.398,.201},{.394,.332},{.644,.298},{.274,.289},{.329,.233},{.367,.284},{.386,.301},{.290,.460},{.319,.584},{.386,.368},{.519,.659},{.240,.678},{.526,.415},{.599,.737},{.362,.621},{.450,.385},{.457,.366},{.584,.644},{.478,.727},{.526,.663}},[2]={{.385,.281},{.656,.329},{.337,.708},{.703,.565},{.221,.604},{.766,.565},{.793,.550},{.293,.795},{.246,.766},{.486,.699},{.353,.853},{.517,.478},{.658,.691},{.268,.521},{.377,.263},{.371,.415},{.397,.201},{.490,.466},{.359,.422}}},
stormholdguildhall_map={[1]={{.221,.527}}},
blessedcrucible6={[1]={{.452,.592}}},
arxcorinium={[1]={{.182,.743},{.576,.343},{.110,.348},{.295,.309},{.566,.544},{.491,.836},{.391,.751},{.606,.485},{.732,.660},{.182,.743},{.248,.804},{.600,.638},{.216,.798},{.512,.824},{.63,.375},{.572,.351},{.599,.522},{.287,.515},{.777,.572},{.612,.774},{.482,.678},{.291,.302},{.272,.169},{.600,.715},{.209,.305},{.510,.716},{.363,.517},{.117,.346},{.280,.192},{.609,.593},{.500,.713},{.63,.367},{.594,.521},{.178,.737},{.115,.358},{.579,.352},{.269,.195},{.504,.721}}},
direfrostkeepsummit={[1]={{.430,.814},{.194,.382},{.173,.522},{.422,.812},{.761,.369},{.172,.529},{.424,.805},{.202,.383},{.432,.821},{.188,.532}}},
davonswatch={[1]={{.060,.540},{.047,.374},{.098,.343},{.141,.440},{.383,.851},{.452,.304},{.051,.381},{.712,.229},{.107,.339}},[2]={{.778,.232},{.940,.399}}},
eastmarch={[1]={{.509,.24},{.225,.64},{.316,.319},{.337,.546},{.316,.469},{.230,.445},{.399,.255},{.517,.427},{.371,.684},{.413,.663},{.369,.520},{.369,.502},{.572,.615},{.577,.508},{.711,.552},{.709,.590},{.676,.618},{.414,.482},{.238,.427},{.652,.510},{.456,.324},{.709,.604},{.369,.489},{.196,.570},{.430,.287},{.694,.646},{.327,.427},{.304,.426},{.272,.430},{.754,.661},{.688,.541},{.597,.353},{.595,.499},{.721,.583},{.720,.641},{.758,.672},{.527,.591},{.487,.601},{.700,.563},{.403,.683},{.547,.228},{.323,.413},{.454,.372},{.664,.531},{.714,.678},{.532,.368},{.383,.579},{.736,.683},{.744,.693},{.448,.565},{.435,.613},{.660,.664},{.504,.371},{.405,.393},{.206,.665},{.222,.676},{.458,.458},{.386,.504},{.604,.328},{.608,.293},{.596,.538},{.588,.585},{.680,.641},{.427,.395},{.451,.553},{.320,.551},{.33,.362},{.697,.693},{.737,.704},{.424,.318},{.428,.423},{.642,.525},{.444,.355},{.330,.481},{.557,.649},{.633,.585},{.430,.644},{.346,.337},{.414,.378},{.175,.585},{.537,.596},{.376,.442},{.350,.294},{.196,.617},{.341,.406},{.728,.634},{.390,.564},{.605,.624},{.625,.607},{.618,.555},{.392,.238},{.165,.579},{.293,.448},{.156,.559},{.399,.486},{.448,.429},{.603,.269},{.426,.586},{.148,.578},{.634,.606},{.740,.659},{.602,.248},{.311,.334},{.445,.624},{.633,.646},{.578,.580},{.469,.600},{.623,.517},{.571,.625},{.566,.355},{.563,.551},{.393,.416},{.323,.683},{.690,.533},{.153,.595},{.330,.385},{.357,.498},{.580,.484},{.475,.508},{.549,.619},{.381,.499},{.356,.349},{.334,.352},{.574,.501},{.535,.649},{.684,.599},{.479,.542},{.370,.590},{.642,.608},{.614,.510},{.391,.527},{.728,.572},{.606,.587},{.404,.314},{.600,.618},{.450,.496},{.485,.376},{.387,.553},{.685,.552},{.342,.674},{.442,.593},{.445,.484},{.427,.464},{.489,.590},{.562,.604},{.359,.522},{.228,.602},{.243,.668},{.360,.270}},[2]={{.408,.517},{.461,.589},{.593,.615},{.366,.281},{.310,.327},{.426,.334},{.495,.349},{.389,.369},{.570,.312},{.231,.456},{.282,.445},{.535,.499},{.530,.408},{.600,.606},{.627,.513},{.463,.544},{.536,.476},{.400,.585},{.418,.431},{.346,.503},{.714,.658},{.390,.680},{.346,.575},{.736,.674},{.437,.407},{.341,.455},{.474,.620},{.291,.537},{.726,.636},{.411,.649},{.411,.602},{.579,.530},{.343,.420},{.526,.582},{.341,.404},{.734,.67},{.587,.284},{.222,.554},{.540,.642},{.448,.574},{.342,.656},{.569,.505},{.322,.434},{.425,.478},{.536,.605},{.513,.417},{.503,.574},{.688,.678},{.475,.431},{.359,.638},{.640,.592},{.269,.525},{.394,.628},{.178,.621},{.478,.490}}},
kwamacolony={[1]={{.154,.321},{.154,.559},{.241,.662},{.389,.430},{.295,.362},{.149,.553},{.136,.314},{.379,.747},{.456,.799},{.506,.655},{.615,.812},{.239,.661},{.543,.787},{.140,.558},{.147,.317},{.366,.743},{.448,.795},{.620,.822},{.554,.793},{.508,.646},{.540,.799},{.458,.792},{.154,.314},{.291,.354},{.141,.568}}},
thebastardstomb={[1]={{.599,.641},{.442,.379},{.451,.12},{.756,.732},{.775,.843},{.513,.819},{.396,.277},{.399,.793},{.479,.615},{.582,.810},{.328,.177},{.452,.123},{.401,.410},{.429,.221},{.440,.373},{.656,.611},{.643,.409},{.601,.474},{.38,.564},{.549,.207},{.519,.106},{.538,.376},{.791,.849},{.783,.845},{.326,.170},{.409,.405},{.427,.211},{.554,.215},{.538,.384},{.483,.626},{.590,.810}}},
mournhold={[1]={{.358,.347},{.682,.125},{.721,.212},{.511,.778},{.792,.602},{.858,.765},{.326,.895},{.233,.155},{.008,.864},{.203,.841},{.012,.820},{.429,.937},{.645,.897},{.509,.115}},[2]={{.326,.386},{.359,.572},{.586,.539},{.47,.843},{.742,.411},{.479,.896},{.678,.223}}},
sheogorathstongue={[1]={{.208,.423},{.562,.426},{.664,.552},{.682,.647},{.471,.234},{.684,.586},{.691,.521},{.675,.36},{.529,.385},{.635,.494},{.189,.616},{.554,.675},{.349,.644},{.617,.227},{.464,.562},{.584,.370},{.442,.580},{.618,.504},{.520,.309},{.490,.624},{.478,.234},{.345,.655},{.594,.373},{.614,.511},{.501,.622},{.516,.315},{.652,.551}}},
stormcragcrypt={[1]={{.676,.582},{.684,.564},{.412,.392},{.383,.086},{.797,.411},{.709,.206},{.788,.404},{.832,.152},{.562,.135},{.454,.673},{.711,.075},{.380,.097},{.295,.317},{.639,.469},{.638,.455},{.674,.574},{.195,.401},{.402,.389},{.568,.132},{.548,.381},{.459,.667},{.409,.302},{.763,.483},{.684,.173},{.553,.254},{.295,.307},{.481,.238},{.56,.171},{.567,.170},{.707,.081},{.840,.142},{.751,.474},{.551,.262}}},
fungalgrotto={[1]={{.339,.483},{.315,.465},{.467,.239},{.861,.602},{.504,.377},{.389,.363},{.460,.373},{.557,.218},{.379,.280},{.457,.366},{.413,.188},{.859,.714},{.484,.177},{.584,.806},{.633,.305},{.566,.329},{.795,.5},{.620,.413},{.460,.297},{.470,.223},{.609,.303},{.685,.781},{.565,.214},{.595,.375},{.315,.465},{.402,.331},{.501,.364},{.781,.595},{.494,.372},{.403,.318},{.773,.596},{.388,.296},{.801,.717},{.843,.859},{.465,.433},{.395,.369},{.856,.709},{.692,.779},{.792,.492},{.629,.419},{.468,.293},{.310,.470},{.511,.372},{.386,.280},{.559,.325},{.600,.291},{.607,.294},{.468,.181},{.397,.313},{.483,.168},{.596,.382}}},
ui_cradleofshadowsint_003={[1]={{.545,.641},{.672,.465},{.536,.398},{.466,.202},{.533,.390},{.557,.632},{.386,.387},{.452,.214},{.670,.466},{.460,.211},{.554,.643}}},
stormhold={[1]={{.577,.582},{.395,.619},{.928,.812},{.59,.584},{.585,.577},{.587,.584}},[2]={{.340,.250},{.392,.456},{.322,.702},{.525,.544},{.699,.073},{.328,.707}}},
brokenhelm={[1]={{.713,.446},{.159,.335},{.203,.356},{.508,.648},{.226,.254},{.233,.251},{.167,.521},{.134,.570},{.174,.607},{.614,.649},{.403,.474},{.202,.170},{.215,.349},{.453,.764},{.219,.258},{.605,.878},{.693,.878},{.291,.443},{.165,.353},{.711,.614},{.241,.572},{.710,.453},{.260,.517},{.874,.659},{.318,.595},{.516,.651},{.169,.340},{.403,.466},{.469,.767},{.231,.242},{.277,.437},{.184,.527},{.125,.571},{.267,.520},{.463,.755},{.179,.518},{.245,.579},{.160,.608},{.222,.249},{.199,.342},{.252,.572},{.157,.348},{.698,.445},{.608,.641},{.601,.898},{.260,.574}}},
shrineofblackworm={[1]={{.341,.172},{.628,.863},{.365,.374},{.723,.363},{.628,.863},{.447,.682},{.174,.214},{.339,.842},{.724,.352},{.120,.552},{.438,.295},{.324,.164},{.439,.688},{.364,.388},{.816,.791},{.636,.862},{.346,.833},{.124,.542},{.621,.867},{.333,.172}}},
brokentuskcave={[1]={{.259,.199},{.488,.308},{.341,.208},{.318,.212},{.480,.319},{.683,.618},{.131,.400},{.634,.428},{.324,.217},{.105,.549},{.354,.574},{.552,.695},{.249,.202},{.474,.720},{.139,.410},{.629,.435},{.470,.729},{.64,.433},{.317,.202},{.472,.707}}},
softloamcavern={[1]={{.404,.415},{.532,.190},{.451,.282},{.349,.137},{.812,.714},{.769,.817},{.419,.483},{.596,.361},{.304,.335},{.704,.817},{.466,.687},{.315,.334},{.384,.627},{.580,.690},{.477,.682},{.544,.257},{.705,.704},{.803,.705},{.649,.552},{.294,.247},{.466,.570},{.424,.492},{.675,.762},{.380,.566},{.441,.280},{.525,.183},{.678,.774},{.553,.258},{.520,.193},{.684,.767},{.697,.704},{.386,.637},{.804,.714},{.656,.552}}},
snaplegcave={[1]={{.220,.262},{.400,.336},{.592,.499},{.299,.600},{.300,.591},{.388,.687},{.317,.549},{.718,.564},{.530,.447},{.860,.711},{.656,.415},{.342,.570},{.798,.753},{.568,.478},{.523,.446},{.354,.571},{.509,.338},{.445,.314},{.508,.353},{.701,.399},{.543,.344},{.571,.463},{.401,.348},{.215,.256},{.206,.381},{.585,.494},{.377,.696},{.590,.507},{.323,.542},{.786,.747},{.603,.381},{.303,.607},{.639,.416},{.599,.496},{.346,.583},{.782,.768},{.518,.44},{.859,.705},{.768,.751},{.606,.370},{.547,.351},{.318,.550},{.541,.446},{.791,.757},{.347,.576}}},
thechillhollow={[1]={{.235,.723},{.585,.582},{.616,.649},{.737,.396},{.685,.622},{.624,.647},{.781,.476},{.731,.753},{.616,.734},{.378,.748},{.369,.319},{.521,.428},{.502,.159},{.282,.396},{.582,.593},{.347,.388},{.409,.768},{.898,.699},{.596,.806},{.840,.779},{.726,.401},{.694,.618},{.562,.532},{.224,.716},{.375,.322},{.278,.391},{.575,.589},{.290,.385},{.721,.742},{.509,.152},{.355,.388},{.605,.740},{.906,.712},{.508,.163},{.905,.698}}},
corpsegarden={[1]={{.482,.669},{.521,.800},{.158,.637},{.386,.562},{.177,.636},{.667,.662},{.480,.444},{.287,.816},{.644,.352},{.526,.782},{.490,.661},{.666,.654},{.129,.542},{.671,.472},{.532,.792},{.164,.631},{.398,.557},{.131,.533},{.530,.801},{.117,.530},{.393,.564},{.170,.639},{.684,.475},{.487,.446},{.389,.570}}},
forgottencrypts={[1]={{.493,.363},{.273,.164},{.487,.889},{.677,.419},{.681,.587},{.525,.494},{.274,.218},{.254,.457},{.706,.594},{.715,.230},{.756,.518},{.488,.170},{.282,.213},{.398,.579},{.505,.660},{.577,.209},{.504,.650},{.603,.616},{.680,.429},{.488,.356},{.675,.382},{.540,.429},{.68,.216},{.702,.283},{.526,.502},{.544,.386},{.689,.747},{.671,.585},{.509,.255},{.550,.160},{.709,.235},{.611,.875},{.254,.473},{.515,.662},{.674,.881},{.279,.173},{.319,.351},{.700,.836},{.707,.268},{.704,.585},{.407,.574},{.556,.661},{.752,.525},{.495,.884},{.556,.168},{.579,.797},{.615,.886},{.254,.464},{.602,.613},{.676,.224},{.557,.651},{.692,.593},{.704,.276},{.619,.873},{.275,.182},{.563,.662},{.626,.879},{.675,.893},{.678,.594},{.545,.414},{.569,.655},{.705,.830}}},
shorsstone={[1]={{.962,.937},{.462,.933},{.791,.283},{.893,.568},{.792,.271}},[2]={{.528,.769},{.899,.758},{.441,.636},{.893,.764},{.262,.317}}},
ui_map_mazzatunint003={[1]={{.468,.934},{.463,.928}}},
stonefalls={[1]={{.769,.32},{.778,.384},{.774,.361},{.934,.470},{.764,.547},{.430,.749},{.791,.537},{.623,.678},{.536,.645},{.414,.439},{.308,.682},{.436,.444},{.741,.401},{.469,.601},{.733,.547},{.294,.423},{.664,.566},{.626,.694},{.305,.671},{.342,.408},{.214,.282},{.291,.395},{.364,.419},{.257,.387},{.867,.425},{.835,.414},{.674,.511},{.125,.443},{.498,.583},{.199,.223},{.152,.490},{.191,.595},{.401,.553},{.331,.566},{.200,.281},{.271,.673},{.381,.743},{.166,.226},{.186,.579},{.797,.620},{.173,.600},{.544,.704},{.772,.351},{.709,.538},{.123,.452},{.855,.433},{.609,.618},{.408,.479},{.785,.586},{.684,.382},{.414,.727},{.228,.666},{.389,.442},{.376,.406},{.808,.608},{.184,.194},{.132,.560},{.220,.388},{.800,.448},{.313,.595},{.367,.573},{.121,.600},{.148,.174},{.216,.376},{.251,.372},{.347,.337},{.519,.625},{.178,.272},{.708,.623},{.753,.444},{.656,.375},{.760,.486},{.342,.570},{.431,.485},{.128,.597},{.142,.592},{.198,.592},{.484,.722},{.379,.375},{.475,.729},{.362,.409},{.442,.469},{.157,.206},{.473,.650},{.626,.581},{.461,.686},{.297,.675},{.114,.507},{.108,.501},{.347,.376},{.164,.369},{.177,.334},{.404,.517},{.500,.532},{.718,.519},{.360,.361},{.209,.359},{.818,.406},{.394,.425},{.577,.571},{.498,.614},{.147,.457},{.103,.475},{.316,.329},{.597,.467},{.297,.639},{.340,.655},{.342,.579},{.643,.549},{.293,.622},{.301,.660},{.301,.633},{.524,.682},{.466,.749},{.567,.668},{.349,.570},{.358,.615},{.338,.718},{.088,.455},{.458,.721},{.435,.552},{.473,.638},{.930,.412},{.735,.524},{.652,.653},{.839,.482},{.796,.483},{.828,.485},{.640,.593},{.638,.380},{.606,.408},{.804,.533},{.745,.626},{.604,.614},{.193,.635},{.526,.533},{.503,.505},{.374,.744},{.207,.657},{.242,.651},{.689,.366},{.939,.357}},[2]={{.502,.541},{.445,.471},{.399,.424},{.329,.346},{.151,.178},{.181,.350},{.285,.582},{.291,.667},{.336,.661},{.517,.603},{.583,.585},{.247,.377},{.553,.357},{.784,.587},{.300,.455},{.135,.588},{.296,.427},{.627,.698},{.662,.675},{.654,.693},{.599,.531},{.700,.364},{.691,.376},{.630,.392},{.722,.352},{.496,.690},{.152,.476},{.485,.690},{.478,.717},{.159,.162},{.177,.581},{.929,.418},{.203,.364},{.778,.553},{.255,.543},{.721,.575},{.249,.233},{.830,.484},{.751,.648},{.819,.411},{.149,.592},{.803,.439},{.350,.507},{.170,.476},{.317,.493},{.824,.476},{.221,.439},{.364,.393},{.247,.456},{.559,.694},{.634,.404},{.502,.437},{.200,.634},{.191,.645}}},
therift={[1]={{.708,.424},{.738,.398},{.580,.609},{.494,.579},{.717,.602},{.664,.612},{.420,.430},{.403,.362},{.251,.271},{.801,.644},{.559,.323},{.546,.359},{.155,.263},{.109,.401},{.507,.431},{.286,.446},{.619,.399},{.123,.243},{.128,.346},{.148,.445},{.339,.476},{.781,.395},{.833,.513},{.798,.570},{.540,.337},{.364,.372},{.379,.355},{.316,.228},{.086,.320},{.151,.477},{.400,.405},{.375,.561},{.349,.439},{.299,.356},{.345,.328},{.582,.282},{.648,.405},{.128,.378},{.481,.470},{.770,.676},{.736,.637},{.672,.377},{.471,.406},{.619,.590},{.738,.681},{.372,.273},{.373,.281},{.263,.315},{.162,.341},{.463,.395},{.743,.691},{.834,.536},{.828,.595},{.809,.632},{.595,.589},{.461,.503},{.608,.387},{.421,.455},{.619,.302},{.279,.340},{.770,.327},{.680,.377},{.12,.276},{.459,.577},{.335,.261},{.698,.567},{.178,.260},{.512,.549},{.48,.536},{.835,.629},{.221,.286},{.618,.521},{.771,.501},{.482,.552},{.231,.243},{.334,.317},{.156,.419},{.537,.536},{.815,.552},{.270,.279},{.785,.407},{.568,.621},{.741,.359},{.112,.337},{.153,.379},{.426,.569},{.166,.359},{.547,.405},{.296,.282},{.191,.372},{.136,.258},{.357,.420},{.467,.355},{.467,.435},{.436,.390},{.439,.398},{.516,.405},{.556,.499},{.343,.358},{.746,.602},{.097,.419},{.216,.246},{.741,.617},{.169,.417},{.200,.424},{.767,.648},{.671,.359},{.183,.451},{.739,.378},{.741,.328},{.691,.587},{.723,.646},{.764,.538},{.751,.665},{.660,.253},{.826,.589},{.477,.491},{.457,.329},{.367,.554},{.399,.549},{.394,.562},{.553,.517},{.789,.685},{.830,.577},{.678,.634},{.805,.464},{.691,.619},{.256,.297},{.114,.465},{.098,.364},{.540,.618},{.712,.635},{.528,.399},{.09,.437},{.542,.530},{.641,.620},{.496,.386},{.716,.572},{.750,.636},{.333,.444},{.838,.523},{.229,.301},{.696,.577},{.555,.397},{.118,.507},{.731,.308},{.221,.340},{.231,.446},{.746,.660},{.103,.530},{.138,.521},{.162,.552}},[2]={{.862,.630},{.595,.544},{.671,.571},{.858,.579},{.558,.613},{.510,.602},{.619,.572},{.474,.557},{.458,.538},{.518,.500},{.364,.474},{.230,.247},{.195,.281},{.835,.635},{.108,.351},{.337,.266},{.431,.546},{.709,.371},{.306,.433},{.403,.435},{.797,.584},{.652,.615},{.522,.327},{.135,.295},{.092,.296},{.105,.318},{.118,.389},{.105,.437},{.181,.479},{.49,.410},{.642,.575},{.812,.498},{.627,.610},{.773,.396},{.706,.665},{.341,.293},{.452,.343},{.593,.301},{.623,.420},{.366,.383},{.646,.368},{.560,.378},{.803,.685},{.458,.289},{.600,.264},{.485,.270},{.561,.303},{.540,.297},{.582,.395},{.417,.408},{.413,.356},{.499,.471},{.082,.273},{.642,.272},{.907,.624},{.685,.515},{.732,.335}}},
windhelm={[1]={{.523,.783},{.216,.681},{.190,.61},{.597,.138},{.788,.123},{.754,.100},{.892,.05},{.216,.768},{.121,.999},{.745,.093},{.745,.101},{.522,.792}},[2]={{.364,.196},{.734,.383},{.882,.171},{.360,.195}}},
blessedcrucible2={[1]={{.513,.422},{.569,.574},{.639,.618},{.525,.386}}},
ui_map_mazzatunint002={[1]={{.494,.638},{.290,.777},{.490,.058},{.547,.845},{.482,.058}}},
arcwindpoint={[1]={{.543,.467},{.177,.573},{.537,.471},{.328,.332},{.792,.811},{.538,.478},{.173,.579},{.338,.328}}},
narsis={[1]={{.331,.205},{.282,.373},{.821,.959},{.965,.465},{.898,.652},{.339,.203}},[2]={{.427,.431},{.433,.437}}},
unexploredcrag={[1]={{.774,.464},{.536,.341},{.468,.238},{.731,.597},{.351,.452},{.673,.704},{.458,.230},{.402,.354},{.534,.351},{.768,.470},{.742,.598},{.198,.338},{.675,.714},{.358,.461},{.209,.343},{.729,.604}}},
avancheznel={[1]={{.257,.481},{.442,.876},{.464,.375},{.537,.807},{.514,.315},{.594,.417},{.817,.544},{.140,.557},{.319,.233},{.927,.613},{.470,.373},{.224,.118},{.178,.532},{.554,.819},{.795,.410},{.137,.579},{.588,.401},{.810,.544},{.460,.172},{.545,.291},{.049,.605},{.541,.819},{.611,.223},{.433,.860},{.241,.709},{.453,.609},{.252,.480},{.450,.379},{.593,.581},{.559,.297},{.560,.286},{.622,.222},{.510,.322},{.471,.359},{.577,.569},{.827,.554},{.451,.176},{.527,.316},{.592,.223},{.428,.865},{.461,.603},{.931,.604},{.185,.541},{.060,.609},{.444,.175},{.327,.234},{.794,.397},{.825,.544},{.572,.402},{.587,.565},{.526,.325},{.233,.708},{.130,.585},{.546,.305},{.438,.876}}},
ui_map_mazzatunint001={[1]={{.225,.369},{.687,.538},{.225,.379},{.677,.547},{.678,.538}}},
direfrostkeep={[1]={{.528,.836},{.280,.394},{.621,.893},{.671,.272},{.733,.510},{.207,.382},{.279,.384},{.54,.167},{.285,.415},{.670,.665},{.678,.137},{.675,.611},{.535,.839},{.555,.833},{.524,.722},{.657,.481},{.700,.257},{.622,.884},{.649,.476},{.654,.472},{.541,.159},{.286,.384}}},
darkshadecaverns={[1]={{.715,.270},{.516,.891},{.517,.865},{.594,.854},{.498,.875},{.485,.853},{.556,.891},{.510,.679},{.417,.744},{.650,.180},{.629,.677},{.433,.797},{.496,.640},{.606,.451},{.642,.563},{.667,.620},{.310,.201},{.724,.716},{.507,.732},{.661,.272},{.426,.530},{.579,.897},{.509,.147},{.647,.206},{.457,.831},{.590,.578}}},
chidmoskaruins={[1]={{.436,.710},{.380,.692},{.775,.535},{.715,.715},{.896,.343},{.379,.716},{.676,.340},{.621,.499},{.429,.713},{.819,.461},{.250,.705},{.693,.472},{.705,.709},{.371,.703},{.675,.340},{.630,.506}}},
ui_cradleofshadowsint_004={[1]={{.357,.517},{.134,.191},{.726,.445},{.452,.659},{.480,.476},{.629,.841},{.621,.843},{.460,.671},{.189,.744},{.343,.524},{.143,.191},{.732,.455},{.144,.175},{.723,.455},{.337,.518},{.618,.836},{.456,.666},{.474,.480},{.146,.183}}},
innerseaarmature={[1]={{.227,.921},{.838,.427},{.178,.917},{.609,.143},{.191,.577},{.521,.535},{.835,.435},{.379,.568},{.222,.734},{.261,.587},{.355,.349},{.614,.236},{.347,.826},{.328,.744},{.612,.528},{.550,.081},{.479,.129},{.465,.249},{.233,.916},{.481,.138},{.457,.245},{.717,.378},{.535,.542},{.610,.152},{.551,.453},{.184,.912},{.622,.229},{.601,.538},{.270,.584},{.596,.531},{.832,.423},{.473,.247},{.224,.915},{.603,.148},{.214,.736},{.596,.150},{.613,.223}}},
crowswood={[1]={{.362,.223},{.430,.290},{.242,.339},{.246,.244},{.522,.905},{.428,.303},{.693,.325},{.359,.386},{.291,.581},{.358,.528},{.754,.479},{.658,.406},{.468,.428},{.185,.68},{.358,.234},{.643,.605},{.518,.375},{.586,.409},{.260,.818},{.848,.629},{.772,.281},{.405,.282},{.663,.178},{.580,.382},{.401,.311},{.307,.763},{.607,.366},{.677,.693},{.646,.391},{.352,.459},{.337,.364},{.535,.124},{.255,.234},{.528,.908},{.372,.384},{.654,.175},{.675,.679},{.264,.810},{.756,.487},{.840,.628},{.410,.288},{.299,.762},{.542,.125}}},
}
local CustomChestData,CustomThievesTrove={},{}
local PoiData={}
local Achievements={
Imperialsewers_aldmeri1={--Cunning Scamp Exterminator and Trove Scamp Exterminator	Provided by art1ink.
[72]={{.846,.653,1270},{.895,.659,1270},{.894,.626,1270},{.815,.655,1270},{.882,.67,1270},{.871,.636,1270},{.701,.513,1270},{.73,.504,1270},{.706,.543,1270},{.718,.554,1270},{.735,.567,1270},{.761,.572,1270},{.774,.568,1270},{.784,.588,1270},{.774,.597,1270},{.756,.59,1270},{.732,.589,1270}},
[73]={{.846,.653,1272},{.895,.659,1272},{.894,.626,1272},{.815,.655,1272},{.882,.67,1272},{.871,.636,1272},{.701,.513,1272},{.73,.504,1272},{.706,.543,1272},{.718,.554,1272},{.735,.567,1272},{.761,.572,1272},{.774,.568,1272},{.784,.588,1272},{.774,.597,1272},{.756,.59,1272},{.732,.589,1272}}},
Imperialsewers_aldmeri2={
[72]={{.846,.653,1270},{.895,.659,1270},{.894,.626,1270},{.815,.655,1270},{.882,.67,1270},{.871,.636,1270},{.701,.513,1270},{.73,.504,1270},{.706,.543,1270},{.718,.554,1270},{.735,.567,1270},{.761,.572,1270},{.774,.568,1270},{.784,.588,1270},{.774,.597,1270},{.756,.59,1270},{.732,.589,1270}},
[73]={{.846,.653,1272},{.895,.659,1272},{.894,.626,1272},{.815,.655,1272},{.882,.67,1272},{.871,.636,1272},{.701,.513,1272},{.73,.504,1272},{.706,.543,1272},{.718,.554,1272},{.735,.567,1272},{.761,.572,1272},{.774,.568,1272},{.784,.588,1272},{.774,.597,1272},{.756,.59,1272},{.732,.589,1272}}},
Imperialsewers_aldmeri3={
[72]={{.846,.653,1270},{.895,.659,1270},{.894,.626,1270},{.815,.655,1270},{.882,.67,1270},{.871,.636,1270},{.701,.513,1270},{.73,.504,1270},{.706,.543,1270},{.718,.554,1270},{.735,.567,1270},{.761,.572,1270},{.774,.568,1270},{.784,.588,1270},{.774,.597,1270},{.756,.59,1270},{.732,.589,1270}},
[73]={{.846,.653,1272},{.895,.659,1272},{.894,.626,1272},{.815,.655,1272},{.882,.67,1272},{.871,.636,1272},{.701,.513,1272},{.73,.504,1272},{.706,.543,1272},{.718,.554,1272},{.735,.567,1272},{.761,.572,1272},{.774,.568,1272},{.784,.588,1272},{.774,.597,1272},{.756,.59,1272},{.732,.589,1272}}},
Imperialsewers_ebon1={
[72]={{.492,.252,1270},{.444,.323,1270},{.489,.316,1270},{.443,.35,1270},{.466,.421,1270},{.44,.413,1270},{.413,.377,1270},{.385,.376,1270}},
[73]={{.492,.252,1272},{.444,.323,1272},{.489,.316,1272},{.443,.35,1272},{.466,.421,1272},{.44,.413,1272},{.413,.377,1272},{.385,.376,1272}}},
Imperialsewers_ebon2={
[72]={{.492,.252,1270},{.444,.323,1270},{.489,.316,1270},{.443,.35,1270},{.466,.421,1270},{.44,.413,1270},{.413,.377,1270},{.385,.376,1270}},
[73]={{.492,.252,1272},{.444,.323,1272},{.489,.316,1272},{.443,.35,1272},{.466,.421,1272},{.44,.413,1272},{.413,.377,1272},{.385,.376,1272}}},
Imperialsewer_ebonheart3={
[72]={{.492,.252,1270},{.444,.323,1270},{.489,.316,1270},{.443,.35,1270},{.466,.421,1270},{.44,.413,1270},{.413,.377,1270},{.385,.376,1270}},
[73]={{.492,.252,1272},{.444,.323,1272},{.489,.316,1272},{.443,.35,1272},{.466,.421,1272},{.44,.413,1272},{.413,.377,1272},{.385,.376,1272}}},
Imperialsewer_daggerfall1={
[72]={{.111,.623,1270},{.147,.598,1270},{.142,.617,1270},{.167,.595,1270},{.193,.595,1270},{.221,.678,1270},{.186,.653,1270},{.284,.52,1270},{.275,.556,1270},{.335,.564,1270},{.328,.532,1270},{.332,.51,1270}},
[73]={{.111,.623,1272},{.147,.598,1272},{.142,.617,1272},{.167,.595,1272},{.193,.595,1272},{.221,.678,1272},{.186,.653,1272},{.284,.52,1272},{.275,.556,1272},{.335,.564,1272},{.328,.532,1272},{.332,.51,1272}}},
Imperialsewer_daggerfall2={
[72]={{.111,.623,1270},{.147,.598,1270},{.142,.617,1270},{.167,.595,1270},{.193,.595,1270},{.221,.678,1270},{.186,.653,1270},{.284,.52,1270},{.275,.556,1270},{.335,.564,1270},{.328,.532,1270},{.332,.51,1270}},
[73]={{.111,.623,1272},{.147,.598,1272},{.142,.617,1272},{.167,.595,1272},{.193,.595,1272},{.221,.678,1272},{.186,.653,1272},{.284,.52,1272},{.275,.556,1272},{.335,.564,1272},{.328,.532,1272},{.332,.51,1272}}},
Imperialsewer_daggerfall3={
[72]={{.111,.623,1270},{.147,.598,1270},{.142,.617,1270},{.167,.595,1270},{.193,.595,1270},{.221,.678,1270},{.186,.653,1270},{.284,.52,1270},{.275,.556,1270},{.335,.564,1270},{.328,.532,1270},{.332,.51,1270}},
[73]={{.111,.623,1272},{.147,.598,1272},{.142,.617,1272},{.167,.595,1272},{.193,.595,1272},{.221,.678,1272},{.186,.653,1272},{.284,.52,1272},{.275,.556,1272},{.335,.564,1272},{.328,.532,1272},{.332,.51,1272}}},
craglorn={
[26]={{.398,.516,3},{.24,.503,3},{.753,.615,3},{.727,.588,3},{.497,.487,3},{.688,.58,3},{.669,.57,3},{.74,.453,3},{.227,.59,3},{.259,.59,3},{.308,.62,3},{.906,.724,3},{.877,.699,3},{.474,.627,3},{.328,.549,3},{.76,.503,3},{.569,.444,3},{.482,.55,3},{.309,.361,3},{.38,.667,3},{.402,.442,3},{.274,.29,3},{.518,.393,3},{.556,.461,3}},--Celestial Rift
},
u32deadlandszone={
[26]={{.874,.464,1},{.498,.666,1},{.545,.571,1},{.68,.417,1},{.771,.41,1},{.773,.339,1},{.681,.304,1},{.457,.556,1},{.326,.527,1},{.394,.515,1},{.29,.576,1},{.249,.725,1},{.35,.687,1},{.492,.593,1},{.568,.328,1},{.55,.444,1},{.193,.561,1},{.78,.254,1}},--Oblivon portals. Provided by art1ink
[62]={{.812,.422,436}},--Ironclad Sarcoshroud
},
u38_telvannipeninsula={
[62]={--Telvanni Alchemy Station
{.464,.677,615,1},--Volcan Sand Bath
{.364,.341,616,2},--Enchanted Mixing Stone
{.273,.452,617,3},--Reagent Drying Rack
{.444,.473,618,4},--Lustrous Metal Funnel
{.419,.306,619,5},--Sturdy Crucible
{.528,.66,620,6},--Igneous Mortar and Pestle
{.413,.81,621,7},--Glass Desiccator
{.225,.549,622,8},--Tempered Brass Report
{.436,.501,623,9},--Malachite Burette and Stand
{.539,.542,624,10}},--Vacuum Filtration Apparatus
[80]={--Grave Discoveries
{.223,.551,3675,1},--Sunvys Golsathyn Gravestone
{.459,.692,3675,2},--Savienie Mavlyn Gravestone
{.487,.501,3675,3},--Elovus Alarndil Gravestone
{.438,.339,3675,4},--Favami Seravel Gravestone
{.712,.519,3675,5},--Triys RehAlo Gravestone
{.382,.439,3675,6},--Dayldela Gilrom Gravestone
{.347,.816,3675,7}},--Aralos Sarvrothi Gravestone
},
tlv_aldisra={[62]={{.72,.24,617,3}}},--Reagent Drying Rack (Telvanni Alchemy Station)
u38_apocrypha={--Necrom
[78]={--Syzygy
{.888,.596,3678,1},--Aberrant Hushed 1
{.737,.637,3678,2},--Aberrant Hushed 2
{.764,.766,3678,3},--Aberrant Hushed 3
{.49,.699,3678,4},--Aberrant Hushed 4
{.588,.662,3678,5}},--Final Rite (Carry out a ritual Syzygial Rostrum)
[79]={--Tomes of Uknown Color
{.417,.385,3677,1},--Find Spectral Book 1
{.276,.405,3677,2},--Find Spectral Book 2
{.264,.468,3677,3},--Find Spectral Book 3
{.158,.228,3677,4},--Find Spectral Book 4
{.372,.246,3677,5}},--Find Spectral Book 5
[81]={{.479,.301,3749}},--Slaughtered by Tentacles
},
u34_systreszone={--High Isle & Amenos
[26]={{.129,.629,5},{.233,.759,5},{.249,.596,5},{.256,.485,5},{.269,.865,5},{.308,.439,5},{.424,.788,5},{.426,.437,5},{.434,.851,5},{.452,.657,5},{.493,.517,5},{.560,.629,5},{.580,.739,5},{.619,.339,5},{.745,.422,5},{.746,.336,5},{.789,.265,5},{.835,.304,5},{.835,.385,5},},--Lava Lasher
[62]={--Antiquity leads provided by Kelinmiriel for remosito
{.394,.399,507},--Ancient Cleaning Tools (Blending Broomstick)
{.549,.606,505},--Blazing Stones (Woodfire Chamber)
{.767,.412,499},--Clay Pot (Painted Elk Clay Pot)
{.228,.781,504},--Damaged Woven Strainer (Woven Straining Bowl)
{.712,.282,509},--Druidic Arrows (Nighthunter's Cowl)
{.483,.632,506},--Druidic Butcher Knife (Preparation Surface)
{.214,.509,503},--Olden Breton Teapot (Druidic Kettle Spout)
{.663,.229,501},--Rusty Food Handling Tongs (Cracked Stone Grill Tray)
{.288,.887,508},--Stained Water Jug (Clay Cooling Pitcher)
{.678,.390,500},--Textured Bowl (Druidic Pestle)
{.356,.628,502}},--Time-Worn Stone (Smoothed Stone Grinder)
[74]={--Seeker of the Green
{.18,.529,3298,1},--Druid Shrine near Jheury's Cove
{.409,.56,3298,2},--Druid Shrine near Albatross Leap
{.422,.764,3298,3},--Druid Shrine near Y'ffre's Cauldron
{.539,.588,3298,4},--Druid Shrine near Duford Shipyards
{.704,.368,3298,5}},--Druid Shrine near Banished Refuge
[75]={{.448,.593,3424}},--No Regrets
[76]={--Inventor of Adventur
{.566,.653,3299},
{.211,.734,3299},
{.433,.606,3299},
{.846,.247,3299}},
[77]={{.504,.838,3295}},--Gonfalon Bay's Master Burglar
},
u34_gonfalonbaycity={
[77]={{.233,.42,3295}},--Gonfalon Bay's Master Burglar
},
blackwood={
[26]={{.373,.179,1},{.418,.317,1},{.144,.592,1},{.267,.314,1},{.385,.507,1},{.448,.617,1},{.184,.428,1},{.737,.369,1},{.644,.36,1},{.313,.616,1},{.252,.355,1},{.654,.54,1},{.747,.83,1},{.612,.442,1},{.605,.23,1},{.636,.71,1},{.533,.79,1},{.515,.26,1},{.47,.528,1},{.26,.516,1}},--Oblivon portals. Provided by art1ink
[62]={--Provided by remosito
{.7,.9,	374},--Bog Blight Funerary Mask
{.6,.79,	401},--Soiled Tapestry
{.64,.8,	403},--Stained Tapestry
{.583,.855,	404},--Torn Tapestry
{.307,.576,	405},--Tattered Tapestry
{.664,.675,	406},--Threadbare Tapestry
{.317,.7,	407},--Ragged Tapestry
{.812,.634,	408},--Ripped Tapestry
{.58,.63,	409},--Grimy Tapestry
{.816,.793,	410},--Dusty Tapestry
{.374,.677,	411},--Filthy Tapestry
{.566,.453, 412},--Holey Tapestry
{.49,.755,	413},--Niss'wo Sacramental Wraps
{.171,.474,	414},--Moth-Eaten Tapestry
{.207,.457,	415}},--Ratty Tapestry
[63]={{.378,.536,3083},--Lost in the Wilds
	{.15,.581,3083,2},{.172,.539,3083,2},{.182,.518,3083,2},--Fialdar the Vicious
	{.526,.465,3083,3},{.569,.487,3083,3},{.598,.489,3083,3},--Vasha the Wicked
	{.683,.832,3083,4},{.709,.818,3083,4},{.738,.808,3083,4},--Bingham the Quick
	},
[64]={{.617,.905,3081,3},{.763,.773,3081,4}},--Bane of the Sul-Xan
[65]={{.24,.614,3082},{.21,.441,3082},{.361,.207,3082},{.362,.344,3082},{.391,.552,3082},{.532,.688,3082},{.643,.749,3082},{.603,.579,3082},{.683,.514,3082},{.638,.308,3082}},--Most Admired	Provided by art1ink
[66]={{.643,.749},{.683,.514},{.362,.344},{.21,.441},{.442,.293},{.361,.207},{.638,.308},{.391,.552},{.603,.579},{.614,.24}},--Random encounters. Provided by Lerozain
},
u30_oblivion_portal_boss={[63]={{.351,.381,3083,5}}},--Precious Treasure
u30_xanmeeroverlook_int={[64]={{.841,.648,3081,1}}},--Delve Name: Xi-Tsei (Bane of the Sul-Xan)
u30_silenthalls_int02={[64]={{.285,.48,3081,2}}},--Totem in the Silent Halls (Bane of the Sul-Xan)
bw_easterntunnel={[62]={{.305,.36,402}}},--Frayed Tapestry
rkulftzel={[62]={{.481,.652,60}}},--Dwarven Spine-Coupling
theearthforgepublic={[62]={{.256,.384,72}}},--Dwarven Breastguard
solitudecity={[62]={--Provided by remosito
{.796,.675,104},--Companion's Coronet
{.649,.536,310},--Al-Esh Ascension Coin
}},
morthalburialcave={[62]={{.383,.258,105}}},--Ysgramor's Chosen Body Marking
nighthollowkeep1={[62]={{.409,.381,335}}},--Pale Order's Golden Band
U28_blackreach={[62]={{.251,.695,352}}},--Arkthzand Insight Vertex Shroud
u30_leyawiincity={[67]={{.711,.503,3080}}},--Leyawiin's Master Burglar
--[[
reach={--Provided by Aquifolius
[60]={{.817,.76,2964}},	--Red Eagle's Flight	|H1:achievement:2927:1:1631279175|h|h
[61]={	--Подношения древним духам
{.556,.571,2964},	--Ритуальный камень в лагере Пепельных Сердец
{.665,.701,2964},	--Ритуальный камень в лагере Тёмных Перьев
{.462,.432,2964},	--Ритуальный камень в лагере Дикого Копья
{.384,.277,2964},	--Ритуальный камень в лагере Чёрной Луны
}},
--]]
--Instrumental Triumph
nchuthnkarst={[59]={{.859,.555,2669,2}}},--Lute 156666
shadowgreen_upper={[59]={{.863,.495,2669,4}}},--Tenderclaw 156798
dragonhome={[59]={{.663,.706,2669,5}}},--Shadow of Rahjin 156799
chillwinddepths={[59]={{.953,.497,2669,6}}},--Lilytongue 156800
labyrinthian={[59]={{.602,.558,2669,7}}},--Sky talker 156801
thescraps={[59]={{.602,.307,2669,9}}},--Hightmourn Dizi 156803
blackreach={
[59]={
{.586,.243,2669,3},	--Chime of the Endless 156797
{.919,.455,2669,13},	--Pan Flute of Morachellis 156807
{.502,.358,2669,14},	--Reman War Drum 156808
{.275,.674,2669,15}},	--Ateian Fife 160510
[68]={--Mining Sample Collector
{.482,.781,2759,1},--Kelbarn's Mining Samples	7373
{.073,.413,2759,2},--Inguya's Mining Samples	7375
{.622,.303,2759,3},--Reeh-La's Mining Samples	7377
{.896,.338,2759,4},--Adanzda's Mining Samples	7385
{.418,.666,2759,5}},--Ghamborz's Mining Samples	7379
},
westernskryim={
[59]={	--Provided by Aquifolius
{.379,.505,2669,8},	--Long Fire 156802
{.528,.225,2669,10},	--Jarlsbane 156804
{.148,.496,2669,11},	--King Thunder 156805
{.354,.285,2669,12},	--Jahar Fuso'ja 156806
{.657,.591,2669,16},	--Shiek-of-Silk 160511
{.674,.411,2669,17},	--Kothringi Leviathan Bugle 160512
{.354,.664,2669,18},	--Lodestone 160514
{.603,.667,2669,19}},	--Dozzen Talharpa 160515
[62]={{.377,.513,106}},--Ysgramor's Chosen Face Marking
},
senchal={
[55]={{.512,.83,2534,9},{.549,.807,2534,12}},
[56]={{.529,.187,2619,1}},
},
senchaloutlawrefuge={[55]={{.559,.668,2534,9}}},
houseofembersoutside={
[55]={{.502,.16,2534,7}},
[56]={{.783,.393,2619,8}},
},
moonlitcove01={[55]={{.423,.847,2534,3}},[56]={{.685,.613,2619,2}}},moonlitcove02={[55]={{.423,.847,2534,3}},[56]={{.685,.613,2619,2}}},moonlitcove05={[55]={{.423,.847,2534,3}},[56]={{.685,.613,2619,2}}},
southernelsweyr={
[55]={{.445,.359,2534,1},{.187,.377,2534,2},{.698,.744,2534,4},{.375,.256,2534,5},{.525,.216,2534,6},{.514,.271,2534,7},{.546,.594,2534,8},{.5,.578,2534,9},{.301,.684,2534,10},{.419,.463,2534,11},{.507,.575,2534,12}},
[56]={{.504,.452,2619,1},{.152,.609,2619,2},{.214,.482,2619,3},{.544,.189,2619,4},{.216,.302,2619,5},{.731,.733,2619,6},{.473,.727,2619,7},{.536,.285,2619,8},{.296,.691,2619,9},{.42,.225,2619,10}},
[57]={{.342,.296,2621,1},{.183,.651,2621,2},{.573,.527,2621,3},{.544,.249,2621,4}},
[58]={{.319,.46,2620}},
},
--elsweyr={[33]={{.572,.262,0},{.28,.738,0},}},	--M'aiq
orcrest_Base_0={[54]={{.326,.408,2463,11}}},orcrest2_Base_0={[54]={{.323,.412,2463,11}}},RimmenNecropolis_Base_0={[54]={{.084,.715,2463,3}}},
elsweyr={[54]={{.384,.216,2463,2},{.703,.378,2463,3},{.8,.343,2463,4},{.444,.252,2463,5},{.288,.4,2463,6},{.332,.344,2463,7},{.297,.72,2463,8},{.642,.375,2463,9},{.487,.395,2463,10},{.483,.484,2463,11},{.605,.486,2463,12},{.337,.567,2463,13},{.63,.592,2463,14},{.59,.692,2463,15},{.2,.6,2463,16}}},
abodeofignominy={[54]={{.689,.28,2463,2}}},
orcrest_Base_0={[54]={{.327,.409,2463,11}}},
thetangle={[54]={{.442,.521,2463,14}}},
rimmennecropolis_Base_0={[54]={{.085,.716,2463,3}}},
predatorrise={[54]={{.592,.38,2463,6}}},
murkmire={
[48]={
{.391,.557,2320,1},--Vakka Tablet (Swallows-the-Sun)
{.753,.347,2320,2},--Xeech Tablet
{.544,.271,2320,3},--Sisei Tablet
{.541,.787,2320,4},--Hist-Deek Tablet
{.349,.256,2320,5},--Hist-Dooka Tablet
{.266,.583,2320,6},--Hist-Tsoko Tablet
{.878,.802,2320,7},--Thtithil-Gah Tablet
{.66,.67,2320,8},--Thtithil Tablet
{.704,.34,2320,9},--Nushmeeko Tablet
{.147,.303,2320,10},--Shaja-Nushmeeko Tablet
{.461,.419,2320,11},--Saxhleel Tablet (Roots-That-Stumble)
{.722,.279,2320,12}},--Xulomaht Tablet (Break-Like-Decat)
[49]={{.745,.291,2341,1},{.395,.304,2341,2},{.77,.726,2341,3},{.755,.554,2341,4},{.191,.436,2341,5},},
[50]={{.855,.605,2355},{.703,.603,2355,2},{.275,.438,2355,3}},
[51]={{.318,.514,2330},{.426,.597,2330},{.4,.428,2330},{.518,.424,2330},{.65,.629,2330},{.631,.717,2330},{.499,.633,2330},{.352,.382,2330},{.704,.458,2330},{.418,.404,2330}},
[52]={{.327,.373,2358},{.75,.646,2358},{.92,.802,2358},{.741,.45,2358},{.578,.598,2358},{.382,.527,2358},{.442,.464,2358}},
[53]={{.864,.635,2357,1},{.556,.306,2357,2},{.444,.501,2357,3},{.219,.631,2357,4}},
},
deadwatervillage={[49]={{.289,.811,2341,5}}},
echoinghollow={[48]={{.772,.742,2320,5}}},--Hist-Dooka Tablet
withervault={[48]={{.291,.299,2320,9}}},--Nushmeeko Tablet
lilmothcity={
[48]={{.793,.556,2320,7}},--Thtithil-Gah Tablet
[49]={{.39,.272,2341,3}},
[52]={{.951,.558,2358,3}}},	--[50]={{.473,.455,2333}},
brightthroatvillage={[49]={{.749,.497,2341,4},}},
teethofsithis02b={[53]={{.603,.327,2357,6}}},
UI_Map_tsofeercavern01_0={[53]={{.624,.394,2357,5}}},
vivecstolms03={[30]={{.748,.351,1824,35}}},
viviccity={
[30]={{.215,.447,1824,10},{.570,.444,1824,35}},
[44]={{.481,.579,1827,2},{.522,.538,1827,3},{.501,.679,1827,4}},
},
balmora={
[30]={{.613,.510,1824,36},{.232,.190,1824,25}},
},
sadrithmora={[30]={{.696,.477,1824,7}}},
vvardenfell={
[30]={{.303,.360,1824,31},{.254,.506,1824,13},{.556,.754,1824,22},{.484,.735,1824,32},{.562,.772,1824,6},{.376,.716,1824,33},{.516,.785,1824,11},{.600,.773,1824,4},{.777,.908,1824,5},{.766,.764,1824,28},{.641,.468,1824,14},{.436,.724,1824,21},{.321,.712,1824,12},{.792,.760,1824,18},{.832,.712,1824,20},{.863,.699,1824,29},{.890,.578,1824,27},{.768,.475,1824,19},{.686,.417,1824,34},{.405,.828,1824,1},{.689,.293,1824,8},{.727,.278,1824,17},{.361,.237,1824,15},{.232,.293,1824,3},{.197,.361,1824,2},{.267,.545,1824,30},{.409,.536,1824,16},{.472,.879,1824,10},{.737,.378,1824,9},{.565,.816,1824,24},{.511,.652,1824,23},{.657,.617,1824,26},{.871,.507,1824,7},{.364,.621,1824,25},{.534,.878,1824,35},{.400,.652,1824,36}},
[31]={{.245,.251,1712,1},{.163,.313,1712,2},{.246,.322,1712,3},{.291,.441,1712,4},{.292,.501,1712,5},{.363,.593,1712,6},{.328,.612,1712,7},{.362,.665,1712,8},{.297,.739,1712,9},{.387,.753,1712,10},{.363,.808,1712,11},{.478,.687,1712,12},{.483,.805,1712,13},{.605,.638,1712,14},{.634,.773,1712,15},{.650,.809,1712,16},{.697,.773,1712,17},{.737,.806,1712,18},{.773,.925,1712,19},{.863,.742,1712,20},{.709,.628,1712,21},{.842,.652,1712,22},{.617,.576,1712,23},{.726,.581,1712,24},{.858,.610,1712,25},{.674,.453,1712,26},{.826,.478,1712,27},{.647,.354,1712,28},{.630,.295,1712,29},{.611,.259,1712,30}},
[44]={{.473,.704,1827,1},{.198,.363,1827,5},{.198,.398,1827,6},{.686,.713,1827,7}},
},
abahslanding={
[39]={{.338,.884,1349,5},{.338,.549,1349,2},{.369,.369,1349,3},{.463,.742,1349,7},{.518,.288,1349,6},{.531,.582,1349,1},{.570,.312,1349,4}},
[32]={{.538,.410,1382,1}}
},
alikr={
[26]={{.105,.517,2},{.323,.557,2},{.377,.627,2},{.391,.693,2},{.433,.692,2},{.475,.594,2},{.514,.419,2},{.528,.470,2},{.533,.529,2},{.569,.613,2},{.59,.343,2},{.701,.398,2},{.709,.515,2},{.757,.486,2}},
[34]={{.148,.482},{.289,.546},{.660,.520},{.783,.428},{.550,.580}},
[45]={{.246,.460,704,10}},
[32]={{.251,.458,1380,4}},
[33]={{.442,.473,872,17},{.478,.381,872,17},{.833,.581,872,17}},
},
arenthia={[34]={{.152,.535}}},
argentmine2={[38]={{.802,.604,1250,14}}},
auridon={
[26]={{.212,.260,2},{.358,.271,2},{.410,.681,2},{.417,.184,2},{.522,.418,2},{.525,.801,2},{.575,.333,2},{.583,.433,2},{.615,.843,2},{.559,.464,2}},
[34]={{.330,.392},{.363,.228},{.412,.213},{.522,.674},{.565,.447},{.569,.764},{.585,.538}},
[33]={{.421,.333,872,2},{.434,.510,872,2},{.550,.790,872,2},{.706,.767,872,2}},
[45]={{.601,.944,704,3}},
[32]={{.707,.509,1379,1}},
},
balfoyen={[33]={{.242,.673,872,7},{.382,.641,872,7}}},
bangkorai={
[26]={{.203,.348,2},{.279,.874,2},{.292,.712,2},{.328,.552,2},{.329,.650,2},{.345,.759,2},{.353,.85,2},{.364,.404,2},{.375,.255,2},{.450,.211,2},{.461,.828,2},{.488,.154,2},{.490,.498,2},{.494,.4,2},{.518,.526,2},{.588,.118,2},{.667,.202,2}},
[32]={{.391,.347,1380,5}},
[33]={{.310,.712,872,18},{.573,.218,872,18},{.604,.531,872,18},{.671,.680,872,18}},
[34]={{.343,.747},{.672,.220},{.478,.517},{.656,.685}},
[45]={{.399,.340,704,13}},
},
betnihk={[33]={{.286,.277,872,13},{.537,.647,872,13}}},
coldharbour={[33]={{.439,.751,872,19},{.468,.407,872,19},{.554,.408,872,19},{.682,.644,872,19}},[45]={{.507,.700,704,16}}},
coldperchcavern={[38]={{.159,.701,1250,15}}},
daggerfall={[32]={{.302,.514,1380,1}},[45]={{.508,.293,704,1}}},
davonswatch={[34]={{.655,.782}},[45]={{.798,.480,704,2}}},
deshaan={
[26]={{.227,.609,2},{.131,.466,2},{.626,.547,2},{.228,.496,2},{.228,.609,2},{.551,.463,2},{.449,.405,2},{.823,.391,2},{.118,.517,2},{.259,.544,2},{.132,.504,2},{.79,.545,2},{.634,.532,2},{.602,.49,2},{.164,.381,2},{.517,.464,2},{.674,.635,2},{.829,.447,2},{.776,.582,2},{.749,.612,2}},--Dark Fissures	Provided by art1ink
[32]={{.454,.524,1381,2}},	
[33]={{.570,.502,872,9},{.679,.544,872,9},{.908,.547,872,9},{.413,.398,872,9}},
[34]={{.158,.391},{.227,.511},{.384,.604},{.720,.406},{.803,.530}},
[45]={{.404,.549,704,5}},
},
eastmarch={
[26]={{.358,.3136,2},{.309,.573,2},{.524,.316,2},{.52,.364,2},{.555,.24,2},{.387,.38,2},{.358,.313,2},{.424,.316,2},{.725,.649,2},{.644,.643,2},{.21,.599,2},{.228,.633,2},{.536,.616,2},{.588,.579,2}},
[33]={{.417,.655,872,11},{.553,.229,872,11},{.575,.513,872,11}},
[34]={{.492,.348},{.512,.496},{.613,.618},{.333,.570},{.416,.331}},
[32]={{.497,.285,1381,4}},
[45]={{.508,.293,704,11}},
},
eldenrootgroundfloor={[34]={{.222,.870}},[32]={{.374,.809,1379,2}},[45]={{.558,.681,704,6}},[40]={{.725,.772,716,1}}},
evermore={[32]={{.383,.434,1380,5}},[45]={{.428,.393,704,13}}},
fortamol={
[26]={{.748,.039,2},{.088,.528,2}},
[34]={{.947,-.004}},
},
glenumbra={
[26]={{.224,.522,2},{.310,.653,2},{.327,.335,2},{.358,.708,2},{.376,.793,2},{.406,.521,2},{.421,.370,2},{.506,.727,2},{.539,.646,2},{.550,.216,2},{.619,.222,2},{.782,.334,2}},
[32]={{.238,.769,1380,1}},
[33]={{.256,.466,872,14},{.780,.394,872,14},{.364,.847,872,14},{.573,.322,872,14}},
[45]={{.280,.723,704,1}},
[34]={{.361,.368},{.362,.744},{.460,.618},{.576,.374},{.635,.487},{.761,.245}},
},
grahtwood={
[26]={{.242,.183,2},{.331,.533,2},{.367,.256,2},{.403,.685,2},{.352,.523,2},{.425,.255,2},{.454,.792,2},{.501,.361,2},{.576,.748,2},{.591,.334,2},{.595,.284,2},{.661,.682,2},{.711,.543,2},{.466,.399,2}},--Dark Fissures
[32]={{.537,.566,1379,2}},
[34]={{.253,.167},{.329,.392},{.504,.580},{.597,.261},{.653,.619}},
[33]={{.278,.334,872,3},{.411,.252,872,3},{.451,.251,872,3},{.657,.696,872,3}},
[40]={{.316,.229,716,1},{.686,.644,716,1},{.531,.718,716,1},{.614,.558,716,1},{.650,.723,716,1},{.581,.325,716,1},{.589,.402,716,1}},
[45]={{.577,.538,704,6}},
},
greenshade={
[26]={{.267,.165,2},{.355,.671,2},{.358,.178,2},{.435,.275,2},{.444,.71,2},{.451,.419,2},{.472,.295,2},{.584,.653,2},{.621,.901,2},{.633,.658,2},{.665,.750,2}},
[33]={{.124,.527,872,4},{.628,.885,872,4},{.632,.344,872,4}},
[34]={{.203,.645},{.289,.671},{.382,.496},{.412,.248},{.625,.346},{.652,.810}},
[32]={{.669,.503,1379,3}},
[45]={{.704,.508,704,9}},
},
hallinsstand={[33]={{.715,.317,872,1}},[34]={{.869,.475}}},
hewsbane={
[39]={{.598,.572,1349,5},{.599,.453,1349,2},{.610,.389,1349,3},{.643,.522,1349,7},{.663,.361,1349,6},{.667,.465,1349,1},{.681,.369,1349,4}},
[32]={{.669,.404,1382,1}},
},
hollowcity={[45]={{.612,.673,704,16}}},
honorsrestleft={[38]={{.100,.475,1250,9}}},
khenarthisroost={[33]={{.332,.306,872,1},{.814,.483,872,1}}},
kozanset={[34]={{.726,.268}}},
kragenmoor={[32]={{.688,.465,1381,1}}},
malabaltor={
[26]={{.277,.610,2},{.278,.476,2},{.351,.574,2},{.358,.389,2},{.519,.671,2},{.587,.710,2},{.623,.864,2},{.637,.684,2},{.727,.357,2},{.792,.235,2},{.804,.282,2},{.811,.253,2}},
[45]={{.083,.582,704,12}},
[32]={{.094,.486,1379,4}},
[33]={{.192,.587,872,5},{.436,.586,872,5},{.617,.242,872,5},{.802,.506,872,5}},
[34]={{.568,.660},{.582,.407},{.845,.260},{.657,.805},{.306,.569}},
},
marbruk={[32]={{.273,.324,1379,3}},[45]={{.505,.356,704,9}}},
mournhold={[45]={{.312,.673,704,5}},[32]={{.550,.549,1381,2}}},
nimalten={[34]={{.304,.702}}},
northpoint={[33]={{.856,.877,872,1}}},
orsinium={[37]={{.015,.398,1316,1}},[38]={{.369,.626,1250,11},{.369,.626,1250,12},{.825,.345,1250,19}}},
rawlkha={[45]={{.620,.289,704,15}},[32]={{.698,.364,1379,5}}},
reapersmarch={
[26]={{.259,.326,2},{.774,.299,2},{.727,.149,2},{.419,.64,2},{.461,.793,2},{.320,.756,2},{.377,.634,2},{.411,.573,2},{.39,.491,2},{.317,.343,2},{.474,.279,2},{.374,.230,2},{.652,.433,2},{.718,.286,2},{.729,.234,2}},--Dark Fissures
[34]={{.333,.748},{.507,.157},{.518,.601},{.741,.291},{.770,.216}},
[33]={{.369,.731,872,6},{.372,.244,872,6},{.509,.341,872,6},{.484,.467,872,6}},
[45]={{.477,.523,704,7}},
[32]={{.487,.532,1379,5}},
},
riften={[45]={{.541,.477,704,14}},[32]={{.548,.853,1381,5}}},
rivenspire={
[26]={{.331,.634,2},{.348,.533,2},{.423,.628,2},{.439,.697,2},{.527,.246,2},{.577,.502,2},{.609,.2,2},{.615,.591,2},{.625,.491,2},{.645,.471,2},{.647,.660,2},{.670,.672,2},{.718,.198,2},{.718,.331,2},{.750,.298,2},{.832,.32,2}},
[45]={{.421,.578,704,15}},
[32]={{.467,.589,1380,3}},
[33]={{.480,.709,872,16},{.503,.242,872,16},{.601,.631,872,16},{.850,.272,872,16}},
[34]={{.616,.620},{.617,.187},{.714,.181},{.427,.600},{.502,.680}},
},
sentinel={[45]={{.383,.499,704,10}},[32]={{.405,.492,1380,4}},[34]={{.589,.919}}},
shadowfen={
[26]={{.58,.304,2},{.261,.810,2},{.382,.226,2},{.395,.827,2},{.602,.256,2},{.607,.485,2},{.700,.811,2}},
[33]={{.127,.722,872,10},{.333,.166,872,10},{.618,.703,872,10},{.803,.640,872,10}},
[34]={{.346,.594},{.382,.363},{.626,.461},{.683,.724},{.570,.634}},
[45]={{.428,.239,704,8}},
[32]={{.459,.266,1381,3}},
},
shornhelm={[45]={{.454,.648,704,7}},[32]={{.750,.717,1380,3}}},
skywatch={[32]={{.639,.495,1379,1}}},
stonefalls={
[26]={{.121,.442,2},{.163,.560,2},{.211,.190,2},{.301,.651,2},{.341,.682,2},{.352,.548,2},{.377,.729,2},{.428,.561,2},{.439,.746,2},{.475,.605,2},{.482,.712,2},{.719,.613,2},{.761,.369,2},{.795,.427,2},{.812,.380,2}},
[34]={{.119,.452},{.325,.639},{.447,.559},{.581,.576},{.661,.613},{.891,.400}},
[32]={{.254,.626,1381,1}},
[33]={{.394,.462,872,8},{.484,.723,872,8},{.491,.620,872,8},{.946,.432,872,8}},
[45]={{.918,.339,704,2}},
},
stormhaven={
[26]={{.719,.53,2},{.408,.499,2},{.252,.283,2},{.475,.594,2},{.722,.426,2},{.579,.45,2},{.481,.397,2},{.705,.477,2},{.856,.486,2},{.353,.575,2},{.364,.384,2},{.376,.562,2},{.220,.522,2},{.272,.441,2},{.226,.283,2}},
[34]={{.221,.252},{.718,.470},{.851,.495},{.372,.573},{.422,.427}},
[33]={{.327,.674,872,15},{.412,.378,872,15},{.636,.606,872,15},{.880,.469,872,15}},
[45]={{.486,.600,704,4}},
[32]={{.577,.598,1380,2}},
},
stormhold={[45]={{.340,.284,704,8}},[32]={{.539,.455,1381,3}}},
therift={
[26]={{.698,.601,2},{.36,.436,2},{.617,.59,2},{.571,.292,2},{.085,.309,2},{.161,.272,2},{.345,.357,2},{.542,.307,2},{.657,.369,2},{.532,.613,2},{.740,.630,2},{.768,.686,2},{.158,.401,2},{.138,.469,2},{.502,.538,2}},
[34]={{.145,.366},{.207,.429},{.350,.474},{.508,.566},{.595,.332}},
[33]={{.478,.465,872,12},{.493,.360,872,12},{.712,.671,872,12},{.740,.632,872,12}},
[45]={{.682,.486,704,14}},
[32]={{.683,.539,1381,5}},
},
thukozods={[38]={{.262,.511,1250,13}}},
velynharbor={[45]={{.336,.813,704,12}},[32]={{.383,.395,1379,4}}},
vulkhelguard={[45]={{.390,.651,704,3}}},
wayrest={[45]={{.128,.496,704,4}},[32]={{.586,.489,1380,2}}},
windhelm={
[26]={{.709,.702,2},{.829,.096,2}},
[32]={{.515,.476,1381,4}},
[45]={{.595,.538,704,11}},
},
woodhearth={[34]={{.648,.534}}},
oldorsiniummap07={[38]={{.718,.585,1250,17}}},
wrothgar={
[36]={{.713,.307,1247,1},{.722,.325,1247,1},{.161,.748,1247,1},{.207,.694,1247,1},{.250,.833,1247,1},{.305,.821,1247,1},{.326,.674,1247,1},{.381,.574,1247,1},{.401,.531,1247,1},{.451,.646,1247,1},{.487,.738,1247,1},{.521,.531,1247,1},{.523,.409,1247,1},{.638,.319,1247,1}},
[37]={{.543,.663,1316,1},{.611,.605,1316,1},{.476,.660,1316,1},{.351,.787,1316,1},{.378,.653,1316,1},{.245,.783,1316,1},{.142,.775,1316,1},{.701,.532,1316,1},{.704,.361,1316,1}},
[38]={{.605,.646,1250,10},{.424,.630,1250,1},{.436,.838,1250,5},{.168,.659,1250,17},{.193,.682,1250,2},{.633,.430,1250,7},{.541,.585,1250,14},{.337,.839,1250,18},{.282,.840,1250,9},{.295,.739,1250,13},{.083,.775,1250,6},{.105,.779,1250,4},{.724,.241,1250,3},{.733,.281,1250,20},{.766,.594,1250,19},{.804,.603,1250,15},{.849,.427,1250,8},{.883,.479,1250,16}},
},
summerset={
[41]={{.204,.626,2099,1},{.357,.567,2099,2},{.344,.463,2099,3},{.397,.476,2099,4},{.425,.452,2099,5},{.441,.427,2099,6},{.472,.401,2099,7},{.394,.359,2099,8},{.301,.358,2099,9},{.254,.283,2099,10},{.186,.334,2099,11},{.497,.216,2099,12},{.567,.259,2099,13},{.649,.395,2099,14},{.617,.468,2099,15},{.656,.559,2099,16},{.738,.678,2099,17},{.565,.648,2099,18},{.44,.731,2099,19},{.555,.556,2099,20}},
--Message in Bottle
[42]={{.366,.4,2211,1},{.689,.539,2211,1},{.247,.547,2211,1},{.346,.445,2211,1},{.273,.427,2211,1},{.272,.508,2211,1},{.732,.74,2211,1},{.454,.73,2211,1}},
--A Book and its Cover
[43]={{.328,.487,2171,5},{.513,.217,2171,5},{.561,.288,2171,5},{.22,.389,2171,5},{.544,.235,2171,5},{.652,.604,2171,5},{.446,.468,2171,5},{.549,.364,2171,5},{0.297,0.3,2171,5},{.626,.532,2171,5}},
[62]={{.397,.504,	102,3}},--Alinor Allemande--Provided by remosito
},
shimmerene={[41]={{.578,.676,2099,15}}},
--Undaunted Rescuer
vetcirtyash02={[46]={{.455,.456,1082,9},{.289,.805,1082,11}}},
vetcirtyash03={[46]={{.369,.47,1082,2},{.741,.814,1082,4},{.08,.5,1082,7},{.08,.5,1082,8},{.392,.344,1082,10},{.506,.316,1082,12}}},
vetcirtyash04={[46]={{.576,.402,1082,3},{.427,.321,1082,5},{.427,.321,1082,6}}},
--Precursor
yldzuun={[47]={{.806,.815,1958,1}}},	--Left arm
jaggerjaw={[47]={{.393,.173,1958,2}}},	--Right arm
avancheznel={[47]={{.55,.77,1958,3}}},	--Left leg
santaki={[47]={{.724,.689,1958,4}}},	--Right leg
lowerbthanuel={[47]={{.416,.444,1958,5}}},	--Pelvis
aldunz={[47]={{.748,.779,1958,6}}},	--Chestpiece
mzulft={[47]={{.124,.49,1958,7}}},	--Spine
innerseaarmature={[47]={{.242,.626,1958,8}}},	--Left hand
mzithumz={[47]={{.575,.48,1958,9}}},	--Right hand
bthzark={[47]={{.204,.328,1958,10}}},	--Dynamo
ccunderground={[47]={{.496,.191,1958,11}}},	--Calculus
clockwork={
[26]={{.201,.534,4},{.366,.695,4},{.843,.682,4},{.536,.694,4},{.739,.557,4},{.731,.506,4},{.725,.464,4},{.746,.49,4},{.766,.501,4},{.78,.48,4},{.749,.678,4},{.156,.547,4}},--Shadow Fissures
[47]={{0.177,0.596,1958,12}},
},	--Introspection
brassfortress={[47]={{.646,.649,1958,13}}},	--Reason
bthanual={[47]={{.518,.464,1958,14}}},	--Staff
}
--[[	Unwanted achievements
MarchOdSacrifices={{.76,.554},{.737,.5},{.759,.554}},	--Behemoth Sigil
southernelsweyr={	--Topal Corsair
{.278,.295,7212},	--[7212] Shoes
{.173,.623,7213},	--[7213] Gloves
},
--]]
--[[--Unwanted world events
elsweyr={{.484,.221},{.442,.671},{.23,.632},{.443,.671},{.669,.491},{.293,.623},{.421,.462},{.635,.265},{.445,.527}},
clockwork={{.634,.604,2047}},
--]]
local AchievementsId={[3749]=81,[3675]=80,[3677]=79,[3678]=78,[3224]=75,[3298]=74,[3299]=76,[3295]=77,[3080]=67,[3081]=64,[3082]=65,[3083]=63,[1824]=30,[1712]=31,[1382]=32,[872]=33,[869]=34,[871]=34,[873]=34,[1247]=36,[1250]=38,[1349]=39,[716]=40,[2211]=42,[2171]=43,[1827]=44,[704]=45,[1082]=46,[1958]=47,[2320]=48,[2341]=49,[2357]=53,[2669]=59}
local ZoneAchievement={
auridon=1,
grahtwood=2,
greenshade=3,
malabaltor=4,
reapersmarch=5,
stonefalls=6,
deshaan=7,
shadowfen=8,
eastmarch=9,
therift=10,
glenumbra=11,
stormhaven=12,
rivenspire=13,
alikr=14,
bangkorai=15,
}
local ZoneAchievementAll={
khenarthisroost=1,
auridon=2,
grahtwood=3,
greenshade=4,
malabaltor=5,
reapersmarch=6,
balfoyen=7,
stonefalls=8,
deshaan=9,
shadowfen=10,
eastmarch=11,
therift=12,
betnihk=13,
glenumbra=14,
stormhaven=15,
rivenspire=16,
alikr=17,
bangkorai=18,
coldharbour=19,
}
local AchievementItems={[1712]={},[1250]={},[2099]={},[1958]={},[2320]={},[2463]={},[2534]={},[2669]={},[2759]={}}
local TimeBreach={
summerset={{.587,.543,2},{.226,.599,2},{.292,.373,2},{.621,.322,2},{.561,.432,2},{.676,.62,2},{.479,.743,2},{.339,.424,2},{.738,.713,2}},
glenumbra={{.735,.199,2},{.336,.509,2},{.436,.807,2}},
stormhaven={{.516,.343,2},{.634,.361,2},{.13,.533,2}},	--{.84,.45,7}},
alikr={{.436,.472,2},{.717,.579,2},{.249,.632,2}},	--{.61,.467,4}},
eastmarch={{.5,.53,3},{.332,.482,3},{.327,.687,3}},
therift={{.737,.367,3},{.078,.259,3},{.318,.23,3}},
stonefalls={{.41,.523,3},{.52,.636,3},{.777,.504,3}},	--{.541,.628,7}},
--bangkorai={{.37,.456,4}},
grahtwood={{.291,.506,5},{.682,.463,5},{.23,.219,5}},
greenshade={{.127,.505,5},{.274,.1,5},{.584,.78,5}},	--{.537,.81,7}},
malabaltor={{.492,.346,5},{.647,.727,5},{.81,.242,5}},
shadowfen={{.748,.724,6},{.291,.777,6},{.552,.361,6},{.256,.236,6}},	--{.535,.524,4}},
deshaan={{.338,.572,6},{.1,.58,6},{.594,.44,6},{.78,.396,6},{.79,.57,6}},	--{.734,.616,4}},
rivenspire={{.157,.645,8},{.658,.626,8},{.823,.311,8},{.713,.471,8},{.61,.417,8},{.81,.117,8},{.216,.686,8},{.5,.677,8},{.201,.541,8}},
craglorn={{.177,.222,9},{.394,.383,9},{.242,.579,9},{.77,.687,9},{.654,.604,9},{.383,.7,9}},	--{.639,.566,7}}
}
local PinManager,CompassPinManager
local UpdatingMapPin,UpdatingCompassPin,PinId={},{},{}
local SavedVars,DefaultVars={},{[1]=true,[2]=true,[3]=true,[4]=false,[5]=true,[6]=false,[7]=true,[8]=true,[9]=false,[10]=false,[11]=false,[12]=false,[13]=false,[14]=false,[15]=false,[16]=false,[17]=false,[18]=false,[19]=false,[21]=true,TimeBreachClosed={}}
local SavedGlobal,DefaultGlobal={},{pinsize=20}
local ChestsRange,ChestsLooted,LastZone,LastAchivement,PsijicSkillLine=.08,0,0,0,4
local ChronoglerTablet={[6771]=1,[141719]=2,[141720]=3,[141721]=4,[141722]=5,[141723]=6,[141724]=7,[141725]=8,[141726]=9,[141728]=11,[141727]=10,[141729]=12}
local AncestralTombRubbing={[114287]=1,[114288]=2,[114289]=3,[114298]=4,[114299]=5,[114300]=6,[114301]=7,[114302]=8,[114303]=9,[114304]=10,[114305]=11,[114306]=12,[114307]=13,[114308]=14,[114309]=15,[114310]=16,[114311]=17,[114312]=18,[114313]=19,[114314]=20,[114315]=21,[114316]=22,[114317]=23,[114318]=24,[114319]=25,[114320]=26,[114321]=27,[114322]=28,[114323]=29,[114324]=30}
local WrothgarRelics={[64578]=1,[64579]=2,[64580]=3,[64581]=4,[64582]=5,[64583]=6,[64584]=7,[64586]=8,[64587]=9,[64585]=10,[64589]=13,[64590]=14,[64591]=15,[64592]=16,[64594]=17,[64588]=18,[64593]=19,[64595]=20}
local RelicsOfSummerset={[133605]=1,[133606]=2,[133607]=3,[133608]=4,[133609]=5,[133610]=6,[133611]=7,[133612]=8,[133613]=9,[133614]=10,[133615]=11,[133616]=12,[133617]=13,[133618]=14,[133619]=15,[133620]=16,[133621]=17,[133622]=18,[133623]=19,[133624]=20}
local MuralMenderFragments={
[147519]=2,--Riverhold Fragment
[147520]=3,
[147521]=4,--Khenarthia
[147522]=5,--Dune
[147523]=6,--Verkarth
[147524]=7,--Merivale
[147525]=8,
[147526]=9,--Alabaster
[147527]=10,--Senchal
[147528]=11,
[147529]=12,
[147530]=13,
[147531]=14,
[147532]=15,
[147533]=16,
}
local PiecesOfHistory={
[7070]=1,	--Nishozo
[151942]=2,	--Amaffi
[151943]=3,	--Oranu
[153466]=4,	--Magpie
[153467]=5,	--Bufasa
[153468]=6,	--Seleiz
[153469]=7,	--Hiijar
[153470]=8,	--Grastia
[153471]=9,	--Dancer
[153472]=10,--Farro
[153473]=11,--Kesta
[153474]=12,--Jarro
}
local IsChest={["Chest"]=true,["Truhe^f"]=true,["coffre^m"]=true,["Сундук"]=true,["宝箱"]=true}
local IsTimeBreach={["Time Breach"]=true,["Zeitriss^m"]=true,["Rupture temporelle^f"]=true,["Временная брешь"]=true,["時の裂け目"]=true}
local IsThievesTrove={["Thieves Trove"]=true,["Diebesgut^ns"]=true,["trésor des voleurs^m"]=true,["Воровской клад"]=true,["盗賊の宝"]=true}
local PsijicMap={[6551]=1,[6581]=2,[6584]=3,[6622]=4,[6598]=5,[6588]=6,[6620]=7,[6601]=8,[6604]=9,[6638]=10}
local Shrines={
therift={{.723,.252,1},{.789,.422,2}},
bangkorai={{.479,.429,1},{.648,.366,2}},
reapersmarch={{.619,.217,1},{.664,.205,2}},
}
local ShrineIcon={[1]="/esoui/art/icons/ability_vampire_007.dds",[2]="/esoui/art/icons/ability_werewolf_010.dds"}
local FishIcon={
	[1]="/esoui/art/icons/crafting_slaughterfish.dds",	--Foul
	[2]="/esoui/art/icons/crafting_fishing_river_betty.dds",	--River
	[3]="/esoui/art/icons/crafting_fishing_merringar.dds",	--Salt
	[4]="/esoui/art/icons/crafting_fishing_perch.dds"	--Lake
	}
local FishingNodes={
murkmire={
{.147,.407,1},{.597,.25,1},{.579,.242,1},{.56,.236,1},{.528,.232,1},{.112,.469,1},{.11,.448,1},{.108,.421,1},{.319,.641,1},{.7,.278,1},{.7,.287,1},{.716,.613,1},
{.5,.427,2},{.499,.445,2},{.535,.432,2},{.531,.412,2},{.519,.386,2},{.533,.381,2},{.699,.211,2},{.774,.239,2},{.408,.699,2},{.404,.691,2},{.417,.676,2},{.422,.658,2},{.428,.647,2},{.43,.638,2},{.431,.606,2},{.431,.626,2},{.461,.627,2},{.46,.642,2},{.458,.655,2},{.469,.668,2},{.698,.585,2},{.712,.587,2},{.314,.588,2},{.352,.526,2},{.38,.518,2},{.469,.668,2},{.505,.729,2},{.496,.712,2},{.502,.706,2},{.46,.6,2},{.44,.57,2},{.439,.593,2},{.732,.477,2},{.717,.48,2},{.71,.475,2},{.615,.507,2},{.675,.467,2},
{.806,.795,3},{.77,.8,3},{.761,.808,3},{.788,.596,3},{.887,.594,3},{.926,.677,3},{.941,.736,3},{.954,.805,3},{.945,.83,3},{.854,.872,3},{.801,.895,3},{.692,.882,3},{.67,.836,3},{.563,.825,3},{.496,.771,3},{.47,.765,3},{.443,.738,3},{.411,.74,3},{.399,.724,3},{.365,.72,3},{.334,.702,3},{.313,.679,3},{.297,.67,3},{.287,.67,3},{.272,.667,3},{.259,.643,3},{.245,.613,3},{.77,.594,3},{.784,.577,3},{.79,.57,3},{.782,.542,3},{.759,.5,3},{.774,.447,3},{.786,.425,3},
{.578,.41,4},{.632,.392,4},{.309,.421,4},{.291,.435,4},{.282,.419,4},{.475,.389,4},{.481,.392,4},{.614,.384,4},{.343,.615,4},{.349,.666,4},{.552,.487,4},{.546,.49,4},{.516,.501,4},{.526,.508,4},{.576,.544,4},{.6,.594,4},{.584,.648,4},{.14,.415,4},{.14,.406,4},{.11,.382,4},{.11,.346,4},{.136,.333,4},{.725,.675,4},{.7,.36,4},{.74,.383,4},{.692,.35,4},{.702,.361,4},{.738,.621,4},
},
alcairecastle={{.552,.523,4},{.675,.656,2},{.74,.725,2},{.836,.796,2}},
aldcroft={{.368,.229,2},{.432,.544,4},{.622,.114,2},{.722,.792,3},{.723,.609,3},{.805,.475,3}},
alikr={{.098,.519,3},{.112,.469,3},{.112,.476,3},{.125,.469,3},{.126,.493,3},{.137,.48,3},{.174,.455,3},{.176,.445,3},{.184,.437,3},{.191,.434,3},{.197,.434,3},{.198,.442,3},{.213,.445,3},{.216,.407,3},{.22,.444,3},{.229,.442,3},{.231,.404,3},{.249,.389,3},{.263,.388,3},{.274,.361,3},{.282,.393,3},{.302,.409,3},{.319,.421,3},{.328,.387,3},{.329,.415,3},{.33,.387,3},{.334,.377,3},{.338,.445,4},{.343,.401,3},{.364,.394,3},{.404,.637,4},{.404,.629,4},{.408,.631,4},{.42,.622,4},{.424,.618,4},{.429,.533,1},{.43,.577,4},{.445,.515,1},{.445,.544,1},{.497,.346,3},{.529,.345,3},{.572,.28,3},{.597,.272,3},{.61,.604,1},{.622,.615,1},{.744,.571,1},{.856,.557,1},{.865,.547,1}},
anvilcity={{.688,.281,4},{.717,.262,4},{.762,.29,4},{.745,.294,4},{.711,.265,4}},
arenthia={{.23,.593,1},{.22,.676,2},{.332,.234,1},{.44,.217,2},{.488,.205,2},{.519,.219,2},{.583,.256,2},{.68,.272,2},{.904,.264,2}},
artaeum={{.520,.481,3},{.498,.321,3},{.735,.467,3},{.726,.309,3},{.469,.339,3},{.373,.406,3},{.383,.399,3},{.448,.348,3},{.482,.327,3},{.73,.337,3},{.746,.42,3},{.746,.353,3},{.728,.527,3},{.735,.443,3},{.713,.508,3}},
auridon={{.455,.36,2},{.42,.357,2},{.441,.321,4},{.612,.247,3},{.529,.297,4},{.527,.289,4},{.502,.22,2},{.184,.243,3},{.196,.271,3},{.214,.28,3},{.248,.245,2},{.262,.085,3},{.266,.124,3},{.273,.183,2},{.29,.238,2},{.299,.359,3},{.343,.215,4},{.359,.385,3},{.363,.307,2},{.363,.702,3},{.379,.31,2},{.394,.678,3},{.397,.643,3},{.411,.602,3},{.422,.761,3},{.422,.408,3},{.428,.566,3},{.435,.209,2},{.45,.346,2},{.453,.518,3},{.455,.184,2},{.455,.784,3},{.453,.34,4},{.458,.378,2},{.469,.15,2},{.472,.163,2},{.482,.644,4},{.489,.646,4},{.49,.809,3},{.494,.409,2},{.494,.202,2},{.5,.875,3},{.505,.226,2},{.521,.923,3},{.538,.836,4},{.554,.292,4},{.555,.177,3},{.555,.301,4},{.576,.563,3},{.588,.813,4},{.588,.822,4},{.592,.772,2},{.594,.956,3},{.595,.823,4},{.596,.954,3},{.596,.779,2},{.622,.955,3},{.628,.776,4},{.637,.943,3},{.639,.77,4},{.651,.771,4},{.655,.339,3},{.656,.323,3},{.657,.938,3},{.674,.566,3},{.679,.968,3},{.679,.702,3},{.69,.96,3},{.787,.481,3},{.823,.472,3},{.84,.552,3}},
ava_whole_0={{.319,.529,1},{.319,.526,1},{.321,.53,1},{.322,.528,1},{.323,.526,1},{.362,.738,4},{.365,.735,4},{.367,.723,4},{.368,.718,4},{.369,.74,4},{.37,.719,4},{.371,.731,4},{.374,.721,2},{.389,.705,4},{.39,.705,4},{.409,.482,1},{.409,.475,1},{.412,.487,1},{.413,.494,1},{.416,.728,4},{.49,.581,1},{.503,.551,1},{.504,.559,1},{.505,.828,2},{.509,.827,2},{.51,.562,1},{.513,.826,2},{.519,.539,1},{.537,.534,1},{.542,.817,4},{.544,.814,2},{.547,.807,2},{.552,.803,2},{.559,.8,2},{.563,.798,2},{.576,.796,2},{.588,.536,4},{.589,.794,2},{.597,.539,4},{.598,.795,2},{.604,.555,4},{.607,.797,3},{.613,.796,3},{.614,.801,4},{.628,.799,4},{.632,.798,4},{.637,.807,3},{.644,.799,4},{.644,.806,3},{.655,.793,4},{.433,.519,1},{.478,.52,1},{.504,.541,1},{.522,.535,1}},
baandaritradingpost={{.478,.107,2}},
balfoyen={{.765,.57,3},{.777,.585,3}},
bangkorai={{.238,.535,3},{.252,.676,4},{.256,.665,4},{.268,.503,3},{.269,.652,4},{.28,.483,3},{.281,.661,1},{.288,.77,4},{.292,.664,4},{.294,.741,4},{.296,.763,4},{.299,.818,4},{.3,.773,4},{.312,.698,4},{.317,.657,4},{.323,.464,3},{.324,.681,4},{.335,.418,3},{.336,.619,4},{.337,.716,4},{.34,.664,4},{.34,.637,4},{.351,.707,4},{.352,.368,3},{.353,.727,4},{.357,.582,2},{.358,.632,4},{.359,.745,4},{.363,.412,3},{.364,.6,2},{.37,.564,2},{.371,.555,2},{.371,.393,3},{.372,.354,3},{.375,.278,3},{.377,.321,3},{.38,.521,2},{.386,.534,2},{.389,.549,2},{.417,.263,3},{.444,.222,3},{.447,.279,3},{.468,.184,3},{.478,.223,3},{.538,.18,3},{.552,.352,4},{.559,.209,3},{.562,.385,4},{.567,.354,4},{.568,.175,3},{.571,.075,3},{.576,.437,4},{.583,.413,4},{.605,.232,2},{.605,.468,4},{.61,.215,3},{.612,.399,4},{.619,.253,2},{.622,.269,2},{.624,.293,2},{.626,.473,1},{.628,.435,4},{.636,.322,2},{.639,.389,4},{.639,.36,4},{.642,.46,4},{.644,.403,4},{.645,.482,4},{.653,.494,1},{.659,.203,3},{.664,.484,2},{.666,.343,4},{.674,.486,2},{.683,.359,2},{.695,.488,2}},
belkarth={{.33,.82,4},{.331,.101,2},{.34,.196,2},{.356,.049,2},{.396,.255,2},{.401,.347,2},{.403,.43,2},{.425,.214,2},{.446,.801,4},{.474,.856,4},{.478,.169,2},{.49,.52,2},{.523,.135,2},{.529,.74,2},{.53,.776,4},{.531,.592,2},{.536,.69,2},{.623,.936,4},{.645,1.0396,4},{.689,.995,4},{.714,.876,4},{.835,.897,4}},
betnihk={{.177,.532,3},{.18,.631,3},{.181,.591,3},{.226,.356,3},{.226,.716,3},{.26,.752,3},{.263,.299,3},{.307,.774,3},{.333,.789,3},{.497,.861,3},{.541,.607,4},{.543,.738,4},{.548,.303,2},{.562,.587,4},{.57,.313,2},{.609,.501,3},{.619,.479,3},{.623,.375,4},{.722,.58,3}},
blackreach={{.876,.304,1},{.87,.261,1},{.903,.263,1},{.853,.29,1},{.831,.352,1},{.84,.381,2},{.598,.385,2},{.758,.371,2},{.729,.402,2},{.602,.341,2},{.798,.528,2},{.794,.53,2},{.779,.569,2},{.76,.601,2},{.748,.662,2},{.76,.718,4},{.634,.789,4},{.614,.776,4},{.48,.734,4},{.46,.74,4},{.433,.755,4},{.344,.759,4},{.327,.749,4},{.495,.777,1},{.151,.709,1},{.246,.575,1},{.211,.557,1},{.197,.553,1},{.185,.511,1},{.305,.423,1},{.205,.386,1},{.194,.387,1},{.094,.388,1},{.081,.451,1},{.09,.5,1}},
blackwood={{.602,.512,4},{.618,.526,4},{.467,.179,4},{.613,.544,4},{.602,.546,4},{.615,.568,4},{.579,.499,4},{.6,.482,4},{.174,.358,4},{.176,.36,4},{.498,.505,4},{.515,.488,4},{.535,.475,4},{.523,.468,4},{.250,.530,3},{.237,.64,3},{.245,.614,3},{.243,.597,3},{.274,.585,3},{.287,.559,3},{.275,.498,3},{.27,.487,3},{.224,.437,3},{.626,.295,3},{.212,.399,3},{.22,.372,3},{.224,.349,3},{.827,.847,2},{.82,.685,2},{.83,.709,2},{.818,.838,2},{.258,.290,2},{.305,.209,2},{.311,.229,2},{.339,.134,2},{.376,.12,2},{.381,.111,2},{.282,.415,3},{.269,.386,3},{.261,.384,3},{.244,.378,3},{.235,.368,3},{.236,.345,3},{.282,.425,3},{.273,.637,3},{.287,.484,3},{.28,.619,3},{.474,.725,3},{.452,.711,3},{.434,.721,3},{.421,.743,3},{.416,.753,3},{.376,.751,3},{.375,.738,3},{.382,.73,3},{.288,.676,3},{.493,.765,3},{.484,.751,3},{.478,.737,3},{.501,.773,3},{.508,.686,1},{.575,.803,1},{.558,.818,1},{.653,.76,1},{.664,.756,1},{.653,.729,1},{.633,.786,1},{.693,.85,1},{.688,.869,1},{.794,.85,1},{.795,.865,1},{.763,.861,1},{.689,.904,1},{.673,.907,1},{.749,.861,1},{.738,.846,1},{.731,.828,1},{.759,.821,1},{.77,.826,1},{.787,.831,1},{.785,.811,1},{.727,.782,1},{.694,.782,1},{.688,.808,1},{.704,.817,1},{.667,.843,1},{.694,.836,1},{.712,.846,1},{.683,.827,1},{.686,.487,1},{.697,.509,1},{.704,.494,1},{.693,.485,1},{.713,.509,1},{.729,.497,1},{.75,.507,1},{.721,.522,1},{.721,.555,1},{.735,.511,1},{.373,.522,4},{.366,.523,4},{.387,.449,4},{.373,.435,4},{.386,.431,4},{.386,.421,4},{.464,.443,4},{.503,.447,4},{.515,.442,4},{.576,.348,4},{.605,.338,4},{.558,.255,4},{.523,.211,4},{.498,.183,4},{.509,.145,4},{.533,.138,4},{.544,.139,4},{.422,.12,4},{.463,.183,4},{.47,.212,4},{.515,.265,4},{.524,.269,4},{.455,.38,4},{.455,.549,4},{.453,.563,4},{.464,.584,4},{.477,.569,4},{.469,.538,4},{.454,.549,4},{.692,.413,4},{.687,.376,4},{.664,.398,4},{.659,.414,4},{.635,.446,4},{.681,.197,2},{.7,.19,2},{.701,.219,2},{.704,.241,2},{.735,.321,2},{.767,.327,2},{.772,.346,2},{.785,.365,2},{.771,.365,2},{.718,.351,2},{.749,.337,2},{.747,.365,2},{.765,.419,2}},
bleakrock={{.31,.613,3},{.38,.826,3},{.41,.259,3},{.41,.259,3},{.74,.67,3},{.115,.525,3},{.143,.697,3},{.188,.594,3},{.194,.641,3},{.297,.152,3},{.299,.804,3},{.309,.672,3},{.333,.175,3},{.344,.758,3},{.384,.184,3},{.386,.688,3},{.394,.553,3},{.398,.849,3},{.400,.210,3},{.439,.632,3},{.444,.275,3},{.448,.911,3},{.449,.1,3},{.455,.23,3},{.472,.899,3},{.494,.887,3},{.498,.306,3},{.511,.584,3},{.515,.274,3},{.564,.074,3},{.565,.29,3},{.596,.232,3},{.614,.196,3},{.635,.218,3},{.697,.195,3},{.740,.670,3},{.766,.595,3},{.785,.614,3},{.792,.649,3},{.806,.251,3},{.812,.268,3},{.826,.277,3},{.837,.328,3},{.837,.328,3},{.924,.369,3}},
bleakrockvillage={{.314,.610,3},{.471,.614,3},{.299,.801,3},{.394,.552,3},{.509,.580,3}},
brightthroatvillage={{.206,.787,2},{.342,.81,2}},
clockwork={{.226,.470,1},{.475,.513,1},{.502,.514,1},{.557,.488,1},{.596,.502,1},{.841,.575,1},{.744,.612,1},{.788,.592,1},{.847,.636,1},{.796,.669,1},{.174,.494,1},{.344,.488,1},{.367,.487,1},{.489,.490,1},{.614,.508,1},{.784,.639,1},{.815,.721,1},{.840,.715,1},{.881,.710,1},{.900,.643,1},{.837,.664,1},{.429,.497,1},{.401,.495,1},{.301,.426,1},{.457,.499,1},{.641,.511,1}},
coldharbour={{.217,.621,1},{.224,.631,1},{.257,.674,1},{.262,.605,1},{.264,.672,1},{.265,.643,1},{.268,.686,1},{.281,.654,1},{.289,.63,1},{.292,.851,1},{.293,.701,1},{.298,.842,1},{.3,.613,1},{.302,.715,1},{.305,.815,1},{.307,.613,1},{.316,.813,1},{.344,.829,1},{.361,.78,1},{.369,.575,1},{.38,.784,1},{.381,.836,1},{.406,.808,1},{.407,.621,1},{.412,.783,1},{.56,.737,1},{.568,.659,1},{.569,.73,1},{.571,.414,1},{.581,.653,1},{.582,.672,1},{.59,.552,1},{.6,.545,1},{.602,.702,1},{.61,.7,1},{.619,.546,1},{.623,.427,1},{.623,.454,1},{.624,.389,1},{.638,.375,1},{.661,.525,1},{.673,.514,1},{.674,.492,1},{.697,.674,1},{.7,.85,1},{.709,.689,1},{.711,.635,1},{.717,.507,1},{.729,.822,1}},
craglorn={{.51,.4,2},{.188,.396,4},{.191,.412,4},{.197,.375,4},{.205,.418,4},{.207,.404,4},{.211,.472,2},{.212,.394,4},{.217,.41,4},{.218,.403,4},{.225,.393,2},{.307,.544,4},{.315,.55,4},{.322,.538,4},{.326,.381,2},{.326,.556,4},{.335,.563,4},{.339,.432,2},{.343,.495,2},{.344,.547,4},{.345,.556,4},{.345,.526,2},{.345,.484,2},{.346,.456,2},{.347,.52,2},{.392,.421,2},{.395,.406,2},{.399,.371,2},{.4,.334,2},{.4,.261,2},{.402,.384,2},{.402,.395,2},{.404,.438,2},{.404,.32,2},{.429,.477,4},{.444,.489,4},{.447,.468,4},{.447,.48,4},{.453,.473,4},{.456,.485,4},{.466,.502,2},{.529,.374,2},{.534,.363,2},{.536,.734,4},{.536,.633,2},{.537,.647,2},{.539,.626,2},{.54,.354,2},{.543,.616,2},{.545,.655,2},{.546,.668,2},{.546,.679,2},{.546,.539,2},{.547,.455,4},{.548,.606,2},{.549,.472,4},{.549,.649,2},{.552,.732,4},{.554,.594,2},{.556,.739,4},{.556,.643,2},{.558,.692,2},{.564,.723,2},{.564,.728,4},{.564,.64,2},{.564,.702,2},{.565,.716,2},{.577,.751,4},{.58,.765,4},{.586,.759,4},{.59,.742,4},{.607,.745,4},{.691,.544,4},{.722,.552,4},{.735,.574,3},{.736,.567,3},{.753,.688,4},{.755,.708,4},{.78,.725,2},{.816,.727,2},{.817,.572,2},{.817,.579,2},{.826,.677,1},{.826,.602,2},{.836,.728,2},{.837,.629,2},{.838,.673,2},{.858,.635,2},{.87,.662,2}},
crosswych={{.667,.488,2},{.766,.597,2}},
daggerfall={{.083,.379,3},{.096,.341,3},{.133,.281,3},{.215,.14,3},{.419,.612,4},{.44,.669,4},{.453,.509,2},{.471,.012,3},{.517,.843,3},{.68,.519,1},{.691,.912,3},{.757,.2,2},{.765,.88,3},{.766,.382,2}},
deshaan={{.129,.496,4},{.139,.511,4},{.143,.485,4},{.146,.491,4},{.154,.475,4},{.158,.511,4},{.169,.497,4},{.205,.457,2},{.242,.493,2},{.259,.529,4},{.26,.521,2},{.268,.521,4},{.268,.529,4},{.278,.525,4},{.285,.528,4},{.286,.549,4},{.304,.574,2},{.304,.64,1},{.341,.596,2},{.343,.634,2},{.356,.618,2},{.363,.62,2},{.37,.6,2},{.374,.558,4},{.377,.579,2},{.381,.394,2},{.384,.551,4},{.402,.568,4},{.415,.467,2},{.416,.486,2},{.457,.506,4},{.466,.418,2},{.493,.441,2},{.503,.455,2},{.509,.436,2},{.563,.407,2},{.585,.56,4},{.642,.568,2},{.647,.506,4},{.656,.525,4},{.662,.585,2},{.662,.547,2},{.67,.577,1},{.731,.574,2},{.738,.41,2},{.747,.541,4},{.769,.572,2},{.776,.558,2},{.778,.422,2},{.789,.517,4},{.8,.505,4},{.817,.419,3},{.834,.489,4},{.839,.435,3},{.86,.421,3},{.878,.557,3},{.895,.478,3},{.895,.527,3},{.904,.539,4},{.91,.442,3},{.935,.457,3}},
dune={{.656,.359,4},{.69,.229,4}},
eastmarch={{.459,.513,1},{.447,.528,1},{.51,.439,4},{.342,.629,4},{.36,.63,4},{.376,.636,4},{.211,.644,2},{.217,.679,2},{.228,.652,2},{.241,.625,2},{.273,.533,2},{.296,.525,2},{.303,.631,4},{.31,.33,2},{.318,.48,2},{.33,.665,2},{.331,.687,2},{.35,.505,2},{.355,.327,2},{.359,.502,2},{.364,.322,2},{.38,.611,4},{.386,.627,4},{.388,.354,2},{.389,.59,4},{.395,.632,4},{.42,.476,1},{.425,.484,1},{.435,.463,1},{.455,.48,1},{.457,.583,1},{.46,.549,1},{.46,.571,1},{.466,.331,2},{.469,.58,1},{.474,.551,1},{.493,.443,4},{.497,.535,1},{.498,.429,4},{.5,.509,1},{.509,.545,1},{.513,.431,4},{.523,.6,1},{.534,.281,3},{.534,.281,3},{.54,.284,3},{.541,.591,1},{.544,.277,3},{.544,.277,3},{.553,.263,3},{.553,.232,3},{.556,.226,3},{.56,.24,3},{.564,.634,4},{.578,.236,3},{.595,.236,3},{.603,.242,3},{.62,.551,4},{.793,.525,4},{.793,.476,4},{.797,.507,4}},
ebonheart={{.168,.656,3},{.28,.415,3},{.3,.366,3},{.331,.796,3},{.348,.838,3},{.357,.501,3},{.38,.97,2},{.387,.375,3},{.539,.063,3},{.547,.275,3},{.586,.913,3},{.479,.509,3},{.627,.409,3},{.704,.431,3},{.713,.763,3},{.756,.159,3},{.764,.232,1},{.768,.589,3},{.903,.039,3},{.949,.665,1}},
eldenrootgroundfloor={{.129,.185,4},{.158,.235,4},{.28,.642,4},{.34,.228,4},{.39,.122,4},{.491,.14,4},{.583,.622,4},{.624,.76,4},{.697,.042,4},{.702,.62,4},{.706,.152,2},{.735,.472,4},{.77,.035,4},{.814,.716,4},{.908,.626,4},{.939,.514,4}},
elsweyr={{.423,.157,2},{.659,.496,2},{.663,.499,2},{.39,.669,2},{.385,.669,2},{.344,.723,2},{.338,.72,2},{.289,.739,2},{.277,.746,2},{.244,.745,2},{.186,.747,2},{.174,.746,2},{.134,.752,2},{.39,.66,2},{.437,.161,2},{.123,.750,2},{.173,.757,2},{.232,.747,2},{.249,.743,2},{.282,.751,2},{.304,.733,2},{.328,.727,2},{.317,.720,2},{.343,.723,2},{.336,.710,2},{.664,.495,2},{.716,.488,2},{.498,.196,2},{.429,.656,2},{.387,.664,2},{.373,.660,2},{.363,.650,2},{.460,.174,2},{.559,.278,2},{.729,.449,2},{.436,.651,2},{.429,.644,2},{.541,.224,2},{.669,.469,2},{.147,.754,2},{.451,.168,2},{.436,.220,2},{.521,.223,2},{.481,.195,2},{.509,.191,2},{.440,.642,2}},
evermore={{.057,.845,3},{.159,.554,3},{.223,.814,3},{.269,.699,3},{.27,.473,3},{.302,.285,3},{.403,.179,3},{.706,.041,3}},
firsthold={{.238,.818,2},{.346,.085,3},{.389,.445,2},{.492,.78,2},{.818,.637,4}},
fortamol={{.926,.543,4},{.573,.375,4},{.27,.35,4},{.09,.686,2},{.195,.466,2},{.704,.512,4},{.916,.789,2},{.927,.967,2}},
glenumbra={{.193,.741,3},{.194,.439,3},{.195,.733,3},{.197,.588,3},{.201,.598,3},{.203,.72,3},{.21,.515,3},{.22,.691,3},{.237,.6,3},{.237,.499,3},{.243,.462,3},{.262,.789,4},{.264,.65,3},{.266,.388,3},{.266,.801,4},{.269,.768,2},{.273,.664,3},{.282,.838,3},{.314,.506,1},{.316,.77,1},{.318,.34,3},{.318,.852,3},{.331,.703,2},{.333,.845,3},{.333,.741,2},{.334,.533,1},{.34,.53,1},{.344,.512,1},{.372,.304,3},{.397,.521,2},{.402,.527,2},{.407,.54,2},{.409,.696,4},{.412,.682,4},{.422,.399,1},{.431,.456,1},{.437,.436,1},{.441,.567,2},{.441,.591,4},{.442,.587,4},{.442,.421,1},{.446,.623,4},{.447,.591,4},{.452,.454,1},{.454,.572,2},{.454,.782,3},{.455,.419,1},{.455,.609,4},{.464,.788,3},{.473,.266,3},{.481,.779,3},{.481,.424,1},{.482,.439,1},{.488,.496,1},{.494,.443,2},{.5,.773,3},{.513,.683,3},{.541,.515,2},{.544,.44,2},{.547,.751,3},{.552,.521,2},{.555,.495,2},{.556,.664,3},{.559,.184,3},{.561,.564,4},{.574,.317,1},{.576,.322,1},{.583,.465,2},{.585,.122,3},{.587,.506,2},{.593,.428,2},{.6,.572,3},{.6,.597,3},{.611,.554,3},{.618,.389,4},{.625,.206,4},{.634,.425,1},{.645,.515,3},{.649,.449,1},{.658,.349,4},{.658,.485,2},{.66,.459,1},{.667,.42,1},{.673,.444,4},{.678,.382,4},{.684,.539,3},{.692,.54,3},{.697,.484,3},{.704,.456,3},{.717,.361,4},{.733,.42,3},{.74,.276,4},{.741,.396,4},{.742,.158,4},{.742,.158,4},{.751,.295,4},{.76,.305,4},{.762,.315,4},{.764,.358,4},{.802,.337,3},{.803,.4,3},{.815,.302,3},{.835,.143,2},{.847,.281,3},{.851,.161,2}},
goldcoast={{.176,.38,3},{.188,.358,3},{.188,.437,3},{.189,.358,3},{.191,.403,3},{.192,.246,3},{.197,.309,3},{.203,.276,3},{.209,.21,3},{.223,.204,1},{.233,.223,1},{.235,.218,1},{.235,.232,1},{.235,.242,1},{.248,.136,2},{.249,.485,3},{.255,.557,3},{.262,.134,2},{.269,.141,2},{.278,.122,2},{.286,.125,2},{.291,.104,2},{.308,.088,2},{.31,.098,2},{.458,.526,4},{.459,.729,3},{.463,.522,4},{.465,.522,4},{.471,.529,4},{.474,.527,4},{.475,.528,4},{.482,.757,3},{.546,.765,3},{.587,.754,3},{.691,.347,4},{.691,.737,3},{.694,.354,4},{.756,.377,4},{.766,.387,4},{.774,.73,3},{.783,.388,4},{.794,.382,4},{.795,.709,3},{.801,.373,4},{.841,.677,3},{.884,.658,3},{.911,.629,2},{.922,.619,2}},
grahtwood={{.468,.44,2},{.668,.315,2},{.218,.144,1},{.22,.555,3},{.238,.134,1},{.24,.56,3},{.251,.145,1},{.255,.591,3},{.27,.187,4},{.273,.162,2},{.275,.173,4},{.279,.25,1},{.285,.562,3},{.31,.197,4},{.314,.564,3},{.323,.199,2},{.33,.61,3},{.339,.552,3},{.339,.552,3},{.346,.593,3},{.35,.56,3},{.35,.56,3},{.358,.629,3},{.361,.718,3},{.361,.498,2},{.368,.467,4},{.373,.487,2},{.375,.549,4},{.381,.68,3},{.385,.469,4},{.4,.716,3},{.404,.464,2},{.407,.694,3},{.433,.25,4},{.44,.808,3},{.441,.437,4},{.452,.427,4},{.456,.448,2},{.476,.815,3},{.483,.429,4},{.49,.44,4},{.51,.804,3},{.516,.529,4},{.53,.438,4},{.539,.802,3},{.54,.415,4},{.549,.796,3},{.563,.419,4},{.567,.791,3},{.583,.525,4},{.589,.246,1},{.592,.555,4},{.608,.398,4},{.609,.525,4},{.61,.422,2},{.616,.492,4},{.624,.396,4},{.631,.358,2},{.633,.545,4},{.644,.668,4},{.651,.342,2},{.654,.526,4},{.657,.672,4},{.661,.501,4},{.665,.62,4},{.679,.288,4},{.684,.638,4},{.704,.531,4},{.733,.64,4},{.737,.559,4},{.759,.575,1},{.772,.56,1},{.786,.584,1},{.794,.547,4},{.804,.771,3},{.805,.597,4},{.822,.624,3},{.831,.774,3},{.831,.711,3},{.843,.643,3},{.852,.772,3},{.27,.152,2}},
greenshade={{.405,.361,2},{.372,.324,2},{.685,.387,1},{.594,.328,1},{.058,.625,3},{.09,.65,3},{.113,.522,1},{.122,.679,3},{.127,.504,3},{.13,.644,3},{.138,.711,3},{.147,.643,3},{.167,.396,3},{.168,.663,4},{.171,.75,3},{.188,.716,3},{.202,.392,3},{.214,.732,3},{.228,.357,3},{.233,.762,3},{.245,.23,3},{.25,.391,3},{.253,.143,3},{.257,.254,3},{.277,.294,3},{.278,.294,3},{.285,.829,3},{.293,.39,3},{.296,.062,3},{.297,.831,3},{.306,.74,2},{.321,.363,2},{.33,.784,4},{.333,.325,2},{.336,.155,2},{.338,.521,4},{.339,.675,1},{.34,.369,4},{.343,.653,2},{.347,.59,4},{.361,.677,2},{.361,.661,4},{.379,.296,2},{.397,.62,4},{.411,.338,2},{.417,.271,4},{.498,.905,3},{.504,.825,2},{.505,.253,4},{.51,.895,3},{.521,.907,3},{.537,.818,2},{.55,.841,2},{.55,.404,4},{.557,.424,4},{.561,.334,1},{.563,.861,4},{.581,.351,1},{.588,.367,2},{.607,.417,2},{.616,.919,3},{.619,.412,2},{.622,.83,4},{.637,.835,4},{.639,.36,4},{.652,.828,4},{.666,.592,4},{.669,.396,1},{.672,.537,4},{.679,.648,4},{.68,.606,4},{.69,.544,4},{.7,.374,2}},
hallinsstand={{.464,.099,4},{.582,.08,1},{.615,.583,4},{.631,.096,4},{.642,.448,4},{.651,.55,4},{.666,.343,4},{.67,.594,4},{.726,.252,4},{.745,.06,4},{.78,.174,4},{.841,.332,4},{.853,.093,4},{.911,.386,4},{.941,.469,4}},
haven={{.704,.707,3},{.838,.724,3},{.84,.412,3},{.94,.712,3}},
hewsbane={{.259,.679,3},{.26,.54,3},{.268,.578,3},{.274,.635,1},{.281,.564,3},{.285,.466,3},{.304,.466,3},{.326,.809,3},{.358,.836,3},{.364,.555,4},{.369,.82,3},{.373,.846,3},{.389,.564,4},{.4,.855,3},{.406,.51,4},{.409,.746,4},{.417,.634,4},{.422,.624,4},{.429,.719,4},{.432,.598,4},{.432,.786,4},{.434,.507,4},{.434,.85,3},{.44,.589,4},{.443,.825,3},{.446,.532,4},{.448,.71,4},{.451,.427,2},{.454,.745,4},{.461,.787,1},{.463,.813,1},{.467,.792,1},{.476,.456,2},{.479,.601,2},{.487,.416,2},{.494,.822,3},{.495,.493,2},{.508,.728,2},{.517,.708,2},{.52,.837,3},{.523,.67,2},{.53,.815,3},{.536,.717,2},{.55,.828,3},{.571,.767,2},{.576,.789,1},{.588,.783,1}},
khenarthisroost={{.117,.568,3},{.138,.479,3},{.159,.54,3},{.164,.503,3},{.166,.569,3},{.179,.341,3},{.195,.648,3},{.205,.514,3},{.206,.41,3},{.219,.583,3},{.22,.337,3},{.226,.301,3},{.231,.621,3},{.264,.324,1},{.272,.583,3},{.299,.671,3},{.315,.31,3},{.32,.758,3},{.342,.364,3},{.349,.37,3},{.349,.736,3},{.351,.356,1},{.367,.797,3},{.381,.367,3},{.395,.364,3},{.418,.451,3},{.428,.335,3},{.428,.827,1},{.49,.81,1},{.545,.506,3},{.56,.839,3},{.57,.488,3},{.593,.46,3},{.596,.276,3},{.598,.291,3},{.603,.506,3},{.627,.385,3},{.632,.428,3},{.633,.364,3},{.638,.3,3},{.649,.327,3},{.65,.656,3},{.696,.646,3},{.714,.737,3},{.716,.393,3},{.723,.357,1},{.733,.657,1},{.737,.345,3},{.783,.662,3},{.793,.34,3},{.807,.654,3},{.815,.595,3},{.822,.62,3},{.829,.47,1},{.83,.547,3},{.833,.525,1}},
koeglinvillage={{.274,.72,3},{.348,.565,3}},
kvatchcity={{.196,.353,4},{.249,.413,4},{.346,.423,4},{.406,.384,4},{.45,.336,4}},
lillandrill={{.313,.837,3},{.670,.360,3},{.697,.123,3},{.396,.766,3}},
lilmothcity={{.51,.91,3},{.71,.82,3},{.36,.58,3},{.4,.56,3},{.525,.53,3}},
lionsDen_hiddenTunnel={{.61,.502,4}},
malabaltor={{.8,.4,2},{.77,.454,2},{.414,.632,4},{.057,.537,3},{.062,.553,3},{.067,.482,3},{.071,.576,3},{.104,.449,3},{.118,.427,1},{.122,.52,3},{.123,.479,3},{.133,.461,1},{.155,.418,1},{.174,.45,3},{.19,.439,3},{.226,.423,3},{.265,.433,1},{.266,.396,3},{.315,.403,3},{.344,.392,3},{.398,.399,3},{.413,.46,3},{.435,.429,3},{.436,.645,4},{.448,.676,4},{.456,.624,4},{.462,.351,3},{.462,.613,1},{.463,.317,3},{.476,.648,1},{.476,.404,3},{.487,.669,4},{.493,.709,2},{.502,.658,1},{.505,.724,2},{.512,.591,4},{.524,.648,4},{.525,.419,3},{.529,.578,1},{.53,.395,3},{.532,.619,1},{.54,.717,2},{.541,.592,4},{.549,.604,2},{.555,.33,3},{.557,.313,3},{.559,.363,3},{.56,.717,2},{.56,.586,2},{.569,.605,2},{.576,.297,1},{.597,.313,1},{.599,.723,2},{.62,.317,1},{.622,.585,4},{.631,.598,1},{.642,.738,4},{.647,.762,2},{.651,.598,4},{.657,.685,4},{.658,.232,3},{.66,.656,2},{.66,.713,4},{.66,.643,1},{.662,.6,2},{.667,.211,3},{.669,.756,2},{.676,.178,3},{.706,.601,2},{.716,.572,2},{.716,.539,2},{.775,.361,2},{.776,.422,1},{.811,.232,4},{.812,.249,2},{.813,.285,2},{.827,.23,4},{.829,.217,2},{.829,.275,2},{.846,.21,1}},
marbruk={{.292,.548,4},{.411,.594,4}},
mistral={{.106,.511,3},{.143,.082,3},{.575,.713,3},{.665,.645,3},{.751,.542,3},{.789,.712,3},{.875,.269,3},{.898,.191,3},{.957,.055,3}},
mournhold={{.216,.681,4},{.362,.275,2},{.367,.37,2},{.567,.463,4},{.609,.039,2},{.742,.151,2},{.79,.218,2},{.818,.123,2}},
narsis={{.07,.21,4},{.163,.342,4},{.193,.117,4},{.217,.169,4},{.281,.04,4},{.316,.336,4},{.411,.223,4}},
nimalten={{.331,.262,4},{.338,.174,4},{.455,.141,4},{.46,.282,4},{.72,.771,4}},
northpoint={{.066,.118,3},{.493,.043,3},{.622,.138,3},{.753,.107,3},{.8,.968,3},{.821,.195,3},{.878,.561,3},{.891,.833,3},{.9,.301,3},{.92,.707,3},{.924,.36,3},{.937,.455,3}},
orsinium={{.145,.696,2},{.19,.214,4},{.216,.099,4},{.224,.18,4},{.461,.817,2},{.551,.804,2},{.371,.95,2}},
porthunding={{.032,.728,3},{.051,.806,3},{.067,.87,3},{.242,.822,3},{.303,.456,4},{.396,.072,3},{.597,.046,3},{.767,.062,1},{.843,.168,3}},
rawlkha={{.032,.634,2},{.13,.175,2},{.201,.178,2},{.303,.438,2}},
reach={{.342,.176,2},{.361,.177,2},{.374,.174,2},{.397,.172,2},{.437,.222,4},{.439,.225,4},{.442,.225,4},{.441,.22,4},{.396,.346,4},{.391,.353,4},{.385,.36,4},{.384,.368,4},{.584,.38,2},{.562,.4,2},{.54,.424,2},{.516,.448,2},{.508,.457,2},{.504,.584,2},{.481,.611,2},{.397,.636,2},{.354,.648,2},{.348,.676,2},{.546,.513,2},{.544,.502,2},{.537,.488,2},{.753,.684,2},{.820,.805,2},{.548,.594,2},{.486,.531,2},{.472,.521,2},{.478,.489,2},{.373,.513,4},{.444,.628,2},{.794,.688,2},{.823,.687,2},{.46,.483,2},{.431,.478,2},{.41,.479,2},{.379,.49,2},{.372,.512,4},{.372,.522,4},{.372,.528,4},{.355,.533,4},{.364,.52,4},{.358,.52,4},{.363,.539,4},{.37,.533,4},{.319,.521,2},{.571,.604,2},{.601,.625,2},{.647,.644,2},{.672,.647,2},{.736,.669,2},{.849,.676,2},{.817,.755,2},{.828,.784,2},{.809,.783,2}},
reapersmarch={{.588,.616,1},{.221,.161,2},{.23,.343,2},{.235,.662,4},{.241,.16,2},{.246,.665,4},{.25,.65,4},{.251,.349,2},{.257,.129,2},{.262,.643,2},{.263,.719,2},{.264,.72,2},{.266,.768,2},{.266,.702,2},{.272,.81,2},{.275,.798,4},{.277,.655,2},{.289,.622,2},{.29,.105,2},{.314,.365,2},{.317,.114,2},{.325,.604,2},{.343,.345,2},{.345,.603,2},{.358,.31,4},{.36,.618,2},{.365,.346,4},{.366,.346,4},{.366,.641,2},{.368,.328,4},{.37,.654,2},{.386,.594,2},{.386,.69,2},{.391,.724,4},{.397,.093,2},{.403,.566,2},{.406,.395,2},{.407,.784,4},{.411,.702,4},{.412,.472,2},{.413,.485,2},{.414,.715,4},{.415,.508,2},{.417,.458,2},{.419,.437,2},{.419,.438,2},{.421,.357,2},{.421,.093,2},{.424,.509,2},{.429,.788,4},{.432,.458,2},{.434,.798,4},{.437,.541,2},{.446,.473,2},{.456,.336,2},{.49,.267,2},{.495,.252,4},{.496,.24,4},{.498,.223,2},{.504,.205,2},{.51,.193,2},{.515,.311,2},{.518,.169,2},{.539,.682,4},{.539,.086,1},{.544,.532,4},{.547,.531,4},{.548,.668,4},{.549,.553,4},{.552,.517,4},{.556,.517,4},{.558,.611,1},{.558,.676,2},{.559,.083,2},{.568,.676,4},{.568,.081,2},{.572,.597,1},{.572,.597,1},{.574,.084,2},{.577,.676,2},{.586,.091,2},{.593,.509,4},{.604,.094,2},{.608,.33,4},{.615,.346,4},{.627,.326,4},{.646,.092,2},{.794,.353,4},{.801,.327,4}},
redfurtradingpost={{.773,.771,2},{.147,.697,4},{.158,.345,2},{.18,.455,2},{.199,.558,4},{.539,.797,4},{.67,.816,2}},
riften={{.148,.281,1},{.55,.5,4},{.197,.531,4},{.231,.402,1},{.273,.436,1},{.412,.585,4},{.549,.696,4},{.643,.541,4}},
rivenspire={{.21,.653,2},{.236,.635,2},{.244,.628,2},{.277,.609,2},{.277,.589,2},{.282,.577,2},{.283,.542,2},{.288,.637,2},{.297,.573,2},{.312,.517,2},{.324,.686,4},{.325,.506,2},{.328,.693,4},{.373,.303,3},{.388,.312,3},{.41,.292,3},{.421,.306,3},{.439,.3,3},{.459,.308,3},{.471,.297,3},{.588,.46,4},{.616,.505,4},{.625,.51,4},{.637,.506,4},{.651,.42,4},{.66,.408,4},{.677,.169,3},{.678,.393,2},{.683,.381,2},{.686,.165,3},{.69,.37,2},{.698,.138,3},{.704,.375,2},{.704,.107,3},{.708,.149,3},{.714,.141,3},{.724,.364,2},{.727,.152,3},{.729,.435,2},{.729,.335,2},{.731,.364,2},{.737,.43,2},{.739,.415,2},{.741,.383,2},{.752,.338,2},{.766,.32,2},{.779,.125,3},{.779,.307,2},{.79,.111,3},{.793,.141,3},{.8,.309,3},{.801,.32,3},{.814,.156,3},{.817,.324,3},{.817,.302,3},{.834,.151,3},{.836,.346,3},{.842,.285,3},{.843,.336,3},{.845,.164,3},{.85,.294,3},{.851,.327,3},{.854,.222,3},{.856,.264,3},{.857,.181,3},{.86,.245,3},{.861,.19,3},{.862,.303,3},{.863,.205,3}},
rootwhisper={{.24,.4,2},{.712,.573,2}},
sadrithmora={{.185,.368,3},{.187,.372,3}},
sadrithmora={{.187,.372,3}},
sentinel={{.033,.474,3},{.041,.429,3},{.082,.39,3},{.115,.375,3},{.145,.372,3},{.151,.413,3},{.222,.425,3},{.239,.242,3},{.256,.423,3},{.302,.414,3},{.311,.229,3},{.398,.155,3},{.468,.148,3},{.518,.017,3},{.556,.172,3},{.655,.25,3},{.738,.308,3},{.782,.145,3},{.785,.283,3},{.792,.143,3},{.81,.097,3},{.831,.427,4},{.851,.215,3},{.956,.18,3}},
shadowfen={{.107,.813,1},{.153,.794,1},{.153,.821,1},{.155,.771,1},{.169,.587,1},{.322,.273,1},{.362,.269,1},{.403,.253,1},{.486,.241,1},{.525,.526,1},{.543,.512,1},{.571,.729,1},{.602,.811,1},{.604,.735,1},{.606,.760,1},{.757,.515,1},{.776,.489,1},{.184,.579,4},{.211,.806,4},{.218,.614,4},{.240,.732,4},{.262,.817,4},{.279,.723,4},{.289,.628,4},{.304,.323,4},{.306,.812,4},{.317,.710,4},{.321,.563,4},{.329,.760,4},{.337,.637,4},{.379,.820,4},{.382,.383,4},{.396,.641,4},{.400,.474,4},{.418,.388,4},{.433,.307,4},{.435,.210,4},{.439,.828,4},{.450,.690,4},{.457,.211,4},{.458,.826,4},{.459,.582,4},{.488,.671,4},{.496,.371,4},{.500,.836,4},{.517,.339,4},{.523,.863,4},{.580,.420,4},{.628,.560,4},{.638,.826,4},{.644,.489,4},{.649,.711,4},{.690,.812,4},{.765,.830,4},{.782,.793,4},{.831,.764,4},{.176,.580,2},{.228,.289,2},{.274,.154,2},{.299,.493,2},{.305,.150,2},{.403,.178,2},{.436,.260,2},{.445,.247,2},{.465,.282,2},{.473,.185,2},{.487,.205,2},{.518,.219,2},{.546,.527,2},{.556,.257,2},{.561,.275,2},{.564,.305,2},{.577,.332,2},{.647,.363,2},{.692,.416,2},{.711,.622,2},{.711,.593,2},{.730,.431,2},{.736,.578,2},{.765,.613,2},{.775,.455,2},{.800,.642,2},{.819,.383,2},{.825,.826,2},{.834,.459,2},{.838,.512,2},{.856,.697,2},{.879,.740,2}},
skywatch={{.458,.842,3}},
southernelsweyr={{.153,.643,3},{.167,.641,3},{.173,.351,2},{.174,.340,2},{.177,.346,2},{.177,.614,3},{.178,.653,3},{.18,.628,3},{.194,.341,2},{.22,.667,3},{.223,.646,3},{.234,.446,2},{.238,.405,2},{.247,.479,2},{.248,.397,2},{.251,.686,3},{.264,.607,1},{.266,.625,1},{.268,.506,2},{.269,.476,2},{.271,.609,1},{.272,.64,1},{.274,.488,2},{.277,.517,2},{.281,.259,2},{.283,.504,2},{.284,.6,1},{.284,.643,1},{.286,.349,2},{.286,.533,2},{.286,.587,1},{.287,.611,1},{.288,.676,3},{.289,.660,1},{.29,.707,3},{.292,.615,1},{.295,.232,2},{.295,.6,1},{.296,.293,2},{.297,.421,2},{.298,.575,1},{.299,.402,2},{.3,.343,2},{.3,.625,1},{.306,.314,2},{.307,.437,2},{.308,.333,2},{.31,.56,1},{.31,.574,1},{.312,.642,1},{.318,.612,1},{.32,.225,2},{.32,.703,3},{.321,.56,1},{.322,.584,1},{.324,.614,1},{.328,.67,3},{.33,.445,2},{.336,.218,2},{.341,.302,1},{.345,.443,2},{.346,.303,1},{.353,.294,1},{.353,.301,1},{.353,.577,1},{.355,.697,3},{.356,.585,1},{.358,.58,1},{.36,.69,1},{.365,.553,2},{.366,.444,2},{.366,.444,2},{.388,.443,2},{.392,.193,2},{.394,.236,2},{.395,.231,2},{.399,.211,2},{.402,.216,2},{.404,.461,2},{.415,.454,2},{.418,.488,2},{.419,.221,2},{.42,.187,2},{.422,.515,2},{.429,.483,2},{.431,.188,2},{.432,.206,2},{.432,.470,2},{.433,.501,2},{.471,.38,3},{.471,.421,3},{.473,.349,3},{.473,.403,3},{.478,.257,2},{.479,.284,2},{.48,.274,2},{.482,.295,2},{.485,.266,2},{.495,.448,3},{.499,.34,3},{.5,.264,2},{.515,.265,2},{.515,.621,1},{.519,.624,1},{.521,.326,3},{.541,.313,3},{.546,.309,3},{.548,.304,3},{.600,.719,3},{.633,.556,3},{.678,.591,3},{.707,.655,3}},
stonefalls={{.151,.19,4},{.153,.195,4},{.161,.174,4},{.166,.183,4},{.173,.362,1},{.189,.352,1},{.191,.181,4},{.195,.339,1},{.212,.369,4},{.214,.359,4},{.215,.413,2},{.22,.36,4},{.263,.477,1},{.281,.481,1},{.284,.619,4},{.292,.455,1},{.294,.616,4},{.311,.491,1},{.312,.417,2},{.337,.498,1},{.353,.385,1},{.361,.426,3},{.364,.407,3},{.366,.449,3},{.385,.386,3},{.388,.363,3},{.423,.458,3},{.475,.727,4},{.479,.509,3},{.503,.459,3},{.507,.448,3},{.513,.602,1},{.515,.539,3},{.516,.588,2},{.517,.617,2},{.519,.477,3},{.519,.548,3},{.521,.622,2},{.522,.637,2},{.524,.669,2},{.525,.45,3},{.526,.576,2},{.533,.352,3},{.557,.384,3},{.559,.429,3},{.567,.564,3},{.576,.457,3},{.592,.462,3},{.594,.532,3},{.603,.404,3},{.605,.42,1},{.606,.495,3},{.634,.379,3},{.644,.511,1},{.74,.33,3},{.756,.317,3}},
stonetoothfortress={{.502,.834,4},{.562,.772,4},{.705,.515,3},{.734,.449,3}},
stormhaven={{.136,.524,3},{.14,.429,3},{.149,.411,3},{.173,.253,4},{.179,.557,3},{.188,.269,2},{.192,.316,1},{.196,.278,2},{.202,.577,3},{.202,.313,1},{.204,.499,3},{.207,.383,1},{.208,.287,2},{.217,.322,2},{.241,.327,2},{.244,.531,2},{.254,.512,2},{.259,.371,2},{.267,.392,2},{.268,.499,2},{.269,.467,2},{.27,.415,2},{.27,.641,3},{.279,.443,2},{.281,.656,3},{.33,.648,3},{.405,.541,1},{.416,.532,1},{.42,.548,4},{.428,.572,2},{.43,.585,2},{.433,.651,3},{.434,.668,3},{.438,.626,2},{.441,.578,2},{.442,.604,2},{.448,.51,1},{.453,.565,4},{.459,.573,4},{.475,.657,3},{.493,.654,3},{.524,.358,1},{.532,.357,1},{.537,.652,3},{.55,.653,3},{.557,.597,1},{.562,.501,4},{.566,.609,2},{.566,.58,2},{.571,.626,1},{.571,.634,1},{.573,.544,1},{.577,.622,1},{.577,.496,4},{.579,.635,1},{.6,.485,2},{.6,.492,4},{.609,.52,2},{.613,.674,3},{.618,.665,3},{.624,.646,3},{.627,.387,4},{.63,.591,3},{.634,.535,2},{.635,.389,4},{.64,.56,4},{.654,.384,4},{.656,.578,3},{.663,.391,2},{.683,.468,2},{.685,.505,2},{.683,.6,3},{.69,.459,2},{.69,.526,4},{.697,.52,4},{.697,.565,1},{.701,.509,2},{.703,.484,2},{.709,.569,1},{.718,.573,3},{.72,.537,1},{.729,.535,1},{.73,.569,3},{.743,.537,3},{.761,.511,3},{.82,.411,2},{.82,.435,2},{.831,.45,4},{.838,.399,4},{.842,.465,2},{.845,.51,3},{.862,.426,4},{.866,.487,4},{.867,.486,3}},
stormhold={{.378,.709,4},{.451,.34,2},{.566,.553,2},{.714,.067,2}},
strosmkai={{.055,.628,3},{.071,.576,3},{.106,.544,3},{.107,.561,3},{.13,.621,3},{.309,.332,3},{.315,.285,3},{.37,.868,3},{.381,.796,4},{.402,.292,3},{.408,.265,3},{.414,.892,3},{.43,.617,3},{.437,.513,3},{.443,.505,1},{.462,.514,3},{.464,.97,3},{.469,.547,3},{.476,.574,3},{.478,.951,3},{.511,.915,3},{.533,.08,3},{.537,.899,3},{.549,.554,3},{.567,.875,3},{.575,.401,4},{.588,.878,3},{.614,.24,3},{.614,.861,3},{.618,.881,3},{.627,.827,3},{.632,.693,3},{.64,.76,3},{.643,.803,3},{.698,.229,3},{.744,.598,3},{.769,.236,1},{.783,.583,3},{.801,.28,3},{.814,.552,3},{.818,.5,3},{.85,.147,3},{.861,.205,3},{.899,.311,3},{.901,.372,3},{.906,.205,3}},
summerset={{.146,.426,3},{.154,.420,3},{.171,.362,3},{.179,.384,3},{.181,.363,3},{.181,.631,3},{.189,.365,3},{.197,.615,3},{.205,.466,3},{.211,.268,3},{.214,.596,3},{.215,.393,3},{.216,.272,3},{.217,.293,3},{.223,.302,3},{.230,.305,3},{.234,.274,3},{.234,.556,1},{.237,.288,3},{.240,.266,3},{.241,.296,3},{.242,.553,3},{.244,.268,1},{.249,.442,1},{.250,.539,3},{.252,.257,1},{.255,.264,3},{.265,.449,3},{.265,.518,3},{.268,.510,3},{.269,.241,3},{.271,.232,3},{.274,.222,3},{.288,.384,3},{.293,.464,3},{.297,.469,3},{.314,.466,3},{.322,.46,3},{.334,.462,1},{.338,.46,1},{.345,.424,3},{.348,.465,3},{.354,.561,4},{.355,.557,4},{.355,.568,4},{.358,.551,4},{.359,.465,3},{.365,.557,4},{.371,.399,1},{.372,.459,3},{.374,.550,2},{.389,.527,2},{.425,.456,1},{.440,.427,1},{.456,.684,2},{.458,.114,3},{.458,.689,2},{.462,.500,2},{.463,.699,2},{.465,.109,3},{.469,.144,4},{.470,.498,4},{.471,.5,4},{.474,.113,3},{.478,.120,3},{.478,.745,3},{.481,.692,2},{.481,.752,3},{.482,.752,3},{.485,.128,3},{.488,.194,3},{.489,.683,2},{.490,.167,3},{.492,.199,3},{.493,.185,3},{.494,.688,2},{.495,.726,2},{.496,.726,2},{.497,.204,3},{.499,.159,3},{.501,.752,3},{.502,.750,3},{.503,.697,2},{.508,.67,2},{.511,.144,3},{.511,.760,3},{.512,.133,3},{.516,.213,3},{.517,.401,4},{.517,.545,2},{.517,.663,2},{.519,.408,4},{.522,.406,4},{.525,.245,2},{.527,.241,2},{.530,.695,2},{.532,.358,2},{.533,.696,2},{.535,.695,2},{.537,.222,3},{.537,.468,2},{.537,.523,2},{.538,.508,2},{.542,.457,2},{.543,.226,3},{.545,.451,2},{.557,.225,3},{.557,.440,3},{.563,.437,3},{.583,.569,4},{.586,.228,3},{.589,.559,4},{.589,.584,4},{.59,.574,4},{.595,.228,3},{.607,.379,3},{.612,.494,3},{.613,.473,3},{.624,.505,3},{.625,.363,3},{.636,.514,3},{.642,.249,3},{.646,.378,3},{.654,.524,3},{.655,.266,3},{.659,.287,3},{.662,.313,3},{.673,.622,1},{.695,.750,3},{.706,.695,3},{.708,.716,3},{.719,.766,3},{.720,.631,3},{.727,.751,3},{.744,.673,3}},
thelionsden={{.126,.198,4},{.14,.244,4},{.16,.824,2},{.164,.209,4},{.193,.149,4}},
therift={{.31,.25,4},{.59,.465,4},{.824,.501,1},{.816,.5,1},{.099,.307,2},{.107,.294,2},{.114,.325,4},{.125,.318,4},{.136,.26,2},{.139,.333,4},{.146,.302,4},{.152,.33,4},{.161,.298,4},{.188,.292,4},{.189,.337,4},{.191,.282,4},{.204,.275,4},{.208,.261,4},{.212,.352,4},{.212,.304,4},{.213,.336,4},{.215,.249,4},{.22,.286,4},{.234,.331,4},{.235,.355,4},{.28,.441,4},{.292,.288,4},{.369,.419,4},{.388,.463,4},{.389,.496,4},{.391,.427,4},{.401,.413,1},{.411,.437,4},{.431,.486,4},{.437,.437,4},{.464,.539,4},{.464,.472,4},{.469,.436,1},{.469,.464,4},{.474,.509,4},{.493,.509,4},{.496,.434,4},{.512,.548,4},{.538,.539,4},{.542,.496,1},{.557,.567,4},{.564,.48,1},{.566,.511,4},{.683,.517,4},{.689,.465,4},{.597,.541,4},{.634,.494,4},{.638,.476,1},{.644,.48,1},{.664,.501,4},{.697,.495,4},{.799,.496,1},{.838,.57,2},{.846,.556,4},{.854,.552,4}},
U28_blackreach={{.381,.497,2},{.681,.365,1},{.849,.724,1},{.797,.721,1},{.713,.669,1},{.248,.688,2},{.210,.699,1},{.156,.714,1},{.134,.658,1},{.094,.571,1},{.295,.262,2},{.335,.298,2},{.334,.326,2},{.379,.381,2},{.425,.436,1},{.432,.446,1},{.381,.404,1},{.377,.431,1},{.375,.453,2},{.359,.525,2},{.366,.564,2},{.351,.571,2},{.346,.606,2},{.27,.668,2},{.249,.687,1},{.196,.685,1},{.1,.596,1},{.759,.668,1},{.798,.69,1},{.844,.682,1},{.853,.655,1},{.885,.645,1},{.898,.631,1},{.877,.615,1},{.83,.769,1},{.882,.703,1},{.701,.363,1}},
u30_Gideoncity={{.206,.478,4},{.173,.355,4}},
u30_leyawiincity={{.625,.295,3}},
u32deadlandszone={{.581,.485,1},{.694,.363,1},{.669,.382,1},{.647,.377,1},{.607,.381,1},{.619,.398,1},{.504,.368,1},{.504,.366,1},{.5,.362,1},{.615,.384,1},{.701,.377,1},{.693,.395,1},{.706,.396,1},{.778,.415,1},{.838,.281,1},{.821,.338,1},{.753,.367,1},{.828,.294,1},{.889,.462,1}},
u34_amenosstation_city={{.704,.099,2},{.575,.235,2},{.485,.292,2},{.212,.609,3},{.395,.766,3},{.522,.867,3}},
u34_gonfalonbaycity={{.062,.807,3}},
u34_gonfalonbaycity={{.063,.806,3}},
u34_stoneloregrove={{.497,.878,4}},
u34_systreszone={{.675,.505,3},{.663,.495,3},{.647,.481,3},{.671,.452,2},{.680,.447,2},{.691,.435,2},{.114,.632,3},{.123,.777,3},{.185,.5,3},{.196,.497,1},{.203,.381,3},{.204,.497,1},{.255,.776,4},{.282,.7,4},{.359,.409,1},{.364,.413,1},{.37,.716,4},{.391,.925,3},{.401,.922,3},{.404,.742,4},{.417,.925,3},{.432,.926,3},{.442,.928,3},{.453,.928,3},{.461,.928,3},{.473,.921,3},{.477,.914,3},{.514,.652,1},{.604,.352,3},{.613,.308,3},{.791,.493,3},{.835,.188,3},{.846,.198,3},{.857,.251,3},{.911,.269,3},{.922,.29,3},{.661,.21,3},{.662,.238,3},{.667,.123,3},{.652,.12,3},{.732,.31,2},{.758,.295,1},{.743,.3,3},{.774,.382,4},{.774,.407,4},{.771,.415,4},{.78,.418,4},{.788,.447,2},{.783,.438,2},{.774,.436,4},{.781,.447,2},{.765,.427,4},{.773,.423,4},{.766,.418,4},{.76,.405,4},{.783,.375,4},{.786,.457,2},{.786,.468,2},{.782,.474,2},{.792,.475,2},{.785,.48,2},{.789,.482,2},{.785,.491,3},{.772,.486,3},{.791,.493,3},{.804,.498,3},{.509,.509,3},{.515,.523,3},{.576,.537,3},{.569,.544,3},{.595,.555,3},{.601,.56,3},{.617,.572,3},{.619,.661,3},{.626,.674,3},{.609,.668,3},{.606,.682,3},{.609,.688,3},{.625,.691,3},{.452,.579,4},{.459,.593,4},{.517,.657,2},{.531,.675,1},{.515,.691,1},{.533,.707,1},{.339,.458,4},{.354,.485,1},{.351,.488,1},{.385,.489,2},{.386,.491,2},{.381,.51,2},{.384,.529,2},{.387,.56,2},{.381,.568,2},{.374,.55,2},{.355,.54,4},{.349,.555,4},{.301,.573,4},{.297,.56,4},{.259,.539,2},{.276,.538,2},{.258,.521,4},{.187,.637,4},{.167,.647,1},{.173,.668,4},{.480,.893,3},{.391,.924,1},{.38,.92,3},{.365,.893,3},{.357,.916,3},{.346,.925,3},{.33,.923,1},{.33,.917,1},{.305,.916,3},{.291,.923,3},{.275,.916,3},{.278,.895,3},{.284,.88,1},{.287,.846,2},{.282,.836,2},{.256,.876,3},{.243,.838,3},{.259,.816,3},{.246,.801,3},{.221,.806,3},{.198,.826,3},{.17,.822,3},{.159,.807,3},{.131,.806,3},{.104,.74,3},{.092,.716,3},{.096,.686,3},{.105,.66,3},{.122,.652,3},{.126,.588,3},{.13,.556,3},{.152,.545,3},{.18,.507,1},{.188,.508,1},{.201,.503,1},{.21,.505,1},{.218,.507,1},{.214,.502,1},{.196,.497,1},{.185,.5,3},{.183,.487,1},{.188,.402,3},{.212,.368,3},{.25,.352,3},{.288,.336,3},{.409,.674,4},{.409,.652,4},{.435,.725,4},{.435,.744,4},{.418,.74,4},{.394,.749,4},{.337,.794,2},{.267,.783,4},{.285,.75,4},{.306,.711,4},{.31,.734,2},{.282,.7,4},{.281,.723,4}},
u36_galenisland={{.069,.37,3},{.075,.382,3},{.092,.273,3},{.104,.267,3},{.138,.533,3},{.162,.556,3},{.192,.599,3},{.209,.117,3},{.234,.320,1},{.235,.294,1},{.236,.304,1},{.237,.312,1},{.242,.120,3},{.242,.288,1},{.250,.291,1},{.254,.313,1},{.257,.363,1},{.260,.285,1},{.270,.291,1},{.272,.299,1},{.273,.359,1},{.281,.357,1},{.287,.308,1},{.289,.345,1},{.293,.138,3},{.293,.316,1},{.295,.300,1},{.296,.335,1},{.33,.667,3},{.303,.131,3},{.313,.156,3},{.313,.727,3},{.316,.598,4},{.317,.588,4},{.321,.604,4},{.322,.589,4},{.322,.609,4},{.325,.396,1},{.327,.619,4},{.327,.679,3},{.327,.686,3},{.328,.387,1},{.328,.643,4},{.331,.148,3},{.331,.654,4},{.331,.704,3},{.535,.391,1},{.342,.142,3},{.343,.614,4},{.343,.658,4},{.346,.375,1},{.346,.648,4},{.348,.606,4},{.350,.379,1},{.350,.560,4},{.352,.449,4},{.354,.558,4},{.354,.594,4},{.357,.456,4},{.358,.445,4},{.358,.570,4},{.358,.578,4},{.369,.700,3},{.380,.137,3},{.388,.699,3},{.397,.705,3},{.398,.145,3},{.418,.169,3},{.432,.171,3},{.435,.709,3},{.438,.174,3},{.441,.155,3},{.443,.700,3},{.448,.175,3},{.453,.500,4},{.454,.494,4},{.457,.176,3},{.457,.500,4},{.461,.496,4},{.468,.171,3},{.473,.186,3},{.479,.168,3},{.489,.179,3},{.497,.669,3},{.498,.696,3},{.503,.518,3},{.509,.166,3},{.518,.652,3},{.521,.627,3},{.534,.530,3},{.539,.589,3},{.552,.567,3},{.616,.232,3},{.624,.250,3},{.625,.255,3},{.637,.275,3},{.665,.290,3},{.673,.368,3},{.685,.319,3}},
u38_Necrom={{.274,.673,4},{.274,.661,4},{.425,.721,4},{.532,.725,4},{.034,.427,2},{.047,.461,2},{.054,.509,2},{.095,.436,2},{.167,.536,2},{.705,.779,3},{.725,.944,3},{.736,.779,3},{.759,.885,3}},
u38_apocrypha={{.141,.281,1},{.208,.310,1},{.246,.310,1},{.257,.324,1},{.286,.328,1},{.380,.282,1},{.395,.383,1},{.400,.385,1},{.456,.238,1},{.459,.448,1},{.463,.432,1},{.487,.329,1},{.489,.344,1},{.498,.328,1},{.522,.597,1},{.541,.536,1},{.555,.582,1},{.581,.472,1},{.605,.635,1},{.609,.391,1},{.609,.516,1},{.611,.604,1},{.614,.719,1},{.616,.659,1},{.616,.514,1},{.624,.324,1},{.630,.655,1},{.633,.321,1},{.642,.690,1},{.647,.514,1},{.650,.533,1},{.651,.319,1},{.667,.487,1},{.694,.344,1},{.697,.350,1},{.716,.492,1},{.722,.363,1},{.729,.374,1},{.733,.378,1},{.733,.386,1},{.751,.836,1},{.752,.723,1},{.759,.404,1},{.761,.700,1},{.763,.855,1},{.772,.695,1},{.788,.452,1},{.791,.831,1},{.799,.825,1},{.800,.876,1},{.801,.822,1},{.818,.508,1},{.824,.605,1},{.826,.528,1}},
u38_telvannipeninsula={{.341,.425,4},{.349,.355,4},{.351,.406,4},{.353,.362,4},{.362,.355,4},{.364,.405,4},{.374,.403,4},{.416,.486,4},{.423,.479,4},{.443,.477,4},{.465,.474,4},{.766,.379,4},{.766,.376,4},{.802,.390,4},{.828,.391,4},{.291,.582,2},{.301,.473,2},{.322,.593,2},{.327,.597,2},{.352,.381,2},{.356,.388,2},{.384,.708,2},{.390,.331,2},{.409,.712,2},{.425,.657,2},{.444,.732,2},{.510,.511,2},{.533,.360,2},{.603,.462,2},{.641,.415,2},{.645,.425,2},{.657,.419,2},{.672,.388,2},{.673,.401,2},{.675,.374,2},{.677,.364,2},{.697,.354,2},{.709,.320,2},{.712,.328,2},{.714,.340,2},{.723,.322,2},{.741,.346,2},{.204,.455,3},{.226,.441,3},{.234,.541,3},{.247,.437,3},{.250,.582,3},{.261,.403,3},{.264,.407,3},{.266,.392,3},{.276,.390,3},{.444,.302,3},{.530,.748,3},{.533,.780,3},{.534,.781,3},{.542,.740,3},{.636,.685,3},{.665,.609,3},{.672,.637,3},{.684,.599,3},{.739,.553,3},{.768,.557,3},{.775,.514,3},{.77,.513,3},{.765,.53,3},{.783,.514,3},{.787,.515,3},{.805,.502,3},{.817,.495,3},{.849,.481,3},{.851,.470,3},{.869,.404,3},{.874,.443,3},{.876,.404,3},{.882,.429,3}},
velynharbor={{.226,.616,3},{.247,.687,3},{.266,.38,3},{.284,.789,3},{.429,.237,3},{.482,.145,1},{.505,.543,3},{.511,.366,3},{.555,.288,1},{.646,.097,1},{.733,.238,3},{.804,.191,3}},
villageofthelost={{.199,.467,1},{.213,.528,1},{.355,.275,1},{.388,.764,1},{.42,.635,1},{.453,.472,1},{.771,.396,1}},
vulkhelguard={{.356,.714,3},{.363,.704,3},{.497,.705,3},{.572,.646,3},{.671,.623,3},{.784,.771,3},{.838,.732,3}},
vvardenfell={{.83,.466,3},{.88,.492,3},{.121,.311,3},{.130,.284,3},{.139,.344,3},{.155,.367,3},{.166,.375,3},{.169,.396,3},{.169,.415,3},{.193,.430,3},{.206,.404,3},{.218,.432,3},{.220,.300,2},{.221,.247,3},{.224,.476,3},{.231,.452,3},{.232,.508,3},{.248,.554,3},{.252,.243,4},{.252,.529,3},{.257,.225,3},{.260,.615,3},{.264,.559,1},{.268,.645,3},{.273,.315,4},{.274,.566,3},{.276,.310,4},{.278,.211,3},{.288,.517,1},{.290,.693,1},{.291,.531,1},{.291,.648,3},{.292,.554,1},{.297,.731,1},{.300,.639,1},{.302,.645,1},{.305,.530,1},{.305,.720,1},{.308,.757,1},{.319,.649,1},{.324,.558,1},{.325,.773,3},{.326,.194,3},{.329,.697,1},{.347,.189,3},{.365,.793,3},{.376,.193,3},{.384,.826,3},{.389,.781,1},{.396,.618,4},{.406,.608,4},{.409,.595,4},{.409,.623,4},{.414,.614,4},{.421,.736,4},{.432,.740,4},{.436,.836,3},{.443,.745,4},{.446,.820,1},{.459,.208,3},{.478,.229,3},{.484,.827,3},{.488,.791,2},{.494,.720,4},{.496,.230,3},{.514,.226,3},{.527,.654,4},{.531,.225,3},{.541,.661,4},{.555,.250,3},{.557,.854,3},{.703,.303,2},{.727,.324,2},{.735,.320,2},{.736,.332,2},{.750,.322,2},{.752,.883,3},{.758,.322,2},{.758,.383,2},{.767,.379,2},{.767,.926,3},{.773,.386,2},{.783,.376,3},{.786,.342,3},{.804,.594,3},{.814,.659,4},{.818,.496,3},{.818,.673,4},{.819,.657,4},{.822,.679,4},{.876,.452,3},{.885,.596,3},{.885,.753,3},{.887,.616,3},{.908,.518,3}},
wayrest={{.069,.786,3},{.16,.768,3},{.393,.76,3},{.451,.763,3},{.486,.485,1},{.53,.396,2},{.538,.557,2},{.554,.671,1},{.586,.609,1},{.596,.676,1},{.747,.093,2},{.765,.874,3},{.79,.825,3},{.82,.73,3},{.854,.455,3},{.871,.17,2},{.982,.389,3}},
westernskryim={{.742,.316,3},{.088,.38,3},{.135,.342,3},{.114,.359,3},{.129,.355,3},{.142,.327,3},{.174,.293,3},{.267,.273,3},{.534,.225,3},{.606,.266,3},{.323,.242,3},{.354,.248,3},{.48,.238,3},{.191,.312,3},{.205,.294,3},{.245,.277,3},{.238,.267,3},{.285,.262,3},{.307,.262,3},{.304,.244,3},{.313,.227,3},{.334,.247,3},{.343,.237,3},{.375,.265,3},{.377,.247,3},{.4,.253,3},{.424,.273,3},{.425,.24,3},{.443,.245,3},{.572,.208,3},{.57,.236,3},{.587,.215,3},{.612,.219,3},{.617,.249,3},{.612,.337,3},{.505,.463,2},{.541,.452,2},{.457,.474,2},{.47,.485,2},{.399,.498,2},{.361,.535,2},{.346,.54,2},{.336,.546,2},{.3,.563,2},{.156,.592,2},{.265,.669,2},{.279,.679,2},{.377,.522,2},{.4,.62,2},{.381,.628,4},{.373,.628,4},{.372,.616,4},{.415,.637,2},{.475,.736,2},{.473,.759,2},{.471,.709,2},{.517,.688,2},{.561,.679,2},{.596,.604,2},{.605,.574,2},{.665,.564,4},{.675,.563,4},{.685,.552,4},{.692,.56,4},{.705,.572,4},{.715,.576,4},{.717,.585,4},{.705,.584,4},{.695,.574,4},{.674,.563,4},{.678,.574,4},{.785,.527,4},{.767,.517,4},{.765,.506,4},{.747,.5,4},{.741,.495,4},{.709,.37,3},{.689,.355,3},{.342,.441,4},{.334,.421,4},{.332,.431,4}},
windhelm={{.787,.54,3},{.79,.447,3},{.833,.558,3},{.861,.504,3},{.866,.416,3},{.951,.124,3},{.984,.231,3}},
woodhearth={{.1,.46,3},{.224,.556,3},{.309,.067,1},{.345,.666,3},{.376,.532,3},{.405,.787,3},{.441,.527,3},{.518,.604,4},{.531,.935,3},{.595,.806,3},{.696,.866,3},{.767,.98,3}},
wrothgar={{.194,.673,3},{.195,.772,4},{.198,.678,3},{.203,.789,2},{.203,.785,4},{.224,.798,4},{.225,.674,3},{.237,.779,4},{.238,.674,3},{.239,.667,3},{.244,.765,2},{.244,.818,4},{.249,.75,2},{.255,.826,4},{.262,.694,3},{.271,.669,3},{.28,.657,3},{.292,.686,3},{.306,.693,3},{.307,.67,3},{.318,.626,3},{.32,.654,3},{.321,.665,3},{.322,.6,3},{.322,.678,3},{.324,.641,3},{.326,.618,3},{.336,.679,2},{.337,.578,3},{.339,.644,2},{.339,.599,2},{.34,.734,4},{.341,.721,4},{.345,.747,4},{.346,.614,2},{.355,.568,3},{.356,.723,4},{.358,.631,2},{.361,.654,2},{.361,.849,1},{.367,.555,3},{.369,.652,2},{.373,.71,4},{.38,.559,3},{.384,.672,4},{.385,.547,3},{.386,.693,4},{.387,.515,3},{.39,.705,4},{.393,.522,3},{.394,.685,4},{.395,.542,3},{.403,.5,3},{.404,.549,2},{.407,.489,3},{.407,.552,2},{.407,.518,2},{.408,.729,1},{.414,.728,1},{.415,.498,3},{.418,.482,3},{.426,.75,1},{.428,.5,2},{.43,.523,2},{.431,.763,1},{.433,.752,1},{.442,.495,2},{.443,.771,1},{.444,.482,3},{.456,.791,1},{.457,.785,1},{.458,.781,1},{.46,.521,2},{.462,.787,1},{.464,.786,1},{.477,.443,3},{.482,.437,3},{.49,.436,3},{.49,.512,2},{.499,.424,3},{.499,.512,4},{.509,.407,3},{.522,.419,3},{.522,.391,3},{.526,.522,4},{.533,.43,4},{.533,.462,2},{.534,.419,3},{.535,.332,4},{.535,.364,4},{.536,.514,2},{.544,.373,4},{.545,.542,2},{.545,.555,2},{.547,.512,2},{.549,.4,3},{.551,.493,2},{.553,.412,4},{.556,.581,2},{.56,.391,4},{.563,.402,4},{.563,.417,4},{.564,.383,4},{.564,.383,4},{.568,.393,4},{.569,.424,4},{.572,.373,4},{.576,.638,2},{.584,.677,2},{.592,.655,2},{.598,.658,2},{.615,.656,2},{.618,.66,2},{.636,.662,2},{.644,.569,4},{.649,.547,4},{.651,.563,4},{.696,.685,2},{.714,.682,2},{.741,.355,2},{.754,.366,2},{.758,.306,2},{.76,.473,2},{.765,.487,2},{.765,.461,2},{.769,.415,2},{.77,.431,2},{.773,.393,2},{.781,.497,2},{.785,.499,2},{.79,.539,2},{.791,.504,2},{.791,.519,2},{.8,.565,2},{.804,.56,2},{.809,.555,2},{.819,.337,2},{.822,.342,2},{.827,.409,2},{.83,.559,2},{.834,.563,2},{.834,.411,2},{.835,.488,2},{.84,.564,2},{.849,.479,2},{.867,.539,2},{.869,.548,2},{.874,.47,2}}
}
local FishingZones={
	[2]=471,--Glenumbra
	[4]=472,--Stormhaven
	[5]=473,--Rivenspire
	[9]=477,--Stonefalls
	[10]=478,--Deshaan
	[11]=486,--Malabal Tor
	[14]=475,--Bangkorai
	[15]=480,--Eastmarch
	[16]=481,--Rift
	[17]=474,--Alik'r Desert
	[18]=485,--Greenshade
	[19]=479,--Shadowfen
	[37]=489,--Cyrodiil
	[154]=490,--Coldhabour
	[178]=483,--Auridon
	[179]=487,--Reaper's March
	[180]=484,--Grahtwood
	[500]=916,--Carglorn
	[109]=493,--Bleakrock
	[304]=491,--Stros M'Kai
	[306]=492,--Khenarthi's Roost
	--DLC
	[346]=1186,--Imperial City
	[379]=1340,--Wrothgar
	[442]=1351,--Hew's Bane
	[448]=1431,--Gold Coast
	[467]=1882,--Vvardenfell
	[589]=2027,--Clockwork City
	[590]=2027,--Clockwork City Brass Fortress
	[616]=2191,--Summerset
	[632]=2240,--Arteum
	[407]=2295,--Murkmire
	[681]=2412,--Northern Elsweyr
	[720]=2566,--Southern Elsweyr
	[743]=2655,--Greymoor
	[783]=2861,--Markarth
	[834]=2981,--Blackwood
	[857]=3144,--Deadlands
	[883]=3269,--High Isle
	[929]=3500,--Firesong
	[958]=3636,--Necrom
	bleakrockvillage=493,
	murkmire=2295,rootwhisper=2295,brightthroatvillage=2295,lilmothcity=2295,
	imperialcity=1186,
	wrothgar=1340,
	hewsbane=1351,
	goldcoast=1431,anvilcity=1431,kvatchcity=1431,
	vvardenfell=1882,
	clockwork=2027,brassfortress=2027,
	summerset=2191,lillandrill=2191,
	artaeum=2240,
	blackreach=2655,
	U28_blackreach=2861,
	u38_apocrypha=3636
}
local FishingAchievements={[471]=true,[472]=true,[473]=true,[474]=true,[475]=true,[477]=true,[478]=true,[479]=true,[480]=true,[481]=true,[483]=true,[484]=true,[485]=true,[486]=true,[487]=true,[489]=true,[490]=true,[491]=true,[492]=true,[493]=true,[916]=true,[1186]=true,[1339]=true,[1340]=true,[1351]=true,[1431]=true,[1882]=true,[2191]=true,[2240]=true,[2295]=true,[2412]=true,[2566]=true,[2655]=true,[2861]=true,[2981]=true,[3144]=true,[3500]=true,[3636]=true}
local FishingBugFix={[473]={[3]="River"},[2027]={[8]="Oily"},[472]={[1]="Foul"}}
local Volendrung={ava_whole_0={
--ALLIANCE_ALDMERI_DOMINION
{.483,.791,1},
{.641,.769,1},
{.408,.636,1},
{.34,.709,1},
{.531,.876,1},
{.525,.619,1},
--ALLIANCE_EBONHEART_PACT
{.752,.486,2},	--Pact is nearest
{.685,.532,2},
{.711,.143,2},
{.631,.302,2},
{.776,.278,2},
{.484,.546,2},
{.711,.393,2},
{.595,.382,2},
{.844,.166,2},
--ALLIANCE_DAGGERFALL_COVENANT
{.199,.372,3},
{.349,.164,3},
{.209,.224,3},
{.108,.231,3},
{.302,.351,3},
{.392,.361,3},
{.483,.22,3},	--Border of the Pact and Covenant
}}
local ImperialCity={--Provided by remosito
imperialcity={
[70]={--Bosses
{.658,.383,"Glorgoloch the Destroyer / King Khrogo"},--ARENA
{.682,.615,"Lady Malygda / Ysenda Resplendent"},--Arboretum
{.505,.833,"Immolator Charr / Mazaluhad"},--TEMPLE
{.206,.679,"Amoncrul"},--NOBLES
{.182,.634,"Baron Thirsk"},--NOBLES
{.236,.359,"Zoal the Ever-Wakeful / The Screeching Matron"},--ELVEN GARDENS
{.496,.295,"Nunatak / Volghass"}},--MEMORIAL
[71]={--Respawn
--ALLIANCE_ALDMERI_DOMINION
{.647,.313,1},--ARENA
{.847,.607,1},--Arboretum
{.637,.809,1},--TEMPLE
{.295,.538,1},--NOBLE
{.345,.363,1},--ELVEN GARDENS
{.565,.195,1},--MEMORIAL
--ALLIANCE_DAGGERFALL_COVENANT
{.734,.472,3},--ARENA
{.797,.718,3},--Arboretum
{.381,.785,3},--TEMPLE
{.275,.759,3},--NOBLE
{.314,.288,3},--ELVEN GARDENS
{.541,.298,3},--MEMORIAL
--ALLIANCE_EBONHEART_PACT
{.851,.452,2},--ARENA
{.863,.533,2},--Arboretum
{.55,.72,2},--TEMPLE
{.35,.712,2},--NOBLE
{.308,.455,2},--ELVEN GARDENS
{.409,.234,2}},--MEMORIAL
}}
local AllianceColors={
[ALLIANCE_ALDMERI_DOMINION]={1,1,0,.8},
[ALLIANCE_EBONHEART_PACT]={1,.2,.2,.8},
[ALLIANCE_DAGGERFALL_COVENANT]={.2,.2,1,.8}
}
local PrecursorItems={
[129900]=1,	--Left arm
[129901]=2,	--Right arm
[129902]=3,	--Left leg
[129903]=4,	--Right leg
[129904]=5,	--Pelvis
[129905]=6,	--Chestpiece
[129906]=7,	--Spine
[129907]=8,	--Left hand
[129908]=9,	--Right hand
[129909]=10,--Dynamo
[129910]=11,--Calculus
[129911]=12,--Introspection
[129912]=13,--Reason
[129913]=14,--Staff
}
local PrecursorTooltip={
	{v=1,desc="  Alik'r Desert: Yldzuun"},
	{v=4,desc="  Alik'r Desert: Santaki"},
	{v=6,desc="  Alik'r Desert: Aldunz"},
	{v=2,desc="  Bangkorai: Klathzgar"},
	{v=3,desc="  Rift: Avancheznel"},
	{v=7,desc="  Eastmarch: Mzulft"},
	{v=8,desc="  Stonefalls: Inner Sea Armature"},
	{v=9,desc="  Deshaan: Mzithumz"},
	{v=5,desc="  Deshaan: Lower Bthanual"},
	{v=14,desc="Deshaan: Bthanual"},
	{v=10,desc="Stros M'Kai: Bthzark"},
	{v=11,desc="Brass Bortress: Mechanical Fundament"},
	{v=12,desc="Clockwork Base"},
	{v=13,desc="Brass Bortress: Machine District"}
	}
local Instruments={
[156666]=2,	--Lute of Blue Longing
[156797]=3,	--Chime of the Endless
[156798]=4,	--Tenderclaw 
[156799]=5,	--Shadow of Rahjin
[156800]=6,	--Lilytongue
[156801]=7,--Sky talker
[156802]=8,	--Long Fire
[156803]=9,	--Hightmourn Dizi
[156804]=10,	--Jarlsbane
[156805]=11,	--King Thunder
[156806]=12,	--Jahar Fuso'ja
[156807]=13,	--Pan Flute of Morachellis
[156808]=14,	--Reman War Drum
[160510]=15,	--Ateian Fife
[160511]=16,	--Shiek-of-Silk
[160512]=17,	--Kothringi Leviathan Bugle
[160514]=18,	--Lodestone
[160515]=19,	--Dozzen Talharpa
}
local InstrumentsTooltip={
	{v=2,desc="  Nchuthnkarst: Lute of Blue Longing"},
	{v=3,desc="  Blackreach: Chime of the Endless"},
	{v=4,desc="  Shadowgreen: Tenderclaw "},
	{v=5,desc="  Dragonhome: Shadow of Rahjin"},
	{v=6,desc="  Chill Wind Depths: Lilytongue"},
	{v=7,desc="  Labyrinthian: Sky talker"},
	{v=8,desc="  Western Skryim: Long Fire"},
	{v=9,desc="  Scraps: Hightmourn Dizi"},
	{v=10,desc="Western Skryim: Jarlsbane"},
	{v=11,desc="Western Skryim: King Thunder"},
	{v=12,desc="Western Skryim: Jahar Fuso'ja"},
	{v=13,desc="Blackreach: Pan Flute of Morachellis"},
	{v=14,desc="Blackreach: Reman War Drum"},
	{v=15,desc="Blackreach: Ateian Fife"},
	{v=16,desc="Western Skryim: Shiek-of-Silk"},
	{v=17,desc="Western Skryim: Kothringi Leviathan Bugle"},
	{v=18,desc="Western Skryim: Lodestone"},
	{v=19,desc="Western Skryim: Dozzen Talharpa"},
	}
local MiningSampleCollector={[7373]=1,[7375]=2,[7377]=3,[7385]=4,[7379]=5}
local MiningSampleTooltip={
	{v=1,desc="Kelbarn's Mining Samples"},
	{v=2,desc="Inguya's Mining Samples"},
	{v=3,desc="Reeh-La's Mining Samples"},
	{v=4,desc="Adanzda's Mining Samples"},
	{v=5,desc="Ghamborz's Mining Samples"},
}
local CustomPins={	--Types
	[1]={name="pinType_Delve_bosses",done=false,id={},pin={},maxDistance=0.05,level=30,texture="/esoui/art/icons/poi/poi_groupboss_incomplete.dds",k=1.25},--tint=ZO_ColorDef:New(1,1,1,1),
	[2]={name="pinType_Delve_bosses_done",done=true,id={},pin={},maxDistance=0.05,level=30,texture="/esoui/art/icons/poi/poi_groupboss_complete.dds",k=1.25},
	[3]={name="pinType_Skyshards",done=false,id={},pin={},maxDistance=0.05,level=100,texture="/esoui/art/mappins/skyshard_seen.dds",k=1.40},
--	[4]={name="pinType_Skyshards_done",done=true,id={},pin={},maxDistance=0.05,level=30,texture="/esoui/art/tutorial/gamepad/achievement_categoryicon_skyshards.dds",k=1.38},
	[5]={name="pinType_Lore_books",done=false,id={},pin={},maxDistance=0.05,level=100,texture="/"..AddonName.."/Lorebook_1.dds",k=1,tint=ZO_ColorDef:New(.6,.6,1,.8)},
--	[6]={name="pinType_Lore_books_done",done=true,id={},pin={},maxDistance=0.05,level=30,texture="/"..AddonName.."/Lorebook_2.dds",k=1,tint=ZO_ColorDef:New(.6,.6,1,.8)},
	[6]={name="pinType_Treasure_Maps",done=false,id={},pin={},maxDistance=0.05,level=101,texture=function(self) return self.m_PinTag.texture end,def_texture="/"..AddonName.."/Treasure_1.dds",k=1.4},
	[7]={name="pinType_Treasure_Chests",done=false,id={},pin={},maxDistance=0.05,level=100,texture="/"..AddonName.."/Chest_1.dds",k=1.1,tint=ZO_ColorDef:New(1,1,1,.8)},	--,tint=ZO_ColorDef:New(.8,.8,.5,.9)
	[8]={name="pinType_Unknown_POI",done=false,id={},pin={},maxDistance=0.05,level=10,texture=function(self) return self.m_PinTag.texture end,def_texture="/esoui/art/icons/poi/poi_areaofinterest_incomplete.dds",size=40,tint=ZO_ColorDef:New(.7,.7,.7,.6)},
	[9]={section=true,name="Undaunted",id={},pin={},texture="/esoui/art/icons/crafting_beer_003.dds",
		[45]={name="pinType_This_One's_On_Me",done=false,ach=704,maxDistance=0.05,level=101,texture="/esoui/art/icons/crafting_beer_003.dds",k=1},
		[46]={name="pinType_Undaunted_Rescuer",done=false,ach=1082,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25,def_texture="/esoui/art/icons/ability_warrior_007.dds"}
		},
	[10]={section=true,name="World_achievements",id={},pin={},texture="/esoui/art/progression/progression_indexicon_world_up.dds",
		[33]={name="pinType_I_like_M'aiq",done=false,ach=872,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_066.dds",k=1},
		[34]={name="pinType_Lightbringer",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25},
		[40]={name="pinType_Peacemaker",done=false,ach=716,maxDistance=0.05,level=101,texture="/esoui/art/icons/ability_healer_017.dds",k=1},
		},
	[11]={section=true,name="Orsinium",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_wrothgar_up.dds",	--"/esoui/art/icons/store_orsiniumdlc_collectable.dds",
		[36]={name="pinType_One_Last_Brawl",done=false,ach=1247,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_wrothgar_010.dds",k=1},
		[37]={name="pinType_Orsinium_world_event",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25,def_texture="/esoui/art/icons/achievement_wrothgar_024.dds"},
		[38]={name="pinType_Wrothgar_Relic_Hunter",done=false,ach=1250,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_wrothgar_008.dds",k=1},
		},
	[12]={section=true,name="Thieves_guild",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_thievesguild_up.dds",	--"/esoui/art/icons/store_thievesguilddlc_collectable.dds",
		[32]={name="pinType_A_Cutpurse_Above",done=false,ach=1379,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_thievesguild_044.dds",k=1},
		[39]={name="pinType_Breaking_And_Entering",done=false,ach=1349,maxDistance=0.05,level=101,texture="/esoui/art/icons/perks_theives_guild_004.dds",k=1},
		},
	[13]={section=true,name="Morrowind",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_morrowind_up.dds",	--"/esoui/art/icons/store_morrowind_collectable.dds",
		[30]={name="pinType_Vivec_Lessons",done=false,ach=1824,maxDistance=0.05,level=100,texture="/"..AddonName.."/Scroll_1.dds",k=1,tint=ZO_ColorDef:New(.8,.8,.8,.8)},
		[31]={name="pinType_Ancestral_Tombs",done=false,ach=1712,maxDistance=0.05,level=30,texture="/esoui/art/icons/poi/poi_crypt_incomplete.dds",k=1},
		[44]={name="pinType_Pilgrim's_Path",done=false,ach=1827,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25,def_texture="/esoui/art/icons/achievement_vvardenfel_032.dds"},
		},
	[14]={section=true,name="Summerset",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_summerset_up.dds.dds",	--"/esoui/art/icons/store_summerset_collectable.dds",
		[41]={name="pinType_Summerset_Relics",done=false,ach=2099,maxDistance=0.05,level=101,texture="/esoui/art/icons/quest_strosmkai_open_treasure_chest.dds",k=1},
		[42]={name="pinType_Message_in_Bottle",done=false,ach=2211,maxDistance=0.05,level=100,texture="/esoui/art/icons/crafting_stoneware_bottle_003.dds",k=1},
		[43]={name="pinType_Summerset_world_event",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25,def_texture="/esoui/art/icons/achievement_su_rds_01.dds"},
		},
	[15]={name="pinType_Time_Rifts",done=false,id={},pin={},maxDistance=0.05,level=101,texture="/"..AddonName.."/Treasure_1-2.dds",k=1.8},
	[16]={name="pinType_Shrines",done=false,id={},pin={},maxDistance=0.05,level=101,texture="/esoui/art/icons/poi/poi_daedricruin_incomplete.dds",k=1.25},
	[17]={name="pinType_Fishing_Nodes",done=false,id={},pin={},maxDistance=0.05,level=101,texture="/esoui/art/icons/achievements_indexicon_fishing_up.dds",k=1.25},
	[18]={section=true,name="pinType_Clockwork_City",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_cwc_up.dds",	--"/art/fx/texture/clockworksigil.dds",
		[47]={name="pinType_Precursor_Maker",done=false,ach=1958,maxDistance=0.05,level=101,texture="/esoui/art/menubar/gamepad/gp_playermenu_icon_settings.dds",k=1,def_texture="/esoui/art/icons/achievement_update16_001.dds"},
		},
	[19]={section=true,name="pinType_Murkmire",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_murkmire_up.dds",	--"/esoui/art/icons/store_murkmiredlc_collectable.dds",
		[48]={name="pinType_Chronic_Chronogler",done=false,ach=2320,maxDistance=0.05,level=101,texture="/esoui/art/inventory/gamepad/gp_inventory_icon_craftbag_stylematerial.dds",k=1,def_texture="/esoui/art/icons/achievement_murkmire_museum.dds"},
		[49]={name="pinType_Poems_of_Nothing",done=false,ach=2341,maxDistance=0.05,level=101,texture="/"..AddonName.."/Scroll_1.dds",k=1},
		[50]={name="pinType_Achievement_quests",done=false,ach=2355,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1},	--esoui/art/floatingmarkers/quest_icon.dds
		[51]={name="pinType_Surreptitiously_Shadowed",done=false,ach=2330,maxDistance=0.05,level=111,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_murkmire_shadowscale_wisdom.dds"},
		[52]={name="pinType_Swamp_Rescuer",done=false,ach=2358,maxDistance=0.05,level=101,texture="/esoui/art/death/death_soulreservoir_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_murkmire_rescue_villagers.dds"},
		[53]={name="pinType_Vine-Tongue_Traveler",done=false,ach=2357,maxDistance=0.05,level=101,texture="/"..AddonName.."/Lorebook_1-2.dds",k=1,def_texture="/esoui/art/icons/mh_hedgeguardian_strang.dds"},
		},
	[20]={section=true,name="pinType_Elsweyr",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_elsweyr_up.dds",
		[54]={name="pinType_Mural_Mender",done=false,ach=2463,maxDistance=0.05,level=101,texture="/esoui/art/inventory/gamepad/gp_inventory_icon_craftbag_stylematerial.dds",k=1,def_texture="/esoui/art/icons/achievement_els_museum_mural.dds"},
		[55]={name="pinType_Pieces_of_History",done=false,ach=2534,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_u24_museum_tapestry.dds"},
		[56]={name="pinType_Theater_Critic",done=false,ach=2619,maxDistance=0.05,level=101,texture="/"..AddonName.."/Scroll_1.dds",k=1,def_texture="/esoui/art/icons/quest_book_003.dds"},
		[57]={name="pinType_Legacy_Slayer",done=false,ach=2621,maxDistance=0.05,level=101,texture="/esoui/art/icons/poi/poi_groupboss_incomplete.dds",k=1.25,def_texture="/esoui/art/icons/achievement_u24_familyofpirates.dds"},
		[58]={name="pinType_Grappling_Bow_Pathfinder",done=false,ach=2620,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1,def_texture="/esoui/art/icons/achievement_u24_grappletreasures.dds"},
		},
	[21]={name="pinType_Volendrung",id={},pin={},maxDistance=0.05,level=30,texture="/esoui/art/miscellaneous/help_icon.dds",k=1.25},
	[22]={section=true,name="pinType_Greymoor",id={},pin={},texture="/esoui/art/treeicons/tutorial_indexicon_greymoor_up.dds",
		[59]={name="pinType_Instrumental_Triumph",done=false,ach=2669,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_u26_skyrim_sounds_of_success.dds"},
--		[60]={name="pinType_???",done=false,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1,def_texture="/esoui/art/icons/achievement_u24_grappletreasures.dds"},
--		[61]={name="pinType_???",done=false,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1,def_texture="/esoui/art/icons/achievement_u24_grappletreasures.dds"},
		[68]={name="Mining_Sample_Collector",done=false,ach=2759,maxDistance=0.05,level=101,texture="/esoui/art/icons/poi/poi_mine_compete.dds",k=1,def_texture="/esoui/art/icons/achievement_u26_skyrim_minerquest.dds"},
		},
	[23]={section=true,name="pinType_Antiquities",id={},pin={},texture="/esoui/art/icons/servicetooltipicons/servicetooltipicon_antiquities.dds", k=1.40,
		[62]={name="pinType_Antiquity_Leads",done=false,maxDistance=0.05,level=101,texture="/esoui/art/icons/servicetooltipicons/servicetooltipicon_antiquities.dds", k=1.40},
		},
	[24]={section=true,name="pinType_Blackwood",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_blackwood_up.dds",
		[63]={name="pinType_Lost_in_Wilds",done=false,ach=3083,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1,def_texture="/esoui/art/icons/achievement_u30_flavor4.dds"},
		[64]={name="pinType_Bane_of_Sul-Xan",done=false,ach=3081,maxDistance=0.05,level=101,texture="/esoui/art/death/death_soulreservoir_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_u30_flavor2.dds"},
		[65]={name="pinType_Most_Admired",done=false,ach=3082,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_u30_rds.dds"},
		[66]={name="pinType_Random_Encounters",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1},
		[67]={name="pinType_Leyawiin_Master_Burglar",done=false,ach=3080,maxDistance=0.05,level=101,texture="/esoui/art/icons/servicetooltipicons/servicetooltipicon_bagvendor.dds",k=1,def_texture="/esoui/art/icons/achievement_u30_flavor1.dds"},
		},
	[25]={section=true,name="pinType_Imperial_City",id={},pin={},texture="/esoui/art/compass/ava_imperialcity_neutral.dds",
		[70]={name="pinType_IC_Bosses",done=false,maxDistance=0.05,level=101,texture="/esoui/art/icons/poi/poi_groupboss_incomplete.dds",k=1.25},
		[71]={name="pinType_IC_Respawns",done=false,maxDistance=0.05,level=101,texture="/esoui/art/death/death_soulreservoir_icon.dds",k=1},
		[72]={name="pinType_Cunning_Scamp",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_ic_telvarscamp.dds"},
		[73]={name="pinType_Trove_Scamp",done=false,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_ic_treasurescamp.dds"},
		},
	[26]={name="pinType_Portals",id={},pin={},maxDistance=0.05,level=30,texture="/esoui/art/icons/poi/poi_portal_complete.dds",k=1.26},
	[27]={section=true,name="pinType_High_Isle",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_highisle_up.dds",
		[74]={name="pinType_Seeker_of_the_Green",done=false,ach=3298,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_u34_flavor4_druid.dds",k=1,def_texture="/esoui/art/icons/achievement_u34_flavor4_druid.dds"},
		[75]={name="pinType_No_Regrets",done=false,ach=3424,maxDistance=0.05,level=101,texture="/esoui/art/tutorial/gamepad/gp_icon_new.dds",k=1,def_texture="/esoui/art/icons/u34_flavor5_drunkedleap.dds"},
		[76]={name="pinType_Inventor_of_Adventure",done=false,ach=3299,maxDistance=0.05,level=101,texture="/esoui/art/miscellaneous/help_icon.dds",k=1,def_texture="/esoui/art/icons/achievement_u34_rds.dds"},
		[77]={name="pinType_Gonfalon_Bays_Master_Burglar",done=false,ach=3295,maxDistance=0.05,level=101,texture="/esoui/art/icons/servicetooltipicons/servicetooltipicon_bagvendor.dds",k=1,def_texture="/esoui/art/icons/achievement_u34_flavor1_lockbox.dds"},
		},
	[28]={section=true,name="pinType_Necrom",id={},pin={},texture="/esoui/art/treeicons/tutorial_idexicon_necrom_up.dds",
		[78]={name="pinType_Syzygy",done=false,ach=3678,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_u38_flavor4.dds",k=1,def_texture="/esoui/art/icons/achievement_u38_flavor4.dds"},
		[79]={name="pinType_Tomes_of_Uknown_Color",done=false,ach=3677,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_u38_flavor3.dds",k=1,def_texture="/esoui/art/icons/achievement_u38_flavor3.dds"},
		[80]={name="pinType_Grave_Discoveries",done=false,ach=3675,maxDistance=0.05,level=101,texture="/esoui/art/icons/achievement_u38_flavor1.dds",k=1,def_texture="/esoui/art/icons/achievement_u38_flavor1.dds"},
		[81]={name="pinType_Slaughtered_by_Tentacles",done=false,ach=3749,maxDistance=0.05,level=101,texture="/esoui/art/icons/u38_slaughtered_apocrypha.dds",k=1,def_texture="/esoui/art/icons/u38_slaughtered_apocrypha.dds"},
		},
	}
local PinsAva={[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[17]=true,[21]=true}
local PinsNirn={[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true,[12]=true,[13]=true,[14]=true,[15]=true,[16]=true,[17]=true,[18]=true,[19]=true,[20]=true,[22]=true,[23]=true,[24]=true,[26]=true,[27]=true,[28]=true}
local PinsImperial={[3]=true,[4]=true,[5]=true,[7]=true,[8]=true,[25]=true}
--	/script local name,_,_,icon=GetAchievementInfo(3295) StartChatInput(icon)
--	/script StartChatInput(ZO_AchievementsContentsCategoriesScrollChildZO_IconHeader12Icon:GetTextureFileName())
--	/script StartChatInput(GetCollectibleIcon(912))
--	/script d("|t26:26:/esoui/art/icons/servicetooltipicons/servicetooltipicon_bagvendor.dds|t")

local function GetSetDescription(setData)
	if setData then
		local itemLink=("|H1:item:%d:370:50:0:0:0:0:0:0:0:0:0:0:0:0:1:0:0:0:10000:0|h|h"):format(setData[1])
		local _, setName, numBonuses=GetItemLinkSetInfo(itemLink)
		local setBonuses=zo_strformat("|cEEEEEE<<1>> traits required|r\n", setData[2])
		local numRequired, Description
		for i=1, numBonuses do
			numRequired, Description=GetItemLinkSetBonusInfo(itemLink, false, i)
			Description=string.gsub(Description,"%d+ %w+ Health","|cFF2222%1|r")
			Description=string.gsub(Description,"%d+ %w+ Stamina","|c22FF22%1|r")
			Description=string.gsub(Description,"%d+ %w+ Magicka","|c5555EE%1|r")
			Description=string.gsub(Description,"%d+ Health %w+","|cFF2222%1|r")
			Description=string.gsub(Description,"%d+ Stamina %w+","|c22FF22%1|r")
			Description=string.gsub(Description,"%d+ Magicka %w+","|c5555EE%1|r")
			Description=string.gsub(Description,"%d+ Spell Damage","|c5555EE%1|r")
			Description=string.gsub(Description,"%d+ Weapon Damage","|cBBBBBB%1|r")
			Description=string.gsub(Description,"%d+ %w+ Critical","|cBB33BB%1|r")
			setBonuses=setBonuses..Description..(i<numBonuses and "\n" or "")
		end
		return zo_strformat("<<1>> set (<<2>> items)", setName, numRequired), setBonuses
	else
		return "", ""
	end
end

local function GetFishingAchievement(subzone)
--	/script local AchName=GetAchievementCriterion(2295,7) StartChatInput(AchName)
	local id=FishingZones[subzone] or FishingZones[GetCurrentMapZoneIndex()]
	if id then
		local total={Lake=0,Foul=0,River=0,Salt=0,Oily=0,Mystic=0,Running=0}
		for i=1,GetAchievementNumCriteria(id) do
			local AchName,a,b=GetAchievementCriterion(id,i)
			if FishingBugFix[id] and FishingBugFix[id][i] then
				total[ FishingBugFix[id][i] ]=total[ FishingBugFix[id][i] ]+b-a
			else
				for water in pairs(total) do
					if string.match(AchName,"("..Loc(water)..")")~=nil then
						total[water]=total[water]+b-a
					end
				end
			end
		end
		total.Salt=total.Salt+total.Mystic total.Foul=total.Foul+total.Oily total.River=total.River+total.Running
		return {[1]=total.Foul>0,[2]=total.River>0,[3]=total.Salt>0,[4]=total.Lake>0}
	end
	return false
end

--Callbacks
local MapPinCallback={
	[5]=function(i,subzone)
		local mapData=Lorebooks[subzone]
		if mapData then
			for _, pinData in pairs(mapData) do
				local AchName, _, done=GetLoreBookInfo(1, pinData[3], pinData[4])
				if done==CustomPins[i].done then
					PinManager:CreatePin(_G[CustomPins[i].name],{i,pinData[3], pinData[4]},pinData[1],pinData[2])
				end
			end
		end
	end,
	[6]=function(i,subzone)
		local mapData=TreasureMaps[subzone]
		if mapData then
			for _, itemData in pairs(SHARED_INVENTORY:GenerateFullSlotData(nil, BAG_BACKPACK)) do
				if itemData and itemData.itemType==ITEMTYPE_TROPHY then
					for _, pinData in pairs(mapData) do
						if GetItemId(BAG_BACKPACK,itemData.slotIndex)==pinData[3] then
							local pinTag=pinData[4] and
								(
								type(pinData[4])=="string" and {[1]=i,[2]=itemData.slotIndex,texture="esoui/art/icons/gear_reach_"..pinData[4].."_c.dds"}
	--								or pinData[4]==4 and	--Jewelry survey
								or {[1]=i,[2]=itemData.slotIndex,texture="/"..AddonName.."/Treasure_"..(itemData.stackCount>1 and 4 or 3)..".dds"}
								)
							or {[1]=i,[2]=itemData.slotIndex,texture="/"..AddonName.."/Treasure_2.dds"}	--Treasure map
							CustomPins[i].tint=type(pinData[4])=="string" and ZO_ColorDef:New(1,.3,.3,1) or nil
							pinTag.icon=itemData.iconFile
							PinManager:CreatePin(_G[CustomPins[i].name],pinTag,pinData[1],pinData[2])
							if LastZone~=subzone then
								LastZone=subzone
								d('You can find "'..itemData.name..'" in this zone')
							end
						end
					end
				end
			end
		end
	end,
	[7]=function(i,subzone)
		local id=_G[CustomPins[i].name]
		local mapData=ChestData[subzone]
		local x,y=GetMapPlayerPosition("player")
		local mult=GetMapContentType()==MAP_CONTENT_DUNGEON and 4 or 1
		if mapData then
			local FindersKeepers=select(6,GetSkillAbilityInfo(5,5,1))
			for chType, chData in pairs(mapData) do
				for chest, pinData in pairs(chData) do
					if math.abs(pinData[1]-x)<ChestsRange*mult and math.abs(pinData[2]-y)<ChestsRange*mult then
						if chType==2 and FindersKeepers then
							CustomPins[i].tint=ZO_ColorDef:New(.6,.6,1,.8)
							PinManager:CreatePin(id,{i,pinData[1], pinData[2]},pinData[1],pinData[2])
						elseif chType==1 then
							CustomPins[i].tint=ZO_ColorDef:New(1,1,1,.8)
							PinManager:CreatePin(id,{i,pinData[1], pinData[2]},pinData[1],pinData[2])
						end
					end
				end
			end
			CustomPins[i].tint=ZO_ColorDef:New(1,1,1,.8)
		end
		mapData=CustomChestData[subzone]
		if mapData then
			CustomPins[i].tint=ZO_ColorDef:New(.4,1,.4,.8)
			for chest, pinData in pairs(mapData) do
				if math.abs(pinData[1]-x)<ChestsRange*mult and math.abs(pinData[2]-y)<ChestsRange*mult then
					PinManager:CreatePin(id,{i,pinData[1], pinData[2]},pinData[1],pinData[2])
				end
			end
			CustomPins[i].tint=ZO_ColorDef:New(1,1,1,.8)
		end
	end,
	[8]=function(i,subzone)
		local zoneIndex=GetCurrentMapZoneIndex()
		local mapData=UnknownPOI[GetZoneId(zoneIndex)]
		if mapData then
			for poiIndex, data in pairs(mapData) do
				local normalizedX,normalizedY,poiType,_,_,_,known=GetPOIMapInfo(zoneIndex, poiIndex)
				if not known and (normalizedX>0 or normalizedY>0) then	--poiType==MAP_PIN_TYPE_INVALID then
					local pinTag={[1]=i,name=data[1],texture=UnknownPOItexture[ data[2] ]}
					if data[2]==25 then	--Mundus
						pinTag.desc=MundusDescription[ data[3] ]
					elseif data[2]==8 then	--Crafting station unknown
						if data[3] then
							pinTag.name,pinTag.desc=GetSetDescription(data[3])
						else
							pinTag.name=data[1]
						end
					end
					local id=_G[CustomPins[i].name] PinManager:CreatePin(id,pinTag,normalizedX,normalizedY)
					local size=(BUI and BUI.name=="BanditsUserInterface" and BUI.init.MiniMap) and 40*BUI.Vars.PinScale/100 or 40 ZO_MapPin.PIN_DATA[id].size=size
				elseif data[2]==25 then	--Mundus
					local pinTag={[1]=i,name=GetAbilityName(data[3]),texture="/esoui/art/icons/poi/poi_mundus_complete.dds"} pinTag.desc=MundusDescription[ data[3] ]
					local id=_G[CustomPins[i].name] PinManager:CreatePin(id,pinTag,normalizedX,normalizedY)
					local size=(BUI and BUI.name=="BanditsUserInterface" and BUI.init.MiniMap) and 40*BUI.Vars.PinScale/100 or 40 ZO_MapPin.PIN_DATA[id].size=size
				elseif data[2]==8 and data[3] then	--Crafting station known
					local pinTag={[1]=i,texture="/esoui/art/icons/mapkey/mapkey_crafting.dds"} pinTag.name,pinTag.desc=GetSetDescription(data[3])
					local id=_G[CustomPins[i].name] PinManager:CreatePin(id,pinTag,normalizedX,normalizedY)
					local size=(BUI and BUI.name=="BanditsUserInterface" and BUI.init.MiniMap) and 40*BUI.Vars.PinScale/100 or 40 ZO_MapPin.PIN_DATA[id].size=size
				end
			end
		end
	end,
	[15]=function(i,subzone)--Psijic portals
		local mapData=TimeBreach[subzone]
		local level=GetSkillLineXPInfo(5,PsijicSkillLine)
		if mapData then
			for i1,pinData in ipairs(mapData) do
				if pinData[3]==level/10+2 and not (SavedVars.TimeBreachClosed[subzone] and SavedVars.TimeBreachClosed[subzone][i1]) then
					PinManager:CreatePin(_G[CustomPins[i].name],{i,pinData[3], pinData[4]},pinData[1],pinData[2])
				end
			end
		end
	end,
	[16]=function(i,subzone)
		local mapData=Shrines[subzone]
		if mapData then
			for i1,pinData in pairs(mapData) do
				CustomPins[i].texture=ShrineIcon[ pinData[3] ]
				PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,texture=ShrineIcon[ pinData[3] ]},pinData[1],pinData[2])
			end
		end
	end,
	[17]=function(i,subzone)
		local mapData=FishingNodes[subzone]
		local notDone=GetFishingAchievement(subzone)
		if mapData and notDone then
			for i1,pinData in pairs(mapData) do
				if notDone[ pinData[3] ] then
					CustomPins[i].texture=FishIcon[ pinData[3] ]
					PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,texture=FishIcon[ pinData[3] ]},pinData[1],pinData[2])
				end
			end
		end
	end,
	[21]=function(i,subzone)
		local mapData=Volendrung[subzone]
		if mapData then
			for i1,pinData in pairs(mapData) do
				PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Volendrung"..i1},pinData[1],pinData[2])
			end
		end
	end,
	[70]=function(i,subzone)--Imperial City bosses
		local mapData=ImperialCity[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for i1,pinData in pairs(mapData) do
					PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name=pinData[3]},pinData[1],pinData[2])
				end
			end
		end
	end,
	[71]=function(i,subzone)--Imperial City player respawns
		local mapData=ImperialCity[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for i1,pinData in pairs(mapData) do
					CustomPins[i].tint=ZO_ColorDef:New(unpack(AllianceColors[ pinData[3] ]))
					PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="ImperialCityRespawn"..i1},pinData[1],pinData[2])
				end
			end
		end
	end,
	[34]=function(i,subzone)--Lightbringer
		local mapData=Achievements[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for _,pinData in pairs(mapData) do
					local Completed
					local zone=ZoneAchievement[subzone]
					if zone then
						local _,c1,r1=GetAchievementCriterion(873,zone)
						local _,c2,r2=GetAchievementCriterion(871,zone)
						local _,c3,r3=GetAchievementCriterion(869,zone)
						Completed=(c1+c2+c3)>=(r1+r2+r3)
					end
					if not Completed then
						PinManager:CreatePin(_G[CustomPins[i].name],{i,pinData[3],pinData[4]},pinData[1],pinData[2])
					end
				end
			end
		end
	end,
	[62]=function(i,subzone)
		local mapData=Achievements[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for i1,pinData in pairs(mapData) do
					if GetNumAntiquitiesRecovered(pinData[3])<1 then	--and not DoesAntiquityHaveLead(pinData[3]) then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name=ZO_CachedStrFormat("<<C:1>>",GetAntiquityName(pinData[3]))},pinData[1],pinData[2])
					end
				end
			end
		end
	end,
	[66]=function(i,subzone)--Blackwood random encounters
		local mapData=Achievements[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for i1,pinData in pairs(mapData) do
					PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Random encounter"},pinData[1],pinData[2])
				end
			end
		end
	end,
	[26]=function(i,subzone)--Portals
		local mapData=Achievements[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for i1,pinData in pairs(mapData) do
					if pinData[3]==1 then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Oblivion portal"},pinData[1],pinData[2])
					elseif pinData[3]==2 then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Dark Fissures"},pinData[1],pinData[2])
					elseif pinData[3]==3 then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Celestial Rift"},pinData[1],pinData[2])
					elseif pinData[3]==4 then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Shadow Fissures"},pinData[1],pinData[2])
					elseif pinData[3]==5 then
						PinManager:CreatePin(_G[CustomPins[i].name],{[1]=i,name="Lava Lasher"},pinData[1],pinData[2])
					end
				end
			end
		end
	end,
}

local function MapPinAddCallback(i)
--	d("["..tostring(i).."] id="..tostring(PinId[i]).." enabled:"..tostring(PinManager:IsCustomPinEnabled(PinId[i])))
	if not CustomPins[i] then d("MapPins: "..tostring(i).." is wrong pin type.") return end
	if UpdatingMapPin[i]==true or GetMapType()>MAPTYPE_ZONE or not PinManager:IsCustomPinEnabled(PinId[i]) then return end
	local MapContentType=GetMapContentType()
	if i==5 and MapContentType==MAP_CONTENT_DUNGEON and IsUnitUsingVeteranDifficulty("player") then return end
	if not IsPlayerActivated() then
		UpdatingMapPin[i]=true
		EVENT_MANAGER:RegisterForEvent(AddonName.."_MapPin_"..i,EVENT_PLAYER_ACTIVATED,
			function()
				EVENT_MANAGER:UnregisterForEvent(AddonName.."_Pin_"..i,EVENT_PLAYER_ACTIVATED)
				UpdatingMapPin[i]=false MapPinAddCallback(i)
			end)
		return
--[[
	elseif UpdatingMapPin[i]~=2 then
		UpdatingMapPin[i]=true
		zo_callLater(function()UpdatingMapPin[i]=2 MapPinAddCallback(i)end,250)
		return
--]]
	end
	UpdatingMapPin[i]=true
--	pl("Map pin "..i.." updating")

	local subzone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
--				string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
	if MapPinCallback[i] then
		MapPinCallback[i](i,subzone)
	elseif i<=4 then
		local mapData
		if i==1 or i==2 then mapData=Bosses[subzone] elseif i==3 or i==4 then mapData=SkyShards[subzone] end
		if mapData then
			for _,pinData in pairs(mapData) do
				local AchName,Completed,Required
				if i==3 or i==4 then
					Completed=GetSkyshardDiscoveryStatus(GetZoneSkyshardId(GetSkyshardAchievementZoneId(pinData[3]),pinData[4]))
					Required=2
				else
					AchName,Completed,Required=GetAchievementCriterion(pinData[3],pinData[4])
				end
				if (Completed==Required)==CustomPins[i].done then
					PinManager:CreatePin(_G[CustomPins[i].name],{i,pinData[3],pinData[4],pinData[5]},pinData[1],pinData[2])
				end
			end
		end
	elseif i>=30 then
		local mapData=Achievements[subzone]
		if mapData then
			mapData=mapData[i]
			if mapData then
				for _,pinData in pairs(mapData) do
					local Completed
					if pinData[4] then
						local _,c1,r1=GetAchievementCriterion(pinData[3],pinData[4])
						Completed=c1>=r1
					else
						Completed=IsAchievementComplete(pinData[3])
					end
					local HaveItem=AchievementItems[ pinData[3] ] and AchievementItems[ pinData[3] ][ pinData[4] ] and true or false
					if Completed==CustomPins[i].done and HaveItem==CustomPins[i].done then
--						if HaveItem~=CustomPins[i].done then CustomPins[11].tint=ZO_ColorDef:New(1,.1,.4,.8) else CustomPins[11].tint=ZO_ColorDef:New(1,1,1,1) end
						PinManager:CreatePin(_G[CustomPins[i].name],{i,pinData[3], pinData[4]},pinData[1],pinData[2])
					end
				end
			end
		end
	end
	UpdatingMapPin[i]=false
end

local function CompassPinAddCallback(i)
	if UpdatingCompassPin[i] or GetMapType()>MAPTYPE_ZONE or not PinManager:IsCustomPinEnabled(PinId[i]) then return end
	local MapContentType=GetMapContentType()
	if (i==1 or i==2) and MapContentType~=MAP_CONTENT_DUNGEON then return end
	if i==5 and MapContentType==MAP_CONTENT_DUNGEON and IsUnitUsingVeteranDifficulty("player") then return end
	UpdatingCompassPin[i]=true
	if not IsPlayerActivated() then
		EVENT_MANAGER:RegisterForEvent(AddonName.."_CompassPin_"..i,EVENT_PLAYER_ACTIVATED,
			function()
				EVENT_MANAGER:UnregisterForEvent(AddonName.."_CompassPin_"..i,EVENT_PLAYER_ACTIVATED)
				UpdatingCompassPin[i]=false
				CompassPinAddCallback(i)
			end)
		return
	end
--	pl("Compass pin "..i.." updating")
	local subzone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
	if i<=4 then
		local mapData if (i==3 or i==4) then mapData=SkyShards[subzone] else mapData=Bosses[subzone] end
		if mapData then
			for _,pinData in pairs(mapData) do
				local AchName,Completed,Required=GetAchievementCriterion(pinData[3],pinData[4])
				if (Completed==Required)==CustomPins[i].done and AchName~="" then
					COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,AchName,pinData[1],pinData[2])
				end
			end
		end
	elseif i==15 then
		local mapData=TimeBreach[subzone]
		local level=GetSkillLineXPInfo(5,PsijicSkillLine)
		local num=1
		if mapData then
			for i1,pinData in ipairs(mapData) do
				if pinData[3]==level/10+2 and not (SavedVars.TimeBreachClosed[subzone] and SavedVars.TimeBreachClosed[subzone][i1]) then
					COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,"TimeRift"..num,pinData[1],pinData[2])
					num=num+1
				end
			end
		end
	elseif i>=30 then
		local mapData=Achievements[subzone]
		local num=1
		if mapData then
			mapData=mapData[i]
			if mapData then
				for _,pinData in pairs(mapData) do
					local AchName,Completed=pinData[3] or "",nil
					if i==34 then --Lightbringer
						local zone=ZoneAchievement[subzone]
						if zone then
							AchName="Lightbringer"
							local _,c1,r1=GetAchievementCriterion(873,zone)
							local _,c2,r2=GetAchievementCriterion(871,zone)
							local _,c3,r3=GetAchievementCriterion(869,zone)
							Completed=(c1+c2+c3)>=(r1+r2+r3)
						end
					elseif pinData[4] then
						local name,c1,r1=GetAchievementCriterion(pinData[3],pinData[4])
						AchName=name
						Completed=c1>=r1
					else
						Completed=IsAchievementComplete(pinData[3])
					end
					local HaveItem=(AchievementItems[ pinData[3] ] and AchievementItems[ pinData[3] ][ pinData[4] ]) and true or false
					if Completed==CustomPins[i].done and HaveItem==CustomPins[i].done then
						COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,AchName..num,pinData[1],pinData[2])
						num=num+1
					end
				end
			end
		end
	elseif i==5 then
		local mapData=Lorebooks[subzone]
		if mapData then
			for _, pinData in pairs(mapData) do
				local AchName, _, done=GetLoreBookInfo(1, pinData[3], pinData[4])
				if done==CustomPins[i].done and AchName~="" then
					COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,AchName..tostring(pinData[1]),pinData[1],pinData[2])
				end
			end
		end
	elseif i==6 then
		local mapData=TreasureMaps[subzone]
		if mapData then
			for _, itemData in pairs(SHARED_INVENTORY:GenerateFullSlotData(nil, BAG_BACKPACK)) do
				if itemData and itemData.itemType==ITEMTYPE_TROPHY then
					for _, pinData in pairs(mapData) do
						if GetItemId(BAG_BACKPACK,itemData.slotIndex)==pinData[3] then
							COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,itemData.name,pinData[1],pinData[2])
						end
					end
				end
			end
		end
	elseif i==7 then
		local mapData=ChestData[subzone]
		if mapData then
			local FindersKeepers=select(6,GetSkillAbilityInfo(5,4,1))
			for chType, chData in pairs(mapData) do
				for chest, pinData in pairs(chData) do
					if chType==1 or FindersKeepers then
						COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,"Chest_"..subzone.."_"..chType.."_"..chest,pinData[1],pinData[2])
					end
				end
			end
		end
		mapData=CustomChestData[subzone]
		if mapData then
			for chest, pinData in pairs(mapData) do
				COMPASS_PINS.pinManager:CreatePin(CustomPins[i].name,"Chest_"..subzone.."_3_"..chest,pinData[1],pinData[2])
			end
		end
	end
	UpdatingCompassPin[i]=false
end

local function AddCompassCustomPin(id,i)
	if COMPASS_PINS and (i==3 or i==5 or i==6 or i==7 or i==15 or i==16 or i>=30) then
		local pin=CustomPins[i].filter or i
		if SavedVars[pin] then
--			pl("["..id.."] Compass pin "..i.." enabled")
			local CompassPinLayout={maxDistance=0.05,level=30,size=40,texture=(type(CustomPins[i].texture)=="string" and CustomPins[i].texture or "/"..AddonName.."/Treasure_1.dds")}
			COMPASS_PINS:AddCustomPin(CustomPins[i].name, function() CompassPinAddCallback(i) end, CompassPinLayout)
			COMPASS_PINS:RefreshPins(CustomPins[i].name)
		else
			COMPASS_PINS.pinManager:RemovePins(CustomPins[i].name)
--			pl("["..id.."] Compass pin "..i.." disabled")
		end
	end
end

local function ScanInventory()
	for _, itemData in pairs(SHARED_INVENTORY:GenerateFullSlotData(nil, BAG_BACKPACK)) do
		if itemData and itemData.itemType==ITEMTYPE_TROPHY then
			local itemId=GetItemId(BAG_BACKPACK,itemData.slotIndex)
			if AncestralTombRubbing[itemId] then AchievementItems[1712][ AncestralTombRubbing[itemId] ]=true
			elseif WrothgarRelics[itemId] then AchievementItems[1250][ WrothgarRelics[itemId] ]=true
			elseif RelicsOfSummerset[itemId] then AchievementItems[2099][ RelicsOfSummerset[itemId] ]=true
			elseif PrecursorItems[itemId] then AchievementItems[1958][ PrecursorItems[itemId] ]=true
			elseif ChronoglerTablet[itemId] then AchievementItems[2320][ ChronoglerTablet[itemId] ]=true
			elseif MuralMenderFragments[itemId] then AchievementItems[2463][ MuralMenderFragments[itemId] ]=true
			elseif PiecesOfHistory[itemId] then AchievementItems[2534][ PiecesOfHistory[itemId] ]=true
			elseif Instruments[itemId] then AchievementItems[2669][ Instruments[itemId] ]=true
			elseif MiningSampleCollector[itemId] then AchievementItems[2759][ MiningSampleCollector[itemId] ]=true
			end
		end
	end
end

--Events
local function OnBackpackChanged(bagId,_,slotData)
--	d("Bag changed: "..bagId..(slotData and " Item type: "..tostring(slotData.itemType or "")))
	if bagId~=BAG_BACKPACK or UpdatingMapPin[6] or not slotData or slotData.itemType~=ITEMTYPE_TROPHY then return end
	UpdatingMapPin[6]=true
	zo_callLater(function()
		UpdatingMapPin[6]=false
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[6].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[6].name) end
	end,1000)
end

local function OnLootReceived(_, receivedBy, itemName, quantity, itemSound, lootType, self, _, questItemIcon, itemId)
	if lootType~=LOOT_TYPE_ITEM and lootType~=LOOT_TYPE_QUEST_ITEM then return end
	--Ancestral Tombs
	if AncestralTombRubbing[itemId] then
		AchievementItems[1712][ AncestralTombRubbing[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[31].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[31].name) end
	elseif WrothgarRelics[itemId] then
		AchievementItems[1250][ WrothgarRelics[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[38].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[38].name) end
	elseif RelicsOfSummerset[itemId] then
		AchievementItems[2099][ RelicsOfSummerset[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[41].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[41].name) end
	elseif PrecursorItems[itemId] then
		AchievementItems[1958][ PrecursorItems[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[47].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[47].name) end
	elseif ChronoglerTablet[itemId] then
		AchievementItems[2320][ ChronoglerTablet[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[48].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[48].name) end
	elseif MuralMenderFragments[itemId] then
		AchievementItems[2463][ MuralMenderFragments[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[54].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[54].name) end
	elseif PiecesOfHistory[itemId] then
		AchievementItems[2534][ PiecesOfHistory[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[55].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[55].name) end
	elseif Instruments[itemId] then
		AchievementItems[2669][ Instruments[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[59].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[59].name) end
	elseif MiningSampleCollector[itemId] then
		AchievementItems[2759][ MiningSampleCollector[itemId] ]=true
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[68].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[68].name) end
	end
end

local function OnAchievementUpdate(achievementId,link)
	LastAchivement=achievementId
--[[
	if MP_dm and achievementId==1824 then
		local x,y=GetMapPlayerPosition("player") x=math.floor(x*10000)/10000 y=math.floor(y*10000)/10000
		local subzone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
		local action,name,blockedNode,isOwned=GetGameCameraInteractableActionInfo()
		if not The36Lessons[subzone] then
			d("Book added: "..name)
			The36Lessons[subzone]={{x,y,achievementId,name}}
		else
			local known=false
			for i,data in pairs(The36Lessons[subzone]) do
				if math.abs(data[1]-x)<0.01 and math.abs(data[2]-y)<0.01 then known=true end
			end
			if not known then
				d("Book added: "..name)
				table.insert(The36Lessons[subzone],{x,y,achievementId,name})
			end
		end
	end
--]]
	local function RefreshPins(name)
		EVENT_MANAGER:RegisterForUpdate("CallLater_"..name, 1000,
		function()
			EVENT_MANAGER:UnregisterForUpdate("CallLater_"..name)
			ZO_WorldMap_RefreshCustomPinsOfType(name)
			if COMPASS_PINS then COMPASS_PINS:RefreshPins(name) end
		end)
	end
	if SkyShardsAchievements[achievementId] then
		RefreshPins(_G[CustomPins[3].name])
	elseif FishingAchievements[achievementId] and SavedVars[17] then
		RefreshPins(_G[CustomPins[17].name])
	elseif AchievementsId[achievementId] then
		RefreshPins(_G[CustomPins[AchievementsId[achievementId] ].name])
	elseif BossesAchievements[achievementId] then
		local AchName=GetAchievementCriterion(achievementId,1)
		if string.match(AchName,"Explorer") or string.match(AchName,"Group Challenge") then
			RefreshPins(_G[CustomPins[1].name])
		end
	end
end

local function OnBookLearned(_,categoryIndex)
	if categoryIndex==1 then
		ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[5].name])
		if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[5].name) end
	end
end

local function CheckChestData(x,y,zone,subzone)
	if not zone then return end
	local delta=subzone and .01 or .003
	local mapData=ChestData[zone]
	if mapData then
		for chType, chData in pairs(mapData) do
			for i,data in pairs(chData) do
				if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
					return true
				end
			end
		end
	end

	mapData=CustomChestData[zone]
	if mapData then
		for i,data in pairs(mapData) do
			if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
				return true
			end
		end
	end

	return false
end

local function CheckQuestData(x,y,zone)
	if not zone then return end
	local delta=0.03
	mapData=CustomChestData[zone]
	if mapData then
		for i,data in pairs(mapData) do
			if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
				return true
			end
		end
	end
	return false
end

local function CheckThievesTrove(x,y,zone)
	if not zone then return end
	local delta=0.014
	local mapData=ChestData[zone]
	if mapData then
		for chType, chData in pairs(mapData) do
			for i,data in pairs(chData) do
				if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
					return true
				end
			end
		end
	end
	mapData=CustomThievesTrove[zone]
	if mapData then
		for i,data in pairs(mapData) do
			if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
				return true
			end
		end
	end
	return false
end

local function OnQuestAdded(_,_,questName)
	if GetMapType()~=MAPTYPE_ZONE then return end
	local x,y,_=GetMapPlayerPosition("player") x=math.floor(x*10000)/10000 y=math.floor(y*10000)/10000
	local subzone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
	local function AddQuest()
		for i=GetNumJournalQuests(),1,-1 do
			local _questName,_,_,_,_,_,_,_,_,_questType=GetJournalQuestInfo(i)
			if questName==_questName then
				if not CustomQuestData[subzone] then CustomQuestData[subzone]={} end
				table.insert(CustomQuestData[subzone], {x,y,_questType,questName})
				d("New quest added at "..("%05.02f"):format(zo_round(x*10000)/100).."x"..("%05.02f"):format(zo_round(y*10000)/100)..": "..questName.." (".._questType..")" )
				break
			end
		end
	end
	if not CheckQuestData(x,y,subzone) then
		zo_callLater(function()AddQuest()end,250)
	end
end

local function OnInteract(_,result,TargetName)
	if result~=CLIENT_INTERACT_RESULT_SUCCESS then return end
	if SavedVars[7] and IsThievesTrove[TargetName] then
		local zone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
		if zone then
			local x,y,_=GetMapPlayerPosition("player") x=math.floor(x*10000)/10000 y=math.floor(y*10000)/10000
			if not CheckThievesTrove(x,y,zone) then
				if not CustomThievesTrove[zone] then CustomThievesTrove[zone]={} end
				table.insert(CustomThievesTrove[zone], {x,y})
				d("New thieves trove found at "..("%05.02f"):format(zo_round(x*10000)/100).."x"..("%05.02f"):format(zo_round(y*10000)/100))
			end
		end
	elseif SavedVars[7] and IsChest[TargetName] then
		ChestsLooted=ChestsLooted+1
		local zone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
		if zone then
			local x,y,_=GetMapPlayerPosition("player") x=math.floor(x*10000)/10000 y=math.floor(y*10000)/10000
			local subzone=(GetMapType()==MAPTYPE_SUBZONE or GetMapContentType()==MAP_CONTENT_DUNGEON)
			if not CheckChestData(x,y,zone,subzone) then
				if not CustomChestData[zone] then CustomChestData[zone]={} end
				table.insert(CustomChestData[zone], {x,y})
				d("New chest found at "..("%05.02f"):format(zo_round(x*10000)/100).."x"..("%05.02f"):format(zo_round(y*10000)/100) )
			end
		end
	elseif SavedVars[15] and IsTimeBreach[TargetName] then
		local zone=string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")
		if zone then
			local x,y,_=GetMapPlayerPosition("player") x=math.floor(x*10000)/10000 y=math.floor(y*10000)/10000
			local delta=0.03
			mapData=TimeBreach[zone]
			if mapData then
				for i,data in ipairs(mapData) do
					if math.abs(data[1]-x)<delta and math.abs(data[2]-y)<delta then
						if not SavedVars.TimeBreachClosed[zone] then SavedVars.TimeBreachClosed[zone]={} end
						SavedVars.TimeBreachClosed[zone][i]=true
						ZO_WorldMap_RefreshCustomPinsOfType(_G[CustomPins[15].name])
						if COMPASS_PINS then COMPASS_PINS:RefreshPins(CustomPins[15].name) end
					end
				end
			end
		end
	end
--	StartChatInput(TargetName)
end

local function TrackChestsRange()
--	if IsUnitInCombat('player') then return end
	ZO_WorldMap_RefreshCustomPinsOfType(PinId[7])
end

local function ResizePins(minimap)
	ZO_MapPin.PIN_DATA[_G[CustomPins[8].name]].size=minimap and 40*BUI.Vars.PinScale/100 or 40	--Unknown POI
	ZO_MapPin.PIN_DATA[_G[CustomPins[17].name]].size=minimap and 10 or SavedGlobal.pinsize	--Fishing nodes
--	d("Unknown POIs size are resized to "..(minimap and "minimap" or "world map"))
end

local function RegisterEvents()
	EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_ACHIEVEMENT_UPDATED,function(_,achievementId,link) OnAchievementUpdate(achievementId)end)
	EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_ACHIEVEMENT_AWARDED,function(_,_,_,achievementId,link) OnAchievementUpdate(achievementId)end)
	if SavedVars[5] then
		EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_LORE_BOOK_LEARNED, OnBookLearned)
	else
		EVENT_MANAGER:UnregisterForEvent(AddonName,EVENT_LORE_BOOK_LEARNED)
	end
	if SavedVars[6] then
--		EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_LOOT_RECEIVED, OnLootReceived)
		zo_callLater(function()
			SHARED_INVENTORY:RegisterCallback("SlotAdded", OnBackpackChanged)
			SHARED_INVENTORY:RegisterCallback("SlotRemoved", OnBackpackChanged)
		end, 2500)
	else
		SHARED_INVENTORY:UnregisterCallback("SlotAdded")
		SHARED_INVENTORY:UnregisterCallback("SlotRemoved")
	end
	if SavedVars[11] or SavedVars[13] or SavedVars[14] or SavedVars[18] or SavedVars[19] or SavedVars[20] or SavedVars[22] then
		ScanInventory()
		EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_LOOT_RECEIVED, OnLootReceived)
	else
		EVENT_MANAGER:UnregisterForEvent(AddonName,EVENT_LOOT_RECEIVED)
	end
	if SavedVars[7] or SavedVars[15] then
		EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_CLIENT_INTERACT_RESULT, OnInteract)
	else
		EVENT_MANAGER:UnregisterForEvent(AddonName,EVENT_CLIENT_INTERACT_RESULT)
	end
	if SavedVars[7] then
		if BUI and BUI.name=="BanditsUserInterface" then
			CALLBACK_MANAGER:RegisterCallback("BUI_MiniMap_Update", TrackChestsRange)
		else
			WORLD_MAP_SCENE:RegisterCallback("StateChange", function(oldState, newState)
				if newState==SCENE_SHOWING then TrackChestsRange() end
			end)
		end
	else
		CALLBACK_MANAGER:UnregisterCallback("BUI_MiniMap_Update")
		WORLD_MAP_SCENE:UnregisterCallback("StateChange")
	end
	if SavedVars[8] and (BUI and BUI.name=="BanditsUserInterface") then
		CALLBACK_MANAGER:RegisterCallback("BUI_MiniMap_Shown", ResizePins)
	else
		CALLBACK_MANAGER:UnregisterCallback("BUI_MiniMap_Shown")
	end
	if SavedVars[15] then
		for i=1,GetNumSkillLines(5) do
			if GetSkillAbilityId(5,i,1,false)==103478 then PsijicSkillLine=i break end
		end
	end
--	EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_QUEST_ADDED, OnQuestAdded)
end

--Initialization
local function AddPinFilter(i)
	local function SetEnabled(control,state,init)
		for pin,id in pairs(CustomPins[i].id) do
			local needsRefresh=PinManager:IsCustomPinEnabled(id)~=state
			local filterType=GetMapFilterType()
			if filterType==MAP_FILTER_TYPE_STANDARD or filterType==MAP_FILTER_TYPE_AVA_CYRODIIL or filterType==MAP_FILTER_TYPE_AVA_IMPERIAL then ZO_CheckButton_SetCheckState(control,state) end
			PinManager:SetCustomPinEnabled(id,state)
			if needsRefresh then
--				pl("["..id.."] "..CustomPins[pin].name..": Refresh")
				AddCompassCustomPin(id,pin)
				if not init then
					ZO_WorldMap_RefreshCustomPinsOfType(id)
					RegisterEvents()
				end
			end
		end
	end

	local function GetCroppedAchievementInfo(id)
		local name,_,_,icon=GetAchievementInfo(id)
		local pos=string.find(name,"<<player")
		return pos and table.concat({string.sub(name,0,pos-1), string.match(string.sub(name,pos), "<<player{([%D]+)/[%D]+}>>([%D]*)")}) or name, icon
	end

	local function AddCheckbox(panel)
		local checkbox=panel.checkBoxPool:AcquireObject()
		local icon=zo_iconFormat((CustomPins[i].def_texture and CustomPins[i].def_texture or CustomPins[i].texture),24,24)
		local name=CustomPins[i].ach and GetCroppedAchievementInfo(CustomPins[i].ach) or Loc(string.gsub(CustomPins[i].name,"pinType_",""))
		ZO_CheckButton_SetLabelText(checkbox,icon.." "..name)
		panel:AnchorControl(checkbox)
		local tooltipText=""
		if CustomPins[i].name=="pinType_Unknown_POI" then
			tooltipText=zo_iconFormat("/esoui/art/icons/poi/poi_areaofinterest_incomplete.dds",24,24).." "..GetString(SI_GAMEPAD_PLAYER_PROGERSS_BAR_UNKNOWN_ZONE).."\n"	--Unknown POI
			..zo_iconFormat("/esoui/art/icons/poi/poi_crafting_incomplete.dds",24,24).." "..GetString(SI_SPECIALIZEDITEMTYPE213).."\n"	--Crafting station description
			..zo_iconFormat("/esoui/art/icons/poi/poi_mundus_incomplete.dds",24,24).." "..GetString(SI_ZONECOMPLETIONTYPE12)	--Mundus description
		elseif CustomPins[i].name=="pinType_Shrines" then
			tooltipText=zo_iconFormat(ShrineIcon[1],24,24).." "..GetString(SI_MONSTERSOCIALCLASS42).."\n"..zo_iconFormat(ShrineIcon[2],24,24).." "..GetString(SI_MONSTERSOCIALCLASS45)	--Vampire, Werewolf
		elseif CustomPins[i].name=="pinType_Fishing_Nodes" then
			tooltipText=zo_iconFormat(FishIcon[1],24,24).." "..Loc("Foul").."\n"
			..zo_iconFormat(FishIcon[2],24,24).." "..Loc("River").."\n"
			..zo_iconFormat(FishIcon[3],24,24).." "..Loc("Salt").."\n"
			..zo_iconFormat(FishIcon[4],24,24).." "..Loc("Lake")
		elseif CustomPins[i].name=="pinType_Portals" then
			tooltipText=zo_iconFormat("/esoui/art/icons/poi/poi_portal_complete.dds",24,24).." "..Loc("Celestial_Rifts").."\n"
			..zo_iconFormat("/esoui/art/icons/poi/poi_portal_complete.dds",24,24).." "..Loc("Dark_Fissures").."\n"
			..zo_iconFormat("/esoui/art/icons/poi/poi_portal_complete.dds",24,24).." "..Loc("Oblivion_Portals").."\n"
			..zo_iconFormat("/esoui/art/icons/poi/poi_portal_complete.dds",24,24).." "..Loc("Shadow_Fissures").."\n"
			..zo_iconFormat("/esoui/art/icons/poi/poi_portal_complete.dds",24,24).." "..Loc("Lava_Lashers")
		elseif CustomPins[i].name=="pinType_Clockwork_City" then
			tooltipText=function()
				local text=""
				for i,data in ipairs(PrecursorTooltip) do
					local _,c,r=GetAchievementCriterion(1958,data.v)
					local HaveItem=AchievementItems[1958] and AchievementItems[1958][data.v] and true or false
					local info="\n["..(c==r and "|c33EE33" or HaveItem and "|cEEEE22" or "|cEEEEEE")..data.v.."|r] "
					text=text..info..data.desc
				end
				return zo_strformat("|t24:24:<<2>>|t <<1>>", GetCroppedAchievementInfo(1958))
--					.."\n|t300:8:/EsoUI/Art/Miscellaneous/horizontalDivider.dds|t"
					..text
			end
		elseif CustomPins[i].name=="pinType_Greymoor" then
			tooltipText=function()
				local text1=""
				for i,data in ipairs(MiningSampleTooltip) do
					local _,c,r=GetAchievementCriterion(2759,data.v)
					local HaveItem=AchievementItems[2759] and AchievementItems[2759][data.v] and true or false
					local info="\n["..(c==r and "|c33EE33" or HaveItem and "|cEEEE22" or "|cEEEEEE")..data.v.."|r] "
					text1=text1..info..data.desc
				end
				local text2=""
				for i,data in ipairs(InstrumentsTooltip) do
					local _,c,r=GetAchievementCriterion(2669,data.v)
					local HaveItem=AchievementItems[2669] and AchievementItems[2669][data.v] and true or false
					local info="\n["..(c==r and "|c33EE33" or HaveItem and "|cEEEE22" or "|cEEEEEE")..data.v.."|r] "
					text2=text2..info..data.desc
				end
				return zo_strformat("|t24:24:<<2>>|t <<1>>", GetCroppedAchievementInfo(CustomPins[68].ach))
					..text1
					.."\n|t300:8:/EsoUI/Art/Miscellaneous/horizontalDivider.dds|t\n"
					..zo_strformat("|t24:24:<<2>>|t <<1>>", GetCroppedAchievementInfo(CustomPins[59].ach))
					..text2
			end
		else
			for _,pin in pairs(CustomPins[i].pin) do
				if tooltipText~="" then tooltipText=tooltipText.."\n" end
				if CustomPins[pin].name=="pinType_Lightbringer" then
					tooltipText=tooltipText
					..zo_strformat("|t24:24:<<2>>|t <<1>>\n", GetCroppedAchievementInfo(873))--Lightbringer
					..zo_strformat("|t24:24:<<2>>|t <<1>>\n", GetCroppedAchievementInfo(871))--Give to Poor
					..zo_strformat("|t24:24:<<2>>|t <<1>>", GetCroppedAchievementInfo(869))--Crime Pays
				else
					local name=CustomPins[pin].ach and GetCroppedAchievementInfo(CustomPins[pin].ach) or Loc(string.gsub(CustomPins[pin].name,"pinType_",""))
					tooltipText=tooltipText..zo_iconFormat((CustomPins[pin].def_texture and CustomPins[pin].def_texture or CustomPins[pin].texture),24,24).." "
					..name	--string.gsub(name,"_"," ")
				end
			end
		end

		if tooltipText~="" then
			checkbox:SetHandler("OnMouseEnter", function(self) ZO_Tooltips_ShowTextTooltip(self, LEFT, type(tooltipText)=="string" and tooltipText or tooltipText()) end)
			checkbox:SetHandler("OnMouseExit", ZO_Tooltips_HideTextTooltip)
		end
		return checkbox
	end
	--pvePanel
	if PinsNirn[i] then
		local control=AddCheckbox(WORLD_MAP_FILTERS.pvePanel)
		if control then
			ZO_CheckButton_SetToggleFunction(control,function(self,state) SavedVars[i]=state SetEnabled(self,state) end)
			SetEnabled(control,SavedVars[i],true)
		end
	end
	--pvpPanel
	if PinsAva[i] then
		control=AddCheckbox(WORLD_MAP_FILTERS.pvpPanel)
		if control then
			ZO_CheckButton_SetToggleFunction(control,function(self,state) SavedVars[i]=state SetEnabled(self,state) end)
			SetEnabled(control,SavedVars[i],true)
		end
	end
	--imperialPvPPanel
	if PinsImperial[i] then
		control=AddCheckbox(WORLD_MAP_FILTERS.imperialPvPPanel)
		if control then
			ZO_CheckButton_SetToggleFunction(control,function(self,state) SavedVars[i]=state SetEnabled(self,state) end)
			SetEnabled(control,SavedVars[i],true)
		end
	end
end

local PinTooltipSupres={
[7]=true,
[16]=true,
[17]=true,
[71]=true,--Imperial City player respawns
}

local PinTooltipCreator={
	tooltip=1,
	creator=function(pin)
		local _, pinTag=pin:GetPinTypeAndTag()
		local name,desc,desc1,icon
		if pinTag[1]==15 then
			icon=CustomPins[15].texture
			name="Time Rift"
		elseif (pinTag[1]==1 or pinTag[1]==2) and pinTag[4] then
			name,desc,_,icon=GetAchievementInfo(pinTag[2])
			desc1="  Set items:"
			for _,id in pairs(pinTag[4]) do
				desc1=desc1..("\n|H1:item:%d:359:50:0:0:0:0:0:0:0:0:0:0:0:0:1:0:0:0:10000:0|h|h"):format(id)
			end
		elseif pinTag[1]==34 then	--Lightbringer
			icon=CustomPins[34].texture
			name=GetString(SI_JOURNAL_MENU_ACHIEVEMENTS) or "Achievements"
			desc=zo_strformat("|t24:24:<<4>>|t <<1>>\n", GetAchievementInfo(873))--Lightbringer
			..zo_strformat("|t24:24:<<4>>|t <<1>>\n", GetAchievementInfo(871))--Give to Poor
			..zo_strformat("|t24:24:<<4>>|t <<1>>", GetAchievementInfo(869))--Crime Pays
		elseif pinTag[1]==62 then
			icon=CustomPins[62].texture
			name=pinTag.name
		elseif pinTag[1]==26 then	--Portals
			icon=CustomPins[ pinTag[1] ].texture
			name=pinTag.name
		elseif pinTag[1]==66 then
			icon=CustomPins[ pinTag[1] ].texture
			name=pinTag.name
		elseif pinTag[1]==70 then
			icon=CustomPins[70].texture
			name=pinTag.name
		elseif pinTag[1]<=4 or pinTag[1]>=30 then	--Main tooltip for achievements
			name,desc,_,icon=GetAchievementInfo(pinTag[2])
			if pinTag[3] then desc=GetAchievementCriterion(pinTag[2], pinTag[3]) end
		elseif pinTag[1]==5 then
			name, icon, _=GetLoreBookInfo(1, pinTag[2], pinTag[3])
		elseif pinTag[1]==6 then
			icon=pinTag.icon
			name=GetItemName(BAG_BACKPACK,pinTag[2])
		elseif pinTag[1]==8 then
			icon=pinTag.texture
			name=pinTag.name
			desc=pinTag.desc
		elseif pinTag[1]==21 then
			icon=CustomPins[21].texture
			name="Volendrung spawn location"
		end
		name=(pinTag[3] and "["..pinTag[3].."] " or "")..name
		if IsInGamepadPreferredMode() then
			ZO_MapLocationTooltip_Gamepad:LayoutIconStringLine(ZO_MapLocationTooltip_Gamepad.tooltip, icon, zo_strformat("<<1>>", name), ZO_MapLocationTooltip_Gamepad.tooltip:GetStyle("mapLocationTooltipWayshrineHeader"))
			if desc then
				ZO_MapLocationTooltip_Gamepad:LayoutIconStringLine(ZO_MapLocationTooltip_Gamepad.tooltip, nil, zo_strformat("<<1>>", desc), ZO_MapLocationTooltip_Gamepad.tooltip:GetStyle("mapRecallCost"))
			end
			if desc1 then
				ZO_MapLocationTooltip_Gamepad:LayoutIconStringLine(ZO_MapLocationTooltip_Gamepad.tooltip, nil, zo_strformat("<<1>>", desc1), ZO_MapLocationTooltip_Gamepad.tooltip:GetStyle("mapRecallCost"))
			end
		else
			InformationTooltip:AddLine(zo_strformat("<<1>> <<2>>",zo_iconFormat(icon,24,24), name), "ZoFontGameOutline", ZO_SELECTED_TEXT:UnpackRGB())
			if desc then
				ZO_Tooltip_AddDivider(InformationTooltip)
				InformationTooltip:AddLine(zo_strformat("<<1>>", desc), "", ZO_HIGHLIGHT_TEXT:UnpackRGB())
			end
			if desc1 then
				ZO_Tooltip_AddDivider(InformationTooltip)
				InformationTooltip:AddLine(zo_strformat("<<1>>", desc1), "", ZO_HIGHLIGHT_TEXT:UnpackRGB())
			end
		end
	end
}

local function MakeMapFiltersScroll()
	if WORLD_MAP_FILTERS.pvePanel then
		if WORLD_MAP_FILTERS.pvePanel.checkBoxPool then
			WORLD_MAP_FILTERS.pvePanel.checkBoxPool.parent=ZO_WorldMapFiltersPvEContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvEContainer",ZO_WorldMapFiltersPvE,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.pvePanel.checkBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.pvePanel.checkBoxPool.parent)
			end
			if ZO_WorldMapFiltersPvECheckBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersPvECheckBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.pvePanel.control then
					ZO_WorldMapFiltersPvECheckBox1:SetAnchor(point,ZO_WorldMapFiltersPvEContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if WORLD_MAP_FILTERS.pvePanel.comboBoxPool then
			WORLD_MAP_FILTERS.pvePanel.comboBoxPool.parent=ZO_WorldMapFiltersPvEContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvEContainer",ZO_WorldMapFiltersPvE,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.pvePanel.comboBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.pvePanel.comboBoxPool.parent)
			end
			if ZO_WorldMapFiltersPvEComboBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersPvEComboBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.pvePanel.control then
					ZO_WorldMapFiltersPvEComboBox1:SetAnchor(point,ZO_WorldMapFiltersPvEContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if ZO_WorldMapFiltersPvEContainer then ZO_WorldMapFiltersPvEContainer:SetAnchorFill() end
	end

	if WORLD_MAP_FILTERS.pvpPanel then
		if WORLD_MAP_FILTERS.pvpPanel.checkBoxPool then
			WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.parent=ZO_WorldMapFiltersPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvPContainer",ZO_WorldMapFiltersPvP,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.pvpPanel.checkBoxPool.parent)
			end
			if ZO_WorldMapFiltersPvPCheckBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersPvPCheckBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.pvpPanel.control then
					ZO_WorldMapFiltersPvPCheckBox1:SetAnchor(point,ZO_WorldMapFiltersPvPContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if WORLD_MAP_FILTERS.pvpPanel.comboBoxPool then
			WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.parent=ZO_WorldMapFiltersPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersPvPContainer",ZO_WorldMapFiltersPvP,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.pvpPanel.comboBoxPool.parent)
			end
			if ZO_WorldMapFiltersPvPComboBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersPvPComboBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.pvpPanel.control then
					ZO_WorldMapFiltersPvPComboBox1:SetAnchor(point,ZO_WorldMapFiltersPvPContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if ZO_WorldMapFiltersPvPContainer then ZO_WorldMapFiltersPvPContainer:SetAnchorFill() end
	end

	if WORLD_MAP_FILTERS.imperialPvPPanel then
		if WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool then
			WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.parent=ZO_WorldMapFiltersImperialPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersImperialPvPContainer",ZO_WorldMapFiltersPvP,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.imperialPvPPanel.checkBoxPool.parent)
			end
			if ZO_WorldMapFiltersImperialPvPCheckBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersImperialPvPCheckBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.imperialPvPPanel.control then
					ZO_WorldMapFiltersImperialPvPCheckBox1:SetAnchor(point,ZO_WorldMapFiltersImperialPvPContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool then
			WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.parent=ZO_WorldMapFiltersImperialPvPContainerScrollChild or WINDOW_MANAGER:CreateControlFromVirtual("ZO_WorldMapFiltersImperialPvPContainer",ZO_WorldMapFiltersPvP,"ZO_ScrollContainer"):GetNamedChild("ScrollChild")
			for i,control in pairs(WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.m_Active) do
				control:SetParent(WORLD_MAP_FILTERS.imperialPvPPanel.comboBoxPool.parent)
			end
			if ZO_WorldMapFiltersImperialPvPComboBox1 then
				local valid,point,control,relPoint,x,y=ZO_WorldMapFiltersImperialPvPComboBox1:GetAnchor(0)
				if control==WORLD_MAP_FILTERS.imperialPvPPanel.control then
					ZO_WorldMapFiltersImperialPvPComboBox1:SetAnchor(point,ZO_WorldMapFiltersImperialPvPContainerScrollChild,relPoint,x,y)
				end
			end
		end
		if ZO_WorldMapFiltersImperialPvPContainer then ZO_WorldMapFiltersImperialPvPContainer:SetAnchorFill() end
	end
end

local function OnLoad(eventCode,addonName)
	if addonName~=AddonName then return end
	EVENT_MANAGER:UnregisterForEvent(AddonName,EVENT_ADD_ON_LOADED)
	SavedVars=ZO_SavedVars:New("MP_SavedVars",2,nil,DefaultVars)
	CustomChestData=ZO_SavedVars:NewAccountWide("MP_ChestData",2,nil,{})
	CustomThievesTrove=ZO_SavedVars:NewAccountWide("MP_ThievesTrove",2,nil,{})
--	CustomQuestData=ZO_SavedVars:NewAccountWide("MP_QuestData",1,nil,{})
	SavedGlobal=ZO_SavedVars:NewAccountWide("MP_SavedGlobal",1,nil,DefaultGlobal)
	PinManager=ZO_WorldMap_GetPinManager()
--	CustomPins_init()
	RegisterEvents()
	MakeMapFiltersScroll()

	--APIVersion: 101032
	SavedVars[4]=false

	local function AddPin(pin,pinLayout)
		local TooltipCreator=(not PinTooltipSupres[pin] and PinTooltipCreator or nil)
		local name=pinLayout.name
		pinLayout.size=pinLayout.size or SavedGlobal.pinsize*pinLayout.k
		ZO_WorldMap_AddCustomPin(name,function() MapPinAddCallback(pin) end,nil,pinLayout,TooltipCreator)
		local id=_G[name]
--		ZO_WorldMap_SetCustomPinEnabled(id,true) ZO_WorldMap_RefreshCustomPinsOfType(id)
--		AddCompassCustomPin(id,pin)
		return id
	end

	for i=1,28 do
		local filter=CustomPins[i]
		if filter then
			if filter.section then
				for i0,pinLayout in pairs(filter) do
					if type(pinLayout)=="table" and pinLayout.name then
						CustomPins[i0]=pinLayout
						pinLayout.filter=i
						local id=AddPin(i0,pinLayout)
						filter.id[i0]=id PinId[i0]=id
						table.insert(filter.pin,i0)
					end
				end
			else
				local id=AddPin(i,filter) filter.id[i]=id PinId[i]=id
			end
			AddPinFilter(i)
		end
	end

	SLASH_COMMANDS["/loc"]=function()
		local x,y=GetMapPlayerPosition("player")
--		d(zo_strformat("<<1>>: <<2>>\195\151<<3>>",GetMapName(),("%05.02f"):format(zo_round(x*10000)/100),("%05.02f"):format(zo_round(y*10000)/100) ))
		StartChatInput(string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")..'={{'..string.gsub(math.floor(x*1000)/1000,"[0][.]",".")..","..string.gsub(math.floor(y*1000)/1000,"[0][.]",".")..","..LastAchivement..'}},')
	end
	SLASH_COMMANDS["/loc1"]=function()
		local x,y=GetMapPlayerPosition("player")
		StartChatInput('{'..string.gsub(math.floor(x*1000)/1000,"[0][.]",".")..","..string.gsub(math.floor(y*1000)/1000,"[0][.]",".")..","..LastAchivement..'},')
	end
	SLASH_COMMANDS["/loc2"]=function()
		StartChatInput(string.match(string.gsub(GetMapTileTexture(),"_base[_%w]*",""),"([%w%-_]+).dds$")..'={'..string.gsub(string.format("%.3f,%.3f",GetMapPlayerWaypoint()),"[0][.]",".")..'},')
	end
--	SLASH_COMMANDS["/mpdm"]=function() SavedGlobal.dm=not SavedGlobal.dm d("Map Pins developer mode is now "..(SavedGlobal.dm and "Enabled" or "Disabled")) end
	SLASH_COMMANDS["/pinsize"]=function(n)
		n=tonumber(n)
		if n and n>=16 and n<=40 then
			SavedGlobal.pinsize=n
			for i,id in pairs(PinId) do
				if ZO_MapPin.PIN_DATA[id] and CustomPins[i].k then ZO_MapPin.PIN_DATA[id].size=n*CustomPins[i].k end
			end
			ZO_WorldMap_RefreshCustomPinsOfType()
		end
	end
--[[
	SLASH_COMMANDS["/makebase"]=function()
		PoiData=ZO_SavedVars:NewAccountWide("MP_PoiData",1,nil,{})
		local zone=GetCurrentMapZoneIndex()
		local zoneId=GetZoneId(zone)
		PoiData[zoneId]={}
		for i=1,GetNumPOIs(zone) do
			local id=GetPOIType(zone, i)
			local Name=GetPOIInfo(zone, i)
			local _,_,poiType,_,_,_,known=GetPOIMapInfo(zone, i)
			if id~=7 and Name~="" then
				d('['..i..']={"'..Name..'",'..id..','..poiType..' Known:'..tostring(known)..'},')
				PoiData[zoneId][i]=Name
			end
		end
	end
--]]
end

EVENT_MANAGER:RegisterForEvent(AddonName,EVENT_ADD_ON_LOADED,OnLoad)

--[[	Helper scripts
/script zo_callLater(function()d(GetGameCameraInteractableActionInfo())end,1000)
--	/script MP_MakeBase()
function MP_MakeBase()
	--Chests
	local count=0
	for n=1,6 do
		d("Chests: Working on base "..n)
--		if #AddChestData[n]["data"]>0 then
			for zone in pairs(AddChestData[n]["data"]) do
				for i,data in pairs(AddChestData[n]["data"][zone]) do
					local confirm=true
					local x,y=data[1],data[2]
					if CustomChestData["data"][1][zone]==nil then CustomChestData["data"][1][zone]={} end
					for ii,data in pairs(CustomChestData["data"][1][zone]) do
						if math.abs(data[1]-x)<0.003 and math.abs(data[2]-y)<0.003 then
							confirm=false --break
						end
					end
					if confirm then
						count=count+1
						table.insert(CustomChestData["data"][1][zone],{x,y})
					end
				end
			end
--		end
	end
	d("Chests added: "..count)

	--Thieves troves
	count=0
	for n=1,6 do
		d("Thieves troves: Working on base "..n)
--		if #AddThievesTrove[n]["data"]>0 then
			for zone in pairs(AddThievesTrove[n]["data"]) do
				for i,data in pairs(AddThievesTrove[n]["data"][zone]) do
					local confirm=true
					local x,y=data[1],data[2]
					if CustomChestData["data"][2][zone]==nil then CustomChestData["data"][2][zone]={} end
					for ii,data in pairs(CustomChestData["data"][2][zone]) do
						if math.abs(data[1]-x)<0.003 and math.abs(data[2]-y)<0.003 then
							confirm=false --break
						end
					end
					if confirm then
						count=count+1
						table.insert(CustomChestData["data"][2][zone],{x,y})
					end
				end
			end
--		end
	end
	d("Thieves trove added: "..count)
end

function MP_MakeBase()
--	local mapData=ChestData[subzone]
	local delta=0.003
	local x,y,confirm=0,0,false
	d("Chest scan start")
	for subzone,mapData in pairs(ChestData) do
		if mapData then
			local chData=mapData[2]
			if chData then
				for chest1, data1 in ipairs(chData) do
					x,y=data1[1],data1[2]
					for chest2, data2 in ipairs(chData) do
						if chest1~=chest2 and math.abs(data1[1]-data2[1])<delta and math.abs(data1[2]-data2[2])<delta then
							x=(x+data2[1])/2
							y=(y+data2[2])/2
							d(data2[1]..","..data2[2])
							confirm=true
						end
					end
					if confirm then d(data1[1]..","..data1[2].." ["..subzone.."] Change to {"..x..","..y.."}") end
					confirm=false
				end
			end
		end
	end
end

/script d(GetAchievementCriterion(709,1))
function MP_MakeBase()
	local count=0
	for base=1,4 do
		for zone in pairs(MP_Data[base]) do
			local subzone=string.match(zone, "%w+/%w+/%w+/(%w+_%w+)")
			if not subzone then
				d("Wrong zone: "..zone)
			else
				if not RawChestData[subzone] then RawChestData[subzone]={} end
				for i,data in pairs(MP_Data[base][zone]) do
					count=count+1
					index=#RawChestData[subzone]+1
					RawChestData[subzone][index]={tonumber(string.format("%.04f", data[1])),tonumber(string.format("%.04f", data[2]))}
				end
			end
		end
	end
	d("Added :"..count)
	count=0
	for zone in pairs(RawChestData) do
		for i,data in pairs(RawChestData[zone]) do
			local x,y=data[1],data[2]
			for ii,data in pairs(RawChestData[zone]) do
				if i~=ii then
					if math.abs(data[1]-x)<0.01 and math.abs(data[2]-y)<0.01 then
						count=count+1
						RawChestData[zone][ii]=nil
					end
				end
			end
		end
	end
	d("Removed :"..count)
	count=0
	for zone in pairs(RawChestData) do
		count=count+1
		ChestData[zone]=RawChestData[zone]
	end
	d("Zones added :"..count)
end

/script PingMap(MAP_PIN_TYPE_PLAYER_WAYPOINT, MAP_TYPE_LOCATION_CENTERED, .736,.674)
/script local id=_G["pinType_Treasure_Maps"] local en=ZO_WorldMap_GetPinManager():IsCustomPinEnabled(id) d(en)
/script ZO_WorldMap_GetPinManager():SetCustomPinEnabled(POI_TYPE_HOUSE,false)
/script d(string.match(GetMapTileTexture(), "%w+/%w+/%w+/(%w+_%w+)"))
/script d("|t26:26:/MapPins/Chest_1.dds|t")
/script MP_MakeBase()
/script Link=("|H1:item:%d:370:50:0:0:0:0:0:0:0:0:0:0:0:0:1:0:0:0:10000:0|h|h"):format(130803) local _,name=GetItemLinkSetInfo(Link) StartChatInput(name)
/script d(ZO_WorldMap_GetPinManager():IsCustomPinEnabled(201))
/script ZO_WorldMap_RefreshCustomPinsOfType()
/script for pin,data in pairs(ZO_MapPin.PIN_DATA) do local texture=data.texture d(pin.." ("..tostring(data.size)..") |t18:18:"..tostring(texture).."|t"..tostring(texture)) end
/script ZO_MapPin.PIN_DATA[170].size=16
/script for id=1350,1400 do local AchName=GetAchievementCriterion(id,1) if string.match(AchName,"Explorer")~=nil then d("["..id.."] "..AchName) end end
/script d(GetAchievementCriterion(556,1))
function MP_MakeBase()
	for id=1,2000 do
		local AchName=GetAchievementCriterion(id,1)
		if string.match(AchName,"Group Challenge")~=nil then
			d("["..id.."] "..AchName)
			AchivementBase[id]=AchName
		end
	end
end

/script for i=1,GetNumSkillLines(5) do if GetSkillAbilityId(5,i,1,false)==103478 then PsijicSkillLine=i end end d(GetSkillLineXPInfo(5,PsijicSkillLine))

/script local x,y=GetMapPlayerWaypoint() StartChatInput('{'..math.floor(x*1000)/1000 ..","..math.floor(y*1000)/1000 ..'},')

/script for _, itemData in pairs(SHARED_INVENTORY:GenerateFullSlotData(nil, BAG_BACKPACK)) do
	if itemData and itemData.itemType==ITEMTYPE_TROPHY then d(itemData.name.." "..itemData.stackCount) end
	end

--	POI
/script local zone=GetCurrentMapZoneIndex()
for i=1,GetNumPOIs(zone) do local id=GetPOIType(zone, i) local Name=GetPOIInfo(zone, i)
local _,_,poiType,_,_,_,known=GetPOIMapInfo(zone, i)
if id~=7 and Name~="" then d('['..i..']={"'..Name..'",'..id..','..poiType..' Known:'..tostring(known)..'},')
end end

/script d(GetPOIMapInfo(GetCurrentMapZoneIndex(), 7))
/script StartChatInput(GetZoneId(GetCurrentMapZoneIndex()))
/script local i,zone=1,GetCurrentMapZoneIndex() local id=GetPOIType(zone, i) local Name=GetPOIInfo(zone, i) StartChatInput('['..i..']={"'..Name..'",'..id..'},')
--]]