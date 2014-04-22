/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deleting it soon enough....
*/


private["_index","_loc","_price","_sp","_kill","_time","_failed"];
_kill = false;
_index = lbCurSel 48402;
_loc = lbData[48402,_index];
_sp = getMarkerPos _loc;
_price = lbValue[48402,(lbCurSel 48402)];
_time = _price / 1000 * 2;
_price = _price * 2;
if(_price < 0) exitWith {};
_failed = false;
if(life_cash >= _price) then
{
	life_cash = life_cash - _price;
} else {
	if(life_atmcash < (_price + 1000)) then
	{
		_failed = true;
	} else {
		hint "A $1,000 surcharge has been assessed to withdraw funds from your bank account!";
		life_atmcash = life_atmcash - _price - 1000;
	};
};
if(_failed) exitWith {hint "You don't have enough money";};
closeDialog 0;
cutText["En route to destination...","BLACK FADED"];
0 cutFadeOut 9999999;
player setPos getMarkerPos "respawn_civilian";
sleep (_time + 1);
player setPos _sp;
cutText ["You have arrived at your destination.","BLACK IN"];
[true] call life_fnc_sessionHandle;
[] call life_fnc_hudUpdate;