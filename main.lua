love.filesystem.load("src/Components/Initialization/Run.lua")()
love.filesystem.load("src/Components/Initialization/ErrorHandler.lua")()

AssetHandler = require("src.Components.Helpers.AssetManager")()

VERSION = {
    ENGINE = "0.0.1",
    FORMATS = "0.0.1"
}

function love.initialize(args)
    local gitStuff = require 'src.Components.Initialization.GitStuff'
    require("src.Components.Modules.API.InitializeGJ")()
    require("src.Components.Modules.API.InitializeDiscord")()

    gitStuff.getAll()

    lollipop.currentSave.game = {
        user = {
            settings = {
                video = {},
                audio = {},
                misc = {
                    language = "en",
                    gamejolt = {
                        username = "",
                        usertoken = ""
                    }
                }
            }
        }
    }

    if lollipop.currentSave.game.user.settings.misc.gamejolt.username ~= "" and lollipop.currentSave.game.user.settings.misc.gamejolt.usertoken ~= "" then
        gamejolt.authUser(
            lollipop.currentSave.game.user.settings.misc.gamejolt.username,
            lollipop.currentSave.game.user.settings.misc.gamejolt.usertoken
        )
        gamejolt.openSession()
        io.printf(string.format("{bgGreen}{brightWhite}{bold}[Gamejolt]{reset}{brightWhite} : Client connected (%s, %s, %s){reset}", gamejolt.username, gamejolt.userToken))
    end

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

function discordrpc.ready(userId, username, discriminator, avatar)
    io.printf(string.format("{bgBlue}{brightBlue}{bold}[Discord]{reset}{brightBlue} : Client connected (%s, %s, %s){reset}", userId, username, discriminator))
end