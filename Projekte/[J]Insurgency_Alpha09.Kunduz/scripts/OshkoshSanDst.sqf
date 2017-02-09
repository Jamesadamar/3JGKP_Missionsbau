if !(isServer) exitWith{};

//Einheit bestimmen
_this = _this select 0;
sleep 0.5;

//Inhalt löschen
clearweaponcargoGlobal _this;
clearmagazinecargoGlobal _this;
clearitemcargoGlobal _this;

//Basis
_this additemcargoGlobal ["ACE_fieldDressing", 100]; //Use on small/medium wounds
_this additemcargoGlobal ["ACE_packingBandage", 100]; //Use on medium/ large wounds
_this additemcargoGlobal ["ACE_tourniquet", 10]; //Use on limbs to quickly halt blood loss
_this additemcargoGlobal ["ACE_morphine", 50]; //Use to relieve pain, and lower heart rate
_this additemcargoGlobal ["ACE_atropine", 50]; //Greatly lowers heart rate, NBC usage in future
_this additemcargoGlobal ["ACE_epinephrine", 50]; //Use to raise heart rate
_this additemcargoGlobal ["ACE_plasmaIV", 50]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_plasmaIV_500", 50]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_plasmaIV_250", 10]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV", 0]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV_500", 50]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_bloodIV_250", 25]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV", 200]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV_500", 100]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_salineIV_250", 50]; //Use to counteract blood loss
_this additemcargoGlobal ["ACE_quikclot", 50]; //Use on small wounds, or to partially seal medium/large wounds
_this additemcargoGlobal ["ACE_surgicalKit", 5]; //Wunden vernähen
_this additemcargoGlobal ["ACE_elasticBandage", 50]; //use on small/partial wounds
_this additemcargoGlobal ["ACE_personalAidKit", 5]; //Use to fully heal, usage limited depending on settings

sleep 1800;

_this execVM "scripts\loadouts\Fahrzeuge\OshkoshSanDst.sqf"