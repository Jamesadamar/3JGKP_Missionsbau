_cargoUnit = _this select 0; //get cargo unit on which the script should run

_ID = _this select 2;

_cargoUnit removeAction _ID;

_cargoUnit addAction [("<t color=""#475135"">" + "----------Versorgung----------" + "</t>"),"",""];
_cargoUnit addAction ["Räumen", "scripts\Supply_Stuff\leeren.sqf"];
_cargoUnit addAction ["Leere Versorgungskiste", "scripts\Supply_Stuff\kiste.sqf"];
_cargoUnit addAction ["Leere Waffenkiste", "scripts\Supply_Stuff\waffenkiste.sqf"];
_cargoUnit addAction ["Leere Scharfschützenkiste", "scripts\Supply_Stuff\ZF.sqf"];
_cargoUnit addAction ["Leere PZF-FIF Kiste", "scripts\Supply_Stuff\Launcher.sqf"];
_cargoUnit addAction ["Leere Visiere und Aufsätze Kiste", "scripts\Supply_Stuff\Attach.sqf"];
_cargoUnit addAction ["Leere Toolkiste", "scripts\Supply_Stuff\Misc.sqf"];
_cargoUnit addAction ["Leere Munitionskiste", "scripts\Supply_Stuff\Mun.sqf"];
_cargoUnit addAction ["Versorgungskiste Medical", "scripts\Supply_Stuff\medical.sqf"];
_cargoUnit addAction ["Versorgungskiste Munition","scripts\Supply_Stuff\munition.sqf"];
_cargoUnit addAction ["Versorgungskiste G36","scripts\Supply_Stuff\G36.sqf"];
_cargoUnit addaction ["Versorgungskiste G82", "scripts\Supply_Stuff\G82.sqf"];
_cargoUnit addAction ["Versorgungskiste FIF", "scripts\Supply_Stuff\FIF.sqf"];
_cargoUnit addAction ["Versorgungskiste PZF3", "scripts\Supply_Stuff\PZF3.sqf"];
_cargoUnit addAction ["Versorgungskiste G36 Tracer Munition", "scripts\Supply_Stuff\G36Tracer.sqf"];
_cargoUnit addAction ["Versorgungskiste G36 AP Munition", "scripts\Supply_Stuff\G36AP.sqf"];
_cargoUnit addAction ["Versorgungskiste MG3 Munition", "scripts\Supply_Stuff\MG3.sqf"];
_cargoUnit addAction ["Versorgungskiste MG4 Munition", "scripts\Supply_Stuff\MG4.sqf"];
_cargoUnit addAction ["Versorgungskiste MG5 Munition", "scripts\Supply_Stuff\MG5.sqf"];
_cargoUnit addAction ["Versorgungskiste P8 Munition", "scripts\Supply_Stuff\P8.sqf"];
_cargoUnit addAction ["Versorgungskiste Unterlauf Munition", "scripts\Supply_Stuff\Unterlauf.sqf"];
_cargoUnit addAction ["Versorgungskiste Granaten", "scripts\Supply_Stuff\Granaten.sqf"];
_cargoUnit addAction ["Versorgungskiste Hunt IR", "scripts\Supply_Stuff\HuntIr.sqf"];
_cargoUnit addAction ["Versorgungskiste Nachtkampf", "scripts\Supply_Stuff\Nachtkampf.sqf"];
_cargoUnit addAction ["Versorgungskiste Signalmittel", "scripts\Supply_Stuff\Signalmittel.sqf"];
