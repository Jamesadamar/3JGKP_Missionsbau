private ["_text1","_text2"];

_text1 = _this select 0;
_text2 = _this select 1;

if (!(isDedicated)) then
{
	if (coyote_debug) then {player sideChat format ["%1 %2",_text1,_text2];};
};