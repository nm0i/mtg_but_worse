local node_context = {
   description = "Water Source",
   drawtype = "liquid",
   waving = 3,
   tiles = {
      {
         name = "default_water_source_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 2.0,
         },
      },
      {
         name = "default_water_source_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 2.0,
         },
      },
   },
   use_texture_alpha = "blend",
   paramtype = "light",
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "source",
   liquid_alternative_flowing = "rc_overrides:water_flowing",
   liquid_alternative_source = "rc_overrides:water_source",
   liquid_viscosity = 1,
   liquid_renewable = false,
   post_effect_color = {a = 103, r = 30, g = 60, b = 90},
   groups = {water = 3, liquid = 3, cools_lava = 1},
   sounds = default.node_sound_water_defaults(),
}
minetest.register_node("rc_overrides:water_source", node_context)

local node_context = {
   description = "Flowing Water",
   drawtype = "flowingliquid",
   tiles = {"default_water.png"},
   special_tiles = {
      {
         name = "default_water_flowing_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.5,
         },
      },
      {
         name = "default_water_flowing_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.5,
         },
      },
   },
   use_texture_alpha = "blend",
   paramtype = "light",
   paramtype2 = "flowingliquid",
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "flowing",
   liquid_alternative_flowing = "rc_overrides:water_flowing",
   liquid_alternative_source = "rc_overrides:water_source",
   liquid_viscosity = 1,
   liquid_renewable = false,
   liquid_range = 0,
   post_effect_color = {a = 103, r = 30, g = 60, b = 90},
   groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
             cools_lava = 1},
   sounds = default.node_sound_water_defaults(),
}
minetest.register_node("rc_overrides:water_flowing", node_context)

local node_context = {
   description = "River Water Source",
   drawtype = "liquid",
   waving = 3,
   tiles = {
      {
         name = "default_river_water_source_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 2.0,
         },
      },
      {
         name = "default_river_water_source_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 2.0,
         },
      },
   },
   use_texture_alpha = "blend",
   paramtype = "light",
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "source",
   liquid_alternative_flowing = "rc_overrides:river_water_flowing",
   liquid_alternative_source = "rc_overrides:river_water_source",
   liquid_viscosity = 1,
   liquid_renewable = false,
   post_effect_color = {a = 103, r = 30, g = 76, b = 90},
   groups = {water = 3, liquid = 3, cools_lava = 1},
   sounds = default.node_sound_water_defaults(),
}
minetest.register_node("rc_overrides:river_water_source", node_context)

local node_context = {
   description = "Flowing River Water",
   drawtype = "flowingliquid",
   tiles = {"default_river_water.png"},
   special_tiles = {
      {
         name = "default_river_water_flowing_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.5,
         },
      },
      {
         name = "default_river_water_flowing_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.5,
         },
      },
   },
   use_texture_alpha = "blend",
   paramtype = "light",
   paramtype2 = "flowingliquid",
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "flowing",
   liquid_alternative_flowing = "rc_overrides:river_water_flowing",
   liquid_alternative_source = "rc_overrides:river_water_source",
   liquid_viscosity = 1,
   liquid_renewable = false,
   liquid_range = 0,
   post_effect_color = {a = 103, r = 30, g = 76, b = 90},
   groups = {water = 3, liquid = 3, not_in_creative_inventory = 1,
             cools_lava = 1},
   sounds = default.node_sound_water_defaults(),
}
minetest.register_node("rc_overrides:river_water_flowing", node_context)


local node_context = {
   description = "Lava Source",
   drawtype = "liquid",
   waving = 3,
   tiles = {
      {
         name = "default_lava_source_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 3.0,
         },
      },
      {
         name = "default_lava_source_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 3.0,
         },
      },
   },
   paramtype = "light",
   light_source = default.LIGHT_MAX - 1,
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "source",
   liquid_alternative_flowing = "rc_overrides:lava_flowing",
   liquid_alternative_source = "rc_overrides:lava_source",
   liquid_viscosity = 7,
   liquid_renewable = false,
   damage_per_second = 4 * 2,
   post_effect_color = {a = 191, r = 255, g = 64, b = 0},
   groups = {lava = 3, liquid = 2, igniter = 1},
}
minetest.register_node("rc_overrides:lava_source", node_context)

local node_context = {
   description = "Flowing Lava",
   drawtype = "flowingliquid",
   tiles = {"default_lava.png"},
   special_tiles = {
      {
         name = "default_lava_flowing_animated.png",
         backface_culling = false,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 3.3,
         },
      },
      {
         name = "default_lava_flowing_animated.png",
         backface_culling = true,
         animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 3.3,
         },
      },
   },
   paramtype = "light",
   paramtype2 = "flowingliquid",
   light_source = default.LIGHT_MAX - 1,
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   is_ground_content = false,
   drop = "",
   drowning = 1,
   liquidtype = "flowing",
   liquid_alternative_flowing = "rc_overrides:lava_flowing",
   liquid_alternative_source = "rc_overrides:lava_source",
   liquid_viscosity = 7,
   liquid_renewable = false,
   liquid_range = 0,
   damage_per_second = 4 * 2,
   post_effect_color = {a = 191, r = 255, g = 64, b = 0},
   groups = {lava = 3, liquid = 2, igniter = 1,
             not_in_creative_inventory = 1},
}
minetest.register_node("rc_overrides:lava_flowing", node_context)
