if GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_SILVER_DOLLAR") then
    EntityLoad( "mods/abyssal_glare/files/entities/misc/world_toxic_silver_effect.xml", x, y )
    ConvertEverythingToGold( "silver_radioactive", "silver_static_radioactive" )
    --I mean... why not?
    --Just a silly extra secret for completing the game with this perk.
    --Really for continuity.
elseif GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_THE_SHARD") then
    print("THE CYCLE MUST BE BROKEN")
	GamePrintImportant( "You've completed the Work...", "...but at what cost?" )
    EntityLoad( "mods/abyssal_glare/files/entities/effects/playerclone_worlddeath.xml", x, y )
else
    ConvertEverythingToGold("gold_radioactive","gold_static_radioactive")
end