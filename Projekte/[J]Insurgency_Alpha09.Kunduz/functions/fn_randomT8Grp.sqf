/*
	author: 			James
	version: 			1.00
	date: 				2016-05-03
	purpose: 			create marker and spawn T8 templates for given trigger area
	arguments: 			trg (trigger): trg to create marker within
	return value:		None

	example call: 		[trg] execVM "functions\fn_randomT8Grp"
*/
#include "..\scripts\define_templates.hpp"

if (!isServer) exitWith{};

// nur wenn in den Parametern aktiviert
if (not (("Patrols" call BIS_fnc_getParamValue) == 1)) exitWith {};

// arguments
_params = _this;
_trg = _this select 0;

// begin of script
_centre = getpos _trg;
_trgArea = triggerArea _trg;

deleteVehicle _trg;

// erzeuge lokalen Marker auf Server -> daher nur dort lokal sichtbar
_marker = createMarkerLocal [format["T8Patrol_%1", _centre], _centre];
_marker setMarkerSizeLocal [_trgArea select 0, _trgArea select 1];
_marker setMarkerShapeLocal "RECTANGLE";

_templates = [];

// für je 300 m eine Gruppe
_pool = JGKP_var_template_small_grp + JGKP_var_template_big_grp + JGKP_var_template_motorized;

// für jede Fläche von der Größe 700 x 700 m^2 (Hälfte von 1km2) wird eine Patrouille gespawnt. Macht also 2 Patrouillen auf 1km^2
for "_i" from 1 to ( round( 2*(_trgArea select 0) * 2*(_trgArea select 1) / (700 * 700) ) ) do {

	if (random 1 <= 0.8) then {

		_templates pushBack (_pool call BIS_fnc_selectRandom);

	};

};

_T8_Container = [];

{
		
	// BASIC SETTING
	_basic = [];

	_basic pushBack (call compile _x); // Einheiten-Container, z.B.  [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F" ]; 
	_basic pushBack (_marker); // Marker für Spawn-Punkt
	// false wenn Template Fahrzeuge enthält
	if (not (_x in JGKP_var_template_small_grp) && not (_x in JGKP_var_template_big_grp) && not (_x in JGKP_var_template_static)) then {
		_basic pushBack false;
	};

	// TASK SETTING
	_task = [];
	_random = random 1;

	// most common case in 50% of all cases
	if (_random < 0.6) then {

			_task pushBack "PATROL";

	} else {

			_task pushBack "PATROL_URBAN";

	};			

	_T8_Container pushBack [_basic, _task];

} forEach _templates;

// spawn units
// not caching anything as patrols should be detectable by recons
[
	_T8_Container
] call T8U_fnc_Spawn;