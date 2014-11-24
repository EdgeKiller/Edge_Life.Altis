#include <macro.h>
/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2]],]
						["hgun_P07_F", ["life_inv_goldbar",2,"life_inv_copperr",1]],
						["SMG_01_F", ["life_inv_goldbar",6,"life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]]

					]
				];
			};
		};
	};
};
