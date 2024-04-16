-- Synced with magic numbers. Location for spawn. Honestly might change this.
-- not the same as default mountain spawn
--ABYSSAL_GLARE_SPAWN_X = MagicNumbersGetValue("DESIGN_PLAYER_START_POS_X")
--ABYSSAL_GLARE_SPAWN_Y = MagicNumbersGetValue("DESIGN_PLAYER_START_POS_Y")

NOITA_SPAWN_X = 227
NOITA_SPAWN_Y = -85
-- 1/31/2024 -- Removed all the 'what world are we in' crap.
-- The portal jank has been implemented and we don't need no more.

MAP_IMAGE_COORDS = {
	{x=1,y=43}, --Apotheosis
	{x=0,y=43}, --Vanilla
  {x=-10,y=10} --Pillar Spawn
}


--
-- OTHER
--
PLAYER_HAS_DIED = "ABYSSAL_GLARE_PLAYER_HAS_DIED"
FIRST_LOAD_DONE = "ABYSSAL_GLARE_FIRST_LOAD_DONE"
PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE = "ABYSSAL_GLARE_PLAYER_HAS_DIED"

DEFAULTS = {
  [PLAYER_HAS_DIED] = "0",
  [FIRST_LOAD_DONE] = "0",
  [PLAYER_ABYSSAL_GLARE_DEATH_IMMUNE] = "0",
}
