local player = {}

function player:init(_x, _y)
    self.x = _x
    self.y = _y
    self.image = love.graphics.newImage("resources/images/player.png")
    self.properties = {}
    self.debug = {}
    self.hitboxes = {}
    self.hitboxes.master = {}
    self.hitboxes.front = {}
    self.hitboxes.back = {}
    self.hitboxes.head = {}
    self.hitboxes.foot = {}
    self.hitboxes.spikeHitbox = {}

    self.properties.rotation = 0
    self.properties.yVelocity = 0
    self.properties.xVelocity = -10
    self.properties.gravity = 5.5
    self.properties.jumpSpeed = 11.3
    self.properties.isJumping = false
    self.properties.isGrounded = true
    self.properties.isPlayerBackwards = false
    self.properties.isGravityInverse = false
    self.properties.dead = false
    self.properties.playerGamemode = "player"       --% Available modes : Player, Flight (only implemented player) %--
    self.properties.playerColor = {}
    self.properties.playerColor.r = 255
    self.properties.playerColor.g = 255
    self.properties.playerColor.b = 255

    self.hitboxes.master.x = _x
    self.hitboxes.master.y = _y
    self.hitboxes.master.w = 32
    self.hitboxes.master.h = 32

    self.hitboxes.front.x = _x + 33
    self.hitboxes.front.y = _y
    self.hitboxes.front.w = 2
    self.hitboxes.front.h = 16
    self.hitboxes.front.enable = true

    self.hitboxes.back.x = _x - 1
    self.hitboxes.back.y = _y
    self.hitboxes.back.w = 2
    self.hitboxes.back.h = 16
    self.hitboxes.back.enable = true

    self.hitboxes.head.x = _x
    self.hitboxes.head.y = _y - 1
    self.hitboxes.head.w = 32
    self.hitboxes.head.h = 2
    self.hitboxes.head.enable = true

    self.hitboxes.foot.x = _x
    self.hitboxes.foot.y = _y + 33
    self.hitboxes.foot.w = 32
    self.hitboxes.foot.h = 2
    self.hitboxes.foot.enable = false

    self.hitboxes.spikeHitbox.x = _x + 8
    self.hitboxes.spikeHitbox.y = _y + 8
    self.hitboxes.spikeHitbox.w = 16
    self.hitboxes.spikeHitbox.h = 16
    
end

function player:drawHitbox()
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("line", self.hitboxes.front.x, self.hitboxes.front.y, self.hitboxes.front.w, self.hitboxes.front.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle("line", self.hitboxes.back.x, self.hitboxes.back.y, self.hitboxes.back.w, self.hitboxes.back.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0, 1, 1)
    love.graphics.rectangle("line", self.hitboxes.head.x, self.hitboxes.head.y, self.hitboxes.head.w, self.hitboxes.head.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(1, 0.5, 0)
    love.graphics.rectangle("line", self.hitboxes.foot.x, self.hitboxes.foot.y, self.hitboxes.foot.w, self.hitboxes.foot.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.5, 0, 0)
    love.graphics.rectangle("line", self.hitboxes.spikeHitbox.x, self.hitboxes.spikeHitbox.y, self.hitboxes.spikeHitbox.w, self.hitboxes.spikeHitbox.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", self.hitboxes.master.x, self.hitboxes.master.y, self.hitboxes.master.w, self.hitboxes.master.h)
end

function player:showStats()
    local y = 0
    for _, v in pairs(self.properties) do
        love.graphics.print(_ .. " = " .. tostring(v), (self.x - 190), (self.y - 190) + y)
        y = y + 15
    end
end

function player:draw()
    love.graphics.setColor(self.properties.playerColor.r / 255, self.properties.playerColor.g / 255,self.properties.playerColor.b / 255)
    love.graphics.draw(self.image, self.x + self.image:getWidth() / 2, self.y + self.image:getHeight() / 2, math.rad(self.properties.rotation), 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
    love.graphics.setColor(1, 1, 1)
end

function player:update(elapsed)
    if not self.properties.dead then
        self.properties.xVelocity = 5.2
        if not self.properties.isPlayerBackwards then
            self.x = self.x + self.properties.xVelocity
        else
            self.x = self.x - self.properties.xVelocity
        end

        if not self.properties.isGravityInverse then
            self.properties.gravity = 0.8
        else
            self.properties.gravity = -0.8
        end

        if love.keyboard.isDown("space", "up", "z", "rshift", "lshift") or love.mouse.isDown(1) then
            if not self.properties.isJumping and self.properties.isGrounded then
                self.properties.isJumping = true
                self.properties.isGrounded = false
                if self.properties.isGravityInverse then
                    self.properties.yVelocity = self.properties.jumpSpeed
                else
                    self.properties.yVelocity = -self.properties.jumpSpeed
                end
            end
        end

        self.properties.yVelocity = self.properties.yVelocity + self.properties.gravity
        self.y = self.y + self.properties.yVelocity

        self.hitboxes.master.x = self.x
        self.hitboxes.master.y = self.y

        self.hitboxes.front.x = self.hitboxes.master.x + 33
        self.hitboxes.front.y = self.hitboxes.master.y - 2

        self.hitboxes.back.x = self.hitboxes.master.x - 2
        self.hitboxes.back.y = self.hitboxes.master.y - 2

        self.hitboxes.head.x = self.hitboxes.master.x
        self.hitboxes.head.y = self.hitboxes.master.y - 2

        self.hitboxes.foot.x = self.hitboxes.master.x
        self.hitboxes.foot.y = self.hitboxes.master.y + 33

        self.hitboxes.spikeHitbox.x = self.hitboxes.master.x + 8
        self.hitboxes.spikeHitbox.y = self.hitboxes.master.y + 8

        if not self.properties.isGrounded then
            if self.properties.isPlayerBackwards then
                self.properties.rotation = self.properties.rotation - 7
            else
                self.properties.rotation = self.properties.rotation + 7
            end
        else
            self.properties.rotation = 0
        end

    else
        self.properties.xVelocity = 0
    end

    for _, block in ipairs(blocks) do
        if collision.rectRect(self.hitboxes.master, block.hitbox) then
            --% Master collider %--
            if self.properties.isGravityInverse then
                self.y = block.hitbox.y + self.hitboxes.master.h
                self.properties.yVelocity = 0
                self.properties.isJumping = false
                self.properties.isGrounded = true
            else
                self.y = block.hitbox.y - self.hitboxes.master.h
                self.properties.yVelocity = 0
                self.properties.isJumping = false
                self.properties.isGrounded = true
            end
        end
            --% Front collider %--
        if self.hitboxes.front.enable then
            if collision.rectRect(self.hitboxes.front, block.hitbox) then
                self.properties.dead = true
            end
        end

            --% back collider %--
        if self.hitboxes.back.enable then
            if collision.rectRect(self.hitboxes.back, block.hitbox) then
                self.properties.dead = true
            end
        end

            --% head collider %--
        if self.hitboxes.head.enable then
            if collision.rectRect(self.hitboxes.head, block.hitbox) then
                self.properties.dead = true
            end
        end

        --% foot collider %--
        if self.hitboxes.foot.enable then
            if collision.rectRect(self.hitboxes.foot, block.hitbox) then
                self.properties.dead = true
            end
        end
    end
    for _, spike in ipairs(spikes) do
        if collision.rectRect(self.hitboxes.spikeHitbox, spike.hitbox) then
            self.properties.dead = true
        end
    end
    if self.properties.dead then
        playstate:enter()
    end
end

return player