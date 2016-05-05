/*
	author: 			James
	version: 			1.00
	date: 				2016-04-17
	purpose: 			Übernimmt Auswahl aus Combobox in Editfield
	arguments: 			[combobox, index]
	return value:		None

	example call: 		nur über event handler ui onLBSelChanged
*/
disableSerialization;

// arguments
_params = _this;
_control = _this select 0;
_index = _this select 1;

// begin of script
// lies aktuell ausgewählte Zeile aus
_code = _control lbText _index;

// übernimm Code in EditField
ctrlSetText [1408, _code];
