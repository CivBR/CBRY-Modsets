-- Philippines_Functions
-- Authors: JFD, Vicevirtuoso
-- DateCreated: 2/3/2014 6:04:01 AM
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
print ("The Republic of the Philippines dawns")
----------------------------------------------------------------------------------------------------------------------------
-- JFD_KatipuneroIdeologyBonus
----------------------------------------------------------------------------------------------------------------------------
function JFD_KatipuneroIdeologyBonus(playerID, policyTypeID)
	local player = Players[playerID]
	local policyLevel = GameInfo.Policies[policyTypeID].Level
	if policyLevel == 1 then
		if not player:GetCapitalCity():IsHasBuilding(GameInfoTypes["BUILDING_JFD_KATIPUNERO_IDEOLOGY"]) then
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_KATIPUNERO_IDEOLOGY"], 1)
		end
		
		for unit in player:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_JFD_KATIPUNERO"] then
				if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_JFD_KATIPUNAN"]) then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_JFD_KATIPUNAN"], true)
				end
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_KatipuneroIdeologyBonus)
----------------------------------------------------------------------------------------------------------------------------
-- JFD_KatipuneroMovementBonus
----------------------------------------------------------------------------------------------------------------------------
function JFD_KatipuneroMovementBonus(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_PHILIPPINES"] and player:IsAlive() then
		local inFriendlyTerritory = false
		local unit = player:GetUnitByID(unitID)
		if not unit:IsDead() and unit:GetUnitType() == GameInfoTypes["UNIT_JFD_KATIPUNERO"] then
			if Map.GetPlot(unit:GetX(), unit:GetY()):GetOwner() == playerID then
				inFriendlyTerritory = true
			end
		end
		
		if inFriendlyTerritory then
			if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_MOVES_I"], true)
			end
		else
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_EXTRA_MOVES_I"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_MOVES_I"], false)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_KatipuneroMovementBonus) 
----------------------------------------------------------------------------------------------------------------------------
-- JFD_PhilippineCoralChurchBonus
----------------------------------------------------------------------------------------------------------------------------
function JFD_PhilippineCoralChurchBonus(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_PHILIPPINES"] then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CORAL_CHURCH"]) then
				numSeaResources = 0; 
				for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
					local plot = city:GetCityIndexPlot(cityPlot)
					if plot then
						if plot:GetOwner() == playerID then
							if city:IsWorkingPlot(plot) then
								if plot:IsWater() then 
									if plot:GetResourceType(-1) ~= -1 then
										numSeaResources = numSeaResources + 1;
									end
								end
							end
						end
					end
				end

				if numSeaResources then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_CORAL_CHURCH_GROWTH"], numSeaResources)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_PhilippineCoralChurchBonus)
--==========================================================================================================================
--==========================================================================================================================

--****************************************************************************************************************
--****************************************************************************************************************
--All Lua above this line coded by JFD and Neirai. All Lua below this line coded by Vicevirtuoso.
--****************************************************************************************************************
--****************************************************************************************************************


--Utilizes TableSaverLoader by Pazyryk to keep track of whether or not Open Borders was active last turn for each other Civ.
include ("TableSaverLoader016.lua")

--Localize any pertinent data for increased processing speed.
local iMaxMajors = GameDefines.MAX_MAJOR_CIVS

local iPhilippines = GameInfoTypes.CIVILIZATION_JFD_PHILIPPINES
local iCultureDummy = GameInfoTypes.BUILDING_JFD_PHILIPPINES_CULTURE_DUMMY  --make this a building whose BuildingClass has NoLimit as "true" and provides however much Culture desired per unit
local iCargoShip = GameInfoTypes.UNIT_CARGO_SHIP

--Global table for TableSaverLoader
MapModData.gT = MapModData.gT or {}
gT = MapModData.gT

gT.CLPOpenBorders = {}


function DataLoad()
	local bNewGame = not TableLoad(gT, "CLPhilippines")

	-- < mod-specific init code here depending on bNewGame >

	TableSave(gT, "CLPhilippines")  --before the initial autosave that runs for both new and loaded games
end


--Function loops through all opponents at the beginning of Philippines turn. For each opponent, it checks if they are NOT at war with the Philippines and DO have Open Borders. If both of these
--conditions are true, loop through all of that opponent's units, and provide a dummy building for each unit in the Philippines' territory.
function PhilippinesCulturePerUnit(iPlayer)
	local pPlayer = Players[iPlayer]
	if iPlayer < iMaxMajors and pPlayer:IsEverAlive() then
		if pPlayer:GetCivilizationType() == iPhilippines then
			local iNumBuildings = 0
			for iEnemyPlayer = 0, iMaxMajors - 1, 1 do
				if iEnemyPlayer ~= iPlayer then
					local pEnemyPlayer = Players[iEnemyPlayer]
					local iTeam = pPlayer:GetTeam()
					local pTeam = Teams[iTeam]
					local iEnemyTeam = pEnemyPlayer:GetTeam()
					local pEnemyTeam = Teams[iEnemyTeam]
					--Check for both NOT at war and DO have Open Borders. It shouldn't be possible for both war and OB at the same time, but you never know...
					if not pEnemyTeam:IsAtWar(iTeam) and pTeam:IsAllowsOpenBordersToTeam(iEnemyTeam) then
						for pUnit in pEnemyPlayer:Units() do
							if pUnit:GetPlot():GetOwner() == iPlayer then
								iNumBuildings = iNumBuildings + 1
							end
						end
					end
				end
			end
			--The dummies are provided to the player's Capital.
			pPlayer:GetCapitalCity():SetNumRealBuilding(iCultureDummy, iNumBuildings)					
		end
	end
end

GameEvents.PlayerDoTurn.Add(PhilippinesCulturePerUnit)


--Function checks if Open Borders was active last turn (using the global table) and this turn (using regular functions) if the Civ is Philippines.
--If mutual Open Borders IS active this turn AND was NOT active last turn, grant both civs a free Cargo Ship (if they have enough available Trade Routes).

function PhilippinesCargoShips(iPlayer)
	local pPlayer = Players[iPlayer]
	if iPlayer < iMaxMajors and pPlayer:IsEverAlive() then
		if pPlayer:GetCivilizationType() == iPhilippines then
			if not gT.CLPOpenBorders[iPlayer] then
				gT.CLPOpenBorders[iPlayer] = {}
				for i = 0, iMaxMajors - 1, 1 do
					gT.CLPOpenBorders[iPlayer][i] = false
				end
			end
			for iEnemyPlayer, bIsOpenBordersLastTurn in pairs(gT.CLPOpenBorders[iPlayer]) do
				if iEnemyPlayer ~= iPlayer then
					--First determine if this turn has mutual open borders. This will be used both to determine whether to grant a cargo ship and
					--to update the value in the global table
					local bIsThisTurnOpenBorders = false;
					local pEnemyPlayer = Players[iEnemyPlayer]
					local iTeam = pPlayer:GetTeam()
					local pTeam = Teams[iTeam]
					local iEnemyTeam = pEnemyPlayer:GetTeam()
					local pEnemyTeam = Teams[iEnemyTeam]
					if pTeam:IsAllowsOpenBordersToTeam(iEnemyTeam) and pEnemyTeam:IsAllowsOpenBordersToTeam(iTeam) then
						bIsThisTurnOpenBorders = true
					end
					if bIsOpenBordersLastTurn == false and bIsThisTurnOpenBorders == true then --time to grant Cargo Ships!
						--Grant to a Civ only if they A) have at least 1 trade route open and B) have at least one coastal city. Will spawn in the oldest coastal city.
						--It is possible for only one of the Civs to get a cargo ship if only one meets the requirements!
						if (pPlayer:GetNumInternationalTradeRoutesAvailable() - pPlayer:GetNumInternationalTradeRoutesUsed()) > 0 then
							for pCity in pPlayer:Cities() do
								if pCity:IsCoastal() then
									pPlayer:InitUnit(iCargoShip, pCity:GetX(), pCity:GetY(), UNITAI_TRADE_UNIT)
									break
								end
							end
						end
						if (pEnemyPlayer:GetNumInternationalTradeRoutesAvailable() - pEnemyPlayer:GetNumInternationalTradeRoutesUsed()) > 0 then
							for pCity in pEnemyPlayer:Cities() do
								if pCity:IsCoastal() then
									pEnemyPlayer:InitUnit(iCargoShip, pCity:GetX(), pCity:GetY(), UNITAI_TRADE_UNIT)
									break
								end
							end
						end
					end
					gT.CLPOpenBorders[iPlayer][iEnemyPlayer] = bIsThisTurnOpenBorders
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(PhilippinesCargoShips)


DataLoad()


------TableSaverLoader------------------------------------------------
function OnEnterGame()   --Runs when Begin or Continue Your Journey pressed
	print("Player entering game ...")
	ContextPtr:LookUpControl("/InGame/GameMenu/SaveGameButton"):RegisterCallback(Mouse.eLClick, SaveGameIntercept)
	ContextPtr:LookUpControl("/InGame/GameMenu/QuickSaveButton"):RegisterCallback(Mouse.eLClick, QuickSaveIntercept)
	TableSave(gT, "CLPhilippines")	--before the "Initial" autosave; this is extra on a post-turn-0 game load but won't hurt
end
Events.LoadScreenClose.Add(OnEnterGame)

function SaveGameIntercept()	--overrides Civ5 code when player presses Save Game from Game Menu or Cntr-s
	TableSave(gT, "CLPhilippines")
	UIManager:QueuePopup(ContextPtr:LookUpControl("/InGame/GameMenu/SaveMenu"), PopupPriority.SaveMenu)
end

function QuickSaveIntercept()	--overrides Civ5 code when player presses Quick Save from Game Menu or F11
	TableSave(gT, "CLPhilippines")
	UI.QuickSave()
end

local autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
function OnGameOptionsChanged()
	autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
end
Events.GameOptionsChanged.Add(OnGameOptionsChanged)

function OnAIProcessingEndedForPlayer(iPlayer)
	if iPlayer == 63 then					--runs on barb turn AFTER barb unit moves (very close to the regular autosave)
		if Game.GetGameTurn() % autoSaveFreq == 0 then	--only need to do on autosave turns
			TableSave(gT, "CLPhilippines")
		end
	end
end
Events.AIProcessingEndedForPlayer.Add(OnAIProcessingEndedForPlayer)


--Input handler for custom missions and saving
function InputHandler( uiMsg, wParam, lParam )
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_F11 then
			QuickSaveIntercept()		--F11 Quicksave
        		return true
		elseif wParam == Keys.S and UIManager:GetControl() then
			SaveGameIntercept()			--ctrl-s
			return true
		end
	end
end
ContextPtr:SetInputHandler( InputHandler );