local Cube = {}

function Cube.draw(self)
    love.graphics.rectangle("fill", self.x, self.y, 32, 32)
end

function Cube.update(self, elapsed)
    --if love.keyboard.isDown("space", "z", "up") then
    --end

    if not self.properties.dead then
        self.properties.xVel = 5.2

        if self.properties.direction == "right" then
            self.x = self.x + self.properties.xVel
        else
            self.x = self.x - self.properties.xVel
        end

        if not self.properties.flipped then
            self.properties.gravity = 0.8
        else
            self.properties.gravity = -0.8
        end

        -- controls --
        if love.keyboard.isDown("space", "z", "up") then
            if not self.properties.jumping and self.properties.grounded then
                self.properties.jumping = true
                self.properties.grounded = false
                self.properties.falling = true
                if not self.properties.flipped then
                    self.properties.yVel = self.properties.jumpForce
                else
                    self.properties.yVel = -self.properties.jumpForce
                end
            end
        end

        self.properties.yVel = self.properties.yVel + self.properties.gravity
        self.y = self.y + self.properties.yVel
    end
end

return Cube