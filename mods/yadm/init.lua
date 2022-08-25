

local doordefs = {
--	{ Suffix, Desc Base, ImageName, 
	{ "gwd1",	"Decorative Wooden Door 1",	"glswood1" },
	{ "gwd2",	"Decorative Wooden Door 1",	"glsacacia1" },
	{ "gwd3",	"Decorative Wooden Door 1",	"glsjungle1" },
	{ "gwd10",	"Decorative Wooden Door 2",	"glswood2" },
	{ "gwd11",	"Decorative Wooden Door 2",	"glsacacia2" },
	{ "gwd12",	"Decorative Wooden Door 2",	"glsjungle2" },
	{ "gwd13",	"Decorative Wooden Door 2",	"glshealing2" },
	{ "gwd14",	"Decorative Wooden Door 2",	"glsfrost2" },
	{ "gwd15",	"Decorative Wooden Door 3",	"glswood3" },
	{ "gwd16",	"Decorative Wooden Door 3",	"glsacacia3" },
	{ "gwd17",	"Decorative Wooden Door 3",	"glsjungle3" },
	{ "wd1",	"Wooden Door 1",		"wood1" },
	{ "wd2",	"Wooden Door 2",		"acacia1" },
	{ "wd3",	"Wooden Door 3",		"jungle1" },
	{ "wd4",	"Wodden Door 4",		"healing1" },
	{ "wd5",	"Wodden Door 5",		"frost1" },
}

for i,ddef in ipairs(doordefs) do
	local suffix = ddef[1]
	local desc = ddef[2]
	local img = ddef[3]

	doors.register_door("yadm:door_"..suffix, {
		description = desc,
		inventory_image = "yadm_"..img.."_inv.png",
		groups = { choppy = 2, cracky = 2, door = 1 },
		tiles = {{ name = "yadm_"..img..".png", backface_culling = true }},
		protected = false,
		drop = "yadm:door_"..suffix,
	})

end


local trdoordefs = {
--	{ Suffix, Desc Base, ImageName,
	{ "wd1",	"Wooden Trap Door 1",		"trwood1" },
	{ "wd2",	"Wooden Trap Door 2",		"tracacia1" },
	{ "wd3",	"Wooden Trap Door 3",		"trjungle1" },
}

for i,ddef in ipairs(trdoordefs) do
	local suffix = ddef[1]
	local desc = ddef[2]
	local img = ddef[3]

	doors.register_trapdoor("yadm:trdoor_"..suffix, {
		description = desc,
		inventory_image = "yadm_"..img.."_front.png",
		wield_image =  "yadm_"..img.."_front.png",
		tile_front =  "yadm_"..img.."_front.png",
		tile_side =  "yadm_"..img.."_side.png",
		protected = false,
		sounds = default.node_sound_wood_defaults(),
		sound_open = "doors_wood_door_open",
		sound_close = "doors_wood_door_close",
		groups = {choppy = 1, level = 2, door = 1},
	})
end

