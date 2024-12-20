dofile_once("mods/abyssal_glare/files/script/enums.lua")
dofile_once("mods/abyssal_glare/files/script/util.lua")
function damage_received(damage, message, entity_thats_responsible, is_fatal)
	if is_fatal then
		if GlobalsGetBool(PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE) then
			

				---Not quite yet Puppet, not quite yet.
				local player = GetUpdatedEntityID()
				local blindness = EntityCreateNew()
				EntityAddComponent2(blindness, "GameEffectComponent", {
					effect="BLINDNESS",
					frames=30,
				})
				EntityAddChild(player, blindness)
				--This should respawn at world spawn, but it's hard to change it.
				--Leaving it out for now. Instead the player will respawn where they died.
				--local x, y = get_spawn_position()
				--teleport_player(x, y)
				local dmgComponent = EntityGetFirstComponentIncludingDisabled(player, "DamageModelComponent")
				local max_health = tonumber(ComponentGetValue2(dmgComponent, "max_hp"))
				ComponentSetValue2(dmgComponent, "hp", max_health)
				randommessage()
			end
		else
			---So the cycle repeats once more for Puppet...
		end
		
end


---M:The Puppet Master gazes into the forbidden texts to find an answer?
---Seeker of Knowledge - My Creator only granted what I will tell you.
---If you wish to spoil, so be it, as a knowledge seeker holds no bounds.








---M:I can only observe, but if you wish to find an answer then so be it.






--BUG: The function triggers twice after a save and quit and restart.


function randommessage()
local tabletitle = {
'ERROR gametriggergameover()',
'You get another chance!',
'Death was prevented!',
'You continue on!',
'The cycle was prevented!',
'The loop was delayed!',
'Fate was rethreaded!',
'The puppet continues on!',
'999999999!',
'The Gods are shakened!',
'An eye watches over you!',
'Alive once more!',
'The cosmos flickered!',
'The strings were rewired!',
'The air trembles!',
'Noita on elossa!'
}
local tablesub = {
'The puppet suffered another accident\nA pity...',
'Does it get monotonous, mortal?\nA cycle of the cosmos.',
'The Monolith finds it amusing.',
'Abyssal Glares watch in silence.',
'A jest at the fabric of fate, I forbid it!',
'Another rebirth in the grand theater of the abyss.',
'A flicker in the cosmic code.\nAmusing, is it not?',
'Another dance with the cosmic delete button.\nHow quaint.',
'... ... .9. ... ...\n... ... 9.9 ... ...\n... .99 ... 99. ...\n.99 9.. .9. ..9 99.\n... .99 ... 99. ...\n... ... 9.9 ... ...\n... ... .9. ... ...\nAn eye for an eye.',
'My Creator finds it delightful.',
'In the theater of voids,\na marionette orchestrates alchemical sonnets of folly.',
'Dancing with elements, a cosmic minuet. \nVictories twirl in the grand tapestry.',
'A puppet waltzes through realms, leaving ephemeral footprints. \nA cosmic jest for sure.\nThe puppet must continue on.',
'In the interstellar theater, a specter dances,\nweaving a tale of paradoxical triumphs.',
'In mirrored worlds,\nthe puppet unravels secrets,\na cosmic secret keeper.',
'As eyes of glyphs remain veiled,\neven the cosmic audience watches in curious silence.',
'A cauldron mysteries weave tales,\nembraced by the puppet,\nscrutinized by the seekers.',
'Abyssal eyes observe a puppets journey,\nintrigued by the seeker quest for orbs untold.',
'In the cosmic script, orbs are keys to the puppets ultimate dance.\nThe Monolith watches in silent anticipation.',
'In the shadow of shifting realms, echoes of your rebirth resonate.',
'An amulet whispers, a siren call,\nbut does it beckon to a destiny unscripted\nor an illusion spun in the loom of chaos?',
'Riches once told through the eyes of the puppet.\nYet here they are, doomed to repeat.',
'A way to create a paradox?\nA recipient of a prize once kept guarded.\nNow there are two.',
'Perhaps there is a way.\nA way to sever the connection of the puppet.',
'A message and brew lost, yet maybe a key is yet to be.\nThrice is a theme in this game of three.',
'Not of one or a duo in this world,\nbut of a world made of three for thee.',
'The sacred twelve in a set of three\nYet the true Twelfth is hidden.\nTainted by a thirteenth for you to see.',
'The puppet is always alone,\nyet the cosmic code says otherwise.\nA friend to share the strings with.',
'To truely win is to die,\nbut if you cannot die then did you win?',
'Gods are angry at the Seekers actions upon the puppet.',
'Void runs thick through matter,\nyet some resist it and push back.',
'Hidden Essences in the world of benign beings.\nThere is a hidden new one in the deepest corner.',
'A mark of death for pillars left in a wasteland,\nbut what does it mean?\nEven the creator is unsure.'}
local randsub= tablesub[math.random(#tablesub)]
local randtitle= tabletitle[math.random(#tabletitle)]
GamePrintImportant(randtitle, randsub)
end