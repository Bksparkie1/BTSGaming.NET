class Life_Speed_Radar {
	idd = -1;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name= "Life_Speed_Radar";
	onLoad="uiNamespace setVariable ['Life_Speed_Radar',_this select 0]";
	movingEnable = 0;
	objects[]={};
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = safeZoneX+safeZoneW-0.3; 
			y = safeZoneY+safeZoneH-0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = safeZoneX+safeZoneW-0.3; 
			y = safeZoneY+safeZoneH-0.2 + (11 / 250);
			w = 0.3;
			h = 0.1;
		};
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.020;
			text = "";
			x = safeZoneX+safeZoneW-0.2;
			y = safeZoneY+safeZoneH-0.15;
			w = 0.3; h = 0.6;
		};
	};
	
	class controls 
	{
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2651;
			text = "Speed Radar";
			x = safeZoneY+safeZoneH-0.05;
			y = safeZoneY+safeZoneH-0.2;
			w = 0.6;
			h = (1 / 25);
		};
	};
};