print("ABYSSAL_GLARE: PLAYER HAX")
function replace_sprite_recursive(entity_id)
  local sprite_comps = EntityGetComponent(entity_id, "SpriteComponent") or {}

  for _, comp in ipairs(sprite_comps) do
    local image = ComponentGetValue2(comp, "image_file") or ""
    if image == "data/enemies_gfx/player.xml" then
      ComponentSetValue2(comp, "image_file", "mods/abyssal_glare/files/enemies_gfx/player_vessel.xml")
      ComponentSetValue2(comp, "offset_x", 6)
      ComponentSetValue2(comp, "offset_y", 14)
      ComponentSetValue2(comp, "z_index", 0.6)
      ComponentSetValue2(comp, "alpha", 1.0)
      print("ABYSSAL_GLARE: PLAYER BASE HAXXED")
    elseif image == "data/enemies_gfx/player_lukky.xml" then
      ComponentSetValue2(comp, "image_file", "mods/abyssal_glare/files/enemies_gfx/player_vessel_lukky.xml")
      ComponentSetValue2(comp, "offset_x", 6)
      ComponentSetValue2(comp, "offset_y", 14)
      ComponentSetValue2(comp, "z_index", 0.6)
      ComponentSetValue2(comp, "alpha", 1.0)
      print("ABYSSAL_GLARE: PLAYER LUKKI HAXXED")
    elseif image == "data/enemies_gfx/player_arm.xml" then
      ComponentSetValue2(comp, "image_file", "mods/abyssal_glare/files/enemies_gfx/player_vessel_arm.xml")
      ComponentSetValue2(comp, "z_index", 0.59)
      ComponentSetValue2(comp, "alpha", 1.0)
      print("ABYSSAL_GLARE: PLAYER ARM HAXXED")
    end
  end

  -- Recurse into children
  local children = EntityGetAllChildren(entity_id) or {}
  for _, child in ipairs(children) do
    replace_sprite_recursive(child)
  end
end

-- Run the recursive sprite override
local player = EntityGetWithTag("player_unit")[1]
if player then
  replace_sprite_recursive(player)
end


	print("ABYSSAL_GLARE: PLAYER HAX DONE")