////////////////////////////////////////////////////////////////////////////////////
// V1.2
// Scripted by AH-Coyote & James
//
//
//Verschiebt alle 60 sec. alle OPFOR-KI-Infanterie Einheiten auf den HC
//Bereits verschobene Einheiten werden nicht berücksichtigt.
////////////////////////////////////////////////////////////////////////////////////
if (!isServer) exitWith {};
// wait before starting scripts in first place until COY_HC_Id is known
waitUntil {not isNil "COY_HC_ID"};

while {true} do
{
    _ListOfAllGroupsNichtHC = [];

    {
        if( (side _x == east)       &&
            (count (synchronizedObjects (leader _x)) == 0) && 
            (_x isKindOf "Man")     &&
            (owner _x != COY_HC_Id) &&
            (!isplayer _x)          &&
            !(group _x in _ListOfAllGroupsNichtHC)
        )then
        {
            _ListOfAllGroupsNichtHC pushBack (group _x);
        };
    }forEach list COY_Debug_Trigger;

    _MoverCount = count _ListOfAllGroupsNichtHC;
    
    {_x setGroupOwner COY_HC_Id} forEach _ListOfAllGroupsNichtHC;
    
    [[_MoverCount,"OPFOR Gruppen auf HC verschoben."],"COY_Fnc_MP_Debug"] spawn BIS_fnc_MP;//Debug Einblendung
    
    sleep 60;
};
