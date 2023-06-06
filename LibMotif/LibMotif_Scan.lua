-- Scanning code used only by ziggr to generate data for
-- LibMotif_Data.lua
--
-- Normally this file is commented out in the LibMotif.txt manifest
-- so that we don't waste RAM or CPU on this stuff when we're just
-- playing ESO and not developing add-ons.
--
-- Functions to scan ESO UI for motif and achivement names.
--
-- Only works in US English.
--
-- Run this scan once to produce a table in saved variables
-- which you can then copy and paste into LibMotif_Data.lua.

LibMotif = LibMotif or {}

LibMotif.name = "LibMotif"   -- duplicated here from LibMotif.lua solely for RegisterForEvent()
LibMotif.saved_var_version = 1
LibMotif.default = {}

-- Simple/Crown --------------------------------------------------------------
-- These do not have 14x purple pages scattered throughout Tamriel.
-- These are learned all at once, not page-by-page.
-- Use IsSmithingStyleKnown(motif_id) to see if the current character knows
-- this stule.
LibMotif.SIMPLE = {
    [ 1] = true -- ITEMSTYLE_RACIAL_BRETON
,   [ 2] = true -- ITEMSTYLE_RACIAL_REDGUARD
,   [ 3] = true -- ITEMSTYLE_RACIAL_ORC
,   [ 4] = true -- ITEMSTYLE_RACIAL_DARK_ELF
,   [ 5] = true -- ITEMSTYLE_RACIAL_NORD
,   [ 6] = true -- ITEMSTYLE_RACIAL_ARGONIAN
,   [ 7] = true -- ITEMSTYLE_RACIAL_HIGH_ELF
,   [ 8] = true -- ITEMSTYLE_RACIAL_WOOD_ELF
,   [ 9] = true -- ITEMSTYLE_RACIAL_KHAJIIT
,   [15] = true -- ITEMSTYLE_AREA_ANCIENT_ELF
,   [17] = true -- ITEMSTYLE_AREA_REACH
,   [19] = true -- ITEMSTYLE_ENEMY_PRIMITIVE
,   [20] = true -- ITEMSTYLE_ENEMY_DAEDRIC
,   [30] = true -- ITEMSTYLE_AREA_SOUL_SHRIVEN
,   [34] = true -- ITEMSTYLE_RACIAL_IMPERIAL
,   [38] = true -- ITEMSTYLE_AREA_TSAESCI
,   [53] = true -- ITEMSTYLE_HOLIDAY_FROSTCASTER
,   [58] = true -- ITEMSTYLE_HOLIDAY_GRIM_HARLEQUIN
}

-- Unscannable ---------------------------------------------------------------
-- Simple "___ Style Master" string matching fails to match these achievements.
LibMotif.PAGE_ID = {
    [ 59] = { pages_id  =  1545 } -- Hollowjack     / "Happy Work for Hollowjack"
,   [ 71] = { pages_id  =  2186 } -- Psijic Order   / "Psijic Style Master"
,   [ 93] = { pages_id  =  2628 } -- Moongrave Fane / "Moongrave Style Master"
}

-- Scan ----------------------------------------------------------------------

function LibMotif:ScanMotifs()
    local motif        = {}
    local max_motif_id  = GetHighestItemStyleId()
    local motif_seen_ct = 0
    for motif_id = 1, max_motif_id do
        motif_name = GetItemStyleName(motif_id)
        if motif_name and motif_name ~= "" then
            motif[motif_id] = { ["name"] = motif_name }
            motif_seen_ct   = motif_seen_ct + 1
        end
    end
    return { ["motif"        ] = motif
           , ["motif_seen_ct"] = motif_seen_ct
           , ["max_motif_id" ] = max_motif_id
           }
end

local function expand_range(i, r)
    if (r.min == nil) or (i < r.min) then
        r.min = i
    end
    if (r.max == nil) or (r.max < i) then
        r.max = i
    end
    return r
end

function LibMotif:ScanAchievements()
    local min_achievement_id = 1000
    local max_achievement_id = 4000

    local achieve = {}
    local achieve_seen_ct = 0
    local seen_range = {}
    local re = "(.*) Style Master"
    for achievement_id = min_achievement_id, max_achievement_id do
        local achievement_name = GetAchievementName(achievement_id)
        local _, _,motif_name = string.find(achievement_name, re)
        if motif_name then
            achieve[achievement_id] = motif_name
            achieve_seen_ct = achieve_seen_ct + 1
            expand_range( achievement_id, seen_range )
        end
    end

                        -- Include these stragglers whose achievement names
                        -- do not match "___ Style Master" pattern (usually
                        -- because the "___" portion is shortened somehow).
    for motif_id, p in pairs(LibMotif.PAGE_ID) do
        local achievement_id = p.pages_id
        local motif_name = GetItemStyleName(motif_id)
        achieve[achievement_id] = motif_name
        achieve_seen_ct = achieve_seen_ct + 1
        expand_range( achievement_id, seen_range )
    end

    return { ["achieve"] =  achieve
           , ["achieve_seen_ct"] = achieve_seen_ct
           , ["min_seen_id"] = seen_range.min
           , ["max_seen_id"] = seen_range.max
           }
end

function LibMotif:MergeAchievements()
                        -- Index by visible name
    local names = {}
    for motif_id,m in pairs(self.motif) do
        names[m.name] = { ["motif_id"] = motif_id }
    end

    for achievement_id, motif_name in pairs(self.achieve) do
        names[motif_name] = names[motif_name] or {}
        names[motif_name]["pages_id"] = achievement_id

        motif_id = names[motif_name]["motif_id"]
        if motif_id then
            self.motif[motif_id]["pages_id"] = achievement_id
        end
    end
end

function LibMotif.Scan()
    local self = LibMotif
    self.log:Debug("scan")

    local r = self:ScanMotifs()
    self.motif           = r.motif
    self.motif_seen_ct   = r.motif_seen_ct
    self.max_motif_id    = r.max_motif_id

    r = self:ScanAchievements()
    self.achieve         = r.achieve
    self.achieve_seen_ct = r.achieve_seen_ct
    self.achieve_min_id  = r.min_seen_id
    self.achieve_max_id  = r.max_seen_id

    self:MergeAchievements()

    self.saved_vars.motif   = nil -- self.motif
    self.saved_vars.achieve = nil -- self.achieve

    local lines = self:Export()
    self.saved_vars.export = lines
    self.saved_vars.explort = nil
end

-- Mess with the line prefix so that the block of text in the Saved Variables
-- file is easily block-selectable for later copy-and-paste into source.
local function to_prefix(i)
    if i <= 1 then return "    " end
    if i <= 9 then return "  , " end
    if i <= 99 then return " , " end
    if i <= 999 then return ", " end
end

-- Generate text that's (almost) suitable as copy-and-paste data.
function LibMotif:Export()
    local lines = {}
    for motif_id = 1,self.max_motif_id do
        local m = self.motif[motif_id] or {}

        local pages_id = m.pages_id
        local name     = m.name or ""

        local value = "nil"
        if self.SIMPLE[motif_id] then
            value = string.format("{ is_simple       =  true }"             )
        elseif m.pages_id then
            value = string.format("{ achievement_id  =  %4d }"   , m.pages_id )
        end

        local comma = to_prefix(motif_id)
        local line = string.format(
                          "%s  [%3d] = %-27s -- %-40s"
                        , comma
                        , motif_id
                        , value
                        , name
                        )
        table.insert(lines, line)
    end

    return lines
end

-- SlashCommand --------------------------------------------------------------

function LibMotif.SlashCommand(arg1)
    self = LibMotif
    if arg1:lower() == "scan" then
        self.log:Info("Scanning...")
        LibMotif.Scan()
        self.log:Info(
              "Scan complete. Motifs seen: %d. Highest id: %d"
            , self.motif_seen_ct
            , self.max_motif_id
            )
        self.log:Info(
              "Achievements seen: %d. Range [%d, %d]"
            , self.achieve_seen_ct
            , self.achieve_min_id
            , self.achieve_max_id
            )
    end
end

function LibMotif.RegisterSlashCommands()
    local lsc = LibSlashCommander
    if not lsc then
        SLASH_COMMANDS["/lm"] = LibMotif.SlashCommand
        return
    end

    local cmd = lsc:Register( "/lm"
                            , function(arg) LibMotif.SlashCommand(arg) end
                            , "Commands for scanning and querying craftable motifs")

    local sub_forget = cmd:RegisterSubCommand()
    sub_forget:AddAlias("scan")
    sub_forget:SetCallback(function() LibMotif.SlashCommand("scan") end)
    sub_forget:SetDescription("Scan for all craftable motifs")
end

-- Log -----------------------------------------------------------------------

function LibMotif:InitLog()
    if LibDebugLogger then
        self.log = LibDebugLogger.Create(self.name)
    end
    if not self.log then
        local NOP = {}
        function NOP:Debug(...) end
        function NOP:Info(...) end
        function NOP:Warn(...) end
        function NOP:Error(...) end
        self.log = NOP
    end
end

-- Init ----------------------------------------------------------------------

function LibMotif.OnAddOnLoaded(event, addonName)
    self = LibMotif
    if addonName == LibMotif.name then
        if not LibMotif.name then return end
        LibMotif:Initialize()
        -- EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ADD_ON_LOADED)
    end
end

function LibMotif:Initialize()

                        -- No need for saved variables when we're just a
                        -- data table.
                        --
                        -- These slash commands and scanning code are tools
                        -- to build this data table, only need to be run once
                        -- per major release, by ziggr.
    if LibMotif.RegisterSlashCommands then
        LibMotif:InitLog()
        self.saved_vars = ZO_SavedVars:NewAccountWide(
                              "LibMotifVars"
                            , self.saved_var_version
                            , nil
                            , self.default
                            , GetWorldName()
                            )
        LibMotif.RegisterSlashCommands()
    end
end

-- Postamble -----------------------------------------------------------------

EVENT_MANAGER:RegisterForEvent( LibMotif.name
                              , EVENT_ADD_ON_LOADED
                              , LibMotif.OnAddOnLoaded
                              )
