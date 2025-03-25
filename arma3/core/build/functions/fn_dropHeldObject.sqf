params ["_player"];

_holdSpec = _player getVariable ["heldObject", nil];
if(!isNil "_holdSpec") then {
    _func = _holdSpec select 0;
    _args = _holdSpec select 1;
    _args call compile ("call " + _func);
    _player call build_fnc_unregisterHeldObject;
};