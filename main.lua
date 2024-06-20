love.filesystem.load("src/Components/Initialization/Run.lua")()
love.filesystem.load("src/Components/Initialization/ErrorHandler.lua")()

AssetHandler = require("src.Components.Helpers.AssetManager")()

VERSION = {
    ENGINE = "0.0.1",
    FORMATS = "0.0.1"
}

function love.initialize(args)
    lollipop.currentSave.game = {}
    lollipop.initializeSlot("game")

    AssetHandler:init()

    registers = {

    }

    local states = love.filesystem.getDirectoryItems("src/States")
    for s = 1, #states, 1 do
        require("src.States." .. states[s]:gsub(".lua", ""))
    end

    if DEBUG_APP then
        love.filesystem.createDirectory("editor")
        love.filesystem.createDirectory("editor/maps")
    end

    gamestate.registerEvents()
    gamestate.switch(DebugState)
end