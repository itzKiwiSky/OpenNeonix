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
    b.w = b.image:getWidth() * b.size or 32 * b.size
    b.h = b.image:getHeight() * b.size or 32 * b.size
    return b
end

function button.newStatic(_x, _y)
    local b = setmetatable({}, button)
    b.x = _x or 0
    b.y = _y or 0
    b.w = 32
    b.h = 32
    return b
end

function button:draw()
    if self.image then
        love.graphics.draw(self.image, self.x, self.y, 0, self.size, self.size, self.image:getWidth() / 2, self.image:getHeight() / 2)
    end
    --love.graphics.rectangle("line", self.x - self.image:getWidth() / 2, self.y - self.image:getHeight() / 2, self.w, self.h)
    love.graphics.rectangle("line", self.x - self.w / 2, self.y - self.h / 2, self.w, self.h)
end

function button:mousepressed(x, y, button)
    if button == 1 then
        if self.image then
            if x >= self.x - self.image:getWidth() / 2 and x <= (self.x - self.image:getWidth() / 2) + self.w and y >= self.y - self.image:getHeight() / 2 and y <= (self.y - self.image:getHeight() / 2) + self.h then
                return true
            end
        else
            if x >= self.x - self.w / 2 and x <= (self.x - self.w / 2) + self.w and y >= self.y - self.h / 2 and y <= (self.y - self.h / 2) + self.h then
                return true
            end
        end
    end
end

function button:isHovered()
    local x, y = love.mouse.getPosition()
    if self.image then
        if x >= self.x - self.image:getWidth() / 2 and x <= (self.x - self.image:getWidth() / 2) + self.w and y >= self.y - self.image:getHeight() / 2 and y <= (self.y - self.image:getHeight() / 2) + self.h then
            return true
        end
    end
    return false
end

return button