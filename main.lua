love.filesystem.load("src/Components/Initialization/Run.lua")()
love.filesystem.load("src/Components/Initialization/ErrorHandler.lua")()

AssetHandler = require("src.Components.Helpers.AssetManager")()

VERSION = {
    ENGINE = "0.0.1",
    FORMATS = "0.0.1"
}

function love.initialize(args)
    Presence = require 'src.Components.Modules.API.Presence'
    GameColors = require 'src.Components.Modules.Utils.GameColors'


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
            },
            customization = {
                player = {
                    type = "vertical",
                    colors = {
                        GameColors[1],
                        GameColors[1]
                    }
                }
            }
        }
    }

    lollipop.initializeSlot("game")

    registers = {
        user = {
            player = {
                assets = {
                    gradient = nil
                }
            }
        }
    }


    local gitStuff = require 'src.Components.Initialization.GitStuff'
    Presence = require 'src.Components.Modules.API.Presence'
    require("src.Components.Modules.API.InitializeGJ")()
    require("src.Components.Modules.API.InitializeDiscord")()

    gitStuff.getAll()


    AssetHandler:init()

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

function love.update(elapsed)
    discordrpc.runCallbacks()
end

function love.quit()
    discordrpc.shutdown()
end

function discordrpc.ready(userId, username, discriminator, avatar)
    io.printf(string.format("{bgBlue}{brightBlue}{bold}[Discord]{reset}{brightBlue} : Client connected (%s, %s, %s){reset}\n", userId, username, discriminator))
end

function discordrpc.disconnected(errorCode, message)
    io.printf(string.format("{bgBlue}{brightBlue}{bold}[Discord]{reset}{brightBlue} : Client disconnected (%d, %s){reset}\n", errorCode, message))
end

function discordrpc.errored(errorCode, message)
    io.printf(string.format("{bgBlue}{brightBlue}{bold}[Discord]{reset}{bgRed}{brightWhite}[Error]{reset}{brightWhite} : (%d, %s){reset}\n", errorCode, message))
end