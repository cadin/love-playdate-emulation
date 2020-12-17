require("playdate-env")
require("game")

local SCALE = 2
local canvas

function love.load()
	playdateWindow(SCALE)
	canvas = createPlaydateCanvas(WHITE)
	loadGame(canvas)
end

function love.update(dt) 
	updateGame(dt)
end

function love.draw() 
	drawGame(canvas)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.draw(canvas, 0, 0, 0, SCALE, SCALE)
end