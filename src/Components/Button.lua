local button = {}
button.__index = button

function button.new(_texture, _x, _y)
    local b = setmetatable({}, button)
    b.x = _x or 0
    b.y = _y or 0
    if type(_texture) == "userdata" then
        b.image = _texture
    else
        b.image = love.graphics.newImage(_texture)
    end
    b.size = 1
    b.w = b.image:getWidth() * b.size
    b.h = b.image:getHeight() * b.size
    return b
end

function button:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, self.size, self.size, self.image:getWidth() / 2, self.image:getHeight() / 2)
    love.graphics.rectangle("line", self.x - self.image:getWidth(), self.y - self.image:getHeight(), self.w * self.size, self.h * self.size)
end

function button:mousepressed(x, y, button, _callback)
    if button == 1 then
        if x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h then
            pcall(_callback)
        end
    end
end

function button:isHovered(x, y, _callback, _callback2)
    if x >= self.x - self.image:getWidth() and x <= (self.x - self.image:getWidth()) + self.w * self.size and y >= self.y - self.image:getHeight() and y <= (self.y - self.image:getHeight()) + self.h  * self.size then
        pcall(_callback)
    else
        pcall(_callback2)
    end
end

return button