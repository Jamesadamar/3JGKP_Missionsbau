/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			0: dialog (dialog)
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_dialog = _this select 0;

// begin of script
_lstBox = _dialog displayCtrl 1500;

{

	if (!simulationEnabled _x) then {

		_lstBox lbAdd ((name _x) + " (*)");

	} else {

		_lstBox lbAdd (name _x); // Anzeigename

	};

	_lstBox lbSetData [_forEachIndex, getPlayerUID _x]; // Player UID als Identifikator

} forEach allPlayers - entities "HeadlessClient_F";

// DEAKTIVIERE BUTTON GEMÄß ACCESS LEVEL
_access_options = JGKP_DC_access_level select JGKP_DC_level;

hintSilent format["Zugangslevel:\n%1", _access_options select 1];

{

	_idc = _x;
	ctrlEnable [_idc, false];

} forEach (_access_options select 3); // Klammern...
