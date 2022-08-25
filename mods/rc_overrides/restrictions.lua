-- Restrictions

minetest.override_item("default:lava_source", {
                          groups = {not_in_creative_inventory = 1}
})

minetest.override_item("default:river_water_source", {
                          groups = {water = 3,
                                    liquid = 3,
                                    puts_out_fire = 1,
                                    not_in_creative_inventory = 1}
})

minetest.override_item("default:water_source", {
                          groups = {water = 3,
                                    liquid = 3,
                                    puts_out_fire = 1,
                                    not_in_creative_inventory = 1}
})

