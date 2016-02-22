# Snippets
Hier können Code-Snippets abgelegt werden, die noch keine vollständigen Skripte ergeben oder einfach nur zum Testen sind

## Gelände

Sucht die Umgebung (10000 km) nach allen benannten Städten, Dörfern und Lokalitäten ab, setzt Marker an diese Stelle.
```Sqf
{ 
  _marker = createMarker [str(_x), getpos _x]; 
  _marker setMarkerType "C_unknown";  
  hint str(_x);
  sleep 2;
} foreach (nearestLocations [position player, ["NameCity","NameVillage","NameLocal"], 10000]);
```
