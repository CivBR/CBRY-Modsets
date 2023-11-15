print("UnitLimits loaded!")

function EW_UnitLimits_Check(playerID)
	local pPlayer = Players[playerID]
	local iCap = 10

	--Gold count

	local iGold = math.floor(pPlayer:CalculateGoldRate() / 10)
	if iGold < 0 then iGold = 0 end
	iCap = iCap + iGold

	--City, City Training, and Population count
	for pCity in pPlayer:Cities() do
		local iPop = math.floor(pCity:GetPopulation() / 2)
		iCap = iCap + iPop + 5
	end

	--Unit count

	local iUnits = 0

	for pUnit in pPlayer:Units() do
		iUnits = iUnits + 1
	end

	--Change Interface for Human Player
	if pPlayer:IsHuman() then
		Controls.EW_Limit:SetText("Unit Limit: " .. iUnits .. "/" .. iCap)

	end

	return iCap, iUnits
end

function EW_UnitLimits_Roundabout(playerID)
	local iCap, iUnits = EW_UnitLimits_Check(playerID)
end

GameEvents.PlayerDoTurn.Add(EW_UnitLimits_Roundabout)

function EW_UnitLimits_CanTrain(playerID)
	local pPlayer = Players[playerID]

	local iCap, iUnits = EW_UnitLimits_Check(playerID)

	--Maintenance Check
	if pPlayer:CalculateGoldRate() <= 0 then

		return false
	end

	--Limit Check

	if iUnits >= iCap then

		return false
	end

	return true
end
GameEvents.CityCanTrain.Add(EW_UnitLimits_CanTrain)

--Load for active player

function EW_UnitLimits_GameLoad()
	local activePlayerID = Game.GetActivePlayer()
	EW_UnitLimits_Check(activePlayerID)
end

Events.SequenceGameInitComplete.Add(EW_UnitLimits_GameLoad)
Events.SerialEventUnitInfoDirty.Add(EW_UnitLimits_GameLoad)

--Advanced UI

include("InstanceManager");

local tPlayers = {}
function EW_CheckPlayers()
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() and (not pPlayer:IsHuman()) and (not pPlayer:IsBarbarian()) then
			tPlayers[iPlayer] = pPlayer
		end
	end
end

Events.SequenceGameInitComplete.Add(EW_CheckPlayers)

local pInstance = InstanceManager:new("EW_Instance", "EW_Grid", Controls.EW_Stack)

Controls.EW_Block:SetHide(true)

function EW_OnOpen()
	--List for each player
	for k, v in pairs(tPlayers) do
		local tLimit = pInstance:GetInstance()
		local iCap, iUnits = EW_UnitLimits_Check(k)

		tLimit.EW_Cap:SetText(v:GetName() .. ": " .. iUnits .. "/" .. iCap)

	end
	--Scroll Adjustment
	Controls.EW_Stack:CalculateSize()
	Controls.EW_Stack:ReprocessAnchoring()
	Controls.EW_List:CalculateInternalSize()
	--Reveal
	Controls.EW_Block:SetHide(false)
end

Controls.EW_Limit:RegisterCallback(Mouse.eLClick, EW_OnOpen)

function EW_OnClose()
	Controls.EW_Block:SetHide(true)
	pInstance:ResetInstances()
end

Controls.EW_Close:RegisterCallback(Mouse.eLClick, EW_OnClose)

Controls.EW_Limit:SetHide(true)