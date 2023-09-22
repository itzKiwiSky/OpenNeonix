preloaderstate = {}

function preloaderstate:enter()
    alien = love.graphics.newFont("resources/fonts/alien.ttf", 100)
    percentage = 0
    effect = moonshine(moonshine.effects.glow)
end

function preloaderstate:draw()
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 160, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 155, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 150, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    effect(function()
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - 250, 500, math.floor(500 * (percentage / 100)), 24)
        love.graphics.rectangle("line", love.graphics.getWidth() / 2 - 250, 500, 500, 24)
        love.graphics.setLineWidth(1)
    end)
end

function preloaderstate:update(elapsed)
    
end

return preloaderstate