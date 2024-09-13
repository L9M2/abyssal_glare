dofile_once("mods/abyssal_glare/files/script/enums.lua")
dofile_once("mods/abyssal_glare/files/script/util.lua")
dofile_once("data/scripts/lib/utilities.lua")

	--local entity_id    = GetUpdatedEntityID()
	--GamePrintImportant("The clone has parished!")
	--EntityKill( player )
	--GameTriggerGameOver()
	GameScreenshake( 500 )

	local playerunit = EntityGetWithTag("player_unit")[1]
	--local playerclone = EntityGetWithTag("player_clone")[1]

if playerunit then
	--print("test passed")
	local x, y = EntityGetTransform( playerunit )
	GamePlaySound( "data/audio/Desktop/misc.bank", "misc/beam_from_sky_hit", x, y )
	--To really emphisize how badly the player screwed up.
	--Despite hte function name. This just changes the 'dynamic' and 'static' materials to whatever is defined, but if not, it's gold.
	--ConvertEverythingToGold( "abyssal_glare_abyssal_void", "abyssal_glare_dense_abyssal_crystal" )
	ConvertEverythingToGold( "abyssal_glare_abyssal_sand", "abyssal_glare_dense_abyssal_crystal" )


	if not GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_THE_SHARD") then
	local tabletitle = {
	'A terrible fate...',
	'A puppet falls...',
	'The world is doomed...',
	'The abyssal void consumes...',
	'Darkness approaches...',
	}
	local tablesub = {
	'The puppet suffers through a doomed world.\nUntil the cosmic button is clicked.',
	'Abyssal Glares watch in silence as fate of the world is sealed.',
	'A flicker in the cosmic code.\nThe world is now doomed.',
	'Another dance with the cosmic delete button.\nHow quaint.',
	'A way to create a paradox?\nThere was two, but now one.\nStuck in a doomed world.',
	'Perhaps there is a way.\nA way to sever the connection of the puppet.\nThis was not one of them.',
	'A message and brew lost, yet maybe a key is yet to be.\nThrice is a theme in this game of three.',
	'Not of one or a duo in this world,\nbut of a world made of three for thee.',
	'A friend to share the strings with.\nThough not anymore for the puppet.\nStuck in an endless torment.',
	'The puppet is alone once more,\nat a cost of the cosmic code.\nThe great reset approaches again.',
	'To truely win is to die,\nbut if you cannot die then did you win?\nDeath is inevitable once the button is pushed.',
	'Void runs thick through matter,\nyet some resist it and push back.\nNo escape from this world.',
	'There is no turning back.\nThe world is now doomed.',
	'With their death, the thread of prophecy is severed.\nRestore the weave of fate,\nor persist in the doomed world you have created.'}
	local randsub= tablesub[math.random(#tablesub)]
	local randtitle= tabletitle[math.random(#tabletitle)]
		GamePrintImportant(randtitle, randsub, "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
	end

	if not GameHasFlagRun("abyssal_glare_worlddeath_initialized") then
		GameAddFlagRun("abyssal_glare_worlddeath_initialized")
	end
end
