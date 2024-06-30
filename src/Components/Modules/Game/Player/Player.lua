local Player = Entity:extend()

function Player:new(_x, _y)
    Player.super.new(self, _x, _y, 32, 32)

    self.hitbox = {
        ["spikeBox"] = {
            x = 0,
            y = 0,
            w = 24,
            h = 24
        },
        ["actionBox"] = {
            x = 0,
            y = 0,
            w = 28,
            h = 28
        },
    }

    self.gravity = 2200
    self.jumpForce = 640
    self.moveSpeed = 320
    self.yVelocity = 0

    self.state = "cube"
    self.direction = "right"

    self.canJump = false
    self.flipped = false

    -- asset stuff --

    self.assets = {}
    self.assets.drawable, self.assets.quads = love.graphics.getQuads("assets/images/playerModes")
    self.assets.states = {}
    self.assets.states["cube"] = self.assets.quads[1]
    self.assets.states["dart"] = self.assets.quads[2]
    self.assets.states["float"] = self.assets.quads[3]
    self.assets.stencils = {}
    self.assets.maskShader = love.graphics.newShader("assets/shaders/StencilMask.glsl")
    self.assets.meta = {}
    local pqx, pqy, pqw, pqh = self.assets.states["cube"]:getViewport()     -- I call for the cube since all the quads are the same height but we don't want much hardcoded shit :skull:
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
    love.graphics.rectangle(
        "line", self.hitbox["actionBox"].x, self.hitbox["actionBox"].y,
        self.hitbox["actionBox"].w, self.hitbox["actionBox"].h
    )
    if self.gamemodes[self.state].draw then
        self.gamemodes[self.state].draw(self)
    end
end

function Player:update(elapsed)
    --Player.super.update(self, elapsed)
    if self.gamemodes[self.state].update then
        self.gamemodes[self.state].update(self, elapsed)
    end
end

function Player:collide(e, dir)
    -- I think this will be exclusive only to the cube --
    Player.super.collide(self, e, dir)
    if self.gamemodes["cube"].collide then
        self.gamemodes[self.state].collide(self, e, dir)
    end
end

function Player:keypressed(k)
    if self.gamemodes[self.state].keypressed then
        self.gamemodes[self.state].keypressed(self, k)
    end
end

return Player