// später beim Addon austauschen!
JGKP_DC_fnc_calcValue = compile preprocessFileLineNumbers "functions\fn_calcValue.sqf";

JGKP_DC_fnc_storeVariables = compile preprocessFileLineNumbers "functions\fn_storeVariables.sqf";

// muss in einem externen Prozess laufen
// Beispiel für Lesbarkeit!
[] spawn {
	waitUntil {!(isNull findDisplay 46)};
	(findDisplay 46) displayAddEventHandler [
		"KeyDown", 
		{
			_key = _this select 1; // DIC number
			_shift = _this select 2; // bool

			if (_key == 41 && _shift) then {
				createDialog "JGKP_DC";
			};
		}
	]; 
};
