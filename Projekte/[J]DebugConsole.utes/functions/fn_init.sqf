// später beim Addon austauschen!
JGKP_DC_fnc_calcValue = compile preprocessFileLineNumbers "functions\fn_calcValue.sqf";

JGKP_DC_fnc_storeVariables = compile preprocessFileLineNumbers "functions\fn_storeVariables.sqf";

JGKP_DC_fnc_readOption = compile preprocessFileLineNumbers "functions\fn_readOption.sqf";

JGKP_DC_fnc_findOption = compile preprocessFileLineNumbers "functions\fn_findOption.sqf";

JGKP_DC_fnc_getPlayer = compile preprocessFileLineNumbers "functions\fn_getPlayer.sqf";

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

// enthält [buttonIDC, [true, text, EH], [false, text, EH]]
JGKP_DC_options = [

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
	],

	[
		"JGKP_DC_options_hold",
		false,
		1618, 	
		["KI anhalten", "['JGKP_DC_options_hold'] execVM 'dialog\hold.sqf';"], // mode an
		["KI freigeben",  "['JGKP_DC_options_hold'] execVM 'dialog\hold.sqf';"] // mode aus
	],

	[
		"JGKP_DC_options_perf",
		false,
		1621, 	
		["Performance anzeigen", "['JGKP_DC_options_perf'] execVM 'dialog\perf.sqf';"], // mode an
		["Performance ausblenden",  "['JGKP_DC_options_perf'] execVM 'dialog\perf.sqf';"] // mode aus
	]

];

// Zugangslevel und die deaktivierten Kontrollelemente nach IDC
JGKP_DC_access_level = [
	
	[
		0,
		"Reguläres Mitglied",
		[
			1400, 1600, 1601, 1402, 1602, 1603, 1404, 1604, 1605, 1406, 1606, 1607, 1408, 2100, 1608, 1609, 1610, 1611, 1612, 1614, 1615, 1616, 1617, 1618, 1619, 1624, 1625
		]
	],

	[
		1,
		"Missionsbauer",
		[
			1615, 1616, 1618, 1619, 1624, 1625
		]
	],

	[
		2,
		"Zugführer",
		[
			
		]
	],

	[
		3,
		"Admin",
		[
			
		]
	]
];
