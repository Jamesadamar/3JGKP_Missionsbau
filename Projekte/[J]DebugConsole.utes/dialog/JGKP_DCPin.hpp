//description.ext 
class RscTitles { 

	class JGKP_DCPin { 

		idd = 3101; 
		duration = 600; // 10 minutes
		fadein = 0.5; 
		fadeout = 0.5;
		onload = "(_this) execVM 'dialog\initPinRsc.sqf';";

		class controls { 

			class CODE_PIN { 

				idc = -1; // control reference type = 0; 
				type = 13;
				style = ST_LEFT + ST_MULTI;
				linespacing = 1.5;
				x = safeZoneX; 
				y = safeZoneY + safeZoneH / 5;
				w = 0.2*safeZoneW; 
				h = 0.2*safeZoneH; 
				font = "EtelkaNarrowMediumPro"; 
				colorBackground[] = {0.1,0.1,0.1,0.5}; 
				colorText[] = {1,1,1,1}; 
				text = "Example Text"; 
				size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);

				class Attributes {
				    color = "#fff";
				    align = "left";
				    valign = "top";
				    shadow = false;
				    shadowColor = "#ff0000";
				    size = "1";
				};
			}; 
		}; 
	}; 
};