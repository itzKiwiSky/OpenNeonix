local Collider = {}
Collider.__index = Collider

local function _new(_x, _y, _w, _h, _hazard)
    self = setmetatable({}, Collider)
    self.x = _x
    self.y = _y
    self.w = _w
    self.h = _h
    self.hazard = _hazard
    self.last = {}
    self.last.x = self.x
    self.last.y = self.y
    return self
end

function Collider:draw()
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end


return setmetatable(Collider, { __call = function(_, ...) return _new(...) end })