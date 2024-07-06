GamejoltLoginSubState = {}

function GamejoltLoginSubState:enter()
    -- box config --
    b_margin = 480
    b_lineWidth = 10
    b_padding = 24
    
    uiSubstateInTransitionRunning = true
    uiSubstateOutTransitionRunning = false

    substateGamejoltLoginCamera = camera(love.graphics.getWidth() / 2, love.graphics.getHeight() + 512)

    substateUIEnterTweenGroup = flux.group()
    substateUIEnterTween = substateUIEnterTweenGroup:to(substateGamejoltLoginCamera, 3, {y = love.graphics.getHeight() / 2})
    substateUIEnterTween:ease("backout")
    substateUIEnterTween:oncomplete(function()
        uiSubstateInTransitionRunning = false
    end)


    s_menuGlow = love.graphics.newShader("assets/shaders/Glow.glsl")
    s_menuGlow:send("size", {love.graphics.getDimensions()})
    s_menuGlow:send("samples", 6)
    s_menuGlow:send("quality", 3.4)
end

function GamejoltLoginSubState:draw()
    substateGamejoltLoginCamera:attach()
        love.graphics.setShader(s_menuGlow)
            love.graphics.rectangle("line", b_margin, love.graphics.getHeight() / 2 - b_margin / 2, love.graphics.getWidth() - b_margin, love.graphics.getHeight() - b_margin)
        love.graphics.setShader()
    substateGamejoltLoginCamera:detach()
end

function GamejoltLoginSubState:update(elapsed)
    if uiSubstateInTransitionRunning then
        substateUIEnterTweenGroup:update(elapsed)
    end
end

return GamejoltLoginSubState