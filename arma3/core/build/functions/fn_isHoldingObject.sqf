//fn_pickup
params [["_player", objNull, [objNull]]];

if (isNull _player) exitWith {false};

private _heldObject = _player getVariable ["heldObject", nil];
if(isNil "_heldObject") then {
    false
} else {
    true
};
