_Awh = nearestObjects [spawnstuff, ["BWA3_Box_Launchers"], 5];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["BWA3_Box_Launchers", spawnstuff, [], 0, "NONE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;

	//PZF3
	_veh addweaponcargoGlobal ["BWA3_Pzf3_Loaded",4];
	_veh additemcargoGlobal ["BWA3_optic_NSA80",4];
};
