
local a = {
	{
		--Bleeds Water, Higher Gravity, No Damage Flash
		id = "BLEED_WATER",
		ui_name = "$abyssal_glare_perk_bleed_water",
		ui_description = "$abyssal_glare_perkdesc_bleed_water",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/water_blood.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/water_blood.png",
		game_effect = "NO_DAMAGE_FLASH",
		stackable = STACKABLE_NO,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )

			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					ComponentSetValue2( damagemodel, "blood_material", "water" )
					ComponentSetValue2( damagemodel, "blood_spray_material", "water" )
					ComponentSetValue2( damagemodel, "blood_multiplier", "3.0" )
					ComponentSetValue2( damagemodel, "blood_sprite_directional", "data/particles/bloodsplatters/bloodsplatter_directional_blue_$[1-3].xml" )
					ComponentSetValue2( damagemodel, "blood_sprite_large", "data/particles/bloodsplatters/bloodsplatter_blue_$[1-3].xml" )
				end
			end

			local models = EntityGetComponent( entity_who_picked, "CharacterPlatformingComponent" )
			if( models ~= nil ) then
				for i,model in ipairs(models) do
					local gravity = ComponentGetValue2( model, "pixel_gravity" ) * 1.25
					ComponentSetValue2( model, "pixel_gravity", gravity )
				end
			end
		end,
		func_remove = function( entity_who_picked )
			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					ComponentSetValue2( damagemodel, "blood_material", "blood" )
					ComponentSetValue2( damagemodel, "blood_spray_material", "blood" )
					ComponentSetValue2( damagemodel, "blood_multiplier", "1.0" )
					ComponentSetValue2( damagemodel, "blood_sprite_directional", "" )
					ComponentSetValue2( damagemodel, "blood_sprite_large", "" )
				end
			end

			local models = EntityGetComponent( entity_who_picked, "CharacterPlatformingComponent" )
			if( models ~= nil ) then
				for i,model in ipairs(models) do
					ComponentSetValue2( model, "pixel_gravity", 350 )
				end
			end
		end,



	},
	{
		id = "MULTIPLY_HP",
		ui_name = "$abyssal_glare_perk_multiply_hp",
		ui_description = "$abyssal_glare_perkdesc_multiply_hp",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/triple_hp.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/triple_hp.png",
		stackable = STACKABLE_YES,
		stackable_is_rare = true,
		usable_by_enemies = true,
		one_off_effect = true,
		func = function( entity_perk_item, entity_who_picked, item_name )

			local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
			if( damagemodels ~= nil ) then
				for i,damagemodel in ipairs(damagemodels) do
					local old_max_hp = tonumber( ComponentGetValue2( damagemodel, "max_hp" ) )
					local max_hp = tonumber( ComponentGetValue2( damagemodel, "max_hp" ) ) * 3

					local max_hp_cap = tonumber( ComponentGetValue2( damagemodel, "max_hp_cap" ) )
					if max_hp_cap > 0 then
						max_hp = math.min( max_hp, max_hp_cap )
					end

					local current_hp = tonumber( ComponentGetValue2( damagemodel, "hp" ) )
					current_hp = math.min( current_hp + math.abs(max_hp - old_max_hp), max_hp )

					ComponentSetValue2( damagemodel, "max_hp", max_hp )
					ComponentSetValue2( damagemodel, "hp", current_hp )
				end
			end

		end,
	},
	{
		id = "ONE_OFF_GIVE_FATE_CARD",
		ui_name = "$abyssal_glare_perk_give_fate_card",
		ui_description = "$abyssal_glare_perkdesc_give_fate_card",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/give_fate_card.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/give_fate_card.png",
		stackable = STACKABLE_YES,
		stackable_is_rare = true,
		usable_by_enemies = false,
		one_off_effect = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local x, y = EntityGetTransform( entity_perk_item )

			dofile_once("mods/abyssal_glare/files/script/entities/items/fate_card_list.lua")
			--Wanted to do fixed cards, but added random card spawning based on position and seed instead (similar to chests)
			--spawn_fate_card("the_magician",true,200,-150)
			for i=0,2 do
			spawn_random_fate_card(x-14+(14*i),y)
			end

		end,
	},
	{
		id = "ONE_OFF_DUPLICATE_PLAYER",
		ui_name = "$abyssal_glare_perk_dupe_player",
		ui_description = "$abyssal_glare_perkdesc_dupe_player",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/dupe_player.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/dupe_player.png",
		stackable = STACKABLE_NO,
		stackable_maximum = 1,
		max_in_perk_pool = 1,
		usable_by_enemies = false,
		one_off_effect = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			local x, y = EntityGetTransform( entity_perk_item )

			--I know tags are frowned upon, but maybe I can get by with just ONE tag...

			--TODO:
			--GET 👏 RID 👏 OF 👏 THE 👏 TAG 👏
			local playerclone = EntityLoad("data/entities/player.xml", x, y)
			EntityAddTag( playerclone, "player_clone" )
			local comp = EntityGetAllComponents(playerclone)
			for i, v in ipairs(comp) do
			local lua = EntityGetFirstComponent(playerclone,"LuaComponent")
			if lua ~= nil then
				EntityRemoveComponent(playerclone,lua)
			end
			--The UI for multiple players are quite glitchy. It's better to just disable it entirely.
			local Gui = EntityGetFirstComponent(playerclone,"InventoryGuiComponent")
			if Gui ~= nil then
			EntitySetComponentIsEnabled(playerclone,Gui,false)
			end
			--Fix: We need to readd this to make so Healthium can heal the clone too.
			local matsucc = EntityGetFirstComponent(playerclone,"MaterialSuckerComponent")
			if matsucc ~= nil then
			EntitySetComponentIsEnabled(playerclone,matsucc,false)
			end
			local cash = EntityGetFirstComponent(playerclone,"WalletComponent")
			if cash ~= nil then
			EntitySetComponentIsEnabled(playerclone,cash,false)
			end
			end
			EntityAddComponent2(playerclone, "LuaComponent", {
				script_damage_received="mods/abyssal_glare/files/script/playerclone_death.lua"
			})
		end,
	},
	{
		id = "WORLDDEATH_RESTORE",
		ui_name = "$abyssal_glare_perk_worlddeathrestore",
		ui_description = "$abyssal_glare_perkdesc_worlddeathrestore",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/worlddeath.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/worlddeath.png",
		remove_other_perks = {"ABYSSAL_GLARE_ONE_OFF_DUPLICATE_PLAYER"},
		stackable = STACKABLE_NO,
		stackable_maximum = 1,
		max_in_perk_pool = 1,
		usable_by_enemies = false,
		not_in_default_perk_pool = true,
		one_off_effect = true,
		func = function()
			--local theworld = EntityGetWithTag("world_state")
			local theworld = GameGetWorldStateEntity()
			ComponentSetValue2(theworld,"WorldStateComponent", {
				EVERYTHING_TO_GOLD="0"
			})
		end,
	},
	{
		id = "SILVER_DOLLAR",
		ui_name = "$abyssal_glare_perk_silver_dollar",
		ui_description = "$abyssal_glare_perkdesc_silver_dollar",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/silver_dollar.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/silver_dollar.png",
		stackable = STACKABLE_NO,
		stackable_is_rare = true,
		usable_by_enemies = false,
		one_off_effect = true,
		stackable_maximum = 1,
		max_in_perk_pool = 1,
		func = function( entity_perk_item, entity_who_picked, item_name )
			EntityAddComponent( entity_who_picked, "LuaComponent",
			{
				_tags = "perk_component",
				script_source_file = "mods/abyssal_glare/files/script/entities/perks/silver_dollar.lua",
				execute_every_n_frame = "300",
			} )
			EntityAddComponent( entity_who_picked, "LuaComponent",
			{
				_tags = "perk_component",
				script_source_file = "mods/abyssal_glare/files/script/entities/perks/silver_dollar_nuggetkill.lua",
				execute_every_n_frame = "1",

			})
			local gold = CellFactory_GetType( "gold" ) --Get Type takes a string -> ID
			local gold_box2d = CellFactory_GetType( "gold_box2d" ) --Get Type takes a string -> ID
			local gold_static = CellFactory_GetType( "gold_static" ) --Get Type takes a string -> ID
			local gold_static_dark = CellFactory_GetType( "gold_static_dark" ) --Get Type takes a string -> ID

			local gold_static_bad = CellFactory_GetType( "gold_static_radioactive" ) --Get Type takes a string -> ID
			local gold_bad = CellFactory_GetType( "gold_radioactive" ) --Get Type takes a string -> ID


			local silver = CellFactory_GetType( "silver" ) --Get Type takes a string -> ID
			local silver_static = CellFactory_GetType( "silver_static" ) --Get Type takes a string -> ID
			local silver_bad = CellFactory_GetType( "silver_radioactive" ) --Get Type takes a string -> ID
			local silver_static_bad = CellFactory_GetType( "silver_static_radioactive" ) --Get Type takes a string -> ID
			ConvertMaterialEverywhere( gold, silver ) --These need int's passed through.
			ConvertMaterialEverywhere( gold_box2d, silver ) 
			ConvertMaterialEverywhere( gold_static, silver_static ) 
			ConvertMaterialEverywhere( gold_static_dark, silver_static ) 
			ConvertMaterialEverywhere( gold_static_bad, silver_static_bad ) 
			ConvertMaterialEverywhere( gold_bad, silver_bad )


		end,
	},
	{
		id = "KARMA_WEATHER",
		ui_name = "$abyssal_glare_perk_karma",
		ui_description = "$abyssal_glare_perkdesc_karma",
		ui_icon = "mods/abyssal_glare/files/ui_gfx/perk_icons/karma.png",
		perk_icon = "mods/abyssal_glare/files/items_gfx/perks/karma.png",
		stackable = STACKABLE_NO,
		stackable_is_rare = true,
		usable_by_enemies = false,
		one_off_effect = true,
		stackable_maximum = 1,
		max_in_perk_pool = 1,
		func = function( entity_perk_item, entity_who_picked, item_name )
			EntityAddComponent( entity_who_picked, "LuaComponent",
			{
				_tags = "perk_component",
				script_source_file = "mods/abyssal_glare/files/script/entities/perks/karma_weather.lua",
				execute_every_n_frame = "1",

			})
		end
	}


}


for i,v in ipairs(a) do
	v.id = "ABYSSAL_GLARE_" .. v.id
    table.insert(perk_list, v)
end