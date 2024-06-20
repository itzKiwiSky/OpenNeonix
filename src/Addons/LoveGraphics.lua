local lgSetColor = love.graphics.setColor

function love.graphics.getQuads(filename)
    local image = love.graphics.newImage(filename .. ".png")
    local jsonData = love.filesystem.read(filename .. ".json")
    local sparrow = json.decode(jsonData)

    local Quads = {}
    for i = 1, #sparrow.frames, 1 do
        local Quad = love.graphics.newQuad(
            sparrow.frames[i].frame.x,
            sparrow.frames[i].frame.y,
            sparrow.frames[i].frame.w,
            sparrow.frames[i].frame.h,
            image
        )

        table.insert(Quads, Quad)
    end
    return image, Quads
end

-- Color multipler
local COLOR_MUL = love._version >= "11.0" and 1 or 255

function love.graphics.newGradient(dir, ...)
    -- Check for direction
    local isHorizontal = true
    if dir == "vertical" then
        isHorizontal = false
    elseif dir ~= "horizontal" then
        error("bad argument #1 to 'gradient' (invalid value)", 2)
    end

    -- Check for colors
    local colorLen = select("#", ...)
    if colorLen < 2 then
        error("color list is less than two", 2)
    end

    -- Generate mesh
    local meshData = {}
    if isHorizontal then
        for i = 1, colorLen do
            local color = select(i, ...)
            local x = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {x, 1, x, 1, color[1] / 255, color[2] / 255, color[3] / 255, color[4] or 255 / 255}
            meshData[#meshData + 1] = {x, 0, x, 0, color[1] / 255, color[2] / 255, color[3] / 255, color[4] or 255 / 255}
        end
    else
        for i = 1, colorLen do
            local color = select(i, ...)
            local y = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {1, y, 1, y, color[1] / 255, color[2] / 255, color[3] / 255, color[4] or 255 / 255}
            meshData[#meshData + 1] = {0, y, 0, y, color[1] / 255, color[2] / 255, color[3] / 255, color[4] or 255 / 255}
        end
    end

    -- Resulting Mesh has 1x1 image size
    return love.graphics.newMesh(meshData, "strip", "static")
end

local function _normalizeColor(value)
    if type(value) == "number" then
        if value >= 0 and value <= 1 then
            return value
        elseif value >= 0 and value <= 255 then
            return value / 255
        else
            error("Color value must be between 0 and 1 or between 0 and 255.")
        end
    else
        error("Color value must be a number.")
    end
end

function love.graphics.setColor(_r, _g, _b, _a)
    if type(_r) == "string" then
        local r, g, b, a = _r:match("#(%x%x)(%x%x)(%x%x)(%x%x)")
        if r then
            r = tonumber(r, 16) / 0xff
            g = tonumber(g, 16) / 0xff
            b = tonumber(b, 16) / 0xff
            if a then
                a = tonumber(a, 16) / 0xff
            end
        end
        lgSetColor(r, g, b, a or 1)
    elseif type(_r) == "table" then
        if #_r >= 3 then
            if _r.r then
                if _r.a then
                    lgSetColor(
                        _normalizeColor(_r.r),
                        _normalizeColor(_r.g),
                        _normalizeColor(_r.b),
                        _normalizeColor(_r.a)
                    )
                else
                    lgSetColor(
                        _normalizeColor(_r.r),
                        _normalizeColor(_r.g),
                        _normalizeColor(_r.b),
                        1
                    )
                end
            else
                if _r[4] then
                    lgSetColor(
                        _normalizeColor(_r[1]),
                        _normalizeColor(_r[2]),
                        _normalizeColor(_r[3]),
                        _normalizeColor(_r[4])
                    )
                else
                    lgSetColor(
                        _normalizeColor(_r[1]),
                        _normalizeColor(_r[2]),
                        _normalizeColor(_r[3]),
                        1
                    )
                end
            end
        else
            error("Invalid table length for color")
        end
    else
        lgSetColor(
            _normalizeColor(_r),
            _normalizeColor(_g),
            _normalizeColor(_b),
            _normalizeColor(_a or 1)
        )
    end
end

return love.graphics