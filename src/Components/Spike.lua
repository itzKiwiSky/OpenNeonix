local spike = {}
spike.__index = spike

function spike.new(_x, _y)
    local s = setmetatable({}, spike)
    s.x = _x or 0
    s.y = _y or 0
    s.hitbox = {}
    s.hitbox.x = s.x + 8
    s.hitbox.y = s.y + 8
    s.hitbox.w = 16
    s.hitbox.h = 16
    return s
end

function spike:drawHitbox()
    love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("line", self.hitbox.x, self.hitbox.y, self.hitbox.w, self.hitbox.h)
    love.graphics.setColor(1, 1, 1)
end


return spike