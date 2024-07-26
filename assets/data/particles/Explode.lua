local particles = {x=-47, y=5}

local image1 = love.graphics.newImage("assets/images/menus/lightDot.png")
image1:setFilter("linear", "linear")

local ps = love.graphics.newParticleSystem(image1, 70)
ps:setColors(1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 0)
ps:setDirection(-1.5707963705063)
ps:setEmissionArea("none", 0, 0, 0, false)
ps:setEmissionRate(41.396278381348)
ps:setEmitterLifetime(0)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(90, 90)
ps:setParticleLifetime(0.66894632577896, 3.3865406513214)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(0, 0)
ps:setSizes(0.40000000596046)
ps:setSizeVariation(0)
ps:setSpeed(86.251770019531, 318.97845458984)
ps:setSpin(0, 0)
ps:setSpinVariation(0)
ps:setSpread(6.2831854820251)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=0, kickStartDt=0, emitAtStart=70, blendMode="add", shader=nil, texturePath="lightDot.png", texturePreset="lightDot", shaderPath="", shaderFilename="", x=0, y=0})

return particles