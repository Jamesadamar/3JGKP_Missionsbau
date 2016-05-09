/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			schickt dem Spieler eine Nachricht
	arguments: 			None
	return value:		None

	example call: 		[] execVM "freezePlayer.sqf"
*/
disableSerialization;

// arguments
_params = _this;
_dialog = (findDisplay 3102);
_lstBox = _dialog displayCtrl 1500;

// begin of script
_indices = lbSelection _lstBox; // array
_names = [];
{

	_names pushBack (_lstBox lbText _x);

} forEach _indices;

if (count _names == 0) exitWith {hint "Befehl nicht möglich\nKein Spieler ausgewählt"};

if (count _names > 1) exitWith {hint "Befehl nicht möglich\nMehr als ein Spieler ausgewählt"};

// Nachricht eingeben
createDialog "JGKP_MessageDialog";
waitUntil {isNull findDisplay "JGKP_MessageDialog"};

if (JGKP_DC_message == "") exitWith {hint "Keine Nachricht gesendet"};

_name = _names select 0;
_player = [
  		[_name] call JGKP_DC_fnc_getPlayer,
  		[_name select [0, (_name find " (*)")]] call JGKP_DC_fnc_getPlayer
  	] select (_name find " (*)" != -1);

// Nachricht an Spieler
"Sie erhalten eine Nachricht vom Admin!" remoteExec ["hint", _player, false];
sleep 2;

JGKP_DC_message remoteExec ["hint", _player, false];
