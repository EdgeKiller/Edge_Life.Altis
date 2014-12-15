/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3","_uid","_numberPlate","_numberPlateArray"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {[[_vehicle,"color",3,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_sport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_SUV_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Van_01_box_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Van_01_transport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
	};
};

//Fetch texture from our present array.
_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0;};

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["Life_VEH_color",_index,true];
};

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTexture[0,_texture];
if(!isNil "_texture2") then
{
	_vehicle setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then
{
	_vehicle setObjectTexture[2,_texture3];
};

if(typeOf _vehicle == "C_Offroad_01_F") then
{
	if(_index < 5) then
	{
		_vehicle setObjectTexture[1,_texture];
	};
};

if(typeOf _vehicle == "cl3_reventon_white") then
{
	_uid = getPlayerUID player;
	_numberPlateArray = toArray _uid;
	_vehicle setObjectTexture[1,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 10]) + ".paa"];
	_vehicle setObjectTexture[2,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 11]) + ".paa"];
	_vehicle setObjectTexture[3,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 12]) + ".paa"];
	_vehicle setObjectTexture[4,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 13]) + ".paa"];
	_vehicle setObjectTexture[5,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 14]) + ".paa"];
	_vehicle setObjectTexture[6,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 15]) + ".paa"];
	_vehicle setObjectTexture[7,"\cl3_vehiclefunctions\numberplate\" + toString([_numberPlateArray select 16]) + ".paa"];
};

