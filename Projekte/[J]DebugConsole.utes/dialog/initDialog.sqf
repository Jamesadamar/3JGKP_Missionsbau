/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			[dialog]
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_display = _this select 0;

// begin of script
// Lade Variable aus profileNamespace
JGKP_DC_Commands = profileNamespace getVariable ["JGKP_DC_Commands",[]];

JGKP_DC_Rows = profileNamespace getVariable ["JGKP_DC_Rows",[]];


// Befülle alle Felder mit den geladenen Werten:
// Rows
{
	
	_inputIDC = _x select 0;
	_code = _x select 1;

	ctrlSetText [_inputIDC, _code];

} forEach JGKP_DC_Rows;