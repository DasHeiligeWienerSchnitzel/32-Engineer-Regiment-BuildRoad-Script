#### Changelog

---

##### Version 1.21 - 14.12.2025 

###### Added
- Bulldozer can now be loaded onto the flatebed load/unload system from the Resssources and Build Script.
- Falling sand particles and corresponding sound can now be seen and heard when filling up a truck with sand.

###### Fixes
- Hint for showing the amount of sand, while dropping sand is no longer global.
- Sandtrucks would consistently explode when getting empty from dropping sand. Reason was some clunky interaction with the sand beeing attached and removed at the same time. Fixed by not removing the sand and instead leaving it at 1.

###### Changed
- Tractor "C_Tractor_01_F" from Contract DLC was changed to "UK3CB_C_Tractor" from the UK3CB mod.

---

##### Version 1.2

###### Fixes
- Fixed an issue, where the sand dropper action would get duplicated after filling the truck a second time at the refiller.

---

##### Version 1.1
###### Fixes
- Fixed a problem, where on a dedicated server, the ace self interaction for dropping sand would not show.
- Fixed a problem, where the truck would stay unsimulated if trying to refill, when already full.
- Demolishment now works properly in mp.
- Flattening can now be existed correctly.
- No overfilling possible anymore. Will not load more then 1500 sand into the truck.

---

##### Version 1.0
Release Version with main functions and mp compatibility.

###### Changed
* Rewritten script to enable multiplayer compatiblity.
* Rewritten script to use functions properly.

---

##### Version 0.9

###### Added
* New file "ER32_buildRoad_interactions.sqf". Holds all the ace interactions.
###### Changed
* Renamed script from **roadcraft** to **buildRoad**.
* Rewrote the code to make it support multiple classnames for spawning bulldozers and filling Trucks.
* "Init.sqf" now holds the parameters and initialises the other scripts.
###### Removed
* Removed the "ER32_buildRoad_bulldozer_spawn.sqf" file, as its functionality was moved to the "ER32_buildRoad_interactions.sqf" file.
