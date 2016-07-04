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
	
	//Medic
	_veh addItemCargoGlobal ["ACE_packingBandage",200];
	_veh addItemCargoGlobal ["ACE_morphine",100];
	_veh addItemCargoGlobal ["ACE_epinephrine",150];
	_veh addItemCargoGlobal ["ACE_atrophrine",75];
	_veh addItemCargoGlobal ["ACE_elasticBandage",200];
	_veh addItemCargoGlobal ["ACE_salineIV_250",200];
	_veh addItemCargoGlobal ["ACE_salineIV_500",100];
	
};