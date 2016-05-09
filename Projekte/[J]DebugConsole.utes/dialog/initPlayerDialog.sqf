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

	_lstBox lbAdd (name _x); // Anzeigename
	_lstBox lbSetData [_forEachIndex, _x]; // eigentliches Objekt

} forEach allPlayers;