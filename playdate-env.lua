-- global pd color values 
BLACK = {0,0,0}
WHITE = {0.747, 0.757, 0.743}

local SCREENW = 400
local SCREENH = 240


function playdateWindow(scale)
	local s = scale or 1

	love.graphics.setDefaultFilter("nearest", "nearest", 1)
	love.graphics.setLineStyle('rough')
	love.window.setMode(SCREENW * s, SCREENH * s)
end

function createPlaydateCanvas()
	local canvas = love.graphics.newCanvas(SCREENW, SCREENH)

	-- love.graphics.setCanvas(canvas)        
	-- 	love.graphics.clear(WHITE)

	-- 	love.graphics.setBlendMode("alpha")
	-- 	love.graphics.setColor(BLACK)
	-- 	love.graphics.circle('line', 150, 150, 50)
	-- love.graphics.setCanvas()
	return canvas
end