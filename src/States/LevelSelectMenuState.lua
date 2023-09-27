levelselectmenustate = {}

function levelselectmenustate:enter()
    button = require 'src.Components.Button'

    effect = moonshine(moonshine.effects.glow)
    mapMetaData = json.decode(love.filesystem.read("resources/data/MapsGD.json"))
    levelID = 1
    quicksandmedium = love.graphics.newFont("resources/fonts/quicksand-medium.ttf", 50)
    arrowsImage, arrowsQuads = love.graphics.getQuads("resources/images/arrows")

    leftArrow = button.newStatic(30, love.graphics.getHeight() / 2)
    leftArrow.w = 64
    leftArrow.h = 64

    rightArrow = button.newStatic(love.graphics.getWidth() - 30, love.graphics.getHeight() / 2)
    rightArrow.w = 64
    rightArrow.h = 64
end

function levelselectmenustate:draw()
    effect(function()
        love.graphics.setLineWidth(5)
        love.graphics.rectangle("line", 200, 100, love.graphics.getWidth() - 400, 400, 12, 12)
        love.graphics.setLineWidth(1)
        love.graphics.print(mapMetaData.maps[levelID].name, quicksandmedium, love.graphics.getWidth() / 2 - quicksandmedium:getWidth(mapMetaData.maps[levelID].name) / 2, 200)
    end)
    love.graphics.draw(arrowsImage, arrowsQuads[2], 30, love.graphics.getHeight() / 2, 0, 1, 1, 32, 32)
    love.graphics.draw(arrowsImage, arrowsQuads[1], love.graphics.getWidth() - 30, love.graphics.getHeight() / 2, 0, 1, 1, 32, 32)
    leftArrow:draw()
    rightArrow:draw()
end

function levelselectmenustate:update(elapsed)
    if levelID < 1 then
        levelID = 1
    end
    if levelID > #mapMetaData.maps then
        levelID = #mapMetaData.maps
    end
end

function levelselectmenustate:mousepressed(x, y, button)
    if leftArrow:mousepressed(x, y, button) then
        levelID = levelID - 1
    end
    if rightArrow:mousepressed(x, y, button) then
        levelID = levelID + 1
    end
end

return levelselectmenustate