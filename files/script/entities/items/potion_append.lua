--We gotta add these to the potion materials list so that they can spawn somewhat commonly.
--This is separate from the random material potion spawn, which is truely random.
--TODO: What does cost do? It isn't referenced in the original file. Probability of it being picked?
--Asked on the Noita Discord. It's unused. So it doesn't have a point, but let use it to guage how 'good' it even if it has not point lol.
table.insert(materials_magic,     {
    material="abyssal_glare_magic_liquid_sorrowflux",
    cost=500,
});

table.insert(materials_magic,     {
    material="abyssal_glare_magic_liquid_joylixir",
    cost=500,
});

table.insert(materials_magic,     {
    material="abyssal_glare_magic_liquid_anxiphasea",
    cost=600,
});

table.insert(materials_standard,     {
    material="abyssal_glare_sweet_water",
    cost=225,
});


table.insert(materials_standard,     {
    material="abyssal_glare_ice_cream_liquid",
    cost=225,
});