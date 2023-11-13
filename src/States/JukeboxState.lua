jukeboxstate = {}

function jukeboxstate:enter()
    mapMetaData = json.decode(love.filesystem.read("resources/data/MapsGD.json"))
    quicksandmedium = love.graphics.newFont("resources/fonts/quicksand-medium.ttf", 30)
    songID = 1
    cursorPosition = 60
    effect = moonshine(moonshine.effects.glow)
    for s = 1, #mapMetaData.maps, 1 do
        table.insert(mapMetaData.maps[s], {active = false})
    end
end

function jukeboxstate:draw()
    local txtY = 60
    love.graphics.print("Jukebox", love.graphics.newFont("resources/fonts/quicksand-medium.ttf", 50), 30, 30)
    for s = 1, #mapMetaData.maps, 1 do
        if mapMetaData.maps[s].active then
            effect(function()
                love.graphics.print(mapMetaData.maps[s].name, quicksandmedium, 30, txtY)
            end)
        else
            love.graphics.print(mapMetaData.maps[s].name, quicksandmedium, 30, txtY)
        end
        txtY = txtY + 30
    end
end

function jukeboxstate:update(elapsed)
    
end

function jukeboxstate:keypressed(k)
    if k == "up" then
        
    end
end

return jukeboxstate