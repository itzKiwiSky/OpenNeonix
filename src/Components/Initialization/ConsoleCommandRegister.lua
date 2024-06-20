return function(cmd)
    cmd:newCommand("echo", function(...)
        local args = {...}
        cmd:trace(string.format("[%s] : %s", os.date("%Y-%m-%d %H:%M:%S"), table.concat(args, " ")))
        return
    end)
    cmd:newCommand("tools", function(...)
        local args = {...}

        if args[1] == "editor" then
            if args[2] then
                local mapDir = love.filesystem.getInfo("editor/maps/" .. EditorState.currentMap .. ".nbdata")
                if mapDir then
                    EditorState.currentMap = tostring(args[2])
                    gamestate.switch(EditorState)
                end
            else
                EditorState.currentMap = ""
                gamestate.switch(EditorState)
            end
        end
    end)
end