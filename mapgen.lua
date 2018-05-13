-- decoration function
local function register_mgv6_flower(name)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 100, y = 100, z = 100},
			seed = 368,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "moreflowers:"..name,
	})
end

function moreflowers.register_mgv6_decorations()
	register_mgv6_flower("wild_carrot")
	register_mgv6_flower("solanaceae")
end

function moreflowers.register_decorations()
	minetest.register_decoration(
		{
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.015,
				scale = 0.025,
				spread = {x = 200, y = 200, z = 200},
				seed = 368,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"grassland", "deciduous_forest"},
			y_min = 1,
			y_max = 31000,
			decoration = "moreflowers:wild_carrot",
		})
	
	minetest.register_decoration(
		{
			deco_type = "simple",
			place_on = {"default:dirt_with_rainforest_litter", "default:dirt_with_grass"},
			sidelen = 16,
			fill_ratio = 0.001,
			biomes = {"rainforest"},
			decoration = "moreflowers:teosinte",
			height = 1,
		})

	minetest.register_decoration(
		{
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = -0.015,
				scale = 0.025,
				spread = {x = 200, y = 200, z = 200},
				seed = 369,
				octaves = 3,
				persist = 0.6
			},
			biomes = {"grassland", "deciduous_forest"},
			y_min = 64,
			y_max = 31000,
			decoration = "moreflowers:solanaceae",
		})											  
end

-- detect mapgen
local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name == "v6" then
	moreflowers.register_mgv6_decorations()
else
	moreflowers.register_decorations()
end
