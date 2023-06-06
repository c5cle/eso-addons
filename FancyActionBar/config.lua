--[[
	[slot_id] = config:
	- {effect_id, custom_duration} = timer will start when the effect will fire
	- true = start timer instantly using duration from the ability description
	- false = ignore this slot
	- number = same as "true", but use value as a duration
]]

local shadowImage = 38528
local raceId = GetUnitRaceId("player")
if raceId == 9 then
	shadowImage = 88696 -- khajiit
elseif raceId == 6 then
	shadowImage = 88697 -- argonian
end

FancyActionBar.abilityConfig = {
	-- Two Handed
	--[[
	[28297] = {61665}, -- momentum (major brutality)
	[38794] = {61665}, -- forward momentum (major brutality)
	[38745] = {38747}, -- carve bleed
	]]

	-- Shield
	--[28306] = {38541}, -- puncture (taunt)
	--[38250] = {38541}, -- pierce armor (taunt)
	--[38256] = {38541}, -- ransack (taunt)
	--[28304] = 12, -- low slash (minor maim)
	--[38268] = 12, -- deep slash (minor maim)
	--[38264] = {61708}, -- heroic slash (minor heroism)

	-- Destruction Staff
	[28807] = {}, -- ice, -- wall of fire
	[28854] = {}, -- shock
	[28849] = {}, -- ice
	[39053] = {39053, 10}, -- unstable wall of fire
	[39073] = {39073, 10}, -- shock
	[39067] = {39067, 10}, -- frost
	[39012] = {}, -- blockade of fire
	[39018] = {}, -- shock
	[39028] = {}, -- ice
	--[[
	[29073] = {62648}, -- flame touch
	[29078] = {62692}, -- frost touch
	[29089] = {62722}, -- shock touch
	[38944] = {62682}, -- flame reach
	[38970] = {62712}, -- frost reach
	[38978] = {62745}, -- shock reach
	--[38989] = {38541}, -- frost clench (taunt)
	[29173] = true, -- weakness to elements (major breach)
	[39089] = true, -- elemental susceptibility (major breach)
	[39095] = true, -- elemental drain (minor magickasteal)
	[28798] = {61721}, -- frost impulse (minor protection)
	[39146] = {61721}, -- frost ring (minor protection)
	[39163] = {61721}, -- frost pulsar (minor protection)
	]]

	-- Restoration Staff
	[28385] = {}, -- grand healing
	[40058] = {}, -- illustrious healing
	[40060] = {}, -- healing springs
	--[[
	[31531] = true, -- force siphon
	[40109] = true, -- siphon spirit
	[40116] = true, -- quick siphon
	--[37243] = {61693}, -- blessing of protection (minor resolve)
	--[40094] = {61744}, -- combat prayer (minor berserk)
	--[40103] = {61693}, -- blessing of restoration (minor resolve)
	]]

	-- Dual Wield
	--[[
	[21157] = {61665}, -- hidden blade (major brutality)
	[38914] = {61665}, -- shrouded daggers (major brutality)
	--]]
	[38910] = {126667}, -- flying blade first cast
	[126659] = {61665}, -- flying blade jump
	--[[
	[28379] = true,--{29293}, -- twin slashes
	[38839] = true,--{38841}, -- rending slashes
	[38845] = true,--{38848}, -- blood craze
	]]

	-- Bow
	[28879] = {113627}, -- scatter shot + blackrose bow
	[38672] = {113627}, -- magnum shot + blackrose bow
	[38669] = {113627}, -- draining shot + blackrose bow
	--[[
	[38687] = {38688}, -- focused aim (minor fracture)
	[28876] = {}, -- volley
	[38689] = {}, -- endless hail
	[38695] = {}, -- arrow barrage
	[38701] = true,--{38703}, -- acid spray
	[28869] = 10.5,--{44650}, -- poison arrow
	[38645] = 10.5,--{44545}, -- venom arrow
	[38660] = 10.5,--{44549}, -- poison injection
	]]

	-- Armor
	--[[
	[29556] = {61716}, -- evasion (major evasion)
	[39192] = {61716}, -- elude (major evasion)
	[39195] = {61716}, -- shuffle (major evasion)
	]]
	--[29552] = {61694}, -- unstoppable (major resolve)
	--[39205] = {61694}, -- unstoppable brute (major resolve)
	--[39197] = {61694}, -- immovable (major resolve)
	
	-- Werewolf
	[58317] = {61745}, -- hircine's rage (major berserk)
	[58325] = {137210}, -- hircine's fortitude (recovery)
	[32633] = {137257}, -- roar (off balance)
	[39113] = {45834}, -- ferocious roar (off balance), 137287 is heavy attack speed buff
	[39114] = {61743}, -- deafening roar major breach, 137312 is off balance
	[58855] = {58856}, -- infectious claws
	[58864] = {58865}, -- claws of anguish
	[58879] = {58880}, -- claws of life

	-- Soul Magic
	--[[
	[26768] = true,--{126890}, -- soul trap
	[40317] = true,--{126897}, -- consuming trap
	[40328] = true,--{126895}, -- soul splitting trap
	]]

	-- Fighters Guild
	[40169] = {}, -- ring of preservation
	[35750] = {35756}, -- trap beast
	[40372] = {40375}, -- lightweight beast trap
	[40382] = {40385}, -- barbed trap

	-- Mages Guild
	--[[
	[28567] = true,--{126370}, -- entropy
	[40452] = true, --{126371}, -- structured entropy
	]]
	[40457] = {126374}, -- degeneration
	[31632] = false, -- fire rune
	[40470] = false, -- volcanic rune
	[40465] = {40468}, -- scalding rune (dot)
	--[40441] = {61694}, -- balance (major resolve)

	-- Psijic Order
	--[[
	[103503] = {61746}, -- accelerate (minor force)
	[103706] = {61746}, -- channeled acceleration
	[103710] = {61746}, -- race against time
	]]

	-- Undaunted
	--[39475] = {38541}, -- inner fire (taunt)
	--[42056] = {38541}, -- inner rage (taunt)
	--[42060] = {38541}, -- inner beast (taunt)
	[40195] = {61744}, -- camouflaged hunter (minor berserk)

	-- Alliance War
	[33376] = {38549}, -- caltrops
	[40242] = {40251}, -- razor caltrops
	[40255] = {40265}, -- anti-cavalry caltrops
	--[[
	[38566] = {61736}, -- rapid maneuver
	[40211] = {61736}, -- retreating maneuver
	[40215] = {61736}, -- charging maneuver
	[61503] = true, -- vigor
	[61505] = true, -- echoing vigor
	[61507] = true, -- resolving vigor
	]]

	-- Dragonknight
	[20805] = {122658}, -- show seething fury on the molten whip icon
	--[[
	[20492] = {61736}, -- fiery grip (minor expedition)
	[20496] = {61736}, -- unrelenting grip (minor expedition)
	[20499] = {61737}, -- empowering chains (empower)
	[20252] = {31898}, -- burning talons
	[20657] = true, -- searing strike
	[20660] = true, -- burning embers
	[20668] = true, -- venomous claw
	[20917] = {31102}, -- fiery breath
	[20930] = {31104}, -- engulfing flames
	[20944] = {31103}, -- noxious breath
	[29004] = true, -- dragon blood
	[32722] = true, -- coagulating blood
	[32744] = true, -- green dragon blood
	[29043] = true, -- molten weapons
	[31874] = true, -- igneous weapons
	[31888] = true, -- molten armaments
	--[29071] = false, -- obsidian shield
	--[29224] = false, -- igneous shield
	--[32673] = false, -- fragmented shield
	]]
	[29032] = false, -- don't track stonefist
	[31816] = false, -- ignore stone giant
	[31816] = {134336}, -- track stagger instead
	[133027] = {134336}, -- track stagger instead

	-- Sorcerer
	[108840] = {108842}, -- unstable familiar
	[23304] = {108842},
	[77182] = {77187}, -- volatile familiar
	[23316] = {77187},
	[77140] = {77354}, -- twilight tormentor
	[24636] = {77354},
	[46324] = {46327}, -- crystal fragment proc
	[114716] = {46327}, -- crystal fragment proc
	[24165] = {}, -- bound armaments
	[130291] = false,--{24165}, -- track Bound Armaments duration instead of its proc
	[23234] = {51392}, -- bolt escape fatigue
	[23236] = {51392}, -- streak fatigue
	[23277] = {51392}, -- ball of lightning fatigue
	[23182] = {157462}, -- lightning splash
	[23205] = {157537}, -- lightning flood
	[23200] = {157535}, -- liquid lightning
	[24330] = {24330, 12}, -- haunting curse
	[28025] = {}, -- encase
	[28308] = {}, -- shattering prison
	[28311] = {}, -- restraining prison
	[23231] = {}, -- hurricane

	-- Templar
	--[21763] = 6, -- power of the light
	[21765] = {}, -- purifying light
	--[[
	[21726] = {21728}, -- sun fire
	[21729] = {21731}, -- vampire's bane
	[21732] = {21734}, -- reflective light
	[26807] = {26809}, -- radiant aura (magickasteal)
	[26188] = {95933}, -- spear shards
	[26858] = {95957}, -- luminous shards
	[26869] = {26880}, -- blazing spear
	[22265] = true, -- cleansing ritual
	[22259] = true, -- ritual of retribution
	[22262] = true, -- extended ritual
	[26209] = {88401}, -- restoring aura magickasteal
	[26807] = {88401}, -- radiant aura magickasteal
	]]

	-- Warden
	[85578] = {}, -- healing seed
	[85840] = {}, -- budding seeds
	[85845] = {}, -- corrupting pollen
	[85999] = {130140}, -- cutting dive bleed
	[86015] = {}, -- deep fissure
	[86019] = {86019, 6}, -- subterranean assault
	[86161] = true, -- impaling shards
	[86165] = true, -- gripping shards
	[86169] = {86169, 12}, -- winter's revenge
	--[[
	[85862] = {61706}, -- enchanted growth (minor intellect)
	[86023] = {101703}, -- swarm
	[86027] = {101904}, -- fetcher infection
	[86031] = {101944}, -- growing swarm
	[86037] = {61736}, -- falcon's swiftness (major expedition)
	[86041] = {61736}, -- deceptive predator (major expedition)
	[86045] = {61736}, -- bird of prey (major expedition)
	--[86122] = {61694}, -- frost cloak (major resolve)
	--[86126] = {61694}, -- expansive frost cloak (major resolve)
	--[86130] = {61694}, -- ice fortress (major resolve)
	[86148] = 5, -- arctic wind
	[86152] = 5, -- polar wind
	[86156] = 5, -- arctic blast
	[85564] = {90266}, -- nature's grasp healing
	[85858] = {88726}, -- nature's embrace healing
	]]

	-- Nightblade
	--[[
	[18342] = {79717}, -- teleport strike (minor vulnerability)
	[25484] = {79717}, -- ambush
	[25493] = {79717}, -- lotus fan
	[33375] = true,--{90587}, -- blur (major evasion)
	[35414] = true,--{90593}, -- mirage
	[35419] = true,--{90620}, -- phantasmal escape
	]]
	[61902] = {}, -- grim focus (ingame timer is bugged)
	[61919] = {}, -- merciless resolve (ingame timer is bugged)
	[61927] = {}, -- relentless focus (ingame timer is bugged)
	[61907] = false, -- grim focus proc
	[61930] = false, -- merciless resolve proc
	[61932] = false, -- relentless focus proc
	[35441] = {shadowImage}, -- shadow image
	[35445] = false, -- shadow image proc
	[33195] = {}, -- path of darkness
	[36028] = {}, -- refreshing path
	[36049] = {}, -- twisting path
	--[[
	[25375] = true, -- shadow cloak
	[25380] = true, -- shadowy disguise
	[33211] = true, -- summon shade
	[35434] = true, -- dark shade
	[35441] = true,--{shadowImage}, -- shadow image
	[33291] = {33292}, -- strife heal
	[34838] = {34841}, -- funnel health heal
	[34835] = {34836}, -- swallow soul heal
	[33326] = {33333}, -- cripple
	[36943] = {36947}, -- debilitate
	[36957] = {36960}, -- crippling grasp
	[33316] = {61687}, -- drain power (major sorcery)
	[36901] = {61687}, -- power extraction (major sorcery)
	[36891] = {61687}, -- sap essence (major sorcery)
	]]

	-- Necromancer
	[115315] = {115326}, -- life amid death
	[118017] = {118022}, -- renewing undeath
	[118809] = {118814}, -- enduring undeath
	--[118223] = {122625}, -- hungry scythe heal
}

-- stack id => ability id
FancyActionBar.stackMap = {
	-- Grim Focus
	[61905] = 61902,
	[61920] = 61919,
	[61928] = 61927,
	-- Bound Armaments
	[130293] = 24165,
	-- Stone Giant
	[134336] = 134336,
	-- Seething Fury
	[122658] = 122658,
}