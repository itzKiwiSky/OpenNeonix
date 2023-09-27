playroomstate = {}

playroomstate.currentLevel = 1

function playroomstate:enter()
    playerPlatform = require 'src.Components.PlayerPlataform'

    cam = camera()

    world = windfield.newWorld(0, 1000)
    world:addCollisionClass("Player")
    world:addCollisionClass("Block")
    world:addCollisionClass("Spike")

    mapMetaData = json.decode(love.filesystem.read("resources/data/MapsPlataform.json"))

    blocks = {}
    spikes = {}

    allowedIDs = {1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 24}
    spikeIDs = {20, 21, 22, 23}

    if not map then
        map = cartographer.load("resources/data/maps/" .. mapMetaData.maps[playstate.currentLevel].mapData)
    end
    if not mapSong then
        mapSong = love.audio.newSource("resources/sounds/" .. mapMetaData.maps[playstate.currentLevel].songFile, "static")
    end
    mapSong:stop()
    mapSong:play()

    for _, gid, _, _, pixelX, pixelY in map.layers["tiles"]:getTiles() do
        for id = 1, #allowedIDs, 1 do
            if gid == allowedIDs[id] then
                local block = world:newRectangleCollider(pixelX, pixelY, 32, 32)
                block:setType("static")
                block:setCollisionClass("Block")
                table.insert(blocks, block)
            end
        end
        for id = 1, #spikeIDs, 1 do
            if gid == spikeIDs[id] then
                local spike = world:newRectangleCollider(pixelX + 8, pixelY + 8, 16, 16)
                spike:setType("static")
                spike:setCollisionClass("Spike")
                table.insert(spikes, spike)
            end
        end
    end

    playerPlatform:new(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y)
    scroll = object.new(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y, {scrollX = 0, scrollY = 0})
    scroll.meta.displayHitbox = true
    scroll:loadGraphic("resources/images/player.png")
    scroll.hitbox.w = 32
    scroll.hitbox.h = 32
    scroll.properties.scrollX = scroll.x
    scroll.properties.scrollY = scroll.y
end

function playroomstate:draw()
    cam:attach()
        map:draw()
        playerPlatform:draw()
    cam:detach()
end

function playroomstate:update(elapsed)
    local px, py = playerPlatform:getPosition()
    world:update(elapsed)
    playerPlatform:update(elapsed)
    scroll.properties.scrollX = scroll.properties.scrollX - (scroll.properties.scrollX - (px)) * 0.02
    scroll.properties.scrollY = scroll.properties.scrollY - (scroll.properties.scrollY - py) * 0.02
    scroll.x = scroll.properties.scrollX
    scroll.y = scroll.properties.scrollY
    cam:lookAt(scroll.x, scroll.y)
end

return playroomstate