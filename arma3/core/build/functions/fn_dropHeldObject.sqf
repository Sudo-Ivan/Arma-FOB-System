params [
    ["_player", objNull, [objNull]]
];

if (isNull _player) exitWith {};

private _heldObject = _player getVariable ["heldObject", objNull];
if (isNull _heldObject) exitWith {};

private _dropFunction = _heldObject getVariable ["dropFunction", {}];
private _dropArgs = _heldObject getVariable ["dropArgs", []];

[_heldObject, _player] call build_fnc_unregisterHeldObject;

if (!isNull _dropFunction) then {
    [_heldObject, _player] + _dropArgs call _dropFunction;
};