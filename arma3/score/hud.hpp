#define buildPoints_idc 99999

class buildPointsHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 10000000000;
	name= "BuildPointsHud";
	onLoad = "uiNamespace setVariable ['BuildPointsHud', _this select 0]";

	class controlsBackground {
		class buildPointsHud_1:RscStructuredText
		{
			idc = buildPoints_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = (SafeZoneX + 0.5);
			y = (SafeZoneY + 0.01);
			w = 0.2; h = 0.18;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0.3};
			text = "Text";
			font = "PuristaLight";
			shadow = 2;
			class Attributes {
				align = "left";
			};
		};

	};
};
