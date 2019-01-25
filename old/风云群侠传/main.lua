require("TSLib")
require("tsp")
require("AWZ")
require("api")
require("ALZ")

-- awzNew()


local url1 = 'http://uri6.com/tkio/EJbauea' 
local url2 = 'http://uri6.com/tkio/V36ZZza'





init('0',1)
var = {}
var.phone = '18349101229'
var.bid = 'com.changwan.mdsg'
var.AppStore = 'com.apple.AppStore'
var.共享云id = '15303'
	


t={}


t['用户登录']={{1236,25,0x996c35}, {1073,28,0x8e652e}, }
t['正在更新']={ 0x421402, "624|0|0x421402", 90, 279, 609, 1055, 688}
t['你叫什么名字']={ 0x875e2b, "163|-124|0xffffff,140|-225|0x332d21,161|-133|0x0d20a7", 90, 457, 209, 914, 483}
t['游戏_游戏主界面']={ 0xd5b878, "600|-679|0xeef7a0,719|-680|0xeedcbc,1097|-676|0xa18f6f", 90, 0, 1, 1333, 748}



t['向下箭头']={ 0xeabe3d, "-30|-37|0xbf9029,-28|-43|0x733415,24|-43|0x683016,-4|-71|0xccb727", 90, 0, 0, 1333, 749}
t['向右箭头']={ 0xfffaad, "-44|31|0xcba32d,-50|24|0x733314,-50|-25|0x6e3317,-44|-32|0xc88124,-78|-1|0xccb827", 90, 0, 0, 1333, 749}
t['向左箭头']={ 0xfffdb8, "46|-26|0xbc8b29,50|-22|0x7c3615,50|23|0x7b3514,79|-3|0xccb727", 90, 0, 0, 1333, 749}
t['向上箭头']={ 0xfffdb4, "-28|51|0x662f16,-30|45|0xc17821,23|50|0x7a3616,21|51|0x7b3616,0|79|0xccb727", 90, 0, 0, 1333, 749}
function arrow()
	keepScreen(true)
	if d('向下箭头')then
		click(x,y+80)
	elseif d('向右箭头')then
		click(x+80,y)			
	elseif d('向左箭头')then
		click(x-80,y)			
	elseif d('向上箭头')then
		click(x,y-50)
	else
		keepScreen(false)
		return true
	end
	keepScreen(false)
end

-------------------event------------------
t['事件_开始游戏_游戏修复_切换帐号']={ 0xeea738, "494|-373|0x8e652e,679|-375|0x966a32,172|0|0xf3b840", 90, 243, 0, 1325, 740}
t['事件_注册_进入游戏_微博']={ 0x6791fd, "-145|-85|0x6791fd,-458|71|0xdf4d69", 90, 332, 74, 1003, 676}
t['事件_手机注册_返回_人头']={ 0x6791fd, "-571|-1|0x000000,-537|88|0x9f9f9f,-535|99|0xa1a1a1,-538|103|0x9c9c9c", 90, 334, 135, 999, 614}
t['事件_用户名注册_返回_手机']={ 0x7399f9, "-10|20|0x6791fd,-600|10|0x000000,-571|126|0xa3a3a3,-574|98|0xa4a4a4", 90, 332, 74, 1003, 676}
	t['事件_用户名注册_返回_手机_获取验证码']={ 0x739afd, "-20|-3|0x87a8fd,-50|-26|0x6791fd,-10|26|0x6791fd", 90, 795, 326, 970, 438}
	t['事件_用户名注册_返回_手机_进入游戏']={ 0xffffff, "-89|-4|0x6791fd,-8|-34|0x6791fd,7|30|0x6791fd", 90, 407, 443, 857, 550}


function event()
	if d('事件_开始游戏_游戏修复_切换帐号',true,1)then
	elseif d('事件_注册_进入游戏_微博',true,1)then
	elseif d('事件_手机注册_返回_人头',true,1)then
	elseif d('事件_用户名注册_返回_手机')then
		if 取号 then
			if GET_Phone(var.共享云id) then
				click(834,284)
				input(phone)
				click(1169,163)				--点空白
				取号 = false
				取短信 = true
			end
		elseif 取短信 then
			if d('事件_用户名注册_返回_手机_获取验证码',true,1)then
			elseif GET_Message(var.共享云id,phone) then
				click(610,384)
				input(sms)
				click(1169,163)				--点空白
				取短信 = false
				登录 = true
			else
				delay(2)
			end
		elseif 登录 then
			if d('事件_用户名注册_返回_手机_进入游戏',true,1)then
				delay(5)
				awz_name,idfa = getTrueName_awz()
				upIdfa('风云群侠传',"注册提交")
			end
		end
	else
		return true
	end
end
--------------------------------
t['弹窗_系统公告']={ 0x9d4620, "-233|-445|0x3c2922,313|-441|0x3a2921,82|-451|0xf5dc90", 90, 239, 65, 1114, 677}
t['弹窗_恭喜升级']={ 0x855e2a, "-2|-2|0xf5f0c0,-7|-5|0x966a32", 90, 794, 289, 917, 334}
t['弹窗_收下']={ 0xdcbd7d, "8|1|0x322210,11|-3|0xd9be81", 90, 645, 471, 777, 516}



function tips()
	if d('弹窗_系统公告',true,1)then
	elseif d('弹窗_恭喜升级',true,1)then
	elseif d('弹窗_收下',true,1)then
	elseif d('正在更新') then
		closeApp(frontAppBid())
		lua_exit()
	else
		return true
	end
end





function open(url)
	VPNX()
	if awzNew() then
		reName('准备激活')
	end

	delay(3)
	VPN()
	openURL(url)
	delay(2)
	local timeLine = os.time()
	local outTime = 30
	while (os.time()-timeLine < outTime) do
		if frontAppBid() == var.AppStore then
			return true
		end
		delay(1)
	end
end

--openURL(url)
--lua_exit()

取号 = true
取短信 = false
登录 = false

--[[]]
while (true) do
	if active(var.bid,5)then
		if false and d('游戏_游戏主界面') then
			reName('激活完成')
			return true
		elseif d('你叫什么名字',true,1)then
			delay(3)
			reName('创建角色')
			return true
		else
			if tips() then
				if event() then
					if arrow() then
						click(674,671,0.5)
					end
				end
			end
		end
	end
	delay(0.5)
end
--]]






























































