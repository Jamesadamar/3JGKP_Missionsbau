// rüstet einen Spieler nach dem Respawn mit seinem DB Loadout aus
["jgkp_equip_loadout", [player, player getVariable ["LoadoutID", 164]]] call CBA_fnc_serverEvent;