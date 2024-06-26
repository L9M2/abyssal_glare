do 
	local perk_list = {
	"PERKS_LOTTERY",
	"EXTRA_HP",
	"RESPAWN",
	"ALWAYS_CAST",
	"EXTRA_MANA",
	"FASTER_WANDS",
	"EXTRA_SLOTS",
	"MEGA_BEAM_STONE",
	"EXTRA_PERK",
	
	}

	dofile_once("data/scripts/perks/perk.lua")
	dofile_once("mods/abyssal_glare/files/script/entities/items/fate_card_list.lua")
	
	local old = init
	init = function ( x, y, w, h )
	old(x,y,w,h)
	
		LoadPixelScene( "mods/abyssal_glare/files/biome_impl/abyssal_glare_mountain_alt_extra.png", "mods/abyssal_glare/files/biome_impl/abyssal_glare_mountain_alt_extra_visual.png", x+384-512, y+320-64, "mods/abyssal_glare/files/biome_impl/abyssal_glare_mountain_alt_extra_background.png", true )
		SetRandomSeed(x,y)
		local randperk = perk_list[Random(1,#perk_list)]
		local randperk2 = perk_list[Random(1,#perk_list)]
		--spawn_random_fate_card(x+480-512, y+420)
		spawn_random_fate_card(x+692+80-512, y+345)
		perk_spawn(x+692-512, y+345, randperk)
		if x <= 10000 and x >= -10000 and not ModIsEnabled("nightmare") then
			perk_spawn(x+692+40-512, y+345, "EDIT_WANDS_EVERYWHERE")
			EntityLoad("mods/abyssal_glare/files/entities/items/books/book_mystery_00.xml", x+692+40-726, y+345)
		else
			perk_spawn(x+692+40-512, y+345, randperk2)
		end
	--print("Mountain Hall scene loaded.")
	end	
end