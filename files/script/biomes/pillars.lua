-- default biome functions that get called if we can't find a a specific biome that works for us
CHEST_LEVEL = 0
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff0a0911, "spawn_pillars" )

local debug_mode = DebugGetIsDevBuild()
------------ SMALL ENEMIES ----------------------------------------------------

------------ MISC --------------------------------------

-- actual functions that get called from the wang generator




function spawn_small_enemies(x, y)
    return
end

function spawn_big_enemies(x, y)
    return
end

function spawn_items(x, y)
	return
end

function spawn_unique_enemy(x, y)
end

function spawn_lamp(x, y)
end

function spawn_props(x, y)
	return
end

function spawn_potions( x, y ) end


--function spawn_book( x, y ) 
--	EntityLoad( "data/entities/items/books/book_tree.xml", x, y )
--end
function init( x, y, w, h )
	LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars.png", "mods/abyssal_glare/files/biome_impl/pillars_visual.png", x, y, "mods/abyssal_glare/files/biome_impl/pillars_bg.png", true )
end


function spawn_pillars( x, y )


    dofile_once("mods/abyssal_glare/files/script/entities/items/fate_card_list.lua")
    spawn_random_fate_card(x,y)


	local count = 5 --Total number of pillars
	local width = 500 --How much the pillars span.
	local inc = width / count
	local size = 96 --How large our image is
	
	local under = 1
	local above = 0
	--First value is flag, second is pillar name
	SetRandomSeed( x, y )
	local flags = 
	{
		{ { "test", "nightmare"},{ "test", "playerclone" }, { "test", "silverdollar" }, { "test", "silverdollar_top_b" }, { "test", "silverdollar_top" }, {"test", "death"}},
        { },
        { },
        { { "test","fatecard"}},
        { { "test", "kolmikarmicrain"}},
    }
	
	for i=1,count do
		local px = x - (count) * inc * 0.5 + (i-1) * inc
		local py = y
		
		for j=1,under do
			LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/pillar_part.png", true )
			py = py + size
		end
		
		LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_fade.png", true )
		
		local data = flags[i] or {}
		--I"m curious to know what this is for. Unused?
		local total = above + #data
		
		py = y
		
		for j=1,above do
			py = py - size
			LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/pillar_part.png", true )
		end
		
		for j,v in ipairs(data) do
			local valid = HasFlagPersistent( table.concat({"abyssal_glare_unlocked_",v[1]}) ) or debug_mode
			
			--print( "Checked for " .. tostring(table.concat({"abyssal_glare_unlocked_",v[1]})) .. ", result: " .. tostring(valid) )
			
			if valid then
				py = py - size
				LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_" .. v[2] .. ".png", true )
			end
		end
		
		py = py - size
		--local opts = { "pillar_end_01", "pillar_end_03", "pillar_end_06", "pillar_end_02", "pillar_end_05", "pillar_end_04", }
		--local opt = ((i-1) % #opts) + 1
		
		--LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/" .. opts[opt] .. ".png", true )
		LoadPixelScene( "mods/abyssal_glare/files/biome_impl/pillars/pillar_part_material.png", "", px, py, "mods/abyssal_glare/files/biome_impl/pillars/pillar_end_01.png", true )
	end
end