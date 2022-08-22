Walls
======
Walls mod which adds walls and hedges that automatically connect to each other when placed. Walls and hedges connect both horizontally and vertically.


API
---
New hedges and walls can be registered by using the API.

For example, the simplest definition would need you to provide a name, texture, groups and material the wall or hedge is crafted from:

```
walls.register_hedge("mod_name:hedge_name", {
	texture = "texture.png",
	material = "mod_name:material_name",	
})

```

You can also include the following in the definition:

- description: "Wall" or "Hedge" if not defined.
- groups: must include "wall = 1" or "hedge = 1" as appropriate.
- sounds: 
- light_source: 0 if not defined.


Licenses and Attribution 
-----------------------

Code for this mod is released under MIT (https://opensource.org/licenses/MIT).
