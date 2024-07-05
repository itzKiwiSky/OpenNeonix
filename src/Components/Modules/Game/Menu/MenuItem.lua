local MenuItem = {}
MenuItem.__index = MenuItem

local function _new(_itemName, _x, _y, _offset, _func)
    local self = setmetatable({}, MenuItem)
    self.itemName = _itemName
    self.dataFunc = _func
    self.fontOffset = _offset
    self.x = _x
    self.y = _y
    self.font = fontcache.getFont("quicksand_regular", 34)
    self.points = {
        self.x, self.y,

        self.x + self.font:getWidth(_itemName), self.y,
        
        (self.x + self.font:getWidth(_itemName)) - 64, (self.y + self.font:getHeight()) + self.fontOffset,

        self.x, (self.y + self.font:getHeight()) + self.fontOffset,
    }
    self.selected = false
    return self
end

function MenuItem:draw()
    love.graphics.points(self.points)
    --love.graphics.setColor(0, 0, 0, 1)
    --love.graphics.print(self.itemName, self.font, self.x, self.y + ((self.font:getHeight() + self.fontOffset) / 2))
    --love.graphics.setColor(1, 1, 1, 1)
end

function MenuItem:update(elapsed)
    
end

return setmetatable(MenuItem, { __call = function(_, ...) return _new(...) end })