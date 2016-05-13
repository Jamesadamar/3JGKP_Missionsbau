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

	["JGKP_DC_perf_EH", "onEachFrame", {
	

		// PLAYER
		_own_fps = diag_fps;
		_local_units = {local _x} count allUnits;


		// AUSGABE
		_ausgabe = format
		["
			Eigene FPS: %1 <br/>
			Eigene Einheiten: %2 <br/>
			------------------------- <br/>",
			round(_own_fps), _local_units
		];

		
		// SERVER
		if (isMultiplayer) then {

			// SERVER
			[[player], 
			{
				server_fps = diag_fps; 
				(owner (_this select 0)) publicVariableClient "server_fps";
				server_units = {local _x} count allUnits;
				(owner (_this select 0)) publicVariableClient "server_units"
			}] remoteExec ["BIS_fnc_call", 2, false];

			
			if (isNil "server_fps" || isNil "server_units") exitWith{};


			_ausgabe = _ausgabe + format
			["
				Server FPS: %1 <br/>
				Server Einheiten: %2 <br/>
				------------------------- <br/>", 
				round(server_fps), server_units
			];

			// HC

			_isHC = [false,true] select (count (entities "Headlessclient_F") > 0);
			
			if (_isHC) then {

				_hc = (entities "Headlessclient_F") select 0;

				[[player], 
				{
					hc_fps = diag_fps; 
					(owner (_this select 0)) publicVariableClient "hc_fps";
					hc_units = {local _x} count allUnits;
					(owner (_this select 0)) publicVariableClient "hc_units"
				}] remoteExec ["BIS_fnc_call", _hc, false];

				if (isNil "hc_fps" || isNil "hc_units") exitWith {};
			 	

			 	_ausgabe = _ausgabe + format["
					HC FPS: %1 <br/>
					HC Einheiten: %2 <br/>
					------------------------- <br/>", 
					round(hc_fps), hc_units
				];

			};

		};

		hintSilent (parseText _ausgabe);

	}] call BIS_fnc_addStackedEventHandler;

} else {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	["JGKP_DC_perf_EH", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

	hintSilent "";

};
