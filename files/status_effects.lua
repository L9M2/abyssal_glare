---Special Effects!
--You have met with a horrible fate have you?
---M:Once a puppet always a puppet.
table.insert(status_effects,     {
    id="ABYSSAL_GLARE_HORRIBLE_FATE",
    ui_name="$abyssal_glare_perk_worlddeath",
    ui_description="$abyssal_glare_perkdesc_worlddeath",
    ui_icon="",
    effect_permanent=true,
    effect_entity="mods/abyssal_glare/files/status_effects/horrible_fate.xml",
});
--If you ever want to add this as a stain or status effect to a material use the ID as the effect.
--effect_entity to create a glowing effect around the affected entity.
table.insert(status_effects,     {
    id="ABYSSAL_GLARE_HAPPY",
    ui_name="$abyssal_glare_status_happy",
    ui_description="$abyssal_glare_status_desc_happy",
    ui_icon="mods/abyssal_glare/files/ui_gfx/status_effects/happy.png",
    effect_entity="mods/abyssal_glare/files/status_effects/happy.xml",
});
--effect_entity="data/entities/animals/boss_pit/boss_pit_spawner.xml",
--TODO: Add effect_entity to create tears from the affected entity
table.insert(status_effects,     {
    id="ABYSSAL_GLARE_SAD",
    ui_name="$abyssal_glare_status_sad",
    ui_description="$abyssal_glare_status_desc_sad",
    ui_icon="mods/abyssal_glare/files/ui_gfx/status_effects/sad.png",
    effect_entity="mods/abyssal_glare/files/status_effects/sad.xml",
    is_harmful="true"
});

table.insert(status_effects,     {
    id="ABYSSAL_GLARE_ANXIETY",
    ui_name="$abyssal_glare_status_anxiety",
    ui_description="$abyssal_glare_status_desc_anxiety",
    ui_icon="mods/abyssal_glare/files/ui_gfx/status_effects/anxiety.png",
    effect_entity="mods/abyssal_glare/files/status_effects/anxiety.xml",
    is_harmful="true"
});

table.insert(status_effects,     {
    id="ABYSSAL_GLARE_TWITCHY",
    ui_name="$status_twitchy",
    ui_description="$statusdesc_twitchy",
    ui_icon="data/ui_gfx/status_indicators/twitchy.png",
    effect_entity="mods/abyssal_glare/files/status_effects/twitchy.xml",
    is_harmful="true"
});
