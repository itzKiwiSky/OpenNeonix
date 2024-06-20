---@class World
local World = {}
World.__index = World

local function getTileset(_filename, _fw, _fh)
    local img, quads = nil, {}
    img = love.graphics.newImage("assets/images/" .. _filename)
    
    for y = 0, img:getHeight(), _fh do
        for y = 0, img:getWidth(), _fw do
            table.insert(quads, love.graphics.newQuad(x, y, _fw, _fh, img))
        end
    end

    return img, quads
end

--- Constructor for world
local function _new(...)
    local self = setmetatable({}, World)
    self.worldData = {
        tilesets = {},
        data = {
            map = {},
            batches = {}
        },
        meta = {}
    }
    return self
end

--- Load a new tiled file (.json)
---@param _filename string
---@param _tilesetImages table
---@return nil
function World:loadMap(_filename)
    assert(type(_filename) == "string", "[ERROR] : Invalid type, must be 'string'")

    -- ../.. <-- gambs --

    local tiledMapData = require((_filename:gsub("/", "%.")):gsub(".lua", ""))
    self.meta.room = {
        width = tiledMapData.properties["room width"],
        height = tiledMapData.properties["room height"],
    }

    -- load tilesets --
    for t = 1, #tiledMapData.tilesets, 1 do
        local tilesetData = tiledMapData.tilesets[t]
        local blockset = {}
        local imgFilename = tilesetData.image:match("[^/]+$")
        blockset.img, blockset.quads = getTileset("assets/images/" .. imgFilename, tilesetData.tilewidth, tilesetData.tileheight)
        blockset.meta  = {
            startGID = tilesetData.firstgid
        }
        table.insert(self.tilesets, blockset)
    end

    -- load batches --
    for b = 1, #self.tilesets, 1 do
        table.insert(self.data.batches, love.graphics.newSpriteBatch(self.tilesets[b].img))
    end

    local id = tiledMapData.properties["background id"] <= 9 and "0" .. tostring(tiledMapData.properties["background id"]) or tostring(tiledMapData.properties["background id"])
    self.meta.bg = love.graphics.newImage("assets/images/Backgrounds/gameBG" .. id .. ".png")

    -- now CREATE THE MAP SHIIIIITTTTT!!!!!!!!!!!!!!!!!!!!!!! --
    self:recompileMap()
end

function World:recompileMap()
    
end

--- Add a table with collision definition for each tile, and return a collision function
---@param _map table
---@return function
function World:addHitboxMap(_map)
    
end

--- Draw the world
function World:draw()
    love.graphics.draw()
end

function World:update(elapsed)
    
end

return setmetatable(World, { __call = function(_, ...) return _new(...) end })