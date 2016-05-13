/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			Initialisiert den Bestätigungsdialog
	arguments: 			0: display (display): Dialog Objekt
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_dialog = _this select 0;

// begin of script
_txtField = (_dialog) displayCtrl 1000;
_txtField ctrlSetText JGKP_DC_command_text;

JGKP_DC_command_isConfirmed = false;


