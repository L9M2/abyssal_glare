-- Assuming you have defined your custom game effect via appending it to data/scripts/status_effects/status_list.lua

-- _horscht helped out with the idea of adding the status effect to the player with code.
dofile_once("data/scripts/status_effects/status_list.lua")

--- Give player status effect defined by status_list.lua
---<br>entity_id can be anything, but generally is the player.
---<br>Lifetime = -1 for permanant. Time is in ticks. 60 ticks per second.
---<br>dont_display_timer if true makes it like a perk and not display a timer next to it.
---@param entity_id entity_id
---@param game_effect_id string
---@param ui_name string
---@param ui_desc string
---@param ui_icon string
---@param lifetime number
---@param display_above_head boolean
---@param dont_display_timer boolean
---@param display_in_hud boolean
function apply_custom_game_effect(entity_id, game_effect_id,ui_name,ui_desc,ui_icon, lifetime, display_above_head,dont_display_timer,display_in_hud)
  local status
  for i, v in ipairs(status_effects) do
    if v.id == game_effect_id then
      status = v
      break
    end
  end
  local effect_entity = LoadGameEffectEntityTo(entity_id, status.effect_entity)
  EntityAddComponent2(effect_entity, "LifetimeComponent", { lifetime = lifetime })
  local game_effect_comp = EntityGetFirstComponentIncludingDisabled(effect_entity, "GameEffectComponent")
  if game_effect_comp then
    ComponentSetValue2(game_effect_comp, "frames", lifetime)
  end
  EntityAddComponent2(effect_entity, "UIIconComponent", {
    name = "$abyssal_glare_status_"..ui_name,
    description = "$abyssal_glare_status_desc_"..ui_name,
    icon_sprite_file = "mods/abyssal_glare/files/ui_gfx/status_effects/"..ui_icon..".png",
    display_above_head = display_above_head,
    display_in_hud = display_in_hud,
    is_perk = dont_display_timer,
  })
  --Rework this to replace the tag with something else.
  local tag = game_effect_id
  EntityAddTag(effect_entity, tag)
end

function remove_custom_game_effect(game_effect_id)

    
    --local effect_entity = LoadGameEffectEntityTo(entity_id, status.effect_entity)
    local tag = game_effect_id
    effect_entity = EntityGetWithTag(tag)
    EntityKill(effect_entity[1])
    --print("ABYSSAL GLARE:"..effect_entity.."Removed Status Effect")
end
--- Here's how to use that function:
--local player = EntityGetWithTag("player_unit")[1]
--apply_custom_game_effect(player, "ABYSSAL_GLARE_HORRIBLE_FATE", 600,true,true,true)