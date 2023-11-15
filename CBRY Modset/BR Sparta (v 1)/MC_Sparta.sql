ALTER TABLE Traits ADD COLUMN 'UnitPerCapitalGrowths' INTEGER DEFAULT 0;

--YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_SPARTA',						27,		53,		null,	null);