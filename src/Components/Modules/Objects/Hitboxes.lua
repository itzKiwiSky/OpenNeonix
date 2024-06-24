local Hitboxes = {}
Hitboxes.__index = Hitboxes
local types = {}

local function _getItem(_word, _table)
    -- Compute a simple hash of the word
    local hash = 0
    for i = 1, #_word do
        hash = hash + string.byte(_word, i)
    end

    -- Create an array of the table keys
    local keys = {}
    for k in pairs(_table) do
        table.insert(keys, k)
    end

    -- Compute the index from the hash
    local index = (hash % #keys) + 1
    local key = keys[index]
    return _table[key]
end

local function _convertColor(_h)
    local r, g, b, a = _h:match("#(%x%x)(%x%x)(%x%x)(%x%x)")
    r = tonumber(r, 16) / 0xff
    g = tonumber(g, 16) / 0xff
    b = tonumber(b, 16) / 0xff
    a = tonumber(a, 16) / 0xff
    return {r, g, b, a}
end

local function _new(_type, _x, _y, _w, _h)
    local self = setmetatable({}, Hitboxes)
    self.x, self.y, self.w, self.h, self.type = _x, _y, _w, _h, _type
    --print("add", self.x, self.y, self.w, self.h, self.type)
    return self
end

function Hitboxes:draw()
    love.graphics.setColor(_getItem(self.type, colors) .. "77")
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
        love.graphics.setColor(_getItem(self.type, colors) .. "ff")
        love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
end

return setmetatable(Hitboxes, { __call = function(_, ...) return _new(...) end })