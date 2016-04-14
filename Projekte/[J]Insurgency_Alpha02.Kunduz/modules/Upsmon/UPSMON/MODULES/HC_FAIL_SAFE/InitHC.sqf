//**********************************************************************************
//** Scripted by DasMaeh		v1.0
//**********************************************************************************
//** Giving the Server the information needed to take over all the groups covered by
//** the Headless Client in case of a disconnect by the Headless Client.
//** Send an array of all groups controlled by HCsUPSMON with its init parameter
//**********************************************************************************
//** Arguments:
//**		- none -
//**********************************************************************************

while {true} do {
	UPSMON_NPCs_HC = [];
	UPSMON_Civs_HC = [];
	{
		_UPSMON_PARAMETER = _x getVariable "UPSMON_Ucthis";
		if (!(isNil "_UPSMON_PARAMETER")) then {
			UPSMON_NPCs_HC = UPSMON_NPCs_HC + [_UPSMON_PARAMETER];
		};
	}foreach UPSMON_NPCs;
	{
		_UPSMON_PARAMETER = _x getVariable "UPSMON_Ucthis";
		if (!(isNil "_UPSMON_PARAMETER")) then {
			UPSMON_Civs_HC = UPSMON_Civs_HC + [_UPSMON_PARAMETER];
		};
	}foreach UPSMON_Civs;

	publicVariableServer "UPSMON_NPCs_HC";
	publicVariableServer "UPSMON_Civs_HC";
	
	sleep 30;
};