/*
	author: 			James
	version: 			1.00
	date: 				2016-04-07
	purpose: 			run code in input control locally, globally or only on server
	arguments: 			0 - IDC (int): input control
						1 - Mode (int): 0, 1 or 2 for mode
	return value:		None

	example call: 		called only via ui event handler action
*/
disableSerialization;

private ["_params", "_inputIDC", "_mode", "_code"];

// arguments
_params = _this;
_inputIDC = _params select 0;
_mode = _params select 1; // can be object, number or side

// begin of script
_code = ctrlText _inputIDC;
if (_code == "") exitWith {};

// run lokal, global oder auf dem Server
// always JIP false
(compile _code) remoteExec ["BIS_fnc_spawn", _mode, false];