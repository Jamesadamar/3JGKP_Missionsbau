_Awh = nearestObjects [spawnstuff, ["BWA3_Box_Attachments"], 5];

if ((count _Awh)>= 1) then {	
	hint "Bereich ist blockiert"
	} else {
	_veh = createVehicle ["BWA3_Box_Attachments", spawnstuff, [], 0, "NONE"];
	_veh setDir 45;
	[_veh,true] call ace_dragging_fnc_setCarryable;
	[_veh,true] call ace_dragging_fnc_setDraggable;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh; 
	clearBackpackCargoGlobal _veh;
	
	//Signalmittel
	_veh additemcargoGlobal ["BWA3_acc_LLM01_flash",10];
	_veh additemcargoGlobal ["BWA3_optic_NSV600",10];
	_veh additemcargoGlobal ["BWA3_optic_NSA80",10];
	_veh additemcargoGlobal ["ACE_NVG_Gen4",10];
	_veh additemcargoGlobal ["ACE_Flashlight_KSF1",10];
	_veh additemcargoGlobal ["ACE_Flashlight_XL50",10];
};
