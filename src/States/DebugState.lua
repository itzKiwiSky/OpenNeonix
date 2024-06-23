DebugState = {}

local function _getTileByName(_tileset, _name)
    local startGID = _tileset.firstgid

    for _, tile in pairs(_tileset.tiles) do
        if tile.properties["name"] == _name then
            return tile
        end
    end
end

function DebugState:enter()
    player = require 'src.Components.Modules.Player'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'
    objDef = require 'src.Components.Modules.Objects.ObjectDefinitions'
    nxWorld = require 'src.Components.Modules.Map.World'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'

    nxCam = camera()

    map = nxWorld("assets/data/maps/testMap.lua")
    local ignoredTiles = {
        "speed_up", "speed_down", "start_pos", "end_pos",
        "obj_hide", "obj_show", "particle_emitter",
        "obj_gamemode_cube", "obj_gamemode_float", "obj_gamemode_dart"
    }

    for _, chunk in ipairs(map.data) do
        for y = 1, chunk.meta.h, 1 do
            for x = 1, chunk.meta.w, 1 do
                if chunk.data[y][x] > 0 then
                    --nxWorld.assets.batches[setID]:add(nxWorld.assets.quads[chunk.data[y][x]], chunk.meta.x + x * nxWorld.meta.tileW, chunk.meta.y + y * nxWorld.meta.tileH)
                    local t = map.meta.tileData[chunk.data[y][x]]
                    if t and t.hitbox.active then
                        table.insert(map.assets.elements.hitboxes, hitbox(
                            (t.id >= 15 and "object" or "tile"),
                            (chunk.meta.x + x * map.meta.tileW) + t.hitbox.offsetX,
                            (chunk.meta.y + y * map.meta.tileH) + t.hitbox.offsetY,
                            t.hitbox.w, t.hitbox.h
                        ))
                    end
                end
            end 
        end 
    end
end

function DebugState:draw()
    nxCam:attach()
        map:draw()

        for _, h in ipairs(map.assets.elements.hitboxes) do
            h:draw()
        end
    nxCam:detach()
end

function DebugState:update(elapsed)
    local up, down, left, right = love.keyboard.isDown("w", "up"), love.keyboard.isDown("s", "down"), love.keyboard.isDown("a", "left"), love.keyboard.isDown("d", "right")
    nxCam.y = nxCam.y - (up and 3 or 0)
    nxCam.y = nxCam.y + (down and 3 or 0)
    nxCam.x = nxCam.x - (left and 3 or 0)
    nxCam.x = nxCam.x + (right and 3 or 0)
end

return DebugState