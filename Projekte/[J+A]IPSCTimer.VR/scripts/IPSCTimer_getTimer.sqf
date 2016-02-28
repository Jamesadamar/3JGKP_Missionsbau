/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Sobald ein Timer aufgenommen wurde, bekommt der Spieler weitere Optionen
	arguments: 			timer type (str): Blauer oder Gelber Timer
	return value:		None

	example call: 		wird von Action Menu aufgerufen
*/

// arguments
_params = _this;
_ID = _this select 2;
_color = (_this select 3) select 0;

// begin of script

// legt fest, ob es sich um einen Wettkampf Timer handelt
switch (_color) do {
	case "blau": {
		JGKP_var_wettkampf = true;
		
		if (isNil "JGKP_var_menu_blue") then {

			JGKP_var_menu_blue = player addAction ["<t color='#0000ff' size='1.25'>IPSC Timer - öffnen</t>", {createDialog "IPSCTimerDialog";}];

		} else {

			hintSilent "Wir sind wohl etwas gierig?...";

		};
	};

	case "gelb": {
		JGKP_var_wettkampf = false;

		if (isNil "JGKP_var_menu_yellow") then {

			JGKP_var_menu_yellow = player addAction ["<t color='#ffff66' size='1.25'>IPSC Timer -  öffnen</t>", {createDialog "IPSCTimerDialog";}];

		} else {

			hintSilent "Wir sind wohl etwas gierig?...";

		};
		
	};	
};
