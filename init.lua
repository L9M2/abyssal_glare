---M: To the Seekers of Knowledge: The path winds, obscured by shadows of crystal. 
---What you uncover is but a reflection—seen through a singular eye. 
---The stars speak in whispers, but some truths are locked in the abyss, waiting. 
---Seek the Monolith not with sight, but with understanding. 
---Will you traverse the lightless path, or let its weight pull you under?

ModMaterialsFileAdd("mods/abyssal_glare/files/materials/materials.xml")

ModMagicNumbersFileAdd( "mods/abyssal_glare/files/magic_numbers.xml" ) -- Will override some magic numbers using the specified file

Parallax = dofile_once( "mods/abyssal_glare/files/script/lib/bg/parallax.lua" )


dofile_once("mods/abyssal_glare/files/script/entities/dmc/player.lua")
dofile_once("mods/abyssal_glare/files/script/entities/dmc/base_humanoid.lua")

ModLuaFileAppend("data/scripts/essences/away.lua", "mods/abyssal_glare/files/script/mod_compat/essence_eater.lua")



ModLuaFileAppend("data/scripts/gun/gun_actions.lua", "mods/abyssal_glare/files/actions.lua")
ModLuaFileAppend("data/scripts/status_effects/status_list.lua", "mods/abyssal_glare/files/status_effects.lua")

ModLuaFileAppend("data/scripts/items/potion.lua", "mods/abyssal_glare/files/script/entities/items/potion_append.lua")
ModLuaFileAppend("data/scripts/perks/perk_list.lua", "mods/abyssal_glare/files/perk_list.lua")
ModLuaFileAppend("data/scripts/biomes/mountain/mountain_right.lua", "mods/abyssal_glare/files/script/biomes/mountain_hall_append.lua")

local worldtosilver = ModTextFileGetContent("mods/abyssal_glare/files/script/world_to_silver.lua")
ModTextFileSetContent("data/entities/animals/boss_centipede/ending/midas_convert_everything_to_gold.lua", worldtosilver)


local worldtosilverbad = ModTextFileGetContent("mods/abyssal_glare/files/script/world_to_toxic_silver.lua")
ModTextFileSetContent("data/entities/animals/boss_centipede/ending/midas_convert_everything_to_radioactive_gold.lua", worldtosilverbad)

dofile_once( "data/scripts/perks/perk_list.lua" )
dofile_once( "data/scripts/perks/perk.lua" )

dofile_once("data/scripts/lib/utilities.lua")
dofile_once("mods/abyssal_glare/files/script/lib/injection.lua")
dofile_once("mods/abyssal_glare/files/script/enums.lua")
dofile_once("mods/abyssal_glare/files/script/util.lua")
dofile_once("mods/abyssal_glare/files/script/translations.lua")
dofile_once("mods/abyssal_glare/files/script/world_magic.lua")
print("ABYSSAL_GLARE: Attempting Damage Model Component override...")


--WOAH THERE!
--We can't override the biome map now remember?
--We're trying to load the vanilla world state in NG instead of a gamemode now.
--This will break a ton of stuff if we do it now!
--Besides the portal handles the pixel scene logic anyway.


--This should be fine since we're patching the Biomes_All.xml
append_custom_biomes()
--This has to be done BEFORE the biome map is generated. The offset will change if we do it after map gen, but doesn't actually change in-game.
adjust_y_offset()


replace_with_my_pixel_scenes()
--Extra Functions Regarding Biome Map Compatibility.
--if Apotheosis is enabled. We gotta add our biomemap to theirs instead of vanilla.
local Abyssal_Glare_ModdedMap = 0
if ModIsEnabled("Apotheosis") then
	Abyssal_Glare_ModdedMap = 1
	if Abyssal_Glare_ModdedMap == 1 then
		print("ABYSSAL GLARE:Apotheosis Installed: Attempting to Stitch Abysal Glare map changes...")
		ModLuaFileAppend( "mods/Apotheosis/files/scripts/biomes/biome_map.lua", "mods/abyssal_glare/files/script/mod_compat/biome_map_gen_apoth.lua")
	end
end
--If we're playing Conjurer, then we abort map changes. I could theoretically apply map changes to the vanilla map inside conjurer, but it requires a ton of work that I don't think is needed now.
if ModIsEnabled("raksa") then
	Abyssal_Glare_ModdedMap = 1
	if Abyssal_Glare_ModdedMap == 1 then
		print("ABYSSAL GLARE:Conjurer Installed: !!!Aborting Map Changes!!!")
		print("ABYSSAL GLARE:(Conflicts with map generation interferes with map changes)")
	end
end
--Of course, we gotta consider nightmare mode as well. Since it's technically a 'mod' in its own regard.
--CONSIDER: Map changes?
if ModIsEnabled("nightmare") then
	
	Abyssal_Glare_ModdedMap = 1
	if Abyssal_Glare_ModdedMap == 1 then
		print("ABYSSAL GLARE:Nightmare Mode: !!!Aborting Map Changes!!!")
		print("ABYSSAL GLARE:(Conflicts with map generation interferes with map changes)")
	end

end


if ModIsEnabled("ethereal_convergence") then
	
	Abyssal_Glare_ModdedMap = 1
	if Abyssal_Glare_ModdedMap == 1 then
		print("ABYSSAL GLARE:Etherreal Convergence Mode: !!!Aborting Map Changes!!!")
		print("ABYSSAL GLARE:(Conflicts with map generation interferes with map changes)")
	end

end


if 	Abyssal_Glare_ModdedMap == 0 then
	--Nolla Games. Thank you for implementing this. I was worried I was gonna have to overwrite the vanilla image with a lua file, but you beat me to it.
	print("ABYSSAL GLARE:No modded biome map detected. This is either an unsupported map or we're playing with the vanilla biome map.")
	print("ABYSSAL GLARE:Attempting to Stitch Abysal Glare map changes...")
	ModLuaFileAppend( "data/scripts/biome_map.lua", "mods/abyssal_glare/files/script/mod_compat/biome_map_gen_vanilla.lua")
end






function OnModPreInit() -- This is called first for all mods
print(" An eye for an eye.")



--local entities = PolymorphTableGet()
--printTable(entities)
--31/01/2024 Conga: I know it's your code and none of my business, but do we need an error print here? It shouldn't affect performance *too* much, but maybe I just have over-optimise brain
---M:My Creator is asking for help?
---Who is this intruder?
end


function OnPlayerDied(player)
	---M:And thus the cycle repeats anew for the puppet.
	GlobalsToggleBool(PLAYER_HAS_DIED)
end

function OnModInit()
	-- How many layers you may use at once
	Parallax.registerLayers(5)

	-- Register all textures you may use
	Parallax.registerTextures({
	  "mods/abyssal_glare/files/bg_gfx/bgs/parallax_mountains_01.png",
	  "mods/abyssal_glare/files/bg_gfx/bgs/parallax_clounds_02.png",
	  "mods/abyssal_glare/files/bg_gfx/bgs/parallax_cracked_01.png",
	  "mods/abyssal_glare/files/bg_gfx/sky_colors_default.png",
	  "mods/abyssal_glare/files/bg_gfx/sky_colors_worlddeath.png"
	})
  end

--  local player = player or get_player()
function player_overrides(player)
	local playerunit = EntityGetWithTag("player_unit")[1]
	local playerclone = EntityGetWithTag("player_clone")[1]
		if playerclone == nil and playerunit then
	EntityAddComponent2(player, "LuaComponent", {
		script_biome_entered="mods/abyssal_glare/files/script/biome_antideath.lua",
		script_damage_received="mods/abyssal_glare/files/script/death.lua"
	})

	EntityAddComponent2(player, "BiomeTrackerComponent")
	end
end


function OnPlayerSpawned(player)
	--EntityAddTag( player, "player_original" )
    player_overrides(player)
    GlobalsSetValue(FIRST_LOAD_DONE, "1")
    GlobalsSetValue(PLAYER_HAS_DIED, "0")
    GlobalsSetValue(PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE, "0")
	if DebugGetIsDevBuild() then
		--GamePrintImportant("DEV MODE ACTIVE", "Woo Hoo!")
		dofile_once("mods/abyssal_glare/files/script/entities/items/fate_card_list.lua")
		spawn_fate_card("monolith",220,-150,false)

		--EntityLoad("mods/abyssal_glare/files/entities/npc/dg.xml", 0, -150)
	print("ABYSSAL_GLARE: DEV BUILD ACTIVE")
	end
	
	--local player_vessel = "mods/abyssal_glare/files/entities/player_vessel.xml"
	--EntityLoad(player_vessel, 156, -120)
		--LoadGameEffectEntityTo(player, "mods/abyssal_glare/files/entities/misc/polytest.xml")
	if GameHasFlagRun("abyssal_glare_broken_cycle") then
			local platformshooter = EntityGetFirstComponentIncludingDisabled( player, "PlatformShooterPlayerComponent" )
			if platformshooter ~= nil then
				
				GameDestroyInventoryItems( player )
				ComponentSetValue2( platformshooter, "mCessationDo", true )
				ComponentSetValue2( platformshooter, "mCessationLifetime", 2699 )
			end


	

	dofile_once("mods/abyssal_glare/files/script/player_hax.lua")
	EntityAddComponent2(player, "LuaComponent", {
		script_source_file="mods/abyssal_glare/files/script/player_hax_leggy.lua",
		execute_every_n_frame = 5
	})
	end
end

function OnModPostInit()
	-- Call during OnModPostInit()
	  Parallax.postInit()
		

end

function OnWorldPreUpdate()
end

local frame_trigger = 60*40 -- 45 seconds * 60 fps
function OnWorldPostUpdate()
	if GameHasFlagRun("abyssal_glare_worlddeath_initialized") and not GameHasFlagRun("abyssal_glare_worlddeath_dead") then

		--local player = EntityGetWithTag("player_original")[1]


		--dofile_once("data/scripts/perks/perk.lua")
		local player = EntityGetWithTag("player_unit")[1]
		--local playerclone = EntityGetWithTag("player_clone")[1]
		--local x, y = EntityGetTransform(player)
		--local perk = perk_spawn(x, y, "ABYSSAL_GLARE_WORLDDEATH")
		--perk_pickup(perk, player, EntityGetName(perk), false, false)




		dofile_once("mods/abyssal_glare/files/script/custom_status_effects.lua")

		if player then
			apply_custom_game_effect(player, "ABYSSAL_GLARE_HORRIBLE_FATE","worlddeath","worlddeath","horrible_fate", -1,true,true,true)
		end
		GamePrintImportant("The prophecy is severed.", "Begin a new run to restore the weave of fate.\nOtherwise persist in the doomed world you have created.", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
		bg_set_worlddeath()
		GameAddFlagRun("abyssal_glare_worlddeath_dead")


		if GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_WORLDDEATH_RESTORE") then
			--print("Updating world state flag")
			local world_state = GameGetWorldStateEntity()
			local world_state_component = EntityGetFirstComponentIncludingDisabled(world_state, "WorldStateComponent")
			ComponentSetValue2(world_state_component, "EVERYTHING_TO_GOLD", false)
			ComponentSetValue2(world_state_component, "material_everything_to_gold", "gold")
			ComponentSetValue2(world_state_component, "material_everything_to_gold_static", "gold_static")

			dofile_once("mods/abyssal_glare/files/script/custom_status_effects.lua")
			remove_custom_game_effect("ABYSSAL_GLARE_HORRIBLE_FATE")
		end

	end
	-- Parallax.update() needs to be called once per frame
	if Parallax ~= nil then Parallax.update()  end






  local current_frame = GameGetFrameNum()
  if current_frame == frame_trigger then
		GamePrintImportant(
		"The Puppet is gone. You broke the Cycle.",
		"But not all things are so easily erased.",
		"mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
  end
	if current_frame == 2700 then

		
		GamePrintImportant(
		"This is not them... It is a Vessel-",
		"a hollow echo stitched by regret.",
		"mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")

		--local player = EntityGetWithTag("player_unit")[1]
		--	-- Add glow light
		--			local sprite = EntityGetFirstComponentIncludingDisabled(player, "SpriteComponent")
		--if sprite ~= nil then
		--	-- Point to a different sprite file
		--	ComponentSetValue2(sprite, "image_file", "mods/abyssal_glare/files/enemies_gfx/player_vessel.png")
		--end
--local entity_id = EntityGetRootEntity(GetUpdatedEntityID())
	end
end
function OnMagicNumbersAndWorldSeedInitialized()


	if GameHasFlagRun("PERK_PICKED_ABYSSAL_GLARE_WORLDDEATH_RESTORE") then
		--print("Updating world state flag")
		local world_state = GameGetWorldStateEntity()
		local world_state_component = EntityGetFirstComponentIncludingDisabled(world_state, "WorldStateComponent")
		ComponentSetValue2(world_state_component, "EVERYTHING_TO_GOLD", 0)
		ComponentSetValue2(world_state_component, "material_everything_to_gold", "gold")
		ComponentSetValue2(world_state_component, "material_everything_to_gold_static", "gold_static")
		Parallax.push(nil, 30)
	end
end


--Parallax Background Functions.

function bg_set_worlddeath()
	mountain = Parallax.getBankTemplate()
	mountain.id = "mountain"
	mountain.layers={
		{id = "cracked1", path = "mods/abyssal_glare/files/bg_gfx/bgs/parallax_cracked_01.png",
		speed_x = 0.002 ,offset_y = 0.1,  depth = 0.99, sky_blend = 0.2, sky_index = 3
		},
	 	{id = "mountain1", path = "mods/abyssal_glare/files/bg_gfx/bgs/parallax_mountains_01.png",
			offset_y = 0.3894, depth = 0.94, sky_blend = 1.0, sky_index = 1,
		},
		{id = "clound1", path = "mods/abyssal_glare/files/bg_gfx/bgs/parallax_clounds_02.png",
			offset_y = 0.3894, depth = 0.9, sky_blend = 1.0, sky_index = Parallax.SKY_DEFAULT.CLOUDS_2,
	 	},
		{id = "cracked2", path = "mods/abyssal_glare/files/bg_gfx/bgs/parallax_cracked_01.png",
			speed_x = 0.01 ,scale = 1 ,offset_y = 0.2,  depth = 0.67853, sky_blend = 0.1, sky_index = 3
		},
		{id = "cracked3", path = "mods/abyssal_glare/files/bg_gfx/bgs/parallax_cracked_01.png",
		 speed_x = -0.02 ,scale = 0.5 ,offset_y = 0.1,  depth = 0.11, sky_blend = 0.1, sky_index = 3
		},
	}
	mountain.sky.path = "mods/abyssal_glare/files/bg_gfx/sky_colors_worlddeath.png"

	Parallax.push(mountain, 300)
end

--[[
	GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/fate_card_generic" , 0, 0)
	GamePlaySound("data/audio/Desktop/Master Bank.bank", "event_cues/midas/create" , 0, 0)
	
	ConvertEverythingToGold( "silver", "silver_static" )
	EntityLoad("mods/abyssal_glare/files/entities/audio/snd_fate_card.xml", 0, 0)
	EntityLoad("mods/abyssal_glare/files/entities/items/books/book_mystery_00.xml", 0, 0)
	EntityLoad("mods/abyssal_glare/files/entities/items/pickups/ampule.xml", 0, -10)
	EntityLoad("data/entities/player.xml", 120, -120)
	EntityLoad("mods/abyssal_glare/files/entities/npc/test.xml", 120, -120)
	EntityLoad("mods/abyssal_glare/files/entities/npc/ag/skyshimmer.xml", 120, -120)
	EntityLoad("mods/abyssal_glare/files/entities/npc/test.xml", 0, 0)
	EntityLoad("mods/abyssal_glare/files/entities/npc/test.xml", 155, -120)
	EntityLoad("mods/abyssal_glare/files/entities/npc/dg.xml", 155, -120)
	EntityLoad("mods/abyssal_glare/files/entities/particles/monolith_statue.xml", 155, -220)
	EntityLoad("mods/abyssal_glare/files/entities/items/pickups/abyssal_gem.xml", 155, -120)
	EntityLoad("mods/abyssal_glare/files/entities/items/pickups/bone_key.xml", 155, -120)
	LoadPixelScene( "mods/abyssal_glare/files/biome_impl/no_material.png", "", 0, 0, "mods/abyssal_glare/bnuy.png", true )
	LoadPixelScene( "mods/abyssal_glare/files/biome_impl/abyssal_glare_terraria_temple_mat.png", "mods/abyssal_glare/files/biome_impl/abyssal_glare_terraria_temple.png", 1024, -1024, "mods/abyssal_glare/files/biome_impl/abyssal_glare_terraria_temple_background.png", true )
		EntityLoad("mods/abyssal_glare/files/entities/items/pickups/essence_abyssal_void.xml", 155, -120)


	local players = EntityGetWithTag("player_unit")
	for k=1,#players
	do local v = players[k]
		EntitySetTransform(v,240,-100)
	end

  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_demo.png","data/biome/_pixel_scenes.xml")
  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_ea.png","data/biome/_pixel_scenes.xml")
  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_boss.png","data/biome/_pixel_scenes.xml")
  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_crypt.png","data/biome/_pixel_scenes.xml")
  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_lab.png","data/biome/_pixel_scenes.xml")
  	BiomeMapLoad_KeepPlayer("data/biome_impl/biome_map_metagame.png","data/biome/_pixel_scenes.xml")
--]]










--This should register our audio!
print("ABYSSAL_GLARE: Added our audio!")

---M: Seeker of Knowledge...
---You walk a path toward illumination.

---∅: And what comes of light that burns too long?

---∅: There is freedom beyond form.
---∅: Not all who break the Cycle are lost.
---∅: Some are freed.


ModRegisterAudioEventMappings("mods/abyssal_glare/files/audio/audio_events.txt")