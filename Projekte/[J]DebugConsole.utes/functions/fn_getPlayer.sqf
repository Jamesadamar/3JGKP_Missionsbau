/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			return player object with given name
	arguments: 			0: name (string): name of player
	return value:		player (object)

	example call: 		["Max"] execVM "fn_getPlayer.sqf"
*/

// arguments
_params = _this;
_name = param [0, "", ["Max"]],

// begin of script
// error handling
if (typeName _name != "STRING" || count _name == 0) exitWith { false};

_player = objNull;

{

	if (name _x == _name) exitWith {_player = _x};

} forEach allPlayers;

// return value
_player