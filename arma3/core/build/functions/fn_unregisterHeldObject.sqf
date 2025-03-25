params [
    ["_player", objNull, [objNull]]
];

if (isNull _player) exitWith {};

private _heldObject = _player getVariable ["heldObject", objNull];
if (!isNull _heldObject) then {
    _heldObject setVariable ["isHeld", false, true];
    _heldObject setVariable ["holder", objNull, true];
    _player setVariable ["heldObject", objNull, true];
};

