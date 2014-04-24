#include <macro.h>
/*
	
*/
private["_side", "_markers", "_i", "_houses", "_house", "_mk", "_mkName"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_markers = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","HW Patrol","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		_markers = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(__GETC__(life_donator) >= __GETC__(HOUSING_DONATOR_LEVEL) && license_civ_home) then {		
		
			_houses = [
				"Land_i_House_Small_01_V1_F",
				"Land_i_House_Small_01_V2_F",
				"Land_i_House_Small_01_V3_F",
				"Land_i_House_Small_02_V1_F",
				"Land_i_House_Small_02_V2_F",
				"Land_i_House_Small_02_V3_F",
				"Land_i_House_Small_03_V1_F",
				"Land_i_House_Big_01_V1_F",
				"Land_i_House_Big_01_V2_F",
				"Land_i_House_Big_01_V3_F",
				"Land_i_House_Big_02_V1_F",
				"Land_i_House_Big_02_V2_F",
				"Land_i_House_Big_02_V3_F"
			];
			
			_i = 1;
			{
				_house = nearestObject [(_x select 0), "House_F"];
				if((typeOf _house) in _houses) then {
					
					_mkName  = format["civ_spawn_home_%1", _i];
					
					if (isNil (_mkName)) then {
						_mk = createMarkerLocal [_mkName, (_x select 0)];
						_mk setMarkerAlphaLocal 0;
					};
					
					_markers set [count _markers, [_mkName, format ["Home %1", _i], "\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
					_i = _i + 1;
				};
			}forEach life_houses;		
		};
	};
};
_markers;