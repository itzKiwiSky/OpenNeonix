function love.graphics.SetColor(r, g, b, a)
    love.graphics.setColor(r or 255 / 255, g or 255 / 255, b or 255 / 255, a or 255 / 255)
end

function love.graphics.setHexColor(hex, value)
	return {tonumber(string.sub(hex, 2, 3), 16)/255, tonumber(string.sub(hex, 4, 5), 16)/255, tonumber(string.sub(hex, 6, 7), 16)/255, value or 1}
end

return love.graphics