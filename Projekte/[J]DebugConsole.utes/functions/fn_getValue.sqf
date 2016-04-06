/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			read value from control 1 and write result to control 2
	arguments: 			1 - IDC (int), 2 - IDC (int)
	return value:		None

	example call: 		[2100, 2101] execVM "getValue.sqf"
*/
private ["_params", "_inputIDC", "_outputIDC", "_code", "_value"];

// arguments
_params = _this;
_inputIDC = param [0, -1, [1], 1];
_outputIDC = param [1, -1, [1], 1];

// begin of script
try {

	if (_inputIDC == -1 || _outputIDC == -1) throw "keine gültige IDC";

} catch {

	ctrlSetText [_outputIDC, format["Code fehlerhaft: %1", _exception]];

};

_code = ctrlText _inputIDC;

try {

	_value = call compile _code;
	if (isNil "_value") throw "Fehlerhafter Code";

	ctrlSetText [_outputIDC, format["%1", _value]];

} catch {

	ctrlSetText [_outputIDC, format["Code fehlerhaft: %1", _exception]];
};