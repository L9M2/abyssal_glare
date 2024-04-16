if GameHasFlagRun("PERK_PICKED_SILVER_DOLLAR") then
    --More like CovertEverythingToSilver
    print("Converting to Silver")
    ConvertEverythingToGold( "silver", "silver_static" )
    --I mean... why not?
    --Just a silly extra secret for completing the game with this perk.
    
    --Really for continuity.
else
    print("Converting to Gold")
    ConvertEverythingToGold()
end