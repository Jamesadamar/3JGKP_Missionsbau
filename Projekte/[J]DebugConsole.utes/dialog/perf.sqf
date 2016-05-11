/*
	author: 			James
	version: 			1.00
	date: 				2016-05-05
	purpose: 			Aktiviert oder Deaktiviert Performanceanzeige
	arguments: 			option (str): Name der Option
	return value:		None

	example call: 		['JGKP_DC_options_perf'] execVM "perf.sqf"
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

	[_name] spawn {

		while {true} do {

			_name = _this select 0;
			_return = [_name] call JGKP_DC_fnc_findOption; // returns [index, option]

			_index = _return select 0;
			_option = _return select 1;

			_status = _option select 1;

			if (not _status) exitWith {hintSilent ""};

			// PLAYER
			_own_fps = diag_fps;
			_local_units = {local _x} count allUnits;

			// SERVER
			[[player], 
			{server_fps = diag_fps; (owner (_this select 0)) publicVariableClient "server_fps";
			 server_units = {local _x} count allUnits; (owner (_this select 0)) publicVariableClient "server_units"}] remoteExec ["BIS_fnc_call", 2, false];
			 waitUntil { 
			 	!isNil "server_fps" && !isNil "server_fps"
			 };

			// HC
			// ermittle, ob HC anwesend (HC ist client wie andere Spieler!)
			_isHC = false;
			_hc = objNull;
			{

				if (!isServer and !hasInterface) exitWith {_isHC = true; _hc = _x};

			} forEach allPlayers;

			if (_isHC) then {

				[[player], 
				{hc_fps = diag_fps; (owner (_this select 0)) publicVariableClient "hc_fps";
				 hc_units = {local _x} count allUnits; (owner (_this select 0)) publicVariableClient "hc_units"}] remoteExec ["BIS_fnc_call", _hc , false];

			};

			// AUSGABE
			_ausgabe = parseText format["
				Eigene FPS: %1 <br/>
				Eigene Einheiten: %2 <br/>
				------------------------- <br/>
				Server FPS: %3 <br/>
				Server Einheiten: %4 <br/>
				------------------------- <br/>
			", _own_fps, _local_units, server_fps, server_units];

			if (_isHC) then {

				_ausgabe = _ausgabe + format["
					HC FPS: %5 <br/>
					HC Einheiten: %6 <br/>
					------------------------- <br/>
				", hc_fps, hc_units];
			};

			hintSilent _ausgabe;

			sleep 1;

		};
	};

} else {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

};
