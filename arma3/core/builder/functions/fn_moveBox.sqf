
/* 
 * This code disables collision with all playable units for an object, attaches the object to a player, and registers the object as the player's held object.
 *
 * Params:
 * _emptyCrate - The object to be attached to the player.
 * _caller - The object that called this function.
 * _pickupAction - The action that will be removed from the player when the object is picked up.
 *
 * Returns:
 * Nothing.
 */

params ["_emptyCrate", "_caller", "_pickupAction"];

if (!(player call build_fnc_isHoldingObject)) then {
    {[_emptyCrate, _x] remoteExec ["disableCollisionWith", 0];} forEach playableUnits;

    _emptyCrate attachTo [_caller, [0,5,0.05], "Pelvis"];
    [_emptyCrate, _pickupAction] remoteExec ["removeAction", 0];
    private _action = player addAction ["<t color='#00ffff'>" + "Drop", { _this call builder_fnc_dropBox; }, _emptyCrate];
    [player, "builder_fnc_dropBox", [nil, player, _action, _emptyCrate]] call build_fnc_registerHeldObject;
} else {
	[format ["<t size='0.6' color='#ff3300'>You're already carrying an object!</t>"], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
};
