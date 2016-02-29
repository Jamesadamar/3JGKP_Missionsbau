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

[0, ["Load and make ready", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
hintSilent parseText "<t size='1.25'>Load and make ready</t>";
sleep 2;

[0, ["Are you ready?", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
hintSilent parseText "<t size='1.25'>Are you ready?</t>";
sleep 2;

[0, ["Standby", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
hintSilent parseText "<t size='1.25'>Standby</t>";
sleep (1+random 2);

JGKP_var_startTime = serverTime; 
playSound "IPSCAlarm";
hintSilent "";