local nxml = dofile_once("mods/abyssal_glare/files/script/lib/nxml.lua")
local content = ModTextFileGetContent("data/entities/base_humanoid.xml") 
local xml = nxml.parse(content)
local DMC = xml:first_of("DamageModelComponent")
DMC.attr.materials_that_damage = DMC.attr.materials_that_damage .. ",abyssal_glare_cursed_lava,abyssal_glare_magic_liquid_joylixir,abyssal_glare_magic_liquid_sorrowflux,abyssal_glare_elysian_powder"
DMC.attr.materials_how_much_damage = DMC.attr.materials_how_much_damage .. ",0.007,-0.00001,0.00002,0.003"
ModTextFileSetContent("data/entities/base_humanoid.xml", tostring(xml))