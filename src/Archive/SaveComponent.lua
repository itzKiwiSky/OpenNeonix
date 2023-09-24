local save = {}

function save.init()
    local saveFile = love.filesystem.getInfo("data.nxsave")
    if not saveFile then
        saveFile = love.filesystem.newFile("data.nxsave", "w")
        saveFile:write(love.data.compress("string", "zlib", json.encode(_SaveData)))
        saveFile:close()
    end
    save.decodeSave()
end

function save.saveTable()
    local saveFile = love.filesystem.getInfo("data.nxsave")
    if not saveFile then
        save.init()
    end
    love.filesystem.write("data.nxsave", love.data.compress("string", "zlib", json.encode(_SaveData)))
end

function save.decodeSave()
    local saveFile = love.filesystem.getInfo("data.nxsave")
    if not saveFile then
        save.init()
    end
    _SaveData = json.decode(love.data.decompress("string", "zlib", love.filesystem.read("data.nxsave")))
end

return save