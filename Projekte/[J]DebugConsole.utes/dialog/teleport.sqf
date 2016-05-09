/*
	author: 			James
	version: 			1.00
	date: 				2016-05-09
	purpose: 			Öffnet die Karte und lässt den Spieler per Linksklick teleportieren
	arguments: 			None
	return value:		None

	example call: 		[] execVM "teleport.sqf"
*/

// arguments
_params = _this;

// begin of script
openMap[true, false];

/*
     units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
    alt: Boolean - true if Alt key was pressed (same as _alt param)
    shift: Boolean - true if Shift key was pressed (same as _shift param)
    */
addMissionEventHandler ["MapSingleClick", {
	
	_pos = _this select 1;
	_shift = _this select 3;

	if (_shift) then {

		player setpos _pos;
		removeAllMissionEventHandlers "MapSingleClick";

	};

}];

openMap[false, false];