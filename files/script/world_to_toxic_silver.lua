if GameHasFlagRun("PERK_PICKED_SILVER_DOLLAR") then
    ConvertEverythingToGold( "silver_radioactive", "silver_static_radioactive" )
    --I mean... why not?
    --Just a silly extra secret for completing the game with this perk.
    --Really for continuity.
else
    ConvertEverythingToGold("gold_radioactive","gold_static_radioactive")
end