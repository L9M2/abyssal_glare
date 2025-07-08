local function force_override(entity_id)
    local sprite_comps = EntityGetComponentIncludingDisabled(entity_id, "SpriteComponent") or {}

    for _, comp in ipairs(sprite_comps) do
        local image = ComponentGetValue2(comp, "image_file") or ""
        if image == "data/enemies_gfx/player_lukky.xml" then
            ComponentSetValue2(comp, "image_file", "mods/abyssal_glare/files/enemies_gfx/player_vessel_lukky.xml")
            ComponentSetValue2(comp, "offset_x", 6)
            ComponentSetValue2(comp, "offset_y", 14)
            ComponentSetValue2(comp, "z_index", 0.6)
            ComponentSetValue2(comp, "alpha", 1.0)
            -- Optional: visually flag override
            ComponentSetValue2(comp, "visible", true)
            print("ABYSSAL_GLARE: FORCE LUKKI SPRITE OVERRIDE")
        end
    end

    -- Recurse children just in case
    local children = EntityGetAllChildren(entity_id) or {}
    for _, child in ipairs(children) do
        force_override(child)
    end
end

-- Do this on the player
local player = EntityGetWithTag("player_unit")[1]
if player then
    force_override(player)
end
