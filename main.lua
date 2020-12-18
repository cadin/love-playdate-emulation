require("playdate-env")
require("game")

local SCALE = 2
local useDevice = false

local canvas


function love.load()
	setPlaydateWindow(useDevice, SCALE)
	canvas = createPlaydateCanvas(WHITE)
	loadGame(canvas)
end

function love.update(dt) 
	updateGame(dt)
end

function love.keypressed(key)
	if key == "d" then
		useDevice = not useDevice
		setPlaydateWindow(useDevice, SCALE)
	end
end

function love.draw() 
	drawGame(canvas)
	love.graphics.setColor(1, 1, 1, 1)

	playdateDraw(useDevice, SCALE)
end