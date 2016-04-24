/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			[dialog]
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_display = _this select 0;

// begin of script
// Lade Variable aus profileNamespace
JGKP_DC_Commands = profileNamespace getVariable ["JGKP_DC_Commands",[]];

JGKP_DC_Rows = profileNamespace getVariable ["JGKP_DC_Rows",[]];


// Befülle alle Felder mit den geladenen Werten:
// Rows
{
	
	_inputIDC = _x select 0;
	_code = _x select 1;

	// Befülle Combobox
	if (typeName _code == "ARRAY") then {

		{

			(_display displayCtrl _inputIDC) lbAdd _x;

		} forEach _code;

	} else {

		ctrlSetText [_inputIDC, _code];

	};

} forEach JGKP_DC_Rows;

// für angepinnte Felder -> ausgrauen und Text ändern
if (!isNil "JGKP_DC_Pin_Value") then {

	{
		_inputIDC = _x select 0;
		_buttonIDC = _inputIDC + 200; // button hat IDC + 200
		// Sperre Feld und Button so lang
		ctrlEnable [_inputIDC, false];
		ctrlSetText [_buttonIDC, "Unpin"];

	} forEach JGKP_DC_Pin_Value;

};


// button status
// SETZE ALLE OPTIONEN
{

	[_x, 3100] call JGKP_DC_fnc_readOption;

} forEach JGKP_DC_options;
