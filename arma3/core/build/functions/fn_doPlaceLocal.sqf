params ["_object", "_player"];

if (_object getVariable ["isBeingBuilt", false]) then {
    hint "Object is still being constructed";
    return;
};

private _pos = getPosATL _object;
private _dir = getDir _object;

_object setPosATL _pos;
_object setDir _dir;

[_object, _player] call build_fnc_registerHeldObject;
[_object, _player] call build_fnc_unregisterHeldObject;

if (_object getVariable ["shopPrice", 0] > 0) then {
    [_player, _object getVariable ["shopPrice", 0], _object getVariable ["box", 1]] call buildPoints_fnc_banker;
};

maxMoveUpHeight = 5; // maximum height in meters

if (!_drop) then {
	_object enableSimulationGlobal false;
	_object setPosATL _objectPos;
	_object enableSimulationGlobal true;
} else {
	//_object setVehiclePosition [[_objectPos select 0, _objectPos select 1], [], 0, "CAN_COLLIDE"];
 	_object setPosATL [_objectPos select 0, _objectPos select 1, 0];
};

{
	_object enableCollisionWith _x;
} forEach playableUnits;

_object setVectorDirAndUp [_objectDir, _objectUp];

removeAllActions _caller;
removeAllActions _object;
_caller call build_fnc_unregisterHeldObject;

_object addAction [
	'<t color="#ff0000">Remove Object</t>',
	'[_this select 0, _this select 1] call build_fnc_sell;',
	'', 1, false, false, 'true', 'true', 5
];

_object addAction [
    '<t color="#00ffff">Move Up</t>',
    {
        private _height = (getPosATL (_this select 0) select 2) - maxMoveUpHeight;
        if (_height < 0) then {
            [_this select 0, _this select 3, _this select 1, _this select 2] call build_fnc_move;
        } else {
            hint format ["You can't move the object up any further. Maximum height is %1 meters.", maxMoveUpHeight];
        }
    },
    [0,0,0.5], 2, false, false, 'true', 'true'
];

_object addAction [
	'<t color="#00ff00">Move Down</t>',
	'[_this select 0, _this select 3, _this select 1] call build_fnc_move;',
	[0,0,-0.5],2,false,false,'true','true',5
];

_object addAction [
	'<t color="#ffffff">Pickup</t>',
	'[_this select 0, _this select 1] call build_fnc_pickup;',
	[0,0,0.5],2,false,false,'true','true',5
];

_object addAction [
	'<t color="#ffff00">Reset Rotation</t>',
	'[_this select 0, _this select 1] call build_fnc_reset;',
	[0,0,0.5],2,false,false,'true','true',5
];