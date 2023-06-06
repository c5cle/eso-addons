RaidNotifier = RaidNotifier or {}
RaidNotifier.KA = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

local data = {}

-- Storing Lord Falgravn's Ichor Eruption timers to be able to cancel them in case effect will fade out earlier
local ichorEruption = {
    callId = nil,
    countdownId = nil,
}

function RaidNotifier.KA.Initialize()
    p = RaidNotifier.p
    dbg = RaidNotifier.dbg

    data = {}
end

function RaidNotifier.KA.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)
    local raidId = RaidNotifier.raidId
    local self   = RaidNotifier
    local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.kynesAegis

    if (tName == nil or tName == "") then
        tName = self.UnitIdToString(tUnitId)
    end

    if (result == ACTION_RESULT_BEGIN) then
        -- Half-Giant Tidebreaker's Crashing Wall
        if (abilityId == buffsDebuffs.tidebreaker_crashing_wall) then
            if (settings.tidebreaker_crashing_wall == true) then
                self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_CRASHING_WALL), "kynesAegis", "tidebreaker_crashing_wall", false)
            end
        end
        -- Bloodknight's Blood Fountain
        if (abilityId == buffsDebuffs.bloodknight_blood_fountain) then
            if (settings.bloodknight_blood_fountain == true) then
                self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_BLOOD_FOUNTAIN), "kynesAegis", "bloodknight_blood_fountain", false)
            end
        end
    elseif (result == ACTION_RESULT_EFFECT_GAINED) then
        -- Bitter Knight's Sanguine Prison
        if (abilityId == buffsDebuffs.bitter_knight_sanguine_prison) then
            if (settings.bitter_knight_sanguine_prison == true) then
                if (tType ~= COMBAT_UNIT_TYPE_PLAYER and tName ~= "") then
                    self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_SANGUINE_PRISON_OTHER), tName), "kynesAegis", "bitter_knight_sanguine_prison")
                end
            end
        end
        -- Dragon Totems spawn at Yandir the Butcher boss
        if (abilityId == buffsDebuffs.yandir_dragon_totem_spawn) then
            if (settings.yandir_totem_spawn == 2) then
                -- Since two totems spawns at once we want to avoid extra announcements, so we're adding 2 sec alert suppression
                self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_DRAGON_TOTEM), "kynesAegis", "yandir_totem_spawn", 2)
            end
        end
        -- Harpy Totem spawn at Yandir the Butcher boss
        if (abilityId == buffsDebuffs.yandir_harpy_totem_spawn) then
            if (settings.yandir_totem_spawn == 2) then
                self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_HARPY_TOTEM), "kynesAegis", "yandir_totem_spawn")
            end
        end
        -- Gargoyle Totem spawn at Yandir the Butcher boss
        if (abilityId == buffsDebuffs.yandir_gargoyle_totem_spawn) then
            if (settings.yandir_totem_spawn == 2) then
                self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_GARGOYLE_TOTEM), "kynesAegis", "yandir_totem_spawn")
            end
        end
        -- Chaurus Totem spawn at Yandir the Butcher boss
        if (abilityId == buffsDebuffs.yandir_chaurus_totem_spawn) then
            if (settings.yandir_totem_spawn >= 1) then
                self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_CHAURUS_TOTEM), "kynesAegis", "yandir_totem_spawn")
            end
        end
        -- Butcher's Fire Shaman's or Vrolsworn Fire Mage's meteors (3 meteors at once)
        -- hitValue = 1 for casting or 2250 as the duration of meteor's reaching the targets
        if (buffsDebuffs.firemage_meteor[abilityId] and hitValue > 1) then
            local settingName = buffsDebuffs.firemage_meteor[abilityId]
            -- If player is tracking only meteors on himself we don't need to use any tricks
            if (settings[settingName] == 1 and tType == COMBAT_UNIT_TYPE_PLAYER) then
                self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_FIREMAGE_METEOR), "kynesAegis", settingName, true, 2)
            elseif (settings[settingName] == 2) then
                -- There will be several events for each of the targeted players
                -- In order to determine if our player himself is meteor's target we will analyze all of them
                RaidNotifier.DelayedEventHandler.Add(
                    settingName,
                    { tType = tType },
                    function(argsBag)
                        if (argsBag:ContainsArgumentWithValue("tType", COMBAT_UNIT_TYPE_PLAYER)) then
                            self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_FIREMAGE_METEOR), "kynesAegis", settingName, true, 2)
                        else
                            self:StartCountdown(hitValue, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_FIREMAGE_METEOR_OTHER), "kynesAegis", settingName, false, 2)

                        end
                    end,
                    50
                )
            end
        end
    elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
        -- Lord Falgravn's timer before Ichor Eruption mechanic happens
        if (abilityId == buffsDebuffs.falgravn_ichor_eruption_timer) then
            if (settings.falgravn_ichor_eruption) then
                local countdownTime = math.min(settings.falgravn_ichor_eruption_time_before * 1000, hitValue);

                ichorEruption.callId = zo_callLater(function()
                    -- Theoretically this function shouldn't be called if zo_callLater() was revoked by zo_removeCallLater()
                    -- So there should be no need in checking callId
                    -- But it's not 100% clear if that revoke works as intended at the present times
                    if ichorEruption.callId then
                        ichorEruption.callId = nil
                        ichorEruption.countdownId = self:StartCountdown(countdownTime, GetString(RAIDNOTIFIER_ALERTS_KYNESAEGIS_ICHOR_ERUPTION), "kynesAegis", "falgravn_ichor_eruption", false)
                    end
                end, hitValue - countdownTime)
            end
        end
    elseif (result == ACTION_RESULT_EFFECT_FADED) then
        -- Lord Falgravn's Ichor Eruption timer cancelling
        if (abilityId == buffsDebuffs.falgravn_ichor_eruption_timer) then
            if (settings.falgravn_ichor_eruption) then
                if (ichorEruption.callId ~= nil) then
                    zo_removeCallLater(ichorEruption.callId)
                    ichorEruption.callId = nil
                end
                if (ichorEruption.countdownId ~= nil) then
                    self:StopCountdown(ichorEruption.countdownId)
                    ichorEruption.countdownId = nil
                end
            end
        end
    end
end
