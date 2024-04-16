dofile_once( "data/scripts/game_helpers.lua" )
local player_id = EntityGetRootEntity( GetUpdatedEntityID() )
--Made it proportional to max HP and have it heal 2%

local damagemodels = EntityGetComponent( player_id, "DamageModelComponent" )
if( damagemodels ~= nil ) then
    for i,damagemodel in ipairs(damagemodels) do
    local percentage = tonumber( ComponentGetValue2( damagemodel, "max_hp" ) ) * 0.02
    heal = percentage
    --heal = heal / 25
    heal_entity( player_id, heal )
    end
end