EditorLevelListState = {}

function EditorLevelListState:enter()
    Conductor = require 'src.Components.Modules.Game.Conductor'
    ParticleController = require 'src.Components.Modules.Game.Graphics.ParticleController'

    if crymsonEdgeMenuTheme then
        crymsonEdgeMenuTheme = love.audio.newSource("assets/sounds/Tracks/crymson_edge.ogg", "static")
    end
    crymsonEdgeMenuTheme:setVolume(registers.system.settings.audio.music)

    particleBGFX = ParticleController("assets/data/particles/EditorListBGParticles.lua")

    editorLevelList = love.filesystem.getDirectoryItems("editor/edited")
    editorHubParticles = require("src.Components.Modules.Game.Menu.EditorMenu.EditorMenuParticles")()

    menuCam = camera(love.graphics.getWidth() + 512)

    f_menuSelection = fontcache.getFont("quicksand_regular", 32)
    f_optionDesc = fontcache.getFont("quicksand_light", 24)

    fxGradient = love.graphics.newGradient("vertical", {255, 255, 255, 255}, {0, 0, 0, 0})

    glowFXSize = 0

    knifeevent.hook(Conductor, { "beatHit" })
    knifeevent.on("beatHit", function()
        glowSize = 512
        particleBGFX:emit()
    end)

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
        particleBGFX:draw(0, love.graphics.getHeight())
    love.graphics.setBlendMode("alpha")

    love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.setBlendMode("add")
            love.graphics.draw(fxGradient, 0, love.graphics.getHeight() - 512, 0, 1280, -glowFXSize)
        love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)
end

function EditorLevelListState:update(elapsed)
    particleBGFX:update(elapsed)

    Conductor.songPos = (crymsonEdgeMenuTheme:tell() * 1000)
    Conductor:update(elapsed)

    if enterCamAnimTransitionRunning then
        enterCamTweenGroup:update(elapsed)
    end

    glowFXSize = math.lerp(glowFXSize, 0, Conductor.bpm)
end

return EditorLevelListState