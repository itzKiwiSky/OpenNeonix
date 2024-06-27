local AnimationHandler = {}
AnimationHandler.__index = AnimationHandler

local function _new(_frameList, _range, _loop, _singleFrame, _duration)
    local self = setmetatable({}, AnimationHandler)
    self.meta = {
        animation = {
            loop = _loop or false,
            singleFrame = _singleFrame or true,
            duration = _duration or 0.2,
        },
        draw = {
            flipH = false,
            flipV = false,
        }
    }

    self.meta.animation.onComplete = function()end

    self.meta.animation.onLoop = function()end

    self._data = {
        timer = 0,
        state = "stopped",
        frame = 1,
    }

    assert(type(_frameList) == "table", "[ERROR] : Invalid parameter type. Expected 'table' got, " .. type(_frameList))

    assert(#_frameList > 0, "[ERROR] : The table must contain a quad object")

    if #_frameList == 1 then
        self.meta.animation.singleFrame = true
    end

    self.frames = {}

    assert(type(_range) == "table", "[ERROR] : Invalid parameter type. Expected 'table' got, " .. type(_range))

    if _range.start and _range.finish then
        for f = _range.start, _range.finish, 1 do
            table.insert(self.frames, _frameList[f])
        end
    else
        if _range[1] and _range[2] then
            for f = _range[1], _range[2], 1 do
                table.insert(self.frames, _frameList[f])
            end
        end
    end

    return self
end

function AnimationHandler:draw(drawable, x, y, r, sx, sy, ox, oy)
    love.graphics.draw(drawable, self.frames[self._data.frame], x, y, r, sx, sy, ox, oy)
end

function AnimationHandler:pause()
    self._data.state = "paused"
end

function AnimationHandler:play()
    self._data.state = "playing"
end

function AnimationHandler:stop()
    self._data.state = "stopped"
    self._data.frame = 1
end

function AnimationHandler:update(elapsed)
    if not self.meta.animation.singleFrame then
        if self._data.state == "playing" then
            self._data.timer = self._data.timer + elapsed
            if math.round(self._data.timer, 2) >= self.meta.animation.duration then
                self._data.frame = self._data.frame + 1
                self._data.timer = 0
            end
            if self._data.frame >= #self.frames then
                if self.meta.animation.loop then
                    self._data.frame = 1
                    self.meta.animation.onLoop()
                else
                    self._data.frame = #self.frames
                    self.meta.animation.onComplete()
                    self._data.state = "stopped"
                end
            end
        end
    end
end

return setmetatable(AnimationHandler, { __call = function(_, ...) return _new(...) end })