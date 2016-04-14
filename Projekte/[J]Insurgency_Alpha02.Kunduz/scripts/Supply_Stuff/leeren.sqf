_Awh = nearestObjects [spawnstuff, ["B_supplyCrate_F","BWA3_Box_Weapons","BWA3_Box_SpecialWeapons","BWA3_Box_Ammo","BWA3_Box_Attachments","BWA3_Box_Launchers","ACE_Box_Misc"], 5];

{
	deleteVehicle _x;
} forEach _Awh;

hint "Bereich aufgeräumt"