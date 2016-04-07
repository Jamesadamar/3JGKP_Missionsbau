/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			log value of code in input line
	arguments: 			1 - IDC (int): idc of input control
	return value:		None

	example call: 		only via ui event handler button action
*/
disableSerialization;

private ["_params","_inputIDC","_code","_value","_logText"];

// arguments
_params = _this;
_inputIDC = _params select 0;

// begin of script
_code = ctrlText _inputIDC;

if (_code == "") exitWith{};

_value = call compile _code;

_logText = format["JGKP_DC LOG EVENT: Time: %1, Input: %2, Output: %3", time, _code, _value];

diag_log _logText;

hintSilent "Log angelegt";
sleep 2;
hintSilent "";