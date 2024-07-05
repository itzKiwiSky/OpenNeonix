love.filesystem.load("src/Components/Initialization/Run.lua")()
love.filesystem.load("src/Components/Initialization/ErrorHandler.lua")()

--AssetHandler = require("src.Components.Helpers.AssetManager")()

VERSION = {
    ENGINE = "0.0.1",
    FORMATS = "0.0.1",
    meta = {
        commitID = "",
        branch = "",
    }
}

function love.initialize(args)
    fontcache = require 'src.Components.Modules.System.FontCache'
    versionChecker = require 'src.Components.Modules.API.CheckVersion'
    Presence = require 'src.Components.Modules.API.Presence'
    GameColors = require 'src.Components.Modules.Utils.GameColors'
    LanguageController = require 'src.Components.Modules.System.LanguageManager'
    connectGJ = require 'src.Components.Modules.API.InitializeGJ'
    connectDiscordRPC = require 'src.Components.Modules.API.InitializeDiscord'


    fontcache.init()

    lollipop.currentSave.game = {
        user = {
            settings = {
                video = {
                    shaders = true,
                    particleEffects = true,
                    fullscreen = false,
                    colors = true,
                    backgrounds = true,
                },
                audio = {
                    master = 75,
                    music = 75,
                    sfx = 50,
                },
                misc = {
                    language = "English",
                    discordrpc = true,
                    gamejolt = {
                        username = "",
                        usertoken = ""
                    },
                    checkForUpdates = true,
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

    languageService = LanguageController(lollipop.currentSave.game.user.settings.misc.language)

    registers = {
        user = {
            player = {
                assets = {
                    gradient = nil
                },
                gamejoltConnected = false,
            }
        },
        system = {
            settings = {
                audio = {
                    master = lollipop.currentSave.game.user.settings.audio.master,
                    music = lollipop.currentSave.game.user.settings.audio.music,
                    sfx = lollipop.currentSave.game.user.settings.audio.sfx,
                }
            },
            gameTime = 0
        }
    }


    local gitStuff = require 'src.Components.Initialization.GitStuff'
    Presence = require 'src.Components.Modules.API.Presence'
    connectGJ()
    
    if lollipop.currentSave.game.user.settings.misc.discordrpc then
        connectDiscordRPC()
    end

    if not love.filesystem.isFused() then
        gitStuff.getAll()

        if love.filesystem.getInfo(".nxid") then
            local title = love.window.getTitle()
            love.window.setTitle(title .. " | " .. love.filesystem.read(".nxid"))
        end
    end

    local states = love.filesystem.getDirectoryItems("src/States")
    for s = 1, #states, 1 do
        require("src.States." .. states[s]:gsub(".lua", ""))
    end

    if DEBUG_APP then
        love.filesystem.createDirectory("editor")
        love.filesystem.createDirectory("editor/maps")
    end

    gamestate.registerEvents()

    if lollipop.currentSave.game.user.settings.misc.checkForUpdates then
        if versionChecker.check() then
            gamestate.switch(OutdatedState)
        end
    end
    gamestate.switch(TitleState)
end

function love.update(elapsed)
    discordrpc.runCallbacks()
    if gamejolt.isLoggedIn then
        registers.system.gameTime = registers.system.gameTime * elapsed
        if math.floor(registers.system.gameTime) > 25 then
            gamejolt.pingSession(true)
            registers.system.gameTime = 0
        end
    end
end

function love.quit()
    gamejolt.closeSession()
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