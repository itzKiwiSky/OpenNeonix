return function(assets, percentage, items)
    --love.graphics.draw(assets.kiwiLogo, love.graphics.getWidth() / 2, 300, 0, 0.5, 0.5, assets.kiwiLogo:getWidth() / 2, assets.kiwiLogo:getHeight() / 2)
    love.graphics.draw(assets.nxlogo, love.graphics.getWidth() / 2, 200, 0, 0.3, 0.3, assets.nxlogo:getWidth() / 2, assets.nxlogo:getHeight() / 2)
    love.graphics.rectangle("line", love.graphics.getWidth() / 2 - (256 / 2), 400, 256, 32)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2 - (256 / 2), 400, math.floor(256 * (percentage / items)), 32)
end
