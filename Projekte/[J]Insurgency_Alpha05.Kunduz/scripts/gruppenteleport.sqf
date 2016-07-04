// Gruppenteleport by James

_grp = group player;
_unitlist = units _grp;

_unitlist = _unitlist - [player];

player setpos getpos (_unitlist select 0);