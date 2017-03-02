moreflowers = {}

dofile(minetest.get_modpath("moreflowers").."/mapgen.lua")

-- flowers registration
local function add_simple_flower(name, desc, box, f_groups)
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("moreflowers:" .. name, {
									  description = desc,
									  drawtype = "plantlike",
									  waving = 1,
									  tiles = {"moreflowers_"..name..".png"},
									  inventory_image = "moreflowers_"..name..".png",
									  wield_image = "moreflowers_"..name..".png",
									  sunlight_propagates = true,
									  paramtype = "light",
									  walkable = false,
									  buildable_to = true,
									  stack_max = 99,
									  groups = f_groups,
									  sounds = default.node_sound_leaves_defaults(),
									  selection_box = {
										  type = "fixed",
										  fixed = box
									  }
																  })
end

local function add_tall_flower(name, desc, box, f_groups)
	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("moreflowers:" .. name, {
									  description = desc,
									  drawtype = "plantlike",
									  waving = 1,
									  tiles = {"moreflowers_"..name..".png"},
									  inventory_image = "moreflowers_"..name..".png",
									  wield_image = "moreflowers_"..name..".png",
									  sunlight_propagates = true,
									  paramtype = "light",
									  walkable = false,
									  buildable_to = true,
									  stack_max = 99,
									  visual_scale = 1.3,
									  wield_scale = {x=1, y=1.5, z=1},
									  groups = f_groups,
									  sounds = default.node_sound_leaves_defaults(),
									  selection_box = {
										  type = "fixed",
										  fixed = box
									  }
																  })
end

moreflowers.datas_simple = {
	{
		"wild_carrot",
		"Wild Carrot",
		{-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16},
		{flammable = 1}
	},
}
moreflowers.datas_tall = {
	{
		"teosinte",
		"Teosinte",
		{-0.5, -0.5, -0.5, 0.5, 1.2, 0.5},
		{flammable = 1}
	},
}

for _,item in pairs(moreflowers.datas_simple) do
	add_simple_flower(unpack(item))
end

for _,item in pairs(moreflowers.datas_tall) do
	add_tall_flower(unpack(item))
end

-- Plant spread TODO ?

-- Bunch of flowers
if minetest.get_modpath("farming") then
	
	minetest.register_craftitem("moreflowers:bunch", {
											 description = "Bunch of flowers",
											 inventory_image = "moreflowers_bunch.png",
																	 })
	
	minetest.register_craft({
										output = "moreflowers:bunch",
										recipe = {
											{"group:flower", "group:flower", "group:flower"},
											{"group:flower", "group:flower", "group:flower"},
											{"", "farming:cotton", ""},
										},
									})
	
	if minetest.get_modpath("vessels") then
		
		-- Bunch in a vase
		minetest.register_node("moreflowers:bunch_vase", {
										  description = "Bunch in a vase",
										  drawtype = "plantlike",
										  tiles = {"moreflowers_bunch_vase.png"},
										  inventory_image = "moreflowers_bunch_vase.png",
										  wield_image = "moreflowers_bunch_vase.png",
										  paramtype = "light",
										  is_ground_content = false,
										  walkable = false,
										  selection_box = {
											  type = "fixed",
											  fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
										  },
										  groups = {dig_immediate = 3, attached_node = 1, falling_node = 1},
										  sounds = default.node_sound_glass_defaults(),
																		 })
		
		minetest.register_craft({
											output = "moreflowers:bunch_vase",
											type = "shapeless",
											recipe = {"moreflowers:bunch", "group:vessel"},
										})
	end
end

-- Bonemeal flowers registration for adding dirt decoration
if minetest.get_modpath("bonemeal") and bonemeal then
	local green_grass = {
		"default:grass_2", "default:grass_3", "default:grass_4",
		"default:grass_5", "", ""
	}
	local dry_grass = {
		"default:dry_grass_2", "default:dry_grass_3", "default:dry_grass_4",
		"default:dry_grass_5", "", ""
	}
	local flowers = {
		"flowers:dandelion_white", "flowers:dandelion_yellow", "flowers:geranium",
		"flowers:rose", "flowers:tulip", "flowers:viola", "moreflowers:wild_carrot",
		"moreflowers:teosinte",
	}
	
	local dirt_with_grass_deco = {
		{"default:dirt_with_grass", green_grass, flowers}
	}

	local dirt_with_dry_grass_deco = {
		{"default:dirt_with_dry_grass", dry_grass, flowers}
	}
			
	bonemeal:add_deco(dirt_with_grass_deco)
	bonemeal:add_deco(dirt_with_dry_grass_deco)
end
