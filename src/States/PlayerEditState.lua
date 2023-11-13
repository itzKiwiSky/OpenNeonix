playereditmenustate = {}

function playereditmenustate:enter()
    button = require 'src.Components.Button'

    _iconID = _SaveData_.playerdata.iconId
    _colorBackID = _SaveData_.playerdata.backColorID
    _colorFrontID = _SaveData_.playerdata.frontColorID

    backButton = button.new("resources/images/backBtn.png", 60, 50)
    backButton.size = 2

    _iconsFrontSheet, _iconsFrontQuads = love.graphics.getQuads("resources/images/playerSheetFront")
    _iconsBackSheet, _iconsBackQuads = love.graphics.getQuads("resources/images/playerSheetBack")
    arrowsImage, arrowsQuads = love.graphics.getQuads("resources/images/arrows")

    --% Interface Stuff %--
    interface = suit.new()
    interface.theme.color = {
        normal   = {
            bg = {0 ,0, 0}, 
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
    
    _iconSelectButtons = {}
    for i = 1, #_iconsBackQuads, 1 do
        local btn = button.newStatic(love.graphics.getWidth() / 2 + i * 64, love.graphics.getHeight() / 2)
        btn.w = 64
        btn.h = 64
        table.insert(_iconSelectButtons, btn)

    end

end

function playereditmenustate:draw()
    interface:draw()
    love.graphics.setColor(0.1, 0.1, 0.1)
        love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 164, love.graphics.getWidth(), 96)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("line", 0, love.graphics.getHeight() - 164, love.graphics.getWidth(), 96)
    for c = 1, #availableColors, 1 do
        love.graphics.setColor(availableColors[c][1] / 255, availableColors[c][2] / 255, availableColors[c][3] / 255)
            love.graphics.rectangle("fill", (c * 32) - 16, love.graphics.getHeight() - 150, 32, 32, 5)
            love.graphics.rectangle("fill", (c * 32) - 16, love.graphics.getHeight() - 110, 32, 32, 5)
        love.graphics.setColor(1, 1, 1, 1)
    end
    backButton:draw()

    for ib = 1, #_iconSelectButtons, 1 do
        _iconSelectButtons[ib]:draw()
    end

    local qx, qy, qw, qh = _iconsFrontQuads[1]:getViewport()

    love.graphics.setColor(availableColors[_colorBackID][1] / 255, availableColors[_colorBackID][2] / 255, availableColors[_colorBackID][3] / 255)
        love.graphics.draw(_iconsBackSheet, _iconsBackQuads[_iconID], love.graphics.getWidth() / 2 - 16, love.graphics.getHeight() / 2 - 160, 0, 5, 5, qw / 2, qh/ 2)
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(availableColors[_colorFrontID][1] / 255, availableColors[_colorFrontID][2] / 255, availableColors[_colorFrontID][3] / 255)
        love.graphics.draw(_iconsFrontSheet, _iconsFrontQuads[_iconID], love.graphics.getWidth() / 2 - 16, love.graphics.getHeight() / 2 - 160, 0, 5, 5, qw / 2, qh / 2)
    love.graphics.setColor(1, 1, 1, 1)
end

function playereditmenustate:update(elapsed)
    for c = 1, #availableColors, 1 do
        if interface:Button("", {id = "colorFrontBtn" .. c, cornerRadius = 5}, (c * 32) - 16, love.graphics.getHeight() - 150, 32, 32).hit then
            _colorFrontID = c
        end
        if interface:Button("", {id = "colorBackBtn" .. c, cornerRadius = 5}, (c * 32) - 16, love.graphics.getHeight() - 110, 32, 32).hit then
            _colorBackID = c
        end
    end


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

    for b = 1, #_iconSelectButtons, 1 do
        if _iconSelectButtons[b]:mousepressed(x, y, button) then
            print("a")
            _iconID = b
        end
    end
end

---------------------------------------------------

function _save()
    _SaveData_.playerdata.frontColorID = _colorFrontID
    _SaveData_.playerdata.backColorID = _colorBackID
    _SaveData_.playerdata.iconId = _iconID
    _saveDataTable()
end

return playereditmenustate