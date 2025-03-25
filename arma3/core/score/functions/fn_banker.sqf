	/**
	*  buildPoints_fnc_banker
	*
	*  Update balance
	*
	*  Domain: missionNamespace
	**/


params ["_banker", "_shopPrice", "_box"];

private _boxVarName = format ["box_%1_balance", _box];
private _boxBalance = missionNamespace getVariable [_boxVarName, 0];

switch (_banker) do {
    case west: {
        _boxBalanceChange = _boxBalance - _shopPrice;
        missionNamespace setVariable [_boxVarName, _boxBalanceChange];
        sleep 0.1;
        [west, _box] remoteExec ["buildPoints_fnc_updateHud"];
    };
    case east: {
        _boxBalanceChange = _boxBalance - _shopPrice;
        missionNamespace setVariable [_boxVarName, _boxBalanceChange];
        sleep 0.1;
        [east, _box] remoteExec ["buildPoints_fnc_updateHud"];
    };
    default {
        hint "Error: Banker not found";
    };
};
