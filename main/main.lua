function love.load()
	require("entities")
	obj.startup()
 obj.create("box",10,10)
end

function love.draw()

	obj:draw()
end

function love.update(dt)
	
	obj:update(dt)
end
