/*
	author: 			James
	version: 			1.00
	date: 				2016-05-16
	purpose: 			Sucht nächsten oder vorherigen Befehl aus Liste der bisherigen Befehle
	arguments: 			0: IDC (int) - number of input and output idc
						1: direction (int) - 1 - forward, -1 - backward
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_inputIDC = param [0, 1408, [1]];
_dir = param[1, 0, [1]];
_display = findDisplay 3100;
_txtField = _display displayCtrl _inputIDC;
_code = ctrlText _txtField;

// begin of script
// suche Eintrag in JGKP_DC_command_temp
// füge aktuellen Inhalt hinzu, um danach suchen zu können!
JGKP_DC_command_temp pushBackUnique _code;

_id = -1;
{

	if (_x isEqualTo _code) exitWith {_id = _forEachIndex};

} forEach JGKP_DC_command_temp;

if (_id == -1) exitWith {hint "Befehl nicht gefunden!"};

switch (_dir) do { 
	case -1 : { 

		if (_id == 0) exitWith {hint "Kein Befehl übrig"};

		_txtField ctrlSetText (JGKP_DC_command_temp select _id - 1);

	}; 
	case 1 : {  

		if (_id == (count JGKP_DC_command_temp) - 1) exitWith { hint "Kein Befehl übrig"};

		_txtField ctrlSetText (JGKP_DC_command_temp select _id + 1);

	}; 
	default {  

		hint "Falscher Parameter für Richtung";

	}; 
};

