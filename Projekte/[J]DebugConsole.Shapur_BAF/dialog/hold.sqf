/*
	author: 			James
	version: 			1.00
	date: 				2016-05-05
	purpose: 			Aktiviert oder Deaktiviert enableSimulation für den Feind
	arguments: 			option (str): Name der Option
	return value:		None

	example call: 		['JGKP_DC_options_hold'] execVM "hold.sqf"
*/
disableSerialization;

// arguments
_params = _this;
_name = _params select 0;


// begin of script
// find option with given name
_return = [_name] call JGKP_DC_fnc_findOption; // returns [index, option]

_index = _return select 0;
_option = _return select 1;

_status = _option select 1;
_idc = _option select 2;
_control = ((findDisplay 3100) displayCtrl _idc);
_trueOptions = _option select 3;
_falseOptions = _option select 4;

if (not _status) then {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	{

		if (not (_x in allPlayers)) then {

			if (vehicle _x != _x) then {

				[vehicle _x, false] remoteExec ["enableSimulationGlobal", 2, false];

			} else {

				[_x, false] remoteExec ["enableSimulationGlobal", 2, false];

			};
		};

	} forEach allUnits + allDead;

	// log
	["jgkp_log_action", [getPlayerUID player, "DebugConsole", "[hold, ausgeführt]"]] call CBA_fnc_clientToServerEvent;

} else {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	{

		if (not (_x in allPlayers)) then {

			if (vehicle _x != _x) then {

				[vehicle _x, true] remoteExec ["enableSimulationGlobal", 2, false];

			} else {

				[_x, true] remoteExec ["enableSimulationGlobal", 2, false];

			};
		};

	} forEach allUnits + allDead;

};
