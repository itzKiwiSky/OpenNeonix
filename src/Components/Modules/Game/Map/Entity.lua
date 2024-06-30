local Entity = class:extend()

function Entity:new(_x, _y, _w, _h)
    self.x = _x
    self.y = _y
    self.w = _w
    self.h = _h

    self.last = {}
    self.last.x = self.x
    self.last.y = self.y

    self.strength = 0
end

function Entity:update(elapsed)
    -- We'll leave this empty for now.
    self.last.x = self.x
    self.last.y = self.y
end

function Entity:checkCollision(e)
    -- e will be the other entity with which we check if there is collision.
    -- This is the final compact version from chapter 13
    return self.x + self.w > e.x
    and self.x < e.x + e.w
    and self.y + self.h > e.y
    and self.y < e.y + e.h
end

function Entity:wasVerticallyAligned(e)
    -- It's basically the collisionCheck function, but with the x and w part removed.
    -- It uses last.y because we want to know this from the previous position
    return self.last.y < e.last.y + e.h and self.last.y + self.h > e.last.y
end

function Entity:wasHorizontallyAligned(e)
    -- It's basically the collisionCheck function, but with the y and h part removed.
    -- It uses last.x because we want to know this from the previous position
    return self.last.x < e.last.x + e.w and self.last.x + self.w > e.last.x
end

function Entity:collide(e, direction)
    if direction == "right" then
        local pushback = self.x + self.w - e.x
        self.x = self.x - pushback
    elseif direction == "left" then
        local pushback = e.x + e.w - self.x
        self.x = self.x + pushback
    elseif direction == "bottom" then
        local pushback = self.y + self.h - e.y
        self.y = self.y - pushback
    elseif direction == "top" then
        local pushback = e.y + e.h - self.y
        self.y = self.y + pushback
    end
end

function Entity:resolveCollision(e)
    if self.strength > e.strength then
        return e:resolveCollision(self)
    end

    if self:checkCollision(e) then
        if self:wasVerticallyAligned(e) then
            if self.x + self.w/2 < e.x + e.w/2  then
                self:collide(e, "right")
            else
                self:collide(e, "left")
            end
        elseif self:wasHorizontallyAligned(e) then
            if self.y + self.h/2 < e.y + e.h/2 then
                self:collide(e, "bottom")
            else
                -- pusback = the bottom side of the wall - the top side of the player
                self:collide(e, "top")
            end
        end
        return true
    end
    return false
end

return Entity