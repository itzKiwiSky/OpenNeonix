DebugState = {}

function DebugState:enter()
    entity = require 'src.Components.Modules.Map.Entity'
    player = require 'src.Components.Modules.Player.Player'
    nxWorld = require 'src.Components.Modules.Map.World'

    playMap = nxWorld("assets/data/maps/PlayerTestMap.lua")

    nxCam = {
        cam = camera(),
        camFocusObj = {
            x = love.graphics.getWidth() / 2,
            y = love.graphics.getHeight() / 2,
            w = 32,
            h = 32,
        }
    }

    print(debug.formattable(playMap.assets.elements.hitboxes[1]))

    player = player(90, 90)
end

function DebugState:draw()
    nxCam.cam:attach()
        playMap:draw()
        player:draw()
    nxCam.cam:detach()
end

function DebugState:update(elapsed)
    --local up, down, left, right = love.keyboard.isDown("w", "up"), love.keyboard.isDown("s", "down"), love.keyboard.isDown("a", "left"), love.keyboard.isDown("d", "right")
    --nxCam.camFocusObj.y = nxCam.camFocusObj.y - (up and 3 or 0)
    --nxCam.camFocusObj.y = nxCam.camFocusObj.y + (down and 3 or 0)
    --nxCam.camFocusObj.x = nxCam.camFocusObj.x - (left and 3 or 0)
    --nxCam.camFocusObj.x = nxCam.camFocusObj.x + (right and 3 or 0)

    --nxCam.cam.x = nxCam.camFocusObj.x
    --nxCam.cam.y = nxCam.camFocusObj.y
    player:update(elapsed)
end

function DebugState:keypressed(k)
    player:keypressed(k)
end

function DebugState:wheelmoved(x, y)
    if y < 0 then
        nxCam.cam.scale = nxCam.cam.scale - 0.1
    elseif y > 0 then
        nxCam.cam.scale = nxCam.cam.scale + 0.1
    end
        
end

return DebugState