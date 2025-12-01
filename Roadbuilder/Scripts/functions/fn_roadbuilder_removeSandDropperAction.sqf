params ["_vehicle"];

private _state = _vehicle getVariable ["ER32_roadbuilder_sandDropper_loopActive",true];
if (_state == false) then {
	[_vehicle, 1, ["ACE_SelfActions","ER32_roadbuilder_sandDropper_loopActive"]] call ace_interact_menu_fnc_removeActionFromObject;
}else{
	[_vehicle, 1, ["ACE_SelfActions","ER32_roadbuilder_sandDropper_loopDeactive"]] call ace_interact_menu_fnc_removeActionFromObject;
}; 
