/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			read value from control 1 and write result to control 2
	arguments: 			1 - IDC (int), 2 - IDC (int)
	return value:		None

	example call: 		[2100, 2101] execVM "getValue.sqf"
*/
private ["_params", "_inputIDC", "_outputIDC", "_code", "_value", "_output"];

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
	if ( _x find "=" != -1 && ( !((_x select [(_x find "=") - 1, 1]) in ["!","<",">"]) && (_x select [(_x find "=") + 1, 1]) != "=") || _x find "execVM" != -1 || _x find "spawn" != -1) exitWith { _abort = true; }

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

			[[_code, player], {
				_code = _this select 0;
				_unit = _this select 1;
				JGKP_DC_server_var = call compile _code; 
				(owner _unit) publicVariableClient "JGKP_DC_server_var";
			}] remoteExec ["spawn", 2, false];
			waitUntil { !isNil "JGKP_DC_server_var" };

			_value = JGKP_DC_server_var;

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