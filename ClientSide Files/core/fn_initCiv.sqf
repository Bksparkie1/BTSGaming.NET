/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];

waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

[] call life_fnc_zoneCreator;
[] call life_fnc_initHouses;

[] spawn 
{
	while {false} do
	{
		hint format["%1 %2 %3 %4 %5 %6 %7",
		(!isNull cursorTarget),
		((player distance cursorTarget) < 20),
		(cursorTarget isKindOf "House"),
		(speed cursorTarget < 2),
		(count (cursorTarget getVariable["containers", []]) > 0),
		(license_civ_home),
		((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []]) || ((cursorTarget getVariable["storage_locked", 1]) == 0))];
		sleep 0.5;
	};
};