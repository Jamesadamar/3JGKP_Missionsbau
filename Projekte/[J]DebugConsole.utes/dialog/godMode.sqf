/*
	author: 			James
	version: 			1.00
	date: 				2016-04-20
	purpose: 			Aktiviert oder Deaktiviert Unverwundbarkeit
	arguments: 			option (str): Name der Option
	return value:		None

	example call: 		['JGKP_DC_options_god_mode'] execVM "godMode.sqf"
*/

// arguments
_params = _this;
_name = _params select 0;


// begin of script
// find option with given name
_return = [_name] call JGKP_DC_fnc_findOption; // returns [index, option]

_index = _return select 0;
_option = _return select 1;

_status = _option select 1;
_idc = _option select 2;
_control = ((findDisplay 3100) displayCtrl _idc);
_trueOptions = _option select 3;
_falseOptions = _option select 4;

if (not _status) then {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	player allowDamage false;

} else {

	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	player allowDamage true;

};
