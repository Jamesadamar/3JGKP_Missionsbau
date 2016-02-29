/*
	author: 			James
	version: 			1.00
	date: 				2016-02-27
	purpose: 			Initialisiert Dialog
	arguments: 			None
	return value:		None

	example call: 		wird nur vom Dialog aufgerufen
*/
disableSerialization;

// arguments
_params = _this;
_dialog = findDisplay 3155;

// controls
_frame = _dialog displayCtrl 1800;

_buttonStart = _dialog displayCtrl 1601;
_buttonCancel = _dialog displayCtrl 1602;
_buttonShooter = _dialog displayCtrl 1600;

_editShooter = _dialog displayCtrl 1400;

// begin of script
// Färbe Hintergrund entpsrechend des Timers

if (JGKP_var_wettkampf) then {

	// blau!
	_frame ctrlSetTextColor [0, 0, 1, 0.95];

	if (not isNull JGKP_var_Shooter) then {

		_editShooter ctrlSetText (name JGKP_var_Shooter);

	} else {

		_buttonStart ctrlEnable false;
		_buttonCancel ctrlEnable false;

	};

} else {

	// gelb!
	_frame ctrlSetTextColor [1, 1, 0.4, 0.95];

	_editShooter ctrlSetText (name JGKP_var_Shooter);

	_buttonShooter ctrlEnable false;

	// Gehe direkt zu Standby
	JGKP_var_timerStatus = 2;

};


// Trage Zeit für den Schützen ein, wenn Messung vorhanden
if (JGKP_var_lastShotTime != 0) then {

	_edit = _dialog displayCtrl 1401;
	_edit ctrlSetText format["%1 sec", JGKP_var_lastShotTime];

};

// Aufseher soll Waffe auf den Rücken tun
if (not weaponLowered player) then {
	player action ["WeaponOnBack", player];
};

// Passe Schrift auf Button start an
switch (JGKP_var_timerStatus) do { 
	case 0 : { 
		_buttonStart ctrlSetText "Load...";
	}; 

	case 1 : { 
		_buttonStart ctrlSetText "Ready?...";
	}; 

	case 2: {
		_buttonStart ctrlSetText "Standby...";
	};

	case 3: {
		_buttonStart ctrlEnable false;
	};	
};

