local Player = {}

local Collider = require 'src.Components.Modules.Map.Collider'

-- import gamemodes --
local Gamemodes = {
    ["cube"] = require 'src.Components.Modules.Player.Gamemodes.Cube'
}

function Player:init(_x, _y)
    self.x = _x
    self.y = _y

    --registers.user.player.assets.gradient = love.graphics.newGradient("vertical")

    self.properties = {
        w = 32,
        h = 32,
        r = 0,

        xVel = -10,
        yVel = 0,
        gravity = 5.5,
        jumpForce = 13.5,

        grounded = false,
        jumping = false,
        falling = false,
        dead = false,

        state = "cube",
        flipped = false,
        direction = "right",
    }

    self.hitboxes = {
        ["master"] = Collider(self.x, self.y, 32, 32),
        ["spikeBox"] = Collider(self.x, self.y, 28, 28),
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

    for k, v in pairs(Gamemodes) do
        self.assets.stencils[k] = function()
            love.graphics.setShader(self.assets.maskShader)
                love.graphics.draw(self.assets.drawable, self.assets.states[k], self.x, self.y, self.r, 1, 1, self.assets.meta.size.w / 2, self.assets.meta.size.h / 2)
            love.graphics.setShader()
        end
    end
end

function Player:draw()
    --if self.assets.states[self.state] then
        --love.graphics.draw(self.assets.drawable, self.assets.states[self.state], self.x, self.y, self.r, 1, 1)
    --end
    if Gamemodes[self.properties.state].draw then
        Gamemodes[self.properties.state].draw(self)
    end
end

function Player:update(elapsed)
    if Gamemodes[self.properties.state].update then
        Gamemodes[self.properties.state].update(self, elapsed)
    end
end

function Player:keypressed(k)
    if Gamemodes[self.properties.state].keypressed then
        Gamemodes[self.properties.state].keypressed(self, k)
    end
end

return Player