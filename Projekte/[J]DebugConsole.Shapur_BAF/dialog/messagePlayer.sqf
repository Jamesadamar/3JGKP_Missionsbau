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
waitUntil {isNull (findDisplay 3103)};

{

	if (JGKP_DC_message == "") exitWith {hint "Keine Nachricht gesendet"};

	_player = [
	  		[_x] call JGKP_DC_fnc_getPlayer,
	  		[_x select [0, (_x find " (*)")]] call JGKP_DC_fnc_getPlayer
	  	] select (_x find " (*)" != -1);

	// Nachricht an Spieler
	"Sie erhalten eine Nachricht vom Admin!" remoteExec ["hint", _player, false];
	sleep 2;

	JGKP_DC_message remoteExec ["hint", _player, false];

	// log
	["jgkp_log_action", [getPlayerUID player, "DebugConsole", format["[player, %1, %2, %3]", name _player, "message", JGKP_DC_message]]] call CBA_fnc_clientToServerEvent;

} forEach _names;