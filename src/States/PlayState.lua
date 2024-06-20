PlayState = {}

function PlayState:enter()
    player = require 'src.Components.Modules.Player'
    hitbox = require 'src.Components.Modules.Objects.Hitboxes'
    objDef = require 'src.Components.Modules.Objects.ObjectDefinitions'

    map = sti("assets/data/maps/testMap.lua")
    mapMeta = cartographer.load("assets/data/maps/testMap.lua")

    l_tiles = mapMeta.layers["tiles"]
    l_objs = mapMeta.layers["objects"].objects

    --print(debug.formattable(mapMeta.layers["objects"]))

    mapData = {
        tiles = {},
        objs = {},
    }

    local t = lume.concat(objDef.tiles, objDef.objects)

    for _, gid, tx, ty, px, py in l_tiles:getTiles() do
        local o = t[gid]
        print(px, py)
        if o and gid > 0 and gid <= #t then
            table.insert(gid > 14 and mapData.objs or mapData.tiles, hitbox(gid > 14 and "object" or "tile", px + o.offsetX, py + o.offsetY, o.w, o.h))
            if gid == 19 then
                map:setLayerTile("tiles", tx, ty, 0)
            end
        end
    end

    cam = gamera.new(0, 0)

    player = player(120, 90)
end

function PlayState:draw()
    map:draw()
    --player:draw()

    for _, t in pairs(mapData.tiles) do
        love.graphics.setColor("#0000ffff")
            love.graphics.rectangle("line", t.x, t.y, t.w, t.h)
            love.graphics.setColor("#0000ff55")
                love.graphics.rectangle("fill", t.x, t.y, t.w, t.h)
            love.graphics.setColor("#ffffffff")
        love.graphics.setColor("#ffffffff")
    end
    for _, t in pairs(mapData.objs) do
        love.graphics.setColor("#ffff00ff")
            love.graphics.rectangle("line", t.x, t.y, t.w, t.h)
        love.graphics.setColor("#ffff0055")
            love.graphics.rectangle("fill", t.x, t.y, t.w, t.h)
        love.graphics.setColor("#ffffffff")
    love.graphics.setColor("#ffffffff")
    end
end

function PlayState:update(elapsed)
    player:update(elapsed)
end

return PlayState