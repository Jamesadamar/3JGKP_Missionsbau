/*
	author: 			James
	version: 			1.00
	date: 				2016-01-08
	purpose: 			Erzeugt einen Trigger, der einen genausogroßen Marker erzeugt und diesen blau oder rot färbt
	arguments: 			trigger: Auslöser, der als Mittelpunkt dient. Skript übernimmt Breite, Höhe, Ausrichtung und Form
						id (int): Marker-ID, muss einmalig sein!
						min (int): Minimale Auslöszeit (opt) - default 0
						max (int): Maximale Auslöszeit (opt) - default 0
	return value:		None

	example call: 		[trigger1, 1,5,10] execVM "createMarkerAndTrigger.sqf"
*/

// arguments
_params = _this;
// zwingend!
_trigger = _params select 0;
_markerID = _params select 1;

// können weggelassen werden, dann 0
_min = param [2, 0, [0]];
_max = param [3, 0, [0]];

// begin of script
// [a, b, angle, rectangle]
// Maße des Erzeugungstriggers, die übernommen werden!
_area = triggerArea _trigger;
_width = _area select 0;
_height = _area select 1;
_angle = _area select 2;
_isRect = _area select 3; // false -> ellipse

// if shape = true -> rectangle
// create marker
_name = format["3JGKP_Planquadrat%1",_markerID];
_marker = createMarker [_name, _trigger];

// Rechteck oder Ellipse
if (_isRect) then {
	_marker setMarkerShape 	"RECTANGLE";
} else {
	_marker setMarkerShape 	"ELLIPSE";
};

_marker setMarkerSize 	[_height+2,_width+2]; // Marker ist größer, damit Überlappung Grenzen sichtbar macht
_marker setMarkerColor 	"ColorEAST";
_marker setMarkerAlpha 0.3;

// create trigger
_trg = createTrigger ["EmptyDetector",_trigger,true];
_trg setVariable ["marker",_name]; // ordne dem Trigger seinen eigenen Marker zu!


_trg setTriggerArea [_width, _height, _angle, _isRect];
_trg setTriggerActivation ["ANY", "PRESENT", true];
// trigger setTriggerTimeout [min, mid, max, interruptable] 
_trg setTriggerTimeout [_min, (_min+_max)/2, _max,true];
_trg setTriggerStatements [
	"{side _x == EAST} count thislist > 0 && 
	 {side _x == WEST} count thislist == 0 || 
	 {side _x == WEST} count thislist > 0 && 
	 {side _x == EAST} count thislist == 0", 
	"if ({side _x == EAST} count list thistrigger > 0) then {
		(thistrigger getVariable 'marker') setMarkerColor 'ColorEAST';
	} else {
		(thistrigger getVariable 'marker') setMarkerColor 'ColorWEST';
	};",
	""];

// Lösche Erzeugungstrigger
deleteVehicle _trigger;

if ("SquareMarker" call BIS_fnc_getParamValue == 0) then {

	_marker setMarkerAlpha 0;

};

