/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			teleportiert Admin zu markiertem Spieler
	arguments: 			None
	return value:		None

	example call: 		[] execVM "teleToPlayer.sqf"
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

	_names pushBackUnique (_lstBox lbText _x);

} forEach _indices;


if (count _names == 0) exitWith {hint "Befehl nicht möglich\nKein Spieler ausgewählt"};

if (count _names > 1) exitWith {hint "Befehl nicht möglich\nMehr als ein Spieler ausgewählt"};


// retrieve player object from player name and teleport to admin (player using console)
_name = _names select 0;
_player = [
  		[_name] call JGKP_DC_fnc_getPlayer,
  		[_name select [0, (_name find " (*)")]] call JGKP_DC_fnc_getPlayer
  	] select (_name find " (*)" != -1);



if (vehicle _player != _player) then {

	player moveInCargo vehicle _player;

} else {

	player setpos getpos _player;
};

