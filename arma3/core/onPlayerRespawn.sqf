_holdSpec = player getVariable ["heldObject", nil];
if(!isNil "_holdSpec") then {
	_func = _holdSpec select 0;
	_args = _holdSpec select 1;
	_args call compile ("call " + _func);
	player call build_fnc_unregisterHeldObject;
};

sleep 0.1;