/*
	author: 			James
	version: 			1.00
	date: 				2016-02-29
	purpose: 			Lässt dem Aufseher Zeit, die Sprachkommands zu geben
	arguments: 			None
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_dialog = findDisplay 3155;
_buttonStart = _dialog displayCtrl 1601;

// begin of script
switch (JGKP_var_timerStatus) do { 
	case 0 : {  

		[0, ["Load and make ready", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
		hintSilent parseText "<t size='1.25'>Load and make ready.</t>";

		JGKP_var_timerStatus = 1;

		_buttonStart ctrlSetText "Ready?...";

	}; 

	case 1: {  

		[0, ["Are you ready?", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
		hintSilent parseText "<t size='1.25'>Are you ready?</t>";

		JGKP_var_timerStatus = 2;

		_buttonStart ctrlSetText "Standby...";

	}; 
	
	case 2: {

		[0, ["Standby", "PLAIN DOWN"]] remoteExec ["cutText", JGKP_var_Shooter];
		hintSilent parseText "<t size='1.25'>Standby</t>";	

		[] execVM "dialog\IPSCTimerDialog_startTimer.sqf";	

		JGKP_var_timerStatus = 3;

		_buttonStart ctrlEnable false;
	};
};
