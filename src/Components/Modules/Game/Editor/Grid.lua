return function()
    for y = 0, love.graphics.getHeight(), 32 do
        for x = 0, love.graphics.getWidth(), 32 do
            love.graphics.points(x, y)
        end
    end
end