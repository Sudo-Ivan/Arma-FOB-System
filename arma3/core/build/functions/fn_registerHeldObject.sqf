// Registers an object as held, along with the function to be called when the object
// is dropped (voluntarily or otherwise)
// Return Value:
// TRUE - The object was registered as held
// FALSE - The object was not registered as held (because something else is already held)
params [
    ["_object", objNull, [objNull]],
    ["_player", objNull, [objNull]]
];

if (isNull _object || isNull _player) exitWith {};

if (_player call build_fnc_isHoldingObject) then {
    _player call build_fnc_dropHeldObject;
};

_player setVariable ["heldObject", _object, true];
_object setVariable ["isHeld", true, true];
_object setVariable ["holder", _player, true];

true;


