preloaderstate = {}

function preloaderstate:enter()
    alien = love.graphics.newFont("resources/fonts/alien.ttf", 100)
    alienMini = love.graphics.newFont("resources/fonts/alien.ttf", 20)
    percentage = 0
    effect = moonshine(moonshine.effects.glow)

    nxstudiosLogo = love.graphics.newImage("resources/images/logoTransparent.png")
    oftStudiosLogo = love.graphics.newImage("resources/images/oft.png")
    gamepad = love.graphics.newImage("resources/images/gamepadicon.png")
end

function preloaderstate:draw()
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 160, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 155, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Neonix!", alien, love.graphics.getWidth() / 2, 150, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 246, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.8, 0.8)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 243, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Zerodown!", alienMini, love.graphics.getWidth() / 2, 240, 0, 1, 1, alien:getWidth("Neonix!") / 2, alien:getHeight() / 2)
    effect(function()
        love.graphics.setLineWidth(2)
        love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - 250, 500, math.floor(500 * (percentage / 100)), 24)
        love.graphics.rectangle("line", love.graphics.getWidth() / 2 - 250, 500, 500, 24)
        love.graphics.setLineWidth(1)
    end)
    love.graphics.draw(nxstudiosLogo, 0, love.graphics.getHeight() - nxstudiosLogo:getHeight() * 0.1, 0, 0.1, 0.1)
    love.graphics.draw(oftStudiosLogo, nxstudiosLogo:getWidth() * 0.1, love.graphics.getHeight() - oftStudiosLogo:getHeight() * 0.7, 0, 0.7, 0.7)
    love.graphics.draw(gamepad, love.graphics.getWidth() - gamepad:getWidth(), love.graphics.getHeight() - gamepad:getHeight())
end

function preloaderstate:update(elapsed)
    percentage = percentage + love.math.random(1, 3)
    if percentage >= 100 then
        gamestate.switch(menustate)
    end
end

return preloaderstate