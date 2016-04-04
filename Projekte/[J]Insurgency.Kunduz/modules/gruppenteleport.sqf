// Gruppenteleport by James

_unit = (_this select 3) select 0; //Spieler auslesen, auch wenn unnötig

_grp = group _unit;
_unitlist = units _grp;

_unitlist = _unitlist - [_unit];

_unit setpos getpos (_unitlist select 0);