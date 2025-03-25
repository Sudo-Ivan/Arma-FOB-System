	/**
	*  buildPoints_fnc_updateHud
	*
	*  Update the Build Points HUD
	*
	*  Domain: Client
	**/

if (hasInterface) then {
    disableSerialization;

    params [
        ["_side", west, [west]],
        ["_box", 1, [0]]
    ];

    if (_box < 1) exitWith {};

    private _boxVarName = format ["box_%1_balance", _box];
    private _boxBalance = missionNamespace getVariable [_boxVarName, 0];

    {
        if (side _x == _side) then {
            _x setVariable ["boxBalance", _boxBalance, true];
        };
    } forEach allPlayers;

    private _display = uiNamespace getVariable ["buildPoints_hud", displayNull];
    if (isNull _display) exitWith {};

    private _ctrl = _display displayCtrl 1000;
    _ctrl ctrlSetText format ["Box %1: %2", _box, _boxBalance];

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
