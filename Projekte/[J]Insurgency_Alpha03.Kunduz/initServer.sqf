//**********************************************************************************
//** Scripted by DasMaeh		v1.0
//**********************************************************************************
//** Wird zum Missionsstart ausgeführt
//** Besonderheit: nur auf dem Server und nur beim ersten Start der Mission
//**
//**
//**********************************************************************************
//** Argumente:
//**		- keine -
//**********************************************************************************
//** Quelle(n):
//** Event-Scripts: 		https://community.bistudio.com/wiki/Event_Scripts
//** Startreihenfolge: 	https://community.bistudio.com/wiki/Functions_Library_%28Arma_3%29#Initialization_Order
//**********************************************************************************

//**********************************************************************************
//** Starten des AdvancedZeusScript von "Belbo"
//** fügt alle 10 Sekunden alle neuen Einheiten dem eingetragenen Zeus hinzu
//** http://www.armaholic.com/page.php?id=26273
//**********************************************************************************
//** Aufruf:
//** 	[CuratormodulesName,true] execVM "modules\Advanced_Zeus\ADV_zeus.sqf";
//** 	CuratormodulesName = your curator modules name
//** 	true = boolean, if civilians should be editable by zeus as well - set to false if you don't want civilians to be editable.
//**********************************************************************************

//================= Vorbereitungen ==========================================================================================================================================//
//Debug Standardmäßig aus
coyote_debug = false;
publicVariable "coyote_debug";


//================= HC-Mover ================================================================================================================================================//

// whenever a hc connects -> find out its owner id
// JIP compatible with hc get kicked
"JGKP_HC" addPublicVariableEventHandler
{
	//Auslesen der ID des HC-Servers
	COY_HC_Id = owner JGKP_HC;
	publicVariable "COY_HC_Id";
};

[] spawn compile preprocessFileLineNumbers "HC_Mover\HC_Mover_Red.sqf";      //Aktiviert HC-Mover für OPFOR Einheiten         wenn nicht benötigt mit // deaktivieren
[] spawn compile preprocessFileLineNumbers "HC_Mover\HC_Mover_Green.sqf";    //Aktiviert HC-Mover für Resistance Einheiten    wenn nicht benötigt mit // deaktivieren
//[] spawn compile preprocessFileLineNumbers "HC_Mover\HC_Mover_Blue.sqf";     //Aktiviert HC-Mover für Bluefor Einheiten       wenn nicht benötigt mit // deaktivieren
//[] spawn compile preprocessFileLineNumbers "HC_Mover\HC_Mover_Violet.sqf";   //Aktiviert HC-Mover für Zivile Einheiten        wenn nicht benötigt mit // deaktivieren

// Skript für Markererstellung
JGKP_fnc_createMarkerAndTrigger = compile preprocessFileLineNumbers "functions\createMarkerAndTrigger.sqf";