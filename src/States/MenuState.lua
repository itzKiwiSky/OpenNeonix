MenuState = {}

function MenuState:enter()
    MenuController = require 'src.Components.Modules.Game.Menu.MenuController'
    MenuItem = require 'src.Components.Modules.Game.Menu.MenuItem'
    MenuBGParticles = require 'src.Components.Modules.Game.Menu.MenuParticleSystem'
    clickzone = require 'src.Components.Modules.Game.Menu.SelectionClick'

    MenuBGP = MenuBGParticles()

    sunBG = love.graphics.newImage("assets/images/menus/sun.png")
    sunGlow = love.graphics.newImage("assets/images/menus/lightDot.png")

    menuCam = camera(love.graphics.getWidth() / 2, -love.graphics.getHeight() - 512)

    menuIcons = {
        normal = love.graphics.newImage("assets/images/menus/selectionNormal.png"),
        editor = love.graphics.newImage("assets/images/menus/selectionEditor.png"),
        customize = love.graphics.newImage("assets/images/menus/selectionPlayerEditor.png")
    }

    menuGlow = love.graphics.newShader("assets/shaders/Glow.glsl")
    menuGlow:send("size", {love.graphics.getDimensions()})
    menuGlow:send("samples", 6)
    menuGlow:send("quality", 3.4)

    menuContent = {
        {
            icon = menuIcons.editor,
            title = languageService["menu_selection_normal_title"],
            selected = false,
            sizeMulti = 0,
            textAlpha = 0,
        },
        {
            icon = menuIcons.normal,
            title = languageService["menu_selection_editor_title"],
            selected = false,
            sizeMulti = 0,
            textAlpha = 0,
        },
        {
            icon = menuIcons.customize,
            title = languageService["menu_selection_char_editor_title"],
            selected = false,
            sizeMulti = 0,
            textAlpha = 0,
        }
    }

    sunRotation = 0
    --MenuController.addItem()

    f_menuSelection = fontcache.getFont("quicksand_regular", 32)
    f_optionDesc = fontcache.getFont("quicksand_light", 24)

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

        love.graphics.printf(languageService["menu_selection_title"], f_menuSelection, 0, 128, love.graphics.getWidth(), "center")

        --love.graphics.rectangle("fill", optionBoxX, love.graphics.getHeight() / 2 - 256 / 2, 256, 256, 15)
        for i = 1, #menuContent, 1 do
            local optionListBoxW = love.graphics.getWidth() - (256 / #menuContent)
            local fraction = optionListBoxW / #menuContent
            local optionBoxW = fraction - 16
            local optionBoxX = 256 + i * fraction - fraction / 2 - optionBoxW / 2
            --love.graphics.rectangle("fill", optionBoxX, love.graphics.getHeight() / 2 - 256 / 2, 256, 256, 15)
            if not menuContent[i].btn then
                menuContent[i].btn = clickzone(optionBoxX - 128, (love.graphics.getHeight() / 2) - 128, 256, 256)
            end
            if menuContent[i].btn:hovered() then
                menuContent[i].sizeMulti = 0.04
                menuContent[i].textAlpha = 1
            end
            love.graphics.draw(
                menuContent[i].icon, optionBoxX, love.graphics.getHeight() / 2, 0, 
                (256 / menuContent[i].icon:getWidth()) + menuContent[i].sizeMulti, (256 / menuContent[i].icon:getHeight())  + menuContent[i].sizeMulti, 
                menuContent[i].icon:getWidth() / 2, menuContent[i].icon:getHeight() / 2
            )

            love.graphics.setColor(1, 1, 1, menuContent[i].textAlpha)
                love.graphics.printf(menuContent[i].title, f_optionDesc, optionBoxX - 128, (love.graphics.getHeight() / 2) + 148, 256, "center")
            love.graphics.setColor(1, 1, 1, 1)
        end
    menuCam:detach()
end

function MenuState:update(elapsed)
    MenuBGP:update(elapsed)

    for i = 1, #menuContent, 1 do
        menuContent[i].sizeMulti = math.lerp(menuContent[i].sizeMulti, 0, 0.1)
        menuContent[i].textAlpha = math.lerp(menuContent[i].textAlpha, 0, 0.1)
    end

    if enterCamAnimTransitionRunning then
        flux.update(elapsed)
    end
end

function MenuState:mousepressed(x, y, button)
    
end

return MenuState