local VersionModule = {}

function VersionModule.check()
    io.printf("{bgBrightWhite}{brightBlack}[SYSTEM]{reset} : Checking for updates...\n")
    local code, serverVersion = https.request("https://raw.githubusercontent.com/Doge2Dev/OpenNeonix/master/.appversion")
    if code == 200 then
        if serverVersion ~= VERSION.ENGINE then
            io.printf("{bgBrightWhite}{brightBlack}[SYSTEM]{reset} : Need update game\n")
            return true
        end
    else
        io.printf("{bgBrightWhite}{brightBlack}[SYSTEM]{reset}{bgRed}{brightWhite}[ERROR]{reset} : Failed to check version\n")
        return false
    end
end

return VersionModule