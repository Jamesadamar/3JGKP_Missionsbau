_Awh = nearestObjects [spawnstuff, ["ACE_Box_Misc"], 5];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["ACE_Box_Misc", spawnstuff, [], 0, "NONE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	
	//Signalmittel
	_veh addmagazinecargoGlobal ["Chemlight_red",10];
	_veh addmagazinecargoGlobal ["ACE_HandFlare_Red",10];
	_veh addmagazinecargoGlobal ["Chemlight_green",10];
	_veh addmagazinecargoGlobal ["ACE_HandFlare_White",10];
	_veh addmagazinecargoGlobal ["Chemlight_blue",10];
	_veh addmagazinecargoGlobal ["ACE_HandFlare_Green",10];
};
