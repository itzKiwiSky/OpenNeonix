return function()
    local file = love.filesystem.getInfo("ApiStuff.json")
    local data = json.decode(file ~= nil and love.filesystem.read("ApiStuff.json") or "{}")
    gamejolt.init(data.gamejolt.gameID, data.gamejolt.gameKey)
end