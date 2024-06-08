-- default biome functions that get called if we can't find a a specific biome that works for us
-- The level of action ids that are spawned from the chests
CHEST_LEVEL = 1
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/biome_modifiers.lua")
dofile( "data/scripts/items/generate_shop_item.lua" )


g_small_enemies =
{
	total_prob = 0,
	-- this is air, so nothing spawns at 0.6
	{
		prob   		= 0.1,
		min_count	= 0,
		max_count	= 0,    
		entity 	= ""
	},
	-- add skullflys after this step
	{
		prob   		= 0.5,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "mods/abyssal_glare/files/entities/npc/ag/skyshimmer.xml"
	},
}



function spawn_small_enemies(x, y)

	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y)
    --skipped
end

function spawn_lamp(x, y)
	--spawn(g_lamp,x,y,0,0)
end

function spawn_ghostlamp(x, y)
	--spawn2(g_ghostlamp,x,y,0,0)
end

function spawn_props(x, y)
	--spawn(g_props,x,y-3,0,0)
end

function spawn_props2(x, y)
	--spawn(g_props2,x,y-3,0,0)
end

function spawn_props3(x, y)
	--spawn(g_props3,x,y,0,0)
end

function spawn_unique_enemy(x, y)
	--spawn(g_unique_enemy,x,y)
end

function spawn_unique_enemy2(x, y)
	--spawn(g_unique_enemy2,x,y)
end

function spawn_unique_enemy3(x, y)
	--spawn(g_unique_enemy3,x,y)
end

function spawn_fungi(x, y)
	--spawn(g_fungi,x,y)
end

function load_pixel_scene( x, y )
end

function load_pixel_scene2( x, y )
end


function spawn_stash(x,y)
end
