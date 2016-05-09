/* #Guryle
$[
	1.063,
	["JGKP_MessageDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],4,0,0],
	[2200,"",[2,"",["8.5 * GUI_GRID_W + GUI_GRID_X","8 * GUI_GRID_H + GUI_GRID_Y","25.5 * GUI_GRID_W","6 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"",[2,"",["9 * GUI_GRID_W + GUI_GRID_X","9.5 * GUI_GRID_H + GUI_GRID_Y","24 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[2,"Ihre Nachricht:",["8.5 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","6 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[2,"Senden",["24 * GUI_GRID_W + GUI_GRID_X","12.1 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"Abbruch",["14.5 * GUI_GRID_W + GUI_GRID_X","12.1 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

#define COLOR_GREEN {0.02,0.6,0.02,0.8}
#define COLOR_RED {0.8,0.02,0.02,0.8}
#define COLOR_GOLD {0.35,0.27,0.09, 0.8}
#define COLOR_GREY {0.1,0.1,0.1,0.8}
#define COLOR_UPPER {0.38,	0.43,	0.51,	0.8}
#define COLOR_LOWER {0.27,	0.35,	0.47,	0.8}

class JGKP_MessageDialog {

	idd = 3103;
	movingEnable = true;
	enableSimulation = true;      // freeze the game
	onLoad = "(_this) execVM 'dialog\initMessageDialog.sqf';";
	onUnload = "";

	class controlsBackground {

		class IGUIBack_2200: JGKP_DCIGUIBack
		{
			idc = 2200;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 25.5 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			colorBackground[] = COLOR_LOWER;
		};

	};

	class controls {

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Guryle)
		////////////////////////////////////////////////////////


		class RscEdit_1400: JGKP_DCRscEdit
		{
			idc = 1400;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			style= ST_MULTI + ST_NO_RECT;
			tooltip = "Geben Sie ihre Nachricht ein. Umbrüche mit '\ n' (ohne Leer)";
		};

		class RscText_1000: JGKP_DCRscText
		{
			idc = 1000;
			text = "Ihre Nachricht:"; //--- ToDo: Localize;
			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
		};
		class RscButton_1600: JGKP_DCRscButton
		{
			idc = 1600;
			text = "Senden"; //--- ToDo: Localize;
			x = 24 * GUI_GRID_W + GUI_GRID_X;
			y = 12.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			controlsBackground[] = COLOR_GREY;
			action = "JGKP_DC_message = ctrlText 1400; closeDialog 0;";
		};
		class RscButton_1601: JGKP_DCRscButton
		{
			idc = 1601;
			text = "Abbruch"; //--- ToDo: Localize;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			controlsBackground[] = COLOR_GREY;
			action = "closeDialog 0";
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

		};
	};
};