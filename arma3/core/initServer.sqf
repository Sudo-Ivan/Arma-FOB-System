// BUILDER v1.0.0
_hConfig   = [] execVM "editMe.sqf";
waitUntil { scriptDone _hConfig };

publicVariable "BUILDER_ITEMS";

missionNamespace setVariable ["globalWestBankBalance", 80000, true];
missionNamespace setVariable ["globalEastBankBalance", 90000, true];
