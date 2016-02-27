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
		hint format["%1 als Schütze gewählt", name cursorTarget]; 

	} else {

		hint "unzulässiges Ziel";
	}
}];

waitUntil {
	// code...
	if (not isNull cursorTarget) then {

  		_name = name cursorTarget;
  		hintSilent format["Schütze: %1", _name];

  	} else {

  		hintSilent "kein Ziel anvisiert";

  	};
  
  	not isNull JGKP_var_Shooter;
};

// Entferne Actioneintrag
player removeAction _ID;