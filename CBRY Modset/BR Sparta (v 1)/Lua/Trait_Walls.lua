print( "Loaded." )

--[[-----------------------------------------
Name:		 GetCivSpecificUnit
Purpose: 	 Get the UnitType for a specific
civ from a UnitClassType.
-------------------------------------------]]
function fnGetCivSpecificUnit( pPly, sUnitClass ) -- Thanks whoward69

	-- BEGIN DEFINES
	local sUnitType = nil
	local sCivType 	= GameInfo.Civilizations[ pPly:GetCivilizationType() ].Type
	-- END DEFINES

	--[[ Loop through civilization-specific UnitClass overrides, id est their unique units, and 
	yield to be returned the proper UnitType. --]]
	for pOverride in GameInfo.Civilization_UnitClassOverrides{ CivilizationType = sCivType,
	UnitClassType = GameInfo.UnitClasses[ sUnitClass ].Type } do

		sUnitType = pOverride.UnitType
		break

	end

	-- If we didn't get anything, yield to be returned the default UnitType for the UnitClass.
	if sUnitType == nil then

		sUnitType = GameInfo.UnitClasses[ sUnitClass ].DefaultUnit

	end

	-- Give whatever function called this the UnitType we yielded.
	return GameInfo.Units[ sUnitType ].ID

end

--[[-----------------------------------------
Name:  		ReturnBestInfantryUnit
Purpose:	Return the best land melee unit
that a city can build.  
-------------------------------------------]]
function fnReturnBestInfantryUnit( pPly, pCity )

	local possibleUnitClasses = { 
	GameInfo.UnitClasses.UNITCLASS_MECH.ID,
	GameInfo.UnitClasses.UNITCLASS_MECHANIZED_INFANTRY.ID, 
	GameInfo.UnitClasses.UNITCLASS_INFANTRY.ID, 
	GameInfo.UnitClasses.UNITCLASS_GREAT_WAR_INFANTRY.ID, 
	GameInfo.UnitClasses.UNITCLASS_RIFLEMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_MUSKETMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_LONGSWORDSMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_PIKEMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_SWORDSMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_SPEARMAN.ID, 
	GameInfo.UnitClasses.UNITCLASS_WARRIOR.ID
	} -- Thanks whoward69
	--END DEFINES
	
	-- Loop through each UnitClassType in the above defined table, see if the city can 
	-- train it's owner's specific UnitType.  Yield to be returned the best land melee 
	-- UnitType the city can build.
	for _, iUnitClass in ipairs( possibleUnitClasses ) do -- Thanks whoward69

		if pCity:CanTrain( fnGetCivSpecificUnit( pPly, iUnitClass ) ) then

			return fnGetCivSpecificUnit( pPly, iUnitClass )

		end

	end

	-- Uh-oh!
	return GameInfoTypes.UNIT_WARRIOR

end

GameEvents.SetPopulation.Add( 

function( xOffset, yOffset, fOldPop, fNewPop )

	-- BEGIN DEFINES
	local pPlot				= Map.GetPlot( xOffset, yOffset )
	local pCity  			= pPlot:GetPlotCity()
	local iPlyID 			= pCity:GetOwner()
	local pPly				= Players[ iPlyID ] -- Dat Datatype Mismatch, son
	local iUnitMostCurrent	= nil
	local pLeader			= GameInfo.Leaders[ pPly:GetLeaderType() ]
	local iLeaderTrait		= GameInfo.Leader_Traits("LeaderType ='" .. pLeader.Type .. "'")()
	local pTrait			= GameInfo.Traits[ iLeaderTrait.TraitType ]
	local nTrait			= pTrait.UnitPerCapitalGrowths
	local nZenith			= math.floor( pCity:GetHighestPopulation() )
	-- END DEFINES

	--[[ On every growth of every city, run through the following list of conditions:
	1:  Does the city's owner have the trait, and is its population evenly divisible 
	by the trait?
	2:  Is the city a capital?
	3:  Has the city grown instead of shrinking, and is this the city's highest 
	population?

	If all of the above are true, get the best land infantry unit we can, and 
	spawn it at the city. --]]

	if ( ( nTrait > 0 ) and ( math.floor( fNewPop ) % nTrait ) == 0 ) then 

		if pCity:IsCapital() then

			if ( ( fNewPop > fOldPop ) and ( fNewPop >= nZenith ) ) then

				iUnitMostCurrent = fnReturnBestInfantryUnit( pPly, pCity )

				pPly:AddFreeUnit( iUnitMostCurrent )

			end
		end

	end

end )