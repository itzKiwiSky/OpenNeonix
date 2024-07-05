MenuState = {}

function MenuState:enter()
    MenuController = require 'src.Components.Modules.Game.Menu.MenuController'
    MenuItem = require 'src.Components.Modules.Game.Menu.MenuItem'
    MenuBGParticles = require 'src.Components.Modules.Game.Menu.MenuParticleSystem'

    MenuBGP = MenuBGParticles()

    sunBG = love.graphics.newImage("assets/images/menus/sun.png")
    sunGlow = love.graphics.newImage("assets/images/menus/lightDot.png")

    menuCam = camera(love.graphics.getWidth() / 2, -love.graphics.getHeight() - 512)

    menuIcons = {
        normal = love.graphics.newImage("assets/images/menus/selectionNormal.png"),
        editor = love.graphics.newImage("assets/images/menus/selectionEditor.png"),
    }

    menuGlow = love.graphics.newShader("assets/shaders/Glow.glsl")
    menuGlow:send("size", {love.graphics.getDimensions()})
    menuGlow:send("samples", 6)
    menuGlow:send("quality", 3.4)

    menuContent = {
        {
            icon = menuIcons.normal,
            title = languageService["menu_selection_normal_title"],
            description = languageService["menu_selection_normal_description"],
            selected = false,
        }
    }

    sunRotation = 0
    --MenuController.addItem()

    enterCamAnimTransitionRunning = true
    enterCamTween = flux.to(menuCam, 3, {y = love.graphics.getHeight() / 2})
    enterCamTween:ease("backout")
    enterCamTween:oncomplete(function()
        enterCamAnimTransitionRunning = false
    end)
end

function MenuState:draw()
    menuCam:attach()
        love.graphics.setBlendMode("add")
        love.graphics.draw(MenuBGP, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
        love.graphics.draw(sunGlow, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, sunBG:getWidth() / sunGlow:getWidth(), sunBG:getHeight() / sunGlow:getHeight(), sunGlow:getWidth() / 2, sunGlow:getHeight() / 2)
        love.graphics.setBlendMode("alpha")
        love.graphics.draw(sunBG, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 0.55, 0.55, sunBG:getWidth() / 2, sunBG:getHeight() / 2)

        --love.graphics.rectangle("fill", optionBoxX, love.graphics.getHeight() / 2 - 256 / 2, 256, 256, 15)
        for i = 1, #menuContent, 1 do
            local optionListBoxW = love.graphics.getWidth() - 64
            local fraction = optionListBoxW / #menuContent
            local optionBoxW = 256 - 10
            local optionBoxX = 256 + i * fraction / 2 - optionBoxW / 2
            love.graphics.rectangle("fill", optionBoxX, love.graphics.getHeight() / 2 - 256 / 2, 256, 256, 15)
        end
        love.graphics.stencil(function()
            for i = 1, #menuContent, 1 do
                local optionListBoxW = love.graphics.getWidth() - 64
                local fraction = optionListBoxW / #menuContent
                local optionBoxW = 256 - 10
                local optionBoxX = 256 + i * fraction / 2 - optionBoxW / 2
                love.graphics.rectangle("fill", optionBoxX, love.graphics.getHeight() / 2 - 256 / 2, 256, 256, 15)
            end
        end, "replace", 1)
    menuCam:detach()
end

function MenuState:update(elapsed)
    MenuBGP:update(elapsed)
    if enterCamAnimTransitionRunning then
        flux.update(elapsed)
    end
end

return MenuState