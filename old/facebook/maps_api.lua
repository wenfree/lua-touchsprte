require("AWZ")
require("facebook_name")




--NewPlace(location)
--maps 地图

--[[

	美国 	北不超 42.8115217451 
			最南于 32.0639555947
			
			最东 -82.4413955212
			最西 -119.4237420000

--]]


--随机生成地图
--NewPlace(location)
--随机lx
function lxly()
	ran = (math.random(1,#maps))
	local res
	local lx = (maps[ran][1] * 10000000000 - math.random(1000000,17000000))/10000000000
	local ly = (maps[ran][2] * 10000000000 - math.random(1000000,17000000))/10000000000
	if lx > 42.8115217451 then
		lx = 42.8115217451
	elseif lx < 32.0639555947 then
		lx = 32.0639555947
	end
	if ly > -82.4413955212 then
		ly = -82.4413955212
	elseif ly < -119.4237420000 then
		ly = -119.4237420000
	end
--	ly = math.abs(ly)
	res = ly.."_"..lx.."_"..maps[ran][3]
	nLog(res)
	return res
end



for i = 1,50 do
	
	if NewPlace(lxly())then
		mSleep(1000)
		awz_next()
	end
	mSleep(1000* 3)
	
end














































