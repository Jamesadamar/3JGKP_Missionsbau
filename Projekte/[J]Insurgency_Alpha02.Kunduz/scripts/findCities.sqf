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
	parseText "<t color='#ff0000' size='2'>Kein gültigen Auslöser übergeben!</t>" remoteExec ["hint", 0];
};

_trgArea = triggerArea _trg;
			_start = [	(getpos _trg select 0) - (_trgArea select 0),
						(getpos _trg select 1) - (_trgArea select 0) * _yDir,
						0 
					];

_end = 				[	(getpos _trg select 0) + (_trgArea select 0),
						(getpos _trg select 1) + (_trgArea select 0) * _yDir,
						0 
					];
_resolution =  		"SquareSize" call BIS_fnc_getParamValue; // siehe Description
_size = 			"CitySize" call BIS_fnc_getParamValue; // siehe Description
_markerID = 		1;
_safetyDistance = 	"SafetyDistance" call BIS_fnc_getParamValue; // siehe Description

// begin of script
_distanceX = (_end select 0) - (_start select 0); // 5000 - 0 = 5000 m in x
_distanceY = (_end select 1) - (_start select 1); // 5000 - 0 = 5000 m in y

_stepsX = _distanceX / _resolution; // z.B: 5000 / 100 = 50 Quadrate nach rechts
_stepsY = _distanceY / _resolution; // z.B: 5000 / 100 = 50 Quadrate nach oben

_cell = [	(_start select 0) + _resolution / 2,
			(_start select 1) + _resolution / 2, 
			0
		]; // Beginne in der Mitte des 1. Quadrats

_cities = []; // empty array for later

JGKP_fnc_searchSquare = {
	
	private ["_cell", "_newCell", "_direction", "_resolution", "_nrBuildings", "_marker"];

	_cell = _this select 0;
	_direction = _this select 1;
	_resolution = _this select 2;

	_nrBuildings = {
			count (_x buildingPos -1) > 0;
	} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);

	if (_nrBuildings == 0) exitWith {}; // Stadtende!
	if (_cell in JGKP_var_city) exitWith {}; // Feld bereits abgesucht!

	JGKP_var_city pushBack _cell;

	// durchsuche angrenzende Quadrate
	if (_direction != "W") then {

		// left
		_newCell = [	(_cell select 0) - _resolution,
					_cell select 1,
					0
				];

		[_newCell, "E",_resolution] call JGKP_fnc_searchSquare;
	};

	if (_direction != "E") then {

		// right
		_newCell = [	(_cell select 0) + _resolution,
					_cell select 1,
					0
				];

		[_newCell, "W",_resolution] call JGKP_fnc_searchSquare;
	};

	if (_direction != "N") then {

		// north
		_newCell = [	_cell select 0,
					(_cell select 1) + _resolution,
					0
				];

		[_newCell, "S",_resolution] call JGKP_fnc_searchSquare;
	};

	if (_direction != "S") then {

		// south
		_newCell = [	_cell select 0,
					(_cell select 1) - _resolution,
					0
				];

		[_newCell, "N",_resolution] call JGKP_fnc_searchSquare;
	};

};

for "_dy" from 1 to _stepsY do {
	
	for "_dx" from 1 to _stepsX do {
		
		// überspringe aktuelles Quadrat, falls näher als 1000m an der Basis
		if (_cell distance2D (position JGKP_loc_base) < _safetyDistance) then {

			_cell = [	(_cell select 0) + _resolution,
						(_cell select 1),
						0
			];

		} else {

		// Finde Häuser
		_nrBuildings = {
			count (_x buildingPos -1) > 0;
		} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);
		

		if (_nrBuildings >= _size && ({ _cell in _x } count _cities) == 0) then {
			
			// in benachbarten Quadraten schauen:
			JGKP_var_city = [];
			[_cell, "O",_resolution] call JGKP_fnc_searchSquare;

			_cities pushBack JGKP_var_city;
		};
		
		// nächstes Quadrat in x
		_cell = [	(_cell select 0) + _resolution,
					(_cell select 1),
					0
				];

		};

	};

	// nächstes Quadrat in y
	_cell = [	(_start select 0) + _resolution / 2,
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

	// Erzeuge für jede Stadt eine Upsmon-Zone mit viel Dynamik
	_trgUpsmon = createTrigger ["EmptyDetector", _centre select 0, false];

	// Auslöseradius + 1 km für Spieler! 
	// TODO: eventuell erhöhen?!
	_trgUpsmon setTriggerArea [	
		(_centre select 1) + 750, // 750 Meter vor Grenze Spawn auslösen
		(_centre select 2) + 750, 
		0, 
		false
	];

	// Dynamische Anpassung an Spieleranzahl und Stadtgröße!
	_templates = [];

	// Anzahl an Templates in Abhängigkeit von Stadtgröße bestimmen
	switch (count _city) do {
		case 1;
		case 2;
		case 3: {
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			};
		};
		case 4;
		case 5;
		case 6;
		case 7: {
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			};

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_motorized call BIS_fnc_selectRandom]; // Cars
			};
		};
		case 8;
		case 9;
		case 10;
		case 11;
		case 12: {
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
				_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			};

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_motorized call BIS_fnc_selectRandom]; // Cars
			};

			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men

			_templates pushBack [JGKP_var_template_static call BIS_fnc_selectRandom]; // static
			_templates pushBack [JGKP_var_template_car call BIS_fnc_selectRandom]; // Cars
		};
		case 13;
		case 14;
		case 15: {
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_static call BIS_fnc_selectRandom]; // static
			_templates pushBack [JGKP_var_template_car call BIS_fnc_selectRandom]; // UAZ
			_templates pushBack [JGKP_var_template_armored call BIS_fnc_selectRandom]; // armored

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_motorized call BIS_fnc_selectRandom]; // Cars
			};
		};
		default {
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_small_grp call BIS_fnc_selectRandom]; // 4-5 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_big_grp call BIS_fnc_selectRandom]; // 8-12 men
			_templates pushBack [JGKP_var_template_static call BIS_fnc_selectRandom]; // static
			_templates pushBack [JGKP_var_template_static call BIS_fnc_selectRandom]; // static
			_templates pushBack [JGKP_var_template_car call BIS_fnc_selectRandom]; // UAZ
			_templates pushBack [JGKP_var_template_armored call BIS_fnc_selectRandom]; // armored
			_templates pushBack [JGKP_var_template_armored call BIS_fnc_selectRandom]; // armored

			if (random 1 > 0.5) then {
				_templates pushBack [JGKP_var_template_motorized call BIS_fnc_selectRandom]; // Cars
			};
		};
	};

	_tempString = "";

	{
		_temp = _x;
		_tempNr = _x select 0; // template Nummer

		_behaviour = format["%1", str(["CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"] call BIS_fnc_selectRandom)];
		_speedMode = format["%1", str(["LIMITED", "FULL", "NORMAL"] call BIS_fnc_selectRandom)];
		_formation = format["%1", str(["LINE", "STAG COLUMN", "COLUMN", "VEE", "WEDGE"] call BIS_fnc_selectRandom)];

		_upsArgs = format["%1, %2, %3", _behaviour, _speedMode, _formation];

		// Verhalten für Infanterie
		if (_tempNr in JGKP_var_template_small_grp or 
			_tempNr in JGKP_var_template_big_grp) then {

			// zufälliges fortify
			/*
			_fortify = random 1;
			if (_fortify > 1) then {

				_fortify = format["%1", str("FORTIFY")];
				_upsArgs = format["%1, %2", _upsArgs, _fortify];

			};
			*/

			// zufälliges nofollow
			_nofollow = random 1;
			if (_nofollow > 0.5) then {

				_nofollow = format["%1", str("NOFOLLOW")];
				_upsArgs = format["%1, %2", _upsArgs, _nofollow];

			};

			// zufälliges ambush + ambushdist zwischen 0 und resolution / 2, sofern nicht fortify
			_ambush = random 1;
			if (_ambush > 0.75) then {

				_ambush = format[
					"%1, 'AMBUSHDIST:', %2",
					str(["AMBUSH","AMBUSH2"] call BIS_fnc_selectRandom),
					random (_resolution / 2)
				];
				_upsArgs = format["%1, %2", _upsArgs, _ambush];

			};

			// zufälliges random, sofern nicht ambush
			_random = random 1;
			if (_random > 0.6 and 
				typeName _ambush != "STRING") then {

				_random = format["%1", str(["RANDOMUP", "RANDOMDN", "RANDOMA"] call BIS_fnc_selectRandom)];
				_upsArgs = format["%1, %2", _upsArgs, _random];

			};

			// zufälliges noshare
			_noshare = random 1;
			if (_noshare > 0.75) then {

				_noshare = format["%1", str("NOSHARE")];
				_upsArgs = format["%1, %2", _upsArgs, _noshare];

			};


			// Verhalten für Fahrzeuge
		} else {

			if (_tempNr in JGKP_var_template_car or
				_tempNr in JGKP_var_template_armored) then {

				_onroad = format["%1", str("ONROAD")];
				_upsArgs = format["%1, %2", _upsArgs, _onroad];
			};

		};

		_upsArgs = format["%1, %2, %3, %4, %5", _upsArgs, str("RANDOM"), str("DELETE:"), 120, str("RADIORANGE:"), 500];

		_tempString = format["%1 %2",
			_tempString,
			format["nul = [%1, %2, %3, [%4, %5]] execVM %6;",
				_tempNr,
				_centre select 0,
				1, 
				str(_markerBorder), 
				_upsArgs,
				str("modules\Upsmon\UPSMON\MODULES\UPSMON_spawn.SQF")
			]
		];

	} forEach _templates;


	_trgUpsmon setTriggerActivation ["WEST", "PRESENT", false];
	_trgUpsmon setTriggerStatements [
		"this",
		_tempString,
		""
	];

	_trgUpsmon setTriggerTimeout [1, 10, 30, false];

} foreach _cities;

hint "Analyse abgeschlossen";

cities = _cities;