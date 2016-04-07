/*
	author: 			James
	version: 			1.00
	date: 				2016-04-07
	purpose: 			löscht einen Befehl aus der combobox
	arguments: 			0 - IDC (int): idc of combobox
	return value:		None

	example call: 		only via ui event handler action
*/
disableSerialization;

private [];

// arguments
_params = _this;
_comboBoxIDC = _params select 0;

// begin of script
_index = lbCurSel _comboBoxIDC;
lbDelete [_comboBoxIDC, _index];

// setze auf vorherigen Befehl