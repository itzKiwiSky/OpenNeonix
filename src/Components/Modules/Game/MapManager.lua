local MapManager = {}

MapManager.maps = {}

function MapManager.register(_name, _difficulty, _filename)
    table.insert(MapManager.maps, {
        name = _name,
        _difficulty = _difficulty,
        file = _filename,
    })
end

function MapManager.load(_name)
    
end

return MapManager