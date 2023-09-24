playereditmenustate = {}

function playereditmenustate:enter()
    button = require 'src.Components.Button'

    backButton = button.new("resources/images/backBtn.png", 60, love.graphics.getHeight() - 50)
    backButton.size = 2

    playerEdit = object.new(90, 90)
    playerEdit:loadGraphic("resources/images/player.png")
    playerEdit.sizeX = 3
    playerEdit.sizeY = 3
    playerEdit:centerOrigin()

    --% Interface Stuff %--
    interface = suit.new()
    interface.theme.color = {
        normal   = {
            bg = {1 ,1, 1}, 
            fg = {1, 1, 1}
        },
        hovered  = {
            bg = {0.5, 0.5, 0.5}, 
            fg = {0.5, 0.5, 0.5}
        },
        active   = {
            bg = {0.3, 0.3, 0.3}, 
            fg = {1, 1, 1}
        }
    }

    renderPlayer = {
        r = {value = _SaveData_.playerdata.r or 255, max = 255, min = 0, step = 1},
        g = {value = _SaveData_.playerdata.g or 255, max = 255, min = 0, step = 1},
        b = {value = _SaveData_.playerdata.b or 255, max = 255, min = 0, step = 1},
    }

    effect = moonshine(moonshine.effects.glow)
end

function playereditmenustate:draw()
    love.graphics.setColor(renderPlayer.r.value / 255, renderPlayer.g.value / 255, renderPlayer.b.value / 255)
    effect(function()
        playerEdit:draw()
    end)
    love.graphics.setColor(1, 1, 1)
    backButton:draw()
    interface:draw()
end

function playereditmenustate:update(elapsed)
    playerEdit.angle = playerEdit.angle - 0.04
    interface:Slider(renderPlayer.r, {id = "player_RColor"}, 220, 90, 128, 16)
    interface:Slider(renderPlayer.g, {id = "player_GColor"}, 220, 108, 128, 16)
    interface:Slider(renderPlayer.b, {id = "player_BColor"}, 220, 124, 128, 16)

    interface:Label("Player Color", 165, 60, 200, 20)

    if backButton:isHovered() then
        backButton.size = 2.2
    else
        backButton.size = 2
    end
end

function playereditmenustate:keypressed(k)
    if k == "escape" then
        _save()
        gamestate.switch(menustate)
    end
end

function playereditmenustate:mousepressed(x, y, button)
    if backButton:mousepressed(x, y, button) then
        _save()
        gamestate.switch(menustate)
    end
end

function _save()
    _SaveData_.playerdata = {r = renderPlayer.r.value, g = renderPlayer.g.value, b = renderPlayer.b.value}
    _saveDataTable()
end

return playereditmenustate