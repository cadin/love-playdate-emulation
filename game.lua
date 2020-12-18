local x = 25
local y = 25

local friction = 0.85

local acc = 2

local velX = 0
local velY = 0

local dir = 1

function loadGame()
	bee = love.graphics.newImage("images/bee.png")

	frames = {}
	local frameW = 35
	local frameH = 35

	for i=0, 2 do
		table.insert(frames, love.graphics.newQuad(i * frameW, 0, frameW, frameH, 105, 35))
	end

	currentFrame = 1
end

function updateGame(dt)
	

	if love.keyboard.isDown("up") then
		velY = velY - acc
	elseif love.keyboard.isDown("down") then 
		velY = velY + acc
	elseif love.keyboard.isDown("left") then 
		velX = velX - acc
	elseif love.keyboard.isDown("right") then
		velX = velX + acc
	end

	velX = velX * friction
	velY = velY * friction

	if (x > 385 and velX > 0) or (x < 15 and velX < 0) then 
		velX = velX * -0.8
	end

	if (y > 225 and velY > 0) or (y < 15 and velY < 0) then
		velY = velY * -0.8
	end

	x = x + velX 
	y = y + velY 
	currentFrame = currentFrame + 20 * dt

	if velX < 0 then
		dir = -1 
	else 
		dir = 1
	end

	if currentFrame > 4 then
		currentFrame = 1
	end
	
end


function drawGame(canvas)
	love.graphics.setCanvas(canvas)        
		love.graphics.clear(WHITE)
		love.graphics.draw(bee, frames[math.floor(currentFrame)], math.floor(x-(17* dir)), math.floor(y-17), 0,dir, 1)
	love.graphics.setCanvas()
end