/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			0: dialog (dialog)
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_dialog = _this select 0;

// reset JKPG_DC_message
JGKP_DC_message = "";