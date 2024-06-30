local Player = Entity:extend()

function Player:keyboardControl(elapsed)
    local up, down, left, right = love.keyboard.isDown("w", "up", "space"), love.keyboard.isDown("s", "down"), love.keyboard.isDown("a", "left"), love.keyboard.isDown("d", "right")
    --self.y = self.y - (up and 300 or 0) * elapsed
    --self.y = self.y + (down and 300 or 0) * elapsed
    self.x = self.x - (left and 300 or 0) * elapsed
    self.x = self.x + (right and 300 or 0) * elapsed

    if up then
        self:jump()
    end
end

function Player:new(_x, _y)
    Player.super.new(self, _x, _y, 32, 64)
    self.weight = 600
    self.jumpForce = 300

    self.canJump = false
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function Player:update(elapsed)
    self:keyboardControl(elapsed)

    Player.super.update(self, elapsed)

    if self.last.y ~= self.y then
        self.canJump = false
    end
end

function Player:collide(e, dir)
    Player.super.collide(self, e, dir)
    if dir == "bottom" then
        self.canJump = true
    end
end

function Player:jump()
    if self.canJump then
        self.gravity = -self.jumpForce
        self.canJump = false
    end
end

return Player