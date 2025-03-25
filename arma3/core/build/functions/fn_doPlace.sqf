params [
    ["_player", objNull, [objNull]],
    ["_object", objNull, [objNull]],
    ["_pos", [0,0,0], [[]]],
    ["_dir", 0, [0]],
    ["_up", [0,0,1], [[]]]
];

if (isNull _player || isNull _object) exitWith {};

[_object, _pos, _dir, _up, _player, true] remoteExec ["build_fnc_doPlaceLocal", 0];

if (isPlayer _player) then {
    _player setVariable ["buildItemHeld", false, true];
};

PLAYER_OBJECT_LIST pushBack _object;

sleep 0.1;

[_object] execVM 'builder\solidObject.sqf';