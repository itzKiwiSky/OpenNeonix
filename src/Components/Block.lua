local block = {}
block.__index = block


function block.new(_x, _y)
    local b = setmetatable({}, block)
    b.hitbox = {}
    b.hitbox.x = _x or 0
    b.hitbox.y = _y or 0
    b.hitbox.w = 32
    b.hitbox.h = 32
    return b
end

function block:drawHitbox()
    love.graphics.setColor(0.5, 1, 1)
        love.graphics.rectangle("line", self.hitbox.x, self.hitbox.y, self.hitbox.w, self.hitbox.h)
    love.graphics.setColor(1, 1, 1) 
end

return block