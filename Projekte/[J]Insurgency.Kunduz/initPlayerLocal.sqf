//**********************************************************************************
//** Scripted by DasMaeh		v1.0
//**********************************************************************************
//** Wird zum Missionsstart ausgeführt
//** Besonderheit: nur Lokal auf dem Client!
//** (beeinhaltet sowohl den Missionsstart als auch JoinInProgress)
//**
//**********************************************************************************
//** Argumente:
//**		[player:Object, didJIP:Boolean]
//**********************************************************************************
//** Quelle(n):
//** Event-Scripts: 		https://community.bistudio.com/wiki/Event_Scripts
//** Startreihenfolge: 	https://community.bistudio.com/wiki/Functions_Library_%28Arma_3%29#Initialization_Order
//**********************************************************************************

//** Initialisieren der ScriptLokalen Variablen
private ["_player", "_jip"];

//** Auslesen der Parameter
_player = _this select 0;	// Welcher Spieler löste das Script aus?
_jip = _this select 1;		// War es ein JoinInProgress?

//**********************************************************************************
//** Setzt bei jedem Sprechvorgang (auch ohne Funkgerät), die Verschlüsselung der
//** Funkgeräte (Shortwave und Longwave) auf den Wert "_maeh". Hierdurch können jetzt
//** auch die Funkgeräte Fraktionsübergreifend miteinander genutzt werden.
//** Sollte bei TvT deaktiviert werden ?!
//**********************************************************************************
["RadioCodeLW", "OnSpeak", {[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, "_maeh"] call TFAR_fnc_setLrRadioCode;}, Player] call TFAR_fnc_addEventHandler;
["RadioCodeSW", "OnSpeak", {[call TFAR_fnc_activeSwRadio, "_maeh"] call TFAR_fnc_setSwRadioCode;}, Player] call TFAR_fnc_addEventHandler;


// when hc is connected -> inform server
if (not isServer and not hasInterface) then {
	JGKP_HC = player;
	publicVariableServer "JGKP_HC";
};