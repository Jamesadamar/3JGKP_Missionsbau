_Awh = nearestObjects [spawnstuff, ["ReammoBox_F"], 3];

{
	
	if (_x != cargoUnit) then {
		deleteVehicle _x;
	};
	
} forEach _Awh;

hint "Bereich aufgeräumt"