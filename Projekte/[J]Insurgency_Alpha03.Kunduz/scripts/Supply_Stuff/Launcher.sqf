_Awh = nearestObjects [spawnstuff, ["ReammoBox_F"], 3];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["BWA3_Box_Launchers", spawnstuff, [], 0, "CAN_COLLIDE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	};