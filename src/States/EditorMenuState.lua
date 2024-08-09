EditorMenuState = {}

function EditorMenuState:enter()
    Conductor = require 'src.Components.Modules.Game.Conductor'
    --ParticleController = require 'src.Components.Modules.Game.Graphics.ParticleController'

    fadeOpacity = 1

    if not menumain then
        menumain = love.audio.newSource("assets/sounds/tracks/future_base.ogg", "static")
        menumain:setLoop(true)
        menumain:play()
    else
        if not menumain:isPlaying() then
            menumain:setLoop(true)
            menumain:play()
        end
    end
    menumain:setVolume(registers.system.settings.audio.music)

    --particleBGFX = ParticleController("assets/data/particles/EditorListBGParticles.lua")

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
        --particleBGFX:emit()
    end)
end

function EditorMenuState:draw()
    love.graphics.setBlendMode("add")
        particleBGFX:draw(0, love.graphics.getHeight())
    love.graphics.setBlendMode("alpha")

    love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.setBlendMode("add")
            love.graphics.draw(fxGradient, 0, love.graphics.getHeight() - 512, 0, 1280, -glowFXSize)
        love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(1, 1, 1, fadeOpacity)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)
end

function EditorMenuState:update(elapsed)
    --particleBGFX:update(elapsed)
    fadeOpacity = math.lerp(fadeOpacity, 0, 0.005)

    Conductor.songPos = (menumain:tell() * 1000)
    Conductor:update(elapsed)

    if enterCamAnimTransitionRunning then
        enterCamTweenGroup:update(elapsed)
    end

    glowFXSize = math.lerp(glowFXSize, 0, Conductor.bpm)
end

return EditorMenuState