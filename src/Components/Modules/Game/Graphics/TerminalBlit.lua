local TerminalBlit = {}

local chars = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    '!', '@', '#', '$', '%', '&', '*', '\\', '/', '?', ';', ':'
}

local function _contains(_table, _value)
    for _, v in ipairs(_table) do
        if v == _value then
            return true
        end
    end
    return false
end

local function _getItem(_table, _value)
    for _, v in ipairs(_table) do
        if v == _value then
            return  _
        end
    end
    return nil
end

function TerminalBlit.write(_text, _x, _y, _type)

    local types = {
        ["small"] = "8",
        ["big"] = "16"
    }

    assert(types[_type], "Invalid size")

    local tchrs = {}
    for s in string.gmatch(_text:lower(), ".") do
        table.insert(tchrs, s)
    end

    local cx = _x

    for _, c in ipairs(tchrs) do
        if _contains(chars, c) then
            termview:blitSprite(string.format("assets/data/rpd/letters/%s/l%s.rpd", types[_type], _getItem(chars, c)), cx, _y)
            cx = _x + _ * tonumber(types[_type])
        end
    end
end

return TerminalBlit