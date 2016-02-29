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
		
		if (isNil "JGKP_var_menu_blue") then {

			if (not isNil "JGKP_var_menu_yellow") exitWith {

				hint "Bitte erst den gelben IPSC Timer ablegen";

			};

			JGKP_var_wettkampf = true;

			JGKP_var_menu_blue = player addAction ["<t color='#0000ff' size='1.25'>IPSC Timer - öffnen</t>", {createDialog "IPSCTimerDialog";}];

		} else {

			hintSilent "Wir sind wohl etwas gierig?...";
		};
	};

	case "gelb": {
		if (isNil "JGKP_var_menu_yellow") then {

			if (not isNil "JGKP_var_menu_blue") exitWith {

				hint "Bitte erst den blauen IPSC Timer ablegen";
				
			};

			JGKP_var_wettkampf = false;
			JGKP_var_Shooter = player;

			JGKP_var_menu_yellow = player addAction ["<t color='#ffff66' size='1.25'>IPSC Timer -  öffnen</t>", {createDialog "IPSCTimerDialog";}];

		} else {

			hintSilent "Wir sind wohl etwas gierig?...";

		};		
	};	
};
