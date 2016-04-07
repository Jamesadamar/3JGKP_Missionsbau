/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			speichert Variablen dauerhaft im profileNamespace
	arguments: 			None
	return value:		None

	example call: 		beim Schließen des Dialogs durch ui eventhandler onUnload
*/
disableSerialization;

private ["_params", "_display", "_rows"];
hint "schluss";

// arguments
_params = _this;
_display = _this select 0;

// begin of script
_rows = [1400,1402,1404,1406,1408];

{
	_code = ctrlText _x;
	
	JGKP_DC_Rows set [_forEachIndex, [_x, _code]];
} forEach _rows;

profileNamespace setVariable ["JGKP_DC_Rows", JGKP_DC_Rows];

