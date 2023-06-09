-----------------------------------------------------------------------------------
-- Addon Name: Dolgubon's Lazy Writ Crafter
-- Creator: Dolgubon (Joseph Heinzle)
-- Addon Ideal: Simplifies Crafting Writs as much as possible
-- Addon Creation Date: March 14, 2016
--
-- File Name: Languages/zh.lua
-- File Description: SChinese Localization
-- Load Order Requirements: None
-- 
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
--
-- TRANSLATION NOTES - PLEASE READ
--
-- If you are not looking to translate the addon you can ignore this. :D
--
-- If you ARE looking to translate this to something else then anything with a comment of Vital beside it is 
-- REQUIRED for the addon to function properly. These strings MUST BE TRANSLATED EXACTLY!
-- If only going for functionality, ctrl+f for Vital. Otherwise, you should just translate everything. Note that some strings 
-- Note that if you are going for a full translation, you must also translate defualt.lua and paste it into your localization file.
--
-- For languages that do not use the Latin Alphabet, there is also an optional langParser() function. IF the language you are translating
-- requires some changes to the WritCreater.parser() function then write the optional langParser() function here, and the addon
-- will use that instead. Just below is a commented out langParser for English. Be sure to remove the comments if rewriting it. [[  ]]
--
-- If you run into problems, please feel free to contact me on ESOUI.
--
-----------------------------------------------------------------------------------
--

function WritCreater.langParser(str)  -- Optional overwrite function for language translations
	local seperater  = ":"
	str = string.gsub(str,"的",":")
	str = string.gsub(str,"之",":")

	local params = {}
	local i = 1
	local searchResult1, searchResult2  = string.find(str,seperater)
	if searchResult1 == 1 then
		str = string.sub(str, searchResult2+1)
		searchResult1, searchResult2  = string.find(str,seperater)
	end

	while searchResult1 do
		params[i] = string.sub(str, 1, searchResult1-1)
		str = string.sub(str, searchResult2+1)
	    searchResult1, searchResult2  = string.find(str,seperater)
	    i=i+1
	end 
	params[i] = str
	return params

end


WritCreater = WritCreater or {}

local function proper(str)
	if type(str)== "string" then
		return zo_strformat("<<C:1>>",str)
	else
		return str
	end
end

function WritCreater.langWritNames() -- Vital 
	local names = {
	["G"] = "委托",
	[CRAFTING_TYPE_ENCHANTING] = "附魔师",
	[CRAFTING_TYPE_BLACKSMITHING] = "铁匠",
	[CRAFTING_TYPE_CLOTHIER] = "制衣匠",
	[CRAFTING_TYPE_PROVISIONING] = "烹饪师",
	[CRAFTING_TYPE_WOODWORKING] = "木匠",
	[CRAFTING_TYPE_ALCHEMY] = "炼金术士",
	[CRAFTING_TYPE_JEWELRYCRAFTING] = "珠宝制作",
	}
	return names
end

function WritCreater.langCraftKernels()
	return 
	{
		[CRAFTING_TYPE_ENCHANTING] = "附魔",
		[CRAFTING_TYPE_BLACKSMITHING] = "铁匠",
		[CRAFTING_TYPE_CLOTHIER] = "制衣",
		[CRAFTING_TYPE_PROVISIONING] = "烹饪师",
		[CRAFTING_TYPE_WOODWORKING] = "木匠",
		[CRAFTING_TYPE_ALCHEMY] = "炼金",
		[CRAFTING_TYPE_JEWELRYCRAFTING] = "珠宝",
	}
end

function WritCreater.langMasterWritNames() -- Vital
	local names = {
		["M"] 							= "大师",	--when complete master writ quest
		["M1"]							= "大师",
		[CRAFTING_TYPE_ALCHEMY]			= "药剂",
		[CRAFTING_TYPE_ENCHANTING]		= "雕文",
		[CRAFTING_TYPE_PROVISIONING]	= "食物",
		["plate"]						= "防具",
		["tailoring"]					= "衣服",
		["leatherwear"]					= "皮革",
		["weapon"]						= "武器",
		["shield"]						= "盾牌",
	}
return names

end

function WritCreater.writCompleteStrings() -- Vital for translation 需要與遊戲中文本完全對應
	local strings = {
		["place"] 				= "将货物放进箱子",
		["sign"] 					= "签订清单",
		["masterPlace"] 	= "我已经完成了 ",
		["masterSign"] 		= "<完工。>",
		["masterStart"] 	= "<接受契约。>",
		["Rolis Hlaalu"] 	= "罗利斯·哈拉鲁", -- This is the same in most languages but ofc chinese and japanese
		["Deliver"] 			= "将货物送至",
	}
	return strings
end


function WritCreater.languageInfo() -- Vital

local craftInfo = 
	{
		[ CRAFTING_TYPE_CLOTHIER] = 
		{
			["pieces"] = --exact!! 
			{
				[1] = "长袍",
				[2] = "衬衣",
				[3] = "布鞋",
				[4] = "手套",
				[5] = "帽子",
				[6] = "长裤",
				[7] = "肩饰",
				[8] = "饰带",
				[9] = "上衣",
				[10]= "靴子",
				[11]= "护腕",
				[12]= "头盔",
				[13]= "护腿",
				[14]= "护肩",
				[15]= "护腰",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Homespun Robe, Linen Robe
			{
				[1] = "手编的", --lvtier one of mats
				[2] = "亚麻",	--l
				[3] = "棉布制",
				[4] = "蛛丝",
				[5] = "乌晶丝",
				[6] = "天蚕丝",
				[7] = "铁柳丝",
				[8] = "白银布",
				[9] = "虚空布制",
				[10]= "先祖之丝",
				[11]= "生皮",
				[12]= "毛皮",
				[13]= "皮革",
				[14]= "全革",
				[15]= "兽皮",
				[16]= "锁子甲",
				[17]= "精铁革",
				[18]= "上等的",
				[19]= "暗影皮制",
				[20]= "湮红皮制",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "黄麻", --lvtier one of mats
				[2] = "亜麻",	--l
				[3] = "棉",
				[4] = "蛛丝",
				[5] = "乌丝",
				[6] = "克雷什织物",
				[7] = "紫苑草织物",
				[8] = "银叶花织物",
				[9] = "虚无布",
				[10]= "先祖丝绸草",
				[11]= "生皮",
				[12]= "皮",
				[13]= "革",
				[14]= "厚皮革",
				[15]= "脱落的兽皮",
				[16]= "顶级粒面兽皮",
				[17]= "铁制兽皮",
				[18]= "上等兽皮",
				[19]= "暗影兽皮",
				[20]= "赤晶皮革",
			}
		},
		[CRAFTING_TYPE_BLACKSMITHING] = 
		{
			["pieces"] = --exact!!
			{
				[1] = "斧头",
				[2] = "槌",
				[3] = "剑",
				[4] = "战斗",
				[5] ="重槌",
				[6] ="巨剑",
				[7] = "匕首",
				[8] = "胸铠",
				[9] = "足铠",
				[10] = "手铠",
				[11] = "重盔",
				[12] = "腿铠",
				[13] = "肩铠",
				[14] = "腰带",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Iron Axe, Steel Axe
			{
				[1] = "铁",
				[2] = "钢",
				[3] = "黄铜",
				[4] = "锻莫",
				[5] = "乌木",
				[6] = "月长石铜",
				[7] = "水银钢",
				[8] = "水银",
				[9] = "虚无之钢",
				[10]= "赤晶",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it
			{
				[1] = "铁锭",
				[2] = "钢锭",
				[3] = "黄铜锭",
				[4] = "锻莫锭",
				[5] = "乌木锭",
				[6] = "月长石铜锭",
				[7] = "水银钢锭",
				[8] = "水银锭",
				[9] = "虚无之钢锭",
				[10]= "赤晶锭",
			}
		},
		[CRAFTING_TYPE_WOODWORKING] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "弓",
				[3] = "炼狱",
				[4] = "冰霜",
				[5] = "闪电",
				[6] = "恢复",
				[2] = "盾牌",
			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "枫木",
				[2] = "橡木",
				[3] = "榉木",
				[4] = "山核桃木",
				[5] = "紫杉木",
				[6] = "桦木",
				[7] = "梣木",
				[8] = "红木",
				[9] = "夜木",
				[10] = "赤晶梣木",
			},
			["names"] = --Does not strictly need to be exact, but people would probably appreciate it --done
			{
				[1] = "打磨过的枫木",
				[2] = "打磨过的橡木",
				[3] = "打磨过的榉木",
				[4] = "打磨过的山核桃木",
				[5] = "打磨过的紫杉木",
				[6] = "打磨过的桦木",
				[7] = "打磨过的梣木",
				[8] = "打磨过的红木",
				[9] = "打磨过的夜木",
				[10]= "打磨过的赤晶梣木",
			}
		},
		[CRAFTING_TYPE_JEWELRYCRAFTING] = 
		{
			["pieces"] = --Exact!!!
			{
				[1] = "戒指",
				[2] = "项链",

			},
			["match"] = --exact!!! This is not the material, but rather the prefix the material gives to equipment. e.g. Maple Bow. Oak Bow.
			{
				[1] = "锡", -- 1
				[2] = "铜", -- 26
				[3] = "银", -- CP10
				[4] = "银金", --CP80
				[5] = "铂金", -- CP150
			},

		},
		[CRAFTING_TYPE_ENCHANTING] = 
		{
			["pieces"] = --exact!!
			{ --{String Identifier, ItemId, positive or negative}
				{"疾病抗性", 45841,2},
				{"肮脏", 45841,1},
				{"吸收耐力", 45833,2},
				{"吸取魔法", 45832,2},
				{"吸收生命", 45831,2},
				{"寒霜抗性",45839,2},
				{"寒霜",45839,1},
				{"特性", 45836,2},
				{"耐力回复", 45836,1},
				{"硬化", 45842,1},
				{"粉碎", 45842,2},
				{"棱镜猛攻", 68342,2},
				{"棱镜防御", 68342,1},
				{"护盾",45849,2},
				{"猛击",45849,1},
				{"毒药抗性",45837,2},
				{"毒素",45837,1},
				{"减少法术损害",45848,2},
				{"提高魔法损害",45848,1},
				{"魔力回复", 45835,1},
				{"法术消耗", 45835,2},
				{"电击抗性",45840,2},
				{"电击",45840,1},
				{"生命回复",45834,1},
				{"削减生命",45834,2},
				{"削弱",45843,2},
				{"武器伤害",45843,1},
				{"药水提升",45846,1},
				{"药水速度",45846,2},
				{"抵抗火焰",45838,2},
				{"火焰",45838,1},
				{"减少物理损害", 45847,2},
				{"提高物理损害", 45847,1},
				{"耐力",45833,1},
				{"生命",45831,1},
				{"魔力",45832,1}
			},
			["match"] = --exact!!! The names of glyphs. The prefix (in English) So trifling glyph of magicka, for example
			{
				[1] = {"微不足道", 45855},
				[2] = {"次级",45856},
				[3] = {"微小",45857},
				[4] = {"轻微",45806},
				[5] = {"次要",45807},
				[6] = {"低级",45808},
				[7] = {"中度",45809},
				[8] = {"普通",45810},
				[9] = {"强大",45811},
				[10]= {"主要",45812},
				[11]= {"高级",45813},
				[12]= {"宏大",45814},
				[13]= {"辉煌",45815},
				[14]= {"纪念性",45816},
				[15]= {"真正超凡",{68341,68340,},},
				[16]= {"超级",{64509,64508,},},
				
			},
			["quality"] = 
			{
				{"基础",45850},
				{"优良",45851},
				{"上乘",45852},
				{"神器",45853},
				{"传说",45854},
				{"", 45850} -- default, if nothing is mentioned. Default should be Ta.
			}
		},
	} 

	return craftInfo

end

function WritCreater.masterWritQuality() -- Vital . This is probably not necessary, but it stays for now because it works --done
	return {{"史诗",4},{"传说",5}}
end




function WritCreater.langEssenceNames() -- Vital

local essenceNames =  
	{
		[1] = "奥科", --health
		[2] = "德尼", --stamina
		[3] = "马可", --magicka
	}
	return essenceNames
end

function WritCreater.langPotencyNames() -- Vital
	--exact!! Also, these are all the positive runestones - no negatives needed.
	local potencyNames = 
	{
		[1] = "乔拉", --Lowest potency stone lvl
		[2] = "伯拉德",
		[3] = "杰拉", -- Jera
		[4] = "杰乔拉",
		[5] = "欧达",
		[6] = "伯乔拉",
		[7] = "艾多拉",
		[8] = "杰拉", -- Jaera
		[9] = "伯拉",
		[10]= "德纳拉",
		[11]= "雷拉",
		[12]= "德拉多",
		[13]= "雷库拉",
		[14]= "库拉",
		[15]= "勒杰拉",
		[16]= "雷波拉", --v16 potency stone
		
	}
	return potencyNames
end

local enExceptions = -- This is a slight misnomer. Not all are corrections - some are changes into english so that future functions will work
{
	["original"] =
	{
		[1] = "获得",
		[2] = "送至",

	},
	["corrected"] = 
	{	
		[1] = "acquire",
		[2] = "deliver",

	},
}

function WritCreater.questExceptions(condition)
	condition = string.gsub(condition, "?"," ")
	return condition
end

-- 修復附魔會無限製作的問題。因為 crafter.lua 中判斷任務文本的字是寫死英文的，所以需要用這個來取代文本。
function WritCreater.enchantExceptions(condition)
	condition = string.gsub(condition, "?"," ")
	for i = 1, #enExceptions["original"] do
		condition = string.gsub(condition,enExceptions["original"][i],enExceptions["corrected"][i])
	end
	return condition
end

function WritCreater.langTutorial(i) 
	local t = {
		[5]="/dailyreset 可以告诉你离每日任务重置还有多久。",
		[4]="你能选择每个不同制作专业 启动/停用 这个插件。\n默认情况下都是启动的。",
		[3]="接下来，你需要选择是否希望在使用制作站时看到这个介面。\n这个介面会告诉你这个造物需要多少素材，以及你目前有多少库存。",
		[2]="第一个要设定的设置是你是否想启动自动制作。\n如果启动，当你进入任意一个制作站时，插件将开始自动制作。",
		[1]="欢迎来到 Dolgubon's Lazy Writ Crafter！有一些设置你应该先设定。\n你可以在任何时候在设置选单中改变设置。",
	}
	return t[i]
end

function WritCreater.langTutorialButton(i,onOrOff) -- sentimental and short please. These must fit on a small button
	local tOn = 
	{
		[1]="默認",
		[2]="啟動",
		[3]="顯示",
		[4]="繼續",
		[5]="完成",
	}
	local tOff=
	{
		[1]="繼續",
		[2]="關閉",
		[3]="不顯示",
	}
	if onOrOff then
		return tOn[i]
	else
		return tOff[i]
	end
end

function WritCreater.langStationNames()
	return
	{["锻造台"] = 1, ["制衣台"] = 2, 
	 ["附魔台"] = 3,["炼金台"] = 4, ["烹饪火焰"] = 5, ["木工台"] = 6, ["珠宝制作台"] = 7, }
end

-- What is this??! This is just a fun 'easter egg' that is never activated on easter.
-- Replaces mat names with a random DivineMats on Halloween, New Year's, and April Fools day. You don't need this many! :D
-- Translate it or don't, completely up to you. But if you don't translate it, replace the body of 
-- shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit()
-- with just a return false. (This will prevent it from ever activating. Also, if you're a user and don't like this,
-- you're boring, and also that's how you can disable it. )
-- local DivineMats =
-- {
-- 	{"Rusted Nails", "Ghost Robes", "","","", "Rotten Logs","Cursed Gold", "Chopped Liver", "Crumbled Gravestones", "Toad Eyes", "Werewolf Claws", "Zombie Guts", "Lizard Brains"},
-- 	{"Buzzers","Sock Puppets", "Jester Hats","Otter Noses", "Red Herrings", "Wooden Snakes", "Gold Teeth", "Mudpies"},
-- 	{"Coal", "Stockings", "","","","Evergreen Branches", "Golden Rings", "Bottled Time", "Reindeer Bells", "Elven Hats", "Pine Needles", "Cups of Snow"},
-- }

-- confetti?
-- random sounds?
-- 

-- local function shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit()
-- 	if GetDate()%10000 == 1031 then return 1 end
-- 	if GetDate()%10000 == 401 then return 2 end
-- 	if GetDate()%10000 == 1231 then return 3 end
-- 	if GetDisplayName() == "@Dolgubon" or GetDisplayName() == "@Gitaelia" or GetDisplayName() == "@mithra62" or GetDisplayName() == "@PacoHasPants" then
-- 		return 2
-- 	end
-- 	return false
-- end
-- WritCreater.shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit = shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit


-- local function wellWeShouldUseADivineMatButWeHaveNoClueWhichOneItIsSoWeNeedToAskTheGodsWhichDivineMatShouldBeUsed() local a= math.random(1, #DivineMats ) return DivineMats[a] end
-- local l = shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit()

-- if l then
-- 	DivineMats = DivineMats[l]
-- 	local DivineMat = wellWeShouldUseADivineMatButWeHaveNoClueWhichOneItIsSoWeNeedToAskTheGodsWhichDivineMatShouldBeUsed()
	
-- 	WritCreater.strings.smithingReqM = function (amount, _,more)
-- 		local craft = GetCraftingInteractionType()
-- 		DivineMat = DivineMats[craft]
-- 		return zo_strformat( "Crafting will use <<1>> <<4>> (|cf60000You need <<3>>|r)" ,amount, type, more, DivineMat) end
-- 	WritCreater.strings.smithingReqM2 = function (amount, _,more)
-- 		local craft = GetCraftingInteractionType()
-- 		DivineMat = DivineMats[craft]
-- 		return zo_strformat( "As well as <<1>> <<4>> (|cf60000You need <<3>>|r)" ,amount, type, more, DivineMat) end
-- 	WritCreater.strings.smithingReq = function (amount, _,more) 
-- 		local craft = GetCraftingInteractionType()
-- 		DivineMat = DivineMats[craft]
-- 		return zo_strformat( "Crafting will use <<1>> <<4>> (|c2dff00<<3>> available|r)" ,amount, type, more, DivineMat) end
-- 	WritCreater.strings.smithingReq2 = function (amount, _,more) 
-- 		local craft = GetCraftingInteractionType()
-- 		DivineMat = DivineMats[craft]
-- 		return zo_strformat( "As well as <<1>> <<4>> (|c2dff00<<3>> available|r)" ,amount, type, more, DivineMat) end
-- end


-- -- [[ /script local writcreater = {} local c = {a = 1} local g = {__index = c} setmetatable(writ, g) d(a.a) local e = {__index = {Z = 2}} setmetatable(c, e) d(a.Z)
-- local h = {__index = {}}
-- local t = {}
-- local g = {["__index"] = t}
-- setmetatable(t, h)
-- setmetatable(WritCreater, g) --]]

-- local function enableAlternateUniverse(override)

-- 	if shouldDivinityprotocolbeactivatednowornotitshouldbeallthetimebutwhateveritlljustbeforabit() == 2 or override then
-- 	--if true then
-- 		local stations = 
-- 			{"锻造台", "制衣台", "附魔台",
-- 			"炼金台",  "烹饪火焰", "木工台","珠宝制作台",  "Outfit Station", "蜕变台", "路点神龛"}
-- 			local stationNames =  -- in the comments are other names that were also considered, though not all were considered seriously
-- 			{"Wightsmithing Station", -- Popcorn Machine , Skyforge, Heavy Metal Station, Metal Clockwork Solid, Wightsmithing Station., Coyote Stopper
-- 			 "Sock Puppet Theatre", -- Sock Distribution Center, Soul-Shriven Sock Station, Grandma's Sock Knitting Station, Knits and Pieces, Sock Knitting Station
-- 			"Top Hats Inc.", -- Mahjong Station, Magic Store, Card Finder, Five Aces, Top Hat Store
-- 			"Seedy Skooma Bar", -- Chemical Laboratory , Drugstore, White's Garage, Cocktail Bar, Med-Tek Pharmaceutical Company, Med-Tek Laboratories, Skooma Central, Skooma Backdoor Dealers, Sheogorath's Pharmacy
-- 			 "McDaedra Order Kiosk",--"Khajit Fried Chicken", -- Khajit Fried Chicken, soup Kitchen, Some kind of bar, misspelling?, Roast Bosmer
-- 			 "IKEA Assembly Station", -- Chainsaw Massace, Saw Station, Shield Corp, IKEA Assembly Station, Wood Splinter Removal Station
-- 			 "April Fool's Gold",--"Diamond Scam Store", -- Lucy in the Sky, Wedding Planning Hub, Shiny Maker, Oooh Shiny, Shiny Bling Maker, Cubit Zirconia, Rhinestone Palace
-- 			 -- April Fool's Gold
-- 			 "Khajit Fur Trade Outpost", -- Jester Dressing Room Loincloth Shop, Khajit Walk, Khajit Fashion Show, Mummy Maker, Thalmor Spy Agency, Tamriel Catwalk, 
-- 			 --	Tamriel Khajitwalk, second hand warehouse,. Dye for Me, Catfur Jackets, Outfit station "Khajiit Furriers", Khajit Fur Trading Outpost
-- 			 "Sacrificial Goat Altar",-- Heisenberg's Station Correction Facility, Time Machine, Probability Redistributor, Slot Machine Rigger, RNG Countermeasure, Lootcifer Shrine, Whack-a-mole
-- 			 -- Anti Salt Machine, Department of Corrections, Quantum State Rigger , Unnerf Station
-- 			 "TARDIS" } -- Transporter, Molecular Discombobulator, Beamer, Warp Tunnel, Portal, Stargate, Cannon!, Warp Gate
			
-- 			local crafts = {"锻造", "制衣", "附魔","炼金术","烹饪","木工","珠宝制作" }
-- 			local craftNames = {
-- 				"Wightsmithing",
-- 				"Sock Knitting",
-- 				"Top Hat Tricks",
-- 				"Skooma Brewing",
-- 				"McDaedra",--"Chicken Frying",
-- 				"IKEA Assembly",
-- 				"Fool's Gold Creation",
-- 			}
-- 			local quest = {"铁匠", "制衣匠", "附魔师" ,"炼金术士", "厨师", "木匠", "珠宝制作","厨师委托"}
-- 			local questNames = 	
-- 			{
-- 				"Wightsmith",
-- 				"Sock Knitter",
-- 				"Top Hat Trickster",
-- 				"Skooma Brewer",
-- 				"McDaedra",--"Chicken Fryer",
-- 				"IKEA Assembly",
-- 				"Fool's Gold",
-- 				"McDaedra Delivery",
-- 			}
-- 			local items = {"铁匠", "制衣匠", "附魔师", "炼金", "food and drink",  "木匠", "珠宝"}
-- 			local itemNames = {
-- 				"Wight",
-- 				"Sock Puppet",
-- 				"Top Hat",
-- 				"Skooma",
-- 				"McDaedra Nuggets",--"Fried Chicken",
-- 				"IKEA",
-- 				"Fool's Gold",
-- 			}
-- 			local coffers = {"铁匠", "制衣匠", "附魔师" ,"炼金术士", "Provisioner's Pack", "木匠", "Jewelry Crafter's",}
-- 			local cofferNames = {
-- 				"Wightsmith",
-- 				"Sock Knitter",
-- 				"Top Hat Trickster",
-- 				"Skooma Brewer",
-- 				"McDaedra Takeout",--"Chicken Fryer",
-- 				"IKEA Assembly",
-- 				"Fool's Gold",
-- 			}
-- 			local ones = {"珠宝工匠"}
-- 			local oneNames = {"Fool's Gold"}
		

-- 		local t = {["__index"] = {}}
-- 		function h.__index.alternateUniverse()
-- 			return stations, stationNames
-- 		end
-- 		function h.__index.alternateUniverseCrafts()
-- 			return crafts, craftNames
-- 		end
-- 		function h.__index.alternateUniverseQuests()
-- 			return quest, questNames
-- 		end
-- 		function h.__index.alternateUniverseItems()
-- 			return items, itemNames
-- 		end
-- 		function h.__index.alternateUniverseCoffers()
-- 			return coffers, cofferNames
-- 		end
-- 		function h.__index.alternateUniverseOnes()
-- 			return ones, oneNames
-- 		end
		

-- 		h.__metatable = "No looky!"
-- 		local a = WritCreater.langStationNames()
-- 		a[1] = 1
-- 		for i = 1, 7 do
-- 			a[stationNames[i]] = i
-- 		end
-- 		WritCreater.langStationNames = function() 
-- 			return a
-- 		end
-- 		local b =WritCreater.langWritNames()
-- 		for i = 1, 7 do
-- 			b[i] = questNames[i]
-- 		end
-- 		-- WritCreater.langWritNames = function() return b end

-- 	end
-- end

-- For Transmutation: "Well Fitted Forever"
-- So far, I like blacksmithing, clothing, woodworking, and wayshrine, enchanting
-- that leaves , alchemy, cooking, jewelry, outfits, and transmutation

-- local lastYearStations = 
-- {"Blacksmithing Station", "Clothing Station", "Woodworking Station", "Cooking Fire", 
-- "Enchanting Table", "Alchemy Station", "Outfit Station", "Transmute Station", "Wayshrine"}
-- local stationNames =  -- in the comments are other names that were also considered, though not all were considered seriously
-- {"Heavy Metal 112.3 FM", -- Popcorn Machine , Skyforge, Heavy Metal Station
--  "Sock Knitting Station", -- Sock Distribution Center, Soul-Shriven Sock Station, Grandma's Sock Knitting Station, Knits and Pieces
--  "Splinter Removal Station", -- Chainsaw Massace, Saw Station, Shield Corp, IKEA Assembly Station, Wood Splinter Removal Station
--  "McSheo's Food Co.", 
--  "Tetris Station", -- Mahjong Station
--  "Poison Control Centre", -- Chemical Laboratory , Drugstore, White's Garage, Cocktail Bar, Med-Tek Pharmaceutical Company, Med-Tek Laboratories
--  "Thalmor Spy Agency", -- Jester Dressing Room Loincloth Shop, Khajit Walk, Khajit Fashion Show, Mummy Maker, Thalmor Spy Agency, Morag Tong Information Hub, Tamriel Spy HQ, 
--  "Department of Corrections",-- Heisenberg's Station Correction Facility, Time Machine, Probability Redistributor, Slot Machine Rigger, RNG Countermeasure, Lootcifer Shrine, Whack-a-mole
--  -- Anti Salt Machine, Department of Corrections
--  "Warp Gate" } -- Transporter, Molecular Discombobulator, Beamer, Warp Tunnel, Portal, Stargate, Cannon!, Warp Gate

-- -- enableAlternateUniverse(GetDisplayName()=="@Dolgubon")
-- enableAlternateUniverse()

-- local function alternateListener(eventCode,  channelType, fromName, text, isCustomerService, fromDisplayName)
-- 	if not WritCreater.alternateUniverse and fromDisplayName == "@Dolgubon"and (text == "Let the Isles bleed into Nirn!" ) then	
-- 		enableAlternateUniverse(true)
-- 		WritCreater.WipeThatFrownOffYourFace(true)	
-- 	end	
-- 	-- if GetDisplayName() == "@Dolgubon" then
-- 	-- 	enableAlternateUniverse(true)	
-- 	-- 	WritCreater.WipeThatFrownOffYourFace(true)	
-- 	-- end
-- end	
-- 20764
-- 21465

-- EVENT_MANAGER:RegisterForEvent(WritCreater.name,EVENT_CHAT_MESSAGE_CHANNEL, alternateListener)

--Hide craft window when done
--"Verstecke Fenster anschließend",
-- [tooltip ] = "Verstecke das Writ Crafter Fenster an der Handwerksstation automatisch, nachdem die Gegenstände hergestellt wurden"

function WritCreater.langWritRewardBoxes () return {
	[CRAFTING_TYPE_ALCHEMY] = "炼金", -- 炼金术士货物箱
	[CRAFTING_TYPE_ENCHANTING] = "附魔", -- 附魔师货物箱
	[CRAFTING_TYPE_PROVISIONING] = "烹饪师", -- 厨师货物箱
	[CRAFTING_TYPE_BLACKSMITHING] = "铁匠", -- 铁匠货物箱
	[CRAFTING_TYPE_CLOTHIER] = "制衣", -- 制衣匠货物箱
	[CRAFTING_TYPE_WOODWORKING] = "木匠", -- 木匠货物箱
	[CRAFTING_TYPE_JEWELRYCRAFTING] = "珠宝", -- 珠宝工艺交付箱
	[8] = "箱",
}
end


function WritCreater.getTaString()
	return "塔"
end

-- WritCreater.optionStrings["alternate universe"] = "Turn off April"
-- WritCreater.optionStrings["alternate universe tooltip"] = "Turn off the renaming of crafts, crafting stations, and other interactables"

WritCreater.lang = "zh"
WritCreater.langIsMasterWritSupported = true

--[[
SLASH_COMMANDS['/opencontainers'] = function()local a=WritCreater.langWritRewardBoxes() for i=1,200 do for j=1,6 do if a[j]==GetItemName(1,i) then if IsProtectedFunction("endUseItem") then
	CallSecureProtected("endUseItem",1,i)
else
	UseItem(1,i)
end end end end end]]

-- default.lua 部分中文化。接下來內容都源自於 default.lua。
local function runeMissingFunction (ta,essence,potency)
	local missing = {}
	if not ta["bag"] then
		missing[#missing + 1] = "|r塔|cf60000"
	end
	if not essence["bag"] then
		missing[#missing + 1] =  "|cffcc66"..essence["slot"].."|cf60000"
	end
	if not potency["bag"] then
		missing[#missing + 1] = "|c0066ff"..potency["slot"].."|r"
	end
	local text = ""
	for i = 1, #missing do
		if i ==1 then
			text = "|cff3333无法制作雕文。你缺少 "..proper(missing[i])
		else
			text = text.." 或 "..proper(missing[i])
		end
	end
	return text
end

local dailyResetFunction = function (till, stamp) -- You can translate the following simple version instead.
	-- function (till) d(zo_strformat("<<1>> hours and <<2>> minutes until the daily reset.",till["hour"],till["minute"])) end,
	if till["hour"]==0 then
		if till["minute"]==1 then
			return "距離每日重置剩下 1 分鐘！"
		elseif till["minute"]==0 then
		if stamp==1 then
			return "距離每日重置剩下 "..stamp.." 秒!"
		else
			return "認真？ 別再傳指令了！ 你就等不急嗎？？？ 在一秒就重置了！ *抱怨聲*"
		end
		else
			return till["minute"].." 分鐘 後重置每日!"
		end
		elseif till["hour"]==1 then
		if till["minute"]==1 then
			return till["hour"].." 小時 "..till["minute"].." 分鐘 後重置每日"
			else
			return till["hour"].." 小時 "..till["minute"].." 分鐘 後重置每日"
		end
		else
		if till["minute"]==1 then
			return till["hour"].." 小時 "..till["minute"].." 分鐘 後重置每日"
			else
			return till["hour"].." 小時 "..till["minute"].." 分鐘 後重置每日"
		end
	end 
end

WritCreater.strings["runeReq"] 					= function (essence, potency) return zo_strformat("|c2dff00制作需求 1 |r塔|c2dff00, 1 |cffcc66<<1>>|c2dff00 和 1 |c0066ff<<2>>|r", essence, potency) end
WritCreater.strings["runeMissing"] 				= runeMissingFunction 
WritCreater.strings["notEnoughSkill"]				= "你没有足够高的制作技能来制造所需的装备。"
WritCreater.strings["smithingMissing"] 			= "\n|cf60000你没有足够的资源|r"
WritCreater.strings["craftAnyway"] 				= "仍然制造"
WritCreater.strings["smithingEnough"] 				= "\n|c2dff00你拥有足够的材料|r"
WritCreater.strings["craft"] 						= "|c00ff00制造|r"
WritCreater.strings["crafting"] 					= "|c00ff00制造中...|r"
WritCreater.strings["craftIncomplete"] 			= "|cf60000制造无法完成。\n你需要更多的材料。|r"
WritCreater.strings["moreStyle"] 					= "|cf60000您没有足够的样式材料。\n检查您的物品栏，成就和设置|r"
WritCreater.strings["moreStyleSettings"]			= "|cf60000您没有足够的样式材料。\n你可能需要在设置选单中允许使用更多种样式材料。|r"
WritCreater.strings["moreStyleKnowledge"]			= "|cf60000您没有足够的样式材料。\n你需要学习更多的样式|r"
WritCreater.strings["dailyreset"] = dailyResetFunction
WritCreater.strings["complete"] 					= "|c00FF00制造任务完成。|r"
WritCreater.strings["craftingstopped"]				= "停止制造。 请检查插件是否制造了正确的装备。"
WritCreater.strings["smithingReqM"] 				= function (amount, type, more) return zo_strformat( "制作需要使用 <<1>> <<2>> (|cf60000你需要 <<3>>|r)" ,amount, type, more) end
WritCreater.strings["smithingReq"] 				= function (amount,type, current) return zo_strformat( "制作需要使用 <<1>> <<2>> (|c2dff00<<3>> 可用|r)"  ,amount, type, current) end
WritCreater.strings["lootReceived"]				= "<<3>> <<1>> 已收到 (Y你有 <<2>>)"
WritCreater.strings["lootReceivedM"]				= "<<1>> 已收到 "
WritCreater.strings["countSurveys"]				= "你有 <<1>> 张调查报告"
WritCreater.strings["countVouchers"]				= "你有 <<1>> 张可获得的委托券"
WritCreater.strings["includesStorage"]				= function(type) local a= {"Surveys", "Master Writs"} a = a[type] return zo_strformat("统计包括 <<1>> 房子储藏", a) end
WritCreater.strings["surveys"]						= "制作调查报告地图"
WritCreater.strings["sealedWrits"]					= "封存的大师委托书"
WritCreater.strings["masterWritEnchantToCraft"]	= function(lvl, type, quality, writCraft, writName, generalName) 
										return zo_strformat("<<t:4>> <<t:5>> <<t:6>>: 制作一个 <<t:1>> 雕文 of <<t:2>> at <<t:3>> 品质",lvl, type, quality,
											writCraft,writName, generalName) end
WritCreater.strings["masterWritSmithToCraft"]		= masterWritEnchantToCraft
WritCreater.strings["withdrawItem"]				= function(amount, link, remaining) return "Dolgubon's Lazy Writ Crafter 检索到了 "..amount.." "..link..". ("..remaining.." 在银行)" end -- in Bank for German
WritCreater.strings['fullBag']						= "你沒有足夠的背包空間。空出一些格子來。"
WritCreater.strings['masterWritSave']				= "Dolgubon's Lazy Writ Crafter 使你免于意外地接受一个委托书！你可以通过设置选单禁用这个选项！到设置选单中去禁用这个选项。"
WritCreater.strings['missingLibraries']			= "Dolgubon's Lazy Writ Crafter 需要以下独立的库。请下载、安装或启动这些库： "
WritCreater.strings['resetWarningMessageText']		= "距离每日任务重置还有 <<1>> 小时 <<2>> 分钟\n你可以在设置中自定义或关闭该提示"
WritCreater.strings['resetWarningExampleText']		= "该提示将看起来像这样"


WritCreater.optionStrings = {}
WritCreater.optionStrings.nowEditing                   = "你正在改变 %s 设定"
WritCreater.optionStrings.accountWide                  = "帐号范围"
WritCreater.optionStrings.characterSpecific            = "特定角色"
WritCreater.optionStrings.useCharacterSettings         = "使用角色设置" -- de
WritCreater.optionStrings.useCharacterSettingsTooltip  = "仅在此角色上使用特定的角色设定" --de
WritCreater.optionStrings["style tooltip"]								= function (styleName, styleStone) return zo_strformat("允许使用 <<1>> 样式的 <<2>> 样式石，用于制作。",styleName, styleStone) end 
WritCreater.optionStrings["show craft window"]							= "显示制造窗口"
WritCreater.optionStrings["show craft window tooltip"]					= "当打开工作台时显示制造窗口"
WritCreater.optionStrings["autocraft"]									= "自动制造"
WritCreater.optionStrings["autocraft tooltip"]							= "选择这个功能, 当您打开工作台时会自动开始制造所需装备. 如果窗口没有显示, 将会开启."
WritCreater.optionStrings["blackmithing"]								= "锻造"
WritCreater.optionStrings["blacksmithing tooltip"]						= "为锻造启用插件"
WritCreater.optionStrings["clothing"]									= "裁缝"
WritCreater.optionStrings["clothing tooltip"]							= "为裁缝启用插件"
WritCreater.optionStrings["enchanting"]									= "附魔"
WritCreater.optionStrings["enchanting tooltip"]							= "为附魔启用插件"
WritCreater.optionStrings["alchemy"]									= "炼金"
WritCreater.optionStrings["alchemy tooltip"]							= "为炼金启用插件 (仅限银行自动取物)"
WritCreater.optionStrings["provisioning"]								= "烹饪"
WritCreater.optionStrings["provisioning tooltip"]						= "为烹饪启用插件 (仅限银行自动取物)"
WritCreater.optionStrings["woodworking"]								= "木工"
WritCreater.optionStrings["woodworking tooltip"]						= "为木工启用插件"
WritCreater.optionStrings["jewelry crafting"]							= "珠宝"
WritCreater.optionStrings["jewelry crafting tooltip"]					= "为珠宝启用插件"
WritCreater.optionStrings["writ grabbing"]								= "取出任务所需物品"
WritCreater.optionStrings["writ grabbing tooltip"]						= "从银行取出所有任务所需的物品"
WritCreater.optionStrings["style stone menu"]							= "可用样式石"
WritCreater.optionStrings["style stone menu tooltip"]					= "选择哪些样式石可以让插件使用"
WritCreater.optionStrings["send data"]									= "发送任务数据"
WritCreater.optionStrings["send data tooltip"]							= "从奖励箱获得物品时发送数据. 不会发送其他数据."
WritCreater.optionStrings["exit when done"]								= "退出制造窗口"
WritCreater.optionStrings["exit when done tooltip"]						= "任务物品制作完成后关闭制造窗口"
WritCreater.optionStrings["automatic complete"]							= "自动处理任务对话"
WritCreater.optionStrings["automatic complete tooltip"]					= "在任务地点时自动接受并完成任务"
WritCreater.optionStrings["new container"]								= "保持新状态"
WritCreater.optionStrings["new container tooltip"]						= "保持日常奖励箱的新状态"
WritCreater.optionStrings["master"]										= "大师制造任务"
WritCreater.optionStrings["master tooltip"]								= "如果开启将自动制造大师任务需要的物品"
WritCreater.optionStrings["right click to craft"]						= "右键点击制造"
WritCreater.optionStrings["right click to craft tooltip"]				= "如果启用这个选项，那在右键点击一个封存大师委托书后，插件将制作你让它制作的物品。打开 LibCustomMenu 以启用"
WritCreater.optionStrings["crafting submenu"]							= "自动制造"
WritCreater.optionStrings["crafting submenu tooltip"]					= "对某些制造关闭功能"
WritCreater.optionStrings["timesavers submenu"]							= "节省时间"
WritCreater.optionStrings["timesavers submenu tooltip"]					= "多种节省时间"
WritCreater.optionStrings["loot container"]								= "获得容器时自动开启容器"
WritCreater.optionStrings["loot container tooltip"]						= "获得日常奖励箱时自动拾取"
WritCreater.optionStrings["master writ saver"]							= "保存大师委托书"
WritCreater.optionStrings["master writ saver tooltip"]					= "防止使用大师委托书"
WritCreater.optionStrings["loot output"]								= "高价物品提醒"
WritCreater.optionStrings["loot output tooltip"]						= "当从奖励中获得高价物品时发送消息提醒"
WritCreater.optionStrings["autoloot behaviour"]							= "自动拾取行为" -- Note that the following three come early in the settings menu, but becuse they were changed
WritCreater.optionStrings["autoloot behaviour tooltip"]					= "选择何时自动拾取奖励箱" -- they are now down below (with untranslated stuff)
WritCreater.optionStrings["autoloot behaviour choices"]					= {"同游戏设置", "自动拾取", "不使用自动拾取"}
WritCreater.optionStrings["hide when done"]								= "完成后隐藏"
WritCreater.optionStrings["hide when done tooltip"]						= "当所有项目都已制作完成时，隐藏插件窗口"
WritCreater.optionStrings['reticleColour']								= "改变文字顏色"
WritCreater.optionStrings['reticleColourTooltip']						= "如果该制作站有一个未完成或已完成的任务，则改变文字颜色"
WritCreater.optionStrings['autoCloseBank']								= "自动银行对话"
WritCreater.optionStrings['autoCloseBankTooltip']						= "如果有物品需要提取，自动进入和退出银行对话"
WritCreater.optionStrings['despawnBanker']								= "解散银行家"
WritCreater.optionStrings['despawnBankerTooltip']						= "提取物品后自动解散银行家"
WritCreater.optionStrings['dailyResetWarnTime']							= "重置剩余时间提醒"
WritCreater.optionStrings['dailyResetWarnTimeTooltip']					= "在每日重置前多少分钟应显示提醒"
WritCreater.optionStrings['dailyResetWarnType']							= "每日重置提醒"
WritCreater.optionStrings['dailyResetWarnTypeTooltip']					= "当快要重置每日时，应显示什么类型的提醒"
WritCreater.optionStrings['dailyResetWarnTypeChoices']					={ "无","种类 1", "种类 2", "种类 3", "种类 4", "全部"}
WritCreater.optionStrings['stealingProtection']							= "偷窃保护"
WritCreater.optionStrings['stealingProtectionTooltip']					= "当你有制作任务时防止你偷窃"
WritCreater.optionStrings['noDELETEConfirmJewelry']						= "快速取消珠宝任务"
WritCreater.optionStrings['noDELETEConfirmJewelryTooltip']				= "在删除珠宝任务确认对话框中自动添加 DELETE 文本"
WritCreater.optionStrings['suppressQuestAnnouncements']					= "隐藏制作任务公告"
WritCreater.optionStrings['suppressQuestAnnouncementsTooltip']			= "当你开始制作任务时或制作完一件任务物品时，隐藏萤幕中央的公告文字"
WritCreater.optionStrings["questBuffer"]								= "制作任务位保留"
WritCreater.optionStrings["questBufferTooltip"]							= "保留给制作任务的任务位，这样不用担心任务上限卡到制作任务"
WritCreater.optionStrings["craftMultiplier"]							= "制作倍增器"
WritCreater.optionStrings["craftMultiplierTooltip"]						= "一次多制作几件任务物品，这样下次解制作任务时就不需要重新制作。提示：每增加 1 倍，就节省大约 37 个槽位"
WritCreater.optionStrings['hireling behaviour']							= "雇员邮件处理"
WritCreater.optionStrings['hireling behaviour tooltip']					= "如何处理雇员的邮件"
WritCreater.optionStrings['hireling behaviour choices']					= { "不动作","取得附件并删除", "只取得附件"}


WritCreater.optionStrings["allReward"]									= "所有制造专业"
WritCreater.optionStrings["allRewardTooltip"]							= "对所有制造专业采取的行动"

WritCreater.optionStrings['sameForALlCrafts']							= "对所有专业使用相同的选项"
WritCreater.optionStrings['sameForALlCraftsTooltip']					= "对所有专业指定类型奖励使用相同的选项"
WritCreater.optionStrings['1Reward']									= "锻造"
WritCreater.optionStrings['2Reward']									= "用于所有"
WritCreater.optionStrings['3Reward']									= "用于所有"
WritCreater.optionStrings['4Reward']									= "用于所有"
WritCreater.optionStrings['5Reward']									= "用于所有"
WritCreater.optionStrings['6Reward']									= "用于所有"
WritCreater.optionStrings['7Reward']									= "用于所有"

WritCreater.optionStrings["matsReward"]									= "资源奖励"
WritCreater.optionStrings["matsRewardTooltip"]							= "如何处理资源奖励"
WritCreater.optionStrings["surveyReward"]								= "调查奖励"
WritCreater.optionStrings["surveyRewardTooltip"]						= "如何处理调查奖励"
WritCreater.optionStrings["masterReward"]								= "大师委托奖励"
WritCreater.optionStrings["masterRewardTooltip"]						= "如何处理大师委托奖励"
WritCreater.optionStrings["repairReward"]								= "修理包奖励"
WritCreater.optionStrings["repairRewardTooltip"]						= "如何处理修理包奖励"
WritCreater.optionStrings["ornateReward"]								= "华丽装备奖励"
WritCreater.optionStrings["ornateRewardTooltip"]						= "如何处理华丽装备奖励"
WritCreater.optionStrings["intricateReward"]							= "精巧装备奖励"
WritCreater.optionStrings["intricateRewardTooltip"]						= "如何处理精巧装备奖励"
WritCreater.optionStrings["soulGemReward"]								= "空的灵魂石"
WritCreater.optionStrings["soulGemTooltip"]								= "如何处理空的灵魂石"
WritCreater.optionStrings["glyphReward"]								= "雕文"
WritCreater.optionStrings["glyphRewardTooltip"]							= "如何处理雕文"
WritCreater.optionStrings["recipeReward"]								= "配方"
WritCreater.optionStrings["recipeRewardTooltip"]						= "如何处理配方"
WritCreater.optionStrings["fragmentReward"]								= "赛伊克碎片"
WritCreater.optionStrings["fragmentRewardTooltip"]						= "如何处理赛伊克碎片"


WritCreater.optionStrings["writRewards submenu"]						= "任务奖励处理"
WritCreater.optionStrings["writRewards submenu tooltip"]				= "如何处理所有任务奖励"

WritCreater.optionStrings["jubilee"]									= "开启周年纪念箱"
WritCreater.optionStrings["jubilee tooltip"]							= "自动开启周年纪念箱"
WritCreater.optionStrings["skin"]										= "Writ Crafter 介面主题"
WritCreater.optionStrings["skinTooltip"]								= "Writ Crafter 的介面主题"
WritCreater.optionStrings["skinOptions"]								= {"默认", "炫泡"}

WritCreater.optionStrings["rewardChoices"]								= {"不动作","保存","标记为废品", "摧毁"}
WritCreater.optionStrings["scan for unopened"]							= "登录时打开容器"
WritCreater.optionStrings["scan for unopened tooltip"]					= "当你登录时，扫描背包中未打开的任务奖励容器并打开它们"

WritCreater.optionStrings["smart style slot save"]							= "优先使用数量最少的样式石"
WritCreater.optionStrings["smart style slot save tooltip"]					= "如果没有 ESO+，将通优先使用最少的样式石来减少格子占用"