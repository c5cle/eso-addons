TamrielTradeCentre = {}
TamrielTradeCentre.IsDebug = false
TamrielTradeCentre.AddonName = "TamrielTradeCentre"

function TamrielTradeCentre:DebugWriteLine(msg)
	if (self.IsDebug) then
		d(msg)
	end
end

TamrielTradeCentreLangEnum = {
	Default = 0,
	EN = 1,
	DE = 2,
	FR = 3,
	RU = 4,
	ZH = 5,
	ES = 6,
	JP = 7
}

TamrielTradeCentreLangOriginalName = {
	[TamrielTradeCentreLangEnum.EN] = "English",
	[TamrielTradeCentreLangEnum.DE] = "Deutsch",
	[TamrielTradeCentreLangEnum.FR] = "Français",
	[TamrielTradeCentreLangEnum.RU] = "русский",
	[TamrielTradeCentreLangEnum.ZH] = "简体中文",
	[TamrielTradeCentreLangEnum.ES] = "Español",
	[TamrielTradeCentreLangEnum.JP] = "日本語"
}

function TamrielTradeCentre:EnumToString(enum, enumValue)
	for name, value in pairs(enum) do
		if (value == enumValue) then
			return name
		end
	end

	return nil
end

function TamrielTradeCentre:IsStringNilOrEmpty(s)
	return s == nil or s == ""
end

function TamrielTradeCentre:GetString(keyName, langEnum)
	local originalKey = _G[keyName]
	if (langEnum ~= nil and langEnum ~= TamrielTradeCentreLangEnum.Default) then
		local enumString = self:EnumToString(TamrielTradeCentreLangEnum, langEnum)
		if (not self:IsStringNilOrEmpty(enumString)) then
			local localizedKey = _G[keyName .. "_" .. enumString]
			if (localizedKey ~= nil) then
				local localizedString = GetString(localizedKey)
				if (not self:IsStringNilOrEmpty(localizedString)) then
					return localizedString
				end
			end
		end
	end

	return GetString(originalKey)
end


function TamrielTradeCentre:StringFormatPOSIX(format, ...)
	local args, order = {...}, {}

	format = format:gsub('%%(%d+)%$', function(i)
        table.insert(order, args[tonumber(i)])
        return '%'
    end)

    return string.format(format, unpack(order))
end

function TamrielTradeCentre:IsItemLink(link)
	local _, _, type = ZO_LinkHandler_ParseLink(link)
	return type == "item"
end

function TamrielTradeCentre:FormatNumber(number, decimal)
	local mult = 10 ^ (decimal or 2)
	number = math.floor(number * mult + 0.5) / mult

	local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return minus .. int:reverse():gsub("^,", "") .. fraction
end

local KioskIDNPCsTable = {
	[0] = {
		GetString(TTC_NPC_MENGILWAEN),
		GetString(TTC_NPC_NELVONGALEN),
		GetString(TTC_NPC_DONNAELAIN),
		GetString(TTC_NPC_SHELZAKA),
		GetString(TTC_NPC_SHUHASA),
		GetString(TTC_NPC_KEENEYES),
		GetString(TTC_NPC_GLEGOKH),
	},
	[1] = {
		GetString(TTC_NPC_MAKKHZAHR),
	},
	[2] = {
		GetString(TTC_NPC_BALVERSARVANI),
		GetString(TTC_NPC_NISTYNIEL),
		GetString(TTC_NPC_RAMZASA),
		GetString(TTC_NPC_VIRWILLAURE),
	},
	[3] = {
		GetString(TTC_NPC_SHULIISH),
	},
	[4] = {
		GetString(TTC_NPC_HARZDAK),
	},
	[5] = {
		GetString(TTC_NPC_CANDA),
		GetString(TTC_NPC_HEATONSCALES),
		GetString(TTC_NPC_MUHEH),
		GetString(TTC_NPC_RONURIL),
		GetString(TTC_NPC_SHINIRAER),
	},
	[6] = {
		GetString(TTC_NPC_SHARADDARGO),
	},
	[7] = {
		GetString(TTC_NPC_AMBARYSTERAN),
	},
	[8] = {
		GetString(TTC_NPC_UZARRUR),
	},
	[9] = {
		GetString(TTC_NPC_JALAIMA),
		GetString(TTC_NPC_MANI),
		GetString(TTC_NPC_MURGRUD),
		GetString(TTC_NPC_NINDENEL),
		GetString(TTC_NPC_TEROMAWEN),
	},
	[10] = {
		GetString(TTC_NPC_ULYNMARYS),
	},
	[11] = {
		GetString(TTC_NPC_KHARG),
	},
	[12] = {
		GetString(TTC_NPC_GALISANDALEN),
	},
	[13] = {
		GetString(TTC_NPC_CAMYAALE),
		GetString(TTC_NPC_FENDROSFARYON),
		GetString(TTC_NPC_GHOBARGH),
		GetString(TTC_NPC_GOUDADUL),
		GetString(TTC_NPC_HASIWEN),
	},
	[14] = {
		GetString(TTC_NPC_DUGUGIKH),
	},
	[15] = {
		GetString(TTC_NPC_SEEKSBETTERDEALS),
	},
	[16] = {
		GetString(TTC_NPC_HALASH),
	},
	[17] = {
		GetString(TTC_NPC_BOLSTHIRANDUS),
		GetString(TTC_NPC_FINTILORWE),
		GetString(TTC_NPC_GOH),
		GetString(TTC_NPC_IANNIANITH),
		GetString(TTC_NPC_MIZUL),
		GetString(TTC_NPC_NAIFINEH),
		GetString(TTC_NPC_WALKSINLEAVES),
	},
	[18] = {
		GetString(TTC_NPC_NAERORIEN),
	},
	[19] = {
		GetString(TTC_NPC_NIRYWY),
	},
	[20] = {
		GetString(TTC_NPC_GLOTHOZUG),
	},
	[21] = {
		GetString(TTC_NPC_CERWERIELL),
		GetString(TTC_NPC_FERZHELA),
		GetString(TTC_NPC_GUZG),
		GetString(TTC_NPC_LANIRSARE),
		GetString(TTC_NPC_RENZAIQ),
	},
	[22] = {
		GetString(TTC_NPC_PANERSEWEN),
	},
	[23] = {
		GetString(TTC_NPC_CARILLDA),
	},
	[24] = {
		GetString(TTC_NPC_URAACIL),
	},
	[25] = {
		GetString(TTC_NPC_DULIA),
		GetString(TTC_NPC_SHAMUNIZ),
	},
	[26] = {
		GetString(TTC_NPC_ARVERFALOS),
		GetString(TTC_NPC_KAALE),
		GetString(TTC_NPC_TILINARIE),
		GetString(TTC_NPC_VALUESMANYTHINGS),
		GetString(TTC_NPC_ZUNLOG),
	},
	[27] = {
		GetString(TTC_NPC_ORNYENQUE),
	},
	[28] = {
		GetString(TTC_NPC_MALIRZZAKA),
	},
	[29] = {
		GetString(TTC_NPC_GLORGZORGO),
	},
	[30] = {
		GetString(TTC_NPC_LAKNAR),
		GetString(TTC_NPC_SAYMIMAH),
		GetString(TTC_NPC_UURWAERION),
		GetString(TTC_NPC_VINDERHLARAN),
		GetString(TTC_NPC_YAT),
	},
	[31] = {
		GetString(TTC_NPC_MARBILAH),
	},
	[32] = {
		GetString(TTC_NPC_MANIDAH),
	},
	[33] = {
		GetString(TTC_NPC_LEJESHA),
	},
	[34] = {
		GetString(TTC_NPC_FRENIDELA),
		GetString(TTC_NPC_ROUDI),
		GetString(TTC_NPC_SHAKH),
		GetString(TTC_NPC_TENDIRVLAREN),
		GetString(TTC_NPC_VORH),
	},
	[35] = {
		GetString(TTC_NPC_BIXITLEESH),
	},
	[36] = {
		GetString(TTC_NPC_ALDAMURVYN),
	},
	[37] = {
		GetString(TTC_NPC_FANWYEARIE),
	},
	[38] = {
		GetString(TTC_NPC_AHZISH),
		GetString(TTC_NPC_ATIN),
		GetString(TTC_NPC_AZARATI),
		GetString(TTC_NPC_ESTILLDO),
		GetString(TTC_NPC_AERCHITH),
		GetString(TTC_NPC_MORG),
		GetString(TTC_NPC_TREDYNDARAM),
	},
	[39] = {
		GetString(TTC_NPC_ESSILION),
	},
	[40] = {
		GetString(TTC_NPC_DROMASH),
	},
	[41] = {
		GetString(TTC_NPC_ANIAMA),
	},
	[42] = {
		GetString(TTC_NPC_BRARAHLAALO),
		GetString(TTC_NPC_FAEDRE),
		GetString(TTC_NPC_KHALATAH),
		GetString(TTC_NPC_MURGOZ),
		GetString(TTC_NPC_SINTILFALION),
	},
	[43] = {
		GetString(TTC_NPC_ZULGOZU),
	},
	[44] = {
		GetString(TTC_NPC_NAMEEL),
	},
	[45] = {
		GetString(TTC_NPC_MOGAZGUR),
	},
	[46] = {
		GetString(TTC_NPC_GHATRUGH),
	},
	[47] = {
		GetString(TTC_NPC_MAKMARGO),
	},
	[48] = {
		GetString(TTC_NPC_ARNYEANA),
		GetString(TTC_NPC_ERALIAN),
		GetString(TTC_NPC_JEELUSLEI),
		GetString(TTC_NPC_LLETHERNILEM),
		GetString(TTC_NPC_PARVAIA),
	},
	[49] = {
		GetString(TTC_NPC_MAJDAWA),
	},
	[50] = {
		GetString(TTC_NPC_ATHEVAL),
	},
	[51] = {
		GetString(TTC_NPC_ADAINJI),
	},
	[52] = {
		GetString(TTC_NPC_ALISEWEN),
		GetString(TTC_NPC_CELORIEN),
		GetString(TTC_NPC_DERASGOLATHYN),
		GetString(TTC_NPC_DOSA),
		GetString(TTC_NPC_GHOGURZ),
	},
	[53] = {
		GetString(TTC_NPC_MEDENBERENDUS),
	},
	[54] = {
		GetString(TTC_NPC_ALARETH),
	},
	[55] = {
		GetString(TTC_NPC_MUSLABLIZ),
	},
	[56] = {
		GetString(TTC_NPC_EMUIN),
		GetString(TTC_NPC_GASHEG),
		GetString(TTC_NPC_TARSHEHS),
		GetString(TTC_NPC_VALSSALVANI),
		GetString(TTC_NPC_ZINO),
	},
	[57] = {
		GetString(TTC_NPC_GEEHSAKKA),
	},
	[58] = {
		GetString(TTC_NPC_JUNALNAKAL),
	},
	[59] = {
		GetString(TTC_NPC_TALENDUM),
	},
	[60] = {
		GetString(TTC_NPC_ENDORIELL),
		GetString(TTC_NPC_ERWURLDE),
		GetString(TTC_NPC_GALSFENDYN),
		GetString(TTC_NPC_HAYAIA),
		GetString(TTC_NPC_RAZGUGUL),
		GetString(TTC_NPC_THROUGHGILDEDEYES),
		GetString(TTC_NPC_ZARUM),
	},
	[61] = {
		GetString(TTC_NPC_NAKMARGO),
	},
	[62] = {
		GetString(TTC_NPC_TELVONAROBAR),
	},
	[63] = {
		GetString(TTC_NPC_FERANRELENIM),
	},
	[64] = {
		GetString(TTC_NPC_GANANITH),
		GetString(TTC_NPC_JZARAER),
		GetString(TTC_NPC_LUZ),
		GetString(TTC_NPC_SILVERSCALES),
		GetString(TTC_NPC_URVELHLAREN),
	},
	[65] = {
		GetString(TTC_NPC_MAJIDID),
	},
	[66] = {
		GetString(TTC_NPC_TANURLLERVU),
	},
	[67] = {
		GetString(TTC_NPC_ADAGWEN),
	},
	[68] = {
		GetString(TTC_NPC_GALAMSELETH),
	},
	[69] = {
		GetString(TTC_NPC_INISHEZ),
	},
	[70] = {
		GetString(TTC_NPC_JEEMA),
		GetString(TTC_NPC_LIANORIEN),
		GetString(TTC_NPC_LOGOGRU),
		GetString(TTC_NPC_MABIT),
		GetString(TTC_NPC_MERVSSARYS),
		GetString(TTC_NPC_TERORNE),
	},
	[71] = {
		GetString(TTC_NPC_NARKHUKULG),
	},
	[72] = {
		GetString(TTC_NPC_BORGRARA),
		GetString(TTC_NPC_HENRIETTEPANOIT),
		GetString(TTC_NPC_NAGRULGROSTUGBAZ),
		GetString(TTC_NPC_OORGURN),
	},
	[73] = {
		GetString(TTC_NPC_DAHNADREEL),
	},
	[74] = {
		GetString(TTC_NPC_FARVYNRETHAN),
		GetString(TTC_NPC_GATHEWEN),
		GetString(TTC_NPC_QANLIZ),
		GetString(TTC_NPC_SHINYTRADES),
		GetString(TTC_NPC_SNEGBUG),
		GetString(TTC_NPC_VIRWEN),
	},
	[75] = {
		GetString(TTC_NPC_DAYNASSADRANO),
		GetString(TTC_NPC_MAJHASUR),
		GetString(TTC_NPC_ONURAIMAHT),
	},
	[76] = {
		GetString(TTC_NPC_FARUL),
		GetString(TTC_NPC_ERLURAMAR),
		GetString(TTC_NPC_ZAGHGROSTUGH),
		"zagh", --TODO: Find a way to fix this hack
	},
	[77] = {
		GetString(TTC_NPC_SYALLETH),
	},
	[78] = {
		GetString(TTC_NPC_ATAZHA),
		GetString(TTC_NPC_RINAMI),
		GetString(TTC_NPC_LORTHODAER),
		GetString(TTC_NPC_MAUHOTH),
		GetString(TTC_NPC_SEBASTIANBRUTYA),
		GetString(TTC_NPC_JENACALVUS),
	},
	[79] = {
		GetString(TTC_NPC_RELIEVESBURDENS),
	},
	[80] = {
		GetString(TTC_NPC_RUXULTAV),
		GetString(TTC_NPC_RUNIK),
		GetString(TTC_NPC_FELAYNUVARAM),
	},
	[81] = {
		GetString(TTC_NPC_NARRIL),
		GetString(TTC_NPC_GINETTEMALARELIE),
		GetString(TTC_NPC_MAHRAHDR),
	},
	[82] = {
		GetString(TTC_NPC_COMMERCEDELEGATE),
		GetString(TTC_NPC_NOVENIADRANO),
		GetString(TTC_NPC_ORSTAG),
		GetString(TTC_NPC_RAVAMSEDAS),
		GetString(TTC_NPC_SHOGARZ),
		GetString(TTC_NPC_VALOWENDE),
	},
	[83] = {
		GetString(TTC_NPC_NARDHILBARYS),
	},
	[84] = {
		GetString(TTC_NPC_AMBALOR),
		GetString(TTC_NPC_NOWAJAN),
		GetString(TTC_NPC_RINEDEL),
	},
	[85] = {
		GetString(TTC_NPC_SHARGALASH),
		GetString(TTC_NPC_QUELILMOR),
		GetString(TTC_NPC_VARANDIA),
	},
	[86] = {
		GetString(TTC_NPC_HUZZIN),
		GetString(TTC_NPC_IRNADREN),
		GetString(TTC_NPC_RIALILRIN),
		GetString(TTC_NPC_RUBYNDENILE),
		GetString(TTC_NPC_TALWULLAURE),
		GetString(TTC_NPC_YGGURZSTRONGBOW),
	},
	[87] = {
		GetString(TTC_NPC_UTZAEI),
	},
	[88] = {
		GetString(TTC_NPC_AKIOSHEEJA),
		GetString(TTC_NPC_FAELEMAR),
		GetString(TTC_NPC_MAHADALATBERGAMA),
		GetString(TTC_NPC_ORDASHA),
		GetString(TTC_NPC_THALORIL),
		GetString(TTC_NPC_XOKOMAR),

	},
	[89] = {
		GetString(TTC_NPC_GIRTA),
	},
	[90] = {
		GetString(TTC_NPC_ADIBLARGO),
		GetString(TTC_NPC_ARTURAPAMARC),
		GetString(TTC_NPC_FORTISASINA),
		GetString(TTC_NPC_MAELANRITH),
		GetString(TTC_NPC_NIRSHALA),
		GetString(TTC_NPC_RAZZAMIN),
	},
	[91] = {
		GetString(TTC_NPC_BEGOK),
	},
	[92] = {
		GetString(TTC_NPC_GLAETALDO),
		GetString(TTC_NPC_GOLGAKUL),
		GetString(TTC_NPC_JAFLINNA),
		GetString(TTC_NPC_MAGUZAK),
		GetString(TTC_NPC_SADENSARVANI),
		GetString(TTC_NPC_WUSAVA),
		"jaflinna", --TODO: Find a way to fix this hack
	},
	[93] = {
		GetString(TTC_NPC_LAYTIVASENDRIS),
	},
	[94] = {
		GetString(TTC_NPC_BREDROMATHOR),
		GetString(TTC_NPC_HULEIDA),
		GetString(TTC_NPC_MAEVOLK),
		GetString(TTC_NPC_TRALLINARIAN),
		GetString(TTC_NPC_WITA),
		GetString(TTC_NPC_ZUUGOZAG),
	},
	[95] = {
		GetString(TTC_NPC_MDESHARGO),
	},
	[96] = {
		GetString(TTC_NPC_BODFIRA),
		GetString(TTC_NPC_BRIGHORTAN),
		GetString(TTC_NPC_JOTEPMOTA),
		GetString(TTC_NPC_KELTORGAN),
		GetString(TTC_NPC_MARILIAVERETHI),
		GetString(TTC_NPC_VICTOIREMADACH),
	},
	[97] = {
		GetString(TTC_NPC_MORBORGOL),
	},
	[98] = {
		GetString(TTC_NPC_AMIRUDDA),
		GetString(TTC_NPC_DANDRASOMAYN),
		GetString(TTC_NPC_LHOTAHIR),
		GetString(TTC_NPC_PRAXEDESVESTALIS),
		GetString(TTC_NPC_SHURUTHIKH),
		GetString(TTC_NPC_SIHRIMAYA),
	},
	[99] = {
		GetString(TTC_NPC_DIONHASSILDOR),
	},
	[100] = {
		GetString(TTC_NPC_BODSAMANAS),
		GetString(TTC_NPC_FURNVEKH),
		GetString(TTC_NPC_LIVIATAPPO),
		GetString(TTC_NPC_VEN),
		GetString(TTC_NPC_VESAKTA),
		GetString(TTC_NPC_ZENELAZ),
	},
	[101] = {
		GetString(TTC_NPC_TUXUTL),
	},
	[102] = {
		GetString(TTC_NPC_INNRYK),
		GetString(TTC_NPC_KEMSHELAR),
		GetString(TTC_NPC_MARCELLEFANIS),
		GetString(TTC_NPC_PUGEREAULAFFOON),
		GetString(TTC_NPC_SHAKHRATH),
		GetString(TTC_NPC_ZOEFRERNILE),
	},
	[103] = {
		GetString(TTC_NPC_JANNEJONNICENT),
	},
	[104] = {
		GetString(TTC_NPC_ARZALAYA),
		GetString(TTC_NPC_GEI),
		GetString(TTC_NPC_SHARFLEKH),
		GetString(TTC_NPC_STEPHENNSURILIE),
		GetString(TTC_NPC_TILDINFANYA),
		GetString(TTC_NPC_VARTHEVAGUE),
	},
	[105] = {
		GetString(TTC_NPC_JAHIM),
	},
	[106] = {
		GetString(TTC_NPC_ALVURATHENIM),
		GetString(TTC_NPC_FALANI),
		GetString(TTC_NPC_GRUDOGG),
		GetString(TTC_NPC_RUNETHYNEBRENUR),
		GetString(TTC_NPC_TULSMADRYON),
		GetString(TTC_NPC_WYNSERPE),
	},
	[107] = {
		GetString(TTC_NPC_THREDIS),
	}
}

function TamrielTradeCentre:NPCNameToKioskID(npcNameString, isExact)
	if (self:IsStringNilOrEmpty(npcNameString)) then
		return nil
	end

	npcNameString = string.lower(npcNameString)

	local candidateNPCName = ""
	local candidateKioskID = nil
	for kioskID, npcNames in pairs(KioskIDNPCsTable) do
		for _, npcName in pairs(npcNames) do
			if (npcName ~= "") then
				if (isExact) then
					if (npcName == npcNameString) then
						return kioskID
					end
				else
					if (string.find(npcNameString, npcName, 1, true) and string.len(npcName) > string.len(candidateNPCName)) then
						candidateNPCName = npcName
						candidateKioskID = kioskID
					end
				end
			end
		end
	end

	if (isExact) then
		return nil
	end

	return candidateKioskID
end

function TamrielTradeCentre:GetCurrentKioskID()
	local npcName = zo_strformat(SI_UNIT_NAME, GetRawUnitName("interact"))
	npcName = string.lower(npcName)

	local kioskID = self:NPCNameToKioskID(npcName, true)
	if (kioskID ~= nil) then
		return kioskID
	end

	if (IsUnitGuildKiosk("interact")) then
		d(self:StringFormatPOSIX("Unknown kiosk NPC name %1$s. Please report it to TTC author on ESOUI or email admin@tamrieltradecentre.com", npcName))
	end

	local guildID, _ = GetCurrentTradingHouseGuildDetails()
	if (guildID ~= nil and guildID ~= 0) then
		kioskID = self:NPCNameToKioskID(GetGuildOwnedKioskInfo(guildID), false)
	end

	return kioskID
end

------------------------------------------------------------------------------------------------------------

TamrielTradeCentrePrice = {}

------------------------------------------------------------------------------------------------------------

TamrielTradeCentre_PriceInfo = {}
function TamrielTradeCentre_PriceInfo:New(avg, max, min, entryCount, amountCount, suggestedPrice)
	local priceInfo = {}
	priceInfo.Avg = avg
	priceInfo.Max = max
	priceInfo.Min = min
	priceInfo.EntryCount = entryCount
	priceInfo.AmountCount = amountCount
	priceInfo.SuggestedPrice = suggestedPrice

	return priceInfo
end

------------------------------------------------------------------------------------------------------------

TamrielTradeCentre_ItemInfo = {}
function TamrielTradeCentre_ItemInfo:TraitTypeToTraitID(traitType)
	if (traitType == ITEM_TRAIT_TYPE_ARMOR_DIVINES) then
		return 13
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS) then
		return 12
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE) then
		return 9
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_INFUSED or traitType == ITEM_TRAIT_TYPE_WEAPON_INFUSED or traitType == ITEM_TRAIT_TYPE_JEWELRY_INFUSED) then
		return 3
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_INTRICATE or traitType == ITEM_TRAIT_TYPE_WEAPON_INTRICATE or traitType == ITEM_TRAIT_TYPE_JEWELRY_INTRICATE) then
		return 15
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_NIRNHONED or traitType == ITEM_TRAIT_TYPE_WEAPON_NIRNHONED) then
		return 14
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_ORNATE or traitType == ITEM_TRAIT_TYPE_WEAPON_ORNATE or traitType == ITEM_TRAIT_TYPE_JEWELRY_ORNATE) then
		return 16
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_REINFORCED) then
		return 10
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_STURDY) then
		return 8
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_TRAINING or traitType == ITEM_TRAIT_TYPE_WEAPON_TRAINING) then
		return 5
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED) then
		return 11
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_ARCANE) then
		return 17
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_HEALTHY) then
		return 18
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_ROBUST) then
		return 19
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY) then
		return 21
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_HARMONY) then
		return 22
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE) then
		return 23
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_SWIFT) then
		return 24
	elseif (traitType == ITEM_TRAIT_TYPE_JEWELRY_TRIUNE) then
		return 25
	elseif (traitType == ITEM_TRAIT_TYPE_SPECIAL_STAT) then
		return 20
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_CHARGED) then
		return 1
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_DEFENDING) then
		return 4
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_POWERED) then
		return 0
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_PRECISE) then
		return 2
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_SHARPENED) then
		return 6
	elseif (traitType == ITEM_TRAIT_TYPE_WEAPON_DECISIVE) then
		return 7
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_AGGRESSIVE or traitType == ITEM_TRAIT_TYPE_JEWELRY_AGGRESSIVE or traitType == ITEM_TRAIT_TYPE_WEAPON_AGGRESSIVE) then
		return 26
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_AUGMENTED or traitType == ITEM_TRAIT_TYPE_JEWELRY_AUGMENTED or traitType == ITEM_TRAIT_TYPE_WEAPON_AUGMENTED) then
		return 27
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_BOLSTERED or traitType == ITEM_TRAIT_TYPE_JEWELRY_BOLSTERED or traitType == ITEM_TRAIT_TYPE_WEAPON_BOLSTERED) then
		return 28
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_FOCUSED or traitType == ITEM_TRAIT_TYPE_JEWELRY_FOCUSED or traitType == ITEM_TRAIT_TYPE_WEAPON_FOCUSED) then
		return 29
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_PROLIFIC or traitType == ITEM_TRAIT_TYPE_JEWELRY_PROLIFIC or traitType == ITEM_TRAIT_TYPE_WEAPON_PROLIFIC) then
		return 30
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_QUICKENED or traitType == ITEM_TRAIT_TYPE_JEWELRY_QUICKENED or traitType == ITEM_TRAIT_TYPE_WEAPON_QUICKENED) then
		return 31
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_SHATTERING or traitType == ITEM_TRAIT_TYPE_JEWELRY_SHATTERING or traitType == ITEM_TRAIT_TYPE_WEAPON_SHATTERING) then
		return 32
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_SOOTHING or traitType == ITEM_TRAIT_TYPE_JEWELRY_SOOTHING or traitType == ITEM_TRAIT_TYPE_WEAPON_SOOTHING) then
		return 33
	elseif (traitType == ITEM_TRAIT_TYPE_ARMOR_VIGOROUS or traitType == ITEM_TRAIT_TYPE_JEWELRY_VIGOROUS or traitType == ITEM_TRAIT_TYPE_WEAPON_VIGOROUS) then
		return 34
	end

	return nil
end

function TamrielTradeCentre_ItemInfo:ArmorTypeToCategory2OverWrite(armorType)
	if (armorType == ARMORTYPE_HEAVY) then
		return 4
	elseif (armorType == ARMORTYPE_MEDIUM) then
		return 3
	elseif (armorType == ARMORTYPE_LIGHT) then
		return 2
	end

	return nil
end

function TamrielTradeCentre_ItemInfo:PotionEffectCodeToID(isPoison, effectID)
	if (not isPoison) then
		if (effectID == 1) then --Restore Health
			return 0
		elseif (effectID == 2) then --Ravage Health
			return 13
		elseif (effectID == 3) then --Restore Magicka
			return 1
		elseif (effectID == 4) then --Ravage Magicka
			return 14
		elseif (effectID == 5) then --Restore Stamina
			return 2
		elseif (effectID == 6) then --Ravage Stamina
			return 15
		elseif (effectID == 7) then --Spell Resistance
			return 7
		elseif (effectID == 8) then --Lower Spell Resis (breach)
			return 20
		elseif (effectID == 9) then --Increase armor
			return 8
		elseif (effectID == 10) then --Lower Armor (Fracture)
			return 21
		elseif (effectID == 11) then --Increase Spell Power
			return 5
		elseif (effectID == 12) then --Lower Spell Power
			return 17
		elseif (effectID == 13) then --Increase Weapon Power
			return 6
		elseif (effectID == 14) then --Lower Weapon Power
			return 18
		elseif (effectID == 15) then --Spell Critical
			return 3
		elseif (effectID == 16) then --Lower Spell Critical
			return 58
		elseif (effectID == 17) then --Weapon Critical
			return 4
		elseif (effectID == 18) then --Lower Weapon Critical
			return 16
		elseif (effectID == 19) then --unstoppable
			return 12
		elseif (effectID == 20) then --Stun
			return 23
		elseif (effectID == 21) then --Detection
			return 9
		elseif (effectID == 22) then --Invisible
			return 10
		elseif (effectID == 23) then --Speed
			return 11
		elseif (effectID == 24) then --Reduce speed
			return 22
		elseif (effectID == 25) then --Reduce damage taken (Protection)
			return 24
		elseif (effectID == 26) then --increase damage taken
			return 28
		elseif (effectID == 27) then --sustain restore health
			return 25
		elseif (effectID == 28) then --gradual ravage health
			return 27
		elseif (effectID == 29) then --Increase Healing taken (Vitality)
			return 19
		elseif (effectID == 30) then --Lower Healing taken (Defile)
			return 26
		end
	else
		if (effectID == 1) then --Restore Health
			return 29
		elseif (effectID == 2) then --Ravage Health
			return 42
		elseif (effectID == 3) then --Restore Magicka
			return 30
		elseif (effectID == 4) then --Ravage Magicka
			return 43
		elseif (effectID == 5) then --Restore Stamina
			return 31
		elseif (effectID == 6) then --Ravage Stamina
			return 44
		elseif (effectID == 7) then --Spell Resistance
			return 36
		elseif (effectID == 8) then --Lower Spell Resis (breach)
			return 49
		elseif (effectID == 9) then --Increase armor
			return 37
		elseif (effectID == 10) then --Lower Armor (Fracture)
			return 50
		elseif (effectID == 11) then --Increase Spell Power
			return 34
		elseif (effectID == 12) then --Lower Spell Power
			return 46
		elseif (effectID == 13) then --Increase Weapon Power
			return 35
		elseif (effectID == 14) then --Lower Weapon Power
			return 47
		elseif (effectID == 15) then --Spell Critical
			return 32
		elseif (effectID == 16) then --Lower Spell Critical
			return 59
		elseif (effectID == 17) then --Weapon Critical
			return 33
		elseif (effectID == 18) then --Lower Weapon Critical
			return 45
		elseif (effectID == 19) then --unstoppable
			return 41
		elseif (effectID == 20) then --Stun
			return 52
		elseif (effectID == 21) then --Detection
			return 38
		elseif (effectID == 22) then --Invisible
			return 39
		elseif (effectID == 23) then --Speed
			return 40
		elseif (effectID == 24) then --Reduce speed
			return 51
		elseif (effectID == 25) then --Reduce damage taken (Protection)
			return 53
		elseif (effectID == 26) then --increase damage taken
			return 57
		elseif (effectID == 27) then --sustain restore health
			return 54
		elseif (effectID == 28) then --gradual ravage health
			return 56
		elseif (effectID == 29) then --Increase Healing taken (Vitality)
			return 48
		elseif (effectID == 30) then --Lower Healing taken (Defile)
			return 55
		end
	end

	return nil
end

function TamrielTradeCentre_ItemInfo:SetCodeToID(setCode)
	if (setCode == 0) then
		return nil
	end

	return setCode
end

function TamrielTradeCentre_ItemInfo:StyleCodeToID(styleCode)
	if (styleCode == 0) then
		return nil
	end

	return styleCode
end

function TamrielTradeCentre_ItemInfo:NameSpecializedItemTypeToItemID(itemName, specializedItemType)
	itemName = string.lower(itemName)

	if (TamrielTradeCentre.ItemLookUpTable == nil) then
		return nil
	end

	local specializedItemTypeTable = TamrielTradeCentre.ItemLookUpTable[itemName]
	if (specializedItemTypeTable == nil) then
		return nil
	end

	if (specializedItemType == nil) then
		for key, value in pairs(specializedItemTypeTable) do
			return value
		end

		return nil
	end

	return specializedItemTypeTable[specializedItemType]
end

------------------------------------------------------------------------------------------------------------

TamrielTradeCentre_MasterWritInfo = {}

------------------------------------------------------------------------------------------------------------

function TamrielTradeCentre_MasterWritInfo:New(itemLink)
	local itemType, _ = GetItemLinkItemType(itemLink)
	if (itemType ~= ITEMTYPE_MASTER_WRIT) then
		return nil
	end

	local itemLinkParams = {ZO_LinkHandler_ParseLink(itemLink)}
	for key, value in pairs(itemLinkParams) do
		local num = tonumber(value)
		if (num ~= nil) then
			itemLinkParams[key] = num
		end
	end

	local masterWritInfo = {}

	--10 to 15
	local itemName = string.lower(zo_strformat(SI_TOOLTIP_ITEM_NAME, GetItemLinkName(itemLink)))
	local requiredQualityID = -1
	masterWritInfo.NumVoucher = math.ceil(itemLinkParams[24] / 10000 - 0.5)

	local requiredItemNameRegex = nil

	if (string.find(itemName, GetString(TTC_ALCHEMY))) then
		requiredItemNameRegex = GetString(TTC_MASTER_WRIT_ALCHEMYREGEX)

		local isPoison = itemLinkParams[10] == 239
		local potionEffectIDs = {}
		table.insert(potionEffectIDs, TamrielTradeCentre_ItemInfo:PotionEffectCodeToID(isPoison, itemLinkParams[11]))
		table.insert(potionEffectIDs, TamrielTradeCentre_ItemInfo:PotionEffectCodeToID(isPoison, itemLinkParams[12]))
		table.insert(potionEffectIDs, TamrielTradeCentre_ItemInfo:PotionEffectCodeToID(isPoison, itemLinkParams[13]))

		table.sort(potionEffectIDs)
		masterWritInfo.RequiredPotionEffectIDs = potionEffectIDs
	elseif (string.find(itemName, GetString(TTC_ENCHANTING))) then
		requiredItemNameRegex = GetString(TTC_MASTER_WRIT_ENCHANTINGREGEX)

		requiredQualityID = itemLinkParams[12] - 1
	elseif (string.find(itemName, GetString(TTC_PROVISIONING))) then
		requiredItemNameRegex = GetString(TTC_MASTER_WRIT_PROVISIONINGREGEX)
	else
		requiredItemNameRegex = GetString(TTC_MASTER_WRIT_CRAFTINGREGEX)

		requiredQualityID = itemLinkParams[12] - 1
		masterWritInfo.RequiredSetID = TamrielTradeCentre_ItemInfo:SetCodeToID(itemLinkParams[13])
		masterWritInfo.RequiredTraitID = TamrielTradeCentre_ItemInfo:TraitTypeToTraitID(itemLinkParams[14])
		masterWritInfo.RequiredStyleID = TamrielTradeCentre_ItemInfo:StyleCodeToID(itemLinkParams[15])
	end

	local masterWritDescription = GenerateMasterWritBaseText(itemLink)
	local tokens = {}
	for str in string.gmatch(masterWritDescription, "([^;]+)") do
		table.insert(tokens, str)
	end

	local requiredItemName = nil
	for _, token in pairs(tokens) do
		local _, _, matchedName = string.find(token, requiredItemNameRegex)
		if (not TamrielTradeCentre:IsStringNilOrEmpty(matchedName)) then
			requiredItemName = matchedName
			break
		end
	end

	masterWritInfo.RequiredItemID = TamrielTradeCentre_ItemInfo:NameSpecializedItemTypeToItemID(requiredItemName)
	if (masterWritInfo.RequiredItemID == nil) then
		return nil
	end
	
	if (requiredQualityID >= 0) then
		masterWritInfo.RequiredQualityID = requiredQualityID
	end

	return masterWritInfo
end

function BitAnd(a, b)
	local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
      if a % 2 == 1 and b % 2 == 1 then
          result = result + bitval
      end
      bitval = bitval * 2
      a = math.floor(a/2)
      b = math.floor(b/2)
    end
    return result
end

function BitRightShift(number, by)
	return math.floor(number / 2 ^ by)
end

function TamrielTradeCentre_ItemInfo:New(itemLink)
	if (not TamrielTradeCentre:IsItemLink(itemLink)) then
		TamrielTradeCentre:DebugWriteLine("price table nil or not an item link")
		return nil
	end

	local itemName = GetItemLinkName(itemLink)
	local itemQuality = GetItemLinkQuality(itemLink)
	local requiredLevel = GetItemLinkRequiredLevel(itemLink)
	local requiredChampionPoint = GetItemLinkRequiredChampionPoints(itemLink)
	local traitType, _ = GetItemLinkTraitInfo(itemLink)
	local itemType, specializedItemType = GetItemLinkItemType(itemLink)
	local armorType = GetItemLinkArmorType(itemLink)
	local itemLinkParams = {ZO_LinkHandler_ParseLink(itemLink)}
	local lastParam = itemLinkParams[24]

	local itemInfo = {}
	itemInfo.ItemLink = itemLink
	itemInfo.Name = zo_strformat(SI_TOOLTIP_ITEM_NAME, itemName)
	itemInfo.QualityID = itemQuality - 1
	itemInfo.ID = self:NameSpecializedItemTypeToItemID(itemInfo.Name, specializedItemType)
	if (itemInfo.QualityID < 0) then
		itemInfo.QualityID = 0
	end

	itemInfo.Level = requiredLevel
	if (requiredChampionPoint > 0) then
		itemInfo.Level = 50 + requiredChampionPoint
	end

	itemInfo.TraitID = self:TraitTypeToTraitID(traitType)
	itemInfo.ItemType = itemType
	itemInfo.Category2IDOverWrite = self:ArmorTypeToCategory2OverWrite(armorType)
	
	if (itemType == ITEMTYPE_POTION or itemType == ITEMTYPE_POISON) then
		local isPoison = itemType == ITEMTYPE_POISON
		if (lastParam ~= 0) then
			itemInfo.PotionEffects = {}

			for i = 0, 2 do
				local potionEffectCode = BitAnd(BitRightShift(lastParam, i * 8), 0xFF)
				local potionEffectID = self:PotionEffectCodeToID(isPoison, potionEffectCode)
				if (potionEffectID ~= nil) then
					table.insert(itemInfo.PotionEffects, potionEffectID)
				end
			end

			table.sort(itemInfo.PotionEffects)
		end
	elseif (itemType == ITEMTYPE_MASTER_WRIT) then
		itemInfo.MasterWritInfo = TamrielTradeCentre_MasterWritInfo:New(itemLink)
		if (itemInfo.MasterWritInfo == nil) then
			itemInfo.ID = nil
		end
	end

	return itemInfo
end

TamrielTradeCentre_AutoRecordEntry = {}
function TamrielTradeCentre_AutoRecordEntry:New(itemLink, amount, totalPrice, expireTime, uid)
	local entry = TamrielTradeCentre_ItemInfo:New(itemLink)
	if (entry == nil) then
		return nil
	end

	entry.DiscoverTime = GetTimeStamp()
	entry.Amount = amount
	entry.TotalPrice = totalPrice
	entry.ExpireTime = expireTime - expireTime % 10
	entry.UID = Id64ToString(uid)

	return entry
end