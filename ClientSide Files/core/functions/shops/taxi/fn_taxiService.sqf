/*
	File: fn_vehicleShop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the vehicle shop.
	CAN"T WAIT TO SCRAP THIS!
*/
private["_display","_locations","_price","_kill","_pos1","_pos2","_dest_name","_distance","_time"];
disableSerialization;
_kill = "";

if(vehicle player != player) exitWith {hint "You must first exit the vehicle you're in before using the taxi.";};
if(!dialog) then
{
	createDialog "Life_taxi_menu";
	life_taxi_location = (_this select 3) select 0;
};

_display = findDisplay 48400;
_locations = _display displayCtrl 48402;
lbClear _locations;

switch (life_taxi_location) do
{
	case "taxi_spawn_kavala":
	{
		ctrlSetText[48401,"Kavala Taxi Stand"];
	};
	case "taxi_spawn_athira":
	{
		ctrlSetText[48401,"Athira Taxi Stand"];
	};
	case "taxi_spawn_pyrgos":
	{
		ctrlSetText[48401,"Pyrgos Taxi Stand"];
	};
	case "taxi_spawn_sofia":
	{
		ctrlSetText[48401,"Sofia Taxi Stand"];
	};
	case "taxi_spawn_airfield":
	{
		ctrlSetText[48401,"Air Field Taxi Stand"];
	};
	case "taxi_spawn_rebel":
	{
		ctrlSetText[48401,"Rebel Territory Taxi Stand"];
	};
};

if(_kill != "") exitWith {
hint _kill;
closeDialog 0;
};

{
	_dest_name = (_x select 0);
	if(life_taxi_location != _dest_name) then
	{
		_pos1 = getMarkerPos life_taxi_location;
		_pos2 = getMarkerPos _dest_name;
		_distance = _pos1 distance _pos2;
		_price = _distance;
		_price = round(_price / 2);
		_time = round(_distance / 1000 * 6);
		_locations lbAdd format["Fare to %1 - Regular (%2s): $%3 Speedy (%4s): $%5 ",_x select 1, [_time] call life_fnc_numberText, [_price] call life_fnc_numberText, [round(_time / 3)] call life_fnc_numberText, [round(_price * 2)] call life_fnc_numberText];
		_locations lbSetData [(lbSize _locations)-1,_dest_name];
		_locations lbSetValue [(lbSize _locations)-1,_price];
	};
} foreach life_taxi_stands;