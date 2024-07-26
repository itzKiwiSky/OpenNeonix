local ParticleController = {}
ParticleController.__index = ParticleController

local function _new(_filename)
    local self = setmetatable({}, ParticleController)
    self.ps = {}

    assert(type(_filename) == "string", "[ERROR] : Invalid parameter type, expected 'string', got: " .. type(_filename))
    local psdata, err = love.filesystem.load(_filename)()

    if err then
        error(err)
    end

    for _, ps in ipairs(psdata) do
        if type(ps) == "table" then
            table.insert(self.ps, ps)
        end
    end

    return self
end

function ParticleController:draw(_x, _y)
    for _, ps in ipairs(self.ps) do
        love.graphics.draw(ps.system, _x, _y)
    end
end

function ParticleController:emit()
    for _, ps in ipairs(self.ps) do
        ps.system:emit(ps.emitAtStart)
    end
end

function ParticleController:update(elapsed)
    for _, ps in ipairs(self.ps) do
        ps.system:update(elapsed)
    end
end

return setmetatable(ParticleController, { __call = function(_, ...) return _new(...) end })