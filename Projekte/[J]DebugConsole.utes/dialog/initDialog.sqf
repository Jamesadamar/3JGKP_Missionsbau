/*
	author: 			James
	version: 			1.00
	date: 				2016-04-06
	purpose: 			initialize dialog
	arguments: 			[dialog]
	return value:		None

	example call: 		[] execVM ""
*/
disableSerialization;

// arguments
_params = _this;
_display = _this select 0;

// begin of script
_access = true;
_level = 3; // default höchste Level für SP, sonst in MP Neusetzung durch Server

// Wenn SP -> immer voller Dialog
// Wenn MP -> prüfe ob Mitglied -> falls nein, schließe Dialog
if (isMultiplayer) then {

	ResultIsMember = nil;
	["jgkp_is_member", [player]] call CBA_fnc_clientToServerEvent;  
	waitUntil {!isNil "ResultIsMember "};

	if (!ResultIsMember) then {

		closeDialog 0;
		_access = false;

		// log-Eintrag in DB log anlegen
		["jgkp_log_action", [getPlayerUID player, "DebugConsole", "[login, gescheitert]"]] call CBA_fnc_clientToServerEvent;

	};

	// Wenn MP und Mitglied, prüfe Rang
	ResultRightInfo = nil;
	["jgkp_get_right", [player,"DebugConsole"]] call CBA_fnc_clientToServerEvent;
	waitUntil {!isNil "ResultRightInfo"};

	_level = parseNumber ResultRightInfo;

};

if (!_access) exitWith { hint format["Dialog nur für Mitglieder der 3.!"]; };


// Lade Variable aus profileNamespace
JGKP_DC_Commands = profileNamespace getVariable ["JGKP_DC_Commands",[]];

JGKP_DC_Rows = profileNamespace getVariable ["JGKP_DC_Rows",[]];


// Befülle alle Felder mit den geladenen Werten:
// Rows
{
	
	_inputIDC = _x select 0;
	_code = _x select 1;

	// Befülle Combobox
	if (typeName _code == "ARRAY") then {

		{

			(_display displayCtrl _inputIDC) lbAdd _x;

		} forEach _code;

	} else {

		ctrlSetText [_inputIDC, _code];

	};

} forEach JGKP_DC_Rows;

// für angepinnte Felder -> ausgrauen und Text ändern
if (!isNil "JGKP_DC_Pin_Value") then {

	{
		_inputIDC = _x select 0;
		_buttonIDC = _inputIDC + 200; // button hat IDC + 200
		// Sperre Feld und Button so lang
		ctrlEnable [_inputIDC, false];
		ctrlSetText [_buttonIDC, "Unpin"];

	} forEach JGKP_DC_Pin_Value;

};


// button status
// SETZE ALLE OPTIONEN
{

	[_x, 3100] call JGKP_DC_fnc_readOption;

} forEach JGKP_DC_options;

// DEAKTIVIERE BUTTON GEMÄß ACCESS LEVEL
_access_options = JGKP_DC_access_level select _level;

hintSilent format["Zugangslevel:\n%1", _access_options select 1];

{

	_idc = _x;
	ctrlEnable [_idc, false];

} forEach (_access_options select 2); // Klammern...