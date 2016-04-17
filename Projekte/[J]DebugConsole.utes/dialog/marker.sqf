/*
	author: 			James
	version: 			1.00
	date: 				2016-04-17
	purpose: 			zeige oder verberge Marker für alle Einheiten
	arguments: 			status (bool): Zeige/Verberge marker (true - an, false - aus)
						IDC (int): idc of control
	return value:		None

	example call: 		[true] execVM "marker.sqf"
*/

// arguments
_params = _this;
_status = param[0, false, [true]];
_idc = _this select 1;
_control = ((findDisplay 3100) displayCtrl _idc);

// begin of script
if (_status) then {
	
	// change status and text
	JGKP_DC_marker_status = true;
	JGKP_DC_marker_list = [];

	ctrlSetText [_idc, "Marker verbergen"];

	// remove old EH
	_control ctrlRemoveAllEventHandlers "ButtonClick";
	// add new EH
	_control ctrlAddEventHandler ["ButtonClick", "[false, 1614] execVM 'dialog\marker.sqf';"];

	// zeichne Marker
	while {JGKP_DC_marker_status} do {

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
								_markerUnit setMarkerColorLocal "ColorEast";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" %1 (%2)", name _x, count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "b_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "b_motor_inf";

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
								_markerUnit setMarkerColorLocal "ColorGuer";

								// GrpFhr Name + GrpGröße
								_markerUnit setMarkerTextLocal format[" %1 (%2)", name _x, count crew _vehicle];

								if (_vehicle isKindOf "Tank") then {

									_markerUnit setMarkerTypeLocal "b_armor";

								};
								if (_vehicle isKindOf "Car") then {

									_markerUnit setMarkerTypeLocal "b_motor_inf";

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
	JGKP_DC_marker_status = false;

	ctrlSetText [_idc, "Marker anzeigen"];

	// remove old EH
	_control ctrlRemoveAllEventHandlers "ButtonClick";

	// add new EH
	_control ctrlAddEventHandler ["ButtonClick", "[true, 1614] execVM 'dialog\marker.sqf';"];
	
};