return function()
    loveconsole:registerCommand("ds_showHitbox", "Part of DrawingSettings | aloo drawing hitboxes", function(_value)
        if type(toboolean(_value)) ~= "boolean" then
            loveconsole:trace("[ERROR] :: Invalid value type. Expected 'boolean' got '" .. type(_value) .. "'")
        end
        registers.showHitboxes = toboolean(_value)
    end)
    loveconsole:registerCommand("ds_wireframe", "Part of DrawingSettings | Set wireframe mode", function(_value)
        if type(toboolean(_value)) ~= "boolean" then
            loveconsole:trace("[ERROR] :: Invalid value type. Expected 'boolean' got '" .. type(_value) .. "'")
        end
        love.graphics.setWireframe(toboolean(_value))
    end)
    loveconsole:registerCommand("map_load", "Part of DrawingSettings | Set wireframe mode", function(_value)
        if type(tonumber(_value)) == "number" then
            playstate.currentLevel = tonumber(_value)
            loveconsole:trace("[EVENT] : Loading map data")
            gamestate.switch(playstate)
        end
    end)
end