require("TSLib")
require("tsp")
require("AWZ")
require("smdate")

function upidfa(name,other)
	local url = 'http://idfa888.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or getDeviceName()
	idfalist.phoneimei = phoneimei or getDeviceType(); 
	idfalist.phoneos = phoneos or getOSType(); 
	idfalist.name = name
	idfalist.idfa = getidfa() or idfa 
	idfalist.ip = ip() or "192.168.1.1" 
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function getdate()
	local sz = require("sz")
	local json = sz.json
	local url = "http://news.wenfree.cn/phalapi/public/?"
	local arr = {}
    arr['service'] = 'App.Site.Idcard'
	local data = post(url,arr)
	if data then
--		log(data)
		return data
	end
end

--inf = getdate()
--log(inf)




init(0)

var = ''
appbid = 'com.ycgame.t11pub'
url = 'https://lnk0.com/Ql8QJ5?td_subid=9420001'



t = {}
t['openU_打开']={ 0x007aff, "29|-3|0x007aff,27|-6|0xffffff,-91|0|0x007aff", 90, 332, 597, 552, 658 } --多点找色

t['reg_快速游戏']={ 0x4f4f4f, "-6|-62|0xdf5c55,-4|-85|0xd41e13,0|-120|0xd41e13", 90, 53, 226, 160, 473 } --多点找色
t['reg_账号注册']={ 0x4a4a4a, "-3|-118|0x2dba41,-14|-85|0x2dba41,11|-84|0x2dba41", 90, 78, 483, 112, 654 } --多点找色
t['reg_账号注册界面']={ 0x4a90e2, "-16|-156|0x4a90e2,3|-359|0x9b9b9b,-3|-560|0x9b9b9b", 90, 4, 207, 133, 925 } --多点找色
t['reg_键盘完成']={ 0x007aff, "-5|-33|0x007aff", 90, 327, 1023, 489, 1107 } --多点找色
t['reg_进入游戏']={ 0xffffff, "-13|-73|0xf7c559,3|106|0xf4ac44,14|-55|0xf6ba5c", 90, 81, 428, 187, 705 } --多点找色
t['reg_选择角色']={{111,93,0x46424c},{197,86,0x4e4753},{295,94,0x4c4551},{394,88,0x48444d},{484,93,0x4c4651},{586,82,0x46424c},}  --多点取色
t['reg_选择角色_进入游戏6G']={ 0xf6b64e, "-8|-78|0xf7c155,-7|67|0xf7bf54", 90, 63, 906, 134, 1109 } --多点找色
t['reg_选择角色_进入游戏']={ 0xf5b14b, "-3|-46|0xf5b349,-4|90|0xf5b44c", 90, 53, 890, 130, 1114 } --多点找色
t['reg_跳过']={ 0xe4d2ad, "0|-4|0xe4d2ad,-2|-4|0xd4c198", 90, 610, 1081, 623, 1099 } --多点找色
t['reg_跳过1']={ 0xdcc9a2, "1|-2|0xe4d2ad", 90, 610, 1069, 625, 1089 } --多点找色
t['reg_流量下载确定']={ 0xe05140, "6|57|0xda4434,5|-79|0xdb4535", 90, 153, 436, 213, 693 } --多点找色
t['reg_滑动验证界面']={ 0xafb0b2, "17|95|0xffffff,-499|3|0xafb0b2,-507|40|0xffffff,-514|734|0xffffff,-483|761|0xafb0b2", 90, 30, 154, 598, 986 } --多点找色
t['reg_注册失败']={ 0xfe3233, "-35|-6|0xfe3233,-109|-3|0xf8f9fd,-10|-782|0xfe3233,-107|-772|0xf8f9fd", 90, 449, 152, 620, 968 } --多点找色

function openU()
	local timeline = os.time()
	local outtime = 30
	openURL(url)
	delay(3)
	while os.time() - timeline < outtime do
		if d('openU_打开',true) then
			delay(20)
			return true
		end
	end	
	return true
end





function reg()
	account = myRand(4,8)
	password = myRand(4,9)
	regdate = xinxi[math.random(1,#xinxi)]
	注册确认key = false
	local timeline = os.time()
	local outtime = math.random(300,360)
	while os.time() - timeline < outtime do
		if active(appbid,5) then
			if d('reg_注册失败') then
				return false
			elseif d('reg_账号注册',true) then
			elseif 注册确认key and d('reg_账号注册界面',true) then
			elseif d('reg_账号注册界面') then
				click(506,444)
				delay(2)
				inputword(account..'\n')
				delay(2)
				d('reg_键盘完成',true)
				click(401,372)
				inputword(password)
				delay(2)
				d('reg_键盘完成',true)
				click(306,506)
				input(regdate[1])
				delay(2)
				d('reg_键盘完成',true)
				click(206,536)
				inputword(regdate[2])
				delay(2)
				d('reg_键盘完成',true)
				click(306,506)
				click(596,866)
				input(regdate[1])
				delay(2)
				d('reg_键盘完成',true)
				注册确认key = true
			elseif d('reg_进入游戏',true) then
			elseif d('reg_跳过',true) or d('reg_跳过1',true) then
				return true
			elseif d('reg_流量下载确定',true) then
			elseif d('reg_选择角色_进入游戏',true) then
				click(87,1001)
			elseif d('reg_滑动验证界面') then
				moveTo(101,323,104,770)
			elseif d('reg_选择角色') then
				角色 = {{111,93,0x46424c},{197,86,0x4e4753},{295,94,0x4c4551},{394,88,0x48444d},{484,93,0x4c4651},{586,82,0x46424c},}
				key = 角色[math.random(1,6)]
				click(key[1],key[2])
			else
				click(462,107)
			end
		end	
		delay(1)
		log('休息1秒')
	end	
	return false
end


function reg1()
	account = myRand(4,8)
	password = myRand(4,9)
	regdate = xinxi[math.random(1,#xinxi)]
	注册确认key = false
	local timeline = os.time()
	local outtime = math.random(60,120)
	while os.time() - timeline < outtime do
		if active(appbid,5) then
			if d('reg_注册失败') then
				return false
			elseif d('reg_账号注册',true) then
			elseif 注册确认key and d('reg_账号注册界面',true) then
			elseif d('reg_账号注册界面') then
				click(506,444)
				delay(2)
				inputword(account..'\n')
				delay(2)
				d('reg_键盘完成',true)
				click(401,372)
				inputword(password)
				delay(2)
				d('reg_键盘完成',true)
				click(306,506)
				input(regdate[1])
				delay(2)
				d('reg_键盘完成',true)
				click(206,536)
				inputword(regdate[2])
				delay(2)
				d('reg_键盘完成',true)
				click(306,506)
				click(596,866)
				input(regdate[1])
				delay(2)
				d('reg_键盘完成',true)
				注册确认key = true
			elseif d('reg_进入游戏',true) then
			elseif d('reg_跳过',true) or d('reg_跳过1',true) then
				return true
			elseif d('reg_流量下载确定',true) then
			elseif d('reg_选择角色_进入游戏',true) then
				click(87,1001)
			elseif d('reg_滑动验证界面') then
				moveTo(101,323,104,770)
			elseif d('reg_选择角色') then
				角色 = {{111,93,0x46424c},{197,86,0x4e4753},{295,94,0x4c4551},{394,88,0x48444d},{484,93,0x4c4651},{586,82,0x46424c},}
				key = 角色[math.random(1,6)]
				click(key[1],key[2])
			else
				click(462,107)
			end
		end	
		delay(1)
		log('休息1秒')
	end	
	return true
end




----注册
--[[
while true do
	setAirplaneMode(true);  --打开飞行模式
	delay(15)
	setAirplaneMode(false); --关闭飞行模式
	delay(15)
--	vpnx()
--	delay(3)
	if true or vpn() then
		if awzNew() then
			if openU() then
				if reg() then
					reName('完成')
					upidfa('蜀门手游','注册完成')
				end
			end
		end
	end	
end
--]]--


----复登
--[[]]
while true do
	setAirplaneMode(true);  --打开飞行模式
	delay(15)
	setAirplaneMode(false); --关闭飞行模式
	delay(15)
--	vpnx()
--	delay(3)
	if true or vpn() then
		if awz_next() then
--			if openU() then
				if reg1() then
					reName('复登完成')
					upidfa('蜀门手游','复登完成')
				end
--			end
		end
	end	
end
--]]--



























