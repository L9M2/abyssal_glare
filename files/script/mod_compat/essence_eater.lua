
do
    local old_death = death
    death = function() 
        old_death()  -- Calls the original death function
        abyssal_glare_append_death()  -- Calls my code
    end
end

function abyssal_glare_append_death()
    --[[
        So in a nutshell this just does what the original "away" script does.
        This is could technically be extended to do multiple custom essences at the same time but I just did one since I'm sure one is enough :)
    
        If running on dev.exe this will throw an error but can be safely ignored. This is a generic error caused by appending to the function. It works fine otherwise.
        Fortionately the original death function will fire and remove the essence from us anyway due to how it's coded.

    --]]
	local entity_id = GetUpdatedEntityID()
	local x,y = EntityGetTransform( entity_id )

	local key_abyssal_void = "ESSENCE_ABYSSAL_VOID_PICKUP_COUNT" -- This name is important. As it must be "ESSENCE_[name]_PICKUP_COUNT" for it to be called by the pickup function.
	local pick_abyssal_void = tonumber( GlobalsGetValue( key_abyssal_void, "0" ) ) --How many we got?

    print( tostring( pick_abyssal_void ) .. " - Abyssal Void Essence(s) removed." )

	local loadlist = {} --Define the table.

    if ( pick_abyssal_void > 0 ) then
		for i=1,pick_abyssal_void do
            --Insert any entity to be spawned once the eater is destroyed.
			table.insert( loadlist, "data/entities/items/pickup/poopstone.xml" )
		end
		
		GlobalsSetValue( key_abyssal_void, "0" ) --Removed how many essences we have on us.
	end
    for i,v in ipairs( loadlist ) do
		EntityLoad( v, x, y - (i-1) * 12 ) --Spawn the goodies.
	end
	GameRemoveFlagRun( "essence_abyssal_void" )
end