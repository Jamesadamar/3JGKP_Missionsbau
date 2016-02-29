// Variablen für IPSCTimer anlegen
_reset = _this select 0;

JGKP_var_Shooter = objNull; // Schütze
JGKP_var_lastShotTime = 0; // Zeit von Start bis zum letzten Schuss
JGKP_var_startTime = 0; // Startzeit Timer
JGKP_var_timerStatus = 0; // Status des Timer: 0 - nicht gestartet 1 - load 2 - ready? 3 - standby

if (_reset == 0) then {
	JGKP_var_menu_blue = nil; // blauen Timer aufgenommen?
	JGKP_var_menu_yellow = nil; // gelben Timer aufgenommen?
};