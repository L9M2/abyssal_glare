dofile_once("mods/abyssal_glare/files/script/enums.lua")
dofile_once("mods/abyssal_glare/files/script/util.lua")
dofile_once("data/scripts/lib/utilities.lua")

	--local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( player )
	--GamePrintImportant("The clone has parished!")
	--GamePlaySound( "data/audio/Desktop/misc.bank", "misc/beam_from_sky_hit", pos_x, pos_y )
	--EntityKill( player )
	--GameTriggerGameOver()
	GameScreenshake( 20 )

	local playerunit = EntityGetWithTag("player_unit")[1]
	--local playerclone = EntityGetWithTag("player_clone")[1]
if playerunit then
	
	print("test passed")
	local x, y = EntityGetTransform( playerunit )
	EntityLoad("mods/abyssal_glare/files/entities/effects/playerclone_worlddeath_notfatal.xml", x, y)
	--This plays, but throws an error? Idk man. It's not a consistent error either. Might be some sort of Engine jank with FMOD.
	GamePlaySound("data/audio/Desktop/Master Bank.bank", "event_cues/midas/create" , x, y)

	if not GameHasFlagRun("abyssal_glare_worlddeath_initialized") then
		GameAddFlagRun("abyssal_glare_worlddeath_initialized")
	end
end
