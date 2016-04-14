_Awh = nearestObjects [spawnstuff, ["BWA3_Box_SpecialWeapons"], 5];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["BWA3_Box_SpecialWeapons", spawnstuff, [], 0, "NONE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;

	//G82
	_veh addweaponcargoGlobal ["BWA3_G82",1];
	_veh addweaponcargoGlobal ["BWA3_Vector",1];
	_veh addmagazinecargoGlobal ["BWA3_10Rnd_127x99_G82_Raufoss",5];
	_veh addmagazinecargoGlobal ["BWA3_10Rnd_127x99_G82_AP",5];
	_veh addmagazinecargoGlobal ["BWA3_10Rnd_127x99_G82_Tracer",5];
	_veh additemcargoGlobal ["BWA3_optic_24x72_NSV",1];
	_veh additemcargoGlobal ["TMR_acc_bipod",1];
	_veh additemcargoGlobal ["ACE_Kestrel4500",1];
	_veh additemcargoGlobal ["ACE_ATragMX",1];
};
