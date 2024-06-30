local Cube = {}

local function _jump(self)
    if self.canJump then
        self.yVelocity = (self.flipped and self.jumpForce or -self.jumpForce)
        self.canJump = false
    end
end

local function _updateHitboxes(self)
    self.hitbox["spikeBox"].x, self.hitbox["spikeBox"].y = self.last.x + 4, self.last.y + 4
    self.hitbox["actionBox"].x, self.hitbox["actionBox"].y = self.last.x + 2, self.last.y + 2
end

function Cube.draw(self)
    --love.graphics.print("canJump " .. tostring(self.canJump) .. " " .. "yVelocity " .. tostring(self.yVelocity), 20, 20)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end

function Cube.update(self, elapsed)
    --! HACK: TODO THIS SHIT WHEN I FIND A WAY TO MAKE THIS WORK !!!!! --
    if love.keyboard.isDown("space", "z", "up") then
        _jump(self)
    end

    self.super.update(self, elapsed)

    --self.x = (self.direction == "right" and self.x + self.moveSpeed or self.x - self.moveSpeed) * elapsed

    self.x = self.x + (self.direction == "right" and self.moveSpeed or -self.moveSpeed) * elapsed

    _updateHitboxes(self)

    -- Increase the velocity using the gravity
    self.yVelocity = self.yVelocity + self.gravity * elapsed

    -- Increase the y-position
    self.y = self.y + self.yVelocity * elapsed

    -- some shit to not able to jump in the air --
    if self.last.y ~= self.y then
        self.canJump = false
    end
end

function Cube.collide(self, e, dir)
    self.super.collide(self, e, dir)
    if dir == "bottom" then
        self.yVelocity = 0
        self.canJump = true
    end
end

function Cube.keypressed(self, k)
    if k == "return" or k == "lshift" then
        self.direction = (self.direction == "right" and "left" or "right")
    end
end

return Cube