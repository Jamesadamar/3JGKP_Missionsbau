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

// begin of script
// Färbe Hintergrund entpsrechend des Timers
_frame = _dialog displayCtrl 1800;

if (JGKP_var_wettkampf) then {

	_frame ctrlSetTextColor [0, 0, 1, 0.95];

} else {

	_frame ctrlSetTextColor [1, 1, 0.4, 0.95];
	_frame ctrlSetScale 2;
	_buttonShooter = _dialog displayCtrl 1600;
	_buttonShooter ctrlEnable false;
	_editShooter = _dialog displayCtrl 1400;
	_editShooter ctrlEnable false;

};

_buttonStart = _dialog displayCtrl 1601;
_buttonCancel = _dialog displayCtrl 1602;

// Gib aktuellen Schützen aus
if (not isNull JGKP_var_Shooter && JGKP_var_wettkampf) then {

	_edit = _dialog displayCtrl 1400;
	_edit ctrlSetText name JGKP_var_Shooter;

	_buttonStart ctrlEnable true;
	_buttonCancel ctrlEnable true;

} else {

	_buttonStart ctrlEnable false;
	_buttonCancel ctrlEnable false;

};

// Trage Zeit für den Schützen ein, wenn Messung vorhanden
if (JGKP_var_lastShotTime != 0) then {

	_edit = _dialog displayCtrl 1401;
	_edit ctrlSetText format["%1 sec", JGKP_var_lastShotTime];

};

