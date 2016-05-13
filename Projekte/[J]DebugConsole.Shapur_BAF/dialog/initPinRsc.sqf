/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize Rsc and update text
	arguments: 			[dialog]
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

private ["_params","_display","_text", "_code","_multiCode", "_value"];

// arguments
_params = _this;
_display = _this select 0;


// begin of script
// solange Variablen angepinnt sind, zeige sie im Intervall von 0.1s, sonst schließe Rsc
while {count JGKP_DC_Pin_Value > 0} do {

	_text = ''; 

	{
		// splite Code in mehrere Teile (für Multivariableneingabe)
		_multiCode = (_x select 1) splitString ";"; // Array

		{
			_code = _x;
			_value = call compile _code;

			_text = format["%1<t underline='true'>%2</t> : %3<br/>", _text, _code, _value]; 
		} forEach _multiCode;

	} foreach JGKP_DC_Pin_Value;

	(_display displayCtrl -1) ctrlSetStructuredText (parseText _text);

	sleep 0.1;
};

// Löse Rsc auf
31 cutFadeOut 0;
