SplashState = {}

function SplashState:enter()
    effect = moonshine(moonshine.effects.scanlines)
    .chain(moonshine.effects.crt)
    .chain(moonshine.effects.glow)
    effect.scanlines.opacity = 0.4
    effect.glow.min_luma = 0.2

    --effect.disable("glow", "scanlines", "crt")

    local termFont = fontcache.getFont("ibmvga", 24)
    termview = terminal(love.graphics.getWidth(), love.graphics.getHeight(), termFont)
    termview:setCursorBackColor(terminal.schemes.basic["black"])
    termview:setCursorColor(terminal.schemes.basic["white"])
    termview:clear(1, 1, termview.width, termview.height)

    termview:print("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sed ex justo. Phasellus pretium maximus ex, at condimentum ex hendrerit vitae. Nulla lorem urna, ultricies in urna id, mattis sollicitudin lacus. Ut vestibulum et velit in euismod. Aliquam eget velit placerat, finibus nisi dapibus, pulvinar odio. Quisque sit amet tellus facilisis eros porttitor maximus quis id sapien. Sed tempus eros turpis, eget ullamcorper dui hendrerit id. Aliquam tristique sed ante eu tempus. Duis a libero vel lacus ultrices gravida quis a nulla. Pellentesque quis elit at odio fermentum vehicula. Nunc ut aliquet metus. In ac lectus convallis, suscipit leo quis, mollis justo. Aenean aliquet a quam a fringilla. Nunc condimentum consectetur sodales. ")
end

function SplashState:draw()
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

function SplashState:update(elapsed)
    termview:update(elapsed)
end

return SplashState