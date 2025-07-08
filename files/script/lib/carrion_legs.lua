dofile_once("data/scripts/lib/utilities.lua")

------- CONFIG------
local num_limbs = 5
local angle_spread = 220
local cast_length = 200
local move_speed = 5
local resting_length = 20
--------------------

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local last_x = GetValueNumber("last_x", x)
local last_y = GetValueNumber("last_y", y)
local vx, vy = x - last_x, y - last_y
local last_direction = GetValueNumber("last_direction", 0)
local direction = math.atan2(vy, vx)
if math.abs(vx) + math.abs(vy) > 0.1 then
  direction = rot_lerp(direction, last_direction, 0.05)
else
  direction = last_direction
end
SetValueNumber("last_direction", direction)
SetValueNumber("last_x", x)
SetValueNumber("last_y", y)
SetRandomSeed(x + entity_id, y)

if not GetValueBool("initialized", false) then
  SetValueBool("initialized", true)
  for i=1, num_limbs do
    local ent = EntityLoad("data/entities/verlet_chains/vines/verlet_vine_pixelscene.xml")
    EntityAddComponent2(ent, "VerletWorldJointComponent")
    EntitySetName(ent, "tentacle_limb")
    SetValueNumber("jiggle_speed_"..tostring(i), Randomf(1, 3))
    EntityAddChild(entity_id, ent)
  end
end

local i = 0
for _, child in ipairs(EntityGetAllChildren(entity_id)) do
  if EntityGetName(child) ~= "tentacle_limb" then goto continue end
  i = i + 1
  -- The limb's current position
  local x2, y2 = GetValueNumber("x_"..tostring(i), x), GetValueNumber("y_"..tostring(i), y)
  -- The position it's currently moving towards
  local target_x, target_y = GetValueNumber("target_x_"..tostring(i), x), GetValueNumber("target_y_"..tostring(i), y)
  local anchor_found = GetValueBool("anchor_found_"..tostring(i), false)
  local cast_direction_x, cast_direction_y = vec_rotate(math.cos(direction), math.sin(direction), math.rad(-angle_spread/2 + (i-1) * angle_spread / (num_limbs-1)))
  local move_x, move_y = vec_normalize(target_x - x2, target_y - y2)
  x2 = x2 + move_x * move_speed
  y2 = y2 + move_y * move_speed
  if math.abs(x2 - target_x) < 5 then
    x2 = target_x
  end
  if math.abs(y2 - target_y) < 5 then
    y2 = target_y
  end

  if not anchor_found then
    SetValueNumber("target_x_"..tostring(i), x + cast_direction_x * resting_length)
    SetValueNumber("target_y_"..tostring(i), y + cast_direction_y * resting_length)
  end

  -- Only do the raytracing stuff every x frames because it's probably expensive
  if GameGetFrameNum() % 20 == 0 then
    -- Check if there's still a pixel to hold on to
    local pixel_found = GetSurfaceNormal(target_x, target_y, 2, 16)
    if not pixel_found then
      anchor_found = false
    end
    -- target_hit checks if there's an obstacle between the main body and target
    local target_hit, target_hit_x, target_hit_y = RaytraceSurfaces(x, y, target_x - cast_direction_x * 2, target_y - cast_direction_y * 2)
    local distance_to_target = get_distance(x, y, target_x, target_y)
  
    -- Check if anchor is still in sight and range
    if not anchor_found or target_hit or (anchor_found and distance_to_target > cast_length) then
      -- Lost sight of anchor or anchor too far away, look for new anchor
      local hit, hit_x, hit_y = RaytraceSurfaces(x, y, x + cast_direction_x * cast_length, y + cast_direction_y * cast_length)
      if hit then
        -- Found new anchor, set target to it
        SetValueNumber("target_x_"..tostring(i), hit_x)
        SetValueNumber("target_y_"..tostring(i), hit_y)
        SetValueBool("anchor_found_"..tostring(i), true)
      else
        SetValueBool("anchor_found_"..tostring(i), false)
      end
    end
  end

  SetValueNumber("x_"..tostring(i), x2)
  SetValueNumber("y_"..tostring(i), y2)

  local verlet_component = EntityGetFirstComponentIncludingDisabled(child, "VerletPhysicsComponent")
  local verlet_world_joint_component = EntityGetFirstComponentIncludingDisabled(child, "VerletWorldJointComponent")
  local positions = ComponentGetValue2(verlet_component, "positions")
  local add_wave = anchor_found and 0 or 3
  local jiggle_speed = GetValueNumber("jiggle_speed_"..tostring(i), 1)
  positions[27] = x2 + math.cos(GameGetFrameNum() * 0.02 + jiggle_speed) * add_wave
  positions[28] = y2 + math.sin(GameGetFrameNum() * 0.05 + jiggle_speed) * add_wave
  ComponentSetValue2(verlet_component, "positions", positions)
  -- world_position is the origin of the verlet
  ComponentSetValue2(verlet_world_joint_component, "world_position", x, y)
  ::continue::
end