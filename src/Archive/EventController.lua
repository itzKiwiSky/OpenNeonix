local EventController = {}
EventController.__index = EventController

local function _seconds(_str)
    local time = string.split(_str, ":")
    return time[1] * 60 + time[2] + time[3] * 0.1
end

local function _new(_evn)
    local self = setmetatable({}, EventController)
    self.events = {}
    self.init = false

    for e = 1, #_evn, 1 do
        local evnTimer = timer.new()
        print(_evn[e][1], _seconds(_evn[e][1]))
        evnTimer:after(_seconds(_evn[e][1]), function() _evn[e][2]() end)
        table.insert(self.events, evnTimer)
    end

    return self
end

function EventController:start()
    self.init = true
end

function EventController:update(elapsed)
    if self.init then
        if self.events then
            for _, tmr in ipairs(self.events) do
                tmr:update(elapsed)
            end
        end
    end
end

return setmetatable(EventController, { __call = function(_, ...) return _new(...) end })