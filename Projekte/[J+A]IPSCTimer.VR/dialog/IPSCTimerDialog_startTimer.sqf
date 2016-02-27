/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Beginnt Zeitmessung. Dazu wird für die Aufsicht ein EH registriert.
	arguments: 			None
	return value:		None

	example call: 		wird vom Dialog aufgerufen.
*/

// arguments
_params = _this;

// begin of script
player addAction ["<t color='ff0000' size='1.25'>Messung stoppen</t>", {
	_ID = _this select 2;
	player removeAllEventHandlers "FiredNear";
	hint format["%1\n-------------------\n%2 sec",name JGKP_var_Shooter, JGKP_var_lastShotTime];
	player removeAction _ID;
}];

player addEventHandler ["FiredNear", {

	if (_this select 1 == JGKP_var_Shooter) then {
		JGKP_var_lastShotTime = serverTime - JGKP_var_startTime;
	}
}];

["Load and make ready", hint, JGKP_var_Shooter, false, false] call BIS_fnc_mp;
hintSilent "Load and make ready";
sleep 2;
["Are you ready?", hint, JGKP_var_Shooter, false, false] call BIS_fnc_mp;
hintSilent "Are you ready?";
sleep 2;
["Standby", hint, JGKP_var_Shooter, false, false] call BIS_fnc_mp;
hintSilent "Standby";

sleep (1+random 2);
// TODO: PEEP sound

JGKP_var_startTime = serverTime; 