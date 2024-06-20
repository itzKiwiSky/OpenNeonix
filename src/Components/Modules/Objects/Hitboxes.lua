local Hitboxes = {}
Hitboxes.__index = Hitboxes
local function _new(_type, _x, _y, _w, _h)
    local self = setmetatable({}, Hitboxes)
    self.x, self.y, self.w, self.h, self.type = _x, _y, _w, _h, _type
    return self
end

return setmetatable(Hitboxes, { __call = function(_, ...) return _new(...) end })