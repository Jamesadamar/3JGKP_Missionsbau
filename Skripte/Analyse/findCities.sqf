/*
	author: 			James
	version: 			1.00
	date: 				2016-02-22
	purpose: 			Analysiert eine Karte nach Städten und Dörfern. Zählt nur begehbare Häuser.
	arguments: 			start (int): Startkoordinate, meist unten links
						end (int): Endkoordinate, meist oben rechts
						resolution (int): Größe eines Planquadrates (z.B. 100m)
						size (int): Größe einer Siedlung, Anzahl der begehbaren Häuser
	return value:		None

	example call: 		[[0,0,0],[5000,5000,0],100,3] execVM "scripts\findCities.sqf";
*/

// arguments
_params = _this;

_start = param [0, [0, 0, 0], [[]], 3];
_end = param [1, [5000, 5000, 0], [[]], 3];
_resolution = param [2, 100,[1]];
_size = param [3, 5, [1]];

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
	
	private ["_cell","_newCell","_direction","_resolution", "_nrBuildings","_marker"];

	_cell = _this select 0;
	_direction = _this select 1;
	_resolution = _this select 2;

	_nrBuildings = {
			count (_x buildingPos -1) > 0;
	} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);

	if (_nrBuildings == 0) exitWith {}; // Stadtende!
	if (_cell in JGKP_var_city) exitWith {}; // Feld bereits abgesucht!

	JGKP_var_city pushBack _cell;

	_marker = createMarker [format["cell:%1", _cell], _cell];
	_marker setMarkerShape "RECTANGLE";
	_marker setMarkerSize [_resolution / 2, _resolution / 2];
	_marker setMarkerColor "ColorEAST";
	_marker setMarkerAlpha 0.3;

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

		// Finde Häuser
		_nrBuildings = {
			count (_x buildingPos -1) > 0;
		} count (nearestObjects [_cell, ["House"], (_resolution / 2) + 10]);
		
		if (_nrBuildings >= _size && ({ _cell in _x } count _cities) == 0) then {
			
			// in benachbarten Quadraten schauen:
			JGKP_var_city = [];
			[_cell, "O",_resolution] call JGKP_fnc_searchSquare;

			_cities pushBack JGKP_var_city;

			/*
			_marker = createMarker [format["cell%1%2", _dy,_dx], _cell];
			_marker setMarkerShape "RECTANGLE";
			_marker setMarkerSize [_resolution / 2, _resolution / 2];
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.3;
			*/
		};
		
		// nächstes Quadrat in x
		_cell = [	(_cell select 0) + _resolution,
					(_cell select 1),
					0
				];
	};

	// nächstes Quadrat in y
	_cell = [	(_start select 0) + _resolution / 2,
				(_cell select 1) + _resolution,
				0
			];
};

hint "Analyse abgeschlossen";

cities = _cities;
