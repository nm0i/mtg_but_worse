

local doordefs = {
--	{ Suffix, Desc Base, ImageName, 
	{ "gwd1",	"Decorative Wooden Door 1",	"glswood1" },
	{ "gwd2",	"Decorative Wooden Door 2",	"glsacacia1" },
	{ "gwd3",	"Decorative Wooden Door 3",	"glsjungle1" },
	{ "wd1",	"Wooden Door 1",		"wood1" },
	{ "wd2",	"Wooden Door 2",		"acacia1" },
	{ "wd3",	"Wooden Door 3",		"jungle1" },
}

for i,ddef in ipairs(doordefs) do
	local suffix = ddef[1]
	local desc = ddef[2]
	local img = ddef[3]

	-- doors.register_door("yadm:door_"..suffix.."_locked", {
	-- 	description = desc.." Locked",
	-- 	inventory_image = "yadm_"..img.."_inv.png",
	-- 	groups = { choppy = 2, cracky = 2, door = 1 },
	-- 	tiles = {{ name = "yadm_"..img..".png", backface_culling = true }},
	-- 	protected = true,
	-- 	drop = "yadm:door_"..suffix.."_locked",
	-- })

	doors.register_door("yadm:door_"..suffix, {
		description = desc,
		inventory_image = "yadm_"..img.."_inv.png",
		groups = { choppy = 2, cracky = 2, door = 1 },
		tiles = {{ name = "yadm_"..img..".png", backface_culling = true }},
		protected = false,
		drop = "yadm:door_"..suffix,
	})

end

-- -- Crafts
-- -- {{{1 Decorative Wooden Door 1 (apple/default wood)
-- minetest.register_craft({ 
-- 	output = "yadm:door_gwd1_locked 1",
-- 	recipe = {
-- 		{"default:glass", "default:wood", ""},
-- 		{"default:wood", "default:wood", "default:steel_ingot"},
-- 		{"default:wood", "default:wood", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_gwd1 1",
-- 	recipe = {
-- 		{"default:glass", "default:wood", },
-- 		{"default:wood", "default:wood", },
-- 		{"default:wood", "default:wood", }
-- 	}
-- }) -- }}}1
-- -- {{{1 Decorative Wooden Door 2 (acacia)
-- minetest.register_craft({
-- 	output = "yadm:door_gwd2_locked 1",
-- 	recipe = {
-- 		{"default:glass", "default:acacia_wood", ""},
-- 		{"default:acacia_wood", "default:acacia_wood", "default:steel_ingot"},
-- 		{"default:acacia_wood", "default:acacia_wood", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_gwd2 1",
-- 	recipe = {
-- 		{"default:glass", "default:acacia_wood", },
-- 		{"default:acacia_wood", "default:acacia_wood",},
-- 		{"default:acacia_wood", "default:acacia_wood",}
-- 	}
-- })
-- --}}}1
-- -- {{{1 Decorative Wooden Door 3 (jungle)
-- minetest.register_craft({
-- 	output = "yadm:door_gwd3_locked 1",
-- 	recipe = {
-- 		{"default:glass", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", "default:steel_ingot"},
-- 		{"default:junglewood", "default:junglewood", ""}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_gwd3 1",
-- 	recipe = {
-- 		{"default:glass", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", ""}
-- 	}
-- })
-- -- }}}1


-- -- {{{1 Wooden Door 1 (apple/default wood)
-- minetest.register_craft({ 
-- 	output = "yadm:door_wd1_locked 1",
-- 	recipe = {
-- 		{"default:wood", "default:wood", ""},
-- 		{"default:wood", "default:wood", "default:steel_ingot"},
-- 		{"default:wood", "default:wood", "default:stick"}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_wd1 1",
-- 	recipe = {
-- 		{"default:wood", "default:wood", ""},
-- 		{"default:wood", "default:wood", ""},
-- 		{"default:wood", "default:wood", "default:stick"}
-- 	}
-- }) -- }}}1
-- -- {{{1 Decorative Wooden Door 2 (acacia)
-- minetest.register_craft({
-- 	output = "yadm:door_wd2_locked 1",
-- 	recipe = {
-- 		{"default:acacia_wood", "default:acacia_wood", ""},
-- 		{"default:acacia_wood", "default:acacia_wood", "default:steel_ingot"},
-- 		{"default:acacia_wood", "default:acacia_wood", "default:stick"}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_wd2 1",
-- 	recipe = {
-- 		{"default:acacia_wood", "default:acacia_wood", ""},
-- 		{"default:acacia_wood", "default:acacia_wood", ""},
-- 		{"default:acacia_wood", "default:acacia_wood", "default:stick"}
-- 	}
-- })
-- --}}}1
-- -- {{{1 Decorative Wooden Door 3 (jungle)
-- minetest.register_craft({
-- 	output = "yadm:door_wd3_locked 1",
-- 	recipe = {
-- 		{"default:junglewood", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", "default:steel_ingot"},
-- 		{"default:junglewood", "default:junglewood", "default:stick"}
-- 	}
-- })
-- minetest.register_craft({
-- 	output = "yadm:door_wd3 1",
-- 	recipe = {
-- 		{"default:junglewood", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", ""},
-- 		{"default:junglewood", "default:junglewood", "default:stick"}
-- 	}
-- })
-- -- }}}1
