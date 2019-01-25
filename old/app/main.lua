function name()
	math.randomseed(tostring(os.time()):reverse())
	local ming=function() 
		return string.char(math.random(0xe5,0xe8))..string.char(math.random(0x80,0xbf))..string.char(math.random(0x80,0xbf))
	end
	local ming1=function() 
		return string.char(math.random(0xe5,0xe8))..string.char(math.random(0x80,0xbf))..string.char(math.random(0x80,0xbf))
	end
	return ming()..ming1()
end



--inputText("1123123")

require("TSLib")
inputStr("1123123")