--local entitynug = Entity
local entities = EntityGetWithTag("gold_nugget")
for i,entity in ipairs(entities) do
    EntityKill(entity)
end