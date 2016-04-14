if !(isServer) exitWith{};

//Einheit bestimmen
_this = _this select 0;
sleep 0.5;

//Inhalt löschen
clearweaponcargoGlobal _this;
clearmagazinecargoGlobal _this;
clearitemcargoGlobal _this;

//Basis
_this additemcargoGlobal ["ACE_fieldDressing", 20]; //Use on small/medium wounds
_this additemcargoGlobal ["ACE_packingBandage", 30]; //Use on medium/ large wounds
_this additemcargoGlobal ["ACE_tourniquet", 6]; //Use on limbs to quickly halt blood loss
_this additemcargoGlobal ["ACE_morphine", 16]; //Use to relieve pain, and lower heart rate
_this additemcargoGlobal ["ACE_atropine", 16]; //Greatly lowers heart rate, NBC usage in future
_this additemcargoGlobal ["ACE_epinephrine", 16]; //Use to raise heart rate
_this additemcargoGlobal ["ACE_plasmaIV", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_plasmaIV_500", 5]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_plasmaIV_250", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV_500", 5]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV_250", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV", 5]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV_500", 10]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV_250", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_quikclot", 20]; //Use on small wounds, or to partially seal medium/large wounds
_this additemcargoGlobal ["ACE_surgicalKit", 3]; //Wunden vernähen
_this additemcargoGlobal ["ACE_elasticBandage", 20]; //use on small/partial wounds
_this additemcargoGlobal ["ACE_personalAidKit", 12]; //Use to fully heal, usage limited depending on settings
_this additemcargoGlobal ["ACE_NVG_Gen1",1];
_this addmagazinecargoGlobal ["ACE_HandFlare_Green",2];
_this addmagazinecargoGlobal ["SmokeShellGreen",2];
_this addweaponcargoGlobal ["tf_anprc148jem",1];
_this addweaponcargoGlobal ["ACE_CableTie",20];
_this addmagazinecargoGlobal ["B_IR_Grenade",1];
_this addweaponcargoGlobal ["ACE_Vector",1];
//_this additemcargoGlobal ["BWA3_ItemNaviPad",1];
_this addweaponcargoGlobal ["ACE_MapTools",1];
_this additemcargoGlobal ["ACE_EarPlugs",10];
_this additemcargoGlobal ["ACE_wirecutter",1];


//Jg Grp
_this addweaponcargoGlobal ["BWA3_RGW90_Loaded",2];
_this addweaponcargoGlobal ["BWA3_Pzf3_Loaded",2];
//_this addmagazinecargoGlobal ["BWA3_RGW90_HH",2];
//_this addmagazinecargoGlobal ["BWA3_Pzf3_IT",2];
_this additemcargoGlobal ["ACE_NVG_Gen1",10];
_this addmagazinecargoGlobal ["BWA3_120Rnd_762x51",8];
_this addmagazinecargoGlobal ["BWA3_200Rnd_556x45",8];
_this addmagazinecargoGlobal ["BWA3_30Rnd_556x45_G36_Tracer",36];
_this addmagazinecargoGlobal ["BWA3_10Rnd_762x51_G28_Tracer",10];
_this addmagazinecargoGlobal ["BWA3_15Rnd_9x19_P8",6];
_this addmagazinecargoGlobal ["BWA3_DM51A1",15];
_this addmagazinecargoGlobal ["1Rnd_HE_Grenade_shell",15];
_this additemcargoGlobal ["BWA3_optic_NSV600",10];
_this additemcargoGlobal ["BWA3_optic_NSA80",2];
_this addmagazinecargoGlobal ["B_IR_Grenade",10];
_this addmagazinecargoGlobal ["Chemlight_blue",15];
_this addmagazinecargoGlobal ["Chemlight_red",15];
_this addmagazinecargoGlobal ["Chemlight_green",15];

_this addmagazinecargoGlobal ["1Rnd_SmokeRed_Grenade_shell",5];
_this addmagazinecargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",5];
_this addmagazinecargoGlobal ["1Rnd_Smoke_Grenade_shell",5];
_this addmagazinecargoGlobal ["UGL_FlareYellow_F",5];
_this addmagazinecargoGlobal ["UGL_FlareGreen_F",2];
_this addmagazinecargoGlobal ["UGL_FlareRed_F",2];
_this addmagazinecargoGlobal ["SmokeShellGreen",3];
_this addmagazinecargoGlobal ["SmokeShellRed",3];
_this addmagazinecargoGlobal ["BWA3_DM25",5];
_this addmagazinecargoGlobal ["ACE_HandFlare_Yellow",3];
_this addmagazinecargoGlobal ["ACE_HandFlare_green",3];

_this additemcargoGlobal ["ACE_Sandbag_empty",40];