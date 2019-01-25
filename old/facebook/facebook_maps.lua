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
	
--	ly = math.abs(ly)
	res = ly.."_"..lx.."_"..maps[ran][3]
	mapss = maps[ran][3]
	nLog(res)
	return res
end
--NewPlace(lxly())

function phonelist(mun)
	toast(" 准备开始 ",1)
	mSleep( 1000 * 2 )
	removeAllContactsFromAB(); 

	addAB = {}
	for i= 1, mun do
		addAB[i] =  {
						lastname= usa_xin[math.random(1,#usa_xin)],
						firstname=usa_name[math.random(1,#usa_name)],
						mobile= 00 ..math.random(16260000000,16269999999),
					}
		mSleep(20)
		nLog(addAB[i].lastname .."--".. addAB[i].firstname .."--".. addAB[i].mobile)
	end

	for _,v in ipairs(addAB) do
		addContactToAB(v)
	end
	toast("导入完成",1)
end










































