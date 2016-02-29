/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Beginnt Zeitmessung. Dazu wird für die Aufsicht ein EH registriert.
	arguments: 			None
	return value:		None

	example call: 		wird von IPSCTimerDialog_voiceCommands.sqf aufgerufen
*/

// arguments
_params = _this;

// begin of script
player addAction ["<t color='ff0000' size='1.25'>Messung stoppen</t>", {

	_ID = _this select 2;
	player removeAllEventHandlers "FiredNear";
	hint format["%1\n-------------------\n%2 sec",name JGKP_var_Shooter, JGKP_var_lastShotTime];
	player removeAction _ID;
	JGKP_var_timerStatus = 0;

}];

player addEventHandler ["FiredNear", {

	if (_this select 1 == JGKP_var_Shooter) then {

		if (isMultiplayer) then {

			JGKP_var_lastShotTime = ServerTime - JGKP_var_startTime;

		} else {

			JGKP_var_lastShotTime = time - JGKP_var_startTime;

		};
	};
}];

sleep 1+random(2);

if (isMultiplayer) then {

	JGKP_var_startTime = serverTime;

} else {

	JGKP_var_startTime = time; 
	
};

playSound "IPSCAlarm";
hintSilent "";