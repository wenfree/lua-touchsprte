require 'tsp'
id_path = '/User/Media/TouchSprite/lua/如果的世界.txt'
url = 'http://ad.ledo.com/ad/areal/areal.html?game_type=113&app_id=120017&cid=10043.1413'

app_bid = {
	['VPN'] = "com.apple.Preferences",
	['IG'] = "com.unkn0wn.igvx",
	['007'] = "com.007gaiji.007gaiji",
	['NZT'] = "NZT",
	['awz'] = 'AWZ',
	['adsge'] = "mx-2205554765",
	['突击前线'] = "com.appspot.battlefront",
	['天涯悦读'] = "com.appspot.cabin006",
	['qq'] = "com.tencent.mqq",
	['sd'] = 'com.nineyou.sdec',
	['safari'] = 'com.apple.mobilesafari',
	APP='com.ledo.areal.appareal',
}
m = {
	['设置']={	{307,83,0x000000},	{307,81,0xf7f7f7},	{307,70,0x000000},	{338,71,0x000000},},
	['正在连接']={ 0x000000, "8|0|0xffffff,11|0|0x000000,19|0|0xffffff", 90, 332, 600, 363, 607},
	['x'] ={0xffffff, "8|9|0xffffff,0|5|0x000000,-6|9|0xffffff", 90, 588, 29, 612, 51},
	开={0xffffff, "-26|1|0xc8c8c8,4|-29|0xe0e0e0,4|29|0xa1a1a1", 90, 447, 475, 630, 675},
	['关']={0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675},
	后退={0x007aff, "-15|16|0x007aff,1|36|0x007aff,-20|16|0x0a80ff", 90, 4, 46, 123, 126},
	好={0x007aff, "12|0|0xf7f7f7", 99, 267, 646, 379, 743},
	好2={ 0x007aff, "14|7|0x007aff", 90, 300, 669, 329, 702},
	['007']={	{83,277,0x4198ff},	{143,278,0x4198ff},	{209,278,0x4198ff},	{476,277,0x4198ff},},
	['aswyj'] = {0xffffff, "0|-2|0x6f7179,31|4|0xffffff,31|1|0x6f7179", 90, 99, 600, 151, 630},
	['awz好'] = {{229,525,0x4bd763},},
	-------------------------------------------------------game------------------------------
	搜索={  0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xf1f8ff, "5|5|0x007aff", 90, 549, 1065, 619, 1116},
	-------------------------AppStore----------------------------------------------------------
}
-----------------------
m['新机']={{172,438,0x45cd23},{233,436,0x45cd23},{372,435,0x45cd23},{422,436,0x45cd23},}
m.红={ 0xff0000, 90, 205, 366, 442, 376}
m.黑={ 0x000000, 90, 205, 366, 442, 376}
---------------------
m.APP={{103,212,0xffffff},{191,240,0xfb638c},{204,322,0xff630f},{217,322,0xfb5d00},}
--游戏注册区域---------------------------------
m['乐道']={{565,255,0xff6800},{563,359,0xf36b5e},{555,456,0xf36b5e},{504,125,0xff6800},}
m['用户登录']={{416,441,0xff6800},{663,111,0xfff3e6},{663,109,0xff8000},{653,128,0xff8000},{655,128,0xfff7ef},{323,131,0x4d4d4d},}
m['用户注册界面']={{670,107,0xff8305},{675,128,0xff8000},{554,119,0xffffff},{325,129,0x4f4f4f},}
m.邮箱={ 0xc7c7cd, "25|7|0xc8c8ce,41|-6|0xffffff,43|-4|0xc7c7cd,82|2|0xceced3", 90, 307, 244, 418, 289}
m.下一步={0xffffff, "11|2|0xff6800,12|29|0xffffff,68|10|0xffffff,71|9|0xff6800,106|10|0xffffff", 90, 500, 335, 628, 380}
m.密码 ={0xc7c7cd, "-14|18|0xc7c7cd,-19|11|0xffffff,-38|25|0xceced4,-7|0|0xc7c7cd", 90, 407, 242, 561, 383}
m.注册按钮={ 0xffffff, "1|-1|0xff6801,36|-9|0xffffff,37|-7|0xff6800,50|4|0xfff5ee", 90, 512, 420, 616, 478}
m['更新公告']={{518,83,0x499a88},{535,82,0xfdfffe},{580,96,0x448d7c},{609,101,0xffffff},}
m['登录游戏']={{569,69,0xffffff},{442,92,0xffffff},{915,82,0x9c5f55},{1066,128,0xf9f9f7},{566,477,0xacd3c4},}
m['角色选择']={{98,11,0x5c9182},{91,19,0x548c80},{140,27,0xfefefe},{61,602,0x087d7c},}
m['进入游戏']={{61,602,0x077e7c},{969,468,0xde2c22},{809,530,0xffffff},{806,530,0x4e6a66},}
m['游戏界面']={{1124,21,0xfcfbf7},{1111,84,0x4c5e5e},{1111,95,0xfcfbf7},{1038,80,0xfcfbf7},}


function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m.乐道,'乐道')then
			other = 0
			click(m.乐道[1][1],m.乐道[1][2])
		elseif done(m.用户登录,'用户登录')then
			other = 0
			click(m.用户登录[1][1],m.用户登录[1][2])
		elseif done(m.用户注册界面,'用户注册界面')then
			other = 0
			if c_pic(m.邮箱,'邮箱')then
				ID = RndLetter(6)..math.random(1,999)..'@qq.com'
				input(ID)
				click(960,107)
			end
			c_pic(m.下一步,'下一步')
			if c_pic(m.密码,'密码')then
				Ps = RndLetter(6)..math.random(1,9999)
				input(Ps)
				click(960,107)
				if c_pic(m.密码,'密码')then
					input(Ps)
					click(960,107)
				end
			end
			if c_pic(m.注册按钮,'注册按钮')then
				outT = os.time()
				repeat
					if os.time() - outT > 20 then
						closeApp(app_bid.APP)
						return false
					end
				until done(m.更新公告,'更新公告')
				if done(m.更新公告,'成功')then
					writeFile(id_path,'如果的世界'..'|'..ID..'|'..Ps)
				end
			end
		elseif done(m.更新公告,'更新公告')then
			click(922,91)
			other = 0
		elseif done(m.登录游戏,'登录游戏')then
			click(m.登录游戏[5][1],m.登录游戏[5][2])
			other = 0
		elseif done(m.角色选择,'角色选择')then
			x,y=97,319
			k = math.random(0,5)
			click(k*189+x,y)
			other = 0
		elseif done(m.进入游戏,'进入游戏')then
			click(969,468)
			click(806,530)
			other = 0
		elseif done(m.游戏界面,'游戏界面')then
			closeApp(frontAppBid())
			delay(2)
			return true
		else
			log('其它')
			other = other or 0
			other = other + 1
			if other%3 == 0 then
				click(802,543)
			end
		end
		delay(1)
		if os.time()- outT > 180 then
			closeApp(frontAppBid())
			delay(3)
			return false
		end
	end
end

function awz()
	init('0',0);
	active(app_bid['awz'])
	delay(2)
	if c_pic(m.aswyj,'aswyj')then
		outT = os.time()
		repeat
			mSleep(300)
			if os.time() - outT > 10 then 
				closeApp(frontAppBid())
				return false 
			end
		until done(m.awz好,'OK')
		return true
	end
end
function OO7()
	init('0',0);
	setp_07 = 0
	outTime = os.time()
	while (true) do
		active(app_bid['007'])
		if setp_07 == 0 and done(m.新机,'新机')then
			setp_07 = 1
		elseif setp_07 == 1 then
			if done(m.新机,'新机')then
				click(323,436)
				setp_07 = 2
			end
		elseif setp_07 == 2 then
			if f_p(m.黑,'黑')or f_p(m.红,'红')then
				return true
			end
		end
		delay(0.5)
		if os.time() - outTime > 10 then
			closeApp(frontAppBid())
			return false
		end
	end
end
function haoi23()
	init('0',1);
	ocrInfo("haoi23","ouwen000","ouwen000|3A16D996BA0C00B7")
	local text,tid = ocrScreen(645,255,790,310,3004,20,1)
	if text == nil then
		dialog('识别错误', 3)
		delay(1)
		click(720,283)
		delay(3)
		haoi23()
	else
		return text
	end
end

function safari(url)
	init('0',0)
	outT = os.time()
	active(app_bid.safari)
	while (true) do
		if c_pic(m.搜索,'top搜索')then
			input(url)
			c_pic(m.前往,'前往')
		--elseif c_pic(m.下载,'下载')then		
		elseif done(m.APP,'如果的世界')then
			delay(math.random(10,20))
			return true
		end
		if os.time()- outT > 60 then
			return false 
		end
	end
end
--safari(url)
--lua_exit()

function VPN()
	init(0,0);
	while (true) do
		active(app_bid['VPN'])
		setp = setp or 0
		if setp == 0 then
			if done(m.设置,'设置',95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif c_pic(m.开,'开VPN')then
					setp = 1
				else
					click(  323,   19)
				end
			end
		elseif setp == 1 then
			if f_pic(m['正在连接'],'正在连接') then
				delay(1)
				--	return false
			elseif c_pic(m.开,'开VPN')then
				setp = 1
			elseif f_pic(m.关,"VPN-OK")then
				setp = 0
				return true
			end
		end
		c_pic(m.后退,"back")
		c_pic(m.好,'错误-好')
		if c_pic(m.好2,'错误-好')then
			click(316,679)
		end
		log(setp)
		sotp = sotp or 0
		if sotp ~= setp98 then
			sotp = setp
			waitTimes = 0
			delay(0.5)
		elseif sotp == setp then
			waitTimes = waitTimes or 0
			waitTimes = waitTimes + 1
			if waitTimes > 120 then
				closeApp(frontAppBid())
				log("网络错误")
				delay(3)
				setp = 0
			end
			delay(0.5)
		end
	end
end
function VPNclose()
	init(0,0);
	while (true) do
		active(app_bid['VPN'])
		setp = setp or 0
		if setp == 0 then
			if done(m.设置,'设置',95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif f_pic(m.开,'开VPN')then
					return true
				else
					click( 323, 19)
				end
			end
		end
	end
end

while (true) do
	if false or VPNclose()then
		if false or awz() then
			if false or VPN()then
				if false or safari(url)then
					reg()
				end
			end
		end
	end
end
