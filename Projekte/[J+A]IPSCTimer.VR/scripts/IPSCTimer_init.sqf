/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Legt Add-Action-Befehle für die Kiste fest
	arguments: 			kiste (obj)
	return value:		None

	example call: 		[kiste] execVM "scripts\IPSC_init.sqf"
*/

// arguments
_params = _this;
_kiste = param [0, objNull, [objNull]];

// begin of script
_kiste addAction ["<t color='#0000ff' size='1.25'>Blauen IPSC Timer</t> (Wettkampf) aufnehmen", "scripts\IPSCTimer_getTimer.sqf",["blau"]];

_kiste addAction ["<t color='#ffff66' size='1.25'>Gelben IPSC Timer</t> (Übung) aufnehmen", "scripts\IPSCTimer_getTimer.sqf", ["gelb"]];

_kiste addAction ["<t color='#66ff66' size='1.25'>IPSC Timer </t> abgeben", {
	if (not isNil "JGKP_var_menu_blue") then {

		player removeAction JGKP_var_menu_blue;
		JGKP_var_menu_blue = nil; 

	};

	if (not isNil "JGKP_var_menu_yellow") then {

		player removeAction JGKP_var_menu_yellow;
		JGKP_var_menu_yellow = nil;
		
	};
}];

// lege verwendete Variablen fest
[] execVM "scripts\IPSCTimer_initVars.sqf";