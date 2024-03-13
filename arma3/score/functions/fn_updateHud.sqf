	/**
	*  buildPoints_fnc_updateHud
	*
	*  Update the Build Points HUD
	*
	*  Domain: Client
	**/

if (hasInterface) then {
    disableSerialization;

    private _pointsWHUD = missionNamespace getVariable ["globalWestBankBalance", 0];
    private _hudTextW = format ["<t size='1.2' color='#ffffff'>%2</t><br/><t size='0.9' color='#dddddd'>West points: %1</t>", _pointsWHUD];

    private _pointsEHUD = missionNamespace getVariable ["globalEastBankBalance", 0];
    private _hudTextE = format ["<t size='1.2' color='#ffffff'>%2</t><br/><t size='0.9' color='#dddddd'>East points: %1</t>", _pointsEHUD];

    private _hudText = _hudTextW + "<br/>" + _hudTextE;

    1000 cutRsc ["BuildPointsHud","PLAIN"];
    _ui = uiNameSpace getVariable "BuildPointsHud";
    _BuildPointsHud = _ui displayCtrl 99999;
    _BuildPointsHud ctrlSetStructuredText parseText _hudText;
    _BuildPointsHud ctrlCommit 0;
};
