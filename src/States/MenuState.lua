MenuState = {}

function MenuState:enter()
    --menuComposer = require 'src.Components.Modules.Game.Menus.MenuComposer'
    menuList = require 'src.Components.Modules.Game.Menus.MenuListController'

    effect = moonshine(moonshine.effects.crt).chain(moonshine.effects.glow)

    bootsfx = love.audio.newSource("assets/sounds/bootsfx.ogg", "static")
    bootbeep = love.audio.newSource("assets/sounds/beepBoot.ogg", "static")
    if not menumain then
        menumain = love.audio.newSource("assets/sounds/tracks/future_base.ogg", "static")
    end

    if not menumain:isPlaying() then
        menumain:play()
    end

    local termFont = fontcache.getFont("compaqthin", 22)
    termview = terminal(love.graphics.getWidth(), love.graphics.getHeight(), termFont)
    termview.speed = 5000

    print(termview.width, termview.height)

    termview:hideCursor()

    termview:frame("line", 1, 1, termview.width, termview.height)
    termview:print(math.floor(termview.width / 2 - #("NX-DOS v0.0.1") / 2), 1, "NX-DOS v0.0.1")
    termview:blitSprite("assets/data/rpd/doslogo.rpd", math.floor(termview.width / 2 - 49 / 2), 2)

    menu = menuList(termview, "center", 18, 10, "double")

    menu:addItems({
        {
            label = "Story Mode",
            action = function()
                
            end
        },
        {
            label = "Editor Mode",
            action = function()
                
            end
        },
        {
            label = "Player Customization",
            action = function()
                
            end
        },
        {
            label = "Settings",
            action = function()
                
            end
        },
        {
            label = "Shutdown",
            action = function()
                
            end
        }
    })

    menu:compose()

    --termview:fill("grid", 2, 13, termview.width - 2, termview.height - 13)
end

function MenuState:draw()
    effect(function()
        do
            local scale = 1
            local scaleX, scaleY = (love.graphics.getWidth() / termview.canvas:getWidth()) * scale, (love.graphics.getHeight() / termview.canvas:getHeight()) * scale
            love.graphics.push()
                love.graphics.translate((love.graphics.getWidth() * (1 - scale)) / 2, (love.graphics.getHeight() * (1 - scale)) / 2)
                love.graphics.scale(scaleX, scaleY)
                termview:draw()
            love.graphics.pop()
        end
    end)
end

function MenuState:update(elapsed)
    termview:update(elapsed)
end

function MenuState:keypressed(k)
    menu:updateKeyboard(k)
end

return MenuState