// später beim Addon austauschen!
JGKP_DC_fnc_calcValue = compile preprocessFileLineNumbers "functions\fn_calcValue.sqf";

JGKP_DC_fnc_storeVariables = compile preprocessFileLineNumbers "functions\fn_storeVariables.sqf";

JGKP_DC_fnc_readOption = compile preprocessFileLineNumbers "functions\fn_readOption.sqf";

JGKP_DC_fnc_findOption = compile preprocessFileLineNumbers "functions\fn_findOption.sqf";

// muss in einem externen Prozess laufen
// Beispiel für Lesbarkeit!
// Shift + ^ -> DC öffnen
[] spawn {
	waitUntil {!(isNull findDisplay 46)};
	(findDisplay 46) displayAddEventHandler [
		"KeyDown", 
		{
			_key = _this select 1; // DIC number
			_shift = _this select 2; // bool

			if (_key == 41 && _shift) then {
				createDialog "JGKP_DC";
			};
		}
	]; 
};

// OPTIONEN FÜR BUTTON
// einheitliches Array-Format

JGKP_DC_options = []; // enthält [buttonIDC, [true, text, EH], [false, text, EH]]

{
	JGKP_DC_options pushBack _x;
} forEach [

	[
		"JGKP_DC_options_marker",
		false,
		1614, 	
		["Marker anzeigen", "['JGKP_DC_options_marker'] execVM 'dialog\marker.sqf';"], // marker an -> wird ausgeführt, wenn false
		["Marker verbergen",  "['JGKP_DC_options_marker'] execVM 'dialog\marker.sqf';"] // marker aus -> wird ausgeführt, wenn true
	],

	[
		"JGKP_DC_options_god_mode",
		false,
		1615, 	
		["God mode an", "['JGKP_DC_options_god_mode'] execVM 'dialog\godMode.sqf';"], // mode an
		["God mode aus",  "['JGKP_DC_options_god_mode'] execVM 'dialog\godMode.sqf';"] // mode aus
	],

	[
		"JGKP_DC_options_hide",
		false,
		1616, 	
		["Unsichtbar werden", "['JGKP_DC_options_hide'] execVM 'dialog\hide.sqf';"], // mode an
		["Sichtbar werden",  "['JGKP_DC_options_hide'] execVM 'dialog\hide.sqf';"] // mode aus
	]

];
