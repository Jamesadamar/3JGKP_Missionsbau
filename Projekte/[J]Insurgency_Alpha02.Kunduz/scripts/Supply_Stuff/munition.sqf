_Awh = nearestObjects [spawnstuff, ["ReammoBox_F"], 3];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["B_supplyCrate_F", spawnstuff, [], 0, "CAN_COLLIDE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	
	//Munition
	_veh addMagazineCargoGlobal ["30Rnd_mas_556x45_T_Stanag",50];
	_veh addMagazineCargoGlobal ["hlc_20rnd_762x51_b_G3",50];
	_veh addMagazineCargoGlobal ["BWA3_30Rnd_556x45_G36_Tracer",50];
	_veh addMagazineCargoGlobal ["BWA3_30Rnd_556x45_G36",50];
	_veh addMagazineCargoGlobal ["BWA3_120Rnd_762x51",50];
	_veh addMagazineCargoGlobal ["BWA3_200Rnd_556x45",50];
	_veh addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F",50];
	_veh addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",50];
	_veh addMagazineCargoGlobal ["RH_17Rnd_9x19_g17",50];
	_veh addMagazineCargoGlobal ["BWA3_DM25",50];
	_veh addMagazineCargoGlobal ["BWA3_DM51A1",50];
	};