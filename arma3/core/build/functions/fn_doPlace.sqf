params ["_object", "_player"];

private _objectPos = getPosATL _object;
private _objectDir = getDir _object;
private _objectUp = [0, 0, 1];

[_object, _objectPos, _objectDir, _objectUp, _player, false] remoteExec ["build_fnc_doPlaceLocal", 0];

_player setVariable ["buildItemHeld", false, true];
_object setVariable ["buildItemHeld", false, true];

PLAYER_OBJECT_LIST pushBack _object;

sleep 0.1;

[_object] execVM 'builder\solidObject.sqf';