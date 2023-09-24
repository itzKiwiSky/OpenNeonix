menustate = {}

function menustate:enter()
    button = require 'src.Components.Button'
    playerMenu = require 'src.Components.PlayerGDMenu'
    block = require 'src.Components.Block'

    blocks = {}
    jumpObjects = {}

    if not menuSoundAbstraction then
        menuSoundAbstraction = love.audio.newSource("resources/sounds/abstraction.ogg", "static")
    end
    alien = love.graphics.newFont("resources/fonts/alien.ttf", 100)
    alienMini = love.graphics.newFont("resources/fonts/alien.ttf", 20)

    playBtn = button.new("resources/images/playBtn.png", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    playBtn.size = 2
    editPlayerBtn = button.new("resources/images/editPlayerBtn.png", love.graphics.getWidth() / 2 - 300, love.graphics.getHeight() / 2)
    editPlayerBtn.size = 2

    if not menumap then
        local value = love.math.random(1, 2)
        if value == 1 then
            menumap = cartographer.load("resources/data/maps/menu/menu.lua")
        else
            menumap = cartographer.load("resources/data/maps/menu/menu2.lua")
        end
    end

    allowedIDs = {1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 24}

    for _, gid, _, _, pixelX, pixelY in menumap.layers["tiles"]:getTiles() do
        for id = 1, #allowedIDs, 1 do
            if gid == allowedIDs[id] then
                table.insert(blocks, block.new(pixelX, pixelY))
            end
        end
    end

    playerMenu:init(menumap.layers["playerSpawn"].objects[1].x, menumap.layers["playerSpawn"].objects[1].y)
    for o = 1, #menumap.layers["jumpObjects"].objects, 1 do
        table.insert(jumpObjects, object.new(menumap.layers["jumpObjects"].objects[o].x, menumap.layers["jumpObjects"].objects[o].y))
    end
    endBlock = object.new(menumap.layers["playerSpawn"].objects[2].x, menumap.layers["jumpObjects"].objects[2].y)

    effect = moonshine(moonshine.effects.boxblur).chain(moonshine.effects.glow)
    effect.boxblur.radius = {6, 6}
    glowEffect = moonshine(moonshine.effects.glow)

    playerEdit = object.new(love.graphics.getWidth() / 2 - 350, 150)
    playerEdit:loadGraphic("resources/images/player.png")
    playerEdit.sizeX = 2.5
    playerEdit.sizeY = 2.5
    playerEdit:centerOrigin()
end

function menustate:draw()
    effect(function()
        menumap:draw()
        love.graphics.setColor(_SaveData_.playerdata.r / 255, _SaveData_.playerdata.g / 255, _SaveData_.playerdata.b / 255)
        playerMenu:draw()
    end)
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 160, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 155, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 150, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)

    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 241, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 238, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 235, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    playBtn:draw()
    editPlayerBtn:draw()
    glowEffect(function()
        playerEdit:draw()
    end)
end

function menustate:update(elapsed)
    playerEdit.angle = playerEdit.angle - 0.02
    if not menuSoundAbstraction:isPlaying() then
        menuSoundAbstraction:play()
    end
    playerMenu:update(elapsed)
    if playBtn:isHovered() then
        playBtn.size = 2.2
    else
        playBtn.size = 2
    end
    if editPlayerBtn:isHovered() then
        editPlayerBtn.size = 2.2
    else
        editPlayerBtn.size = 2
    end
end

function menustate:mousepressed(x, y, button)
    if playBtn:mousepressed(x, y, button) then
        print("click")
    end
    if editPlayerBtn:mousepressed(x, y, button) then
        gamestate.switch(playereditmenustate)
    end
end

return menustate