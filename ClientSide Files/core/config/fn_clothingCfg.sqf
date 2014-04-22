private["_player","_ret","_path"];
_player = [_this,0,"",[""]] call BIS_fnc_param;
if(_player == "") exitWith {[]};
_ret = [];

switch (_player) do
{
	case "cadet_skin":
	{
		["textures\playerskins\cadet.paa","cop"],
	};
	case "highway_skin":
	{
		["textures\playerskins\highway.paa","cop"],
	};
	case "trained_skin":
	{
		["textures\playerskins\trained.paa","cop"],
	};
_ret;