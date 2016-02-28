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
		player addAction ["<t color='#0000ff' size='1.25'>IPSC Timer - öffnen</t>", {createDialog "IPSCTimerDialog";}];
	};

	case "gelb": {
		JGKP_var_wettkampf = false;
		player addAction ["<t color='#ffff66' size='1.25'>IPSC Timer -  öffnen</t>", {createDialog "IPSCTimerDialog";}];
	};	
};


/* Ahab Farb- und Textanpassung
// Spieler die Möglichkeit geben, den Timer zu öffnen
player addAction ["<t size='1.25'>Timer öffnen</t>", {createDialog "IPSCTimerDialog";}];

*/