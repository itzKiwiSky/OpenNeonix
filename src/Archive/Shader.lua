local shader = {}

function shader:init()
    self.state = true

    --local shaderCode = [[
    --    extern vec2 mousePos;
    --    extern number radius;
    --    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) 
    --    {
    --        vec4 pixel = Texel(texture, texture_coords);
    --        number distance = distance(mousePos, screen_coords);
    --        number alpha = 1.0 - distance / radius;
    --        return vec4(pixel.rgb, alpha * pixel.a);
    --    }
    --]]



    self.shader = love.graphics.newShader("resources/shaders/fade.glsl")
    self.shader:send("radius", 130) -- tamanho do círculo em pixels
end

function shader:attach()
    if self.state then
        love.graphics.setShader(self.shader)
    else
        love.graphics.setShader()
    end
end

function shader:detach()
    love.graphics.setShader()
end

function shader:send(_name, _vector, ...)
    self.shader:send(_name, _vector, ...)
end

function shader.set(_state)
    self.state = _state
end

function shader:toggle()
    if self.state then
        self.state = false
    else
        self.state = true
    end
end

return shader