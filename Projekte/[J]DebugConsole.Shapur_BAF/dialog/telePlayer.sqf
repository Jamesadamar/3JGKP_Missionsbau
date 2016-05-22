/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			teleportiert markierte Spieler zum Admin
	arguments: 			None
	return value:		None

	example call: 		[] execVM "telePlayer.sqf"
*/
disableSerialization;

// arguments
_params = _this;
_dialog = (findDisplay 3102);
_lstBox = _dialog displayCtrl 1500;

// begin of script
// return all selected indices and find corresponding player objects
_indices = lbSelection _lstBox; // array
_names = [];
{

	_names pushBackUnique (_lstBox lbText _x);

} forEach _indices;

if (count _names == 0) exitWith {hint "Befehl nicht möglich\nKein Spieler ausgewählt"};

{
  
  // retrieve player object from player name and teleport to admin (player using console)
  _player = [
  		[_x] call JGKP_DC_fnc_getPlayer,
  		[_x select [0, (_x find " (*)")]] call JGKP_DC_fnc_getPlayer
  	] select (_x find " (*)" != -1);

  // Nachricht an Spieler
  "Sie werden zum Admin teleportiert!" remoteExec ["hint", _player, false];
  sleep 1;

  _player setpos getpos player;

  // log
  ["jgkp_log_action", [getPlayerUID player, "DebugConsole", format["[player, %1, %2]", name _player, "telePlayer"]]] call CBA_fnc_clientToServerEvent;

} forEach _names;

