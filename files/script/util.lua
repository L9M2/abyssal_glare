dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/abyssal_glare/files/script/enums.lua")



--I'll add some stuff here when it's needed.

function get_spawn_position(world)
  world = world or GlobalsGet(WORLD_CURRENT)
	if world == WORLD_NOITA then
		return NOITA_SPAWN_X, NOITA_SPAWN_Y
	elseif world == WORLD_ABYSSAL_GLARE then
		return ABYSSAL_GLARE_SPAWN_X, ABYSSAL_GLARE_SPAWN_Y
	end
end


function get_player()
  player = get_players()
  if player ~= nil then
  -- There's unused code for CO-OP. So we need to specify player 1 still.
  -- Should I add use cases for Player 2?
  --- M: I can only imagine two Seekers with their own Puppets...
  --- Ø: Just more to play with.
  
	return player[1]
	--if player[1] then
	--	return player[1]
	--else
	--  return player[2]
	--end
  end
  -- Player is not alive. They are dead. Very dead. Noita'd, Dooped, and Possibly Bamboozled.
  return nil
end


function GlobalsToggleBool(key, default)
  GlobalsSetValue(key, toggle_global(GlobalsGetBool(key, default)))
end

function toggle_global(value)
  if value == "0" or not value then
    return "1"
  end
  return "0"
end

function GlobalsGet(key, default)
  default = default or tostring(DEFAULTS[key])

  local value = GlobalsGetValue(key, default)
  if value == GLOBAL_UNDEFINED then
    return nil
  end
  return value
end

function GlobalsGetBool(key, default)
  return GlobalsGet(key, default) == "1"
end

function EntitySetValue(entity, component_name, attr_name, value)
  if entity == nil or entity == 0 then return end

  return ComponentSetValue2(
    EntityGetFirstComponentIncludingDisabled(entity, component_name), attr_name, value
  )
end

function get_spawn_position()
--used to be more complex, but ehhh. Simply simplify!
    return NOITA_SPAWN_X, NOITA_SPAWN_Y
  end

--Good in general, but helpful for returning to spawn.
function teleport_player(x, y)
  local player = get_player()
  if not player then
    return
  end
  EntitySetTransform(player, x, y)
end

function printTable(tbl, indent)
  indent = indent or 0
  local indentStr = string.rep("  ", indent)
  
  for key, value in pairs(tbl) do
      if type(value) == "table" then
          print(indentStr .. tostring(key) .. ":")
          printTable(value, indent + 1)
      else
          print(indentStr .. tostring(key) .. ": " .. tostring(value))
      end
  end
end