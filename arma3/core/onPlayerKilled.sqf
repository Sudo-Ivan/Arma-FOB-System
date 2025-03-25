_holdSpec = player getVariable ["heldObject", nil];
if(!isNil "_holdSpec") then {
	_func = _holdSpec select 0;
	_args = _holdSpec select 1;
	_args call compile ("call " + _func);
	player call build_fnc_unregisterHeldObject;
};

//when player is killed removeAllActions this;
if (!alive player) then {
    player setVariable ["buildItemHeld", false];
};

sleep 0.1;

[east] remoteExec ["buildPoints_fnc_updateHud"];

