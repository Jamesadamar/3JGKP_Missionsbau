/*
	author: 			James
	version: 			1.00
	date: 				2016-05-01
	purpose: 			create template for T8 like in UPSMON
	arguments: 			leader (unit): leader of group, can be any unit
						name (string): var name that will become the global var name for this template
						repeat (int): number of times, the template will be repeated, so a group of 4 men will spawn as a group of 8 men

	return value:		None

	example call: 		[this, "mygroup", 1] execVM "fn_createT8Template.sqf"
*/

if (!isServer) exitWith{};

// arguments
_params = _this;
_leader = param [0, objNull, [objNull]];
_globalName = param [1, "default", ["name"]];
_repeat = param [2, 1, [1]];
_units = [];

if (isNull _leader) exitWith {systemChat "Funktion createT8Template falsch aufgerufen"};

// begin of script

_ignore = [];
{

	if (not (_x in _ignore)) then {

		if (vehicle _x != _x) then {

			// ignore all other crew members
			{
				_ignore pushBack _x;
			} forEach crew vehicle _x;
			
			// nur das Fahrzeug!
			_units pushBack (typeOf vehicle _x);
			
		} else {

			_units pushBack (typeOf _x);

		};
	};

} forEach (units group _leader);

// copy and merge 
for "_i" from 1 to (_repeat-1) do {

	_units append _units;

};


call compile format["%1 = %2", ("JGKP_T8_" + _globalName), _units];

systemChat format["Template %1 erzeugt", ("JGKP_T8_" + _globalName)];
