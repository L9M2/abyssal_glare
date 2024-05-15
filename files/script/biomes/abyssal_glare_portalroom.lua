CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biome_scripts.lua")
dofile_once("data/scripts/lib/utilities.lua")
dofile( "data/scripts/biomes/orbrooms/orbroom_shared.lua" )
--Using the same concept here.

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff8530cd, "spawn_portal" )

function spawn_small_enemies( x, y ) end
function spawn_big_enemies( x, y ) end
function spawn_items( x, y ) end
function spawn_props( x, y ) end
function spawn_props2( x, y ) end
function spawn_props3( x, y ) end
function spawn_lamp( x, y ) end
function load_pixel_scene( x, y ) end
function load_pixel_scene2( x, y ) end
function spawn_unique_enemy( x, y ) end
function spawn_unique_enemy2( x, y ) end
function spawn_unique_enemy3( x, y ) end
function spawn_ghostlamp( x, y ) end
function spawn_candles( x, y ) end
function spawn_potions( x, y ) end
function spawn_wands( x, y ) end
--Room materials, Foreground, Background
function init( x, y, w, h )
	LoadPixelScene( "mods/abyssal_glare/files/biome_impl/abyssal_glare_portalroom.png", "mods/abyssal_glare/files/biome_impl/abyssal_glare_portalroom_visual.png", x, y, "mods/abyssal_glare/files/biome_impl/abyssal_glare_portalroom_background.png", true )
end

function spawn_orb(x, y)
end

function spawn_portal(x, y)
	--EntityLoad( "data/entities/items/pickup/essence_air.xml", x, y )
	spawn_material_checker( x - 198, y - 11, "void_liquid", "data/scripts/biomes/orbrooms/orbroom_shared.lua", "mods/abyssal_glare/files/entities/portal_abyssal_glare.xml", x, y+32)
	--spawn_material_checker( x - 198, y - 11, "abyssal_glare_abyssal_sand", "data/scripts/biomes/orbrooms/orbroom_shared.lua", "mods/abyssal_glare/files/entities/portal_abyssal_glare.xml", x, y+32)
	
	--EntityLoad("mods/abyssal_glare/files/entities/portal_abyssal_glare.xml", x, y+32)
	spawn_material_checker( x + 198, y - 11, "gold", "data/scripts/biomes/orbrooms/orbroom_shared.lua", "mods/abyssal_glare/files/particles/image_emitters/glyphs/09_09.xml", x, y - 125 )
	--EntityLoad("mods/abyssal_glare/files/entities/portal_abyssal_glare.xml", 0, 0)
end