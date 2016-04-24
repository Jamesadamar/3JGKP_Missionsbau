/*
	author: 			James
	version: 			1.00
	date: 				2016-04-17
	purpose: 			zeige oder verberge Marker für alle Einheiten
	arguments: 			option (name): Name der Option
	return value:		None

	example call: 		['JGKP_DC_options_marker'] execVM "marker.sqf"
*/
disableSerialization;

// arguments
_params = _this;
_name = _params select 0;

// begin script
// find option with given name
_return = [_name] call JGKP_DC_fnc_findOption; // returns [index, option]

_index = _return select 0;
_option = _return select 1;

_status = _option select 1;
_idc = _option select 2;
_control = ((findDisplay 3100) displayCtrl _idc);
_trueOptions = _option select 3;
_falseOptions = _option select 4;

if (not _status) then {
	
	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;

	// zeichne Marker
	JGKP_DC_marker_list = [];
	while {(JGKP_DC_options select _index) select 1} do {

		// lösche alle alten Marker
		{

			deleteMarkerLocal _x;

		} forEach JGKP_DC_marker_list;
		JGKP_DC_marker_list resize 0;


		{

			switch (side _x) do {

				// WEST
				case WEST: {

					// Infantery
					{

						_leader = leader _x;
						_vehicle = vehicle _x;

						// nicht in einem Fahrzeug -> in jedem Fall Marker
						if (_vehicle == _x) then {

							// Marker for unit
							_markerUnit = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							_markerUnit setMarkerSizeLocal [1.1, 1.1];
							_markerUnit setMarkerColorLocal "COLORWEST";

							_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							// marker for view direction
							_markerView setMarkerTypeLocal "hd_arrow";
							_markerView setMarkerColorLocal "ColorBlack";
							_markerView setMarkerSizeLocal [0.8, 0.8];
							_markerView setMarkerDirLocal (getDir _x);
							_markerView setMarkerAlphaLocal 0.7;


							JGKP_DC_marker_list pushBack _markerUnit;
							JGKP_DC_marker_list pushBack _markerView;

							// welche Typ von Einheit?
							if (_x == _leader) then {

								// Inf symbol
								_markerUnit setMarkerTypeLocal "b_inf";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" %1 (%2)", name _x, count units _x];

							} else {

								// dot symbol größer
								_markerUnit setMarkerTypeLocal "hd_dot";
								_markerUnit setMarkerSizeLocal [1.5, 1.5];

								// Marker für Verbindung
								_distance = _x distance2D _leader;
								_vectorDiff = (getPos _leader) vectorDiff ((getPos _x)) select [0,2];

								_markerConnect = createMarkerLocal [
									format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
									[
										(getPos _x select 0) + (_vectorDiff select 0) / 2,
										(getPos _x select 1) + (_vectorDiff select 1) / 2
									]
								];

								JGKP_DC_marker_list pushBack _markerConnect;

								_markerConnect setMarkerShapeLocal "RECTANGLE";
								_markerConnect setMarkerColorLocal "ColorBlack";
								_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

								_winkel = 0;
								if (_vectorDiff select 0 == 0) then {
									
									_winkel = 90;

								} else {

									_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

								};
														
								_markerConnect setMarkerDirLocal ( -_winkel );

							};

						} else {

							// Fahrzeug und Fahrer -> Marker!
							if (_x == driver _vehicle) then {

								// Marker for unit
								_markerUnit = createMarkerLocal [
								format["%1_%2", name _x, count JGKP_DC_marker_list],
								getpos _vehicle
								];

								_markerUnit setMarkerSizeLocal [1.1, 1.1];
								_markerUnit setMarkerColorLocal "COLORWEST";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" %1 (%2)", name _x, count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "b_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "b_motor_inf";

								};
								if (_vehicle isKindOf "Air") then {

									_markerUnit setMarkerTypeLocal "b_air";

								};

								JGKP_DC_marker_list pushBack _markerUnit;

								if (not isNull gunner _vehicle) then {

									// marker for view direction of gunner
									_markerView = createMarkerLocal [
									format["%1_%2_view", name _x, count JGKP_DC_marker_list],
									getpos _vehicle
									];

									// marker for view direction
									_markerView setMarkerTypeLocal "hd_arrow";
									_markerView setMarkerColorLocal "ColorBlack";
									_markerView setMarkerSizeLocal [0.8, 0.8];
									_markerView setMarkerDirLocal (getDir gunner _vehicle);
									_markerView setMarkerAlphaLocal 0.7;

									JGKP_DC_marker_list pushBack _markerView;

								};						
							
								// Marker für Verbindung
								if (not (_x in (crew vehicle _leader))) then {
									
									// Marker für Verbindung
									_distance = _vehicle distance2D (vehicle _leader);
									_vectorDiff = (getPos vehicle _leader) vectorDiff ((getPos _vehicle)) select [0,2];

									_markerConnect = createMarkerLocal [
										format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
										[
											(getPos _vehicle select 0) + (_vectorDiff select 0) / 2,
											(getPos _vehicle select 1) + (_vectorDiff select 1) / 2
										]
									];

									JGKP_DC_marker_list pushBack _markerConnect;

									_markerConnect setMarkerShapeLocal "RECTANGLE";
									_markerConnect setMarkerColorLocal "ColorBlack";
									_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

									_winkel = 0;
									if (_vectorDiff select 0 == 0) then {
										
										_winkel = 90;

									} else {

										_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

									};
															
									_markerConnect setMarkerDirLocal ( -_winkel );

								};

							};
							// überspringe alle anderen

						}; 

					} forEach units _x;

				};

				case EAST: {

					// Infantery
					{

						_leader = leader _x;
						_vehicle = vehicle _x;

						// nicht in einem Fahrzeug -> in jedem Fall Marker
						if (_vehicle == _x) then {

							// Marker for unit
							_markerUnit = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							_markerUnit setMarkerSizeLocal [1.1, 1.1];
							_markerUnit setMarkerColorLocal "ColorEast";

							_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							// marker for view direction
							_markerView setMarkerTypeLocal "hd_arrow";
							_markerView setMarkerColorLocal "ColorBlack";
							_markerView setMarkerSizeLocal [0.8, 0.8];
							_markerView setMarkerDirLocal (getDir _x);
							_markerView setMarkerAlphaLocal 0.7;


							JGKP_DC_marker_list pushBack _markerUnit;
							JGKP_DC_marker_list pushBack _markerView;

							// welche Typ von Einheit?
							if (_x == _leader) then {

								// Inf symbol
								_markerUnit setMarkerTypeLocal "o_inf";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count units _x];

							} else {

								// dot symbol größer
								_markerUnit setMarkerTypeLocal "hd_dot";
								_markerUnit setMarkerSizeLocal [1.5, 1.5];

								// Marker für Verbindung
								_distance = _x distance2D _leader;
								_vectorDiff = (getPos _leader) vectorDiff ((getPos _x)) select [0,2];

								_markerConnect = createMarkerLocal [
									format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
									[
										(getPos _x select 0) + (_vectorDiff select 0) / 2,
										(getPos _x select 1) + (_vectorDiff select 1) / 2
									]
								];

								JGKP_DC_marker_list pushBack _markerConnect;

								_markerConnect setMarkerShapeLocal "RECTANGLE";
								_markerConnect setMarkerColorLocal "ColorBlack";
								_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

								_winkel = 0;
								if (_vectorDiff select 0 == 0) then {
									
									_winkel = 90;

								} else {

									_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

								};
														
								_markerConnect setMarkerDirLocal ( -_winkel );

							};

						} else {

							// Fahrzeug und Fahrer -> Marker!
							if (_x == driver _vehicle) then {

								// Marker for unit
								_markerUnit = createMarkerLocal [
								format["%1_%2", name _x, count JGKP_DC_marker_list],
								getpos _vehicle
								];

								_markerUnit setMarkerSizeLocal [1.1, 1.1];
								_markerUnit setMarkerColorLocal "ColorEast";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "o_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "o_motor_inf";

								};
								if (_vehicle isKindOf "Air") then {

									_markerUnit setMarkerTypeLocal "o_air";

								};

								JGKP_DC_marker_list pushBack _markerUnit;

								if (not isNull gunner _vehicle) then {

									// marker for view direction of gunner
									_markerView = createMarkerLocal [
									format["%1_%2_view", name _x, count JGKP_DC_marker_list],
									getpos _vehicle
									];

									// marker for view direction
									_markerView setMarkerTypeLocal "hd_arrow";
									_markerView setMarkerColorLocal "ColorBlack";
									_markerView setMarkerSizeLocal [0.8, 0.8];
									_markerView setMarkerDirLocal (getDir gunner _vehicle);
									_markerView setMarkerAlphaLocal 0.7;

									JGKP_DC_marker_list pushBack _markerView;

								};						
							
								// Marker für Verbindung
								if (not (_x in (crew vehicle _leader))) then {
									
									// Marker für Verbindung
									_distance = _vehicle distance2D (vehicle _leader);
									_vectorDiff = (getPos vehicle _leader) vectorDiff ((getPos _vehicle)) select [0,2];

									_markerConnect = createMarkerLocal [
										format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
										[
											(getPos _vehicle select 0) + (_vectorDiff select 0) / 2,
											(getPos _vehicle select 1) + (_vectorDiff select 1) / 2
										]
									];

									JGKP_DC_marker_list pushBack _markerConnect;

									_markerConnect setMarkerShapeLocal "RECTANGLE";
									_markerConnect setMarkerColorLocal "ColorBlack";
									_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

									_winkel = 0;
									if (_vectorDiff select 0 == 0) then {
										
										_winkel = 90;

									} else {

										_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

									};
															
									_markerConnect setMarkerDirLocal ( -_winkel );

								};

							};
							// überspringe alle anderen

						}; 

					} forEach units _x;

				};

				case RESISTANCE: {

					// Infantery
					{

						_leader = leader _x;
						_vehicle = vehicle _x;

						// nicht in einem Fahrzeug -> in jedem Fall Marker
						if (_vehicle == _x) then {

							// Marker for unit
							_markerUnit = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							_markerUnit setMarkerSizeLocal [1.1, 1.1];
							_markerUnit setMarkerColorLocal "ColorGuer";

							_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							// marker for view direction
							_markerView setMarkerTypeLocal "hd_arrow";
							_markerView setMarkerColorLocal "ColorBlack";
							_markerView setMarkerSizeLocal [0.8, 0.8];
							_markerView setMarkerDirLocal (getDir _x);
							_markerView setMarkerAlphaLocal 0.7;


							JGKP_DC_marker_list pushBack _markerUnit;
							JGKP_DC_marker_list pushBack _markerView;

							// welche Typ von Einheit?
							if (_x == _leader) then {

								// Inf symbol
								_markerUnit setMarkerTypeLocal "n_inf";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count units _x];

							} else {

								// dot symbol größer
								_markerUnit setMarkerTypeLocal "hd_dot";
								_markerUnit setMarkerSizeLocal [1.5, 1.5];

								// Marker für Verbindung
								_distance = _x distance2D _leader;
								_vectorDiff = (getPos _leader) vectorDiff ((getPos _x)) select [0,2];

								_markerConnect = createMarkerLocal [
									format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
									[
										(getPos _x select 0) + (_vectorDiff select 0) / 2,
										(getPos _x select 1) + (_vectorDiff select 1) / 2
									]
								];

								JGKP_DC_marker_list pushBack _markerConnect;

								_markerConnect setMarkerShapeLocal "RECTANGLE";
								_markerConnect setMarkerColorLocal "ColorBlack";
								_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

								_winkel = 0;
								if (_vectorDiff select 0 == 0) then {
									
									_winkel = 90;

								} else {

									_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

								};
														
								_markerConnect setMarkerDirLocal ( -_winkel );

							};

						} else {

							// Fahrzeug und Fahrer -> Marker!
							if (_x == driver _vehicle) then {

								// Marker for unit
								_markerUnit = createMarkerLocal [
								format["%1_%2", name _x, count JGKP_DC_marker_list],
								getpos _vehicle
								];

								_markerUnit setMarkerSizeLocal [1.1, 1.1];
								_markerUnit setMarkerColorLocal "ColorGuer";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "n_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "n_motor_inf";

								};
								if (_vehicle isKindOf "Air") then {

									_markerUnit setMarkerTypeLocal "n_air";

								};

								JGKP_DC_marker_list pushBack _markerUnit;

								if (not isNull gunner _vehicle) then {

									// marker for view direction of gunner
									_markerView = createMarkerLocal [
									format["%1_%2_view", name _x, count JGKP_DC_marker_list],
									getpos _vehicle
									];

									// marker for view direction
									_markerView setMarkerTypeLocal "hd_arrow";
									_markerView setMarkerColorLocal "ColorBlack";
									_markerView setMarkerSizeLocal [0.8, 0.8];
									_markerView setMarkerDirLocal (getDir gunner _vehicle);
									_markerView setMarkerAlphaLocal 0.7;

									JGKP_DC_marker_list pushBack _markerView;

								};						
							
								// Marker für Verbindung
								if (not (_x in (crew vehicle _leader))) then {
									
									// Marker für Verbindung
									_distance = _vehicle distance2D (vehicle _leader);
									_vectorDiff = (getPos vehicle _leader) vectorDiff ((getPos _vehicle)) select [0,2];

									_markerConnect = createMarkerLocal [
										format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
										[
											(getPos _vehicle select 0) + (_vectorDiff select 0) / 2,
											(getPos _vehicle select 1) + (_vectorDiff select 1) / 2
										]
									];

									JGKP_DC_marker_list pushBack _markerConnect;

									_markerConnect setMarkerShapeLocal "RECTANGLE";
									_markerConnect setMarkerColorLocal "ColorBlack";
									_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

									_winkel = 0;
									if (_vectorDiff select 0 == 0) then {
										
										_winkel = 90;

									} else {

										_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

									};
															
									_markerConnect setMarkerDirLocal ( -_winkel );

								};

							};
							// überspringe alle anderen

						}; 

					} forEach units _x;

				};

				case CIVILIAN: {

					// Infantery
					{

						_leader = leader _x;
						_vehicle = vehicle _x;

						// nicht in einem Fahrzeug -> in jedem Fall Marker
						if (_vehicle == _x) then {

							// Marker for unit
							_markerUnit = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							_markerUnit setMarkerSizeLocal [1.1, 1.1];
							_markerUnit setMarkerColorLocal "ColorCIV";

							_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
							];

							// marker for view direction
							_markerView setMarkerTypeLocal "hd_arrow";
							_markerView setMarkerColorLocal "ColorBlack";
							_markerView setMarkerSizeLocal [0.8, 0.8];
							_markerView setMarkerDirLocal (getDir _x);
							_markerView setMarkerAlphaLocal 0.7;


							JGKP_DC_marker_list pushBack _markerUnit;
							JGKP_DC_marker_list pushBack _markerView;

							// welche Typ von Einheit?
							if (_x == _leader) then {

								// Inf symbol
								_markerUnit setMarkerTypeLocal "n_inf";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count units _x];

							} else {

								// dot symbol größer
								_markerUnit setMarkerTypeLocal "hd_dot";
								_markerUnit setMarkerSizeLocal [1.5, 1.5];

								// Marker für Verbindung
								_distance = _x distance2D _leader;
								_vectorDiff = (getPos _leader) vectorDiff ((getPos _x)) select [0,2];

								_markerConnect = createMarkerLocal [
									format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
									[
										(getPos _x select 0) + (_vectorDiff select 0) / 2,
										(getPos _x select 1) + (_vectorDiff select 1) / 2
									]
								];

								JGKP_DC_marker_list pushBack _markerConnect;

								_markerConnect setMarkerShapeLocal "RECTANGLE";
								_markerConnect setMarkerColorLocal "ColorBlack";
								_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

								_winkel = 0;
								if (_vectorDiff select 0 == 0) then {
									
									_winkel = 90;

								} else {

									_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

								};
														
								_markerConnect setMarkerDirLocal ( -_winkel );

							};

						} else {

							// Fahrzeug und Fahrer -> Marker!
							if (_x == driver _vehicle) then {

								// Marker for unit
								_markerUnit = createMarkerLocal [
								format["%1_%2", name _x, count JGKP_DC_marker_list],
								getpos _vehicle
								];

								_markerUnit setMarkerSizeLocal [1.1, 1.1];
								_markerUnit setMarkerColorLocal "ColorCIV";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" (%1)", count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "n_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "n_motor_inf";

								};
								if (_vehicle isKindOf "Air") then {

									_markerUnit setMarkerTypeLocal "n_air";

								};

								JGKP_DC_marker_list pushBack _markerUnit;

								if (not isNull gunner _vehicle) then {

									// marker for view direction of gunner
									_markerView = createMarkerLocal [
									format["%1_%2_view", name _x, count JGKP_DC_marker_list],
									getpos _vehicle
									];

									// marker for view direction
									_markerView setMarkerTypeLocal "hd_arrow";
									_markerView setMarkerColorLocal "ColorBlack";
									_markerView setMarkerSizeLocal [0.8, 0.8];
									_markerView setMarkerDirLocal (getDir gunner _vehicle);
									_markerView setMarkerAlphaLocal 0.7;

									JGKP_DC_marker_list pushBack _markerView;

								};						
							
								// Marker für Verbindung
								if (not (_x in (crew vehicle _leader))) then {
									
									// Marker für Verbindung
									_distance = _vehicle distance2D (vehicle _leader);
									_vectorDiff = (getPos vehicle _leader) vectorDiff ((getPos _vehicle)) select [0,2];

									_markerConnect = createMarkerLocal [
										format["%1_%2_connect", name _x, count JGKP_DC_marker_list],
										[
											(getPos _vehicle select 0) + (_vectorDiff select 0) / 2,
											(getPos _vehicle select 1) + (_vectorDiff select 1) / 2
										]
									];

									JGKP_DC_marker_list pushBack _markerConnect;

									_markerConnect setMarkerShapeLocal "RECTANGLE";
									_markerConnect setMarkerColorLocal "ColorBlack";
									_markerConnect setMarkerSizeLocal [_distance / 2, 0.1];

									_winkel = 0;
									if (_vectorDiff select 0 == 0) then {
										
										_winkel = 90;

									} else {

										_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));		

									};
															
									_markerConnect setMarkerDirLocal ( -_winkel );

								};

							};
							// überspringe alle anderen

						}; 

					} forEach units _x;

				};

			};

		} forEach allGroups;

		{

			// markiere leere Fahrzeuge -> alle anderen sollten durch obigen Code bereits markiert sein!
			if (_x isKindOf "AllVehicles" && count crew _x == 0) then {

				_markerVec = createMarkerLocal [
					format["%1_%2", typeOf _x, count JGKP_DC_marker_list],
					getpos _x
				];

				_markerVec setMarkerSizeLocal [0.8, 0.8];
				_markerVec setMarkerColorLocal "ColorUNKNOWN";

				// GrpFhr Name + GrpGröße
				_damageReport = "";
				_damagedParts = (getAllHitPointsDamage _x);

				{
			
					if (_x > 0) then {

						_namePart = (_damagedParts select 0) select _forEachIndex;

						if (_damageReport == "") then {

							_damageReport = format["%1:%2", _namePart select [3, (count _namePart)-1], [_x,1,2] call CBA_fnc_formatNumber];

						} else {

							_damageReport = format["%1, %2:%3", _damageReport, _namePart select [3, (count _namePart)-1], [_x,1,2] call CBA_fnc_formatNumber];

						};

					};

				} forEach (_damagedParts select 2);


				_markerVec setMarkerTextLocal format[" (t: %1, d: %2)", getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName"), _damageReport];


				if (_x isKindOf "Tank") then {

					_markerVec setMarkerTypeLocal "n_armor";

				};
				if (_x isKindOf "Car") then {

					_markerVec setMarkerTypeLocal "n_motor_inf";

				};
				if (_x isKindOf "Car") then {

					_markerVec setMarkerTypeLocal "n_air";

				};

				JGKP_DC_marker_list pushBack _markerVec;

			};


		} forEach vehicles;

		sleep 0.5;

	};

	// nach Beendigung lösche alle Marker
	{

		deleteMarkerLocal _x;

	} forEach JGKP_DC_marker_list;
	JGKP_DC_marker_list resize 0;

} else {
	
	// change status and text
	_option set [1, not _status];

	JGKP_DC_options set [_index, _option];

	[_option, 3100] call JGKP_DC_fnc_readOption;
	
};