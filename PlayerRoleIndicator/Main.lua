PlayerRoleIndicator = PlayerRoleIndicator or {}
PlayerRoleIndicator.name = "PlayerRoleIndicator"
PlayerRoleIndicator.version = "1.2.0"
PlayerRoleIndicator.variableVersion = 11
PlayerRoleIndicator.roleSwitch = {}
PlayerRoleIndicator.groupSize = 24
PlayerRoleIndicator.noteNum = 5

local noteId = PlayerRoleIndicator.noteNum
local LCM = LibCustomMenu

PlayerRoleIndicator.default = {
	iconSize = 48,
	yOffsetDead = 50,
	yOffsetAlive = 325,
	
	showShade = true,
	shadeColour = {r = (100/255), g = 0, b = (160/255), a = 1},
	
	useRezColour = true,
	rezPendingColour = {r = 1, g = 1, b = 1, a = 0.25},
	rezingColour = {r = 1, g = 1, b = 1, a = 0.25},
	
	useNote = true,
	noteSize = 1,
	notePos = {x = 0, y = 0},
	noteUseAccountName = false,
	noteDuration = 3,
	noteUseIcon = true,
	noteRez = true,
	
	useCustom = true,
	customNum = 0,
	customRole = {},
	customDefault = {
		name = "Custom role",
		show = false,
		showOnAlive = false,
		texturePath = "/esoui/art/compass/groupmember.dds",
		colourAlive = {r = 1, g = 1, b = 1, a = 1},
		colourDead = {r = 1, g = 1, b = 1, a = 1},
		players = {}
	},
	
	leader = {
		show = false,
		showOnAlive = false,
		texturePath = "/esoui/art/compass/groupleader.dds",
		colourAlive = {r = 1, g = 1, b = 1, a = 1},
		colourDead = {r = 1, g = 1, b = 1, a = 1},
	},
	dps = {
		show = false,
		showOnAlive = false,
		texturePath = "/esoui/art/tutorial/gamepad/gp_lfg_dps.dds",
		colourAlive = {r = 1, g = 1, b = 1, a = 1},
		colourDead = {r = 1, g = 1, b = 1, a = 1},
	},
	tank = {
		show = true,
		showOnAlive = true, --默认活着时也打开
		texturePath = "/esoui/art/tutorial/gamepad/gp_lfg_tank.dds",
		colourAlive = {r = 1, g = 1, b = 1, a = 1},
		colourDead = {r = 1, g = 1, b = 1, a = 1},
	},
	healer = {
		show = true,
		showOnAlive = true, --默认活着时也打开
		texturePath = "/esoui/art/tutorial/gamepad/gp_lfg_healer.dds",
		colourAlive = {r = 1, g = 1, b = 1, a = 1},
		colourDead = {r = 1, g = 1, b = 1, a = 1},
	},
}

--Emulates a C-style switch, should have better performance than if-else chains
function PlayerRoleIndicator.UpdateRoleSwitch()
	PlayerRoleIndicator.roleSwitch = {
		[LFG_ROLE_TANK] = {
			show = PlayerRoleIndicator.savedVariables.tank.show,
			showOnAlive = PlayerRoleIndicator.savedVariables.tank.showOnAlive,
			sv = PlayerRoleIndicator.savedVariables.tank
			},
		[LFG_ROLE_HEAL] = {
			show = PlayerRoleIndicator.savedVariables.healer.show,
			showOnAlive = PlayerRoleIndicator.savedVariables.healer.showOnAlive,
			sv = PlayerRoleIndicator.savedVariables.healer
			},
		[LFG_ROLE_DPS] = {
			show = PlayerRoleIndicator.savedVariables.dps.show,
			showOnAlive = PlayerRoleIndicator.savedVariables.dps.showOnAlive,
			sv = PlayerRoleIndicator.savedVariables.dps
			},
		["Leader"] = {
			show = PlayerRoleIndicator.savedVariables.leader.show,
			showOnAlive = PlayerRoleIndicator.savedVariables.leader.showOnAlive,
			sv = PlayerRoleIndicator.savedVariables.leader
			},
		[LFG_ROLE_INVALID] = {
			show = false,
			showOnAlive = false,
			sv = {
				texturePath = "",
				colourAlive = {r = 1, g = 1, b = 1, a = 0},
				colourDead = {r = 1, g = 1, b = 1, a = 0},
			}
		}
	}
end

function PlayerRoleIndicator.GetRole(unitTag)
	local customRole = nil
	for _, value in ipairs(PlayerRoleIndicator.savedVariables.customRole) do
		for index, playerName in ipairs(value.players) do
			if playerName == GetUnitDisplayName(unitTag) then 
				customRole = value
				break
			end
		end
		if customRole then break end
	end
	
	local role = nil
	if customRole then
		role = {}
		role.name = customRole.name
		role.show = customRole.show
		role.showOnAlive = customRole.showOnAlive
		role.sv = {
			texturePath = customRole.texturePath,
			colourAlive = customRole.colourAlive,
			colourDead = customRole.colourDead,
		}
	elseif (AreUnitsEqual(GetGroupLeaderUnitTag(), unitTag) and PlayerRoleIndicator.roleSwitch["Leader"].show) then
		role = PlayerRoleIndicator.roleSwitch["Leader"]
	else role = PlayerRoleIndicator.roleSwitch[GetGroupMemberSelectedRole(unitTag)] end
	
	return role
end

function PlayerRoleIndicator.UnitChecks(unitTag)
	if (not DoesUnitExist(unitTag)) then return false end
	if AreUnitsEqual("player", unitTag) then return false end
	if (not IsUnitPlayer(unitTag)) then return false end
	if (not IsUnitOnline(unitTag)) then return false end
	if (not IsUnitGrouped(unitTag)) then return false end
	if (not IsGroupMemberInSameInstanceAsPlayer(unitTag) or not IsGroupMemberInSameWorldAsPlayer(unitTag) or IsGroupMemberInRemoteRegion(unitTag)) then return false end
	return true
end

function PlayerRoleIndicator.UpdateIconVisual(unitTag, role)
	if (not PlayerRoleIndicator.UnitChecks(unitTag)) then return end
	
	local c = PlayerRoleIndicatorWindow:GetNamedChild(unitTag)
	local sv = PlayerRoleIndicator.savedVariables
	
	c:SetDimensions(sv.iconSize, sv.iconSize)
	if role.show then
		c:SetTexture(role.sv.texturePath)
		
		for i = 1, GetNumBuffs(unitTag), 1 do
			local buffName = GetUnitBuffInfo(unitTag, i)
			if ((buffName == "Shadow of the Fallen") and sv.showShade) then
				c:SetColor(sv.shadeColour.r, sv.shadeColour.g, sv.shadeColour.b, sv.shadeColour.a)
				return
			end
		end
		
		if IsUnitDead(unitTag) then
			if IsUnitBeingResurrected(unitTag) then
				c:SetColor(sv.rezingColour.r, sv.rezingColour.g, sv.rezingColour.b, sv.rezingColour.a)
			elseif DoesUnitHaveResurrectPending(unitTag) then
				c:SetColor(sv.rezPendingColour.r, sv.rezPendingColour.g, sv.rezPendingColour.b, sv.rezPendingColour.a)
			else c:SetColor(role.sv.colourDead.r, role.sv.colourDead.g, role.sv.colourDead.b, role.sv.colourDead.a) end
		elseif role.showOnAlive then
			c:SetColor(role.sv.colourAlive.r, role.sv.colourAlive.g, role.sv.colourAlive.b, role.sv.colourAlive.a)
		end
	end
end

function PlayerRoleIndicator.UpdateAllIconVisuals()
	for i = 1, PlayerRoleIndicator.groupSize, 1 do
		local unitTag = string.format("group%u", i)
		local role = PlayerRoleIndicator.GetRole(unitTag)
		PlayerRoleIndicator.UpdateIconVisual(unitTag, role)
	end
end

function PlayerRoleIndicator.UpdateAllNoteSize()
	if PlayerRoleIndicatorWindowNotePanel:IsMouseEnabled() then return end

	PlayerRoleIndicatorWindowNotePanel:SetAnchor(TOPLEFT, PlayerRoleIndicatorWindow, TOPLEFT, PlayerRoleIndicator.savedVariables.notePos.x, PlayerRoleIndicator.savedVariables.notePos.y)
	for i = 1, PlayerRoleIndicator.noteNum, 1 do
		local label = PlayerRoleIndicatorWindowNotePanel:GetNamedChild(string.format("Note%u", i))
		
		label:SetScale(PlayerRoleIndicator.savedVariables.noteSize)
		local textHeight = label:GetTextHeight()
		label:SetAnchor(TOPLEFT, labelPanel, TOPLEFT, textHeight * PlayerRoleIndicator.savedVariables.noteSize, textHeight * (i-1) * 1.25 * PlayerRoleIndicator.savedVariables.noteSize)
		
		local labelIcon = label:GetNamedChild("Icon")
		labelIcon:SetDimensions(textHeight, textHeight)
		labelIcon:SetAnchor(TOPRIGHT, label, TOPLEFT, textHeight * -0.25, 0)
	end
end

function PlayerRoleIndicator.ShowNote(event, unitTag, isDead)
	if not PlayerRoleIndicator.savedVariables.useNote then return end
	if PlayerRoleIndicatorWindowNotePanel:IsMouseEnabled() then return end
	if not PlayerRoleIndicator.UnitChecks(unitTag) then return end
	
	local role = PlayerRoleIndicator.GetRole(unitTag)
	
	if not role.show then return end
	if ((not role.showOnAlive) and (not isDead)) then return end
	
	local name = {}
	if PlayerRoleIndicator.savedVariables.noteUseAccountName then
		name = GetUnitDisplayName(unitTag)
	else name = GetUnitName(unitTag) end
	
	local colour = {}
	local text = {}
	if isDead then
		colour.r = role.sv.colourDead.r
		colour.g = role.sv.colourDead.g
		colour.b = role.sv.colourDead.b
		colour.a = role.sv.colourDead.a
		text = string.format("%s has died", name)
	else 
		colour.r = role.sv.colourAlive.r
		colour.g = role.sv.colourAlive.g
		colour.b = role.sv.colourAlive.b
		colour.a = role.sv.colourAlive.a
		text = string.format("%s has been resurrected", name)
	end
	
	local texturePath = {}
	if PlayerRoleIndicator.savedVariables.noteUseIcon then
		texturePath = role.sv.texturePath
	else texturePath = "" end
	
	noteId = noteId + 1
	local label = PlayerRoleIndicatorWindowNotePanel:GetNamedChild("Note1")
	local labelIcon = label:GetNamedChild("Icon")
	
	local colourBuffer = {}
	local textBuffer = ""
	local widthBuffer = nil
	local texturePathBuffer = "" 
	local hiddenBuffer = true
	local IdBuffer = nil
	
	local tempColour = {}
	tempColour.r, tempColour.g, tempColour.b, tempColour.a = label:GetColor()
	local tempText = label:GetText()
	local tempWidth = label:GetTextWidth()
	local tempTexturePath = labelIcon:GetTextureFileName()
	local tempHidden = label:IsHidden()
	local tempId = label:GetId()
	
	for i = 1, (PlayerRoleIndicator.noteNum - 1), 1 do
		local currentLabel = PlayerRoleIndicatorWindowNotePanel:GetNamedChild(string.format("Note%u", i))
		local currentLabelIcon = currentLabel:GetNamedChild("Icon")
		local nextLabel = PlayerRoleIndicatorWindowNotePanel:GetNamedChild(string.format("Note%u", (i + 1)))
		local nextLabelIcon = nextLabel:GetNamedChild("Icon")
		
		colourBuffer.r, colourBuffer.g, colourBuffer.b, colourBuffer.a = nextLabel:GetColor()
		textBuffer = nextLabel:GetText()
		widthBuffer = nextLabel:GetStringWidth(textBuffer)
		texturePathBuffer = nextLabelIcon:GetTextureFileName()
		hiddenBuffer = nextLabel:IsHidden() 
		IdBuffer = nextLabel:GetId()
		
		nextLabel:SetColor(tempColour.r, tempColour.g, tempColour.b, tempColour.a)
		nextLabel:SetText(tempText)
		nextLabel:SetWidth(tempWidth)
		nextLabel:SetId(tempId)
		nextLabel:SetHidden(tempHidden)
		nextLabelIcon:SetTexture(tempTexturePath)
		if tempTexturePath == "" then nextLabelIcon:SetHidden(true)
		else
			nextLabelIcon:SetColor(tempColour.r, tempColour.g, tempColour.b, tempColour.a)
			nextLabelIcon:SetHidden(tempHidden)
		end
		
		tempColour.r = colourBuffer.r 
		tempColour.g = colourBuffer.g
		tempColour.b = colourBuffer.b
		tempColour.a = colourBuffer.a
		tempText = textBuffer
		tempWidth = widthBuffer
		tempTexturePath = texturePathBuffer
		tempHidden = hiddenBuffer
		tempId = IdBuffer
	end
	
	label:SetId(noteId)
	label:SetColor(colour.r, colour.g, colour.b, colour.a)
	label:SetText(text)
	label:SetWidth(label:GetStringWidth(text))
	label:SetHidden(false)
	labelIcon:SetTexture(texturePath)
	if texturePath == "" then labelIcon:SetHidden(true)
	else
		labelIcon:SetColor(colour.r, colour.g, colour.b, colour.a)
		labelIcon:SetHidden(false)
	end
	
	local id = noteId
	zo_callLater(function() PlayerRoleIndicator.HideNote(id) end, PlayerRoleIndicator.savedVariables.noteDuration*1000)
end

function PlayerRoleIndicator.HideNote(id)
	if PlayerRoleIndicatorWindowNotePanel:IsMouseEnabled() then return end
	for i = 1, PlayerRoleIndicator.noteNum, 1 do
		local label = PlayerRoleIndicatorWindowNotePanel:GetNamedChild(string.format("Note%u", i))
		if label:GetId() == id then
			local alpha = label:GetAlpha()
			if alpha > 0.1 then 
				label:SetAlpha(alpha - 0.1)
				zo_callLater(function() PlayerRoleIndicator.HideNote(id) end, 100)
			else
				label:SetHidden(true)
			end
			break
		end
	end
end

function PlayerRoleIndicator.PlayerLeftGroup()
	for i = 1, PlayerRoleIndicator.groupSize, 1 do
		local unitTag = string.format("group%u", i)
		PlayerRoleIndicatorWindow:GetNamedChild(unitTag):SetHidden(true)
	end
end

function PlayerRoleIndicator.UpdateForUnit(unitTag, camMatrixInv, screenX, screenY)
	if (not PlayerRoleIndicator.UnitChecks(unitTag)) then return true end
	
	local role = PlayerRoleIndicator.GetRole(unitTag)
	
	if not role.show then return true end
	if ((not role.showOnAlive) and (not IsUnitDead(unitTag))) then return true end
	
	--Gets the units world postion and adds height offset
	local _, worldX, worldY, worldZ = GetUnitRawWorldPosition(unitTag)
	if (IsUnitDead(unitTag)) then worldY = worldY + PlayerRoleIndicator.savedVariables.yOffsetDead
	else worldY = worldY + PlayerRoleIndicator.savedVariables.yOffsetAlive end
	
	local mtx = matrix:new(1,4,0)
	
	mtx[1][1] = worldX
	mtx[1][2] = worldY
	mtx[1][3] = worldZ
	mtx[1][4] = 1
	
	mtx = matrix.mul(mtx, camMatrixInv)
	
    local distance = mtx[1][3]
	if (mtx[1][3] <= 0) then return true end
	PlayerRoleIndicator.UpdateIconVisual(unitTag, role)
	
    local worldWidth, worldHeight = GetWorldDimensionsOfViewFrustumAtDepth(distance)
	
	local UIUnitsPerWorldUnitX, UIUnitsPerWorldUnitY = screenX/worldWidth, screenY/worldHeight
	
	local x = mtx[1][1] * UIUnitsPerWorldUnitX
	local y = -mtx[1][2] * UIUnitsPerWorldUnitY
	
	local w = PlayerRoleIndicatorWindow
	local c = w:GetNamedChild(unitTag)
	c:SetAnchor(CENTER, w, CENTER, x, y)
	
	return false
end

function PlayerRoleIndicator.UpdateIndicators()
	if not IsUnitGrouped("player") then return end
	
	--Gets the direction vectors of the camera and the world position of the camera
	--They are then put into a matrix and inverted
	--The inverted matrix is used to convert world position into a local position with the camera as the origin, and the cameras direction vectors as axis
	local RenderSpace = PlayerRoleIndicator.RenderSpace
	Set3DRenderSpaceToCurrentCamera(RenderSpace:GetName())
	local cameraX, cameraY, cameraZ = GuiRender3DPositionToWorldPosition(RenderSpace:Get3DRenderSpaceOrigin())
	local forwardX, forwardY, forwardZ = RenderSpace:Get3DRenderSpaceForward()
	local rightX, rightY, rightZ = RenderSpace:Get3DRenderSpaceRight()
	local upX, upY, upZ = RenderSpace:Get3DRenderSpaceUp()
	
	local camMatrix = matrix:new(4,4,0)
	
	camMatrix[1][1] = rightX
	camMatrix[1][2] = rightY
	camMatrix[1][3] = rightZ
	camMatrix[1][4] = 0
	
	camMatrix[2][1] = upX
	camMatrix[2][2] = upY
	camMatrix[2][3] = upZ
	camMatrix[2][4] = 0
	
	camMatrix[3][1] = forwardX
	camMatrix[3][2] = forwardY
	camMatrix[3][3] = forwardZ
	camMatrix[3][4] = 0
	
	camMatrix[4][1] = cameraX
	camMatrix[4][2] = cameraY
	camMatrix[4][3] = cameraZ
	camMatrix[4][4] = 1
	
	local camMatrixInv = matrix.invert(camMatrix)
	local screenX, screenY = GuiRoot:GetDimensions()
	
	for i=1, PlayerRoleIndicator.groupSize, 1 do
		local unitTag = string.format("group%u", i)
		local hidden = PlayerRoleIndicator.UpdateForUnit(unitTag, camMatrixInv, screenX, screenY)
		PlayerRoleIndicatorWindow:GetNamedChild(unitTag):SetHidden(hidden)
	end
end

function PlayerRoleIndicator.intialize(eventCode, name)
	if name ~= PlayerRoleIndicator.name then return end
	
	PlayerRoleIndicator.savedVariables = ZO_SavedVars:NewAccountWide("PlayerRoleIndicatorVars", PlayerRoleIndicator.variableVersion, nil, PlayerRoleIndicator.default, GetWorldName())
	PlayerRoleIndicator.CreateSettingsWindow()
	
	--Hides icons when scene is changed
	local function stateChange(oldState, newState)
		if (newState == SCENE_SHOWN) then
			if PlayerRoleIndicatorWindow:IsHidden() then
				PlayerRoleIndicatorWindow:SetHidden(false)
			end
		end
    end
    PlayerRoleIndicator.fragment = ZO_HUDFadeSceneFragment:New(PlayerRoleIndicatorWindow)
    HUD_SCENE:AddFragment(PlayerRoleIndicator.fragment)
    HUD_SCENE:RegisterCallback("StateChange", stateChange)
    HUD_UI_SCENE:AddFragment(PlayerRoleIndicator.fragment)
	
	PlayerRoleIndicator.RenderSpace = CreateControl(string.format("%sRenderSpace", PlayerRoleIndicator.name), GuiRoot, CT_CONTROL)
	PlayerRoleIndicator.RenderSpace:Create3DRenderSpace()
	for i=1, PlayerRoleIndicator.groupSize, 1 do
		local unitTag = string.format("group%u", i)
		PlayerRoleIndicatorWindow:CreateControl(string.format("$(parent)%s", unitTag),CT_TEXTURE)
		local c = PlayerRoleIndicatorWindow:GetNamedChild(unitTag)
		c:SetAnchor(CENTER, PlayerRoleIndicatorWindow, CENTER, 0, 0)
		c:SetMouseEnabled(false)
		c:SetHidden(true)
	end
	
	local labelPanel = PlayerRoleIndicatorWindow:CreateControl("$(parent)NotePanel", CT_CONTROL)
	labelPanel:SetAnchor(TOPLEFT, PlayerRoleIndicatorWindow, TOPLEFT, PlayerRoleIndicator.savedVariables.notePos.x, PlayerRoleIndicator.savedVariables.notePos.y)
	labelPanel:SetResizeToFitDescendents(true) 
	labelPanel:SetMouseEnabled(false)
	labelPanel:SetMovable(false) 
	labelPanel:SetHidden(false)
	for i=1, PlayerRoleIndicator.noteNum, 1 do
		local label = labelPanel:CreateControl(string.format("$(parent)Note%u", i), CT_LABEL)
		label:SetId(i)
		label:SetFont("ZoFontWinH1")
		label:SetText("Unit has died")
		label:SetWidth(label:GetStringWidth("Unit has died"))
		label:SetScale(PlayerRoleIndicator.savedVariables.noteSize)
		local textHeight = label:GetTextHeight()
		label:SetAnchor(TOPLEFT, labelPanel, TOPLEFT, textHeight * PlayerRoleIndicator.savedVariables.noteSize, textHeight * (i-1) * 1.25 * PlayerRoleIndicator.savedVariables.noteSize)
		label:SetMouseEnabled(false)
		label:SetHidden(true)
		
		local labelIcon = label:CreateControl("$(parent)Icon", CT_TEXTURE)
		labelIcon:SetDimensions(textHeight, textHeight)
		labelIcon:SetTexture("/esoui/art/tutorial/gamepad/gp_lfg_dps.dds") 
		labelIcon:SetAnchor(TOPRIGHT, label, TOPLEFT, textHeight * -0.25, 0)
		labelIcon:SetMouseEnabled(false)
		labelIcon:SetHidden(true)
	end
	
	PlayerRoleIndicator.UpdateRoleSwitch()
	PlayerRoleIndicator.UpdateAllIconVisuals()
	
	ZO_PreHook(GROUP_LIST, "ShowMenu", function(control)
		local mouseOverControl = WINDOW_MANAGER:GetMouseOverControl()
		local data = ZO_ScrollList_GetData(mouseOverControl)
		if not data then
			mouseOverControl = mouseOverControl:GetParent()
			data = ZO_ScrollList_GetData(mouseOverControl)
		end
		
		if data then
			for _, value in ipairs(PlayerRoleIndicator.savedVariables.customRole) do
				if value.show then
					local playerIndex = 0
					for index, playerName in ipairs(value.players) do
						if playerName == data.displayName then playerIndex = index end
					end
					
					if playerIndex == 0 then
						AddCustomMenuItem(string.format("Add to %s", value.name), function() 
							table.insert(value.players, data.displayName)
							GROUP_LIST:RefreshData()
						end)
					else AddCustomMenuItem(string.format("Remove from %s", value.name), function() 
							table.remove(value.players, playerIndex) 
							GROUP_LIST:RefreshData()
						end)
					end
				end
			end
		end
	end)
	
	ZO_PostHook(GROUP_LIST, "RefreshData", function()
		if not IsUnitGrouped("player") then return end
		local control = ZO_GroupList:GetNamedChild("List"):GetNamedChild("Contents")
		for i=1, control:GetNumChildren(), 1 do
			local icon = control:GetChild(i):GetNamedChild("Leader"):GetNamedChild("Icon")
			
			local data = ZO_ScrollList_GetData(control:GetChild(i))
			if not data then
				data = ZO_ScrollList_GetData(control)
			end
			
			if (data and icon) then
				if data.leader then
					icon:SetTexture("/esoui/art/lfg/lfg_leader_icon.dds")
					icon:SetColor(1, 1, 1, 1)
					icon:SetHidden(false)
				else icon:SetHidden(true) end
				
				for _, value in ipairs(PlayerRoleIndicator.savedVariables.customRole) do
					if value.show then
						local playerIndex = nil
						for index, playerName in ipairs(value.players) do
							if playerName == data.displayName then playerIndex = index end
						end
						
						if playerIndex then
							icon:SetHidden(false)
							icon:SetTexture(value.texturePath)
							icon:SetColor(value.colourAlive.r, value.colourAlive.g, value.colourAlive.b, value.colourAlive.a)
							break
						end
					end
				end
			end
		end
	end)
	
	EVENT_MANAGER:RegisterForUpdate("PlayerRoleIndicatorUpdateIndicators", 10, PlayerRoleIndicator.UpdateIndicators)
	
	EVENT_MANAGER:RegisterForEvent("PlayerRoleIndicatorPlayerLeftGroup", EVENT_GROUP_MEMBER_LEFT, PlayerRoleIndicator.PlayerLeftGroup)
	EVENT_MANAGER:RegisterForEvent("PlayerRoleIndicatorShowNote", EVENT_UNIT_DEATH_STATE_CHANGED, PlayerRoleIndicator.ShowNote)
	
	EVENT_MANAGER:AddFilterForEvent("PlayerRoleIndicatorPlayerLeftGroup", EVENT_GROUP_MEMBER_LEFT, REGISTER_FILTER_UNIT_TAG, "player")
	EVENT_MANAGER:AddFilterForEvent("PlayerRoleIndicatorShowNote", EVENT_UNIT_DEATH_STATE_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, "group")
	
	
	EVENT_MANAGER:UnregisterForEvent(PlayerRoleIndicator.name, EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent(PlayerRoleIndicator.name, EVENT_ADD_ON_LOADED, PlayerRoleIndicator.intialize)