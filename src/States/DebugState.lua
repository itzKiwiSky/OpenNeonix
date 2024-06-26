DebugState = {}

function DebugState:enter()
    player = require 'src.Components.Modules.Player.Player'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'
    objDef = require 'src.Components.Modules.Objects.ObjectDefinitions'
    nxWorld = require 'src.Components.Modules.Map.World'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'

    map = nxWorld("assets/data/maps/DebugMap.lua")

    nxCam = {
        cam = camera(),
        camFocusObj = {
            x = 0,
            y = 0,
            w = 32,
            h = 32,
            drawable = love.graphics.newImage("assets/images/icon.png")
        }
    }

    player:init(90, 90)
end

function DebugState:draw()
    nxCam.cam:attach()
        map:draw()
        player:draw()
    nxCam.cam:detach()
end

function DebugState:update(elapsed)
    --map:update(elapsed)

    local up, down, left, right = love.keyboard.isDown("w", "up"), love.keyboard.isDown("s", "down"), love.keyboard.isDown("a", "left"), love.keyboard.isDown("d", "right")
    nxCam.camFocusObj.y = nxCam.camFocusObj.y - (up and 3 or 0)
    nxCam.camFocusObj.y = nxCam.camFocusObj.y + (down and 3 or 0)
    nxCam.camFocusObj.x = nxCam.camFocusObj.x - (left and 3 or 0)
    nxCam.camFocusObj.x = nxCam.camFocusObj.x + (right and 3 or 0)

    player:update(elapsed)
end

return DebugState