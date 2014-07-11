local instance = obj.derive("base")

function instance:load( x, y )
	self:setPos( x, y )
	self.w = 64
	self.h = 64
end

function instance:setSize( w, h )
	self.w = w
	self.h = h
end

function instance:getSize()
	return self.w, self.h;
end

function instance:update(dt)
	self.y = self.y + 32*dt
end

function instance:draw()
	local x, y = self:getPos()
	local w, h = self:getSize()
	
	love.graphics.setColor( 0, 70,40, 84 )
	love.graphics.rectangle( "fill", x, y, w, h )
end

return instance;