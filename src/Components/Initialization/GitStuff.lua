local GitStuff = {}

function GitStuff.getAll()
    local commitID = io.popen("git rev-parse HEAD"):read("*all")
    local branch = io.popen("git rev-parse --abbrev-ref HEAD"):read("*all")
    local status = io.popen("git status --porcelain"):read("*all")

    io.printf("{brightYellow}[CommitID] : " .. commitID .. "{reset}\n")
    io.printf("{brightMagenta}[CommitID] : " .. branch .. "{reset}\n")
    io.printf("{cyan}[CommitID] : " .. status .. "{reset}\n")
end

return GitStuff