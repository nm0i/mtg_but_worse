
--moreplants by D00Med

--plants

minetest.register_node("moreplants:tallgrass", {
	description = "Tall Grass",
	drawtype = "plantlike",
	tiles = {"moreplants_longgrass.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_longgrass.png",
	visual_scale = 1.4,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:xlbush", {
	description = "Tall Bush",
	drawtype = "plantlike",
	tiles = {"moreplants_xlbush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_xlbush.png",
	visual_scale = 1.4,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})


minetest.register_node("moreplants:bulrush", {
	description = "Bulrush",
	drawtype = "plantlike",
	tiles = {"moreplants_bullrush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bullrush.png",
	visual_scale = 1.3,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:bigfern", {
	description = "Big Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_bigfern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bigfern.png",
	visual_scale = 1.5,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:umbrella", {
	description = "Umbrella Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_umbrella.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_umbrella.png",
	visual_scale = 2,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 3, 0.3}
	},
	walkable = true,
})

minetest.register_node("moreplants:bigflower", {
	description = "Big Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_bigflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bigflower.png",
	visual_scale = 1.2,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:weed", {
	description = "Weed",
	drawtype = "plantlike",
	tiles = {"moreplants_weed.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_weed.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:stoneweed", {
	description = "Stone weed",
	drawtype = "plantlike",
	tiles = {"moreplants_stoneplant.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_stoneplant.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:spikefern", {
	description = "Spike Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_spikefern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_spikefern.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:eyeweed", {
	description = "Eye weed",
	drawtype = "plantlike",
	tiles = {"moreplants_eyeweed.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_eyeweed.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:fern", {
	description = "Fern",
	drawtype = "plantlike",
	tiles = {"moreplants_fern.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_fern.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:bush", {
	description = "Bush",
	drawtype = "plantlike",
	tiles = {"moreplants_bush.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_bush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:cactus", {
	description = "Small Cactus",
	drawtype = "plantlike",
	tiles = {"moreplants_cactus.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_cactus.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	damage_per_second = 1
})

minetest.register_node("moreplants:moonflower", {
	description = "Moon Flower",
	drawtype = "plantlike",
	tiles = {"moreplants_moonflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_moonflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:fireflower", {
	description = "Fire flower",
	drawtype = "plantlike",
	tiles = {"moreplants_fireflower.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_fireflower.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
})

minetest.register_node("moreplants:deadweed", {
	description = "dead weed",
	drawtype = "plantlike",
	tiles = {"moreplants_deadweed.png"},
	paramtype = "light",
	light_source = 5,
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_deadweed.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:taigabush", {
	description = "Taiga bush",
	drawtype = "plantlike",
	tiles = {"moreplants_tundrabush.png"},
	paramtype = "light",
	light_source = 5,
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_tundrabush.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:glowfung", {
	description = "glow fungus",
	drawtype = "torchlike",
	tiles = {"moreplants_glowfung.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	light_source = 14,
	legacy_wallmounted = true,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	paramtype2 = "wallmounted",
	is_ground_content = false,
	inventory_image = "moreplants_glowfung.png",
	visual_scale = 1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	walkable = false,
})

minetest.register_node("moreplants:jungleflower", {
	description = "Jungle flower",
	drawtype = "plantlike",
	tiles = {"moreplants_jungleflower1.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_jungleflower1.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, 0.4, 0.4}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:mushroom", {
	description = "Pink Mushroom",
	tiles = {
		"moreplants_mushroom_top.png",
		"moreplants_mushroom_top.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png",
		"moreplants_mushroom_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	buildable_to = true, 
	sunlight_propagates = true,
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.3125, 0.0625}, -- NodeBox1
			{-0.1875, -0.3125, -0.1875, 0.1875, -0.1875, 0.1875}, -- NodeBox2
			{-0.125, -0.1875, -0.125, 0.125, -0.125, 0.125}, -- NodeBox3
		}
	},
	groups = {snappy=3, flammable=1, attatched_node=1},
	light_source=2,
})

minetest.register_node("moreplants:curly", {
	description = "Curly flower",
	drawtype = "plantlike",
	tiles = {"moreplants_curly.png"},
	paramtype = "light",
	is_ground_content = false,
	buildable_to = true, 
	sunlight_propagates = true,
	inventory_image = "moreplants_curly.png",
	visual_scale = 1.1,
	wield_scale = {x=0.5, y=0.5, z=0.5},
	groups = {snappy=3, flammable=1, attatched_node=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.4, 0.3}
	},
	walkable = false,
	waving = 1,
})

minetest.register_node("moreplants:clover", {
	description = "Clover",
	drawtype = "firelike",
	tiles = {
		"moreplants_clover.png",
		"moreplants_trans.png",
		"moreplants_clover.png",
		"moreplants_clover.png",
		"moreplants_clover.png",
		"moreplants_clover.png"
	},
	groups = {snappy=3, flammable=1, attatched_node=1},
	is_ground_content=true,
	buildable_to = true, 
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "moreplants_clover.png",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
	},
	waving = 1,
})

minetest.register_node("moreplants:groundfung", {
	description = "Ground fungus",
	drawtype = "firelike",
	tiles = {
		"moreplants_groundfung.png",
		"moreplants_trans.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png",
		"moreplants_groundfung.png"
	},
	groups = {snappy=3, flammable=1, attatched_node=1},
	is_ground_content=true,
	buildable_to = true, 
	walkable = false,
	inventory_image = "moreplants_groundfung.png",
	paramtype = "light",
	sunlight_propagates=true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.1, 0.5}
	},
	waving = 1,
})

