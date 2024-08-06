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

function TerminalBlit.write(_text, _x, _y)
    local tchrs = {}
    for s in string.gmatch(_text:lower(), ".") do
        table.insert(tchrs, s)
    end
    print(debug.formattable(tchrs))

    local cx = _x

    for _, c in ipairs(tchrs) do
        if _contains(chars, c) then
            print(cx, _y)
            termview:blitSprite(string.format("assets/data/rpd/letters/l%s.rpd", _getItem(chars, c)), cx, _y)
            cx = _x + _ * 8
        end
    end
end

return TerminalBlit