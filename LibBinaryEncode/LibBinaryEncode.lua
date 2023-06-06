LBE = {
name = "LibBinaryEncode",
author = "Rhyono",
version = 34}

local LibBinaryEncode = LBE
LibBinaryEncode.logger = false
LibBinaryEncode.prefix = {}

--Pointer for decoding special positions
local charset_256_pointer = {
	[256]=0,[257]=1,[260]=2,[261]=3,[262]=4,[263]=5,[264]=6,[265]=7,[274]=8,[275]=9,
	[280]=10,[281]=11,[284]=12,[285]=13,[286]=14,[287]=15,[292]=16,[293]=17,[298]=18,[299]=19,
	[304]=20,[305]=21,[308]=22,[309]=23,[321]=24,[322]=25,[323]=26,[324]=27,[332]=28,[333]=29,
	[338]=30,[339]=31,[346]=127,[347]=128,[350]=129,[351]=130,[353]=132,[362]=133,[363]=134,
	[372]=135,[373]=136,[374]=137,[375]=138,[376]=139,[377]=140,[378]=141,[379]=142,[380]=143,[381]=144,
	[382]=145,[1040]=146,[1041]=147,[1042]=148,[1043]=149,[1044]=150,[1045]=151,[1046]=152,[1047]=153,[1048]=154,
	[1049]=155,[1050]=156,[1051]=157,[1052]=158,[1053]=159,[1054]=160,[1055]=162,[1057]=172,[1058]=173,
	[1059]=175,[1060]=184,[1061]=185,[1062]=186,[1063]=188,[1064]=190,[1065]=224,[1066]=170,[1067]=131
}	

--Custom special character set to handle 0x00-0x31, 0x7F-0x9F, several others being unusable 
local charset_256 = {[0]='Ā','ā','Ą','ą','Ć','ć','Ĉ','ĉ','Ē','ē','Ę','ę','Ĝ','ĝ','Ğ','ğ','Ĥ','ĥ','Ī','ī','İ','ı','Ĵ','ĵ','Ł','ł','Ń','ń','Ō','ō','Œ','œ',
[127]='Ś',[128]='ś',[129]='Ş',[130]='ş',[131]='Ы',[132]='š',[133]='Ū',[134]='ū',[135]='Ŵ',[136]='ŵ',
[137]='Ŷ',[138]='ŷ',[139]='Ÿ',[140]='Ź',[141]='ź',[142]='Ż',[143]='ż',[144]='Ž',[145]='ž',[146]='А',
[147]='Б',[148]='В',[149]='Г',[150]='Д',[151]='Е',[152]='Ж',[153]='З',[154]='И',[155]='Й',[156]='К',
[157]='Л',[158]='М',[159]='Н',[160]='О',
--original
[161]='¡',
--replacement
[162]='П',
--original
[163]='£',[164]='¤',[165]='¥',[166]='¦',[167]='§',[168]='¨',[169]='©',
--replacement
[170]='Ъ',
--original
[171]='«',
--replacement
[172]='С',[173]='Т',
--original
[174]='®',
--replacement
[175]='У',
--original
[176]='°',[177]='±',[178]='²',[179]='³',[180]='´',[181]='µ',[182]='¶',[183]='·',
--replacement
[184]='Ф',[185]='Х',[186]='Ц',
--original
[187]='»',
--replacement
[188]='Ч',
--original
[189]='½',
--replacement
[190]='Ш',
--original
[191]='¿',[192]='À',[193]='Á',[194]='Â',[195]='Ã',[196]='Ä',[197]='Å',[198]='Æ',[199]='Ç',[200]='È',
[201]='É',[202]='Ê',[203]='Ë',[204]='Ì',[205]='Í',[206]='Î',[207]='Ï',[208]='Ð',[209]='Ñ',[210]='Ò',
[211]='Ó',[212]='Ô',[213]='Õ',[214]='Ö',[215]='×',[216]='Ø',[217]='Ù',[218]='Ú',[219]='Û',[220]='Ü',
[221]='Ý',[222]='Þ',[223]='ß',
--replacement
[224]='Щ',
--original
[225]='á',[226]='â',[227]='ã',[228]='ä',[229]='å',[230]='æ',
[231]='ç',[232]='è',[233]='é',[234]='ê',[235]='ë',[236]='ì',[237]='í',[238]='î',[239]='ï',[240]='ð',
[241]='ñ',[242]='ò',[243]='ó',[244]='ô',[245]='õ',[246]='ö',[247]='÷',[248]='ø',[249]='ù',[250]='ú',
[251]='û',[252]='ü',[253]='ý',[254]='þ',[255]='ÿ'
}
--disallowed due to secondary byte being non-breaking space
--à (00E0), Р (0420), Š (0160)

local charset_64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local glue = 'ф' --1092

local BASE_64 = 6
local BASE_256 = 8
local intToBin = {[64]=6,[256]=8}

--Converts binary to decimal
local function bin_dec(binStr)
	binStr = binStr:reverse()
	local sum = 0
	for s = 1,binStr:len() do
		sum = sum + binStr:sub(s,s) * math.pow(2,s-1)
	end
	return sum	
end

--Converts decimal to binary
local function dec_bin(decNum,base)
    local bits={}   
    for b = base, 1, -1 do
        bits[b] = math.fmod(decNum, 2)
        decNum = math.floor((decNum - bits[b]) / 2)
    end
    return table.concat(bits)
end

--Checks if a value is true; allow global due to its usage scope
function IsTrue(val,strict)
	if (strict and (val == 1 or val == '1' or val == true)) or (not strict and (val ~= 0 and val ~= '0' and val ~= nil and val ~= '' and val ~= false)) then
		return true
	end
	return false
end

--For those that like consistency
function LibBinaryEncode:IsTrue(val,strict)
	return IsTrue(val,strict)
end

--Converts boolean value to a number
function NumBool(val,strict)
	return IsTrue(val,strict) and 1 or 0
end

--For those that like consistency
function LibBinaryEncode:NumBool(val,strict)
	return NumBool(val,strict)
end

--Converts string to table
function LibBinaryEncode:SplitString(inStr, sep)
	sep = sep or "([^%s])"
	local t={}
	for str in inStr:gmatch(sep) do
		t[#t+1] = str
	end
	return t
end

--Converts string to boolean table
function LibBinaryEncode:SplitBooleanString(inStr, sep)
	sep = sep or "([^%s])"
	local t={}
	for str in inStr:gmatch(sep) do
		t[#t+1] = IsTrue(str,true)
	end
	return t
end

--Pulls prefix,base from the global table
local function FetchPrefix(addonName,purpose)
	for index,data in pairs(LibBinaryEncode.prefix) do
		if data.addonName == addonName and data.purpose == purpose then
			return index,data.base,data.schema,data.schemaType
		end	
	end
	return false
end

--Pulls list of prefixes from a specific addon
local function FetchPrefixTable(addonName)
	local tbl = {}
	for index,data in pairs(LibBinaryEncode.prefix) do
		if data.addonName == addonName or addonName == nil then
			tbl[index] = {["addonName"]=data.addonName,["purpose"]=data.purpose,["base"]=data.base,["schema"]=data.schema,["schemaType"]=data.schemaType}
		end	
	end
	return tbl
end

--Flatten 1D table for encoding within the constraints of the schema
local function FlattenTable1D(tbl,schemaTbl)
	local outTbl, tblKeys = {}, {}
	-- populate the table that holds the keys
	for k in pairs(tbl) do 
		table.insert(tblKeys, k) 
	end
	-- sort the keys
	table.sort(tblKeys)

	for _, k in ipairs(tblKeys) do
		if schemaTbl[k] ~= nil then
			outTbl[#outTbl+1] = NumBool(tbl[k],true)
		end	
	end
	return table.concat(outTbl)
end

--Flatten ND table for encoding within the constraints of the schema
local function FlattenTableND(tbl,schemaTbl) 
	local function NextDimension(tbl,schemaTbl)
		local outTbl, tblKeys = {}, {}
		-- populate the table that holds the keys
		for k in pairs(tbl) do 
			table.insert(tblKeys, k) 
		end
		-- sort the keys
		table.sort(tblKeys)		
		
		-- use the keys to retrieve the values in the sorted order
		for _, key in ipairs(tblKeys) do 
			if schemaTbl[key] ~= nil then
				if type(schemaTbl[key]) == 'table' then
					outTbl[#outTbl+1] = table.concat(NextDimension(tbl[key],schemaTbl[key]))
				-- boolean check in case of future boolean defaults
				elseif type(schemaTbl[key]) == 'number' or type(schemaTbl[key]) == 'boolean' then
					outTbl[#outTbl+1] = NumBool(tbl[key],true)
				end
			end
		end

		return outTbl
	end
	
	return table.concat(NextDimension(tbl,schemaTbl))
end

--determines flattening method
function LibBinaryEncode:FlattenTable(tbl,addonName,purpose)
	--validity check unnecessary due to function inaccessibility otherwise
	local prefix,base,schema,schemaType = FetchPrefix(addonName,purpose)
	
	if schemaType == 1 then
		return FlattenTable1D(tbl,schema)
	elseif schemaType == 2 then
		return FlattenTableND(tbl,schema)
	end	
end

--Populates replica of schema table (1D)
local function ExpandTable1D(binStr,schema)
	local outTbl, tblKeys = {}, {}
	-- populate the table that holds the keys
	for k in pairs(schema) do 
		table.insert(tblKeys, k) 
	end
	-- sort the keys
	table.sort(tblKeys)

	local strPos = 1
	for _, k in ipairs(tblKeys) do
		local c = binStr:sub(strPos,strPos)
		if #c > 0 then
			outTbl[k] = IsTrue(c)
			strPos = strPos+1
		else
			--the decoded data is too small for the schema; fill the remainder with placeholders
			outTbl[k] = false
		end	
	end
	return outTbl
end

--Populates replica of schema table (ND)
local function ExpandTableND(binStr,schema)
	LBE:AddLog('ExpandTableND',true)
	LBE:AddLog(binStr)
	local function NextDimension(tbl,binStr,strPos)	
		local outTbl, tblKeys = {}, {}
		-- populate the table that holds the keys
		for k in pairs(tbl) do 
			table.insert(tblKeys, k) 
		end
		-- sort the keys
		table.sort(tblKeys)
		
		-- use the keys to retrieve the value
		for index, key in ipairs(tblKeys) do 
			-- if value is a table, go down another dimension
			if type(tbl[key]) == 'table' then
				LBE:AddLog('Next')
				outTbl[key], strPos = NextDimension(tbl[key],binStr,strPos)
			-- otherwise add the value to out
			else
				local c = binStr:sub(strPos,strPos)
				if #c > 0 then
					--create child
					outTbl[key] = IsTrue(c)
					LBE:AddLog('Value '..c)
					strPos = strPos+1
				else
					--the decoded data is too small for the schema; fill the remainder with placeholders
					outTbl[key] = false
					LBE:AddLog('Short data')
				end
			end
		end
		
		return outTbl, strPos
	end

	return NextDimension(schema,binStr,1)
end

--Combines two 1D tables
function LibBinaryEncode:ConcatTables(tbl1, tbl2)
	local outTbl = {}
	for _,v in pairs(tbl1) do
		table.insert(outTbl,v)
	end
	for _,v in pairs(tbl2) do
		table.insert(outTbl,v)
	end
	return outTbl
end

--Converts binary to pseudo base
function LibBinaryEncode:Encode(binStr,addonName,purpose,base)
	--Prepend prefix if it exists
	local prefix,schemaType = false,nil
	if addonName ~= nil and purpose ~= nil then
		prefix,base,_,schemaType = FetchPrefix(addonName,purpose)
	end
	local baseLen = BASE_256
	if base ~= nil and intToBin[base] ~= nil then
		baseLen = intToBin[base]
	end
	
	local temp = {}
	--Convert table to binary string
	if type(binStr) == 'table' then
		--use schema if applicable
		if schemaType ~= nil then
			binStr = LibBinaryEncode:FlattenTable(binStr,addonName,purpose)
		else
			for t=1,#binStr do
				temp[t] = LibBinaryEncode:NumBool(binStr[t],true)
			end
			binStr = table.concat(temp)
		end	
	--If passed as a number, convert it to a text string of the number
	elseif type(binStr) == 'number' or type(binStr) == 'string' then
		binStr = tostring(binStr)
		
		for t=1,binStr:len() do
	    	temp[t] = LibBinaryEncode:NumBool(binStr:sub(t,t),true)
		end
		binStr = table.concat(temp)		
	end
	local enStr = {} 
	
	--Ensure length, pad right unlike math
	local padLen = baseLen-math.fmod(binStr:len(),baseLen)
	if padLen == baseLen then padLen = 0 end
	while math.fmod(binStr:len(),baseLen) ~= 0 do
		binStr = binStr .. 0
	end
	
	local charPos = 0
	--Base 256
	if baseLen == BASE_256 then
		for e=1,binStr:len()-(baseLen-1),baseLen do
			charPos = bin_dec(binStr:sub(e,e+(baseLen-1)))
			--Handle special substitutions
			if charPos < 32 or charPos > 126 then
				enStr[#enStr+1] = charset_256[charPos]
			else	
				enStr[#enStr+1] = string.char(charPos)
			end
		end
	--Base 64	
	elseif baseLen == BASE_64 then
		for e=1,binStr:len()-(baseLen-1),baseLen do
			charPos = bin_dec(binStr:sub(e,e+(baseLen-1)))
			enStr[#enStr+1] = charset_64:sub(charPos+1,charPos+1)
		end	
	end

	if prefix ~= false then
		return prefix..glue..table.concat(enStr)..padLen
	end	
	return table.concat(enStr)..padLen
end	

--Alias 64 encode
function LibBinaryEncode:Encode64(binStr,addonName,purpose)
	return LibBinaryEncode:Encode(binStr,addonName,purpose,64)
end

--Decodes binary string to string
function LibBinaryEncode:DecodeToString(baseStr,addonName,purpose,base)
	LBE:AddLog('DecodeToString',true)
	LBE:AddLog(addonName)
	LBE:AddLog(purpose)
	LBE:AddLog(baseStr)
	--Remove prefix and fetch base
	local prefix = false
	if addonName ~= nil and purpose ~= nil then
		prefix,base = FetchPrefix(addonName,purpose)
		if prefix ~= false then
			baseStr = baseStr:gsub("^"..prefix:gsub("%%","%%%%"):gsub("%.","%%.")..glue,"")
		end	
	end	
 
	local baseLen = BASE_256
	if base ~= nil and intToBin[base] ~= nil then
		baseLen = intToBin[base]
	end

	if type(baseStr) == "number" then
		baseStr = tostring(baseStr)
	elseif type(baseStr) ~= "string" then
		return
	end
	local deStr = {} 


	--Remove pad length
	local padLen = tonumber(baseStr:sub(-1))
	if padLen == nil then 
		padLen = 0 
	end
	baseStr = baseStr:sub(1,-2)
	
	
	local char1 = nil
	local preNum = 0
	--Base 256
	if baseLen == BASE_256 then
		--Skips a byte after dealing with unicode
		local skip = false
		for c=1,baseStr:len() do
			if not skip then
				char1 = baseStr:byte(c)
				local char2 = nil
				if baseStr:byte(c) >= 194 then
					char1, char2 = baseStr:byte(c, c+1)
					skip = true
				end	
				if char2 == nil then
					deStr[#deStr+1] = dec_bin(char1,baseLen)
				else
					preNum = 0
					--194 starts at 0xA0
					if char1 >= 194 then
						preNum = char2+((char1-194)*64)
					end	
					--Use the pointer table to find the imitated value
					if charset_256_pointer[preNum] ~= nil then
						deStr[#deStr+1] = dec_bin(charset_256_pointer[preNum],baseLen)
					else
						deStr[#deStr+1] = dec_bin(preNum,baseLen)
					end	
				end	
			else
				skip = false
			end	
		end
	--Base 64	
	elseif baseLen == BASE_64 then
		for c=1,baseStr:len() do
			char1 = baseStr:sub(c,c)
			preNum = charset_64:find(char1)
			if preNum == nil then
				break
			else
				deStr[#deStr+1] = dec_bin(preNum-1,baseLen)
			end
		end
	end
	
	--handle check digit and excess
	local outData = table.concat(deStr)	
	if padLen ~= 0 then
		outData = outData:sub(1,-(padLen+1))
	end
	
	return outData
end

--Decode to table
function LibBinaryEncode:DecodeToTable(baseStr,addonName,purpose,base)
	LBE:AddLog('DecodeToTable',true)
	LBE:AddLog(addonName)
	LBE:AddLog(purpose)
	local binStr = LibBinaryEncode:DecodeToString(baseStr,addonName,purpose,base)
	local outTbl = {}
	--check for schema
	local prefix,schema,schemaType = false,0,nil
	if addonName ~= nil and purpose ~= nil then
		prefix,base,schema,schemaType = FetchPrefix(addonName,purpose)
		LBE:AddLog(schema)
	end
	--if schema exists, convert data into schema
	if schemaType == 1 then
		LBE:AddLog('ExpandTable1D Route')
		return ExpandTable1D(binStr,schema)
	elseif schemaType == 2 then
		LBE:AddLog('ExpandTableND Route')
		return ExpandTableND(binStr,schema)
	end
	
	return LibBinaryEncode:SplitBooleanString(binStr)
end

--Alias decode to table
function LibBinaryEncode:Decode(baseStr,addonName,purpose,base)
	return LibBinaryEncode:DecodeToTable(baseStr,addonName,purpose,base)
end

--Alias 64 decode
function LibBinaryEncode:Decode64(baseStr,addonName,purpose,base)
	return LibBinaryEncode:DecodeToTable(baseStr,addonName,purpose,base,64)
end


function LibBinaryEncode:DecodeToString64(baseStr,addonName,purpose)
	return LibBinaryEncode:DecodeToString(baseStr,addonName,purpose,64)
end

-- merge two tables into one dataset by overwriting where they share indexes (works with any values, not just binary)
function LibBinaryEncode:MergeTables(origin, target)
	if type(target) ~= 'table' then 
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': MergeTables requires the second parameter to be a table')
		return false
	end	
	if type(origin) ~= 'table' or origin == {} then return target end

	for k, v in pairs(origin) do
		if type(v or false) == "table" and type(target[k] or false) == "table" then
			target[k] = LibBinaryEncode:MergeTables(v, target[k])
		else
			target[k] = v
		end
	end
	
	return target
end

--Convert auto-index to schema-ready (1D only)
function LibBinaryEncode:ConvertTable(tbl)
	local outTbl = {}
	for i,d in pairs(tbl) do
		outTbl[d] = 0
	end
	return outTbl
end

local function CloneSchema1D(schema)
	local outTbl = {}
	
	for i,d in pairs(schema) do
		outTbl[i] = false
	end
	
	return outTbl
end

local function CloneSchemaND(schema)
	LBE:AddLog('CloneSchemaND')
	local function NextDimension(tbl)
		local outTbl = {}
		for index, data in pairs(tbl) do
			if type(data) == 'table' then
				outTbl[index] = NextDimension(data)
			else	
				outTbl[index] = false
			end
		end
		
		return outTbl
	end
	
	return NextDimension(schema)
end

--create a copy of a schema
function LibBinaryEncode:CloneSchema(addonName,purpose)
	LBE:AddLog('CloneSchema '..purpose)
	if addonName == nil or purpose == nil then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': CloneSchema required an addon name and purpose')
		return false
	end

	-- fetch schema to determine which conversion method to use
	local index,base,schema,schemaType = FetchPrefix(addonName,purpose)
	
	if index == false then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': CloneSchema requires an existing schema to copy')
		return false
	end
	
	if schemaType == 1 then
		return CloneSchema1D(schema)
	elseif schemaType == 2 then
		return CloneSchemaND(schema)
	end	
	
	return false
end

local function ConvertSchema1D(tbl,schema)
	local outTbl = {}
	
	for index, data in pairs(schema) do
		--do not use ternary
		--add the data to the new table if it exists
		if tbl[index] ~= nil then
			outTbl[index] = tbl[index]
		--otherwise use placeholder data
		else
			outTbl[index] = false
		end
	end
	
	return outTbl
end

local function ConvertSchemaND(tbl,schema)
	local function NextDimension(tbl,schemaTbl)
		local outTbl = {}
		for index, data in pairs(schemaTbl) do
			-- if data is a table, go deeper
			if type(data) == 'table' then
				if type(tbl) == 'boolean' then
					outTbl[index] = NextDimension({},data)
				elseif type(tbl) == 'table' then
					outTbl[index] = NextDimension(tbl[index],data)
				end	
			else
				-- if data is defined in table, write it
				if tbl ~= nil then
					if type(tbl) == 'boolean' then
						outTbl[index] = tbl
					elseif type(tbl) == 'table' then
						outTbl[index] = tbl[index]
					end
				else
					outTbl[index] = false
				end
			end
		end
		
		return outTbl
	end

	return NextDimension(tbl,schema)
end

--Converts a table into another schema (must be the same dimension count)
function LibBinaryEncode:ConvertSchema(tbl,addonName,purpose)
	if type(tbl) ~= 'table' then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': ConvertSchema requires the decoded data as a table')
		return false
	end
	
	if addonName == nil or purpose== nil then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': ConvertSchema requires a schema to convert to')
		return false
	end
	
	-- fetch schema to determine which conversion method to use
	local index,base,schema,schemaType = FetchPrefix(addonName,purpose)
	
	if index == false then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': ConvertSchema requires an existing schema to convert to')
		return false
	end
	
	if schemaType == 1 then
		return ConvertSchema1D(tbl,schema)
	elseif schemaType == 2 then
		return ConvertSchemaND(tbl,schema)
	end

	return false
end

--Converts a table into a schema table
local function ExtractSchema(tbl) 
	if type(tbl) == 'table' then
		local function NextDimension(tbl,oneD,ND)
			local outTbl = {}
			for index, data in pairs(tbl) do
				if type(data) == 'table' then
					ND = ND+1
					outTbl[index] = NextDimension(data,oneD,ND)
				else
					oneD = oneD+1
					outTbl[index] = 0
				end
			end
		
			return outTbl, oneD, ND
		end
		
		local outTbl, oneD, ND = NextDimension(tbl,0,0)
		
		--ensure this isn't an empty table
		if (oneD+ND) == 0 then
			CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix does not allow empty tables as schema. Use nil instead')
			return		
		end
		--default to N dimensions
		return outTbl, (ND > 0 and 2 or 1)
	else
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires a table schema if schema is provided')
	end
	return
end 

--Adds a prefix to the global prefix table
function LibBinaryEncode:DefinePrefix(prefix,addonName,purpose,base,schema)
	if addonName == nil or addonName == true or addonName == false then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires addon name')
		return false
	end	
	if purpose == nil or purpose == true or purpose == false then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires a purpose for the prefix')
		return false
	end
	--check if base is in list of allowed bases
	if base == nil then
		base = 256
	else
		local base_found = false
		for i,d in pairs(intToBin) do
			if i == base then
				base_found = true
				break
			end	
		end	
		if not base_found then
			CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires an accepted base. Leave blank for default')
			return false
		end
	end
	--check for and parse schema
	local schemaTable,schemaType = {}, nil
	if schema ~= nil then
		schemaTable, schemaType = ExtractSchema(schema)
		if schemaTable == nil then
			return false
		end
	end
	if prefix == nil or prefix == false then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires prefix')
		return false
	elseif type(tonumber(prefix)) == "number" then
		CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires non-numeric prefix')
	else
		--check if in use	
		if LibBinaryEncode.prefix[prefix] ~= nil then
			CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires unique prefix. Prefix "'..prefix..'" is in use by addon "'..LibBinaryEncode.prefix[prefix].addonName..'" and cannot be used by addon "'..addonName..'"')
			return false
		else
			--not in use, but check if it is a repeat purpose for this addon
			if FetchPrefix(addonName,purpose) == false then
				LibBinaryEncode.prefix[prefix] = {["addonName"]=addonName,["purpose"]=purpose,["base"]=base,["schema"]=schemaTable,["schemaType"]=schemaType}
				return true
			else
				CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': DefinePrefix requires unique purpose per addon.')
				return false
			end	
		end	
	end
end

--Parses a body of text to find encoded data
function LibBinaryEncode:Parse(txtStr,addonName,purpose,dataToString,firstOnly)
	--create a table of all text strings
	local orgData = LibBinaryEncode:SplitString(txtStr,"%S+")
	local outputData = {}
	
	local prefixes = {}
	--addon and purpose defined, only return this prefix
	if addonName ~= nil and purpose ~= nil then
		local prefix,base,schema,schemaType = FetchPrefix(addonName,purpose)
		if prefix ~= false then
			prefixes[prefix] = {["addonName"]=addonName,["purpose"]=purpose,["base"]=base,["schema"]=schema,["schemaType"]=schemaType}
		else
			CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': Parse encountered nonexistent addon-purpose combination: ' .. addonName .. ' and ' .. purpose)
			return {}
		end	
	--addon defined, return any from this	
	elseif addonName ~= nil then
		prefixes = FetchPrefixTable(addonName)
		if next(prefixes) == nil then
			CHAT_SYSTEM:AddMessage(LibBinaryEncode.name .. ': Parse encountered nonexistent addon: ' .. addonName)
			return {}
		end	
	end
		
	for idx, data in pairs(orgData) do
		--check for this prefix on each string
		for index,pfxData in pairs(addonName ~= nil and prefixes or LibBinaryEncode.prefix) do
			if data:find(index,1,true) == 1 then
				local outData = nil
				if dataToString then
					outData = LibBinaryEncode:DecodeToString(data,pfxData.addonName,pfxData.purpose)
				else
					outData = LibBinaryEncode:Decode(data,pfxData.addonName,pfxData.purpose)
				end
				outputData[#outputData+1] = {["data"]=outData,["addonName"]=pfxData.addonName,["purpose"]=pfxData.purpose,["prefix"]=index,["base"]=pfxData.base,["schema"]=pfxData.schema,["schemaType"]=pfxData.schemaType}
				if firstOnly then
					return outputData
				end
			end
		end
	end	
	
	return outputData
end

--Parses the decoded data to a string
function LibBinaryEncode:ParseDataToString(txtStr,addonName,purpose)
	return LibBinaryEncode:Parse(txtStr,addonName,purpose,true)
end

--Alias
function LibBinaryEncode:ParseDataToTable(txtStr,addonName,purpose)
	return LibBinaryEncode:Parse(txtStr,addonName,purpose,false)
end

--Only parses the first prefix encountered
function LibBinaryEncode:ParseFirst(txtStr,addonName,purpose,dataToString)
	return LibBinaryEncode:Parse(txtStr,addonName,purpose,dataToString,true)
end

--Alias
function LibBinaryEncode:ParseFirstDataToTable(txtStr,addonName,purpose)
	return LibBinaryEncode:Parse(txtStr,addonName,purpose,false,true)
end

--Only parses the first prefix encountered to a string
function LibBinaryEncode:ParseFirstDataToString(txtStr,addonName,purpose)
	return LibBinaryEncode:Parse(txtStr,addonName,purpose,true,true)
end

--Parses under the assumption of the return value being of the desired schema and trusting that it will be without confirming (e.g. from a saved var)
function LibBinaryEncode:ParseTrusted(txtStr,addonName,purpose)
	if addonName == nil or purpose == nil then return {} end
	-- only allow string value
	if txtStr ~= nil and type(txtStr) == 'string' then
		--allow for the possibility of a previous version being found
		local temp = LibBinaryEncode:ParseFirst(txtStr,addonName)
		--something found
		if #temp > 0 then
			--current version found
			if temp[1].purpose == purpose then
				return temp[1].data
			--old version found, attempt to convert it to the current schema	
			else
				return LibBinaryEncode:ConvertSchema(temp[1].data,addonName,purpose)
			end
		--nothing found, use a fresh copy of the current schema	
		else
			return LibBinaryEncode:CloneSchema(addonName,purpose)
		end
	--otherwise replace it with the current schema
	else
		return LibBinaryEncode:CloneSchema(addonName,purpose)
	end	
end

function LibBinaryEncode:AddLog(data,newTable,newSession)
	if not LibBinaryEncode.logger then return end
	if newSession then
		LibBinaryEncode.Log.messages[#LibBinaryEncode.Log.messages+1] = {}
	end
	if newTable then
		LibBinaryEncode.Log.messages[#LibBinaryEncode.Log.messages][#LibBinaryEncode.Log.messages[#LibBinaryEncode.Log.messages]+1] = {}
	end	
	table.insert(LibBinaryEncode.Log.messages[#LibBinaryEncode.Log.messages][#LibBinaryEncode.Log.messages[#LibBinaryEncode.Log.messages]],data)
end

function LibBinaryEncode.OnAddOnLoaded(eventCode,addOnName)
	if addOnName ~= LibBinaryEncode.name then return end
	
	LibBinaryEncode.Log = ZO_SavedVars:NewAccountWide('LBE_LOG',1,GetWorldName(),{})
	if LibBinaryEncode.Log.messages == nil then LibBinaryEncode.Log.messages = {} end
	-- always start a new table
	LibBinaryEncode:AddLog('LBE Loaded',true,true)
	EVENT_MANAGER:UnregisterForEvent(LibBinaryEncode.name, EVENT_ADD_ON_LOADED)
end

if LibBinaryEncode.logger then
	EVENT_MANAGER:RegisterForEvent(LibBinaryEncode.name, EVENT_ADD_ON_LOADED, LibBinaryEncode.OnAddOnLoaded)
end	