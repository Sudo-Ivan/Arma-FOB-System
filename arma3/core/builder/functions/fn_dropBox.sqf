// This function is used to move a box to the player's location
// It is used by the build module
// Params:
// _target - The box to move
// _caller - The player moving the box
// _dropAction - The action that is being used to move the box
// _emptyCrate - The empty crate that is being used to move the box

params ["_target", "_caller", "_dropAction", "_emptyCrate"];

player setVariable ["buildItemHeld", false, true];

detach _emptyCrate;
{[_emptyCrate, _x] remoteExec ["enableCollisionWith", 0];} forEach playableUnits;
_caller removeAction _dropAction;
[_emptyCrate, ["<t color='#00ffff'>" + "Pickup", { _this call builder_fnc_moveBox; },"",1,false,false,"true","true",2.5]] remoteExec ["addAction", 0];
["buildBox"] remoteExec ["publicVariable", 2];

player call build_fnc_unregisterHeldObject;
