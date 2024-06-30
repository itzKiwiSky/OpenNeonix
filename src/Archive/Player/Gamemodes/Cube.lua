local Cube = {}

-- this function is only for debugging collisions --
local function _keyboardControl(self, elapsed)
    local up, down, left, right = love.keyboard.isDown("w", "up"), love.keyboard.isDown("s", "down"), love.keyboard.isDown("a", "left"), love.keyboard.isDown("d", "right")
    self.y = self.y - (up and 300 or 0) * elapsed
    self.y = self.y + (down and 300 or 0) * elapsed
    self.x = self.x - (left and 300 or 0) * elapsed
    self.x = self.x + (right and 300 or 0) * elapsed
end

function Cube.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    --love.graphics.print("JumpForce" .. self.properties.jumpForce, 30, 30)
    love.graphics.print("canJump " .. tostring(self.properties.canJump) .. " gravity " .. self.gravity, 30, 30)
end


--[[
    -- direction handler --
    self.x = (self.properties.direction == "right") and self.x + self.properties.xVel or self.x - self.properties.xVel

    -- gravity controller --
    self.properties.gravity = self.properties.flipped and -24 or 24
    self.properties.yVel = self.properties.yVel + self.properties.gravity * elapsed

    if self.properties.yVel >= self.properties.maxVelY then
        self.properties.yVel = self.properties.maxVelY
    end

    self.y = self.y + self.properties.yVel

    
    if love.keyboard.isDown("space", "z", "up") then
        if self.properties.canJump then
            self.properties.yVel = (self.properties.flipped) and self.properties.jumpForce or -self.properties.jumpForce
            self.properties.jumping = true
            self.properties.canJump = false
            self.properties.falling = false
        end
    end

    if self.last.y ~= self.y then
        self.properties.canJump = false
    end
]]--

function Cube.update(self, elapsed)
    --_keyboardControl(self, elapsed)

    --self.gravity = self.gravity + self.weight * elapsed
    --self.y = self.y + self.gravity * elapsed

    if love.keyboard.isDown("space", "z", "up") then
        if self.properties.canJump then
            --self.gravity = (self.properties.flipped and self.properties.jumpForce or -self.properties.jumpForce)
            self.gravity = -self.properties.jumpForce
            self.properties.canJump = false
        end
    end

    if self.last.y ~= self.y then
        self.canJump = false
    end

    for _, t in ipairs(playMap.assets.elements.hitboxes) do
        if t.type == "tile" then
            self:resolveCollision(t)
        end
    end
end

function Cube.overrideCollision(self, e, dir)
    if dir == "bottom" then
        self.properties.canJump = true
    end
end

function Cube.keypressed(self, k)
    if k == "return" or k == "lshift" then
        self.properties.direction = (self.properties.direction == "right") and "left" or "right"
    end

    if k == "pageup" then
        self.properties.jumpForce = self.properties.jumpForce + 0.1
    end
    if k == "pagedown" then
        self.properties.jumpForce = self.properties.jumpForce - 0.1
    end
end

return Cube