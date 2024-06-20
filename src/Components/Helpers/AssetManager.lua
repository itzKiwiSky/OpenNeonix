---@class AssetManager
local AssetManager = {}
AssetManager.__index = AssetManager
local preloadScreen = require 'src.Components.Helpers.PreloaderScreen'
local assets = {
    ["kiwiLogo"] = love.graphics.newImage("assets/images/icon.png")
}

local function _new(...)
    local self = setmetatable({}, AssetManager)
    self.paths = {}
    self.cache = {}
    self.fontPool = {}
    return self
end

local function _loadPaths(_self, _path)
    local items = love.filesystem.getDirectoryItems(_path)
    for item = 1, #items, 1 do
        local path = _path .. "/" .. items[item]
        if love.filesystem.getInfo(path).type == "directory" then
            if path ~= "preload" then
                _loadPaths(_self, path)
            end
        end
        if love.filesystem.getInfo(path).type == "file" then
            if path:match("[^.]+$") == "png" then
                _self.images[ string.lower((items[item]:match("[^/]+$")):gsub("%.[^.]+$", "")) ] = path
            elseif path:match("[^.]+$") == "ogg" then
                _self.sounds[ string.lower((items[item]:match("[^/]+$")):gsub("%.[^.]+$", "")) ] = path
            elseif path:match("[^.]+$") == "ttf" then
                _self.fonts[ string.lower((items[item]:match("[^/]+$")):gsub("%.[^.]+$", "")) ] = path
            else 
                _self.data[ string.lower((items[item]:match("[^/]+$")):gsub("%.", "_")) ] = path
            end
        end
    end
end

local function _loadToCache(_self, _path)
    local items = love.filesystem.getDirectoryItems(_path)
    for item = 1, #items, 1 do
        local path = _path .. "/" .. items[item]
        if love.filesystem.getInfo(path).type == "directory" then
            _loadToCache(_self, path)
        end
        if love.filesystem.getInfo(path).type == "file" then
            if path:match("[^.]+$") == "png" then
                _self.images[ string.lower((items[item]:match("[^/]+$")):gsub("%[^.]+$", "")) ] = love.graphics.newImage(path)
            end
            if path:match("[^.]+$") == "ogg" then
                _self.sounds[ string.lower((items[item]:match("[^/]+$")):gsub("[^.]+$", "")) ] = love.audio.newSource(path, "static")
            end
        end

        love.graphics.clear(0, 0, 0, 1)
            preloadScreen(assets)
        love.graphics.present()
    end
end

function AssetManager:init()
    local predb = {
        paths = {
            images = {},
            sounds = {},
            fonts = {},
            data = {},
        },
        cache = {
            images = {},
            sounds = {},
        }
    }
    _loadPaths(predb.paths, "assets")
    _loadToCache(predb.cache, "assets/preload")

    self.paths = predb.paths
    self.cache = predb.cache
end

function AssetManager:exportDatabase()
    return {
        self.paths,
        self.cache
    }
end

function AssetManager:useFont(_name, _size)
    assert(type(_size) == "number", "[ERROR] : Invalid argument type. Expected 'number', got: " .. type(_size))
    if self.paths.fonts[_name] then
        local fontIndex = _name .. ":" .. _size
        if self.fontPool[fontIndex] then
            return self.fontPool[fontIndex]
        else
            self.fontPool[fontIndex] = love.graphics.newFont(self.paths.fonts[_name], _size)
            return self.fontPool[fontIndex]
        end
    else
        error("[ERROR] : Font don't exist in the path")
    end
end

return setmetatable(AssetManager, { __call = function(_, ...) return _new(...) end })