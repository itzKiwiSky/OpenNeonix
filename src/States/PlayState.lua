playstate = {}

playstate.currentLevel = 1

function playstate:enter()
    spike = require 'src.Components.Spike'
    player = require 'src.Components.PlayerGD'
    block = require 'src.Components.Block'

    effect = moonshine(moonshine.effects.glow)

    --effect.disable("glow")

    mapMetaData = json.decode(love.filesystem.read("resources/data/Maps.json"))

    spikes = {}
    blocks = {}

    if not map then
        map = cartographer.load("resources/data/maps/" .. mapMetaData.maps[playstate.currentLevel].mapData)
    end
    if not mapSong then
        mapSong = love.audio.newSource("resources/sounds/" .. mapMetaData.maps[playstate.currentLevel].songFile, "static")
    end
    mapSong:stop()
    mapSong:play()

    cam = camera(0, 0)
    cam:zoomTo(1.5)

    allowedIDs = {1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 24}
    spikeIDs = {20, 21, 22, 23}

    for _, gid, _, _, pixelX, pixelY in map.layers["tiles"]:getTiles() do
        for id = 1, #allowedIDs, 1 do
            if gid == allowedIDs[id] then
                table.insert(blocks, block.new(pixelX, pixelY))
            end
        end
        for id = 1, #spikeIDs, 1 do
            if gid == spikeIDs[id] then
                table.insert(spikes, spike.new(pixelX, pixelY))
            end
        end
    end

    player:init(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y)
    scroll = object.new(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y, {scrollX = 0, scrollY = 0})
    scroll.meta.displayHitbox = true
    scroll.hitbox.w = 32
    scroll.hitbox.h = 32
    scroll.properties.scrollX = scroll.x
    scroll.properties.scrollY = scroll.y
end

function playstate:draw()
    effect(function()
        cam:attach()
            map:draw()
            player:draw()
        cam:detach()
    end)
end

function playstate:update(elapsed)
    map:update(elapsed)
    player:update(elapsed)
    scroll.properties.scrollX = scroll.properties.scrollX - (scroll.properties.scrollX - (player.x + 300)) * 0.02
    scroll.properties.scrollY = scroll.properties.scrollY - (scroll.properties.scrollY - player.y) * 0.02
    scroll.x = scroll.properties.scrollX
    scroll.y = scroll.properties.scrollY
    cam:lookAt(scroll.x, scroll.y)
end

return playstate