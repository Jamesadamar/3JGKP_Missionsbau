/* #Wihoja
$[
	1.063,
	["ConfirmDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"",[2,"",["10 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","21.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"",[2,"",["10 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","21.5 * GUI_GRID_W","4 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2600,"",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","12.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2700,"",[2,"",["21 * GUI_GRID_W + GUI_GRID_X","12.5 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[2,"",["10.5 * GUI_GRID_W + GUI_GRID_X","11 * GUI_GRID_H + GUI_GRID_Y","20 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
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
#define COLOR_UPPER {0.15,	0.20,	0.15,	0.7}
#define COLOR_LOWER {0.15,	0.20,	0.15,	0.8}

#define COMMAND_FONT (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Wihoja)
////////////////////////////////////////////////////////
class JGKP_ConfirmDialog {

	idd = 3101;
	movingEnable = true;
	enableSimulation = true;      // freeze the game
	onLoad = "(_this) execVM 'dialog\initConfirmDialog.sqf';";
	onUnload = "";

	class controlsBackground {

		class IGUIBack_2200: JGKP_DCIGUIBack
		{
			idc = 2200;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = COLOR_LOWER;
		};
		class RscFrame_1800: JGKP_DCRscFrame
		{
			idc = 1800;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
	};

	class controls {
		// define controls here

		class RscText_1000: JGKP_DCRscText
		{
			idc = 1000;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "";
		};

		class RscButtonOK_2600: JGKP_DCRscButton
		{
			idc = 2600;
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREEN;
			text = "Befehl ausführen";
			action = "JGKP_DC_command_isConfirmed = true; closeDialog 0;";

		};

		class RscButtonCancel_2700: JGKP_DCRscButton
		{
			idc = 2700;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_RED;
			text = "Abbrechen";
			action = "closeDialog 0;";
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

