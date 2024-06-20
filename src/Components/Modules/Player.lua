local Player = {}
Player.__index = Player

local AnimationHandler = require 'src.Components.Modules.AnimationHandler'

local function _new(_x, _y)
    local self = setmetatable({}, Player)
    self.x = _x
    self.y = _y
    self.w = 32
    self.h = 32
    self.r = 0

    self.xVel = 0
    self.yVel = 0
    self.gravity = 32

    self.grounded = false
    self.direction = "right"
    
    self.state = "idle"
    self.assets = {}
    self.assets.drawable, self.assets.quads = love.graphics.getQuads("assets/images/player_sheet")
    self.assets.animations = {
        ["idle"] = AnimationHandler(self.assets.quads, {1, 1}, false, true, 0.2),
        ["dead"] = AnimationHandler(self.assets.quads, {2, 13}, false, false, 0.2)
    }
    
    self.assets.animations["idle"]:play()

    return self
end

function Player:draw()
    if self.assets.animations[self.state] then
        self.assets.animations[self.state]:draw(self.assets.drawable, self.x, self.y, math.rad(self.r), 1, 1, 16, 16)
    end
end

function Player:update(elapsed)
    if love.keyboard.isDown("space", "z", "up") then
        
    end
end

return setmetatable(Player, { __call = function(_, ...) return _new(...) end })