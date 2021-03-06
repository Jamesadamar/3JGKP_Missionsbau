/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Legt einen Schützen via AddAction Menü fest.
	arguments: 			None
	return value:		None

	example call: 		wird vom Dialog aufgerufen!
*/
disableSerialization;

// arguments
_params = _this;

// begin of script
JGKP_var_Shooter = objNull;

// Gib Spieler Actioneintrag zum Wahl des Schützen
_ID = player addAction ["<t color='#00ff00' size='1.25'>Schütze wählen</t>", {
	if (not isNull cursorTarget) then {

		JGKP_var_Shooter = cursorTarget;
		sleep 1;
		hint parseText format["<t size='1.25' color='#00ff00'>%1 als Schütze gewählt</t>", name JGKP_var_Shooter]; 

	} else {

		hint "unzulässiges Ziel";

	}
}];

waitUntil {
	// code...
	if (not isNull cursorTarget) then {

  		_name = name cursorTarget;
  		hintSilent parseText format["<t size='1.25'>Anvisierter Schütze:</t><br/> %1", _name];

  	} else {

  		hintSilent parseText "<t size='1.25'>Bitte Schützen anvisieren</t>";

  	};
  
  	not isNull JGKP_var_Shooter;
};

// Entferne Actioneintrag
player removeAction _ID;