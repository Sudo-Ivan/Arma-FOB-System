params ["_player"];

private _holdSpec = _player getVariable ["heldObject", nil];
if(!isNil "_holdSpec") then {
    private _func = _holdSpec select 0;
    private _args = _holdSpec select 1;
    _args call (compile _func);
    _player call build_fnc_unregisterHeldObject;
};