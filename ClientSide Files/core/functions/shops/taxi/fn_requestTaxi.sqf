/*
	File: fn_vehicleShop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the vehicle shop.
	CAN"T WAIT TO SCRAP THIS!
*/
private["_display","_locations","_price","_kill","_pos1","_pos2","_dest_name","_distance","_time","_ui","_progress","_pgText","_cP","_upp"];
disableSerialization;
_kill = "";
closeDialog 0;

if(vehicle player != player) exitWith {hint "You must first exit the vehicle you're in before using the taxi.";};
if(player distance (getMarkerPos "jail_marker") < 150) exitWith {hint "You must be 150m or more from the jail to use this service!";};
if(!life_use_atm) exitWith {hint "You cannot call a cab after your recent robbery on the federal reserve";};
hint "Hailing a cab... You must stay within 10m of your current location until the cab arrives. (Hailing a cab away from a taxi stand will cost you an extra $5,000, unless choosing Kavala.)";
life_taxi_location = getPos player;

//Setup our progress bar.
_upp = "Calling cab";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

while{true} do
{
	sleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance life_taxi_location > 10) exitWith {};
};

if(player distance life_taxi_location > 10) exitWith {hint "You needed to stay within 10m."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
hint "Your cab has arrived!";
5 cutText ["","PLAIN"];
life_is_processing = false;

createDialog "Life_taxi_menu";


_display = findDisplay 48400;
_locations = _display displayCtrl 48402;
lbClear _locations;

ctrlSetText[48401,"Taxi Request Service"];

if(_kill != "") exitWith {
hint _kill;
closeDialog 0;
};

{
	_dest_name = (_x select 0);
	_pos1 = life_taxi_location;
	_pos2 = getMarkerPos _dest_name;
	_distance = _pos1 distance _pos2;
	_price = _distance;
	if(_dest_name == "taxi_spawn_kavala") then
	{
		_price = round(_price / 2);
	} else {
		_price = round(_price / 2) + 5000;
	};
	_time = round(_distance / 1000 * 6);
	_locations lbAdd format["Fare to %1 - Regular (%2s): $%3 Speedy (%4s): $%5",_x select 1, [_time] call life_fnc_numberText, [_price] call life_fnc_numberText, [round(_time / 3)] call life_fnc_numberText, [round(_price * 2)] call life_fnc_numberText];
	_locations lbSetData [(lbSize _locations)-1,_dest_name];
	_locations lbSetValue [(lbSize _locations)-1,_price];
} foreach life_taxi_stands;