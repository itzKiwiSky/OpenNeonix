local color = function(s, a) return {loveframes.Color(s:gsub("#", ""), a)} end

local btnStyle = function(this)

    local skin = this:GetSkin()
    local x = this:GetX()
    local y = this:GetY()
    local width = this:GetWidth()
    local height = this:GetHeight()
    local hover = this:GetHover()
    local text = this:GetText()
    local font = this:GetFont() or skin.controls.smallfont
    local twidth = font:getWidth(this.text)
    local theight = font:getHeight(this.text)
    local down = this:GetDown()
    local checked = this.checked
    local enabled = this:GetEnabled()
    local clickable = this:GetClickable()
    local back, fore, border
    
    love.graphics.setFont(font)
    
    if not enabled or not clickable then
        back   = color("#000000")
        fore   = color("#ffffff")
        border = color("#ffffff")
        -- button body
        love.graphics.setColor(back)
        love.graphics.rectangle("fill", x, y, width, height)
        -- button text
        love.graphics.setFont(font)
        love.graphics.setColor(skin.controls.color_back3)
        skin.PrintText(text, x + width/2 - twidth/2, y + height/2 - theight/2)
        -- button border
        love.graphics.setColor(border)
        skin.OutlinedRectangle(x, y, width, height)
        return
    end
    
    if this.toggleable then
        if hover then
            if down then
                back   = color("#999999")
                fore   = color("#000000")
                border = color("#ffffff")
            else
                back   = color("#000000")
                fore   = color("#ffffff")
                border = color("#ffffff")
            end
        else
            if this.toggle then
                back   = color("#999999")
                fore   = color("#000000")
                border = color("#ffffff")
            else
                back   = color("#000000")
                fore   = color("#ffffff")
                border = color("#ffffff")
            end
        end
        
        -- button body
        love.graphics.setColor(back)
        love.graphics.rectangle("fill", x, y, width, height)
        -- button text
        love.graphics.setColor(fore)
        skin.PrintText(text, x + width/2 - twidth/2, y + height/2 - theight/2)
        -- button border
        love.graphics.setColor(border)
        skin.OutlinedRectangle(x, y, width, height)
        
    else
        if down or checked then
            back   = color("#ffffff")
            fore   = color("#000000")
            border = color("#ffffff")
        elseif hover then
            back   = color("#999999")
            fore   = color("#000000")
            border = color("#ffffff")
        else
            back   = color("#000000")
            fore   = color("#ffffff")
            border = color("#ffffff")
        end
        
        -- button body
        love.graphics.setColor(back)
        love.graphics.rectangle("fill", x, y, width, height)
        -- button text
        if this.image then
            love.graphics.setColor(skin.controls.color_image)
            love.graphics.draw(this.image, x + 5,  y + height/2 - this.image:getHeight()/2)
        end
        
        love.graphics.setColor(fore)
        skin.PrintText(text, x + width/2 - twidth/2, y + height/2 - theight/2)
        -- button border
        love.graphics.setColor(border)
        skin.OutlinedRectangle(x, y, width, height)
    end
    
    love.graphics.setColor(skin.controls.color_back0)
    skin.OutlinedRectangle(x + 1, y + 1, width - 2, height - 2)
end

return function()
    local lvls = love.filesystem.getDirectoryItems("editor/edited")

    local lvllist = loveframes.Create("list")
    lvllist:SetSize(love.graphics.getWidth() - 300, love.graphics.getHeight() - 200)
    lvllist:SetPadding(8)
    lvllist:SetSpacing(8)
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
            --local data = love.data.decode("string", "base64", love.data.decode("string", "hex", love.data.decompress("string", "gzip", json.decode(love.filesystem.read("editor/edited/" .. l)))))
            -- for debug only --
            local data = json.decode(love.filesystem.read("editor/edited/" .. l))

            local lvlBtn = loveframes.Create("button")
            lvlBtn:SetFont(fontcache.getFont("comfortaa_regular", 28))
            lvlBtn:SetText(data.meta.title)
            lvlBtn.drawfunc = btnStyle
            lvlBtn:SetHeight(64)
            lvlBtn.OnClick = function(this, x, y)
                registers.system.editor.currentLevelFile = l
                registers.system.editor.currentLevelName = data.meta.title
                gamestate.switch(EditorState)
            end
            lvllist:AddItem(lvlBtn)
        end
    end

    local createButton = loveframes.Create("button")
    createButton.drawfunc = btnStyle
    createButton:SetSize(128, 64)
    createButton:SetFont(fontcache.getFont("comfortaa_regular", 28))
    createButton:SetText("Create Level")
    createButton:SetX(love.graphics.getWidth() / 2 - 200)
    createButton:SetY(love.graphics.getHeight() - 200)
    createButton.OnClick = function(this, x, y)
        loveframes.SetState("create")
    end
end