//**********************************************************************************
//** Scripted by DasMaeh		v1.0
//**********************************************************************************
//** Wird zum Missionsstart ausgeführt
//** Besonderheit: nur auf dem Server und nur wenn ein Spieler zum Server verbindet
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