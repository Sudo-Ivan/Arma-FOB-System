// Registers an object as held, along with the function to be called when the object
// is dropped (voluntarily or otherwise)
// Return Value:
// TRUE - The object was registered as held
// FALSE - The object was not registered as held (because something else is already held)
params ["_object", "_player"];

if(!(_player call build_fnc_isHoldingObject)) then {
    _player setVariable ["heldObject", [_object]];
    true;
} else {
    false;
};


