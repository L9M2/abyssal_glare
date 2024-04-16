dofile_once( "data/scripts/lib/utilities.lua" )

local entity_id    = GetUpdatedEntityID()
local x, y, angle = EntityGetTransform( entity_id )

local radius = 48
local default_teleport_radius = 3

angle = 0 - angle

x = x + math.cos( angle ) * default_teleport_radius
y = y - math.sin( angle ) * default_teleport_radius

EntitySetTransform( entity_id, x, y )

--shoot_projectile_from_projectile( entity_id, "data/entities/projectiles/deck/chain_bolt_explosion.xml", x, y, 0, 0 ) 