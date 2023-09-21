playstate = {}

playstate.currentLevel = "dubnix"

function playstate:enter()
    spike = require 'src.Components.Spike'
    player = require 'src.Components.Player'
    block = require 'src.Components.Block'

    spikes = {}
    blocks = {}

    map = cartographer.load("resources/data/maps/" .. playstate.currentLevel .. ".lua")
    cam = camera(0, 0)

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

    player:init(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y - 90)
end

function playstate:draw()
    cam:attach()
        map:draw()
        for _, spike in ipairs(spikes) do
            spike:drawHitbox()
        end
        for _, block in ipairs(blocks) do
            block:drawHitbox()
        end
        player:draw()
    cam:detach()
end

function playstate:update(elapsed)
    map:update(elapsed)
    player:update(elapsed)
end

return playstate