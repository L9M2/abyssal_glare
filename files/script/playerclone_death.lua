function damage_received(damage, message, entity_thats_responsible, is_fatal)
	if is_fatal then
		local entity_id    = GetUpdatedEntityID()
		local x, y = EntityGetTransform( entity_id )
		EntityLoad("mods/abyssal_glare/files/entities/effects/playerclone_worlddeath.xml", x, y)

	end
end