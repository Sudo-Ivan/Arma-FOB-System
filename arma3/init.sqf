_hConfig   = [] execVM "editMe.sqf";
waitUntil { scriptDone _hConfig };

_basepoint = [] execVM "builder\createBase.sqf";
waitUntil { scriptDone _basepoint };

publicVariable "buildBox";
publicVariable "BUILDER_ITEMS";
publicVariable "globalEastBankBalance";
publicVariable "globalWestBankBalance";