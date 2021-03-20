function trees.can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil = minetest.get_item_group(name_under, "group:soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end
	return true
end

function trees.grow_sapling(pos)
    if not trees.can_grow(pos) then
--      minetest.get_node_timer(pos):start(1)
        return
    end
    local mg_name = minetest.get_mapgen_setting("mg_name")
    local node = minetest.get_node(pos)
    if node.name == "trees:coal_sapling" then
		trees.grow_coal_tree(pos)
    elseif node.name == "trees:iron_sapling" then
        trees.grow_iron_tree(pos)
    elseif node.name == "trees:copper_sapling" then
        trees.grow_copper_tree(pos)
    elseif node.name == "trees:tin_sapling" then
        trees.grow_tin_tree(pos)
    elseif node.name == "trees:gold_sapling" then
        trees.grow_gold_tree(pos)
    elseif node.name == "trees:mese_sapling" then
        trees.grow_mese_tree(pos)
    elseif node.name == "trees:diamond_sapling" then
        trees.grow_diamond_tree(pos)
    elseif node.name == "trees:dirt_sapling" then
        trees.grow_dirt_tree(pos)
    elseif node.name == "trees:cobble_sapling" then
        trees.grow_cobble_tree(pos)
    end
end

minetest.register_lbm({
	name = "trees:convert_saplings_to_node_timer",
	nodenames = {"trees:coal_sapling", "trees:iron_sapling",
			"trees:tin_sapling", "trees:copper_sapling",
			"trees:gold_sapling", "trees:mese_sapling",
            "trees:diamond_sapling", "trees:dirt_sapling",
            "trees:cobble_sapling"},
	action = function(pos)
		minetest.get_node_timer(pos):start(math.random(1, 10))
	end
})


--grow coal tree

function trees.grow_coal_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/coal_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow iron tree

function trees.grow_iron_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/iron_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow copper tree

function trees.grow_copper_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/copper_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow tin tree

function trees.grow_tin_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/tin_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow gold tree

function trees.grow_gold_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/gold_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow mese tree

function trees.grow_mese_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/mese_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow diamond tree

function trees.grow_diamond_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/diamond_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow dirt tree

function trees.grow_dirt_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/dirt_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

--grow cobble tree

function trees.grow_cobble_tree(pos)
    local path = minetest.get_modpath("trees") ..
        "/schematics/cobble_tree_grown.mts"
    minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, false)
end

