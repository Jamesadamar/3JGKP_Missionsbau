/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			speichert Variablen dauerhaft im profileNamespace
	arguments: 			None
	return value:		None

	example call: 		beim Schließen des Dialogs durch ui eventhandler onUnload
*/
disableSerialization;

private ["_params", "_display", "_rows", "_size", "_commands"];

// arguments
_params = _this;
_display = _this select 0;

// begin of script

// speichere Text aus allen 4 Edit-Feldern
_rows = [1400,1402,1404,1406, 1408, 2100];

{
	_code = ctrlText _x;

	// speichere Befehle der Combobox
	if (_x == 2100) then {

		_size = lbSize 2100;
		_commands = [];

		for "_id" from 0 to (_size -1) do {
			_commands pushBackUnique (lbText [_x, _id]);
		};

		// überschreiben da stets alle Befehle
		JGKP_DC_Rows set [_forEachIndex, [_x, _commands]];

	} else {

		// speichere Befehle der Edit-Felder
		JGKP_DC_Rows set [_forEachIndex, [_x, _code]];

	};

} forEach _rows;

profileNamespace setVariable ["JGKP_DC_Rows", JGKP_DC_Rows];

// schließe Rsc sicherheitshalber
3101 cutFadeOut 0;