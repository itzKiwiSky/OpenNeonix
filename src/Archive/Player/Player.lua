local Player = entity:extend()

function Player:new(_x, _y)
    Player.super.new(self, _x, _y, 32, 32, "player")

    self.properties = {
        w = 32,
        h = 32,
        r = 0,

        jumpForce = 200,
        maxVelY = 15,

        canJump = false,
        flipped = false,

        state = "cube",
        direction = "right",
    }

    self.hitbox = {
        ["spikeBox"] = {
            x = 0,
            y = 0,
            w = 28,
            h = 28
        }
    }

    self.assets = {}
    self.assets.drawable, self.assets.quads = love.graphics.getQuads("assets/images/playerModes")
    self.assets.states = {}
    self.assets.states["cube"] = self.assets.quads[1]
    self.assets.states["dart"] = self.assets.quads[2]
    self.assets.states["float"] = self.assets.quads[3]
    self.assets.stencils = {}
    self.assets.maskShader = love.graphics.newShader("assets/shaders/StencilMask.glsl")
    self.assets.meta = {}
    local pqx, pqy, pqw, pqh = self.assets.states["cube"]:getViewport()
    self.assets.meta.size = {
        x = pqx, 
        y = pqy, 
        w = pqw, 
        h = pqh
    }

    self.gamemodes = {
        ["cube"] = require 'src.Components.Modules.Game.Player.Gamemodes.Cube'
    }

    for k, v in pairs(self.gamemodes) do
        self.assets.stencils[k] = function()
            love.graphics.setShader(self.assets.maskShader)
                love.graphics.draw(self.assets.drawable, self.assets.states[k], self.x, self.y, self.r, 1, 1, self.assets.meta.size.w / 2, self.assets.meta.size.h / 2)
            love.graphics.setShader()
        end
    end
end

function Player:draw()
    love.graphics.rectangle(
        "line", self.hitbox["spikeBox"].x, self.hitbox["spikeBox"].y,
        self.hitbox["spikeBox"].w, self.hitbox["spikeBox"].h
    )
    if self.gamemodes[self.properties.state].draw then
        self.gamemodes[self.properties.state].draw(self)
    end
end

function Player:update(elapsed)
    Player.super.update(self, elapsed)
    self.hitbox["spikeBox"].x, self.hitbox["spikeBox"].y = self.x + 2, self.y + 2
    if self.gamemodes[self.properties.state].update then
        self.gamemodes[self.properties.state].update(self, elapsed)
    end
end

function Player:keypressed(k)
    if self.gamemodes[self.properties.state].keypressed then
        self.gamemodes[self.properties.state].keypressed(self, k)
    end
end

function Player:collide(e, dir)
    Player.super.collide(self, e, dir)
    if self.gamemodes[self.properties.state].overrideCollision then
        self.gamemodes[self.properties.state].overrideCollision(self, e, dir)
    end
end

return Player