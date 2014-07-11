obj = {}
obj.objects = {}
obj.objpath = "entities/"
local register = {}
local id = 0

function obj.startup()
	register["box"] = love.filesystem.load( obj.objpath .. "box.lua" )
  register["crewman"] = love.filesystem.load( obj.objpath .. "crewman.lua" )
    register["backgroundmaker"] = love.filesystem.load( obj.objpath .. "backgroundmaker.lua" )
end

function obj.derive(name)
	return love.filesystem.load( obj.objpath .. name .. ".lua" )()
end

function obj.create(name, x, y)
	if not x then
		x = 0
	end
	
	if not y then
		y = 0
	end
	
	if register[name] then
		id = id + 1
		local instance = register[name]()
		instance:load()
		instance:setPos(x, y)
		instance.id = id
		obj.objects[#obj.objects + 1] = instance
		return obj.objects[#obj.objects]
	else
		print("Error: Entity " .. name .. " does not exist! Snap!")
		return false;
	end
end

function obj:update(dt)
	for i, instance in pairs(obj.objects) do
		if instance.update then
			instance:update(dt)
		end
	end
end

function obj:draw()
	for i, instance in pairs(obj.objects) do
		if instance.draw then
			instance:draw()
		end
	end
end