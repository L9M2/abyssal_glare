dofile_once("data/scripts/lib/utilities.lua")


local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local comp = get_variable_storage_component(entity_id, "overcast_weather")
local overcast = ComponentGetValue2(comp, "value_int")

if overcast == 0 then
    GameEmitRainParticles(10, 1024,"water_fading",200, 220, 400,true,true)
elseif overcast == 1 then
    GameEmitRainParticles(20, 1024,"lava",200, 220, 700,false,true)
elseif overcast == 2 then
    GameEmitRainParticles(10, 1024,"blood",200, 220, 400,true,true)
elseif overcast == 3 then
    GameEmitRainParticles(5, 1024,"monster_powder_test",200, 220, 40,false,false)
elseif overcast == 4 then
    GameEmitRainParticles(20, 1024,"urine",200, 220, 400,true,true)
elseif overcast == 5 then
    GameEmitRainParticles(500, 1024,"abyssal_glare_deadly_water",200, 220, 400,true,true)
else

end










local world_state = EntityGetFirstComponent( GameGetWorldStateEntity(), "WorldStateComponent" )
--ComponentSetValue2( world_state, "time_dt", 2 )
local currentTime = ComponentGetValue2(world_state,"time") * 1000
local amplitude = 50
local period = 30
-- Function to calculate the oscillating value
local function oscillateValue()
    local angle = (2 * math.pi * currentTime) / period
    local sineValue = math.sin(angle)
    local sine = amplitude * sineValue
    return sine
end

local currentValue = oscillateValue()
--print(currentValue)
ComponentSetValue2(world_state,"wind_speed", currentValue)
ComponentSetValue2(world_state,"rain", 10)
ComponentSetValue2(world_state,"rain_target", 10)
ComponentSetValue2(world_state,"fog", 0.8)
ComponentSetValue2(world_state,"fog_target", 0.8)

