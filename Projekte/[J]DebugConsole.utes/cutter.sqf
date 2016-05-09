_trg = _this select 0;

_area = triggerArea _trg;
_a = _area select 0; // Hälfte der Breite in x
_b = _area select 1; // Hälfte der Breite in y
_pos = position _trg;


// untere linke Ecke von trigger area
_startPos = [
	(_pos select 0) - _a,
	(_pos select 1) - _b,// Richtung hängt von Karte ab!
	_pos select 2
];

_width = 10; // Größe des Rasenmäher (groß)

// Höhe: z.B. 100m / 10m = 10 Rasenmäher in x
for "_i" from 0 to (round(2 * _a / _width) - 1) do {

	// Breite: z.B. 100m / 10m = 10 Rasenmäher in y
	for "_j" from 0 to (round(2 * _b / _width) - 1) do {

		_spawnPos = [
			(_startPos select 0) + _width / 2 + _j * _width,
			(_startpos select 1) + _width / 2 + _i * _width,
			0
		];

		createVehicle ["Land_ClutterCutter_large_F", _spawnPos, [], 0, "CAN_COLLIDE"];

	};
};