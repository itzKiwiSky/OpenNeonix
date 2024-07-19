EditorLevelListState = {}

function EditorLevelListState:enter()


    editorLevelList = love.filesystem.getDirectoryItems("editor/edited")
    editorHubParticles = require("src.Components.Modules.Game.Menu.EditorMenu.EditorMenuParticles")()

    menuCam = camera(love.graphics.getWidth() + 512)

    f_menuSelection = fontcache.getFont("quicksand_regular", 32)
    f_optionDesc = fontcache.getFont("quicksand_light", 24)

    enterCamAnimTransitionRunning = true

    enterCamTweenGroup = flux.group()
    enterCamTween = enterCamTweenGroup:to(menuCam, 0.5, {x = love.graphics.getWidth() / 2})
    enterCamTween:ease("backout")
    enterCamTween:oncomplete(function()
        enterCamAnimTransitionRunning = false
    end)
end

function EditorLevelListState:draw()
    love.graphics.setBlendMode("add")
        love.graphics.draw(editorHubParticles, love.graphics.getWidth(), 0)
    love.graphics.setBlendMode("alpha")
end

function EditorLevelListState:update(elapsed)
    editorHubParticles:update(elapsed)
    if enterCamAnimTransitionRunning then
        enterCamTweenGroup:update(elapsed)
    end
end

return EditorLevelListState