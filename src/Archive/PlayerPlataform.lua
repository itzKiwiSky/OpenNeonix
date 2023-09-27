local playerplatform = {}

function playerplatform:new(_x, _y)
    playerObject = object.new(_x, _y, {collider = "", state = {}})
    playerObject.properties.collider = world:newRectangleCollider(_x, _y, 32, 32)
    playerObject.properties.collider:setFixedRotation(true)
    playerObject.properties.collider:setCollisionClass("Player")
    playerObject.properties.state.isGrounded = false
    playerObject.properties.state.isJumping = false
    playerObject.properties.state.isReverse = false
    playerObject:loadGraphic("resources/images/player.png")
    playerObject:centerOrigin()
end

function playerplatform:draw()
    playerObject:draw()
end

function playerplatform:getPosition()
    return playerObject.properties.collider:getPosition()
end

function playerplatform:update()
    local cx, cy = playerObject.properties.collider:getPosition()
    local vx, vy = playerObject.properties.collider:getLinearVelocity()
    playerObject.x = cx
    playerObject.y = cy
    if playerObject.properties.collider:enter("Block") then
        playerObject.properties.state.isGrounded = true
        playerObject.properties.state.isJumping = false
    end
    if playerObject.properties.collider:enter("Spike") then
        playroomstate:enter()
    end
    if not playerObject.properties.state.isReverse then
        if vx < 250 then
            playerObject.properties.collider:applyForce(3000, 0)
        end
    else
        if vx > 250 then
            playerObject.properties.collider:applyForce(-3000, 0)
        end
    end
    if love.keyboard.isDown("space", "up") and playerObject.properties.state.isGrounded then
        playerObject.properties.state.isJumping = true
        playerObject.properties.state.isGrounded = false
        playerObject.properties.collider:applyLinearImpulse(0, -630)
    end
end

return playerplatform