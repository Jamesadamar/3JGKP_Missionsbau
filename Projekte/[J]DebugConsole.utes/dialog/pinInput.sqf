/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			pin the input of the edit text box to the screen
	arguments: 			1 - IDC (int): idc of input control
	return value:		None

	example call: 		callback of button in dialog
*/
disableSerialization;

private ["_params", "_buttonIDC", "_inputIDC", "_outputIDC", "_value", "_code"];

// arguments
_params = _this;
_buttonIDC = _params select 0;
_inputIDC = _params select 1;
_outputIDC = _inputIDC + 1;

// begin of script
_code = ctrlText _inputIDC;

_isEnabled = ctrlEnabled _inputIDC;

// wenn nicht angepinnt
if (_isEnabled) then {

	// werte Code aus und speichere Ergbenis in JGKP_DC_Pin_Value zwischen. Falls Code fehlerhaft, passiert nichts, Fehler wird ausgegeben
	try {

		if (_code == "") exitWith{};

		_value = call compile _code; // können auch mehrere Variablen sein
		if (isNil "_value") throw "Fehlerhafter Code"; // bricht dann hier ab

		
		if (isNil "JGKP_DC_Pin_Value") then {

			JGKP_DC_Pin_Value = [[_inputIDC, _code]];

		} else {

			JGKP_DC_Pin_Value pushBackUnique [_inputIDC, _code];
		};

		3101 cutRsc ["JGKP_DCPin","PLAIN"];

		[_inputIDC, _outputIDC] call JGKP_DC_fnc_calcValue;

		// Sperre Feld und Button so lang
		ctrlEnable [_inputIDC, false];
		ctrlSetText [_buttonIDC, "Unpin"];

	} catch {

		ctrlSetText [_outputIDC, format["Laufzeitfehler: %1", _exception]];
	};

} else {
	// falls angepinnt, entferne Eintrag aus JGKP_DC_pin_value
	{
		if (_x select 0 == _inputIDC) then {
			JGKP_DC_Pin_Value deleteAt _forEachIndex;
		}
	} forEach JGKP_DC_Pin_Value;


	// Sperre Feld und Button so lang
	ctrlEnable [_inputIDC, true];
	ctrlSetText [_buttonIDC, "Pin"];

};

