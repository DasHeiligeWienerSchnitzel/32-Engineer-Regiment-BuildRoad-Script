params ["_vehicle","_player"];


if (isMultiplayer) then {
	[_vehicle] remoteExecCall ["ER32_fnc_roadbuilder_addAndRemoveSandDropperActions",-2];
}else{
	[_vehicle] call ER32_fnc_roadbuilder_addAndRemoveSandDropperActions;
};

_sandDropperActive = true;
_vehicle setVariable ["ER32_roadbuilder_sandDropper_loopActive",_sandDropperActive,true];
_sandAmount = _vehicle getVariable ["ER32_roadbuilder_sandFilled",0];

_sands = _vehicle nearObjects ["EFM_ground_surface_2x2m_soil",5];
while {_sandDropperActive == true and _sandAmount > 0} do {
	_canSpawn = true;
	{
		if (((_x select 1) distance2D _vehicle) < 10) exitWith {
			_canSpawn = false;
		};
	}forEach ER32_roadbuilder_placedSands;
	_height = _vehicle getVariable ["ER32_roadbuilder_sandHeight", 0];
	
	if (_canSpawn == true) then {

		_posBehindVehicle = _vehicle getRelPos [-5,0];
		
		_droppedSand = createSimpleObject ["HumpsDirt", _posBehindVehicle, false];
		ER32_roadbuilder_placedSands pushBack [_droppedSand,_posBehindVehicle];
		publicVariable "ER32_roadbuilder_placedSands";
		_droppedSand hideObjectGlobal true;
		
		_groundZ = getTerrainHeightASL [_posBehindVehicle select 0, _posBehindVehicle select 1];
		
		_droppedSand setPosASL [(getPosASL _droppedSand) select 0,(getPosASL _droppedSand) select 1,_groundZ];
		_droppedSand setDir ((getDir _vehicle) - 90);
		_droppedSand setVectorUp (surfaceNormal getPosASL _droppedSand);
		
		[_droppedSand] remoteExec ["ER32_fnc_roadbuilder_mpScale",0];
		
		_sandAmount = _vehicle getVariable ["ER32_roadbuilder_sandFilled",0];
	
		format ["Sand: %1/1500",_sandAmount] remoteExec ["hintSilent",owner _player]  ;
		_sandAmount = _sandAmount - 30;
		
		_vehicle setVariable ["ER32_roadbuilder_sandFilled",_sandAmount,true];
		
		
		_height = 0.0003333 * _sandAmount - 0.5;
		_sandPositions = [[0, 0.5, _height],[0, -1.5, _height],[0, -3.1, _height]];
		{
			[_x,[_vehicle, _sandPositions select _forEachIndex]] remoteExec ["attachTo",0];
		}forEach _sands;
		
		if (_sandAmount < 1) then {
			{
				_vehicle setVariable ["ER32_roadbuilder_sandDropper_loopActive",false,true];
				_vehicle setVariable ["ER32_roadbuilder_sandFilled",1,true];
				if (isMultiplayer) then {
					[_vehicle] remoteExecCall ["ER32_fnc_roadbuilder_removeSandDropperAction",-2];
				}else{
					[_vehicle] call ER32_fnc_roadbuilder_removeSandDropperAction;
				};
				
			}forEach _sands;
		};
	};
	_vehicle setVariable ["ER32_roadbuilder_sandHeight",_height,true];
	_sandDropperActive = _vehicle getVariable ["ER32_roadbuilder_sandDropper_loopActive",true];
	
	sleep 0.1;
};