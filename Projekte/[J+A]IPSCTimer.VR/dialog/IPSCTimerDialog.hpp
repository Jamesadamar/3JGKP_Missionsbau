/* #Vicowe
$[
	1.063,
	["IPSCTimer",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"",[2,"",["3 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","35 * GUI_GRID_W","6.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"",[2,"IPSC Timer",["3 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","35 * GUI_GRID_W","6.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1"],[]],
	[1000,"",[2,"SchÃ¼tze:",["4 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","10 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1400,"",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","8.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[2,"SchÃ¼tze wÃ¤hlen",["4.5 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"Timer starten",["16 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,1,0,1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"Timer stoppen",["28 * GUI_GRID_W + GUI_GRID_X","10.5 * GUI_GRID_H + GUI_GRID_Y","8.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[1,0,0,1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Vicowe)
////////////////////////////////////////////////////////

#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class IPSCTimerDialog {

	idd = 3155;                      // set to -1, because we don't require a unique ID
	movingEnable = true;           // the dialog can be moved with the mouse (see "moving" below)
	//enableSimulation = false;      // freeze the game
	onload = "[] execVM 'dialog\IPSCTimerDialog_init.sqf';";

	class controls {  

		class IGUIBack_2200: IPSCTimerIGUIBack
		{
			idc = 2200;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.65, 0.73, 0.65, 0.95};
			moving = 1;
		};

		class RscFrame_1800: IPSCTimerFrame
		{
			idc = 1800;
			text = "IPSC Timer"; //--- ToDo: Localize;
			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 35 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			sizeEx = 1 * GUI_GRID_H;
		};
	
		class RscText_1000: IPSCTimerText
		{
			idc = 1000;
			text = "Schütze:"; //--- ToDo: Localize;
			x = 4 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscEdit_1400: IPSCTimerEdit
		{
			idc = 1400;
			text = "Kein Schütze festgelegt";
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};

		class RscText_1001: IPSCTimerText
		{
			idc = 1001;
			text = "Messzeit:"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class RscEdit_1401: IPSCTimerEdit
		{
			idc = 1401;
			text = "Keine Messung";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};

		class RscButton_findShooter: IPSCTimerButton
		{
			idc = 1600;
			text = "Schütze wählen"; //--- ToDo: Localize;
			x = 4.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			action = "[] execVM 'dialog\IPSCTimerDialog_selectShooter.sqf'; closeDialog 0;";
		};
		class RscButton_Start: IPSCTimerButton
		{
			idc = 1601;
			text = "Timer starten"; //--- ToDo: Localize;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = {0.26, 0.38, 0.19, 0.7};
			action = "[] execVM 'dialog\IPSCTimerDialog_startTimer.sqf'; closeDialog 0;";
		};
		class RscButton_Cancel: IPSCTimerButton
		{
			idc = 1602;
			text = "Timer stoppen"; //--- ToDo: Localize;
			x = 28 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = {0.38, 0.23, 0.19, 0.7};
			action = "[] execVM 'scripts\IPSCTimer_initVars.sqf'; closeDialog 0;"
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
