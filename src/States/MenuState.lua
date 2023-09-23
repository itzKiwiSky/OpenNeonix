menustate = {}

function menustate:enter()
    button = require 'src.Components.Button'

    menuSoundAbstraction = love.audio.newSource("resources/sounds/abstraction.ogg", "static")
    alien = love.graphics.newFont("resources/fonts/alien.ttf", 100)

    playBtn = button.new("resources/images/playBtn.png", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    playBtn.size = 2
end

function menustate:draw()
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 160, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 155, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 150, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    playBtn:draw()
end

function menustate:update(elapsed)
    if not menuSoundAbstraction:isPlaying() then
        menuSoundAbstraction:play()
    end
    playBtn:isHovered(love.mouse.getX(), love.mouse.getY(), 
    function()
        playBtn.size = 2.5
    end,
    function()
        playBtn.size = 2
    end
    )
end

function menustate:mousepressed(x, y, button)
    
end

return menustate