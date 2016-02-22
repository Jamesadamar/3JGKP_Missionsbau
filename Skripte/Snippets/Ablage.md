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

Dieser sehr merkwürdige und mächtige Befehl sucht nach Plätzen, die "houses" haben, leider ist das in ArmA3 aber nur 1!! Haus. Es werden im Radius von 1000 Metern Häuser gesucht und 100 Zufallsplätze zurückgegeben. Nur wenn der Platz tatsächlich ein Haus enthält, wird dann dort ein Marker erzeugt. Damit kann man leider noch keine Ansammlungen von Häusern feststellen, aber immerhin.
```Sqf
{  
  if (_x select 1 == 1) then {  
    _marker = createMarker [str(_x), _x select 0]; 
    _marker setMarkerType "C_unknown";  
  }; 
} foreach selectBestPlaces [position player, 1000, "houses", 25, 100];
```

Klassiker nearestObjects sollte für diesen Fall doch am besten sein. Es gibt leider nur `nearestBuilding` und nicht Buildings, und der Unterschied zu nearestEntitiy ist nicht ganz klar, aber es findet alle Objekte vom Typ "house" im Umkreis von 200. Idee: Karte in 100mx100m Suchquadrate einteilen und nach Häusern suchen, wenn mehr als 5, Dorf gefunden?
Aktuell: house umfasst auch Zäune und Mauern, Building auch.
```SQF
nearestObjects [player, ["house"], 200];
```

Erweiterung des Codes von oben. Hiermit werden wirklich nur begehbare Häuser gefunden. Erlaubt somit sichere Identifizierung größerer Städte (obgleich hier noch alle Häuser einzeln gefunden werden, das müsste man also noch aggregieren). 
Problem: Klappt nur mit begehbaren Häusern, Inseln wie Chernarus sind damit so nicht möglich!
```SQF
{ 
  if (count (_x buildingPos -1) > 0) then {  
    _marker = createMarker [str(_x), _x];  
    _marker setMarkerType "C_unknown"; 
  };
} foreach (nearestObjects [player, ["House"], 100])
```


