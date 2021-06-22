-- global pd color values 
BLACK = {0.193, 0.184, 0.158}
WHITE = {0.747, 0.757, 0.743}
PURPLE = {0.461, 0, 0.967}

local SCREENW = 400
local SCREENH = 240
local DEVICE_SCALE_1x = 1.18

local canvas
local deviceImg
local deviceScale = 1.18
local scaleDeviceView = false

lcdShader = love.graphics.newShader[[
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
	vec4 pixel = Texel(texture, texture_coords );
	if(pixel.r < 0.65) {
		return vec4(0.193, 0.184, 0.158, pixel.a);
	} else {
		return vec4(0.747, 0.757, 0.743, pixel.a);
	}
}
]]

function setPlaydateWindow(useDevice, scale)
	love.graphics.setLineStyle('rough')
	if useDevice then
		playdateDevice(scale)
	else 
		playdateWindow(scale)
	end
end

function toggleDeviceViewScaling()
	scaleDeviceView = not scaleDeviceView
end

function setDeviceScale(scale)
	if scaleDeviceView then
		deviceScale = DEVICE_SCALE_1x * scale
	else 
		deviceScale = DEVICE_SCALE_1x
	end
end

function playdateDevice(scale)
	setDeviceScale(scale)

	love.graphics.setBackgroundColor(PURPLE)
	deviceImg = love.graphics.newImage("images/device-wShadow.png")
	love.window.setMode(600 * deviceScale, 509 * deviceScale, { highdpi=false})
	if scaleDeviceView then
		love.window.setTitle("Playdate @" .. scale .. "x")
	else 
		love.window.setTitle("Playdate")
	end
end

function playdateWindow(scale)
	local s = scale or 1
	love.window.setMode(SCREENW * s, SCREENH * s)
	love.window.setTitle("Playdate Screen @" .. scale .. "x")
end

function createPlaydateCanvas()
	canvas = love.graphics.newCanvas(SCREENW, SCREENH)
	canvas:setFilter("nearest", "nearest", 1)
	return canvas
end

function playdateDraw(useDevice, scale)
	if useDevice then
		local canvasScale  = 1
		if scaleDeviceView then canvasScale = scale end
		love.graphics.draw(deviceImg, 0, 0, 0, 0.5 * deviceScale)
		love.graphics.setShader(lcdShader)
		love.graphics.draw(canvas, 66 * canvasScale, 64 * canvasScale, 0, canvasScale)
	else
		love.graphics.setShader(lcdShader)
		love.graphics.draw(canvas, 0, 0, 0, scale, scale)
	end
	love.graphics.setShader()
end