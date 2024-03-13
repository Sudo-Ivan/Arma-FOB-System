/*  _player: the player that is building the object
    _buildItem: array of values from the build dialog, see build_fnc_getBuildItems
    _shopPrice: the price of the object, used for refunding the player
    _shopName: the name of the object
    _shopClass: the classname of the object
    _shopDir: the direction the object should be created in
    _VecRadius: the radius of the object, used for determining the distance from the player that the object should be created
    _explosive: 0/1, whether the object should be set to 90% damage
    _invincible: 0/1, whether the object should be invincible
    _vechAi: 0/1, whether the object should be created with AI
    _shopobject: the object that will be created
    _vechWithAi: an array containing the object and the AI group, if _vechAi is true
*/

params [ "_player", "_buildItem"];

private _shopPrice  = _buildItem select 0;
private _shopName   = _buildItem select 1;
private _shopClass  = _buildItem select 2;
private _shopDir    = _buildItem select 3;
private _VecRadius  = _buildItem select 4;
private _explosive  = _buildItem select 5;
private _invincible = _buildItem select 6;
private _vechAi     = _buildItem select 7;

private _shopVehicle = objnull;


if (_vechAi) then {
    _vechWithAi = [[0,0,300], 0, _shopClass, west] call BIS_fnc_spawnVehicle;
    // change faction to corresponding buyer?
    _shopVehicle = _vechWithAi select 0;
}else{
    _shopVehicle = _shopClass createVehicle [0,0,0];
};

_shopVehicle setVariable ["shopPrice", _shopPrice, true];
_shopVehicle setVariable ["Radius", _VecRadius, true];

//Check if Explosive	
if (_explosive == 1) then {
    _shopVehicle setDamage 0.9;
};
    //check if invincible
if (_invincible == 1) then {
    _shopVehicle allowDamage false;
};

// If it's a container, make sure it's empty
clearItemCargoGlobal _shopVehicle;
clearWeaponCargoGlobal _shopVehicle;
clearMagazineCargoGlobal _shopVehicle;
clearBackpackCargoGlobal _shopVehicle;


// This function is called when a player selects a shop object to spawn.
// doPickup relies on the values below so if you change them, make sure to change them in doPickup as well.
[_player, _shopVehicle, [0,_VecRadius + 1.5,0.02], _shopDir] call build_fnc_doPickup;