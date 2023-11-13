playstate = {}

playstate.currentLevel = 1

function playstate:enter()
    spike = require 'src.Components.Spike'
    player = require 'src.Components.Player'
    block = require 'src.Components.Block'

    effect = moonshine(moonshine.effects.glow)
    
    mapMetaData = json.decode(love.filesystem.read("resources/data/MapData.json"))

    spikes = {}
    blocks = {}

    if not map then
        map = cartographer.load("resources/data/maps/" .. mapMetaData.maps[playstate.currentLevel].mapData)
    end
    if not mapSong then
        mapSong = love.audio.newSource("resources/sounds/" .. mapMetaData.maps[playstate.currentLevel].songFile, "static")
    end
    if not deathEffect then
        deathEffect = love.audio.newSource("resources/sounds/death.ogg", "static")
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

    --print(debug.getTableContent(map))

    local particle = love.graphics.newImage("resources/images/light.png")
    particle:setFilter("linear", "linear")

    ps = love.graphics.newParticleSystem(particle, 76)
    ps:setColors(1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 0)
    ps:setDirection(-1.6421037912369)
    ps:setEmissionArea("ellipse", 100, 100, 0, false)
    ps:setEmissionRate(76.515960693359)
    ps:setEmitterLifetime(0.14767071604729)
    ps:setInsertMode("top")
    ps:setLinearAcceleration(0, 0, 0, 0)
    ps:setLinearDamping(0, 0)
    ps:setOffset(75, 75)
    ps:setParticleLifetime(0, 4.1809144020081)
    ps:setRadialAcceleration(0, 0)
    ps:setRelativeRotation(true)
    ps:setRotation(-3.1514933109283, 0)
    ps:setSizes(0.40000000596046)
    ps:setSizeVariation(0)
    ps:setSpeed(90, 100)
    ps:setSpin(0.0005130753852427, 0)
    ps:setSpinVariation(0)
    ps:setSpread(6.2831854820251)
    ps:setTangentialAcceleration(0, 0)

    player:init(_SaveData_.playerdata.iconId, map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y)

    scroll = object.new(map.layers["playerSpawn"].objects[1].x, map.layers["playerSpawn"].objects[1].y, {scrollX = 0, scrollY = 0})
    scroll.meta.displayHitbox = true
    scroll.hitbox.w = 32
    scroll.hitbox.h = 32
    scroll.properties.scrollX = scroll.x
    scroll.properties.scrollY = scroll.y

    if not bgMap then
        bgMap = love.graphics.newImage("resources/images/" .. map.properties["backgroundImage"] .. ".png")
    end

    fadeShader = love.graphics.newShader("resources/shaders/fade.glsl")

    fadeShader:send("objectPosition", {scroll.x + 600, scroll.y + 200})
    fadeShader:send("radius", 500)
end

function playstate:draw()
    --love.graphics.setShader(fadeShader)
    love.graphics.draw(bgMap, 0, 0)
        cam:attach()
            --love.graphics.setColor(mapMetaData.maps[playstate.currentLevel].mapColor[1] / 255,mapMetaData.maps[playstate.currentLevel].mapColor[2] / 255,mapMetaData.maps[playstate.currentLevel].mapColor[3] / 255)
                map:draw()
            --love.graphics.setColor(1, 1, 1)
            love.graphics.draw(ps, player.x, player.y)
            player:draw()
            player:drawHitbox()
        cam:detach()
    --love.graphics.setShader()
end

function playstate:update(elapsed)
    map:update(elapsed)
    player:update(elapsed)
    --scroll.properties.scrollX = scroll.properties.scrollX - (scroll.properties.scrollX - (player.x + 300)) * 0.02
    scroll.properties.scrollY = scroll.properties.scrollY - (scroll.properties.scrollY - player.y) * 0.02
    scroll.x = scroll.properties.scrollX
    scroll.y = scroll.properties.scrollY
    cam:lookAt(player.x, scroll.y)
    ps:update(elapsed)
end

return playstate