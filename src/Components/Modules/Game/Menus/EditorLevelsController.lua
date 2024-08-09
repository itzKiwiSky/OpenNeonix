local EditorLevelsController = {}
EditorLevelsController.__index = EditorLevelsController

local function _new(terminal, x, y, w, h)
    local self = setmetatable({}, EditorLevelsController)
    self.terminal = terminal
    self.levels = {}
    self.selection = 1
    return self
end

function EditorLevelsController:compose()
    
end

function EditorLevelsController:updateKeyboard(k)
    
end

return setmetatable(EditorLevelsController, { __call = function(_, ...) return _new(...) end })