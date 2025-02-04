local module = {}
module.__index = module

function module.new(_width:number?,_height:number?,_init:any?)
	local mapdata = {}
	mapdata.map = {}
	mapdata.width = _width or 16
	mapdata.height = _height or 16
	for y=1,mapdata.height do
		table.insert(mapdata.map,{})
		for x=1,mapdata.width do
			table.insert(mapdata.map[y],_init or 0)
		end
	end
	return setmetatable(mapdata,module)
end

function module:inside(x:number,y:number):boolean
	return x > 0 and x <= self.width and y > 0 and y <= self.height
end

function module:get(x:number,y:number):any
	if self:inside(x,y) then
		return self.map[y][x]
	end
	warn("couldint get map (out of bounds)")
	return nil
end

function module:set(x:number,y:number,s:any):boolean
	if self:inside(x,y) then
		self.map[y][x] = s
		return true
	end
	warn("couldint set map (out of bounds)")
	return false
end

--pure get and set functions

function module:pureget(x:number,y:number):any
	return self.map[y][x]
end

function module:pureset(x:number,y:number,s:any)
	self.map[y][x] = s
end

return module
