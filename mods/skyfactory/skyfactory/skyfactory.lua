-- this code includes some code from  https://github.com/cornernote/minetest-skyblock

local filename = minetest.get_worldpath()..'/skyfactory'
local spawn_pos = {}
local start_id = 0
local start_pos = {}

function skyfactory.log(message)
    minetest.log('action', '[skyfactory] '..message)
end

function skyfactory.dump_pos(pos)
	if pos==nil then return 'nil' end
	return '{x='..pos.x..',y='..pos.x..',z='..pos.z..'}'
end

function skyfactory.get_spawn(player_name)
	local spawn = spawn_pos[player_name]
	if spawn then
		skyfactory.log('get_spawn() for '..player_name..' is '..skyfactory.dump_pos(spawn))
		return spawn
	end
	skyfactory.log('get_spawn() for '..player_name..' is unknown')
end

function skyfactory.get_spawn_player(pos)
	for player_name,spawn in pairs(spawn_pos) do
		if spawn.x == pos.x and spawn.y == pos.y and spawn.z == pos.z then
			return player_name
		end
	end
	return nil
end

function skyfactory.set_spawn(player_name, pos)
	skyfactory.log('set_spawn() for '..player_name..' at '..skyfactory.dump_pos(pos))
	spawn_pos[player_name] = pos

	local output = io.open(filename..'.spawn', 'w')
	for i, v in pairs(spawn_pos) do
		if v ~= nil then
			output:write(v.x..' '..v.y..' '..v.z..' '..i..'\n')
		end
	end
	io.close(output)
end

function skyfactory.get_new_spawn()
    start_id = start_id+1
    local file = io.open(filename..'.start_id', 'w')
    file:write(start_id)
    io.close(file)
    local spawn = start_pos[start_id]
    if spawn == nil then
        print('SPAWN ERROR - no spawn position at id' .. start_id)
    end
    return spawn
end

function skyfactory.spawn_player(player)
	local player_name = player:get_player_name()

	-- find the player spawn point
	local spawn = skyfactory.get_spawn(player_name)
	if spawn == nil then
		spawn = skyfactory.get_new_spawn()
		skyfactory.set_spawn(player_name,spawn)
	end

	-- add the start block and teleport the player
	skyfactory.spawn_new_island(spawn,player_name)
	player:set_pos({x=spawn.x+2,y=spawn.y+6,z=spawn.z+2})
	player:set_hp(20)
end

local schempath = minetest.get_modpath(minetest.get_current_modname())..'/schems'
skyfactory.schem =  minetest.settings:get('skyfactory.schem') or 'spawn_island.mts'
local path = minetest.get_modpath("skyfactory").."/schems/spawn_island.mts"
skyfactory.schem_offset_x = tonumber(minetest.settings:get('skyfactory.schem_offset_x')) or -3
skyfactory.schem_offset_y = tonumber(minetest.settings:get('skyfactory.schem_offset_y')) or -4
skyfactory.schem_offset_z = tonumber(minetest.settings:get('skyfactory.schem_offset_z')) or -3
function skyfactory.load_schem(origin, filename)
	local file,_ = io.open(schempath..'/'..filename, 'rb')
	local value = file:read('*a')
	file:close()

	local nodes = minetest.deserialize(value)
	if not nodes then return nil end

	for _,entry in ipairs(nodes) do
		local pos = {
			x=entry.x + origin.x + skyfactory.schem_offset_x,
			y=entry.y + origin.y + skyfactory.schem_offset_y,
			z=entry.z + origin.z + skyfactory.schem_offset_z,
		}
		if minetest.get_node(pos).name == 'air' then
			minetest.add_node(pos, {name=entry.name})
		end
	end
end

function skyfactory.spawn_new_island(pos)
    minetest.place_schematic(pos, path, random, nil, false)
end


skyfactory.world_width = tonumber(minetest.settings:get('skyfactory.world_width')) or 1000
skyfactory.start_gap = tonumber(minetest.settings:get('skyfactory.start_gap')) or 35
skyfactory.start_height = tonumber(minetest.settings:get('skyfactory.start_height')) or 5
skyfactory.height_difference = tonumber(minetest.settings:get('skyfactory.height_difference')) or 8


av, sn = math.abs, function(s) return s~=0 and s/av(s) or 0 end
local function sindex(y, x)
	if y == -x and y >= x then return (2*y+1)^2 end
	local l = math.max(av(y), av(x))
	return (2*l-1)^2+4*l+2*l*sn(x+y)+sn(y^2-x^2)*(l-(av(y)==l and sn(y)*x or sn(x)*y))
end
local function spiralt(side)
	local ret,_ , start, stop = {}, 0, math.floor((-side+1)/2), math.floor((side-1)/2)
	for i = 1, side do
		for j = 1, side do
			local id = side^2 - sindex(stop - i + 1,start + j - 1)
			ret[id] = {x=i,z=j}
		end
	end
	return ret
end

-- reverse ipairs
local function ripairs(t)
	local function ripairs_it(t,i)
		i=i-1
		local v=t[i]
		if v==nil then return v end
		return i,v
	end
	return ripairs_it, t, #t+1
end

-- load the spawn data from disk
local function load_spawn()
    local input = io.open(filename..'.spawn', 'r')
    if input then
        while true do
            local x = input:read('*n')
            if x == nil then
                break
            end
            local y = input:read('*n')
            local z = input:read('*n')
            local name = input:read('*l')
            spawn_pos[name:sub(2)] = {x = x, y = y, z = z}
        end
        io.close(input)
    else
        spawn_pos = {}
    end
end
load_spawn()

-- load the start positions from disk
local function load_start_positions()
    local input = io.open(filename..'.start_pos', 'r')

    -- create start_positions file if needed
    if not input then
		skyfactory.log('generate start positions')
		local output = io.open(filename..'.start_pos', 'w')
		local pos
		for i,v in ripairs(spiralt(skyfactory.world_width)) do -- get positions using spiral
			pos = {x=v.x*skyfactory.start_gap, y=math.random(skyfactory.start_height-skyfactory.height_difference, skyfactory.start_height+skyfactory.height_difference), z=v.z*skyfactory.start_gap}
			output:write(pos.x..' '..pos.y..' '..pos.z..'\n')
		end
		io.close(output)
		input = io.open(filename..'.start_pos', 'r')
	end

	-- read start positions
	skyfactory.log('read start positions')
	while true do
		local x = input:read('*n')
		if x == nil then
			break
		end
		local y = input:read('*n')
		local z = input:read('*n')
		table.insert(start_pos,{x = x, y = y, z = z})
	end
	io.close(input)
end
load_start_positions()

-- load the last start position from disk
local function load_last_start_id()
	local input = io.open(filename..'.start_id', 'r')

	-- create last_start_id file if needed
    if not input then
		local output = io.open(filename..'.start_id', 'w')
		output:write(start_id)
		io.close(output)
		input = io.open(filename..'.start_id', 'r')
	end

	-- read last start id
	start_id = input:read('*n')
	if start_id == nil then
		start_id = 0
	end
	io.close(input)

end
load_last_start_id()

skyfactory.world_bottom = tonumber(minetest.settings:get('skyfactory.world_bottom')) or -8
skyfactory.world_bottom_node = minetest.settings:get('skyfactory.world_bottom') or 'air'

minetest.register_on_respawnplayer(function(player)
	skyfactory.spawn_player(player)
	return true
end)

local spawn_throttle = 1
local function spawn_tick()
	for _,player in ipairs(minetest.get_connected_players()) do
		local pos = player:get_pos()
		-- hit the bottom
		if pos.y < skyfactory.world_bottom then
			local spawn = skyfactory.get_spawn(player:get_player_name())
				skyfactory.spawn_player(player)
		end
	end
	minetest.after(spawn_throttle, spawn_tick)
end
-- register globalstep after the server starts
minetest.after(0.1, spawn_tick)

local id_cloud = minetest.get_content_id('default:cloud')
local id_bottom = minetest.get_content_id(skyfactory.world_bottom_node)

minetest.register_on_generated(function(minp, maxp, seed)
	-- do not handle mapchunks which are too heigh or too low
	if( minp.y > 0 or maxp.y < 0) then
		return
	end

	local vm, area, data, emin, emax

	-- if no voxelmanip data was passed on, read the data here
	if not(vm) or not(area) or not(data) then
		vm, emin, emax = minetest.get_mapgen_object('voxelmanip')
		if not(vm) then
			return
		end
		area = VoxelArea:new{
			MinEdge={x=emin.x, y=emin.y, z=emin.z},
			MaxEdge={x=emax.x, y=emax.y, z=emax.z},
		}
		data = vm:get_data()
	end

	-- add cloud floor
	local cloud_y = skyfactory.world_bottom-2
	if minp.y<=cloud_y and maxp.y>=cloud_y then
		for x=minp.x,maxp.x do
			for z=minp.z,maxp.z do
				data[area:index(x,cloud_y,z)] = id_cloud
			end
		end
	end

	-- add world_bottom_node
	if skyfactory.world_bottom_node ~= 'air' then
		local y_start = math.max(cloud_y+1,minp.y)
		local y_end   = math.min(skyfactory.start_height,maxp.y)
		for x=minp.x,maxp.x do
			for z=minp.z,maxp.z do
				for y=y_start, y_end do
					data[area:index(x,y,z)] = id_bottom
				end
			end
		end
	end

	-- store the voxelmanip data
	vm:set_data(data)
	-- vm:calc_lighting(emin,emax)
	vm:write_to_map(data)
	-- vm:update_liquids()
	data = nil
end)
