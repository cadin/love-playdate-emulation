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

function love.keypressed(key, code)
	if key == "d" then
		useDevice = not useDevice
		setPlaydateWindow(useDevice, SCALE)

	elseif key=="1" then
		SCALE = 1
		setPlaydateWindow(useDevice, SCALE)
	elseif key=="2" then
		SCALE = 2
		setPlaydateWindow(useDevice, SCALE)
	elseif key=="3" then
		SCALE = 3
		setPlaydateWindow(useDevice, SCALE)
	elseif key=="4" then
		SCALE = 4
		setPlaydateWindow(useDevice, SCALE)
	end

	keypressed(key, code)
end

function love.draw() 
	love.graphics.setCanvas(canvas) 
		drawGame()
	love.graphics.setCanvas()
	
	love.graphics.setColor(1, 1, 1, 1)
	playdateDraw(useDevice, SCALE)
end