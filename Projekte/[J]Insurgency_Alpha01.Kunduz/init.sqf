JGKP_fnc_createMarkerAndTrigger = compile preprocessFileLineNumbers "functions\createMarkerAndTrigger.sqf";

//**********************************************************************************
//** Initialisieren des UPSMON script
//** steuert die KI anhand von Routinen und Marker
//** es ruft sich selbst ausschließlich auf dem Server und dem HeadlessClient auf
//** http://www.armaholic.com/page.php?id=21935
//**********************************************************************************
call compile preprocessFileLineNumbers "modules\Upsmon\Init_UPSMON.sqf";