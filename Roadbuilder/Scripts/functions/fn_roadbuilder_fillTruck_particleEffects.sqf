params ["_particleSpawn"];

hint "test";

private _posATL = _particleSpawn modelToWorld [0,0,0];
private _particleSource_sandFalling = "#particlesource" createVehicleLocal _posATL;

_particleSource_sandFalling setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal",16,7,48,1], 
    "",
    "Billboard",
    1,
    0.7,                      
    [0,0,0],
    [0,0,-1.2],             
    0,
    0.3,                   
    0.04,
    0.02,
    [0.6,0.9,1.4],          
    [
        [0.85,0.8,0.7,0.25],
        [0.85,0.8,0.7,0.18],
        [0.85,0.8,0.7,0]
    ],
    [0.5],
    0,
    0,
    "",
    "",
    _particleSource_sandFalling
];

_particleSource_sandFalling setParticleRandom [
    0,
    [0.6,0.6,0],
    [0.2,0.2,-0.4],
    0,
    0.4,
    [0,0,0,0],
    0,
    0
];

_particleSource_sandFalling setDropInterval 0.008;

[_particleSpawn] spawn {
    params ["_particleSpawn"];

    while {_particleSpawn getVariable ["ER32_roadbuilder_filled",false] == false} do {
        _particleSpawn say3D ["ER32_sandFalling", 80];
        sleep 4;   // length of your sound file!
    };
};


waitUntil {_particleSpawn getVariable ["ER32_roadbuilder_filled",false] == true};

_particleSource_sandFalling setDropInterval 0;
sleep 2;
deleteVehicle _particleSource_sandFalling;