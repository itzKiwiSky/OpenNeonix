EditorState = {}

function EditorState:init()
    editorGrid = require 'src.Components.Modules.Game.Editor.Grid'

    objectsImg, objectsQuads = love.graphics.getQuads("assets/images/objects")

    menumain:stop()
end

function EditorState:enter()
    -- do level loading thingie --

end

function EditorState:draw()
    editorGrid()
end

function EditorState:update(elapsed)

end

return EditorState