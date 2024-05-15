local nxml = dofile_once("mods/abyssal_glare/files/script/lib/nxml.lua")
dofile_once("mods/abyssal_glare/files/script/enums.lua")



--dofile_once("mods/abyssal_glare/files/script/enums.lua")
--names = NAMES[1]





function replace_with_my_pixel_scenes()
  print("Appending Monolith pixel scenes")
  --Side note here. This is unimplemented. Mainly due to not adding the scenes yet. This is for scenes not tied to a biome and are used for limited spawned scenes.
  --You could fudge it with other lua code, but this ignores ALL biome placement altogether unless you check for it and places it in the game world so even a restart makes the scenes persist and still generate.
  --Think of it like the Eye Glyphs and Couldron room, or the Gourd Room. They spawn even if you quite and reenter the game and visit the locations.
  --[[
  L9M2:
  Well crud.
  As you can tell. It's way more complex for the pixel scenes themselves than the biomes as it requires more fiddling. This is just the stripped down version.
  Generally it's better to just add it through loading the biome map and with biomes. Examples like the Orb Rooms and Mountain Island are examples of this.
  Pixel Scenes in general in this file are typically far more complicated for complex scenarios and larger scenes, especially if you don't want to make them repeat in parallel worlds.
  
  This is a note left by me for when I eventually get to this, but for now. I might not do it. Especially since it requires working with NXML and other fiddly stuff.
  
  PS:
  Holy Apotheosis. You freaking save the day. I love you. You actually have the solution and even provided an example file. You are AWESOME!.

  PPS:
  You even solved my problem of parallel worlds and even got the stuff done in a way where I wont cry as much.
  --]]



  local appends = {"_pixel_scenes","_pixel_scenes_newgame_plus",}

  for k=1, #appends
  do local v = appends[k];

      local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      local xml = nxml.parse(content)
      xml:first_of("mBufferedPixelScenes"):add_child(nxml.parse(table.concat({[[
      <PixelScene DEBUG_RELOAD_ME="0" clean_area_before="0" pos_x="-16600" pos_y="-6000" skip_biome_checks="1" skip_edge_textures="1"
          material_filename="mods/abyssal_glare/files/biome_impl/no_material.png"
          background_filename="]],MODPATH..tostring(NAMES[1].A1)..tostring(NAMES[1].A2),[[.png"
          colors_filename=""
      ></PixelScene>
      ]]})))
      ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))

      local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      local xml = nxml.parse(content)
      xml:first_of("PixelSceneFiles"):add_child(nxml.parse([[
        <File>mods/abyssal_glare/files/biome_impl/spliced/meteorite.xml</File>
        ]]))
      ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))

      --local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      --local xml = nxml.parse(content)
      --xml:first_of("PixelSceneFiles"):add_child(nxml.parse([[
      --  <PixelScene DEBUG_RELOAD_ME="0" clean_area_before="0" pos_x="10868" pos_y="-150" skip_biome_checks="1" skip_edge_textures="0"
      --    material_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal.png"
      --    background_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_background.png"
      --    colors_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_visual.png"
      --></PixelScene>
      --  ]]))
      --ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))





      --Wand Tinkering Crystal guaranteed spawn at Pyramid
      --local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      --local xml = nxml.parse(content)
      --xml:first_of("mBufferedPixelScenes"):add_child(nxml.parse([[
      --<PixelScene DEBUG_RELOAD_ME="0" clean_area_before="0" pos_x="10868" pos_y="-150" skip_biome_checks="1" skip_edge_textures="0"
      --    material_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal.png"
      --    background_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_background.png"
      --    colors_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_visual.png"
      --></PixelScene>
      --]]))
      --ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))

      --Wand Tinkering Crystal guaranteed spawn (PW East)
      --Here we concatoncate the x position of the pixel scene in the main world with the world length, adding to it for east worlds
      --Here in this example. I modified it so it takes hte biome map width, and adds an entire worlds width to it. Shifting over a PW.
      --local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      --local xml = nxml.parse(content)
      --xml:first_of("mBufferedPixelScenes"):add_child(nxml.parse(table.concat({[[
      --<PixelScene DEBUG_RELOAD_ME="0" clean_area_before="0" pos_x="]],(10868 + width),[[" pos_y="-150" skip_biome_checks="1" skip_edge_textures="0"
      --    material_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal.png"
      --    background_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_background.png"
      --    colors_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_visual.png"
      --></PixelScene>
      --]]})))
      --ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))

      --Wand Tinkering Crystal guaranteed spawn (PW West)
      --And subtracing it for west worlds
      --We also use table.concat here because normal .. concats are famously slow
      --local content = ModTextFileGetContent("data/biome/" .. v .. ".xml")
      --local xml = nxml.parse(content)
      --xml:first_of("mBufferedPixelScenes"):add_child(nxml.parse(table.concat({[[
      --<PixelScene DEBUG_RELOAD_ME="0" clean_area_before="0" pos_x="]],(10868 - width),[[" pos_y="-150" skip_biome_checks="1" skip_edge_textures="0"
      --    material_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal.png"
      --    background_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_background.png"
      --    colors_filename="mods/Apotheosis/files/pixel_scenes/pyramid_wand_crystal/pyramid_wand_crystal_visual.png"
      --></PixelScene>
      --]]})))
      --ModTextFileSetContent("data/biome/" .. v .. ".xml", tostring(xml))

  end

end



--L9M2: So this is my implementation of the biomes. I'll keep this here as an example. If you're using VSCode with the noita stuff, even shows the biome map colors too.

local MYBIOMES = {
  {
    biome_filename="mods/abyssal_glare/files/biome/abyssal_crystal_border.xml",
    height_index="0",
    color="ff0d0912",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/abyssal_crystal.xml",
    height_index="0",
    color="ff0d0911",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/abyssal_crystal_maze.xml",
    height_index="0",
    color="ff0d0913",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/abyssal_glare_portalroom.xml",
    height_index="0",
    color="ff8a3fca",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/foodzone.xml",
    height_index="0",
    color="ff7a8c69",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/foodzone_alt.xml",
    height_index="0",
    color="ff88ad5f",
  },
  {
    biome_filename="mods/abyssal_glare/files/biome/abyssal_pillars.xml",
    height_index="13",
    color="ff1a0911",
  }
}
print("Appended the custom Abyssal Glare biomes.")




function append_custom_biomes()
  local biome_data = ModTextFileGetContent("data/biome/_biomes_all.xml")
  local biomes_xml = nxml.parse(biome_data) --This will fetch the <BiomesToLoad> main body of the xml.

  for i, biome in ipairs(MYBIOMES) do
    biomes_xml:add_child(nxml.new_element("Biome", biome)) --This will a child element <Biome> to the parent <BiomesToLoad> element.
  end
  local biome_data_patched = nxml.tostring(biomes_xml)
  --print(biome_data_patched)
  ModTextFileSetContent("data/biome/_biomes_all.xml", biome_data_patched)
  --L9M2: Me again. Check biome_map_gen_vanilla. I explain that you could theoretically use that to expand the biome map upwards but need to adjust the Y offset.
  --biome_offset_y attribute by default is 14 (Biome Map Pixels from the top) you could just adjust this be higher. If you increase the biome map by 1 pixel, you need to add 1 to this value.
  --I know athere's a lot involved but it's a to not break compatibility with biome map mods. This has been a pain.



end

function adjust_y_offset()
  local biome_data = ModTextFileGetContent("data/biome/_biomes_all.xml")
  local biomes_xml = nxml.parse(biome_data)
--3/22/2024: Guess what? We can adjust the biome_map offset now.
--Though why here? Because we have to actually change this before the biome map is loaded for some reason.

local Abyssal_Glare_YOffset = 0
if ModIsEnabled("Apotheosis") then
	Abyssal_Glare_YOffset = 1
	if Abyssal_Glare_YOffset == 1 then
    --Yeah it's the same as vanilla. For now.
  biomes_xml.attr.biome_offset_y = biomes_xml.attr.biome_offset_y + 2
  print("ABYSSAL GLARE:Apotheosis Installed: Adjusted biome offset.")
  end
end
if ModIsEnabled("raksa") then
	Abyssal_Glare_YOffset = 1
	if Abyssal_Glare_YOffset == 1 then
    --No Changes. It wouldn't make sense to.
	  print("ABYSSAL GLARE:Vanilla biome offset unchanged.")
    biomes_xml.attr.biome_offset_y = biomes_xml.attr.biome_offset_y
	end
end
if ModIsEnabled("nightmare") then
  Abyssal_Glare_YOffset = 1
	if Abyssal_Glare_YOffset == 1 then
    --Yeah it's the same as vanilla. For now.
	  print("ABYSSAL GLARE:Vanilla biome offset unchanged.")
    biomes_xml.attr.biome_offset_y = biomes_xml.attr.biome_offset_y
	end
end
if ModIsEnabled("ethereal_convergence") then
  Abyssal_Glare_YOffset = 1
	if Abyssal_Glare_YOffset == 1 then
    --Yeah it's the same as vanilla. For now.
	  print("ABYSSAL GLARE:Vanilla biome offset unchanged.")
    biomes_xml.attr.biome_offset_y = biomes_xml.attr.biome_offset_y
	end
end


if 	Abyssal_Glare_YOffset == 0 then
  biomes_xml.attr.biome_offset_y = biomes_xml.attr.biome_offset_y + 2
	print("ABYSSAL GLARE:Adjusting vanilla biome offset.")
end
  local biome_offset_patched = nxml.tostring(biomes_xml)
  --print(biome_data_patched)
  ModTextFileSetContent("data/biome/_biomes_all.xml", biome_offset_patched)
end

