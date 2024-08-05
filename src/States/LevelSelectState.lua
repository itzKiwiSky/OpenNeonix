LevelSelectState = {}

function LevelSelectState:enter()
    effect = moonshine(moonshine.effects.crt)
    .chain(moonshine.effects.glow)
    .chain(moonshine.effects.scanlines)

    bootsfx = love.audio.newSource("assets/sounds/bootsfx.ogg", "static")
    bootbeep = love.audio.newSource("assets/sounds/beepBoot.ogg", "static")
    if not menumain then
        menumain = love.audio.newSource("assets/sounds/tracks/future_base.ogg", "static")
    end

    if not menumain:isPlaying() then
        menumain:play()
    end

    local termFont = fontcache.getFont("compaqthin", 8)
    termview = terminal(love.graphics.getWidth(), love.graphics.getHeight(), termFont)
    termview.speed = 50000

    print(termview.width, termview.height)

    termview:hideCursor()
end

function LevelSelectState:draw()
    effect(function()
        do
            local scale = 1
            local scaleX, scaleY = (love.graphics.getWidth() / termview.canvas:getWidth()) * scale, (love.graphics.getHeight() / termview.canvas:getHeight()) * scale
            love.graphics.push()
                love.graphics.translate((love.graphics.getWidth() * (1 - scale)) / 2, (love.graphics.getHeight() * (1 - scale)) / 2)
                love.graphics.scale(scaleX, scaleY)
                termview:draw()
            love.graphics.pop()
        end
    end)
end

function LevelSelectState:update(elapsed)
    termview:update(elapsed)
end

return LevelSelectState