	/**
	*  buildPoints_fnc_banker
	*
	*  Update balance
	*
	*  Domain: missionNamespace
	**/


params ["_banker", "_shopPrice"];

switch (_banker) do {
    case west: {
        params ["_banker", "_shopPrice"];
        _bankBalance = missionNamespace getVariable ["globalWestBankBalance", 0];  
        _bankBalanceChange = _bankBalance - _shopPrice;
        missionNamespace setVariable ["globalWestBankBalance", _bankBalanceChange];
        sleep 0.1;
        [west] remoteExec ["buildPoints_fnc_updateHud"];
    };
    case east: {
        params ["_banker", "_shopPrice"];
        _bankBalance = missionNamespace getVariable ["globalEastBankBalance", 0];  
        _bankBalanceChange = _bankBalance - _shopPrice;
        missionNamespace setVariable ["globalEastBankBalance", _bankBalanceChange];
        sleep 0.1;
        [east] remoteExec ["buildPoints_fnc_updateHud"];
    };
    default {
        hint "Error: Banker not found";
    };
};
