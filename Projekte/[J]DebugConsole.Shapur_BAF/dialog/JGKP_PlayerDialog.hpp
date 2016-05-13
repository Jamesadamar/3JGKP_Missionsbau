/* #Xefupe
$[
	1.063,
	["JGKP_PlayerDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"",[2,"",["6.5 * GUI_GRID_W + GUI_GRID_X","2 * GUI_GRID_H + GUI_GRID_Y","29 * GUI_GRID_W","21 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[2,"",["7 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","17 * GUI_GRID_W","18 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[2,"Zu Dir telen",["26 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"Zu Spieler telen",["26 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"Einfrieren",["26 * GUI_GRID_W + GUI_GRID_X","14 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"",[2,"Heilen",["26 * GUI_GRID_W + GUI_GRID_X","9 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"",[2,"Nachricht schicken",["26 * GUI_GRID_W + GUI_GRID_X","11.5 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[2,"Liste aller Spieler",["7 * GUI_GRID_W + GUI_GRID_X","2.5 * GUI_GRID_H + GUI_GRID_Y","17 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Xefupe)
////////////////////////////////////////////////////////
class JGKP_PlayerDialog {

	idd = 3102;
	movingEnable = true;
	enableSimulation = true;      // freeze the game
	onLoad = "(_this) execVM 'dialog\initPlayerDialog.sqf';";
	onUnload = "";

	class controlsBackground {

		class IGUIBack_2200: JGKP_DCIGUIBack
		{
			idc = 2200;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 20.5 * GUI_GRID_H;
			colorBackground[] = COLOR_LOWER;
		};

		class RscFrame_1800: JGKP_DCRscFrame
		{
			idc = 1800;
			text = "3.JGKP Adminpanel"; //--- ToDo: Localize;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 21 * GUI_GRID_H;
			sizeEx = 1.1 * GUI_GRID_H;
		};
	};

	class controls {
		// define controls here
		class RscText_1000: JGKP_DCRscText
		{
			idc = 1000;
			text = "Liste aller Spieler"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class RscListbox_1500: JGKP_DCRscListbox
		{
			idc = 1500;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			style = ST_LEFT + LB_TEXTURES + LB_MULTI;
		};
		
		class BUTTON_TELE_HERE : JGKP_DCRscButton
		{
			idc = 1600;
			text = "Zu Dir telen"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			action = "[] execVM 'dialog\telePlayer.sqf';";
		};

		class BUTTON_TELE_TO : JGKP_DCRscButton
		{
			idc = 1601;
			text = "Zu Spieler telen"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			action = "[] execVM 'dialog\teleToPlayer.sqf';";
		};
		class RscButton_1602: JGKP_DCRscButton
		{
			idc = 1602;
			text = "Einfrieren | Auftauen"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			action = "[] execVM 'dialog\freezePlayer.sqf';";
		};
		class RscButton_1603: JGKP_DCRscButton
		{
			idc = 1603;
			text = "Heilen"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = COLOR_GREY;
			action = "[] execVM 'dialog\healPlayer.sqf';";

		};
		class RscButton_1604: JGKP_DCRscButton
		{
			idc = 1604;
			text = "Nachricht schicken"; //--- ToDo: Localize;
			x = 26 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackround[] = COLOR_GREY;
			action = "[] execVM 'dialog\messagePlayer.sqf';";

		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
