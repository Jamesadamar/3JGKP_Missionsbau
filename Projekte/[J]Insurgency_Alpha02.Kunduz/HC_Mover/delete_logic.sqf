/*
	Author: 			James
	Version: 			1.00
	Date: 				2015-08-02
	Purpose: 			Löscht alle synchronisierten Module mit einem Auslöser
	Übergabeparameter: 	trigger - Auslöser, der mit Modulen synchronisiert ist
	Rückgabewert:		true
	Verwendung: 		[thisTrigger] execVM "HC_Mover\delete_logic.sqf"

*/

// Übergabewerte
_params = _this;
_trigger = _params select 0;

// Skriptbeginn
// alle synchronisierten Objekte
_syncObjs = synchronizedObjects _trigger;

// sleep ist notwendig, damit die synchronisierten Module richtig auslösen!
sleep 5;

// solange keine Einheiten mit der aktuellen Logik verknüpft sind...
while {{side _x == sideLogic} count _syncObjs == count _syncObjs} do {
	if (count _syncObjs == 1) then {
		// gehe eine Ebene höher
		_syncObjs = synchronizedObjects (_syncObjs select 0);
	} else {
		// speichere alle Ebenen 1 höher
		_temp = [];
		{
			_temp pushBack (synchronizedObjects _x);
		} foreach _syncObjs;
		_syncObjs = _temp;
	};
};

// ab hier gibt es Einheiten oder Fahrzeuge in der Liste der synchronisierten Objekte
// finde alle Einheiten oder Trigger...
_units = [];
{
	if (side _x != sideLogic && side _x != sideUnknown) then {
		_units pushBack _x;
	};

} foreach _syncObjs;

// lösche alle Module, die mit dieser Einheit verbunden sind
{
  {
    deleteVehicle _x;
  } forEach (synchronizedObjects _x);
} forEach _units;

