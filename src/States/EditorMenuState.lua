EditorMenuState = {}

function EditorMenuState:enter()
    Conductor = require 'src.Components.Modules.Game.Conductor'
    particleController = require 'src.Components.Modules.Game.Graphics.ParticleController'

    menu = helium.scene.new(true)

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

    menu:activate()

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

    fadeOpacity = 1
end

function EditorMenuState:draw()
    love.graphics.setBlendMode("add")
        ctlr:draw(love.graphics.getWidth() + 128, -128)
        bgctlr:draw(love.graphics.getWidth() + 128, -128)
    love.graphics.setBlendMode("alpha")
    menu:draw()
end

function EditorMenuState:update(elapsed)
    ctlr:update(elapsed)
    bgctlr:update(elapsed)

    menu:update(elapsed)
end

return EditorMenuState