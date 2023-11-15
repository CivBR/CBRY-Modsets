-- TotemicLineage
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("IconSupport")
include("InstanceManager")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "MC_TotemicLineage";

--=======================================================================================================================
-- Initial Defines
--=======================================================================================================================
iActivePlayer = Game.GetActivePlayer()
pActivePlayer = Players[iActivePlayer]

iCiv 						= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE

iMod = (GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100
tFadeColorRV = {x = 1, y = 1, z = 1, w = 0.2}
tFullColor = {x = 1, y = 1, z = 1, w = 1}

iDeltaCost = 0
iMinCost = 0

iCiv = GameInfoTypes.CIVILIZATION_MC_ZIMBABWE
tDummyBuildings = {
	GameInfoTypes.BUILDING_MC_TOTEM_1,
	GameInfoTypes.BUILDING_MC_TOTEM_2,
	GameInfoTypes.BUILDING_MC_TOTEM_4,
	GameInfoTypes.BUILDING_MC_TOTEM_8,
}
tPolicies = {
	GameInfo.Policies.POLICY_MC_ZIMBABWE_MHARA,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_NYATI,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_DZIVA,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_MBIZI,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_HOVE,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_NZOU,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_NHEWA,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_NGARA,
	GameInfo.Policies.POLICY_MC_ZIMBABWE_MOYO,
}
iRozwi = GameInfoTypes.POLICY_MC_ZIMBABWE_MOYO_EVENT

bHidePolicyStack = true

g_PolicyStack = InstanceManager:new("PolicyButton", "PolicyIcon", Controls.PolicyStack)
iScreenX, iScreenY = UIManager:GetScreenSizeVal()
--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive
-------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

if not(JFD_IsCivilisationActive(iCiv)) then return end
bIsCivActive				= JFD_IsCivilisationActive(iCiv)
-------------------------------------------------------------------------------------------------------------------------
-- IsBuildingReal
-------------------------------------------------------------------------------------------------------------------------
function IsBuildingReal(iBuilding)
	if((GameInfo.Buildings[iBuilding].GreatWorkCount == -1) or ((GameInfo.Buildings[iBuilding].PrereqTech == nil) and ((GameInfo.Buildings[iBuilding].FaithCost == -1) and (GameInfo.Buildings[iBuilding].Cost == -1 )))) then
		return false
	else
		return true
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
-------------------------------------------------------------------------------------------------------------------------
function GetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end
-------------------------------------------------------------------------------------------------------------------------
-- ToBits
-------------------------------------------------------------------------------------------------------------------------
function ToBits(iNum)
    -- returns a table of bits, least significant first.
    tTable = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,} -- will contain the bits
    local iKey = 1
    while iNum > 0 do
        local iRest = math.fmod(iNum, 2)
        tTable[iKey] = iRest
        iKey = iKey + 1
        iNum = (iNum - iRest) / 2
    end
    return tTable
end
-------------------------------------------------------------------------------------------------------------------------
-- GetCurrentThreshold
-------------------------------------------------------------------------------------------------------------------------
function GetCurrentThreshold(pPlayer)
	local iLevel = load(pPlayer, "Level") or 0
	local iCost = iMinCost + (iLevel * iDeltaCost)
	return (iCost * 10)
end
-------------------------------------------------------------------------------------------------------------------------
-- Create Policy Icons
-------------------------------------------------------------------------------------------------------------------------
tPolicyIcons = {}
for iNum, tPolicy in ipairs(tPolicies) do
	local tInstance = g_PolicyStack:GetInstance()
	tInstance.PolicyIcon:LocalizeAndSetToolTip(tPolicy.Help)

	tInstance.PolicyIcon:RegisterCallback(Mouse.eLClick, 
		function()
			Totem_FoundClan(iActivePlayer, tPolicy.ID)
		end
	)

	table.insert(tPolicyIcons, tInstance)
end
tPolicyStack = Controls.PolicyStack
tPolicyStack:ReprocessAnchoring()
--tPolicyStack:SetOffsetX((iScreenX - tPolicyStack:GetSizeX())/2)
-------------------------------------------------------------------------------------------------------------------------
-- Define Variables
-------------------------------------------------------------------------------------------------------------------------
local tBuildingCosts = {}
local tAccountedCosts = {}

for tBuilding in GameInfo.Buildings() do
	local iBuilding = tBuilding.ID
	local tBuildingClass = GameInfo.BuildingClasses[GameInfo.Buildings[iBuilding].BuildingClass]

	if (IsBuildingReal(iBuilding)) then
		if tBuildingClass.MaxGlobalInstances == -1 and tBuildingClass.MaxPlayerInstances == -1 and tBuildingClass.MaxPlayerInstances == -1 then

			local iCost = tBuilding.Cost
			if not(tAccountedCosts[iCost]) and iCost > 0 then
				--print(tBuilding.Type, iCost)
				table.insert(tBuildingCosts, iCost)
				tAccountedCosts[iCost] = 1
			end

		end
	end
end

table.sort(tBuildingCosts)

local iCurrentCost = tBuildingCosts[1]

for iNum, iCost in ipairs(tBuildingCosts) do
	iDeltaCost = iDeltaCost + (iCost - iCurrentCost)
	iCurrentCost = iCost
end
iDeltaCost = math.ceil(iMod * (iDeltaCost/#tBuildingCosts))
iMinCost = math.ceil(tBuildingCosts[1] * iMod)

IconHookup(0, 64, 'MC_ZIMBABWE_ATLAS', Controls.TotemicImage)
--=======================================================================================================================
-- Main
--=======================================================================================================================
-- Totem_CityConstructed
-------------------------------------------------------------------------------------------------------------------------
function Totem_CityConstructed(iOwner, iCity, iBuilding, bGold, bFaithOrCulture)
	
	if bGold or bFaithOrCulture then return end
	--print(bGold, bFaithOrCulture)
	
	local pPlayer = Players[iOwner]
	if pPlayer:GetCivilizationType() ~= iCiv then return end

	local tBuilding = GameInfo.Buildings[iBuilding]
	if tBuilding.Cost < 1 then return end

	local iCost = math.floor((tBuilding.Cost * iMod) + 0.5)
	if pPlayer:HasPolicy(GameInfoTypes.POLICY_DECISIONS_ZIMBABWEMASONRY) then
		iCost = math.floor(iCost * 1.2)
	end

	local iCurrentProgress = load(pPlayer, "CurrentProgress") or 0
	local iNewProgress = iCurrentProgress + iCost

	local iThreshold = GetCurrentThreshold(pPlayer)
	if iNewProgress >= iThreshold then
		local iLevel = load(pPlayer, "Level") or 0
		save(pPlayer, "Level", iLevel + 1)

		local iNumToAdopt = load(pPlayer, "NumToAdopt") or 0
		save(pPlayer, "NumToAdopt", iNumToAdopt + 1)

		iNewProgress = iNewProgress - iThreshold
	end
	
	save(pPlayer, "CurrentProgress", iNewProgress)

	if iOwner == iActivePlayer then UpdateMeter() end
end
GameEvents.CityConstructed.Add(Totem_CityConstructed)
--------------------------------------------------------------
-- Totem_PlayerDoTurn
--------------------------------------------------------------
function Totem_PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= iCiv) then return end

	local tAdoptable = {}
	local iNumPolicies = 0
	for iNum, tPolicy in ipairs(tPolicies) do
		if tPolicy.Type == "POLICY_MC_ZIMBABWE_MOYO" then
			if not(pPlayer:HasPolicy(tPolicy.ID)) and pPlayer:HasPolicy(iRozwi) then
				table.insert(tAdoptable, tPolicy)
			end
		elseif pPlayer:HasPolicy(tPolicy.ID) then
			iNumPolicies = iNumPolicies + 1
		else
			table.insert(tAdoptable, tPolicy)
		end
	end

	local iNumToAdopt = load(pPlayer, "NumToAdopt") or 0
	if not(pPlayer:IsHuman()) then
		if #tAdoptable > 0 then
			if iNumToAdopt > 0 then
				local tPolicyToAdopt = tAdoptable[GetRandom(0, #tAdoptable)]
				if tPolicyToAdopt then
					Totem_FoundClan(iPlayer, tPolicyToAdopt.ID)
					iNumPolicies = iNumPolicies + 1
				end
			end
		end
	else
		if (iNumToAdopt > 0) and (#tAdoptable > 0) then
			bHidePolicyStack = false
		end
		if iPlayer == iActivePlayer then UpdateMeter() end
	end


	local tNum = ToBits(iNumPolicies)
	for pCity in pPlayer:Cities() do
		if pCity:IsCapital() then
			for iNum, iBuilding in ipairs(tDummyBuildings) do
				pCity:SetNumRealBuilding(iBuilding, tNum[iNum])
			end
		else
			for iNum, iBuilding in ipairs(tDummyBuildings) do
				pCity:SetNumRealBuilding(iBuilding, 0)
			end
		end
	end
end
if bIsCivActive then GameEvents.PlayerDoTurn.Add(Totem_PlayerDoTurn) end
--------------------------------------------------------------
-- Totem_CityCaptureComplete
--------------------------------------------------------------
function Totem_CityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
	Totem_PlayerDoTurn(iOldOwner)
	Totem_PlayerDoTurn(iNewOwner)
end
if bIsCivActive then GameEvents.CityCaptureComplete.Add(Totem_CityCaptureComplete) end
-------------------------------------------------------------------------------------------------------------------------
-- Totem_ActivePlayerTurnEnd
-------------------------------------------------------------------------------------------------------------------------
function Totem_ActivePlayerTurnEnd(iPlayer)
	if bHidePolicyStack ~= true then
		bHidePolicyStack = true
		UpdateMeter()
	end
end
Events.ActivePlayerTurnEnd.Add(Totem_ActivePlayerTurnEnd)
-------------------------------------------------------------------------------------------------------------------------
-- Totem_FoundClan
-------------------------------------------------------------------------------------------------------------------------
function Totem_FoundClan(iPlayer, iPolicy)
	pPlayer = Players[iPlayer]

	if iPolicy == GameInfoTypes.POLICY_MC_ZIMBABWE_MOYO then
		pPlayer:ChangeNumResourceTotal(GameInfoTypes.RESOURCE_IRON, 4)
	end
	pPlayer:SetNumFreePolicies(1)
	pPlayer:SetNumFreePolicies(0)
	pPlayer:SetHasPolicy(iPolicy, true)

	local iNumToAdopt = load(pPlayer, "NumToAdopt") or 0
	save(pPlayer, "NumToAdopt", iNumToAdopt - 1)

	if iPlayer == iActivePlayer then
		bHidePolicyStack = true
		UpdateMeter()
	end

	Totem_PlayerDoTurn(iPlayer)
end
-------------------------------------------------------------------------------------------------------------------------
-- Enter/Exit CityScreen
-------------------------------------------------------------------------------------------------------------------------
if pActivePlayer:GetCivilizationType() == iCiv then

	function EventEnterCityScreen()
		Controls.Container:SetHide(true)
	end
	Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen)

	function EventExitCityScreen()
		Controls.Container:SetHide(false)
	end
	Events.SerialEventExitCityScreen.Add(EventExitCityScreen)

end
-------------------------------------------------------------------------------------------------------------------------
-- UpdateMeter
-------------------------------------------------------------------------------------------------------------------------
function UpdateMeter()

	local iCurrentProgress = load(pActivePlayer, "CurrentProgress") or 0
	local iCurrentThreshold = GetCurrentThreshold(pActivePlayer)
	local iLevel = load(pPlayer, "Level") or 0

	local sTooltip = Locale.ConvertTextKey("TXT_KEY_TRAIT_TOTEMIC_LINEAGE_TOOLTIP", iCurrentProgress, iCurrentThreshold, iCurrentThreshold - iCurrentProgress)
	if iLevel >= #tPolicies then
		sTooltip = Locale.ConvertTextKey("TXT_KEY_TRAIT_TOTEMIC_LINEAGE_TOOLTIP_COMPLETE")
		iCurrentProgress = 0
	end

	Controls.TotemicMeter:SetPercent(iCurrentProgress/iCurrentThreshold)
	Controls.Container:SetToolTipString(sTooltip)
	Controls.TotemicFrame:SetToolTipString(sTooltip)	

	Controls.PolicyStackContainer:SetHide(bHidePolicyStack)
	if bHidePolicyStack then return end

	local iNumToAdopt = load(pActivePlayer, "NumToAdopt") or 0
	for iNum, tInstance in ipairs(tPolicyIcons) do
		local iPolicy = tPolicies[iNum].ID
		tInstance.PolicyImage:SetColor(tFullColor)
		if pActivePlayer:HasPolicy(iPolicy) then
			tInstance.PolicyImage:SetTexture("ZimbabwePolicy_64Gold.dds")
			tInstance.PolicyIcon:SetDisabled(true)
			tInstance.MouseOverContainer:SetHide(true)
		else
			tInstance.PolicyImage:SetTexture("ZimbabwePolicy_64.dds")
			--print(tPolicies[iNum].Type, (iPolicy == GameInfoTypes.POLICY_MC_ZIMBABWE_MOYO) and not(pActivePlayer:HasPolicy(iRozwi)))
			if (iNumToAdopt < 1) or ((iPolicy == GameInfoTypes.POLICY_MC_ZIMBABWE_MOYO) and not(pActivePlayer:HasPolicy(iRozwi)))  then
				tInstance.PolicyImage:SetColor(tFadeColorRV)
				tInstance.PolicyIcon:SetDisabled(true)
				tInstance.MouseOverContainer:SetHide(true)
			else
				tInstance.PolicyIcon:SetDisabled(false)
				tInstance.MouseOverContainer:SetHide(false)
			end
		end
	end

end
-------------------------------------------------------------------------------------------------------------------------
-- ToggleHide
-------------------------------------------------------------------------------------------------------------------------
function ToggleHide()
	bHidePolicyStack = not bHidePolicyStack
	UpdateMeter()
end
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
if pActivePlayer:GetCivilizationType() ~= iCiv then
	Controls.Container:SetHide(true)

	UpdateMeter = function()
		Controls.Container:SetHide(true)
		return
	end
else
	Controls.Container:SetHide(false)

	Controls.Container:RegisterCallback(Mouse.eLClick, ToggleHide)
	Controls.TotemicFrame:RegisterCallback(Mouse.eLClick, ToggleHide)

	UpdateMeter()
end
--=======================================================================================================================
--=======================================================================================================================