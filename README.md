# 32-Engineer-Regiment-Roadcraft
This project will try to bring road construction into ArmA 3. By multiple steps the player will be able to remove obstacles, fill a truck with sand, place the sand on the ground. flatten the sand with a driveable bulldozer and asphalt the road.

---

###### How to install

1. Copy all files from the **script** folder into your mission folder.
2. Right now the system works for only one bulldozer spawner and one sandfiller. Later unlimited amounts can be added. Use **ER32_bulldozer_spawner** for the interaction point and **ER32_bulldozer_spawnpoint** for the spawn point. For sandfiller use **ER32_roadcraft_switch_sandFiller** for the interaction point and **ER32_roadcraft_sandFiller_zone** for the detection zone.
3. And thats it.

---

###### How it works

* Players can spawn a drivable bulldozer (Which is just the bulldozer object attached to a invisible tractor).
* The bulldozer has the ability to demolish obstacles, to create a clear path for future roads.
* It can also flatten sand piles. This will be important later.
* The other important feature is the sandfiller. Which allows to fill a Hemtt Truck with sand, when on the detection pat.
* Fully filled the truck can be used to deploy sand piles behind it.
* The bulldozer can then flatten those sand piles to create a rudimentary road.

---

###### File Overview

* "ER32_roadcraft_bulldozer_demolishment.sqf"   Controls the demolishment part.
* "ER32_roadcraft_bulldozer_flatten.sqf"        Controls the flattening of sandpiles.
* "ER32_roadcraft_bulldozer_spawn.sqf"          Controls the spawning of the bulldozer.
* "ER32_roadcraft_fillTruck.sqf"                Controls the filling of sand into the truck.
* "ER32_roadcraft_sandDropper.sqf"              Controls the deployment of the sandpiles.
* "init.sqf"                                    Initializes the other scripts.

---

###### License

This project is released under the MIT License.

Feel free to use, modify, and share with proper credit.

---

###### Credits

* 32 Engineer Regiment for testing and feedback.
* ACE3 and CBA\_A3 developers for their framework.
