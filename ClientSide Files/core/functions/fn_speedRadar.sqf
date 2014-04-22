private["_display","_speed","_player","_ui","_text"];
disableSerialization;
3 cutRsc ["Life_Speed_Radar","PLAIN"];
[] call life_fnc_speedRadarUpdate;
[] spawn
{
	private["_player"];
	while {true} do
	{
		_player = cursorTarget;
		waitUntil {player knowsAbout _player};
		[] call life_fnc_speedRadarUpdate;
	};
};