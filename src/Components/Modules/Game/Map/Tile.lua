local Tile = Entity:extend()

function Tile:new(_x, _y, _w, _h)
    Tile.super.new(self, _x, _y, _w, _h)

    self.strength = 10000000
end

function Tile:draw()
    love.graphics.setColor("#ffffff55")
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setColor("#ffffffff")
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end

return Tile