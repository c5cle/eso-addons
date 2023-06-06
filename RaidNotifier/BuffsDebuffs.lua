RaidNotifier = RaidNotifier or {}
RaidNotifier.BuffsDebuffs = {}

-- ---------------------------------------------------
-- Hel Ra  -------------------------------------------
-- ---------------------------------------------------
local hel_ra = {}

hel_ra.jump = {}
hel_ra.jump[56354] = true
hel_ra.jump[10583] = true
hel_ra.jump[33686] = true
hel_ra.jump[56243] = true
hel_ra.jump[33686] = true
hel_ra.jump[33686] = true
hel_ra.jump[33686] = true

hel_ra.yokeda_meteor = 52213
hel_ra.yokeda_impulse = 52207
hel_ra.yokeda_shout = 50585

hel_ra.warrior_stoneform    = 56576
hel_ra.warrior_shieldthrow  = 48267

hel_ra.warrior_channeled_swipes = 47819

hel_ra.destructive_outbreak = 56667

RaidNotifier.BuffsDebuffs[RAID_HEL_RA_CITADEL] = hel_ra


-- ---------------------------------------------------
-- Aetherian Archive  --------------------------------
-- ---------------------------------------------------
local archive = {}

-- Lightning Storm Atronach
archive.stormatro_impendingstorm = 49583 --the large aoe
archive.stormatro_lightningstorm = 47898 --the lightning from the sky

-- Foundation Stone Atronach
archive.stoneatro_boulderstorm = 48240   --induvidual boulders are 49311
archive.stoneatro_bigquake     = 49098

-- Celestial Mage
archive.mage_conjure_axe = {}
archive.mage_conjure_axe[49506] = true
archive.mage_conjure_axe[49508] = true
archive.mage_conjure_axe[49669] = true --might not be needed

archive.mage_conjure_reflection = {} --some of these might be irrelevant
archive.mage_conjure_reflection[49399] = true
archive.mage_conjure_reflection[49400] = true
archive.mage_conjure_reflection[49401] = true
archive.mage_conjure_reflection[49408] = true
archive.mage_conjure_reflection[49409] = true
archive.mage_conjure_reflection[49410] = true
archive.mage_conjure_reflection[49676] = true
archive.mage_conjure_reflection[49678] = true
archive.mage_conjure_reflection[49679] = true
archive.mage_conjure_reflection[49680] = true
archive.mage_conjure_reflection[49681] = true
archive.mage_conjure_reflection[49682] = true
archive.mage_conjure_reflection[49683] = true
archive.mage_conjure_reflection[49685] = true
archive.mage_conjure_reflection[49686] = true
archive.mage_conjure_reflection[49687] = true
archive.mage_conjure_reflection[49688] = true
archive.mage_conjure_reflection[49689] = true
archive.mage_conjure_reflection[56432] = true --seems out of place but has the same (unusual) name

-- Overchargers (same abilities as in Sanctum it seems)
archive.overcharged    = 58218
archive.call_lightning = 79390

RaidNotifier.BuffsDebuffs[RAID_AETHERIAN_ARCHIVE] = archive


-- ---------------------------------------------------
-- Sanctum Ophidia -----------------------------------
-- ---------------------------------------------------
local sanctum = {}
--[[
[20:23:55] 2200, 78781 (Taking Aim), 0/0, 0/0/, 0/47711/Bob^Mx
[21:48:11] 2200, 53554 (Celestial Nightmare), 0/0, 0/0/, 0/51142/Bob^Mx     ----- BLACK HOLE MANTI??
--]]

-- Mantikora Spear
sanctum.mantikora_spear = 56324
sanctum.mantikora_quake = 54125

-- Ozara
sanctum.ozara_trapping_bolts = 57839

-- Serpent Poison Phase
sanctum.serpent_poison_teleport = {} -- abilities where the Serpent teleports to do the poison phase (specific ids for the various things after the poison ends)
sanctum.serpent_poison_teleport[53681] = 1 -- followed by lamias
sanctum.serpent_poison_teleport[54690] = 2 -- followed by manti from left pool
sanctum.serpent_poison_teleport[53775] = 3 -- followed by manti from right pool
sanctum.serpent_poison_teleport[53796] = 4 -- followed by shield phase
sanctum.serpent_poison_teleport[53812] = 5 -- final

-- Serpent Magicka Detonation
sanctum.serpent_magicka_deto           = 59036
sanctum.serpent_world_shaper           = 56857
sanctum.serpent_world_shaper_delay     = 5000

-- Trolls Spreading Poison
sanctum.spreading_poison = {} --determine which ones we actually need
sanctum.spreading_poison[52036] = 1  -- \\                                         (when someone spreads it with you?)
sanctum.spreading_poison[58663] = 1  --  >>  Cast 1.9s, Enemy, 28m Range
sanctum.spreading_poison[82591] = 1  -- //
sanctum.spreading_poison[54419] = 2  -- \\                                         (the actual poison)
sanctum.spreading_poison[58669] = 2  --  >> Instant Cast, Enemy, 28m Range, 2.5s
sanctum.spreading_poison[82597] = 2  -- //
sanctum.spreading_poison[54420] = 3  -- Instant Cast, Area, 3.5m Radius
sanctum.spreading_poison[80794] = 4  -- Cast 1.9s, Cone??, 0m Range??, 28m Radius

sanctum.boulder_toss = 52012

-- Overchargers
sanctum.overcharged    = 58218
sanctum.call_lightning = 79390

RaidNotifier.BuffsDebuffs[RAID_SANCTUM_OPHIDIA] = sanctum


-- ---------------------------------------------------
-- Dragonstar Arena  ---------------------------------
-- ---------------------------------------------------
local dragonstar = {}
--[[
[20:51:33] 2200, 53328 (Warming Aura), 0/0, 0/0/, 0/58425/   DSA Stage 2 fire dying???
TODO:
	Arena 2: Warming Aura (see above)
	Arena 6: Lethal Arrow (from Boss)
--]]
dragonstar.general_taking_aim      = 74978
dragonstar.general_crystal_blast   = 54792
dragonstar.arena2_crushing_shock   = 53286 --used by both boss and icemages
dragonstar.arena6_drain_resource   = 54608
dragonstar.arena7_unstable_core    = 52920 --also used by hiath in stage 10
dragonstar.arena8_ice_charge       = 54841
dragonstar.arena8_fire_charge      = 54838

RaidNotifier.BuffsDebuffs[RAID_DRAGONSTAR_ARENA] = dragonstar


-- ---------------------------------------------------
-- Maw of Lorkhaj  -----------------------------------
-- ---------------------------------------------------
local maw_lorkhaj = {}
--[[
[21:15:27] 2200, 73676 (Crushing Void), 0/0/, 0/28336/
[21:15:29] 2200, 73679 (Crushing Void), 0/0/, 0/28336/

[22:00:08] 2200, 75434 (Whirlwind), 0/0, 0/0/, 0/16874/Bob^Mx
--]]

--Zhaj'hassa the Forgotten
--  Grip of Lorkhaj
maw_lorkhaj.zhaj_gripoflorkhaj = {}
maw_lorkhaj.zhaj_gripoflorkhaj[57513] = true
maw_lorkhaj.zhaj_gripoflorkhaj[57515] = true
maw_lorkhaj.zhaj_gripoflorkhaj[57517] = true
maw_lorkhaj.zhaj_gripoflorkhaj[57469] = true
maw_lorkhaj.zhaj_gripoflorkhaj[57470] = true
maw_lorkhaj.zhaj_gripoflorkhaj[57471] = true
--   Curse
maw_lorkhaj.zhajBoss_curseability  = 57517
maw_lorkhaj.zhajBoss_curseduration = 25
--   Glyphs
maw_lorkhaj.zhajBoss_glyphability  = 57525
maw_lorkhaj.zhajBoss_glyphcooldown = 25
maw_lorkhaj.zhajBoss_knownGlyphs = {}
maw_lorkhaj.zhajBoss_glyphs =
{
	{x=0.55496829748154, y=0.29175475239754},
	{x=0.56342494487762, y=0.25405216217041},
	{x=0.60077518224716, y=0.24876673519611},
	{x=0.62297391891479, y=0.26250880956650},
	{x=0.64059197902679, y=0.29774489998817},
	{x=0.62508809566498, y=0.32699084281921},
}

--False Moon Twins, S’Kinrai and Vashai
--   Holy Aspect
maw_lorkhaj.twinBoss_lunaraspect = {}
maw_lorkhaj.twinBoss_lunaraspect[59472] = true
maw_lorkhaj.twinBoss_lunaraspect[59474] = true
maw_lorkhaj.twinBoss_lunaraspect[59534] = true
maw_lorkhaj.twinBoss_lunaraspect[59535] = true
maw_lorkhaj.twinBoss_lunaraspect[59536] = true
maw_lorkhaj.twinBoss_lunaraspect[59537] = true
maw_lorkhaj.twinBoss_lunaraspect[59538] = true
--  Shadow Aspect
maw_lorkhaj.twinBoss_shadowaspect = {}
maw_lorkhaj.twinBoss_shadowaspect[59523] = true
maw_lorkhaj.twinBoss_shadowaspect[59524] = true
maw_lorkhaj.twinBoss_shadowaspect[59527] = true
maw_lorkhaj.twinBoss_shadowaspect[59528] = true
maw_lorkhaj.twinBoss_shadowaspect[59529] = true
maw_lorkhaj.twinBoss_shadowaspect[59629] = true
maw_lorkhaj.twinBoss_shadowaspect[59465] = true
--  Conversion
maw_lorkhaj.twinBoss_lunarconversion = {}
maw_lorkhaj.twinBoss_lunarconversion[75460] = true
maw_lorkhaj.twinBoss_lunarconversion[75456] = true
maw_lorkhaj.twinBoss_shadowconversion = {}
maw_lorkhaj.twinBoss_shadowconversion[59698] = true
maw_lorkhaj.twinBoss_shadowconversion[59699] = true
--  Removal
maw_lorkhaj.twinBoss_shadowaspectremove = 59639 --shadow
maw_lorkhaj.twinBoss_lunaraspectremove  = 59640 --lunar

--Rakkhat
--  Unstable Void
maw_lorkhaj.rakkhat_unstablevoid = 74488
maw_lorkhaj.rakkhat_unstablevoid_duration = 4500
--  Threshing Wings
maw_lorkhaj.rakkhat_threshingwings = {}
maw_lorkhaj.rakkhat_threshingwings[73741] = true
maw_lorkhaj.rakkhat_threshingwings[74080] = true
maw_lorkhaj.rakkhat_threshingwings[74081] = true
maw_lorkhaj.rakkhat_threshingwings[74083] = true
maw_lorkhaj.rakkhat_threshingwings[74084] = true
maw_lorkhaj.rakkhat_threshingwings[74085] = true
maw_lorkhaj.rakkhat_threshingwings[74086] = true
--  Darkness Falls
maw_lorkhaj.rakkhat_darknessfalls = 74035
-- Dark Barrage
maw_lorkhaj.rakkhat_darkbarrage = {}
maw_lorkhaj.rakkhat_darkbarrage[74384] = true
maw_lorkhaj.rakkhat_darkbarrage[74385] = true
maw_lorkhaj.rakkhat_darkbarrage[74388] = true
maw_lorkhaj.rakkhat_darkbarrage[74390] = true
maw_lorkhaj.rakkhat_darkbarrage[74391] = true
maw_lorkhaj.rakkhat_darkbarrage[74392] = true
maw_lorkhaj.rakkhat_darkbarrage[75965] = true
maw_lorkhaj.rakkhat_darkbarrage[75966] = true
maw_lorkhaj.rakkhat_darkbarrage[75967] = true
maw_lorkhaj.rakkhat_darkbarrage[75968] = true
maw_lorkhaj.rakkhat_darkbarrage[78015] = true
-- Lunar Bastion
maw_lorkhaj.rakkhat_lunarbastion = {}
maw_lorkhaj.rakkhat_lunarbastion[74377] = true
maw_lorkhaj.rakkhat_lunarbastion[74273] = true
maw_lorkhaj.rakkhat_lunarbastion[74347] = true
maw_lorkhaj.rakkhat_lunarbastion[74384] = true
maw_lorkhaj.rakkhat_lunarbastion[74352] = true
maw_lorkhaj.rakkhat_lunarbastion[74357] = true
maw_lorkhaj.rakkhat_lunarbastion[74362] = true
maw_lorkhaj.rakkhat_lunarbastion[74367] = true
-- Armor Weakened debuff provided by Hulk's Thunderous Smash attack
maw_lorkhaj.rakkhat_hulk_armorweakened = 74672

--Mobs
-- Eclipse Field (Sun-Eater)
maw_lorkhaj.suneater_eclipse = 73700

-- Shattering Strike (Savage - two-hander)
maw_lorkhaj.shattering_strike = 73249

--  Armor Shattered
maw_lorkhaj.shattered = {}
maw_lorkhaj.shattered[73250] = true
maw_lorkhaj.shattered[75071] = true

--  Marked for Death (Panthers)
maw_lorkhaj.markedfordeath = {}
maw_lorkhaj.markedfordeath[55104] = true
maw_lorkhaj.markedfordeath[55105] = true
maw_lorkhaj.markedfordeath[59892] = true
maw_lorkhaj.markedfordeath[55174] = true
maw_lorkhaj.markedfordeath[73223] = true
maw_lorkhaj.markedfordeath[55099] = true
maw_lorkhaj.markedfordeath[55181] = true
maw_lorkhaj.markedfordeath[55182] = true
maw_lorkhaj.markedfordeath[58459] = true
--  Colossal Mark (Big Panthers)
maw_lorkhaj.markedfordeath[75672] = true
maw_lorkhaj.markedfordeath[75674] = true

maw_lorkhaj.rakkhat_shattered = {}
maw_lorkhaj.rakkhat_shattered[74671] = true
maw_lorkhaj.rakkhat_shattered[74672] = true
maw_lorkhaj.rakkhat_shattered[76030] = true
maw_lorkhaj.rakkhat_shattered[76031] = true

RaidNotifier.BuffsDebuffs[RAID_MAW_OF_LORKHAJ] = maw_lorkhaj


-- ---------------------------------------------------
-- Maelstrom Arena  ----------------------------------
-- ---------------------------------------------------
local maelstrom = {}

maelstrom.stage7_poison = {}
maelstrom.stage7_poison[68871] = true
maelstrom.stage7_poison[68909] = true
maelstrom.stage7_poison[68910] = true
maelstrom.stage7_poison[69855] = true
maelstrom.stage7_poison[69854] = true -- poison explode
maelstrom.stage7_poison[73866] = true -- poison explode
maelstrom.stage9_synergy = 67359

RaidNotifier.BuffsDebuffs[RAID_MAELSTROM_ARENA] = maelstrom


-- ---------------------------------------------------
-- Halls of Fabrication ------------------------------
-- ---------------------------------------------------
local halls_fab = {}

-- Hunter Pair
halls_fab.venom_injection              = 95230
halls_fab.hunters_spawn_sphere         = 90414
-- Pinnacle Factotum (2nd boss)
halls_fab.pinnacleBoss_fluxburst       = 90755 -- the streak-like attack
halls_fab.pinnacleBoss_conduit_spawn   = 91781 -- sadly not targeted on somebody
halls_fab.pinnacleBoss_conduit_drain   = 91792
halls_fab.pinnacleBoss_scalded_debuff  = 90916

-- Refabrication Committee (4th bosses)
--  Reducer
halls_fab.committee_overheat             = 94747
halls_fab.committee_overheat_aura        = 94736
--  Reactor
halls_fab.committee_overload             = 94759
halls_fab.committee_overload_aura        = 94757
--  Reclaimer
halls_fab.committee_overcharge_aura      = 90715
--  Ruined Factotum spawns
halls_fab.committee_fabricant_spawn      = 90499
halls_fab.committee_reclaim_achieve      = 94458 -- achievement "Planned Obsolescence" has failed if this shows up
halls_fab.committee_catastrophic_discharge = {}
halls_fab.committee_catastrophic_discharge[90581] = true
halls_fab.committee_catastrophic_discharge[90632] = true -- the actual channel as it is exploding next to someone (do we want the rest as well?)
halls_fab.committee_catastrophic_discharge[91358] = true
halls_fab.committee_catastrophic_discharge[91359] = true
halls_fab.committee_catastrophic_discharge[94764] = true
halls_fab.committee_catastrophic_discharge[94765] = true
halls_fab.committee_catastrophic_discharge[94767] = true
halls_fab.committee_catastrophic_discharge[94939] = true
halls_fab.committee_catastrophic_discharge[94941] = true
halls_fab.committee_catastrophic_discharge[94942] = true
halls_fab.committee_catastrophic_discharge[94944] = true
halls_fab.committee_catastrophic_discharge[94949] = true
halls_fab.committee_catastrophic_discharge[94950] = true

-- Assembly General
halls_fab.assembly_titanic_smash = 90428 -- only thing that needs to be blocked?

-- Other
halls_fab.conduit_strike = {}
halls_fab.conduit_strike[88036]   = true
halls_fab.conduit_strike[94613]   = true  -- from Committee trio
halls_fab.power_leech             = 88041 -- the actual stun you need to break free from
halls_fab.taking_aim              = 91736
halls_fab.draining_ballista       = 91077

RaidNotifier.BuffsDebuffs[RAID_HALLS_OF_FABRICATION] = halls_fab


-- ---------------------------------------------------
-- Asylum Sanctorium ---------------------------------
-- ---------------------------------------------------
local asylum = {}

-- Generic spawning of boss & boss minions
asylum.boss_spawn = 10298

-- Saint Felms
asylum.felms_teleport_strike = 99138

-- Saint Llothis
asylum.llothis_defiling_blast = 95545
asylum.llothis_soul_stained_corruption = 95585

-- Saint Olms
--asylum.olms_swipe = 95428 -- for tank
--asylum.olms_scalding_roar = 98683 -- for tank
asylum.olms_storm_the_heavens  = 98535
asylum.olms_exhaustive_charges = 95482
asylum.olms_gusts_of_steam = 98868 -- aoe under everyone's feet (jump starts)
asylum.olms_eruption = 99974 -- jump
asylum.olms_trial_by_fire = 98582
asylum.olms_protector_spawn = 64508 -- aka find turret, better than 64489 due to its tUnitId
asylum.olms_phasesHealth = {90, 75, 50, 25}
asylum.olms_phase2 = 98615 -- after 90% health
asylum.olms_phase3 = 98677 -- after 75% health
asylum.olms_phase4 = 98678 -- after 50% health
asylum.olms_phase5 = 98679 -- after 25% health
asylum.olms_boss_dormant  = 99990
asylum.olms_boss_enrage   = 101354 -- doesn't actually enrage Olms, just the bosses that spawn on HM

-- list of abilities to keep an eye on (enable debug to see when they appear)
asylum.interest_list = {}
-- spawning of boss? no additional info on the unit itself it seems (check boss health to determine which one it is? how do we get unitId tho??)
asylum.interest_list[10298] = true
-- "Dormant", when bosses goes sleepy sleep, 2200 & 2240 in succession, then 45s later 2250 when he wakes up, tUnitId == boss-in-question
asylum.interest_list[99990] = true
-- "Enrage", called when bosses enrage, 2240 on start, 2250 on stop (also when they go to sleep), seems to repeat each 20s (does that mean the enrage stacks up?), tUnitId == boss-in-question
asylum.interest_list[101354] = true
 -- easy debugging when put here (see above for what these do)
asylum.interest_list[64508] = true

RaidNotifier.BuffsDebuffs[RAID_ASYLUM_SANCTORIUM] = asylum

-- ------------------------------------------------------
-- -- Cloudrest  ----------------------------------------
-- -- ---------------------------------------------------
local cloudrest = {}

cloudrest.shadow_world = {} --- debuff upon entering the shadow world
cloudrest.shadow_world[108045] = true
cloudrest.shadow_world[104620] = true

cloudrest.shadow_realm_cast = 103946
cloudrest.olorime_spears = 104019
cloudrest.olorime_spears_synergized = 104017

cloudrest.heavy_attack = {}
cloudrest.heavy_attack[104755] = true -- Scalding sunder - fire
cloudrest.heavy_attack[105780] = true -- Shocking smash - lightening
cloudrest.heavy_attack[106375] = true -- Ravaging Blow - frost

-- Shade of Galenwe and Falarielle
cloudrest.hoarfrost = {} --ACTION_RESULT_BEGIN, hitValue = 2500
cloudrest.hoarfrost[103760] = 1 -- first frost
cloudrest.hoarfrost[110465] = 2 -- during execute
cloudrest.hoarfrost_new = {} --ACTION_RESULT_EFFECT_GAINED, hitValue = 1
cloudrest.hoarfrost_new[103673] = 1
cloudrest.hoarfrost_new[110513] = 2
cloudrest.hoarfrost_countdown = 6000 -- hardcoded for now
cloudrest.hoarfrost_syn = 103697
cloudrest.hoarfrost_shed = 103714
cloudrest.chilling_comet = 106374
cloudrest.icy_teleport = 106682
cloudrest.flux_burst = 105796 -- 80% first jump

-- Shade of Siroria
cloudrest.roaring_flare = {}
cloudrest.roaring_flare[103531] = true
cloudrest.roaring_flare[110431] = true -- additional fire on execute
cloudrest.roaring_flare_countdown = 6000 -- hardcoded for now
cloudrest.fiery_crash = 106601 -- jump

-- Shade of Relequen and Belanaril
-- [2200] hitValue 3000 (noone)
--cloudrest.voltaic_current = 103553
-- [2245] hitValue 10000
cloudrest.voltaic_current = {}
--cloudrest.voltaic_current[103895] = true -- mainboss
--cloudrest.voltaic_current[103896] = true -- sideboss only
--cloudrest.voltaic_current[110427] = true -- mainboss execute
cloudrest.voltaic_current[103555] = true -- new, the only one so works with all three??
--cloudrest.voltaic_current = 103555
-- overload [2240] hitValue 1, then [2245] hitValue 10000
cloudrest.voltaic_overload = 87346 -- start and end
cloudrest.voltaic_overload_progress = {}
cloudrest.voltaic_overload_progress[109059] = true
cloudrest.voltaic_overload_progress[109060] = true
cloudrest.voltaic_overload_progress[109061] = true
cloudrest.voltaic_overload_progress[109062] = true
cloudrest.voltaic_overload_progress[109063] = true
cloudrest.voltaic_overload_progress[109064] = true
cloudrest.voltaic_overload_progress[109065] = true
cloudrest.voltaic_overload_progress[109066] = true
--cloudrest.amplification = 109022
-- [2240] hitValue ticks from 1 to 41 over the course of voltaic overload

-- Maja
cloudrest.start_cd_of_srealm = 105890
cloudrest.nocturnals_favor = 104535 -- 2200 and 2250
cloudrest.crushing_darkness = 105239 -- 2240
--cloudrest.crushing_darkness = 105173 -- 2245
cloudrest.sotDead_proj_to_corpse = 105120 -- [2250] T event after shadow is dead
cloudrest.sum_shadow_beads = 105291
cloudrest.tentacle_spawn = 105016
cloudrest.break_amulet = 106023
cloudrest.baneful_barb = 105975
cloudrest.shade_baneful_mark = 107196
cloudrest.player_exit_srealm = 105218
cloudrest.malicious_strike = {}
cloudrest.malicious_strike[110242] = true -- veteran
cloudrest.malicious_strike[105363] = true -- normal
cloudrest.shadow_splash = 105123

cloudrest.interest_list = {}

RaidNotifier.BuffsDebuffs[RAID_CLOUDREST] = cloudrest

-- ------------------------------------------------------
-- -- Blackrose  ----------------------------------------
-- -- ---------------------------------------------------
local blackrose = {}
RaidNotifier.BuffsDebuffs[RAID_BLACKROSE_PRISON] = blackrose

-- ------------------------------------------------------
-- -- Sunspire  -----------------------------------------
-- -- ---------------------------------------------------
local sunspire = {}
sunspire.breath = {
	[121751] = true,	-- fire breath
	[119283] = true,	-- frost breath
	[121980] = true,	-- searing breath
}

-- Trash
sunspire.chilling_comet = {
	[116636] = true,
	[121075] = true,	-- in timeshift
}
sunspire.statue_emerge = {
	[121930] = true,
	[121932] = true,
	[121928] = true,
}

-- Yolnukrinn fire boss
sunspire.door_protection_fire = 118630
sunspire.cataclism = 122598
sunspire.focus_fire = 121722
sunspire.focus_fire_tick = { -- remove
	[121732] = true,
	[121726] = true,
}
-- Lokkestiiz ice boss
sunspire.door_protection_ice = 120417 -- 2200
sunspire.frozen_tomb = 119632
sunspire.frozen_tomb_wipe_time = 60000

sunspire.fire_trail = 122727 -- lighting breath while flying mechanic
sunspire.raid_mr3_conjuredReflection = 124051
sunspire.frozen_prison = 124335
sunspire.storm_fury  = {
	[115871] = true,
	[115702] = true,
}
sunspire.storm_breath = 123673

-- Nahvinaas gold boss
sunspire.sweeping_breath = { -- 5 sec
	[120188] = true, -- left -> right
	[118743] = true, -- right -> left
}
sunspire.thrash = 118562
sunspire.mark_for_death = 117938
sunspire.mark_for_death_defile = 120864 -- 2245
--sunspire.molten_meteor = 117249 -- 2200
sunspire.molten_meteor = {
	[117251] = true, -- veteran
	[123067] = true -- normal
}
sunspire.time_shift = 121676 -- 2200
sunspire.time_breach_time = 3000
sunspire.time_breach = 121210
sunspire.time_breach_use = 121213 -- 2240 T
sunspire.return_to_reality = 121254 -- 2245 T
sunspire.find_the_enemy = 121275
sunspire.shocking_bolt = 121443 -- 2245 T
sunspire.shocking_bolt_delay = 4000
sunspire.translation_apocalypse = 121436
--[[
	2240 time shift 121500
	2245 time breach 121210 hitvalue 15000??
	2240 time shift 124280
	laduje portal na prawo (od startu okolo 3 sek)
	2245 time shift 121502

]]

sunspire.negate_field = 121411 -- 2200 hitvalue
sunspire.lightening_storm  = 121271 -- 2245

sunspire.flame_split = 119485
sunspire.agony_totem = 118411

RaidNotifier.BuffsDebuffs[RAID_SUNSPIRE] = sunspire

-- ------------------------------------------------------
-- -- Kyne's Aegis---------------------------------------
-- -- ---------------------------------------------------
local kynes_aegis = {}

-- Half-Giant Tidebreaker's Crashing Wall
kynes_aegis.tidebreaker_crashing_wall = 134196
-- Bitter Knight's Sanguine Prison
kynes_aegis.bitter_knight_sanguine_prison = 132473
-- Bloodknight's Blood Fountain
kynes_aegis.bloodknight_blood_fountain = 140294
-- Dragon Totem spawn at Yandir the Butcher boss
kynes_aegis.yandir_dragon_totem_spawn = 133264
-- Harpy Totem spawn at Yandir the Butcher boss
kynes_aegis.yandir_harpy_totem_spawn = 133511
-- Gargoyle Totem spawn at Yandir the Butcher boss
kynes_aegis.yandir_gargoyle_totem_spawn = 133514
-- Chaurus Totem spawn at Yandir the Butcher boss
kynes_aegis.yandir_chaurus_totem_spawn = 133516
-- Meteors
kynes_aegis.firemage_meteor = {
	[140606] = "yandir_fireshaman_meteor", -- Meteor casted by Butcher's Fire Shaman during the Yandir the Butcher boss encounter on hardmode difficulty
	[134023] = "vrol_firemage_meteor", -- Meteor casted by Vrolsworn Fire Mage during the Captain Vrol boss encounter
}
-- Effect which fires when Lord Falgravn starts his Ichor Eruption mechanic
kynes_aegis.falgravn_ichor_eruption_timer = 136548

RaidNotifier.BuffsDebuffs[RAID_KYNES_AEGIS] = kynes_aegis

-- ------------------------------------------------------
-- -- Rockgrove------------------------------------------
-- -- ---------------------------------------------------
local rockgrove = {}

-- Sul-Xan Reaver's Sundering Strike
rockgrove.sulxan_reaver_sundering_strike = 149524
-- Sul-Xan Soulweaver's Astral Shield: casting
rockgrove.sulxan_soulweaver_astral_shield_cast = 149089
-- Sul-Xan Soulweaver's Astral Shield: gained shield by himself
rockgrove.sulxan_soulweaver_astral_shield_self = 149099
-- Havocrel Barbarian's Hasted Assault
rockgrove.havocrel_barbarian_hasted_assault = {
	[149261] = true,
	[149268] = true,
}
-- Oaxiltso's Savage Blitz
rockgrove.oaxiltso_savage_blitz = {
	[149414] = true,
	[157932] = true,
}
-- Oaxiltso's Noxious Sludge
rockgrove.oaxiltso_noxious_sludge = 157860
-- Havocrel Annihilator's Cinder Cleave at the fight with Oaxiltso
rockgrove.oaxiltso_annihilator_cinder_cleave = 152688
-- Radiating Heat (player gains this effect while Prime Meteor is present)
rockgrove.meteor_radiating_heat = {
	[152462] = true, -- on trash
	[157383] = true, -- on second boss
}
-- Flame-Herald Bahsei's Death Touch debuff (caused by Embrace of Death mech)
rockgrove.bahsei_death_touch = 150078

RaidNotifier.BuffsDebuffs[RAID_ROCKGROVE] = rockgrove

-- ------------------------------------------------------
-- -- Dreadsail Reef-------------------------------------
-- -- ---------------------------------------------------
local dreadsail_reef = {}

-- Lylanar's Imminent Blister debuff (will be followed by Blistering Fragility; attack ID = 166522)
dreadsail_reef.lylanar_imminent_blister = 168525
-- Turlassil's Imminent Chill debuff (will be followed by Chilling Fragility; attack ID = 166527)
dreadsail_reef.turlassil_imminent_chill = 168526
-- Lylanar's Heavy Attack
dreadsail_reef.lylanar_broiling_hew = 167273
-- Turlassil's Heavy Attack
dreadsail_reef.turlassil_stinging_shear = 167280
-- Destructive Ember (Fire Dome)
dreadsail_reef.destructive_ember = 166209
-- Piercing Hailstone (Ice Dome)
dreadsail_reef.piercing_hailstone = 166178
-- Reef Guardian's cast on Reef Heart
dreadsail_reef.reef_guardian_heartburn = 163692
-- Reef Guardian's buff that Reef Heart receives (60s)
dreadsail_reef.reef_guardian_heartburn_buff = 170481
-- Vulnerability in case Heart was destroyed in time
dreadsail_reef.reef_guardian_heartburn_vulnerability = 166031
-- Empowerment in case Heart wasn't destroyed in time
dreadsail_reef.reef_guardian_heartburn_empowerment = 166032
-- Tideborn Taleria's Rapid Deluge
dreadsail_reef.taleria_rapid_deluge = {
	[174959] = true, -- Normal
	[174960] = true, -- Veteran
	[174961] = true, -- Hardmode
}

RaidNotifier.BuffsDebuffs[RAID_DREADSAIL_REEF] = dreadsail_reef
