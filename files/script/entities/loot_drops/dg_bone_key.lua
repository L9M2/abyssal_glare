local entity = EntityGetWithName("$abyssal_glare_npc_dg_name")
local x,y = EntityGetTransform(entity)
local playerunit = EntityGetWithTag("player_unit")[1]
local drop_items = true
local defeated = "Dungeon Guardian has been defeated!"
function death( drop_items, defeated , playerunit, drop_items )

	EntityLoad("mods/abyssal_glare/files/entities/items/pickups/bone_key.xml", x, y)
	GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "enemies/dg/death", x, y)
	GamePrint("Dungeon Guardian has been defeated!")
end