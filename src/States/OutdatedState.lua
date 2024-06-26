OutdatedState = {}

function OutdatedState:enter()
    textEffect = moonshine(moonshine.effects.glow)
    textEffect.glow.strength = 9
    f_logo = fontcache.getFont("alien", 110)
    f_warn = fontcache.getFont("dsdigi", 25)

    placeholderWarnText = [[
        Heyo! Your game seems to be outdated!

        You can download the new version at any time, is recommended now.

        Go to the page [ENTER]
        Proceed anyway [ESCAPE]



        Thanks for playing Neonix!
    ]]
        
    sTimer = timer.new()
    ignored = false

    sTimer:after(2, function()
        gamestate.switch(SplashState)
    end)

    nxlogo = love.graphics.newImage("assets/images/logoTransparent.png")
end

function OutdatedState:draw()
    textEffect(function()
        love.graphics.printf("Neonix!", f_logo, 0, 120, love.graphics.getWidth(), "center")
        love.graphics.printf(placeholderWarnText, f_warn, 0, 400, love.graphics.getWidth(), "center")

        love.graphics.draw(nxlogo, 30, (love.graphics.getHeight() - 156), 0, 128 / nxlogo:getWidth(), 128 / nxlogo:getHeight())
    end)
end

function OutdatedState:update(elapsed)
    if ignored then
        sTimer:update(elapsed)
    end
end

function OutdatedState:keypressed(k)
    if k == "return" then
        love.system.openURL("https://github.com/Doge2Dev/OpenNeonix/releases")
        love.event.quit()
    end
    if k == "escape" then
        placeholderWarnText = "\n\nPlease wait..."
        ignored = true
    end
end

return OutdatedState