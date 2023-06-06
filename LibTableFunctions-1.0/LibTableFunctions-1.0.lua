--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--	LibTableFunctions-1.0 © James Fritz (Urich)
--	LibTableFunctions is a small collection of functions aimed at simlifying
--	table operations.
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

--Register LTF
local libName, libVersion = "LibTableFunctions-1.0", 101
local ltf = {}

ltf.version = libVersion

--[[
  --ltf:TableContains(origTable, searchValue[, keySearch])
  --
  --This function searches a table for a search value as either a key or a value
  --in the table. If the keySearch flag is true, then the function returns true if
  --the search value is found as a table key and false if it is not. If the keySearch
  --flag is false or nil, then the function returns true if the search value is found
  --as a table value and false if it is not.
  --
  --@param	origTable	This is the table to be searched. If a table is not provided,
  --					the function operates as a normal comparison.
  --@param	searchValue	The value for the search. Must be equal types.
  --@param	keySearch	This boolean flag determines if the table is searched for the
  --					search value as a table key or as a table value. If true, the
  --					table keys are searched for the search value. Otherwise, the
  --					table values are searched for the search value.
]]--
function ltf:TableContains(origTable, searchValue, keySearch)
	if(origTable == nil) then return false end
	
	local valueFound = false
	if(type(origTable) ~= 'table') then
		return (origTable == searchValue and true or valueFound) end
	if(keySearch ~= nil and keySearch) then
		for k,v in pairs(origTable) do
			if(k == searchValue) then valueFound = true
			elseif(type(v) == 'table') then 
				valueFound = ltf:TableContains(v, searchValue, keySearch)
			end
			if(valueFound) then break end
		end
	else
		for k,v in pairs(origTable) do
			if(type(v) == 'table') then
				valueFound = ltf:TableContains(v, searchValue, keySearch)
			elseif(v == searchValue) then valueFound = true
			end
			if(valueFound) then break end
		end
	end
	return valueFound
end


--[[
  --ltf:CopyTable(origTable)
  --
  --This function returns a clean copy of the provided table.
  --
  --@param	origTable	This is the table to be copied. If a table is not provided,
  --					the function operates as a normal variable return.
]]--
function ltf:CopyTable(origTable)
	if(origTable == nil) then return {} end
	
	local copy
	if type(origTable) == 'table' then
		copy = {}
		for origKey, origValue in next, origTable, nil do
			copy[ltf:CopyTable(origKey)] = ltf:CopyTable(origValue)
		end
		setmetatable(copy, ltf:CopyTable(getmetatable(origTable)))
	else
		copy = origTable
	end
	return copy
end


--[[
  --ltf:PrintTable(origTable)
  --
  --This function iterates the provided table and returns a semi-formatted, printable
  --string.
  --
  --@param	origTable	This is the table to be searched. If a table is not provided,
  --					the function operates as a normal comparison.
]]--
function ltf:PrintTable(origTable)
	if(origTable == nil) then return "" end
	
	if type(origTable) == 'table' then
		local s = '{'
		for k,v in pairs(origTable) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. ltf:PrintTable(v) .. ','
		end
		return s .. '}'
	elseif type(origTable) == 'boolean' then
		return (origTable and "true" or "false")
	else
		return tostring(origTable)
	end
end


--[[
  --ltf:SortTable(origTable, column)
  --
  --This function sorts the provided table by the provided column number and
  --returns a new, sorted table.
  --
  --@param	origTable	This is the table to be sorted.
  --@param	column		This is column number to be used for sort. Defaults to 1.
]]--
function ltf:SortTable(origTable, column)
	if(origTable == nil) then return {} end
	if(type(origTable) ~= 'table') then return origTable end
	
	local sortCol = ((type(column) ~= 'number' or column < 1) and 1 or column)
	local sortedTable = ltf:CopyTable(origTable)
	local numRows, numElements, numElementsLast = 0, 0, -1
	
	for _, v in pairs(origTable) do
		numRows = numRows + 1
		numElementsLast = (numElements > 0 and numElements or numElementsLast)
		numElements = 0
		for _, v1 in pairs(v) do
			if(type(v1) == 'table') then
				sortedTable = ltf:CopyTable(origTable)
				return sortedTable
			end
			numElements = numElements + 1
		end
		if(numElements == 0 or (numElements ~= numElementsLast and numElementsLast ~= -1)) then
			sortedTable = ltf:CopyTable(origTable)
			return sortedTable
		end
	end
	
	for j = 1, numRows do
		for i = 1, numRows - 1 do
			if(sortedTable[i][sortCol] > sortedTable[i + 1][sortCol]) then
				local tempRow = sortedTable[i]
				sortedTable[i] = sortedTable[i + 1]
				sortedTable[i + 1] = tempRow
				tempRow = nil
			end
		end
	end
	return sortedTable
end


--[[
  --ltf:DeepPrint(origTable)
  --
  --This function iterates the provided table and direct prints the table keys
  --and values to chat.
  --
  --@param	origTable	This is the table to be printed. If a table is not provided,
  --					the function operates as a normal print.
]]--
function ltf:DeepPrint(origTable)
	if type(origTable) == 'table' then
		for k,v in pairs(origTable) do
			d(k)
			ltf:DeepPrint(v)
		end
	else
		d(tostring(origTable))
	end
end


--[[
  --ltf:SimpleResetTable(origTable, value)
  --
  --This function iterates the provided table and sets all values to the provided
  --value, regardless of type, in a new table. The new table is returned.
  --
  --@param	origTable	This is the table to be searched. If a table is not provided,
  --					the function operates as a normal comparison.
  --@param	value		This is the value being copied to the new table.
]]--
function ltf:SimpleResetTable(origTable, value)
	local newTable = {}
	if(type(origTable) == 'table') then
		for k, v in pairs(origTable) do
			newTable[k] = ltf:SimpleResetTable(v, value)
		end
	else
		newTable = value
	end
	return newTable
end


--[[
  --ltf:ResetTable(origTable, intVal, strVal, boolVal, otherVal)
  --
  --This function iterates the provided table and evaluates the type of each value.
  --The provided value for the evaluated type is them copied to a new table. The
  --new table is returned.
  --
  --@param	origTable	This is the table to be printed. If a table is not provided,
  --					the function operates as a normal print.
  --@param	intVal		The new value to use for number value types.
  --@param	strVal		The new value to use for string value types.
  --@param	boolVal		The new value to use for boolean value types.
  --@param	otherVal	The new value to use for all other value types.
]]--
function ltf:ResetTable(origTable, intVal, strVal, boolVal, otherVal)
	local newTable = {}
	local newIntVal, newStrVal, newBoolVal, newOtherVal = intVal, strVal, boolVal, otherVal
	if(type(origTable) == "table") then
		for k,v in pairs(origTable) do
			newTable[k] = ltf:ResetTable(v, newIntVal, newStrVal, newBoolVal, newOtherVal)
		end
	else
		if		type(origTable) == "number"  then	newTable = newIntVal
		elseif	type(origTable) == "string"  then	newTable = "\""..newStrVal.."\""
		elseif	type(origTable) == "boolean" then	newTable = newBoolVal
		else										newTable = newOtherVal
		end
	end
	return newTable
end

LibTableFunctions = ltf
