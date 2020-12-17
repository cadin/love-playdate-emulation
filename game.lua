local x = 25
local y = 25

local friction = 0.85

local acc = 2

local velX = 0
local velY = 0

function loadGame()

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

	if (x > 380 and velX > 0) or (x < 20 and velX < 0) then 
		velX = velX * -0.8
	end

	if (y > 220 and velY > 0) or (y < 20 and velY < 0) then
		velY = velY * -0.8
	end

	x = x + velX 
	y = y + velY 
	
end


function drawGame(canvas)
	love.graphics.setCanvas(canvas)        
		love.graphics.clear(WHITE)
		love.graphics.setColor(BLACK)
		love.graphics.circle('line', math.floor(x), math.floor(y), 20)
		love.graphics.circle("fill", math.floor(x), math.floor(y), 1)
	love.graphics.setCanvas()
end