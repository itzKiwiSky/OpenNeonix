--[[
module = {
	x=emitterPositionX, y=emitterPositionY,
	[1] = {
		system=particleSystem1,
		kickStartSteps=steps1, kickStartDt=dt1, emitAtStart=count1,
		blendMode=blendMode1, shader=shader1,
		texturePreset=preset1, texturePath=path1,
		shaderPath=path1, shaderFilename=filename1,
		x=emitterOffsetX, y=emitterOffsetY
	},
	[2] = {
		system=particleSystem2,
		...
	},
	...
}
]]
local particles = {x=-195, y=-79}

local image1 = love.graphics.newImage("assets/images/menus/glowStar.png")
image1:setFilter("linear", "linear")
local image2 = love.graphics.newImage("assets/images/menus/lightDot.png")
image2:setFilter("linear", "linear")

local ps = love.graphics.newParticleSystem(image1, 241)
ps:setColors(1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 0)
ps:setDirection(-1.5707963705063)
ps:setEmissionArea("uniform", 825.72778320313, 23.156900405884, 0, false)
ps:setEmissionRate(0)
ps:setEmitterLifetime(0)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(256, 256)
ps:setParticleLifetime(1.7999999523163, 2.2000000476837)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(-3.1415927410126, 0)
ps:setSizes(0.0086312536150217, 0.051574405282736, 0.13053439557552)
ps:setSizeVariation(1)
ps:setSpeed(17.168695449829, 121.03828430176)
ps:setSpin(-1.9091534614563, 3.8834676742554)
ps:setSpinVariation(1)
ps:setSpread(0.31415927410126)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=0, kickStartDt=0, emitAtStart=241, blendMode="add", shader=nil, texturePath="glowStar.png", texturePreset="", shaderPath="", shaderFilename="", x=0, y=0})

local ps = love.graphics.newParticleSystem(image2, 292)
ps:setColors(1, 1, 1, 0, 1, 1, 1, 0.50390625, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 0)
ps:setDirection(-1.5707963705063)
ps:setEmissionArea("uniform", 825.72778320313, 23.156900405884, 0, false)
ps:setEmissionRate(0)
ps:setEmitterLifetime(0)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(90, 90)
ps:setParticleLifetime(1.7999999523163, 2.2000000476837)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(-3.1415927410126, 0)
ps:setSizes(0.072033673524857, 0.17049390077591, 0.58351534605026)
ps:setSizeVariation(1)
ps:setSpeed(53.098430633545, 318.97845458984)
ps:setSpin(-1.9091534614563, 3.8834676742554)
ps:setSpinVariation(1)
ps:setSpread(0.31415927410126)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=0, kickStartDt=0, emitAtStart=292, blendMode="add", shader=nil, texturePath="lightDot.png", texturePreset="lightDot", shaderPath="", shaderFilename="", x=0, y=0})

return particles
