dofile( "data/scripts/game_helpers.lua" )
dofile( "mods/abyssal_glare/files/script/entities/items/fate_card_effects.lua" )
function item_pickup( entity_item, entity_who_picked, name )
	local x, y = EntityGetTransform( entity_item )
	local entity_id = GetUpdatedEntityID()
	local this_item = EntityGetName(entity_id)
	--local card = EntityGetInRadiusWithTag( x, y, 0, "abyssal_glare_fate_card" )
	fate_card_effect(entity_item,entity_who_picked,name)
	
	EntityKill( entity_id )
end
