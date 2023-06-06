local CircularBuffer = ZO_Object:Subclass()
Chat2Clipboard.CircularBuffer = CircularBuffer

function CircularBuffer.CreateDefaultData(size)
	return {
		table = {},
		maxSize = size,
		count = 0,
		nextIndex = 1
	}
end

function CircularBuffer:New(size, data)
	local buffer = ZO_Object.New(self)
	buffer.data = data or CircularBuffer.CreateDefaultData(size)
	return buffer
end

function CircularBuffer:Add(element)
	local data = self.data
	local index = data.nextIndex
	data.table[index] = element
	data.nextIndex = (index % data.maxSize) + 1
	if(data.count < data.maxSize) then
		data.count = data.count + 1
	end
	return index
end

function CircularBuffer:Get(index)
	return self.data.table[index]
end

function CircularBuffer:GetIterator()
	local data = self.data
	local count = data.count
	local maxSize = data.maxSize
	local nextIndex = (data.nextIndex - count) % maxSize
	if(nextIndex <= 0) then nextIndex = maxSize end
	local function iterator(table)
		if(count > 0) then
			local entry = table[nextIndex]
			nextIndex = (nextIndex % maxSize) + 1
			count = count - 1
			return entry
		end
	end
	return iterator, data.table
end

function CircularBuffer:GetReverseIterator()
	local data = self.data
	local count = data.count
	local maxSize = data.maxSize
	local nextIndex = (data.nextIndex - 1) % maxSize
	if(nextIndex <= 0) then nextIndex = maxSize end
	local function iterator(table)
		if(count > 0) then
			local entry = table[nextIndex]
			nextIndex = (nextIndex - 1) % maxSize
			if(nextIndex <= 0) then nextIndex = maxSize end
			count = count - 1
			return entry
		end
	end
	return iterator, data.table
end
