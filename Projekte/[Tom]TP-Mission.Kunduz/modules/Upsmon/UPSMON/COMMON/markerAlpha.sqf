/* =============================================
	!R
	Hide area markers.
	
	create Game Logic Object
	put in initialization field:
	
		nul = call compile preprocessFile "modules\Upsmon\UPSMON\!R\markerAlpha.sqf";

	all markers area must be named area0, area1...area13
		
================================================= */

for "_i" from 0 to 100 do {
	format["area%1", _i] setMarkerAlpha 0;
};

{ _x setmarkeralpha 0; } forEach ["ups_spawn_templates"]; 