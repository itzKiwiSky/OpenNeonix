local LevelEditorListItem = {}
LevelEditorListItem.__index = LevelEditorListItem

local function _new(_title, _x, _y)
    local self = setmetatable({}, LevelEditorListItem)
    self.x = _x or 0
    self.y = _y or 0
    self.w = 128
    self.h = 64

    self.elements = {}
    self.elements.panel = loveframes.Create("panel")

    self.elements.panel.drawfunc = function()end

    self.elements.optionsButton = loveframes.Create("button")
    self.elements.optionsButton:SetParent(self.elements.panel)
    self.elements.optionsButton:SetWidth(64)
    self.elements.optionsButton:SetHeight(64)

    self.title = _title
    return self
end

function LevelEditorListItem:draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    love.graphics.setLineWidth(1)

    love.graphics.printf(self.title, f_menuSelection, self.x + 10, self.y + 4, self.w, "left")
end

function LevelEditorListItem:hover()
    local mx, my = love.mouse.getPosition()

    if mx <= self.x and mx >= self.x + self.w and my <= self.y and my >= self.y + self.h then
        return true
    end
    return false
end

return setmetatable(LevelEditorListItem, { __call = function(_, ...) return _new(...) end })