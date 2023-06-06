local lib = {}
LibUespQuestData = lib

lib.quests = {}
--lib.questNames = uespQuestNames

local function OnLoad(_, addonName)
	if (addonName ~= "LibUespQuestData") then return end
	EVENT_MANAGER:UnregisterForEvent("LibUespQuestData", EVENT_ADD_ON_LOADED)
	--[[ old data file
	for n=1,#uespQuestData do
		for k,v in pairs(uespQuestData[n]) do
			if k=="internalId" then lib.quests[tonumber(v)]=uespQuestData[n]
			end
		end
	end
	--]]
	for n=1,#uespQuestData2 do
		for k,v in pairs(uespQuestData2[n]) do
			if k=="internalId" then lib.quests[tonumber(v)]=uespQuestData2[n]
			end
		end
	end
--	uespQuestData = {}
	uespQuestData2 = {}
--	uespQuestNames = {}
	--[[ old section
	for k, v in pairs(lib.quests) do
		-- replace zone name with ID
		n = uespZoneNameToID[v["zone"]--]
		if n then
			lib.quests[k]["zone"] = n
		end
		str = uespZoneNames[v["zone"]--]
		if n then
			lib.quests[k]["zone"] = str
		end
	end
	--]]
--	uespZoneNameToID = {}
--	uespZoneNames = {}

end


EVENT_MANAGER:RegisterForEvent("LibUespQuestData", EVENT_ADD_ON_LOADED, OnLoad)


function lib:GetUespQuestInfo(questId)
	local name
	local questType
	local zoneName
	local zoneIndex
	local poiIndex
	local objectiveName
	local objectiveLevel
	local startDesc
	local endDesc
	if lib.quests[questId] == nil then
		name = ""
		questType = 0
		zoneName = ""
		objectiveName = ""
		objectiveLevel = 0
		startDesc = ""
		endDesc = ""
	else
		name = GetQuestName(questId)
		questType = tonumber(lib.quests[questId]["type"])
		zoneName = GetZoneNameById(GetQuestZoneId(questId))
		zoneIndex = GetZoneIndex(GetQuestZoneId(questId))
		poiIndex = tonumber(lib.quests[questId]["poiIndex"])
		objectiveName, objectiveLevel, startDesc, endDesc = GetPOIInfo(zoneIndex, poiIndex)
	end
	return name, questType, zoneName, objectiveName
end

function lib:GetUespQuestName(questId)
	local name
	if lib.quests[questId] == nil then
		name = ""
	else
		name = GetQuestName(questId)
	end
	return name
end

function lib:GetUespQuestType(questId)
	local questType
	if lib.quests[questId] == nil then
		questType = 0
	else
		questType = tonumber(lib.quests[questId]["type"])
	end
	return questType
end

function lib:GetUespQuestLocationInfo(questId)
	local zoneName
	local zoneIndex
	local objectiveName
	local objectiveLevel
	local startDesc
	local endDesc
	local poiIndex
	if lib.quests[questId] == nil then
		zoneName = ""
		objectiveName = ""
		poiIndex = 0
		zoneIndex = 0
		objectiveLevel = 0
		startDesc = ""
		endDesc = ""
	else
		zoneName = GetZoneNameById(GetQuestZoneId(questId))
		poiIndex = tonumber(lib.quests[questId]["poiIndex"])
		zoneIndex = GetZoneIndex(GetQuestZoneId(questId))
		objectiveName, objectiveLevel, startDesc, endDesc = GetPOIInfo(zoneIndex, poiIndex)
	end
	return zoneName, objectiveName, poiIndex, zoneIndex, objectiveLevel, startDesc, endDesc
end

function lib:GetUespQuestBackgroundText(questId)
	local backgroundText
	if lib.quests[questId] == nil then
		backgroundText = ""
	else
		backgroundText = lib.quests[questId]["backgroundText"]
	end
	return backgroundText
end

function lib:GetIsUespQuestSharable(questId)
	local isSharable
	if lib.quests[questId] == nil then
		isSharable = nil
	else
		if lib.quests[questId]["isShareable"] == "1" then
			isSharable = true
		elseif lib.quests[questId]["isShareable"] == "0" then
			isSharable = false
		else
			isSharable = nil
		end
	end
	return isSharable
end

function lib:GetUespQuestInstanceDisplayType(questId)
	local instanceDisplayType
	if lib.quests[questId] == nil then
		instanceDisplayType = 0
	else
		instanceDisplayType = tonumber(lib.quests[questId]["displayType"])
	end
	return instanceDisplayType
end

function lib:GetUespQuestRepeatType(questId)
	local repeatType
	if lib.quests[questId] == nil then
		repeatType = 0
	else
		repeatType = tonumber(lib.quests[questId]["repeatType"])
	end
	return repeatType
end
