//**********************************************************************************
//** Scripted by DasMaeh		v1.0
//**********************************************************************************
//** OnDisconnect of the HC, re-init his units and takeover
//**********************************************************************************
//** Arguments:
//**		- none -
//**********************************************************************************

UPSMON_HC_DISCONNECT = ["UPSMON_HC_DISCONNECT1", "onPlayerDisconnected", {
	if (_name == UPSMON_HC) then {
		{
			_Group_Leader = leader (_x select 0); 
			_group = _x select 0;
			_parameter = _x;
			_parameter set [0,_Group_Leader];
			nul = _parameter execVM "modules\Upsmon\UPSMON.sqf";
		} forEach UPSMON_NPCs_HC;
		
		{
			_Group_Leader = leader (_x select 0); 
			_group = _x select 0;
			_parameter = _x;
			_parameter set [0,_Group_Leader];
			nul = _parameter execVM "modules\Upsmon\UPSMON.sqf";
		} forEach UPSMON_Civs_HC;
	};
}] call BIS_fnc_addStackedEventHandler;