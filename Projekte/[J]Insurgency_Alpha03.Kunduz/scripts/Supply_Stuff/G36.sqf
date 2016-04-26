_Awh = nearestObjects [spawnstuff, ["ReammoBox_F"], 3];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["BWA3_Box_Weapons", spawnstuff, [], 0, "CAN_COLLIDE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	
	//G36
	_veh addweaponcargoGlobal ["BWA3_G36",7];
	_veh addweaponcargoGlobal ["BWA3_G36_AG",1];
    _veh additemcargoGlobal ["BWA3_acc_LLM01_flash",8];
    _veh additemcargoGlobal ["BWA3_optic_ZO4x30",8];
	};