/*
	author: 			James
	version: 			1.00
	date: 				2016-04-20
	purpose: 			Liest eine Option aus JGKP_DC_options_x aus und setzt GUI entsprechend
	arguments: 			option (list): option in Form [name, status, button idc, trueOptions, falseOptions]
						idd (int): display
	return value:		None

	example call: 		["JGKP_DC_options_marker"] execVM "fn_readOption.sqf"
*/
private ["_params", "_name", "_option", "_idc", "_trueOptions", "_falseOptions"];

// arguments
_params = _this;
_option = _params select 0;
_display = _params select 1;


_status = _option select 1;
_idc = _option select 2;
_control = (findDisplay _display) displayCtrl _idc;
_trueOptions = _option select 3; // button text, EH-text
_falseOptions = _option select 4; // button text, EH-text

if (_status) then {

	ctrlSetText [_idc, _falseOptions select 0];

	// remove old EH
	_control ctrlRemoveAllEventHandlers "ButtonClick";

	// add new EH
	_control ctrlAddEventHandler ["ButtonClick", _falseOptions select 1];

} else {

	ctrlSetText [_idc, _trueOptions select 0];

	// remove old EH
	_control ctrlRemoveAllEventHandlers "ButtonClick";

	// add new EH
	_control ctrlAddEventHandler ["ButtonClick", _trueOptions select 1];

};



