-- constants (color format is ARGB)
dofile_once("data/scripts/lib/utilities.lua")
 --31/01/2024 Conga: changed print_errors to print
local w = 18
local h = 18
BiomeMapSetSize( w, h )
local w, h = BiomeMapGetSize()
--Our Main map.
print("ABYSSAL GLARE:Map size is Width:"..w.." ,Height:"..h.." pixels.")
BiomeMapLoadImage( 0, 0, "mods/abyssal_glare/files/biome_map/biome_map.png" )
print("ABYSSAL GLARE:Biome Map loaded.")

---M:Again Seeker of Knowledge?
---You seem to be wondering about the Puppet-
---Why don't you see for youself Seeker?