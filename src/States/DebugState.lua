DebugState = {}

function DebugState:enter()
    player = require 'src.Components.Modules.Player'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'
    objDef = require 'src.Components.Modules.Objects.ObjectDefinitions'
    mapHandler = require 'src.Components.Modules.Map.World'

    cam = camera()

    map = mapHandler()
    map:loadMap("assets/data/maps/testMap.lua")

end

function DebugState:draw()
    cam:attach()
    cam:detach()
end

function DebugState:update(elapsed)

end

return DebugState