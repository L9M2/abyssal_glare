--We need this to override the original width and height of the biome map. Only way, sorry.
--If we don't it erases the biome map and blanks it out. Not ideal.
dofile_once("mods/abyssal_glare/files/script/enums.lua")
local portal = MAP_IMAGE_COORDS[2]
local w, h = BiomeMapGetSize()
local biomemapimage = {} -- Or whatever the table you want to insert into is
local color = 0

local bottomh = 4
local toph = 2
local newh = h+bottomh+toph
if (h >= 48) and (w > 4) then
	--print("ABYSSAL GLARE:Map is of height "..h..", within paremeters.")
	BiomeMapLoadImage( portal.x, portal.y, "mods/abyssal_glare/files/biome_map/biome_map_stitch.png" )
	--print("ABYSSAL GLARE:Applied map changes to coords ("..portal.x..","..portal.y..")")
elseif ((h < 48) and (h > 4)) and (w > 4) then
	--print("ABYSSAL GLARE:Map is of height "..newh..", adjusting portal spawn position.")
	BiomeMapLoadImage( portal.x, h-4, "mods/abyssal_glare/files/biome_map/biome_map_stitch.png" )
	--print("ABYSSAL GLARE:Applied map changes to coords ("..portal.x..","..(h-4)..")")
elseif (h <= 4) or (w <= 4) then
	--print("ABYSSAL GLARE:Aborting map changes. Map too small.")
	--print("ABYSSAL GLARE:This shouldn't happen?")
end


--This stores the biome map into a table.
for y=0,h do 
	for x=0,w do
    color = BiomeMapConvertPixelFromUintToInt(BiomeMapGetPixel(x, y))
	table.insert(biomemapimage, color)
	end
end
--print("ABYSSAL GLARE:Stored original map. Size: "..#biomemapimage)
--print("ABYSSAL GLARE:Original Map size was Width:"..w.." ,Height:"..h.." pixels.")
BiomeMapSetSize(w, newh)
--This now adds what was stored in the table back onto the biome map.
for y=0,h do 
	for x=0,w do
    BiomeMapSetPixel(x, y+toph, biomemapimage[1])
	table.remove(biomemapimage, 1)
	end
end
biomemapimage = {}
--print("ABYSSAL GLARE:Restored map.")
--This extends the bottom of the old map downward.
--You could try this in the upward direction, but keep in mind the origin of the world is based around the top side of the map.
--You need to change the _biomes_all.xml file to change the biome_offset_y variable to account for it.
--Sideways expansion also will have to keep in mind stuff like the music machines and the shadow bosses.
--We need to add the toph to take into account the new top.
for y=0, 4 do
  for x=0, w do
    local color = BiomeMapConvertPixelFromUintToInt(BiomeMapGetPixel(x, h+toph-1))
    BiomeMapSetPixel(x, h+toph+ y, color)
  end
end

--This repeats the top of the biome_map in the upward direction
for y=0, 2 do
	for x=0, w do
	  local color = BiomeMapConvertPixelFromUintToInt(BiomeMapGetPixel(x, toph))
	  BiomeMapSetPixel(x, -y+1, color)
	end
end


local w, h = BiomeMapGetSize()
--print("ABYSSAL GLARE:Map has been extended in the vertical direction. Now "..h.." pixels.")
print("ABYSSAL GLARE:New Map size is Width:"..w.." ,Height:"..h.." pixels.")
--Then after all that. We can add all the biome placement stuff afterwards to the expanded sections.
--What's nice is that it takes into consideration other mods that also make changes using this method as well.
--Since it takes into account the current map when it checks for it and even modded biomes will be changed accordingly, so ideally this has a load dependant order.

--Should be under GOLD
for y=1, (1) do
  for x=0, (3-1) do
    BiomeMapSetPixel(x + 6, (h-4) + y, 0xff7a8c69)
  end
end
for y=1, (3) do
  for x=0, (2) do
    BiomeMapSetPixel(x + 6, (h-4) + y, 0xff88ad5f)
  end
end
BiomeMapSetPixel(4 + 3, (h-4), 0xff7a8c69)
BiomeMapSetPixel(4 + 3, (h-4) + 3, 0xff88ad5f)
local pillars = MAP_IMAGE_COORDS[3]
BiomeMapSetPixel((math.floor((w)/2))+(pillars.x)-2, pillars.y+4, 0xff1a0911)
BiomeMapSetPixel(w-2, h-2, 0xff64458a)