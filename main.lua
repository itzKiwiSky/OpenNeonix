function love.load(args)
    -- control --
    gamestate = require 'libraries.control.gamestate'
    camera = require 'libraries.control.camera'
    timer = require 'libraries.control.timer'
    loveconsole = require 'libraries.control.loveconsole'
    -- filesystem --
    json = require 'libraries.filesystem.json'
    nativefs = require 'libraries.filesystem.nativefs'
    lip = require 'libraries.filesystem.lip'
    xml = require 'libraries.filesystem.xml'
    -- interface --
    suit = require 'libraries.interface.suit'
    gui = require 'libraries.interface.gspot'
    -- post processing --
    moonshine = require 'libraries.post-processing.moonshine'
    -- physics --
    bump = require 'libraries.physics.bump'
    windfield = require 'libraries.physics.windfield'
    -- utilities --
    collision = require 'libraries.utilities.collision'
    sti = require 'libraries.utilities.sti'
    cartographer = require 'libraries.utilities.cartographer'
    -- Basic 3D engine --
    g3d = require 'libraries.3D.g3d'

    -- Initialize a new console --
    loveconsole:init()

    -- resources --
    fonts = {
        alien = love.graphics.newFont("resources/fonts/alien.ttf", 12),
        quicksand = {
            light = love.graphics.newFont("resources/fonts/quicksand-light.ttf", 12),
            bold = love.graphics.newFont("resources/fonts/quicksand-bold.ttf", 12),
            medium = love.graphics.newFont("resources/fonts/quicksand-medium.ttf", 12),
            regular = love.graphics.newFont("resources/fonts/quicksand-regular.ttf", 12),
            semibold = love.graphics.newFont("resources/fonts/quicksand-semibold.ttf", 12),
        },
    }

    -- addons loader --
    Addons = love.filesystem.getDirectoryItems("libraries/addons")
    for addon = 1, #Addons, 1 do
        require("libraries.addons." .. string.gsub(Addons[addon], ".lua", ""))
    end

    -- default filter --
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- state loader--
    States = love.filesystem.getDirectoryItems("src/States")
    for state = 1, #States, 1 do
        require("src.States." .. string.gsub(States[state], ".lua", ""))
    end

    -- every argument passed to the game will direct to console
    if #args > 0 then
        console:run(table.concat(args, " "))
    end

    gamestate.registerEvents({'update', 'textinput', 'keypressed', 'mousepressed', 'mousereleased'})
    gamestate.switch(playstate)
end

function love.draw()
    gamestate.current():draw()
    suit.draw()
    loveconsole:render()
end

function love.update(elapsed)
    loveconsole:update()
end

function love.textinput(text)
    suit.textinput(text)
    loveconsole:textinput(text)
end

function love.textedited(text)
    suit.textedited(text)
end

function love.keypressed(k)
    suit.keypressed(k)
    loveconsole:keypressed(k)
end

function love.mousepressed(x, y, button)
    loveconsole:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
    loveconsole:mousereleased(x, y, button)
end

function _declareFonts(size)
    fonts = {
        alien = love.graphics.newFont("resources/fonts/alien.ttf", size),
        quicksand = {
            light = love.graphics.newFont("resources/fonts/quicksand-light.ttf", size),
            bold = love.graphics.newFont("resources/fonts/quicksand-bold.ttf", size),
            medium = love.graphics.newFont("resources/fonts/quicksand-medium.ttf", size),
            regular = love.graphics.newFont("resources/fonts/quicksand-regular.ttf", size),
            semibold = love.graphics.newFont("resources/fonts/quicksand-semibold.ttf", size),
        },
    }
end