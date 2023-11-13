function love.load(args)
    love.math.setRandomSeed(os.time())

    -- control --
    gamestate = require 'libraries.control.gamestate'
    camera = require 'libraries.control.camera'
    timer = require 'libraries.control.timer'
    loveconsole = require 'libraries.control.loveconsole'
    object = require 'libraries.control.object'
    lume = require 'libraries.control.lume'
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
    registers = {
        showHitboxes = false
    }

    availableColors = {
        {255, 0, 0},
        {170, 0, 0},
        {128, 0, 0},    --% ThSun <3
        {0, 255, 0},
        {0, 170, 0},
        {0, 128, 0},
        {0, 0, 255},
        {0, 0, 170},
        {0, 0, 128},
        {255, 255, 0},
        {170, 170, 0},
        {128, 128, 0},
        {255, 0, 255},
        {170, 0, 170},
        {128, 0, 128},
        {0, 255, 255},
        {0, 170, 170},
        {0, 128, 128},
        {255, 85, 0},   --% ayanoTheFoxy <3
        {188, 63, 0},
        {116, 39, 0},
        {113, 56, 27},
        {86, 42, 18},
        {60, 28, 12},
        {167, 62, 255},
        {126, 39, 199},
        {74, 20, 120},
        {0, 255, 162},
        {0, 165, 105},
        {0, 113, 72},
        {255, 0, 106},
        {191, 0, 80},
        {124, 0, 52},
        {255, 255, 255},
        {170, 170, 170},
        {128, 128, 128},
        {109, 109, 109},
        {67, 67, 67},
        {0, 0, 0},
    }

    _SaveData_ = {
        playerdata = {
            iconId = 1,
            frontColorID = 1,
            backColorID = 5
        },
        achievements = {},
        levelsCompleted = {},
        settings = {
            glowShader = true,
            blurShaderMenu = true,
            musicVolume = 6,
            menuMusic = "vaporize",
        }
    }
    _initializeSave()

    love.graphics.setNewFont("resources/fonts/quicksand-medium.ttf", 20)

    love.audio.setVolume(_SaveData_.settings.musicVolume / 10)

    require('src.Components.Init')()
    
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
    gamestate.switch(preloaderstate)
end

function love.draw()
    gamestate.current():draw()
    loveconsole:render()
end

function love.update(elapsed)
    loveconsole:update()
end

function love.textinput(text)
    suit.textinput(text)
    loveconsole:textinput(text)
end

function love.keypressed(k)
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

function _initializeSave()
    if not love.filesystem.getInfo("nxdata.nxsave") then
        savefile = love.filesystem.newFile("nxdata.nxsave", "w")
        savefile:write(lume.serialize(_SaveData_))
        savefile:close()
    end
    _loadData()
end

function _saveDataTable()
    if not love.filesystem.getInfo("nxdata.nxsave") then
        savefile = love.filesystem.newFile("nxdata.nxsave", "w")
        savefile:write(lume.serialize(_SaveData_))
        savefile:close()
    else
        love.filesystem.write("nxdata.nxsave", lume.serialize(_SaveData_))
    end
end

function _loadData()
    if not love.filesystem.getInfo("nxdata.nxsave") then
        savefile = love.filesystem.newFile("nxdata.nxsave", "w")
        savefile:write(lume.serialize(_SaveData_))
        savefile:close()
    else
        _SaveData_ = lume.deserialize(love.filesystem.read("nxdata.nxsave"))
    end
end