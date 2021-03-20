skyfactory = {}

minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname='singlenode', water_level=-32000})
end)

local modpath = minetest.get_modpath('skyfactory')
dofile(modpath.."/skyfactory.lua")

minetest.register_on_newplayer(function(player)
	skyfactory.spawn_player(player)
    local player = "test30"
    local privs = minetest.get_player_privs(player)
    privs.fly = true
    minetest.set_player_privs(player, privs)
end)