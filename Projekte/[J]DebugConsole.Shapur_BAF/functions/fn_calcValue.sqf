/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			read value from control 1 and write result to control 2
	arguments: 			1 - IDC (int), 2 - IDC (int)
	return value:		None

	example call: 		[2100, 2101] execVM "getValue.sqf"
*/
private ["_abort", "_params", "_inputIDC", "_outputIDC", "_code", "_multiCode", "_value", "_output"];

// arguments
_params = _this;
_inputIDC = param [0, -1, [1], 1];
_outputIDC = param [1, -1, [1], 1];

// begin of script
// error handling for wrong IDC
if (_inputIDC == -1 || _outputIDC == -1) exitWith {

	ctrlSetText [_outputIDC, format["Aufruf fehlerhaft: %1", "keine gültige IDC"]];

};

_multiCode = (ctrlText _inputIDC) splitString ";";
_output = "";

// error handling for assignments
_abort = false;
{	

	// "=", "spawn", "execVM" are not allowed
	if ( _x find "=" != -1 && ( !((_x select [(_x find "=") - 1, 1]) in ["!","<",">"]) && (_x select [(_x find "=") + 1, 1]) != "=") || _x find "execVM" != -1 || _x find "spawn" != -1 || _x find "remoteExec" != -1) exitWith { _abort = true; }

} forEach _multiCode;

if (_abort) exitWith {

	ctrlSetText [_outputIDC, format["Code fehlerhaft: %1", "Keine Zuweisungen oder Aufrufe!"]];

};

try {
	
	{
		_code = _x;
		_value = nil;
		if (_code == "") exitWith {}; // kein Code übergeben


		if (_inputIDC == JGKP_DC_inputIDC_server) then {

			JGKP_DC_server_result = nil;
			// löse public EH von Server aus
			["JGKP_DC_fnc_send_var", [_code, player]] call CBA_fnc_clientToServerEvent;

			waitUntil { !isNil "JGKP_DC_server_result" };

			_value = JGKP_DC_server_result;

		} else {
		
			_value = call compile _code;		

		};

		if (isNil "_value") throw "Fehlerhafter Code";

		_output = format["%1%2; ", _output, _value];

	} forEach _multiCode;

	ctrlSetText [_outputIDC, format["%1", _output]];

} catch {

	ctrlSetText [_outputIDC, format["Laufzeitfehler: %1", _exception]];
};