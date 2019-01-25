require 'tsp'
id_path = '/User/Media/TouchSprite/lua/魔灵战纪.txt'
url = 'http://popstar.zplay.cn/jump.php?type=web&id=18touch3'

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
	APP='com.zplay.roguelife',
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
m.APP={{89,187,0xfe76fe},{113,207,0xffba8e},{119,224,0xffead9},{198,319,0xd20303},}
--游戏注册区域---------------------------------
m['快速开始']={{278,914,0x00f7f7},{250,807,0x3b4b72},{169,221,0xffff78},{490,172,0xffff4f},}
m['战队命名']={{518,586,0x660c01},{506,586,0xff1c31},{317,557,0xff9c3a},{267,752,0xf58800},}
m.请输入名字={ 0x81521f, "5|2|0x855725,7|0|0xffecd0,22|-3|0x774610", 90, 313, 676, 361, 702}
m.创建战队={ 0xf78900, "20|4|0x682e28,22|4|0xf1eceb,23|4|0x6b2f27", 90, 268, 736, 368, 771}
m['OK']={{272,255,0xf3a400},{601,22,0x5e2e00},{492,19,0xff00f5},{62,1119,0x00ffff},{610,933,0xf7ede8},}


function reg()
	init('0',0)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m.快速开始,'快速开始')then
			click(278,914)
		elseif done(m.战队命名,'战队命名')then
			if c_pic(m.请输入名字,'请输入名字')then
				ID = RndLetter(6)..math.random(1,999)
				input(ID)
				delay(2)
				click(424,657)
				if c_pic(m.创建战队,'创建战队')then
					writeFile(id_path,'魔灵战纪'..'|'..ID)
				end
			end
		elseif done(m.OK,'完成')then
			closeApp(app_bid.APP)
			return true
		else
			log('其它')
			other = other or 0
			other = other + 1
			if other%5 == 0 then
				click(320,505)
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
		elseif done(m.APP,'魔灵战纪')then
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
