/*
	author: 			James
	version: 			1.00
	date: 				2016-04-20
	purpose: 			Finde die gesuchte Option
	arguments: 			name (str): Name der Option/der Variable im Array JGKP_DC_options
	return value:		index (int): Index der Option
						option (array): Option selbst (siehe init.sqf)

	example call: 		['JGKP_DC_options_marker'] execVM "fn_findOption.sqf"
*/
private ["_params", "_name", "_option", "_index"];


// arguments
_params = _this;
_name = param[0, "", ["name"]];

// begin of script
if (_name isEqualTo "") exitWith {hint "Argument war kein String"};

_option = objNull;
_index = objNull;
{
	
	if ( (_x select 0) isEqualTo _name) exitWith {_option = _x; _index = _forEachIndex};

} forEach JGKP_DC_options;

// return value
[_index, _option];