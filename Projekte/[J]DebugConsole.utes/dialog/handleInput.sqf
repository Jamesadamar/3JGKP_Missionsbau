/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			handle input from edit box and try to run the code
	arguments: 			[control, the keyboard code, state of Shift, Ctrl and Alt.] 
	return value:		None

	example call: 		onKeyUp = "(_this) execVM handleInput.sqf;";
*/
disableSerialization;

private ["_params","_control","_key","_shift","_ctrl","_alt", "_inputIDC","_outputIDC"];

// arguments
_params = _this;
_control = _params select 0;
_key = _params select 1;
_shift = _params select 2;
_ctrl = _params select 3;
_alt = _params select 4;
hint str(_this);

// begin of script
_inputIDC = ctrlIDC _control; // IDC of INPUT EDIT BOX
_outputIDC = _inputIDC + 1; // IDC of OUTPUT EDIT BOX (next control)

/**
Important KEYS: 
https://community.bistudio.com/wiki/ListOfKeyCodes

TAB - 25
SHIFTL - 42
ALT - 56
SPACE - 57
STRGL - 29
F1 - 59
*/
// Beginne Auswertung, sobald STRGL gedrückt wird
if (_key == 29) then {

	[_inputIDC, _outputIDC] call JGKP_DC_fnc_getValue;
};

// Dauerhafte Auswertung, sobald ALTL gedrückt wird
if (_key == 56) then {

	[_inputIDC, _outputIDC] spawn {

		_inputIDC = _this select 0;
		_outputIDC = _this select 1;

		while {ctrlText _inputIDC != ""} do {

			[_inputIDC, _outputIDC] call JGKP_DC_fnc_getValue;

			sleep 0.1;
		};
	};
};