local EditorLevelsController = {}
EditorLevelsController.__index = EditorLevelsController

local function _new(terminal, x, y, w, h)
    local self = setmetatable({}, EditorLevelsController)
    self.terminal = terminal
    self.levels = {}
    self.selection = 1
    self.area = {
        x = x,
        y = y,
        w = w,
        h = h
    }
    return self
end

function EditorLevelsController:compose()
    self.terminal:clear(self.area.x, self.area.y, self.area.w, self.area.h)
end

function EditorLevelsController:updateKeyboard(k)
    
end

return setmetatable(EditorLevelsController, { __call = function(_, ...) return _new(...) end })