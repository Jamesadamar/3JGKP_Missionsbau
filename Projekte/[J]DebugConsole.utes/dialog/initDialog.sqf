/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			[dialog]
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_display = _this select 0;

// begin of script
// Lade Variable aus profileNamespace
JGKP_DC_Commands = profileNamespace getVariable ["JGKP_DC_Commands",[]];

JGKP_DC_Rows = profileNamespace getVariable ["JGKP_DC_Rows",[]];


// Befülle alle Felder mit den geladenen Werten:
// Rows
{
	
	_inputIDC = _x select 0;
	_code = _x select 1;

	// Befülle Combobox
	if (typeName _code == "ARRAY") then {

		{

			(_display displayCtrl _inputIDC) lbAdd _x;

		} forEach _code;

	} else {

		ctrlSetText [_inputIDC, _code];

	};

} forEach JGKP_DC_Rows;

// button status
// MARKER
_control = (findDisplay 3100) displayCtrl 1614;
if (isNil "JGKP_DC_marker_status") then {

	ctrlSetText [1614, "Marker anzeigen"];

	// remove old EH
	_control ctrlRemoveAllEventHandlers "ButtonClick";

	// add new EH
	_control ctrlAddEventHandler ["ButtonClick", "[true, 1614] execVM 'dialog\marker.sqf';"];

} else {

	if (JGKP_DC_marker_status) then {

		ctrlSetText [1614, "Marker verbergen"];

		// remove old EH
		_control ctrlRemoveAllEventHandlers "ButtonClick";

		// add new EH
		_control ctrlAddEventHandler ["ButtonClick", "[false, 1614] execVM 'dialog\marker.sqf';"];

	} else {

		ctrlSetText [1614, "Marker anzeigen"];

		// remove old EH
		_control ctrlRemoveAllEventHandlers "ButtonClick";

		// add new EH
		_control ctrlAddEventHandler ["ButtonClick", "[true, 1614] execVM 'dialog\marker.sqf';"];

	};
};


