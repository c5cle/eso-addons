RaidNotifier = RaidNotifier or {}
RaidNotifier.MOL = {}

local RaidNotifier = RaidNotifier

local function p() end
local function dbg() end

function RaidNotifier.MOL.Initialize()
	p = RaidNotifier.p
	dbg = RaidNotifier.dbg
end

local function FindGlyph(glyphId, glyphs, knownGlyphs, allowNew)
	if not knownGlyphs[glyphId] then
		if not allowNew then return 0 end
		local lowestDistance = 99999
		local lowestIndex = 0
		local lowestUnit = ""
		for index, data in ipairs(glyphs) do
			for p=1, GetGroupSize() do
				if IsUnitOnline("group"..p) then
					local pX, pY = GetMapPlayerPosition("group"..p)
					if (knownGlyphs[index] == nil) then --only check unknown glyphs
						-- we dont care about scale/factor or how much it is in actual meters
						local distance = RaidNotifier.Util.GetRawDistance(pX,pY, data.x,data.y) * 1000 
						if (distance < lowestDistance) then
							lowestDistance=distance
							lowestIndex=index
							lowestUnit = GetUnitName("group"..p)
						end
					end
				end
			end
		end
		if lowestDistance < 8 and lowestIndex > 0 then
			dbg("Glyph #%d -> %d, first used by %s", lowestIndex, glyphId, lowestUnit)
			knownGlyphs[lowestIndex] = glyphId
			knownGlyphs[glyphId] = lowestIndex
			return lowestIndex
		else
			return 0
		end
	else
		return knownGlyphs[glyphId]
	end
end

function RaidNotifier.MOL.OnBossesChanged()
	local self   = RaidNotifier
	local raidId = RaidNotifier.raidId
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.mawLorkhaj	

	local bossCount, bossAlive, bossFull = self:GetNumBosses(true)

	self:SetElementHidden("mawLorkhaj", "zhaj_glyph_window", true)
	local map = GetMapTileTexture()
	if (bossCount == 1 and map == "Art/maps/reapersmarch/Maw_of_Lorkaj_Base_0.dds") then -- Zhaj'hassa the Forgotten
		buffsDebuffs.zhajBoss_knownGlyphs = {}
		if (settings.zhaj_glyphs) then
			self:SetElementHidden("mawLorkhaj", "zhaj_glyph_window", false)
		end
	elseif (bossCount == 2 and map == "Art/maps/reapersmarch/MawLorkajSuthaySanctuary_Base_0.dds") then -- False Moon Twins, S’Kinrai and Vashai
		
	elseif (bossCount == 1 and map == "Art/maps/reapersmarch/MawLorkajSevenRiddles_Base_0.dds") then
	
	end
end

function RaidNotifier.MOL.OnEffectChanged(eventCode, changeType, eSlot, eName, uTag, beginTime, endTime, stackCount, iconName, buffType, eType, aType, statusEffectType, uName, uId, abilityId, uType)
    local raidId = RaidNotifier.raidId
    local self   = RaidNotifier

    local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.mawLorkhaj
    if (abilityId == buffsDebuffs.rakkhat_hulk_armorweakened and string.sub(uTag, 1, 5) == "group") then
        if (settings.hulk_armorweakened) then
            if (changeType ~= EFFECT_RESULT_FADED) then
                if (AreUnitsEqual(uTag, "player")) then
                    if (stackCount == 1) then
                        self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_HULK_ARMORWEAKENED1), "mawLorkhaj", "hulk_armorweakened")
                    elseif (stackCount == 2) then
                        self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_HULK_ARMORWEAKENED2), "mawLorkhaj", "hulk_armorweakened")
                    end
                else
                    local targetPlayerName = self.UnitIdToString(uId)

                    if (stackCount == 1) then
                        self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_HULK_ARMORWEAKENED1_OTHER), targetPlayerName), "mawLorkhaj", "hulk_armorweakened")
                    elseif (stackCount == 2) then
                        self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_HULK_ARMORWEAKENED2_OTHER), targetPlayerName), "mawLorkhaj", "hulk_armorweakened")
                    end
                end
            end
        end
    end
end

function RaidNotifier.MOL.OnCombatEvent(_, result, isError, aName, aGraphic, aActionSlotType, sName, sType, tName, tType, hitValue, pType, dType, log, sUnitId, tUnitId, abilityId)

	local raidId = RaidNotifier.raidId
	local self   = RaidNotifier
	local buffsDebuffs, settings = self.BuffsDebuffs[raidId], self.Vars.mawLorkhaj
	if (tName == nil or tName == "") then
		tName = self.UnitIdToString(tUnitId)
	end

	--Zhaj'hassa the Forgotten 
	-- Glyphs & Curse (UI elements only, notification code is further down below)
	if settings.zhaj_glyphs then
		if (abilityId == buffsDebuffs.zhajBoss_glyphability) then
			local findNew = (result == ACTION_RESULT_EFFECT_FADED) --only scan for new glyph when effect/glyph is used by the player, NOT when it respawns
			local glyphIndex = FindGlyph(tUnitId, buffsDebuffs.zhajBoss_glyphs, buffsDebuffs.zhajBoss_knownGlyphs, findNew) 
			if (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
				self:StopGlyphTimer(glyphIndex)
			elseif (result == ACTION_RESULT_EFFECT_FADED) then
				self:StartGlyphTimer(glyphIndex, buffsDebuffs.zhajBoss_glyphcooldown)
			end
		elseif (tType == COMBAT_UNIT_TYPE_PLAYER and abilityId == buffsDebuffs.zhajBoss_curseability) then
			local glyphIndex = 7
			if (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then 
				self:StartGlyphTimer(glyphIndex, buffsDebuffs.zhajBoss_curseduration)
			elseif (result == ACTION_RESULT_EFFECT_FADED) then
				self:StopGlyphTimer(glyphIndex)
			end
		end
	end

	if (result == ACTION_RESULT_BEGIN) then
		--Sun-Eater Eclipse Field
		if (abilityId == buffsDebuffs.suneater_eclipse) then
			if settings.suneater_eclipse >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SUNEATER_ECLIPSE), "mawLorkhaj", "suneater_eclipse")
				elseif (tName ~= "" and settings.suneater_eclipse >= 2) then -- removed the distance check for now
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SUNEATER_ECLIPSE_OTHER), tName), "mawLorkhaj", "suneater_eclipse")
				end
			end
		elseif (abilityId == buffsDebuffs.shattering_strike) then
			if (settings.shattering_strike >= 1) then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHATTERINGSTRIKE), "mawLorkhaj", "shattering_strike")
				elseif (tName ~= "" and settings.shattering_strike >= 2) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHATTERINGSTRIKE_OTHER), tName), "mawLorkhaj", "shattering_strike")
				end
			end
		elseif (buffsDebuffs.rakkhat_threshingwings[abilityId]) then
			if settings.rakkhat_threshingwings then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_THRESHINGWINGS), "mawLorkhaj", "rakkhat_threshingwings")
			end
		elseif (buffsDebuffs.rakkhat_darknessfalls == abilityId) then
			if settings.rakkhat_darknessfalls then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_DARKNESSFALLS), "mawLorkhaj", "rakkhat_darknessfalls")
			end
		elseif (buffsDebuffs.rakkhat_darkbarrage[abilityId]) then
			if settings.rakkhat_darkbarrage then
				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_DARKBARRAGE), "mawLorkhaj", "rakkhat_darkbarrage", 12)
			end
		end
	elseif (result == ACTION_RESULT_EFFECT_GAINED_DURATION) then
		if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
			--Grip of Lorkhaj (1st boss debuff)
			if (buffsDebuffs.zhaj_gripoflorkhaj[abilityId]) then
				if settings.zhaj_gripoflorkhaj then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_ZHAJ_GRIPOFLORKHAJ), "mawLorkhaj", "zhaj_gripoflorkhaj", 4)
				end
			end

			-- False Moon Twins, S’Kinrai and Vashai 
			if (buffsDebuffs.twinBoss_lunaraspect[abilityId]) then
				if settings.twinBoss_aspects >= 2 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_LUNAR_ASPECT), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("lunar")
			elseif (buffsDebuffs.twinBoss_shadowaspect[abilityId]) then
				if settings.twinBoss_aspects >= 2 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHADOW_ASPECT), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("shadow")
			elseif (buffsDebuffs.twinBoss_lunarconversion[abilityId]) then
				--conversion just started
				if settings.twinBoss_aspects >= 1 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_LUNAR_CONVERSION), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("tolunar")
			elseif (buffsDebuffs.twinBoss_shadowconversion[abilityId]) then
				--conversion just started
				if settings.twinBoss_aspects >= 1 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHADOW_CONVERSION), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("toshadow")
			end
			--Dro'm Athra Savage / Dro'm Athra Hulk: Armor Shatter
			if (buffsDebuffs.shattered[abilityId]) then
				if settings.shattered then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHATTERED), "mawLorkhaj", "shattered", 4)
				end
			end
			--Marked for Death (panthers)
			if (buffsDebuffs.markedfordeath[abilityId]) then
				if settings.markedfordeath then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_MARKEDFORDEATH), "mawLorkhaj", "markedfordeath", 4)
				end
			end
		end

		--Rakkhat, Fang of Lorkhaj
		if (abilityId == buffsDebuffs.rakkhat_unstablevoid) then
			if settings.rakkhat_unstablevoid >= 1 then
				if (tType == COMBAT_UNIT_TYPE_PLAYER) then 
					if (settings.rakkhat_unstablevoid == 1 and settings.rakkhat_unstablevoid_countdown) then
						self:StartCountdown(buffsDebuffs.rakkhat_unstablevoid_duration, GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_UNSTABLE_VOID), "mawLorkhaj", "rakkhat_unstablevoid")
					else
						self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_UNSTABLE_VOID), "mawLorkhaj", "rakkhat_unstablevoid")
					end
				elseif (tName ~= "" and (settings.rakkhat_unstablevoid == 2)) then
					self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_UNSTABLE_VOID_OTHER), tName), "mawLorkhaj", "rakkhat_unstablevoid")
				end
			end
		--elseif (buffsDebuffs.rakkhat_lunarbastion[abilityId]) then
		--	if settings.rakkhat_lunarbastion1 >= 1 then
		--		if (tType == COMBAT_UNIT_TYPE_PLAYER)  then
		--			if (settings.rakkhat_lunarbastion1 == 1 or settings.rakkhat_lunarbastion1 == 3) then --if "Self" or "All"
		--				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_LUNARBASTION1), "mawLorkhaj", "rakkhat_lunarbastion1")
		--			end
		--		elseif (tName ~= "") then 
		--			if (settings.rakkhat_lunarbastion1 == 2 or settings.rakkhat_lunarbastion1 == 3) then --if "Other" or "All"
		--				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_LUNARBASTION1_OTHER), tName), "mawLorkhaj", "rakkhat_lunarbastion1")
		--			end
		--		end
		--	end
		end
	elseif (result == ACTION_RESULT_EFFECT_FADED) then
		if (tType == COMBAT_UNIT_TYPE_PLAYER) then
			-- End of conversion now properly falls under ACTION_RESULT_EFFECT_FADED
			if (buffsDebuffs.twinBoss_lunarconversion[abilityId]) then
				--conversion ended
				if settings.twinBoss_aspects >= 3 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_LUNAR_ASPECT), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("lunar")
			elseif (buffsDebuffs.twinBoss_shadowconversion[abilityId]) then
				--conversion ended
				if settings.twinBoss_aspects >= 3 then
					self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_SHADOW_ASPECT), "mawLorkhaj", "twinBoss_aspects", 4)
				end
				self:UpdateTwinAspect("shadow")
			elseif (abilityId == buffsDebuffs.twinBoss_shadowaspectremove) then
				self:UpdateTwinAspect("none")
			elseif (abilityId == buffsDebuffs.twinBoss_lunaraspectremove) then
				self:UpdateTwinAspect("none")
			end
		end
		--if (buffsDebuffs.rakkhat_lunarbastion[abilityId]) then
		--	if settings.rakkhat_lunarbastion2 >= 1 then
		--		if (tType == COMBAT_UNIT_TYPE_PLAYER) then
		--			if (settings.rakkhat_lunarbastion2 == 1 or settings.rakkhat_lunarbastion2 == 3) then --if "Self" or "All"
		--				self:AddAnnouncement(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_LUNARBASTION2), "mawLorkhaj", "rakkhat_lunarbastion2")
		--			end
		--		elseif (tName ~= "") then 
		--			if (settings.rakkhat_lunarbastion2 == 2 or settings.rakkhat_lunarbastion2 == 3) then --if "Other" or "All"
		--				self:AddAnnouncement(zo_strformat(GetString(RAIDNOTIFIER_ALERTS_MAWLORKHAJ_RAKKHAT_LUNARBASTION2_OTHER), tName), "mawLorkhaj", "rakkhat_lunarbastion2")
		--			end
		--		end
		--	end
		--end
	end
end
