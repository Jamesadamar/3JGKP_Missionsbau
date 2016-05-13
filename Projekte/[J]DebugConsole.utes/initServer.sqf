["JGKP_DC_fnc_send_var", {
	
	_code = _this select 0;
	_unit = _this select 1;
	JGKP_DC_server_result = call compile _code;
	(owner _unit) publicVariableClient "JGKP_DC_server_result";

}] call CBA_fnc_addClientToServerEventhandler;