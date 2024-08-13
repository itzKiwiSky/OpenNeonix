return function()
    local lvls = love.filesystem.getDirectoryItems("editor/edited")

    local lvllist = loveframes.Create("list")
    lvllist:SetSize(love.graphics.getWidth() - 300, love.graphics.getHeight() - 200)
    lvllist:SetPadding(5)
    lvllist:SetSpacing(5)
    lvllist:Center()
    lvllist.drawfunc = function(this)
        local skin = this:GetSkin()
        local x = this:GetX()
        local y = this:GetY()
        local width = this:GetWidth()
        local height = this:GetHeight()

        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.rectangle("fill", x, y, width, height)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setLineWidth(3)
        love.graphics.rectangle("line", x, y, width, height)
        love.graphics.setLineWidth(1)
        love.graphics.setColor(1, 1, 1, 1)
    end

    for _, l in ipairs(lvls) do
        local fl = love.filesystem.getInfo("editor/edited/" .. l)
        if fl then
            -- lua table -> json -> compress -> encode hex -> encode b64
            local data = love.data.decode("string", "base64", love.data.decode("string", "hex", love.data.decompress("string", "gzip", json.decode(love.filesystem.read("editor/edited/" .. l)))))

            local lvlPanelBack = loveframes.Create("panel")
            lvlPanelBack.drawfunc = function(this)
                local skin = this:GetSkin()
                local x = this:GetX()
                local y = this:GetY()
                local width = this:GetWidth()
                local height = this:GetHeight()
        
                love.graphics.setColor(0, 0, 0, 1)
                love.graphics.rectangle("fill", x, y, width, height)
                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.rectangle("line", x, y, width, height)
                love.graphics.setColor(1, 1, 1, 1)
            end

            local lvlText = loveframes.Create("text")
            lvlText:SetFont(fontcache.getFont("confortaa_regular", 26))
            lvlText:SetParent(lvlPanelBack)
            lvlText:SetText(fl:gsub("%.[^.]+$", ""))

            lvllist:AddItem(lvlPanelBack)
        end
    end
end