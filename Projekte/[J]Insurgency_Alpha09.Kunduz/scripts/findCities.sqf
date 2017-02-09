/*
	author: 			James
	version: 			1.00
	date: 				2016-02-22
	purpose: 			Analysiert eine Karte nach Städten und Dörfern. Zählt nur begehbare Häuser.
	arguments: 			trg (trigger): Auslöser, dessen Maße übernommen werden, bitte rechteckig!
						y-dir (int): Richtung der y-Achse: 1 - aufwärts, (-1): abwärts
	return value:		None

	example call: 		[trg,] execVM "scripts\findCities.sqf";
*/
#include "define_templates.hpp"

// arguments
_params = _this;
_trg = param [0, objNull, [objNull]];
_yDir = param [1, 1, [1]];

if (isNull _trg) exitWith {
	parseText "<t color='#ff0000' size='2'>Keinen gültigen Auslöser übergeben!</t>" remoteExec ["hint", 0];
};

_trgArea = triggerArea _trg;
_start = [	
	(getpos _trg select 0) - (_trgArea select 0),
	(getpos _trg select 1) - (_trgArea select 0) * _yDir,
	0 
];

_end = 	[
	(getpos _trg select 0) + (_trgArea select 0),
	(getpos _trg select 1) + (_trgArea select 0) * _yDir,
	0 
];

_resolution =  			"SquareSize" call BIS_fnc_getParamValue; // siehe Description
_size = 						"CitySize" call BIS_fnc_getParamValue; // siehe Description
_markerID = 				1;
_safetyDistance = 	"SafetyDistance" call BIS_fnc_getParamValue; // siehe Description
_spawnRadius = 			"SpawnRadius" call BIS_fnc_getParamValue; // siehe Description

// begin of script
_distanceX = (_end select 0) - (_start select 0); // 5000 - 0 = 5000 m in x
_distanceY = (_end select 1) - (_start select 1); // 5000 - 0 = 5000 m in y

_stepsX = _distanceX / _resolution; // z.B: 5000 / 100 = 50 Quadrate nach rechts
_stepsY = _distanceY / _resolution; // z.B: 5000 / 100 = 50 Quadrate nach oben

_cell = [	
	(_start select 0) + _resolution / 2,
	(_start select 1) + _resolution / 2, 
	0
]; // Beginne in der Mitte des 1. Quadrats

_cities = []; // empty array for later

JGKP_fnc_searchSquare = {
	
	private ["_cell", "_newCell", "_direction", "_resolution", "_nrBuildings", "_marker"];

	_cell = _this select 0;
	_direction = _this select 1; // from where was the current cell visited? N,S,E or W
	_resolution = _this select 2;

	_nrBuildings = {
			count (_x buildingPos -1) > 0;
	} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);

	if (_nrBuildings == 0) exitWith {}; // Stadtende!
	if (_cell in JGKP_var_city) exitWith {}; // Feld bereits abgesucht!

	JGKP_var_city pushBack _cell;

	// benachbarte Zellen:
	_newCells = [ 
		[
			"E", // diese Richtung kann übersprungen werden -> direction
			[	
				(_cell select 0) - _resolution,
				_cell select 1,
				0
			]
		],
		[
			"W",
			[	
				(_cell select 0) + _resolution,
				_cell select 1,
				0
			]
		],
		[	
			"S",
			[
				_cell select 0,
				(_cell select 1) + _resolution,
				0
			]
		],
		[	
			"N",
			[
				_cell select 0,
				(_cell select 1) - _resolution,
				0
			]
		]
	];

	// durchsuche angrenzende Quadrate, sofern nicht aus der Richtung gekommen
	{	
		
		if (_direction != (_x select 0)) then {

			[_x select 1, _x select 0 ,_resolution] call JGKP_fnc_searchSquare;

		}

	} foreach _newCells;

};

for "_dy" from 1 to _stepsY do {
	
	for "_dx" from 1 to _stepsX do {
		
		// überspringe aktuelles Quadrat, falls näher als 1000m an der Basis
		if (_cell distance2D (position JGKP_loc_base) < _safetyDistance) then {

			_cell = [	
				(_cell select 0) + _resolution,
				(_cell select 1),
				0
			]

		} else {

		// Finde Häuser
		_nrBuildings = {
			count (_x buildingPos -1) > 0;
		} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);
		

		if (_nrBuildings >= _size && ({ _cell in _x } count _cities) == 0) then {
			
			// in benachbarten Quadraten schauen:
			JGKP_var_city = [];
			[_cell, "",_resolution] call JGKP_fnc_searchSquare; // braucht keine Richtungsangabe, da 1. Zelle

			_cities pushBack JGKP_var_city
		};
		
		// nächstes Quadrat in x
		_cell = [	
			(_cell select 0) + _resolution,
			(_cell select 1),
			0
		 ]

		}

	};

	// nächstes Quadrat in y
	_cell = [	
		(_start select 0) + _resolution / 2,
		(_cell select 1) + _resolution,
		0
	];
};

// Berechne Zentrum für alle Städte

JGKP_fnc_searchCentre = {
	
	private ["_city", "_xmin","_xmax","_ymin","_ymax","_centre","_a","_b"];

	_city = _this select 0; // Array aus Planquadraten (Pos) [ [x1,y1,z1], [x2,y2,z3], ...]

	_xmin = 1e6;
	_ymin = 1e6;
	_xmax = -1;
	_ymax = -1;

	{
		if (_x select 0 < _xmin) then {
			_xmin = _x select 0;
		};

		if (_x select 0 > _xmax) then {
			_xmax = _x select 0;
		};

		if (_x select 1 > _ymax) then {
			_ymax = _x select 1;
		};

		if (_x select 1 < _ymin) then {
			_ymin = _x select 1;
		};

	} foreach _city;

	_centre = [	(_xmax + _xmin) / 2,
				(_ymax + _ymin) / 2,
				0
	];

	_a = abs(_xmin - (_centre select 0)) max abs(_xmax - (_centre select 0));
	_b = abs(_ymin - (_centre select 1)) max abs(_ymax - (_centre select 1));

	[_centre, _a, _b] // Koordinaten für Mittelpunkt, Ausdehnung in x und y
};

{	
	// Erzeuge Marker für Zentrum und Ausdehnung
	_city = _x;
	_nr_cells = count _city;

	_cityIndex = _forEachIndex;
	
	_centre = [_city] call JGKP_fnc_searchCentre; // Funktion ermittelt mittleres Planquadrat

	// marker für Stadtzentrum
	_marker = createMarker [
		format["city:%1", _centre select 0], 
		_centre select 0
	];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "C_Unknown";
	_marker setMarkerText "Stadt";
	//_marker setMarkerSize [_resolution / 2, _resolution / 2];
	//_marker setMarkerColor "ColorEAST";
	_marker setMarkerAlpha 0.3;

	// neue Location
	_location = createLocation ["NameVillage", _centre select 0, _centre select 1, _centre select 2];
	_location setText format["city:%1", _centre select 0];

	// marker für Stadtgrenze (Oval)
	_markerBorder = createMarker [
		format["cityborder:%1", _centre select 0], 
		_centre select 0
	];

	_markerBorder setMarkerShape "ELLIPSE";
	_markerBorder setMarkerBrush "SolidBorder";
	_markerBorder setMarkerSize [	
		(_centre select 1) + _resolution / 2, 
		(_centre select 2) + _resolution / 2
	]; // Marker gehen nur bis zur Mitte des Quadrats!
	_markerBorder setMarkerColor "ColorBLUE";
	_markerBorder setMarkerAlpha 0.3;
	
	if ("Debug" call BIS_fnc_getParamValue == 0) then {

		_marker setMarkerAlpha 0;
		_markerBorder setMarkerAlpha 0;
		
	};

	// Erzeuge für jede Stadt Auslöser + Marker für Freund/Feind-Erkennung:
	{
		_cell = _x;
		// Rufe Hilfsfunktion auf, die Trigger + Marker erzeugt!
		_trg = createTrigger ["EmptyDetector", _cell, true];
		_trg setTriggerArea [_resolution / 2, _resolution / 2, 0, true];

		[_trg, _markerID, 60, 120] spawn JGKP_fnc_createMarkerAndTrigger;
		_markerID = _markerID + 1;

	} foreach _city;

	// Dynamische Anpassung an Spieleranzahl und Stadtgröße!
	// Anzahl an Templates in Abhängigkeit von Stadtgröße bestimmen
	_templates = [];

	_nr_small_grp =			((_nr_cells) - ((_nr_cells) % 3)) / 3;
	_nr_big_grp =  			((_nr_cells) - ((_nr_cells) % 4)) / 4;
	_nr_car_grp =  			((_nr_cells) - ((_nr_cells) % 6)) / 6;
	_nr_motorized_grp = ((_nr_cells) - ((_nr_cells) % 8)) / 8;
	_nr_static_grp =  	((_nr_cells) - ((_nr_cells) % 10)) / 10;
	_nr_tank_grp = 			((_nr_cells) - ((_nr_cells) % 12)) / 12;

	if (_nr_cells <= 3) then {
		_nr_small_grp =			[1,2] call BIS_fnc_selectRandom;
		_nr_big_grp =  			[0,1] call BIS_fnc_selectRandom;
		_nr_car_grp =  			0;
		_nr_motorized_grp = 0;
		_nr_static_grp =  	0;
		_nr_tank_grp = 			0;
	};

	
	for "_i" from 1 to _nr_small_grp do {
		_templates pushBack (JGKP_var_template_small_grp call BIS_fnc_selectRandom);
	};

	for "_i" from 1 to _nr_big_grp do {
		_templates pushBack (JGKP_var_template_big_grp call BIS_fnc_selectRandom);
	};

	for "_i" from 1 to _nr_car_grp do {
		_templates pushBack (JGKP_var_template_car call BIS_fnc_selectRandom);
	};

	for "_i" from 1 to _nr_motorized_grp do {
		_templates pushBack (JGKP_var_template_motorized call BIS_fnc_selectRandom);
	};

	for "_i" from 1 to _nr_static_grp do {
		_templates pushBack (JGKP_var_template_static call BIS_fnc_selectRandom);
	};

	for "_i" from 1 to _nr_tank_grp do {
		_templates pushBack (JGKP_var_template_armored call BIS_fnc_selectRandom);
	};

	call compile format["JGKP_T8_Container_%1 = []", _cityIndex];

	{
		
		// BASIC SETTING
		_basic = [];

		_basic pushBack (call compile _x); // Einheiten-Container, z.B.  [ "O_soldier_TL_F", "O_medic_F", "O_soldier_F" ]; 
		_basic pushBack (_markerBorder); // Marker für Spawn-Punkt
		// false wenn Template Fahrzeuge enthält
		if (not (_x in JGKP_var_template_small_grp) && not (_x in JGKP_var_template_big_grp) && not (_x in JGKP_var_template_static)) then {
			_basic pushBack false;
		};

		// TASK SETTING
		_task = [];
		_random = random 1;

		// most common case in 40% of all cases
		if (_random < 0.4) then {

			_random = random 1;

			if (_random < 0.3) then {

			 	_task pushBack "PATROL_URBAN";

			};

			if (_random > 0.3 and _random < 0.8) then {

				_task pushBack "PATROL";

			};

			if (_random > 0.8) then {

				_task pushBack "PATROL_AROUND";
				_task pushBack 100;

			};
		};

		// 30 %
		if (_random > 0.4 and _random < 0.7) then {

			_task pushBack "PATROL_GARRISON";
			
		};

		// 20%
		if (_random > 0.7 and _random < 0.9) then {

			_task pushBack "OCCUPY";

			_random = random 1;

			// disable movement
			if (_random < 0.3) then {
				_task pushBack true;
			};

		};

		// 10%
		if (_random > 0.9) then {

			_task pushBack "GARRISON";
		};

		call compile format["JGKP_T8_Container_%1 pushBack [%2, %3]", _cityIndex, _basic, _task]; // own spawning template for this city

	} forEach _templates;

	/*
	[ “myGroupContainer”, “myMarker”, “EAST”, “ANY”, 1000, “this”, “”, “” ] 
	call T8U_fnc_Zone;
	*/

	_T8_trigger = 
	[
		format["JGKP_T8_Container_%1", _cityIndex], 
		_marker, 
		"EAST",
		"WEST", 
		_spawnRadius, 
		"(thislist select 0) in allPlayers && {(position _x) select 2 > 5} count thislist == 0",
		"",
		""  
	] call T8U_fnc_Zone;

} foreach _cities;

hint "Analyse abgeschlossen";

cities = _cities;