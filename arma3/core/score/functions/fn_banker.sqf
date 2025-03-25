	/**
	*  buildPoints_fnc_banker
	*
	*  Update balance
	*
	*  Domain: missionNamespace
	**/


params [
    ["_player", objNull, [objNull]],
    ["_amount", 0, [0]],
    ["_box", 1, [0]]
];

if (isNull _player || _amount == 0) exitWith {};

private _boxVarName = format ["box_%1_balance", _box];
private _boxBalance = missionNamespace getVariable [_boxVarName, 0];
private _boxBalanceChange = _boxBalance + _amount;

if (_boxBalanceChange >= 0) then {
    missionNamespace setVariable [_boxVarName, _boxBalanceChange, true];
    sleep 0.1;
    [west, _box] remoteExec ["buildPoints_fnc_updateHud", 0];
};
