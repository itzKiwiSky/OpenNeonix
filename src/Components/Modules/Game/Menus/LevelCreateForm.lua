local color = function(s, a) return {loveframes.Color(s:gsub("#", ""), a)} end

return function()
    

    local levelNameInput = loveframes.Create("textinput")
    levelNameInput.drawfunc = function(this)
        local x = this:GetX()
        local y = this:GetY()
        local width = this:GetWidth()
        local height = this:GetHeight()
        local font = this:GetFont()
        local focus = this:GetFocus()
        local showindicator = this:GetIndicatorVisibility()
        local alltextselected = this:IsAllTextSelected()
        local textx = this:GetTextX()
        local texty = this:GetTextY()
        local text = this:GetText()
        local multiline = this:GetMultiLine()
        local lines = this:GetLines()
        local placeholder = this:GetPlaceholderText()
        local offsetx = this:GetOffsetX()
        local offsety = this:GetOffsetY()
        local indicatorx = this:GetIndicatorX()
        local indicatory = this:GetIndicatorY()
        local vbar = this:HasVerticalScrollBar()
        local hbar = this:HasHorizontalScrollBar()
        local linenumbers = this:GetLineNumbersEnabled()
        local itemwidth = this:GetItemWidth()
        local masked = this:GetMasked()
        local theight = font:getHeight("a")
        
        love.graphics.setColor(color("#000000"))
        love.graphics.rectangle("fill", x, y, width, height)
        
        if alltextselected then
            local bary = 0
            if multiline then
                for i=1, #lines do
                    local str = lines[i]
                    if masked then
                        str = loveframes.utf8.gsub(str, ".", "*")
                    end
                    local twidth = font:getWidth(str)
                    if twidth == 0 then
                        twidth = 5
                    end
                    love.graphics.setColor(color("#555555"))
                    love.graphics.rectangle("fill", textx, texty + bary, twidth, theight)
                    bary = bary + theight
                end
            else
                local twidth = 0
                if masked then
                    local maskchar = this:GetMaskChar()
                    twidth = font:getWidth(loveframes.utf8.gsub(text, ".", maskchar))
                else
                    twidth = font:getWidth(text)
                end
                love.graphics.setColor(color("#555555"))
                love.graphics.rectangle("fill", textx, texty, twidth, theight)
            end
        end
        
        if showindicator and focus then
            love.graphics.setColor(color("#ffffff"))
            love.graphics.rectangle("fill", indicatorx, indicatory, 1, theight)
        end
        
        if not multiline then
            this:SetTextOffsetY(height/2 - theight/2)
            if offsetx ~= 0 then
                this:SetTextOffsetX(0)
            else
                this:SetTextOffsetX(5)
            end
        else
            if vbar then
                if offsety ~= 0 then
                    if hbar then
                        this:SetTextOffsetY(5)
                    else
                        this:SetTextOffsetY(-5)
                    end
                else
                    this:SetTextOffsetY(5)
                end
            else
                this:SetTextOffsetY(5)
            end
            
            if hbar then
                if offsety ~= 0 then
                    if linenumbers then
                        local panel = this:GetLineNumbersPanel()
                        if vbar then
                            this:SetTextOffsetX(5)
                        else
                            this:SetTextOffsetX(-5)
                        end
                    else
                        if vbar then
                            this:SetTextOffsetX(5)
                        else
                            this:SetTextOffsetX(-5)
                        end
                    end
                else
                    this:SetTextOffsetX(5)
                end
            else
                this:SetTextOffsetX(5)
            end
            
        end
        
        textx = this:GetTextX()
        texty = this:GetTextY()
        
        love.graphics.setFont(font)
        
        if alltextselected then
            love.graphics.setColor(color("#000000"))
        elseif #lines == 1 and lines[1] == "" then
            love.graphics.setColor(color("#505050"))
        else
            love.graphics.setColor(color("#ffffff"))
        end
        
        local str = ""
        if multiline then
            for i=1, #lines do
                str = lines[i]
                if masked then
                    local maskchar = this:GetMaskChar()
                    str = loveframes.utf8.gsub(str, ".", maskchar)
                end
                skin.PrintText(#str > 0 and str or (#lines == 1 and placeholder or ""), textx, texty + theight * i - theight)
            end
        else
            str = lines[1]
            if masked then
                local maskchar = this:GetMaskChar()
                str = loveframes.utf8.gsub(str, ".", maskchar)
            end
            skin.PrintText(#str > 0 and str or placeholder, textx, texty)
        end
    end

    levelNameInput:SetFont(fontcache.getFont("comfortaa_light", 20))
    levelNameInput:SetSize(256, 64)

end