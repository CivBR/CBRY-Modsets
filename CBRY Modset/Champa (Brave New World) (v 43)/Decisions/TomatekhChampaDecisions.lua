--Tomatekh

print("Champa Decisions")

local rIncense = GameInfoTypes.RESOURCE_INCENSE;
local tCalendar = GameInfoTypes.TECH_CALENDAR;
local bClassHarbor = GameInfoTypes.BUILDINGCLASS_HARBOR;
local bChamShipyard = GameInfoTypes.BUILDING_CHAMPA_DECISIONS_DUMMY;
local tNavigation = GameInfoTypes.TECH_NAVIGATION;
local tElectronics = GameInfoTypes.TECH_ELECTRONICS;
local uBattleship = GameInfo.Units.UNIT_BATTLESHIP.ID ;
local uFrigate = GameInfo.Units.UNIT_FRIGATE.ID;
local uGaleass = GameInfo.Units.UNIT_GALLEASS.ID;

--Pirate Fleet

local Decisions_ChamNavy = {}
	Decisions_ChamNavy.Name = "TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_FLEET"
	Decisions_ChamNavy.Desc = "TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_FLEET_DESC"
	HookDecisionCivilizationIcon(Decisions_ChamNavy, "CIVILIZATION_CHAMPA_MOD")
	Decisions_ChamNavy.Weight = nil
	Decisions_ChamNavy.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_CHAMPA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_ChamNavy") == true then
			Decisions_ChamNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_FLEET_ENACTED_DESC")
			return false, false, true
		end		
	
		local pTeam = pPlayer:GetTeam();
		local fUnit = "Naval Unit"
		if (Teams[pTeam]:IsHasTech(tElectronics)) then
			fUnit = "Battleship"
		elseif (Teams[pTeam]:IsHasTech(tNavigation)) then
			fUnit = "Frigate"
		else 
			fUnit = "Galleass"
		end

		Decisions_ChamNavy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_FLEET_DESC", fUnit)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		local cHarbor = pPlayer:GetBuildingClassCount(bClassHarbor)
		if cHarbor < 2 then return true, false end

		return true, true
	end
	)
	
	Decisions_ChamNavy.DoFunc = (
	function(pPlayer)
		local pcCity = pPlayer:GetCapitalCity();
		local pTeam = pPlayer:GetTeam();
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		for pCity in pPlayer:Cities() do
			if pCity:IsCoastal() then
				if not (pCity:IsHasBuilding(bChamShipyard)) then
					pCity:SetNumRealBuilding(bChamShipyard, 1);
				end
			end
		end

		for pCity in pPlayer:Cities() do
			if pCity:IsCoastal() then
				if (Teams[pTeam]:IsHasTech(tElectronics)) then
					pUnit = pPlayer:InitUnit(uBattleship, pCity:GetX(), pCity:GetY(), UNITAI_ASSAULT_SEA);
					pUnit:JumpToNearestValidPlot()
				elseif (Teams[pTeam]:IsHasTech(tNavigation)) then
					pUnit = pPlayer:InitUnit(uFrigate, pCity:GetX(), pCity:GetY(), UNITAI_ASSAULT_SEA);
					pUnit:JumpToNearestValidPlot()
				else 
					pUnit = pPlayer:InitUnit(uGaleass, pCity:GetX(), pCity:GetY(), UNITAI_ASSAULT_SEA);
					pUnit:JumpToNearestValidPlot()
				end
				break
			end
		end

		save(pPlayer, "Decisions_ChamNavy", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CHAMPA_MOD"], "Decisions_ChamNavy", Decisions_ChamNavy)

--Eaglewood

local Decisions_ChamEaglewood = {}
	Decisions_ChamEaglewood.Name = "TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_EAGLEWOOD"
	Decisions_ChamEaglewood.Desc = "TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_EAGLEWOOD_DESC"
	HookDecisionCivilizationIcon(Decisions_ChamEaglewood, "CIVILIZATION_CHAMPA_MOD")
	Decisions_ChamEaglewood.Weight = nil
	Decisions_ChamEaglewood.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_CHAMPA_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_ChamEaglewood") == true then
			Decisions_ChamEaglewood.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_EAGLEWOOD_ENACTED_DESC")
			return false, false, true
		end		

		local pTeam = pPlayer:GetTeam();
		local EraCount = ((Teams[pTeam]:GetCurrentEra()) + 1);
		local iCost = math.ceil((EraCount * 35) * iMod)
		Decisions_ChamEaglewood.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_CHAMPA_EAGLEWOOD_DESC", iCost)

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not (Teams[pTeam]:IsHasTech(tCalendar)) then return true, false end
		local inlandCheck = 0;
		for pCity in pPlayer:Cities() do
			if not pCity:IsCoastal() then
				inlandCheck = 1;
				break
			end
		end
		if inlandCheck <= 0 then return true, false end

		if (Teams[pTeam]:GetHasMetCivCount(1) <= 0) then return true, false end

		return true, true
	end
	)
	
	Decisions_ChamEaglewood.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local pTeam = pPlayer:GetTeam();
		local EraCount = ((Teams[pTeam]:GetCurrentEra()) + 1);
		local iCost = math.ceil((EraCount * 35) * iMod)
		pPlayer:ChangeGold(iCost);

		pPlayer:ChangeNumResourceTotal(rIncense, 2)

		save(pPlayer, "Decisions_ChamEaglewood", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_CHAMPA_MOD"], "Decisions_ChamEaglewood", Decisions_ChamEaglewood)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CHAMPA_MOD"]) then
			if load(pPlayer, "Decisions_ChamNavy") == true then
				for pCity in pPlayer:Cities() do
					if pCity:IsCoastal() then
						if not (pCity:IsHasBuilding(bChamShipyard)) then
							pCity:SetNumRealBuilding(bChamShipyard, 1);
						end
					end
				end
			end
		end
	end
end)