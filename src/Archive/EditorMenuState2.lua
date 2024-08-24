EditorMenuState = {}

function EditorMenuState:enter()
    Conductor = require 'src.Components.Modules.Game.Conductor'
    particleController = require 'src.Components.Modules.Game.Graphics.ParticleController'
    --ParticleController = require 'src.Components.Modules.Game.Graphics.ParticleController'
    levelEditorList = require 'src.Components.Modules.Game.Menus.LevelEditorList'

    gui = suit.new()

    local gausBlurs = {
        moonshine(moonshine.effects.fastgaussianblur),
        moonshine(moonshine.effects.fastgaussianblur),
        moonshine(moonshine.effects.fastgaussianblur),
        moonshine(moonshine.effects.fastgaussianblur),
        moonshine(moonshine.effects.fastgaussianblur),
    }
    gausBlurs[1].fastgaussianblur.taps = 11
    gausBlurs[2].fastgaussianblur.taps = 15
    gausBlurs[3].fastgaussianblur.taps = 21
    gausBlurs[4].fastgaussianblur.taps = 37
    gausBlurs[5].fastgaussianblur.taps = 51

    levelEditorList()

    fadeOpacity = 1

    if not menumain then
        menumain = love.audio.newSource("assets/sounds/tracks/future_base.ogg", "static")
        menumain:setLooping(true)
        menumain:play()
    else
        if not menumain:isPlaying() then
            menumain:setLooping(true)
            menumain:play()
        end
    end
    menumain:setVolume(registers.system.settings.audio.music)

    ctlr = particleController("assets/data/particles/EditorStarBGParticles.lua")
    bgctlr = particleController("assets/data/particles/EditorStarBGParticles.lua")
    bgctlr.ps[1].system:setTexture(love.graphics.newImage("assets/images/menus/lightDot.png"))

    editorLevelList = love.filesystem.getDirectoryItems("editor/edited")

    f_menuSelection = fontcache.getFont("comfortaa_regular", 32)
    f_optionDesc = fontcache.getFont("comfortaa_light", 24)

    fxGradient = love.graphics.newGradient("vertical", {255, 255, 255, 255}, {0, 0, 0, 0})

    glowSize = 0
end

function EditorMenuState:draw()
    love.graphics.setBlendMode("add")
        ctlr:draw(love.graphics.getWidth() + 128, -128)
        bgctlr:draw(love.graphics.getWidth() + 128, -128)
    love.graphics.setBlendMode("alpha")

    love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.setBlendMode("add")
            love.graphics.draw(fxGradient, 0, love.graphics.getHeight(), 0, 1280, -glowSize)
        love.graphics.setBlendMode("alpha")
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setColor(0, 0, 0, fadeOpacity)
        love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1, 1)

    loveframes.draw()
    gui:draw()
end

function EditorMenuState:update(elapsed)
    loveframes.update(elapsed)
    --particleBGFX:update(elapsed)
    fadeOpacity = math.lerp(fadeOpacity, 0, 0.01)

    ctlr:update(elapsed)
    bgctlr:update(elapsed)

    --Conductor.songPos = (menumain:tell() * 1000)
    --Conductor:update(elapsed)

    print(debug.formattable(gui:Button("teste", {id = 1}, 90, 90, 128, 32)))
    error("breakpoint")

    glowSize = math.lerp(glowSize, 0, 0.01)
end

function EditorMenuState:mousepressed(x, y, button)
    loveframes.mousepressed(x, y, button)
end

function EditorMenuState:mousereleased(x, y, button)
    loveframes.mousereleased(x, y, button)
end

function EditorMenuState:keypressed(k, isrepeat)
    loveframes.keypressed(k, isrepeat)
    gui:keypressed(k)
end

function EditorMenuState:textinput(t)
    gui:textinput(t)
end

function EditorMenuState:wheelmoved(x, y)
    loveframes.wheelmoved(x, y)
end

return EditorMenuState