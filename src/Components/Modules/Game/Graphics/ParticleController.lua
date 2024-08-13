local ParticleController = {}
ParticleController.__index = ParticleController

local function _new(_filename, _options)
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

    if _options and _options.texture then
        --assert(type(_options.id) == "number", "Invalid type, required number")
        self.ps[_options.id]:setTexture(_options.texture)
    end

    return self
end

function ParticleController:draw(_x, _y)
    for _, ps in ipairs(self.ps) do
        love.graphics.draw(ps.system, _x, _y)
    end
end

function ParticleController:update(elapsed)
    for _, ps in ipairs(self.ps) do
        ps.system:update(elapsed)
    end
end

return setmetatable(ParticleController, { __call = function(_, ...) return _new(...) end })