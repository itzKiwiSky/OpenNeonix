return helium(function(param, view)
    return function()
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", param.x, param.y, view.w, view.h)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle("line", param.x, param.y, view.w, view.h)
        love.graphics.rectangle("line", param.x + 5, param.y + 3, view.w - 3, view.h - 3)
    end
end)