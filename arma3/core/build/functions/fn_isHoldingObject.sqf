//fn_pickup
params ["_player"];
private _heldObject = _player getVariable ["heldObject", nil];
if(isNil "_heldObject") then {
    false;
} else {
    true;
};
