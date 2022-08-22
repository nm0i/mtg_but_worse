
walls = {}


-- walls
function walls.register_wall(name, def)

	-- register nodes
	-- if minetest.get_modpath("default") then
	-- 	def.sounds = def.sounds or default.node_sound_leaves_defaults()
	-- end

	minetest.register_node(":" .. name .. "_wall", {
		description = def.description or "Wall",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {def.texture},
		groups = def.groups or
			{cracky = 3, wall = 1},
		node_box = {
			-- TODO: adjust node boxes
			type = "connected",
			fixed = {{-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}},
			connect_left = {{-0.5, -0.5, -5/16, -5/16, 5/16, 5/16}},
			connect_right = {{5/16, -0.5, -5/16, 0.5, 5/16, 5/16}},
			connect_front = {{-5/16, -0.5, -0.5, 5/16, 5/16, -5/16}},
			connect_back = {{-5/16, -0.5, 5/16, 5/16, 5/16, 0.5}},
		},
		connects_to = {"group:wall"},
		light_source = def.light_source or 0,
		-- sounds = def.sounds,
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			local pos_above = {x = pos.x, y = pos.y + 1, z = pos.z}
			local node_under = string.gsub(minetest.get_node(pos_under).name, "_full$", "")
			local node_above = string.gsub(minetest.get_node(pos_above).name, "_full$", "")

			if minetest.get_item_group(node_under, "wall") == 1 then
				minetest.set_node(pos_under, {name = node_under .. "_full"})
			end
			if minetest.get_item_group(node_above, "wall") == 1 then
				minetest.set_node(pos, {name = name .. "_wall_full"})
			end
		end,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			local node_under = string.gsub(minetest.get_node(pos_under).name, "_full$", "")
			if minetest.get_item_group(node_under, "wall") == 1 and
					digger and digger:is_player() then
				minetest.set_node(pos_under, {name = node_under})
			end
		end,
	})

	minetest.register_node(":" .. name .. "_wall_full", {
		description = def.description or "Wall",
		drawtype = "nodebox",
		paramtype = "light",
		tiles = {def.texture},
		groups = def.groups or
			{cracky = 3, wall = 1,
			not_in_creative_inventory = 1},
		node_box = {
			-- TODO: adjust node boxes
			type = "connected",
			fixed = {{-5/16, -0.5, -5/16, 5/16, 0.5, 5/16}},
			connect_left = {{-0.5, -0.5, -5/16, -5/16, 0.5, 5/16}},
			connect_right = {{5/16, -0.5, -5/16, 0.5, 0.5, 5/16}},
			connect_front = {{-5/16, -0.5, -0.5, 5/16, 0.5, -5/16}},
			connect_back = {{-5/16, -0.5, 5/16, 5/16, 0.5, 0.5}},
		},
		connects_to = {"group:wall"},
		light_source = def.light_source or 0,
		-- sounds = def.sounds,
		drop = name .. "_wall",
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local pos_under = {x = pos.x, y = pos.y - 1, z = pos.z}
			local node_under = string.gsub(minetest.get_node(pos_under).name, "_full$", "")
			if minetest.get_item_group(node_under, "wall") == 1 and
					digger and digger:is_player() then
				minetest.set_node(pos_under, {name = node_under})
			end
		end,
	})

	-- register crafting recipe
	-- TODO
end




-- register walls if base mod found
if minetest.get_modpath("default") then

	walls.register_wall("default:stonebrick", {
		description = "Stone Brick Wall",
		texture = "default_stone_brick.png",
		material = "default:stonebrick",
	})

	walls.register_wall("default:desert_stonebrick", {
		description = "Desert Stone Brick Wall",
		texture = "default_desert_stone_brick.png",
		material = "default:desert_stonebrick",
	})

	walls.register_wall("default:sandstonebrick", {
		description = "Sandstone Brick Wall",
		texture = "default_sandstone_brick.png",
		material = "default:sandstonebrick",
	})

	walls.register_wall("default:desert_sandstone_brick", {
		description = "Desert Sandstone Brick Wall",
		texture = "default_desert_sandstone_brick.png",
		material = "default:desert_sandstone_brick",
	})

	walls.register_wall("default:silver_sandstone_brick", {
		description = "Silver Sandstone Brick Wall",
		texture = "default_silver_sandstone_brick.png",
		material = "default:silver_sandstone_brick",
	})

	walls.register_wall("default:obsidianbrick", {
		description = "Obsidian Brick Wall",
		texture = "default_obsidian_brick.png",
		material = "default:obsidianbrick",
	})

	walls.register_wall("default:brick", {
		description = "Brick Wall",
		texture = "default_brick.png",
		material = "default:brick",
	})

end
