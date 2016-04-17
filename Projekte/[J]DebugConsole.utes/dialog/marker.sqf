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

						_marker = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _marker;

						_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _markerView;

						if (_x == _leader) then {

							_marker setMarkerTypeLocal "b_inf";
							_marker setMarkerSizeLocal [0.8, 0.8];
							_marker setMarkerTextLocal format[" %1 (%2)", name _x, count units _x];

						} else {

							_marker setMarkerTypeLocal "hd_dot";
							_marker setMarkerSizeLocal [1.5, 1.5];

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
							_markerConnect setMarkerSizeLocal [_distance / 2, 0.2];

							_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));								
							_markerConnect setMarkerDirLocal ( -_winkel );

						};

						_marker setMarkerColorLocal "COLORWEST";
						//_marker setMarkerTextLocal format[" %1", name _x];

						// marker for view direction
						_markerView setMarkerTypeLocal "hd_arrow";
						_markerView setMarkerColorLocal "ColorBlack";
						_markerView setMarkerSizeLocal [0.8, 0.8];
						_markerView setMarkerDirLocal (getDir _x);
						_markerView setMarkerAlphaLocal 0.7;

						_delta_x = 0 * cos(-(getDir _x)) - 3 * sin(-(getDir _x));
						_delta_y = 0 * sin(-(getDir _x)) + 3 * cos(-(getDir _x));

						/*
						_markerView setMarkerPosLocal [
							(getMarkerPos _markerView select 0) + _delta_x,
							(getMarkerPos _markerView select 1) + _delta_y
						];
						*/

					} forEach units _x;

				};

				case EAST: {

					// Infantery
					{

						_leader = leader _x;

						_marker = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _marker;

						_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _markerView;

						if (_x == _leader) then {

							_marker setMarkerTypeLocal "o_inf";
							_marker setMarkerSizeLocal [0.8, 0.8];
							_marker setMarkerTextLocal format[" %1 (%2)", name _x, count units _x];

						} else {

							_marker setMarkerTypeLocal "hd_dot";
							_marker setMarkerSizeLocal [1.5, 1.5];

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
							_markerConnect setMarkerSizeLocal [_distance / 2, 0.2];

							_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));								
							_markerConnect setMarkerDirLocal ( -_winkel );

						};

						_marker setMarkerColorLocal "ColorEast";
						//_marker setMarkerTextLocal format[" %1", name _x];

						// marker for view direction
						_markerView setMarkerTypeLocal "hd_arrow";
						_markerView setMarkerColorLocal "ColorBlack";
						_markerView setMarkerSizeLocal [0.8, 0.8];
						_markerView setMarkerDirLocal (getDir _x);
						_markerView setMarkerAlphaLocal 0.7;

						_delta_x = 0 * cos(-(getDir _x)) - 3 * sin(-(getDir _x));
						_delta_y = 0 * sin(-(getDir _x)) + 3 * cos(-(getDir _x));

						/*
						_markerView setMarkerPosLocal [
							(getMarkerPos _markerView select 0) + _delta_x,
							(getMarkerPos _markerView select 1) + _delta_y
						];
						*/

					} forEach units _x;

				};

				case RESISTANCE: {

					// Infantery
					{

						_leader = leader _x;

						_marker = createMarkerLocal [
							format["%1_%2", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _marker;

						_markerView = createMarkerLocal [
							format["%1_%2_view", name _x, count JGKP_DC_marker_list],
							getpos _x
						];
						JGKP_DC_marker_list pushBack _markerView;

						if (_x == _leader) then {

							_marker setMarkerTypeLocal "n_inf";
							_marker setMarkerSizeLocal [0.8, 0.8];
							_marker setMarkerTextLocal format[" %1 (%2)", name _x, count units _x];

						} else {

							_marker setMarkerTypeLocal "hd_dot";
							_marker setMarkerSizeLocal [1.5, 1.5];

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
							_markerConnect setMarkerSizeLocal [_distance / 2, 0.2];

							_winkel = atan((_vectorDiff select 1) / (_vectorDiff select 0));								
							_markerConnect setMarkerDirLocal ( -_winkel );

						};

						_marker setMarkerColorLocal "ColorGuer";
						//_marker setMarkerTextLocal format[" %1", name _x];

						// marker for view direction
						_markerView setMarkerTypeLocal "hd_arrow";
						_markerView setMarkerColorLocal "ColorBlack";
						_markerView setMarkerSizeLocal [0.8, 0.8];
						_markerView setMarkerDirLocal (getDir _x);
						_markerView setMarkerAlphaLocal 0.7;

						_delta_x = 0 * cos(-(getDir _x)) - 3 * sin(-(getDir _x));
						_delta_y = 0 * sin(-(getDir _x)) + 3 * cos(-(getDir _x));

						/*
						_markerView setMarkerPosLocal [
							(getMarkerPos _markerView select 0) + _delta_x,
							(getMarkerPos _markerView select 1) + _delta_y
						];
						*/

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