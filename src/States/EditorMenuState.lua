EditorMenuState = {}

function EditorMenuState:enter()
    levelController = require 'src.Components.Modules.Game.Menus.EditorLevelsController'

    effect = moonshine(moonshine.effects.crt)
    .chain(moonshine.effects.glow)
    .chain(moonshine.effects.scanlines)
    effect.scanlines.opacity = 0.6
    effect.glow.min_luma = 0.2

    local termFont = fontcache.getFont("compaqthin", 18)
    termview = terminal(love.graphics.getWidth(), love.graphics.getHeight(), termFont)
    termview.speed = 5000

    print(termview.width, termview.height)

    termview:frameShadow("block", 1, 1, termview.width, termview.height, "brightWhite", "brightBlack")
    controller = levelController(termview, 2, 2, termview.width - 2, termview.height - 2)

    controller:compose()
end

function EditorMenuState:draw()
    effect(function()
        local scale = 1
        local scaleX, scaleY = (love.graphics.getWidth() / termview.canvas:getWidth()) * scale, (love.graphics.getHeight() / termview.canvas:getHeight()) * scale
        love.graphics.push()
            love.graphics.translate((love.graphics.getWidth() * (1 - scale)) / 2, (love.graphics.getHeight() * (1 - scale)) / 2)
            love.graphics.scale(scaleX, scaleY)
            termview:draw()
        love.graphics.pop()
    end)
end

function EditorMenuState:update(elapsed)
    termview:update(elapsed)
end

function EditorMenuState:keypressed(k)
    controller:updateKeyboard(k)
end

return EditorMenuState