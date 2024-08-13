local listItem = require 'src.Components.Modules.Game.Menus.LevelEditorListItem'

local LevelEditorListController = {}
LevelEditorListController.__index = LevelEditorListController

local function _updateList(this)
    this.levels = love.filesystem.getDirectoryItems("editor/edited")
    for _, l in ipairs(this.levels) do
        local fl = love.filesystem.getInfo("editor/edited/" .. l)
        if fl then
            -- lua table -> json -> compress -> encode hex -> encode b64
            local data = love.data.decode("string", "base64", love.data.decode("string", "hex", love.data.decompress("string", "gzip", json.decode(love.filesystem.read("editor/edited/" .. l)))))
            --table.insert(this.items, listItem(data.meta.title, 40, _ * 64))
        end
    end
end

local function _new(...)
    local self = setmetatable({}, LevelEditorListController)
    self.levels = {}
    self.items = {}

    self.selection = 1
    
    _updateList(self)

    return self
end

function LevelEditorListController:draw()
    for _, i in ipairs(self.items) do
        i:draw()
    end
end

return setmetatable(LevelEditorListController, { __call = function(_, ...) return _new(...) end })