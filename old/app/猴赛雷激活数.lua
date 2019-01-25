require 'tsp'
id_path = '/User/Media/TouchSprite/lua/仙3.txt'
url = 'https://lp.gaeamobile.net/adownload/landpagejoy'

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
	APP='com.taosecret.game.housailei',
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
	下载 = { 0xffffff, "-3|0|0x8bcb4b,10|-11|0x8bcb4b,25|7|0x8bcb4b,32|6|0xffffff", 90, 128, 792, 509, 879},
	APP={ 0xfffdf8, "29|8|0xfb3c00,50|8|0xfffde6,86|72|0xfef7db", 90, 13, 143, 243, 369},
	-------------------------AppStore----------------------------------------------------------
}
--游戏注册区域
m.开始游戏 = {{564,546,0xbc72cc},{573,551,0xffffff},}
m.点击门号 = {{1100,36,0x8a4f46},{1054,38,0x8a4f46},{998,56,0xffffff},}
m.空白 = {{685,372,0xf2752f},{618,430,0xa7505b},}
m.重来 = {{294,573,0x42274e},{283,523,0xff9acd},}
m.评分 = {{405,407,0x929194},{518,314,0xaaa7e7},{651,429,0xff9acd},}
m.体力不足 = {{406,398,0xff9acd},{644,393,0x929194},{576,173,0xffffff},}
m.结束游戏 = {{336,516,0xfed4ff},{629,511,0xaaa7e7},{905,512,0x9f2315},}
m.游戏中 = {{1046,487,0xffffff},{1073,25,0x8a4f46},{1089,26,0xaaa7e7},{1098,26,0x8a4f46},}

function reg()
	init('0',2)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m.开始游戏,'开始游戏')then
			click(564,546)
		elseif done(m.点击门号,'点击门号')then
			click(1092,29)
		elseif done(m.空白,'空白')then
			click(685,372)
		elseif done(m.体力不足,'体力不足')then
			delay(2)
			closeApp(frontAppBid())
			delay(1)
			return true
		elseif done(m.评分,'评分')then
			click(405,407)
		elseif done(m.重来,'重来')then
			click(294,573)
			delay(1)
		elseif done(m.结束游戏,'结束游戏')then
			click(905,512)
			delay(2)		
		elseif done(m.游戏中,'游戏中')then
			click(1046,487)
		end
		if os.time()- outT > 300 then
			closeApp(frontAppBid())
			return false
		end
		delay(0.5)
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
		if c_pic(m.搜索,'搜索')then
			input(url)
			c_pic(m.前往,'前往')
		elseif f_pic(m.APP,'仙剑3')then
			delay(15)
			return true
		end
		if os.time()- outT > 60 then 
			return false 
		end
	end
end

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
					click(  323,   19)
				end
			end
		end
	end
end

while (true) do
	if VPNclose()then
		if awz() then
			if VPN()then
				reg()
			end
		end
	end
end

