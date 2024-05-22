local a = {
	{
		id          = "MATERIAL_VOID_FLUID",
		name 		= "$abyssal_glare_action_material_void_fluid",
		description = "$abyssal_glare_action_desc_material_void_fluid",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/material_void_fluid.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/material_void_fluid.xml"},
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "6",
		spawn_probability                 = "0.1",
		price = 250,
		max_uses = 250,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/material_void_fluid.xml")
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_ICE_CREAM",
		name 		= "$abyssal_glare_action_material_ice_cream",
		description = "$abyssal_glare_action_desc_material_ice_cream",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/material_ice_cream.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/material_ice_cream.xml"},
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "0.8,0.8,1,1,0.75",
		price = 25, --Hey ice cream gotta be cheap y'know?
		max_uses = 500,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/material_ice_cream.xml")
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	{
		id          = "MATERIAL_ABYSSAL_VOID",
		name 		= "$abyssal_glare_action_material_abyssal_void",
		description = "$abyssal_glare_action_desc_material_abyssal_void",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/material_abyssal_void.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/material_abyssal_void.xml"},
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "0.8,0.8,1,1,0.75",
		price = 25, 
		max_uses = 500,
		mana = 0,
		sound_loop_tag = "sound_spray",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/material_abyssal_void.xml")
			c.fire_rate_wait = c.fire_rate_wait - 15
			current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10 -- this is a hack to get the cement reload time back to 0
		end,
	},
	--[[ Removed. Added to main game. Seriously. Same name even. Are the devs trying to tell us something
	{
		id          = "TOUCH_GRASS", 
		name 		= "$abyssal_glare_action_touch_grass",
		description = "$abyssal_glare_action_desc_touch_grass",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/touch_grass.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/touch_grass.xml"},
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1,2,3,4,5,6,7,10", -- TOUCH_WATER
		spawn_probability                 = "0,0,0,0,0.01,0.01,0.01,0.04", -- TOUCH_WATER
		price = 420,
		mana = 280,
		max_uses    = 5, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/touch_grass.xml")
		end,
	},
	--]]
	{
		id          = "CLOUD_GOLD",
		name 		= "$abyssal_glare_action_cloud_gold",
		description = "$abyssal_glare_action_desc_cloud_gold",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/cloud_gold.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/cloud_gold.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5",
		spawn_probability                 = "0.0002,0.0003,0.001,0.002,0.003,0.004",
		price = 1000,
		mana = 420,
		max_uses = 1,
		never_unlimited = true,
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/cloud_gold.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "CLOUD_VOID_LIQUID",
		name 		= "$abyssal_glare_action_cloud_void_liquid",
		description = "$abyssal_glare_action_desc_cloud_void_liquid",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/cloud_void_liquid.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/cloud_void_liquid.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "0,1,2,3,4,5",
		spawn_probability                 = "0.0002,0.0003,0.001,0.002,0.003,0.004",
		price = 1000,
		mana = 420,
		max_uses = 1,
		never_unlimited = true,
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/cloud_void_liquid.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "Y_SHAPE",
		name 		= "$abyssal_glare_action_y_shape",
		description = "$abyssal_glare_action_desc_y_shape",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/reverse_y_shape.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "0,1,2,3", -- Y_SHAPE
		spawn_probability                 = "0.8,0.5,0.4,0.3", -- Y_SHAPE
		price = 30,
		mana = 2,
		--max_uses = 100,
		action 		= function()
			draw_actions(3, true)
			c.pattern_degrees = 135
			c.spread_degrees = c.spread_degrees - 3.0
		end,
	},
	{
		id          = "PLUS_SHAPE",
		name 		= "$action_t_shape",
		description = "$actiondesc_t_shape",
		sprite 		= "data/ui_gfx/gun_actions/t_shape.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "0.4,0.4,0.3,0.2,0.1", 
		price = 40,
		mana = 4,
		--max_uses = 100,
		action 		= function()
			draw_actions(4, true)
			c.pattern_degrees = 90
			c.spread_degrees = c.spread_degrees - 6.0
		end,
	},
	{
		id          = "SPARK_BUCKSHOT",
		name 		= "$abyssal_glare_action_spark_buckshot",
		description = "$abyssal_glare_action_desc_spark_buckshot",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/spark_buckshot.png",
		related_projectiles	= {"data/entities/projectiles/deck/light_bullet.xml",3},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,3,4", -- BUCKSHOT
		spawn_probability                 = "1,1,0.9,0.9,0.6", -- BUCKSHOT
		price = 160,
		mana = 25,
		action 		= function()
			add_projectile("data/entities/projectiles/deck/light_bullet.xml")
			add_projectile("data/entities/projectiles/deck/light_bullet.xml")
			add_projectile("data/entities/projectiles/deck/light_bullet.xml")
			c.screenshake = c.screenshake + 1.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			c.fire_rate_wait = c.fire_rate_wait + 12
			c.spread_degrees = c.spread_degrees + 9.0
		end,
	},
	{
		id          = "SPARK_WALL",
		name 		= "$abyssal_glare_action_spark_wall",
		description = "$abyssal_glare_action_desc_spark_wall",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/spark_wall.png",
		related_projectiles	= {"data/entities/projectiles/deck/light_bullet.xml",3},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "3,4,5,6,10", -- BUCKSHOT
		spawn_probability                 = "0.2,0.3,0.2,0.1,0.5", -- BUCKSHOT
		price = #actions,
		mana = (#actions*3),
		action 		= function()
		for i=1,#actions do
			add_projectile("data/entities/projectiles/deck/light_bullet.xml")
		end
			c.screenshake = c.screenshake + 10.5
			c.damage_critical_chance = c.damage_critical_chance + 5
			c.fire_rate_wait = c.fire_rate_wait + 100
			c.spread_degrees = c.spread_degrees + 30 + #actions
		end,
	},
	{
		id          = "MISFIRE", --'Unused' Readded. Technically there's a missfire spell unused, but most of the functionality doesn't work.
		name 		= "$abyssal_glare_action_misfire",
		description = "$abyssal_glare_action_desc_misfire",
		sprite 		= "data/ui_gfx/gun_actions/light_bullet_unidentified.png", --Might as well give the unused sprites a use.
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_unidentified.png", --Do we even need this? I only see if if you pick up the 'high mana, low capacity' perk and the spell in question is dropped. Though rarely it uses the 'unidentified' sprite for some reason when it does. Might be a janky unimplemented system.
		related_projectiles	= {"data/entities/projectiles/deck/light_bullet.xml",3},
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "0,1,2,3,4,5,6,10",
		spawn_probability                 = "0.8,0.7,0.6,0.5,0.5,0.5,0.1,0",
		price = 1,
		mana = 30,
		action 		= function()
			--discard_random_action() --Apart of the original spell definition, but isn't implemented. --Kept here in case the api updates.
			c.screenshake = c.screenshake + 10.5
			c.fire_rate_wait = c.fire_rate_wait + 120
			c.spread_degrees = c.spread_degrees + 30
			current_reload_time = current_reload_time - 5
			
			for i,v in ipairs( hand ) do
				-- print( "removed " .. v.id .. " from hand" )
				table.insert( discarded, v )
			end
			
			for i,v in ipairs( deck ) do
				-- print( "removed " .. v.id .. " from deck" )
				table.insert( discarded, v )
			end
			draw_actions( 1, true )
		end,
	},
	{
		id          = "CHARM_FIELD", --Unused Readded.
		name 		= "Charm field",
		description = "Creates a field of erotic magic.",
		sprite 		= "data/ui_gfx/gun_actions/charm_field.png",
		type 		= ACTION_TYPE_PROJECTILE,
		--This seems to be cut fairly early, since Wands for level 7,8,9 are defined, which isn't normally obtainable.
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- CHARM_FIELD
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- CHARM_FIELD
		price = 100,
		mana = 30,
		max_uses = 9, --Reduced max uses since it's somewhat overpowered.
		action 		= function()
			add_projectile("data/entities/projectiles/deck/charm_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			--Works right out of the gate. 
		end,
	},
		{
		id          = "POLYMORPH", --Unused Readded.
		name 		= "Polymorph charge",
		description = "Baaaaa",
		sprite 		= "data/ui_gfx/gun_actions/polymorph.png",
		type 		= ACTION_TYPE_MODIFIER,
		--This must've been an unlock spell. Since no spawning definitions are defined. Will try to add unlock requirement later.
		spawn_level                       = "", -- POLYMORPH
		spawn_probability                        = "", -- POLYMORPH
		price = 100,
		max_uses 	= 7, --I'll keep this here. Since it seems alright as an early spell.
		mana = 10, --Might increase this, since it's somewhat a good spell.
		custom_xml_file = "data/entities/misc/custom_cards/polymorph.xml",
		action 		= function()
			draw_actions( 1, true ) --This wasn't added in the original, but makes it like other modifiers.
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_polymorph.xml,"
			c.extra_entities = c.extra_entities .. "data/entities/particles/polymorph.xml,"
			-- c.extra_entities = c.extra_entities .. "data/entities/particles/freeze_charge.xml," --Was already commented out.
		end,
	},
	{
		id          = "SPEED", --Unused? Readded.
		name 		= "Speed+",
		description = "The projectiles move faster.",
		sprite 		= "data/ui_gfx/gun_actions/speed.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6,7,8,9,10,11", -- SPEED
		spawn_probability                        = "1,1,1,1,1,1,1,1,1,1,1,1", -- SPEED
		price = 100,
		mana = 40,
		custom_xml_file = "data/entities/misc/custom_cards/speed.xml",
		action 		= function()
			c.speed_multiplier = c.speed_multiplier * 1.5
			draw_actions( 1, true ) --This wasn't added in the original, but makes it like other modifiers.
		end,
	},
	{
		id          = "HALO_2_SNIPER_JACKAL", --Now YOU are the sniper!
		name 		= "$abyssal_glare_action_sniper_jackal",
		description = "$abyssal_glare_action_desc_sniper_jackal",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/sniper_jackal.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/sniper_jackal.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,4,5,6", -- CHAIN_BOLT
		spawn_probability                 = "0.75,1,0.8,0.6", -- CHAIN_BOLT
		price = 117, --Obviously.
		mana = 7, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/sniper_jackal.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	--{
	--	id          = "TELEPORT_HOME",
	--	name 		= "$action_teleport_home",
	--	description = "$actiondesc_teleport_home",
	--	sprite 		= "data/ui_gfx/gun_actions/teleport_home.png",
	--	type 		= ACTION_TYPE_PROJECTILE,
	--	spawn_level                       = "", -- TELEPORT_HOME
	--	spawn_probability                 = "", -- TELEPORT_HOME
	--	price = 100,
	--	mana = 70,
	--	max_uses    = 1,
	--	action 		= function()
	--		--add_projectile("data/entities/projectiles/deck/teleport_home.xml")
	--		--EntityLoad("data/entities/buildings/teleport_start.xml", x, y) --Crap I forgot. This will break noita if I do this.
	--		c.fire_rate_wait = c.fire_rate_wait + 30
	--		c.screenshake = c.screenshake + 5.0
	--	end,
	--},
	{
		id          = "OVERCAST_RAIN", --0
		name 		= "$abyssal_glare_action_overcast_rain",
		description = "$abyssal_glare_action_desc_overcast_rain",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_rain.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_rain.xml"},
		type 		= ACTION_TYPE_UTILITY,
		max_uses    = 10,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_rain.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "OVERCAST_LAVA", --1
		name 		= "$abyssal_glare_action_overcast_lava",
		description = "$abyssal_glare_action_desc_overcast_lava",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_lava.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_lava.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		max_uses    = 3,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_lava.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "OVERCAST_BLOOD", --2
		name 		= "$abyssal_glare_action_overcast_blood",
		description = "$abyssal_glare_action_desc_overcast_blood",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_blood.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_blood.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		max_uses    = 5,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_blood.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "OVERCAST_MONSTER", --3
		name 		= "$abyssal_glare_action_overcast_monster",
		description = "$abyssal_glare_action_desc_overcast_monster",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_monster.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_monster.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		max_uses    = 1,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_monster.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "OVERCAST_PISS", --4
		name 		= "$abyssal_glare_action_overcast_piss",
		description = "$abyssal_glare_action_desc_overcast_piss",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_piss.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_piss.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		max_uses    = 10,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_piss.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "OVERCAST_RAINWORLD", --5
		name 		= "$abyssal_glare_action_overcast_rainworld",
		description = "$abyssal_glare_action_desc_overcast_rainworld",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/overcast_rainworld.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_rainworld.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,4,5,6",
		spawn_probability                 = "0.05,0.1,0.3,0.6",
		price = 1000,
		max_uses    = 5,
		mana = 400, 
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/overcast/overcast_rainworld.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
			c.screenshake = c.screenshake + 0.4
			c.spread_degrees = c.spread_degrees - 2.0
			c.damage_critical_chance = c.damage_critical_chance + 1
		end,
	},
	{
		id          = "TEMPORARY_CIRCLE",
		name 		= "$abyssal_glare_action_temporary_circle",
		description = "$abyssal_glare_action_desc_temporary_circle",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/temporary_circle.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/temporary_circle.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "0,1,2,4,5", -- WALL_SQUARE
		spawn_probability                 = "0.1,0.1,0.3,0.4,0.2", -- WALL_SQUARE
		price = 100,
		mana = 40,
		max_uses = 20,
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/temporary_circle.xml")
			c.fire_rate_wait = c.fire_rate_wait + 90
		end,
	},
	{
		id          = "TEMPORARY_BALL", --physics ball based off of the temporary barriers.
		name 		= "$abyssal_glare_action_temporary_ball",
		description = "$abyssal_glare_action_desc_temporary_ball",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/temporary_ball.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/temporary_ball.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2,4,5", -- WALL_SQUARE
		spawn_probability                 = "0.1,0.1,0.3,0.4,0.2", -- WALL_SQUARE
		price = 100,
		mana = 40,
		max_uses = 20,
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/temporary_ball.xml")
			c.fire_rate_wait = c.fire_rate_wait + 90
		end,
	},
	{
		id          = "CIRCLE_RAINBOW",
		name 		= "$abyssal_glare_action_circle_rainbow",
		description = "$abyssal_glare_action_desc_circle_rainbow",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/circle_rainbow.png",
		type 		= ACTION_TYPE_MATERIAL,
		spawn_level                       = "1",
		spawn_probability                 = "0.001", 
		related_projectiles	= {"mods/abyssal_glare/files/entities/projectiles/deck/circle_rainbow.xml"},
		price = 170,
		mana = 20,
		max_uses = 15,
		--max_uses = 100,
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/circle_rainbow.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "BURST_RANDOM",
		name 		= "$abyssal_glare_action_burst_random",
		description = "$abyssal_glare_action_desc_burst_random",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/burst_random.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burst_4_unidentified.png",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "5,6,10", -- BURST_4
		spawn_probability                 = "0.1,0.1,0.5", -- BURST_4
		price = 500,
		mana = 50,
		max_uses = 30,
		action 		= function()
			SetRandomSeed(x,y)
			local randeck = Random(1,#deck)
			if ( #deck > 0 ) then
				draw_actions( randeck, true )
			end
		end,
	},
	{
		id          = "MINI_NUKE",
		name 		= "$action_nuke",
		description = "$actiondesc_nuke",
		spawn_requires_flag = "card_unlocked_nuke",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/mini_nuke.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/nuke_unidentified.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/misc/spell_card_effect/mini_nuke.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,5,6,10", -- NUKE
		spawn_probability                 = "0.3,1,1,0.2", -- NUKE
		price = 200,
		mana = 100,
		max_uses    = 3,
		custom_xml_file = "mods/abyssal_glare/files/entities/projectiles/deck/mini_nuke.xml",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/mini_nuke.xml")
			c.fire_rate_wait = 10
			c.speed_multiplier = c.speed_multiplier * 0.75
			c.material = "fire"
			c.material_amount = c.material_amount + 30
			c.ragdoll_fx = 2
			c.gore_particles = c.gore_particles + 10
			c.screenshake = c.screenshake + 10.5
			current_reload_time = current_reload_time + 300
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 150.0
			
			if ( c.speed_multiplier >= 20 ) then
				c.speed_multiplier = math.min( c.speed_multiplier, 20 )
			elseif ( c.speed_multiplier < 0 ) then
				c.speed_multiplier = 0
			end
		end,
	},
	{
		id          = "ANTIMATTER_BOMB",
		name 		= "$action_nuke",
		description = "$actiondesc_nuke",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/antimatter_bomb.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/nuke_unidentified.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/misc/spell_card_effect/antimatter_bomb.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,5,6,10", -- NUKE
		spawn_probability                 = "0.3,1,1,0.2", -- NUKE
		price = 200,
		mana = 100,
		max_uses    = 3,
		--custom_xml_file = "mods/abyssal_glare/files/entities/projectiles/deck/mini_nuke.xml",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/antimatter_bomb.xml")
			c.fire_rate_wait = 10
			c.speed_multiplier = c.speed_multiplier * 0.75
			c.material = "fire"
			c.material_amount = c.material_amount + 30
			c.ragdoll_fx = 2
			c.gore_particles = c.gore_particles + 10
			c.screenshake = c.screenshake + 10.5
			current_reload_time = current_reload_time + 300
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 150.0
			
			if ( c.speed_multiplier >= 20 ) then
				c.speed_multiplier = math.min( c.speed_multiplier, 20 )
			elseif ( c.speed_multiplier < 0 ) then
				c.speed_multiplier = 0
			end
		end,
	},
	{
		id          = "ANTIMATTER_BOMB_GIGA",
		name 		= "$action_nuke",
		description = "$actiondesc_nuke",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/antimatter_bomb_giga.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/nuke_unidentified.png",
		related_projectiles	= {"mods/abyssal_glare/files/entities/misc/spell_card_effect/antimatter_bomb_giga.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "1,5,6,10", -- NUKE
		spawn_probability                 = "0.3,1,1,0.2", -- NUKE
		price = 200,
		mana = 100,
		max_uses    = 3,
		--custom_xml_file = "mods/abyssal_glare/files/entities/projectiles/deck/mini_nuke.xml",
		action 		= function()
			add_projectile("mods/abyssal_glare/files/entities/projectiles/deck/antimatter_bomb_giga.xml")
			c.fire_rate_wait = 10
			c.speed_multiplier = c.speed_multiplier * 0.75
			c.material = "fire"
			c.material_amount = c.material_amount + 30
			c.ragdoll_fx = 2
			c.gore_particles = c.gore_particles + 10
			c.screenshake = c.screenshake + 10.5
			current_reload_time = current_reload_time + 300
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + 150.0
			
			if ( c.speed_multiplier >= 20 ) then
				c.speed_multiplier = math.min( c.speed_multiplier, 20 )
			elseif ( c.speed_multiplier < 0 ) then
				c.speed_multiplier = 0
			end
		end,
	},

}

for i,v in ipairs(a) do
	v.id = "ABYSSAL_GLARE_" .. v.id
    table.insert(actions, v)
end

--[[
--This is a spell that will give the next spell power based on how many are discarded.
	{
		id          = "DISCARDED",
		name 		= "$abyssal_glare_action_discarded",
		description = "$abyssal_glare_action_desc_discarded",
		sprite 		= "mods/abyssal_glare/files/ui_gfx/gun_actions/discarded.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/burst_4_unidentified.png",
		spawn_requires_flag = "card_unlocked_musicbox",
		type 		= ACTION_TYPE_DRAW_MANY,
		spawn_level                       = "5,6,10", -- BURST_4
		spawn_probability                 = "0.1,0.1,0.5", -- BURST_4
		price = 500,
		mana = 50,
		max_uses = 30,
		action 		= function()
			local randspell = Random(1,#deck)
			if ( #deck > 0 ) then
				draw_actions( #deck, true )
			end
		end,
	},
]]
	
--[[
	If it wasn't obvious, Noita uses a naming schema similar to a card game. Terminology and mechanics are referenced a ton in a card game style. This is why spells are called cards internally since we are dealing with what the game calls them in our wand builds.
	
	For example the list of spells on a wand is the 'deck' and the spells themselves are 'cards' and we as the player 'play' our 'cards' in each 'deck' is called the 'hand'. AKA. Fire the wand in which we call our 'action'.
	

--]]
	
	
	
	--List of all things in action
--[[
		action 		= function()
		
			add_projectile("data/entities/projectiles/bomb.xml")
			-Trigger Related.
			
			-Trigger on spell hitting surface (Spark Bolt with trigger)
			add_projectile_trigger_hit_world("data/entities/projectiles/deck/light_bullet.xml", 1)
			-Trigger on spell timer expiring (Bubble Spark with Timer)
			add_projectile_trigger_timer("data/entities/projectiles/deck/bullet.xml", 10, 1)
			-Trigger on spell ending by destruction (Black Hole on Death Trigger/ Summon Hollow Egg)
			add_projectile_trigger_death("data/entities/projectiles/deck/black_hole.xml", 1) 
			
			- On Laser Like Spells
			c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_disintegrated.xml,"
			
			-Used by Nuke
			c.material = "fire"
			c.material_amount = c.material_amount + 60
			c.gore_particles = c.gore_particles + 10
			
			-Pretty Self Explanatory
			c.fire_rate_wait = c.fire_rate_wait + n
			c.screenshake = c.screenshake + n
			c.spread_degrees = c.spread_degrees - n


			c.lightning_count = c.lightning_count + 1			
			c.damage_electricity_add = 0
			c.damage_explosion_add = 0
			c.damage_explosion = 0
			c.damage_critical_chance = 0
			c.damage_ice_add = 0
			c.damage_projectile_add = 0
			c.damage_null_all = 1
			c.damage_critical_chance = c.damage_critical_chance + n
			current_reload_time = current_reload_time + n
			shot_effects.recoil_knockback = shot_effects.recoil_knockback + n
			
			c.gravity = c.gravity - 600.0
			
			c.explosion_radius = c.explosion_radius - 30.0
			c.damage_explosion_add = c.damage_explosion_add - 0.8
			
			c.lifetime_add = c.lifetime_add + 25
			
			-Used by High Explosive, which is commented out.
			c.damage_explosion = c.damage_explosion + 3.2
			c.explosion_damage_to_materials = c.explosion_damage_to_materials + 300000
			
			c.friendly_fire		= true
			
			c.bounces = 0
			
			-Obscure Actions
			c.knockback_force = c.knockback_force + n (Unused?)
			c.dampening = 0.1
			c.ragdoll_fx = 2 (Used on Rocket Spell)
			c.child_speed_multiplier = c.child_speed_multiplier * n
			
			-Think of Double Spell. How many actions does it do? Like BURST_2
			draw_actions( 1, true )
			-Used with draw_actions to make spells like the Y shape and T shape modifiers.
			c.pattern_degrees = 45
			
			-Can check how many spells in a wand is: AKA the deck count.
			if ( #deck > 0 ) then
				draw_actions( #deck, true )
			end
			
			--c.rad_pattern_degrees_offset = 150 // TODO: implement this
			
			
			OnNotEnoughManaForAction()
			
			
		end,
		
--]]