dofile_once("data/scripts/newgame_plus.lua")

dofile_once("mods/abyssal_glare/files/script/util.lua")
function collision_trigger(entity)

  --Position player
  --31/01/2024 Conga: This should kill momentum and make the NG+ script happy, can set x,y to whatever you need
  --For example, to make the player be centered on the portal's position in the new world:
  --local x,y = EntityGetTransform(GetUpdatedEntityID())
  --EntitySetTransform(v,x,y)
  --I.E. Kills hte momentum for a single frame so the world loads correctly.
  --Yeah, the game is THAT strict with it.
  local players = EntityGetWithTag("player_unit")
	for k=1,#players
	do local v = players[k]
		EntitySetTransform(v,240,-100)
	end

  --do_newgame_plus()
  BiomeMapLoad_KeepPlayer("mods/abyssal_glare/files/script/biome_map.lua","mods/abyssal_glare/files/overrides/_pixel_scenes.xml")
  SessionNumbersSave()

  --Kill the portal
  EntityKill(GetUpdatedEntityID())
end


--BiomeMapLoad_KeepPlayer("mods/abyssal_glare/files/script/biome_map.lua","mods/abyssal_glare/files/overrides/_pixel_scenes.xml")