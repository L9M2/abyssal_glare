---@diagnostic disable: param-type-mismatch
--Just have one file with all effects. Not very clean, could be better, but it does the job.

function fate_card_effect( entity_item, entity_who_picked, name )
	dofile_once("data/scripts/lib/utilities.lua")
	dofile_once("mods/abyssal_glare/files/script/util.lua")
	dofile_once("mods/abyssal_glare/files/script/enums.lua")
	dofile_once("data/scripts/perks/perk.lua")
	local x, y = EntityGetTransform( entity_item )
	local entity_id = GetUpdatedEntityID()
	local this_item = EntityGetName(entity_id)
	local player = entity_who_picked
	local vscomp = get_variable_storage_component(entity_id, "is_gold")
	local gold = ComponentGetValue2(vscomp, "value_bool")


	--3/29/2024: I don't think the tag method is actually needed. We know what the card is due to entity_item.
	--While also getting the item name directly.
	--Benifit: We saved 2 less tags from the 256 tag limit Noita has.

	EntityLoad("data/entities/particles/image_emitters/potion_effect.xml", x, y-12)
		--The Unknown
		if this_item == "abyssal_glare_unknown_fate_card" then
			--Good News: Refresh your spells...
			GameRegenItemActionsInPlayer( entity_who_picked )
			if not gold then
			--Bad News: With the cost being cursed rock being summoned...
			EntityLoad("data/entities/props/crystal_green_effect.xml", x, y-12)
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc", "$abyssal_glare_itemdesc_fc", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			local snd = math.random(1,4)
			if snd == 1 then
				GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/fate_card_generic/create" , x, y)
			elseif snd >= 2 then
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/fate_card_"..(snd-1) , x, y)
			end
		end
		--Blank Card
		if this_item == "abyssal_glare_blank_fate_card" then
			GamePrintImportant("$abyssal_glare_itemtitle_fc", "$abyssal_glare_itemdesc_fc", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			local snd = math.random(1,4)
			if snd == 1 then
				GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/fate_card_generic/create" , x, y)
			elseif snd >= 2 then
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/fate_card_"..(snd-1) , x, y)
			end
		end
		--Kolmisilma
		if this_item == "abyssal_glare_kolmi_fate_card" then
			--To Be Determined...
			print("To Be Determined...")
			GamePrintImportant("$abyssal_glare_itemtitle_fc_kolmi", "$abyssal_glare_itemdesc_fc_kolmi", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/kolmi" , x, y)
		end
		--The Moon
		if this_item == "abyssal_glare_the_moon_fate_card" then
			--Good News: Gives you a Kuu (Moon)...
			EntityLoad("data/entities/items/pickup/moon.xml", x, y-12)	
			if not gold then
			--Bad News: At the cost of causing an earthquake effect...
			EntityLoad("mods/abyssal_glare/files/entities/effects/earthquake_effect.xml", x, y-12)
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_moon", "$abyssal_glare_itemdesc_fc_the_moon", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/moon" , x, y)
		end
		--The Hanged Man
		if this_item == "abyssal_glare_the_hanged_man_fate_card" then
			--Good News: Gives you the waterstone
			EntityLoad("data/entities/items/pickup/waterstone.xml", x, y-20)
			if gold then
			EntityLoad("data/entities/items/pickup/waterstone.xml", x, y-16)
			end
			if not gold then
			--Bad News: Summons a circle of water...
			--EntityLoad("data/entities/projectiles/circle_water.xml", x, y-12)
			--Bad News: Summons a thundercloud...
			EntityLoad("data/entities/projectiles/deck/cloud_thunder.xml", x, y-20)
			end	
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_hanged_man", "$abyssal_glare_itemdesc_fc_the_hanged_man", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")	
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/hanged_man" , x, y)
		end
		--The Magician
		if this_item == "abyssal_glare_the_magician_fate_card" then
			--Good News: Pick a wand perk.
			perk_spawn(x-14, y-10, "FASTER_WANDS")
			perk_spawn(x+14, y-10, "EXTRA_MANA")
			perk_spawn(x, y-10, "EXTRA_SLOTS")
			
			if gold then
			--Lucky News: You can edit wands anywhere.
			perk_spawn(x-28, y-10, "EDIT_WANDS_EVERYWHERE")
			end
			if not gold then
			--Bad News: Gives you Gamble.
				local perk2 = perk_spawn(x, y, "GAMBLE")
				perk_pickup(perk2, entity_who_picked, EntityGetName(perk2), true, false)
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_magician", "$abyssal_glare_itemdesc_fc_the_magician", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/magician" , x, y)
		end
		--The Fool
		if this_item == "abyssal_glare_the_fool_fate_card" then
			--Good News?: Random Teleportation.
				--dofile_once("mods/abyssal_glare/files/script/util.lua")
				local foolteleport = EntityCreateNew()
				EntityAddComponent2(foolteleport, "GameEffectComponent", {
					effect="UNSTABLE_TELEPORTATION",
					frames=60*9,
				})
				EntityAddChild(player, foolteleport)
			
			if not gold then
			--Bad News: You're blind for 9 seconds.
				local foolblindness = EntityCreateNew()
				EntityAddComponent2(foolblindness, "GameEffectComponent", {
					effect="BLINDNESS",
					frames=60*9,
				})
				EntityAddChild(player, foolblindness)
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_fool", "$abyssal_glare_itemdesc_fc_the_fool", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/fool" , x, y)
		end
		--The Empress
		if this_item == "abyssal_glare_the_empress_fate_card" then
			--Beserked/Bloody for 9 seconds.
				local empressbloody = EntityCreateNew()
				EntityAddComponent2(empressbloody, "GameEffectComponent", {
					effect="BLOODY",
					frames=60*9,
				})
				EntityAddChild(player, empressbloody)
				local empressbloody = EntityCreateNew()
				EntityAddComponent2(empressbloody, "GameEffectComponent", {
					effect="BERSERK",
					frames=60*9,
				})
				EntityAddChild(player, empressbloody)
			
			if not gold then
				local empressbloody = EntityCreateNew()
				EntityAddComponent2(empressbloody, "GameEffectComponent", {
					effect="INTERNAL_ICE",
					frames=60*9,
				})
				EntityAddChild(player, empressbloody)
				local empressbloody = EntityCreateNew()
				EntityAddComponent2(empressbloody, "GameEffectComponent", {
					effect="MOVEMENT_SLOWER",
					frames=60*9,
				})
				EntityAddChild(player, empressbloody)
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_empress", "$abyssal_glare_itemdesc_fc_the_empress", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/empress" , x, y)
		end
		--The Hierophant
		if this_item == "abyssal_glare_the_hierophant_fate_card" then
			--Good News: Gives you 2 Health Up's.
			--They're cursed hearts.
			if gold then
			--Temporary, 3 hearts instead
			EntityLoad("data/entities/items/pickup/heart_evil.xml", x-25, y-12)	
			EntityLoad("data/entities/items/pickup/heart_evil.xml", x-50, y-12)	
			EntityLoad("data/entities/items/pickup/heart_evil.xml", x+25, y-12)	
			end
			if not gold then
			EntityLoad("data/entities/items/pickup/heart_evil.xml", x-25, y-12)	
			EntityLoad("data/entities/items/pickup/heart_evil.xml", x+25, y-12)	
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_hierophant", "$abyssal_glare_itemdesc_fc_the_hierophant", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/hierophant" , x, y)
		end
		--The Lovers
		if this_item == "abyssal_glare_the_lovers_fate_card" then
			if gold then
			EntityLoad("data/entities/items/pickup/heart.xml", x-25, y-12)	
			EntityLoad("data/entities/items/pickup/heart.xml", x+50, y-12)	
			EntityLoad("data/entities/items/pickup/heart.xml", x+25, y-12)	
			end
			if not gold then
			EntityLoad("data/entities/items/pickup/heart.xml", x-25, y-12)	
			EntityLoad("data/entities/items/pickup/heart.xml", x+25, y-12)	
			end
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_lovers", "$abyssal_glare_itemdesc_fc_the_lovers", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/lovers" , x, y)
		end
		--The Hermit
		if this_item == "abyssal_glare_the_hermit_fate_card" then
		--Teleports the player to the main world spawn.
			local x, y = get_spawn_position()
			teleport_player(x, y)
			--No Gold version, since this is more a generic teleport.
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_hermit", "$abyssal_glare_itemdesc_fc_the_hermit", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/hermit" , x, y)
		end
		--Pit Boss
		
		if this_item == "abyssal_glare_the_pit_boss_fate_card" then
			--Perhaps spawn a random tiered wand.
			--Gold version should spawn the unlocked spell from them.
			GamePrintImportant("$abyssal_glare_itemtitle_fc_the_pit_boss", "$abyssal_glare_itemdesc_fc_the_pit_boss", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/pit_boss" , x, y)
		end
		--Monolith
		---They included myself Seeker of Knowledge.
		if this_item == "abyssal_glare_monolith_fate_card" then
			--Perhaps spawn a random tiered wand.
			--Gold version should spawn the unlocked spell from them.
			GamePrintImportant("$abyssal_glare_itemtitle_fc_monolith", "$abyssal_glare_itemdesc_fc_monolith", "mods/abyssal_glare/files/ui_gfx/decorations/3piece_fate_card.png")
			GamePlaySound("mods/abyssal_glare/files/audio/audio_abyssal_glare.bank", "fate_cards/cards/monolith" , x, y)
		end
	end
	--EntityLoad("mods/abyssal_glare/files/entities/audio/snd_fate_card.xml", x, y-12)


