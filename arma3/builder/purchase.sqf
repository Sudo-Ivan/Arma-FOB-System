/** 
*  builder/purchase 
* 
*  Actor for the "Purchase building" dialog button 
* 
*  Domain: Client 
**/ 

_index = lbCurSel 1500;
private _shopVehic = objNull;
private _buildItem = (BUILDER_ITEMS select _index);
_shopPrice = (BUILDER_ITEMS select _index) select 0;
_shopName  = (BUILDER_ITEMS select _index) select 1;
_shopClass = (BUILDER_ITEMS select _index) select 2;

switch (side player) do {
    case west: {
        private _banker = west;
        _natoPoints = missionNamespace getVariable ["globalWestBankBalance", 0];   
        if (_natoPoints >= _shopPrice && !(player call build_fnc_isHoldingObject)) then {
            [_banker, _shopPrice] remoteExec ["buildPoints_fnc_banker", 2];        
            [player, _buildItem] remoteExec ["build_fnc_doCreate", 2];
            objPurchase = true;
        } else {
            if (_natoPoints < _shopPrice) then {
                [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
                objPurchase = false;
            } else {
                [format ["<t size='0.6' color='#ff3300'>You're already carrying an object!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
                objPurchase = false;
            };
        };
    };
    case east: {
        private _banker = east;
        _opforPoints = missionNamespace getVariable ["globalEastBankBalance", 0];  
        if (_opforPoints >= _shopPrice && !(player call build_fnc_isHoldingObject)) then {
            [_banker, _shopPrice] remoteExec ["buildPoints_fnc_banker", 2];        
            [player, _buildItem] remoteExec ["build_fnc_doCreate", 2];
            objPurchase = true;
        } else {
            if (_this < _shopPrice) then {
                [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
                objPurchase = false;
            } else {
                [format ["<t size='0.6' color='#ff3300'>You're already carrying an object!</t>", _shopName], -0, -0.02, 2, 0.1] call BIS_fnc_dynamicText;
                objPurchase = false;
            };
        };
    };
        default { hint "error: non defined faction" };
};
