--What fate, a Noita.
GameEmitRainParticles(500, 1024,"abyssal_glare_deadly_water",200, 220, 400,true,true)

local world_state = EntityGetFirstComponent( GameGetWorldStateEntity(), "WorldStateComponent" )
ComponentSetValue2( world_state, "time_dt", 2 )
--local test1 = ComponentGetValue2(world_state,"rain")
--local test2 = ComponentGetValue2(world_state,"rain_target")
local currentTime = ComponentGetValue2(world_state,"time") * 1000
local amplitude = 50
local period = 30
local updatesPerSecond = 60

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

