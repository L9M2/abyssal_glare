function biome_entered( new_biome_name, old_biome_name )

dofile_once("mods/abyssal_glare/files/script/util.lua")
dofile_once("data/scripts/lib/utilities.lua")


--This should let the player not die when in our biome.
--Need to fix the health logic though, since certain 'instant death' properties break the health
--This a better version for when I introduce multiple biomes.
--Bit hacky, but the return condition is a MUST! We need to abort as soon as a match is found.
--i.g. to do: Fix Negative health = Invincible
local BM = {
"$biome_abyssal_glare_crystal",
"$biome_abyssal_glare_crystal_border",
"$biome_abyssal_glare_maze",
"$biome_abyssal_glare_portalroom",
"$biome_abyssal_glare_hills"
}

for i, biome in ipairs(BM) do

		if biome == (new_biome_name) then
			GlobalsSetValue(PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE, "1")
			EntitySetValue(player, "DamageModelComponent", "wait_for_kill_flag_on_death", true)
			return
		else
			if biome ~= (new_biome_name) then
			GlobalsSetValue(PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE, "0")
			EntitySetValue(player, "DamageModelComponent", "wait_for_kill_flag_on_death", false)
				end
			end
		end
end
