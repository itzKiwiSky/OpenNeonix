local Expander = {
    insts = {}
}

function Expander.add(_texture, _w, _h, _lifetime, _decayTime, _speed)
    table.insert(Expander.insts, {
        texture = (type(_texture) == "string" and love.graphics.newImage(_texture) or _texture),
        sizeX = _w,
        sizeY = _h,
        lifetime = _lifetime,
        speed = _speed,
        decay = _decayTime,
        time = _lifetime,
        alpha = 1
    })
end

function Expander.draw(_x, _y, _r)
    for i = 1, #Expander.insts, 1 do
        local self = Expander.insts[i]
        if self then
            love.graphics.setColor(1, 1, 1, self.alpha)
            love.graphics.draw(self.texture, _x, _y, _r, self.sizeX, self.sizeY, self.texture:getWidth() / 2, self.texture:getHeight() / 2)
            love.graphics.setHexColor("#ffffffff")
        end
    end
end

function Expander.update(elapsed)
    for i = 1, #Expander.insts, 1 do
        local self = Expander.insts[i]
        
        if self then
            self.sizeX = self.sizeX + self.speed * elapsed
            self.sizeY = self.sizeY + self.speed * elapsed
    
            self.lifetime = self.lifetime - self.decay
            self.alpha = self.alpha - self.decay
    
            if self.lifetime <= 0 then
                table.remove(Expander.insts, i)
            end
        end
    end
end

return Expander