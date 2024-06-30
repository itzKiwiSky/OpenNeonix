local Collider = entity:extend()

local function _new(_x, _y, _w, _h, _hazard)
    Collider.super.new(self, _x, _y, _w, _h, _hazard)
    self.strength = 100000
    self.weight = 0
end

function Collider:draw()
    love.graphics.setColor(self.type == "hazard" and "#ff0000ff" or "#ffff00ff")
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)

    love.graphics.setColor(self.type == "hazard" and "#ff000077" or "#ffff0077")
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)

    love.graphics.setColor("#ffffffff")
end

return Collider