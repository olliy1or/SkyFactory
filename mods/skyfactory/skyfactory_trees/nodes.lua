--Tree Logs

minetest.register_node("trees:coal_tree", {
    description = "Coal tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_coal.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:iron_tree", {
    description = "Iron tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_iron.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:copper_tree", {
    description = "Copper tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_copper.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:tin_tree", {
    description = "Tin tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_tin.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:gold_tree", {
    description = "Gold tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_gold.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:mese_tree", {
    description = "Mese tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_mese.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:diamond_tree", {
    description = "Diamond tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^default_mineral_diamond.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:dirt_tree", {
    description = "Dirt tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^mineral_dirt.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

minetest.register_node("trees:cobble_tree", {
    description = "Cobble tree log",
    tiles = {
        "log_top.jpg",
        "log_top.jpg",
        "log.jpg^mineral_cobble.png"
    },
    paramtype2 = "facedir",
	is_ground_content = false,
    groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
    sounds = default.node_sound_stone_defaults(),
    on_place = minetest.rotate_node
})

----------
--Leaves--
----------

minetest.register_node("trees:leaf_coal", {
    description = "Coal leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"coal_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_iron", {
    description = "Iron leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"iron_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_copper", {
    description = "Copper leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"copper_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_tin", {
    description = "Tin leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"tin_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_gold", {
    description = "Gold leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"gold_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_mese", {
    description = "Mese leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"mese_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_diamond", {
    description = "Diamond leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"diamond_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_dirt", {
    description = "Dirt leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"dirt_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

minetest.register_node("trees:leaf_cobble", {
    description = "Cobble leaf",
    drawtype = "allfaces_optional",
	waving = 1,
    tiles = {"cobble_tree_leaf.png"},
    is_ground_content = false,
    groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
    sounds = default.node_sound_leaves_defaults(),

    after_place_node = default.after_place_leaves,
})

------------
--Sapiling--
------------

minetest.register_node("trees:coal_sapling", {
	description = "Coal Tree Sapling",
	drawtype = "plantlike",
	tiles = {"coal_sapling.png"},
	inventory_image = "coal_sapling.png",
	wield_image = "coal_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/coal_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:iron_sapling", {
	description = "Iron Tree Sapling",
	drawtype = "plantlike",
	tiles = {"iron_sapling.png"},
	inventory_image = "iron_sapling.png",
	wield_image = "iron_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/iron_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:copper_sapling", {
	description = "Copper Tree Sapling",
	drawtype = "plantlike",
	tiles = {"copper_sapling.png"},
	inventory_image = "copper_sapling.png",
	wield_image = "copper_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/copper_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:tin_sapling", {
	description = "Tin Tree Sapling",
	drawtype = "plantlike",
	tiles = {"tin_sapling.png"},
	inventory_image = "tin_sapling.png",
	wield_image = "tin_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/tin_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:gold_sapling", {
	description = "Gold Tree Sapling",
	drawtype = "plantlike",
	tiles = {"gold_sapling.png"},
	inventory_image = "gold_sapling.png",
	wield_image = "gold_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/gold_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:mese_sapling", {
	description = "Mese Tree Sapling",
	drawtype = "plantlike",
	tiles = {"mese_sapling.png"},
	inventory_image = "mese_sapling.png",
	wield_image = "mese_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/mese_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:diamond_sapling", {
	description = "Diamond Tree Sapling",
	drawtype = "plantlike",
	tiles = {"diamond_sapling.png"},
	inventory_image = "diamond_sapling.png",
	wield_image = "diamond_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/diamond_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:dirt_sapling", {
	description = "Dirt Tree Sapling",
	drawtype = "plantlike",
	tiles = {"dirt_sapling.png"},
	inventory_image = "dirt_sapling.png",
	wield_image = "dirt_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/dirt_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})

minetest.register_node("trees:cobble_sapling", {
	description = "Cobble Tree Sapling",
	drawtype = "plantlike",
	tiles = {"cobble_sapling.png"},
	inventory_image = "cobble_sapling.png",
	wield_image = "cobble_sapling.png",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

    on_construct = function(pos)
        local path = minetest.get_modpath("trees") ..
            "/schematics/cobble_tree_grown.mts"
        minetest.place_schematic({x = pos.x - 3, y = pos.y, z = pos.z - 3},
		    path, "random", nil, true)
    end
})
