if GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_SILVER_DOLLAR") then
    --More like CovertEverythingToSilver
    print("Converting to Silver")
    EntityLoad( "mods/abyssal_glare/files/entities/misc/world_silver_effect.xml", x, y )
    ConvertEverythingToGold( "silver", "silver_static" )
    --I mean... why not?
    --Just a silly extra secret for completing the game with this perk.
elseif GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_THE_SHARD") then
	GamePrintImportant( "You've completed the work...", "...but at what cost?" )
    EntityLoad( "mods/abyssal_glare/files/entities/effects/playerclone_worlddeath.xml", x, y )
else
    print("Converting to Gold")
    ConvertEverythingToGold()
end