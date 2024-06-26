local World = {}
World.__index = World

local Hitbox = require 'src.Components.Modules.Objects.Hitboxes'

local function _debugPrint(twoDArray)
    for i = 1, #twoDArray do
        for j = 1, #twoDArray[i] do
            io.write(twoDArray[i][j] .. ", ")
        end
        io.write("\n")
    end
end

local function _loadTilesets(_filename, _fw, _fh)
    local img, quads = love.graphics.newImage(_filename), {}

    for y = 1, img:getHeight() / _fh, 1 do
        for x = 1, img:getWidth() / _fw, 1 do
            table.insert(quads, love.graphics.newQuad((x - 1) * _fw, (y - 1) * _fh, _fw, _fh, img:getWidth(), img:getHeight()))
        end
    end

    return {
        sheet = img,
        quads = quads
    }
end

local function _convertColor(_h)
    local a, r, g, b = _h:match("#(%x%x)(%x%x)(%x%x)(%x%x)")
    a = tonumber(a, 16) / 0xff
    r = tonumber(r, 16) / 0xff
    g = tonumber(g, 16) / 0xff
    b = tonumber(b, 16) / 0xff
    return {r, g, b, a}
end

local function _getTileByName(_tileset, _name)
    local startGID = _tileset.firstgid

    for _, tile in pairs(_tileset.tiles) do
        if tile.properties["name"] == _name then
            return tile
        end
    end
end

local function _new(_filename)
    local self = setmetatable({}, World)
    self.data = {}
    self.meta = {
        color = {},
        tileW = 0,
        tileH = 0,
        tileData = {}
    }
    self.assets = {
        bg = nil,
        batches = {},
        quads = {},
        imgs = {},
        elements = {
            hitboxes = {},
            objects = {}
        }
    }

    --% Load the file %--
    assert(love.filesystem.getInfo(_filename) ~= nil, "[ERROR] : Invalid filename, please insert a valid lua exported tiled file")
    local tiledMap = require((_filename:gsub("/", "."):gsub(".lua", "")))

    local bgID = tiledMap.properties["background id"] <= 9 and "0" .. tostring(tiledMap.properties["background id"]) or tostring(tiledMap.properties["background id"])
    self.assets.bg = love.graphics.newImage("assets/images/Backgrounds/gameBG" .. bgID .. ".png")
    self.meta.color = _convertColor(tiledMap.properties["level color"])

    local tilesetQuads = {}
    for t = 1, #tiledMap.tilesets, 1 do
        local filename = tiledMap.tilesets[t].image:match("[^/]+$")
        local tw, th = tiledMap.tilesets[t].tilewidth, tiledMap.tilesets[t].tileheight
        self.meta.tileW, self.meta.tileH = tw, th
        local tilesetData = _loadTilesets("assets/images/" .. filename, tw, th)
        table.insert(tilesetQuads, tilesetData.quads)
        table.insert(self.assets.batches, love.graphics.newSpriteBatch(tilesetData.sheet, nil, "static"))
    end
    for _, ts in pairs(tiledMap.tilesets) do
        for _, t in ipairs(ts.tiles) do
            table.insert(self.meta.tileData, {
                id = #self.meta.tileData + 1,
                hitbox = {
                    active = t.properties["hitbox"],
                    offsetX = t.properties["offsetX"],
                    offsetY = t.properties["offsetY"],
                    w = t.properties["w"],
                    h = t.properties["h"]
                },
                special = t.properties["special"],
                visible = t.properties["visible"]
            })
        end
    end
    self.assets.quads = lume.concat(unpack(tilesetQuads))

    self:construct(tiledMap.layers[1])
    self:recompile()
    
    return self
end

function World:construct(_data)
    -- get all the chunks and convert to a format that we can work --
    local convertedChunks = {}
    for _, chunk in pairs(_data.chunks) do
        local chunkData = {}
        chunkData.data = {}
        chunkData.meta = {}
        chunkData.meta.x, chunkData.meta.y, chunkData.meta.w, chunkData.meta.h = chunk.x, chunk.y, chunk.width, chunk.height

        for y = 1, math.ceil(#chunk.data / chunk.width), 1 do
            chunkData.data[y] = {}
            for x = 1, chunk.height, 1 do
                chunkData.data[y][x] = chunk.data[(y - 1) * chunk.width + x]
            end
        end
        table.insert(convertedChunks, chunkData)
    end

    self.data = convertedChunks
end

function World:recompile()
    for _, b in pairs(self.assets.batches) do
        b:clear()
    end
    lume.clear(self.assets.elements.hitboxes)
    for _, chunk in ipairs(self.data) do
        for y = 1, chunk.meta.h, 1 do
            for x = 1, chunk.meta.w, 1 do
                local setID = chunk.data[y][x] >= 15 and 2 or 1
                if chunk.data[y][x] > 0 then
                    if self.meta.tileData[chunk.data[y][x]].visible then
                        self.assets.batches[setID]:add(self.assets.quads[chunk.data[y][x]], chunk.meta.x + x * self.meta.tileW, chunk.meta.y + y * self.meta.tileH)
                    end
                end
            end 
        end 
    end
end

function World:addHitboxes()
    for _, chunk in ipairs(self.data) do
        for y = 1, chunk.meta.h, 1 do
            for x = 1, chunk.meta.w, 1 do
                if chunk.data[y][x] > 0 then
                    local t = self.meta.tileData[chunk.data[y][x]]
                    if t and t.hitbox.active then
                        table.insert(self.assets.elements.hitboxes, hitbox(
                            (t.id >= 15 and "object" or "tile"),
                            (chunk.meta.x + x * self.meta.tileW) + t.hitbox.offsetX,
                            (chunk.meta.y + y * self.meta.tileH) + t.hitbox.offsetY,
                            t.hitbox.w, t.hitbox.h
                        ))
                    end
                end
            end 
        end 
    end
end

function World:draw()
    --love.graphics.draw(self.assets.bg, nxCam.x / 0.5, nxCam.y / 0.5, 0, 1, 1)
    for _, batches in pairs(self.assets.batches) do
        love.graphics.draw(batches)
    end
    for _, h in ipairs(map.assets.elements.hitboxes) do
        h:draw()
    end
end

function World:update(elapsed)
    nxCam.cam:lookAt(nxCam.camFocusObj.x, nxCam.camFocusObj.y)
end

return setmetatable(World, { __call = function(_, ...) return _new(...) end })