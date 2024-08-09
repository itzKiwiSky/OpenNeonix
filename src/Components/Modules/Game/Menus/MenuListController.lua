local MenuListController = {}
MenuListController.__index = MenuListController

local function _longestString(t)
    local maxLength = 0
    local longestStr = ""
    
    for _, str in pairs(t) do
        if type(str) == "string" and #str > maxLength then
            maxLength = #str
            longestStr = str
        end
    end
    
    return longestStr
end

local function _new(_term, _x, _y, _padding, _style)
    local self = setmetatable({}, MenuListController)
    self.terminal = _term

    self.currentItem = 1

    self.initCompose = false

    self.metaState = {
        labels = {},
        meta = {},
    }

    self.padding = _padding or 2
    self.style = _style or "line"

    self.area = {
        x = _x,
        y = _y,
        w = 0,
        h = 0
    }
    return self
end

function MenuListController:addItems(_item)
    local maxLength = 0
    local longestStr = ""
    for _, item in ipairs(_item) do
        if #item.label > maxLength then
            maxLength = #item.label
            longestStr = item.label
        end
    end

    for _, item in ipairs(_item) do
        local transformedLabel = string.justify(item.label, maxLength + self.padding, " ", "center")
        table.insert(self.metaState.labels, transformedLabel)
        table.insert(self.metaState.meta, {
            action = item.action,
            hovered = false,
        })
    end
    self.area.w = #_longestString(self.metaState.labels) + 2
    self.area.h = #_item + 2
end

function MenuListController:compose()
    if #self.metaState.labels > 0 then
        -- reset --
        local tx
        if type(self.area.x) == "string" then
            if self.area.x == "center" then
                tx = math.floor(self.terminal.width / 2 - self.area.w / 2)
            end
        else
            tx = math.floor(self.area.x)
        end
        self.terminal:clear(tx, self.area.y, self.area.w, self.area.h)
        for _, item in pairs(self.metaState.meta) do
            item.hovered = false
        end

        -- hover --
        self.metaState.meta[self.currentItem].hovered = true

        -- render --
        self.terminal:setCursorColor(self.terminal.schemes.basic["white"])
        self.terminal:setCursorBackColor(self.terminal.schemes.basic["black"])
        --self.terminal:frame(self.style, tx, self.area.y, self.area.w, self.area.h)

        local py = self.area.y
        for i = 1, #self.metaState.labels, 1 do
            if self.metaState.meta[i].hovered then
                self.terminal:setCursorColor(self.terminal.schemes.basic["black"])
                self.terminal:setCursorBackColor(self.terminal.schemes.basic["white"])
            else
                self.terminal:setCursorColor(self.terminal.schemes.basic["white"])
                self.terminal:setCursorBackColor(self.terminal.schemes.basic["black"])
            end
            self.terminal:print(tx + 1, py + i, self.metaState.labels[i])
        end
        self.terminal:setCursorColor(self.terminal.schemes.basic["white"])
        self.terminal:setCursorBackColor(self.terminal.schemes.basic["black"])

        self.terminal:frameShadow(self.style, tx, self.area.y, self.area.w, self.area.h, "brightWhite", "brightBlack")
        self.terminal:moveTo(1, 1)
        
    end
end

function MenuListController:updateKeyboard(k)
    if #self.metaState.labels > 1 then
        if k == "down" or k == "s" then
            if self.currentItem < #self.metaState.labels then
                self.currentItem = self.currentItem + 1
                self:compose()
            end
        end
        if k == "up" or k == "w" then
            if self.currentItem > 1 then
                self.currentItem = self.currentItem - 1
                self:compose()
            end
        end
        if k == "return" then
            self.metaState.meta[self.currentItem].action()
        end
    end
end

return setmetatable(MenuListController, { __call = function(_, ...) return _new(...) end })