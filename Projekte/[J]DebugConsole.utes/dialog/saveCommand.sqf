/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			speichert den Befehl aus der input box in die combobox. Persistenz stellt fn_storeVariables sicher
	arguments: 			0 - IDC (int): input idc
						1 - IDC (int): combo box
	return value:		None

	example call: 		wird druch ui event handler action aufgerufen
*/
disableSerialization;

private ["_params", "_inputIDC", "_comboBoxIDC", "_code"];

// arguments
_params = _this;
_inputIDC = _this select 0;
_comboBoxIDC = _this select 1;

// begin of script
_code = ctrlText _inputIDC;

_size = lbSize _comboBoxIDC;

// prüfe, ob Befehl bereits enthalten
_alreadyIn = false;
for "_id" from 0 to (_size - 1) do {

	if (lbText [_comboBoxIDC, _id] == _code) exitWith {

		_alreadyIn = true;

	};
};

if (_alreadyIn) exitWith {hint "Befehl bereits gespeichert"};

// speichere Code als Eintrag und setze ihn
_id = lbAdd [_comboBoxIDC, _code];
lbSetCurSel [_comboBoxIDC, _id];

// sortiere alphanum
lbSort [(findDisplay 3100) displayCtrl _inputIDC, "ASC"];
