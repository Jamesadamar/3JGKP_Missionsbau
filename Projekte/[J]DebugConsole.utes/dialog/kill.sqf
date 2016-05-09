/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			Tötet alle Einheiten der gegnerischen Seite
	arguments: 			None
	return value:		None

	example call: 		[] execVM "dialog\kill.sqf"
*/

// arguments
_params = _this;

// Öffne Bestötigungsdialog und warte, bis er geschlossen wird
JGKP_DC_command_text = "Alle feindlichen Einheiten töten?";

createDialog "JGKP_ConfirmDialog";

waitUntil { isNull (findDisplay 3101); };

if (JGKP_DC_command_isConfirmed) then {

	{ 
	
		if ([playerSide, side _x] call BIS_fnc_sideIsEnemy) then {
			_x setDamage 1;
		};

	} forEach allUnits;

} else {

	hintSilent "Befehl abgebrochen";

};
