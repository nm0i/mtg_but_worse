-- Restrictions

local item_context = {
   groups = {not_in_creative_inventory = 1}
}
minetest.override_item("default:lava_source", item_context)

local item_context = {
   groups = {water = 3,
             liquid = 3,
             puts_out_fire = 1,
             not_in_creative_inventory = 1}
}
minetest.override_item("default:river_water_source", item_context)

local item_context = {
   groups = {water = 3,
             liquid = 3,
             puts_out_fire = 1,
             not_in_creative_inventory = 1}
}
minetest.override_item("default:water_source", item_context)

