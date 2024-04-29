local entity = EntityGetWithName("$abyssal_glare_npc_dg_name")
local x,y = EntityGetTransform(entity)
local playerunit = EntityGetWithTag("player_unit")[1]
local playerclone = EntityGetWithTag("player_clone")[1]

local w, z = EntityGetTransform( playerunit )
if playerclone == nil and playerunit then
    local dx = w - x
    local dy = z - y
    local distance = math.sqrt(dx * dx + dy * dy)
    if distance >= 201 then
        local directionX = dx / distance
        local directionY = dy / distance
        x = w - directionX * 200
        y = z - directionY * 200
    else
        local moveX = (dx / distance) * 3
        local moveY = (dy / distance) * 3
        x = x + moveX
        y = y + moveY
    end

    EntitySetTransform(entity,x,y)

end
