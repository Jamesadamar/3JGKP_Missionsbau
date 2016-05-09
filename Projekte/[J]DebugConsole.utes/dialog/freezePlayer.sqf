/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			friert angegebene Spieler ein
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

	_names pushBackUnique (_lstBox lbText _x);

} forEach _indices;

if (count _names == 0) exitWith {hint "Befehl nicht möglich\nKein Spieler ausgewählt"};



{
  
  	// retrieve player object from player name and teleport to admin (player using console)
  	
  	_player = [
  		[_x] call JGKP_DC_fnc_getPlayer,
  		[_x select [0, (_x find " (*)")]] call JGKP_DC_fnc_getPlayer
  	] select (_x find " (*)" != -1);
  	hint str(_player);
  	
  	if (simulationEnabled _player) then {

  		// Nachricht an Spieler
	 	"Sie werden vom Admin eingefroren!" remoteExec ["hint", _player, false];

	  	[[_player], {(_this select 0) enableSimulationGlobal false}] remoteExec ["BIS_fnc_spawn", 2, false];

	  	// markiere Namen als freeze
	  	_lstBox lbSetText [_forEachIndex, _x + " (*)"];

  	} else {

		// Nachricht an Spieler
  		"Sie werden vom Admin aufgetaut!" remoteExec ["hint", _player, false];

  		[[_player], {(_this select 0) enableSimulationGlobal true}] remoteExec ["BIS_fnc_spawn", 2, false];

  		// markiere Namen als freeze
  		_lstBox lbSetText [_forEachIndex, _x select [0, (_x find " (*)")]];

	};

} forEach _names;

