dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")
dofile( "data/scripts/perks/perk_list.lua" )

function item_pickup( entity_item, entity_who_picked, item_name )
	-- fetch perk info ---------------------------------------------------
	--[[
	Yo. So this is based off the essence pickup function. However I've modified it to work on it's own with a custom essence. Check out my "essence_eater.lua" for more info on how that part works
		but in a shellnut this does the same thing as the original script, but it allows my custom essence to be defined. 
		It's somewhat like a perk, but not really as a perk can be removed by the null altar but not essences.
		This also determines what kind of side effect each essence would do. Such as Air releasing gusts of air projectiles around the player.

	--]]

	local pos_x, pos_y = EntityGetTransform( entity_item )
	
	local essence_name = "ESSENCE_NAME_NOT_DEFINED"
	local essence_desc = "ESSENCE_DESCRIPTION_NOT_DEFINED"
	
	edit_component( entity_item, "ItemComponent", function(comp,vars)
		essence_name = ComponentGetValue( comp, "item_name")
		essence_desc = ComponentGetValue( comp, "ui_description")
	end)

	local id = ""
	edit_component( entity_item, "VariableStorageComponent", function(comp,vars)
		id = ComponentGetValue( comp, "value_string" )
	end)
	
	local ui_icon = "mods/abyssal_glare/files/ui_gfx/essence_icons/" .. id .. ".png"
	local sprite_icon = "mods/abyssal_glare/files/items_gfx/essences/" .. id .. ".png"
	
	-- add ui icon etc
	local entity_ui = EntityCreateNew( "" )
	EntityAddComponent( entity_ui, "UIIconComponent", 
	{ 
		name = essence_name,
		description = essence_desc,
		icon_sprite_file = ui_icon
	})
	EntityAddTag( entity_ui, "essence_effect" )
	EntityAddChild( entity_who_picked, entity_ui )
	
	if ( id == "abyssal_void" ) then
		local cid = EntityLoad( "mods/abyssal_glare/files/entities/misc/essences/abyssal_void.xml", pos_x, pos_y )
		EntityAddChild( entity_who_picked, cid )
	end
	
	GameAddFlagRun( "essence_" .. id )
	AddFlagPersistent( "essence_" .. id )

	local globalskey = "ESSENCE_" .. string.upper(id) .. "_PICKUP_COUNT"
	local pickups = tonumber( GlobalsGetValue( globalskey, "0" ) )
	pickups = pickups + 1
	GlobalsSetValue( globalskey, tostring( pickups ) )

	-- cosmetic fx -------------------------------------------------------

	EntityLoad( "data/entities/particles/image_emitters/perk_effect.xml", pos_x, pos_y )
	GamePrintImportant( GameTextGet( "$log_pickedup_perk", GameTextGetTranslatedOrNot( essence_name ) ), essence_desc )
	
	EntityKill( entity_item )


	LoadGameEffectEntityTo(entity_who_picked, "mods/abyssal_glare/files/entities/misc/polytest.xml")
end