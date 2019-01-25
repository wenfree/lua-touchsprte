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
	APP='com.gaeamobile.cn.xj',
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
	['awz好'] = { 0x007aff, "2|-2|0xeeeff0,5|0|0x007aff,5|10|0x007aff", 90, 292, 600, 338, 647},
	-------------------------------------------------------game------------------------------
	搜索={  0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xf1f8ff, "5|5|0x007aff", 90, 549, 1065, 619, 1116},
	下载 = { 0xffffff, "-3|0|0x8bcb4b,10|-11|0x8bcb4b,25|7|0x8bcb4b,32|6|0xffffff", 90, 128, 792, 509, 879},
	APP={ 0xfffdf8, "29|8|0xfb3c00,50|8|0xfffde6,86|72|0xfef7db", 90, 13, 143, 243, 369},
	-------------------------AppStore----------------------------------------------------------
}
--游戏注册区域
m['gaea']={{413,359,0x70aee5},{703,365,0xb890e4},{558,83,0xb43b76},}
m['注册界面']={{553,81,0xb43b76},{328,93,0xb890e4},{584,472,0xb890e4},}
m.帐号={ 0x8f8f8f, "25|9|0xe6e7e7,25|10|0x8f8f8f,37|3|0x8f8f8f,52|1|0x8f8f8f", 90, 355, 149,545, 216}
m.密码={ 0x8f8f8f, "21|-1|0xf2f5f5,22|-2|0x8f8f8f,40|13|0x8f8f8f,35|7|0xe6e8e8", 90,455, 245, 539, 396}
m.换行={ 0x000000, "3|0|0x9ba6b1", 90, 954, 584, 1082, 618}
m.确认={ 0xffffff, "2|5|0xb890e4", 90, 525, 452, 612, 497}
m['公告']={{947,57,0x5692a4},{691,132,0x076877},{332,115,0xe0d8b8},}
m['开始游戏']={{563,526,0xfffbe3},{359,115,0x00133f},{781,123,0xa01e22},{757,233,0x00040e},}
m['下一步']={{1028,594,0x539ba5},{41,340,0xf8faec},{61,603,0xc3a074},{1092,335,0xded6b7},}
m['开始']={{716,259,0xf8faf9},{837,263,0x569ea9},}
m['跳过剧情']={{1055,22,0x99ddee},{1057,27,0x114444},{1062,27,0x114444},{1062,29,0x86cadb},{1062,34,0x83c7d9},}
m['下载更新']={{654,403,0xe0deaf},{648,399,0x7e2e00},{761,207,0x93c9d0},}




function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(5)
			click(h/2,w/2)
		end
		if done(m.gaea,'gaea')then
			click(m.gaea[1][1],m.gaea[1][2])
		elseif done(m.注册界面,'注册界面')then
			if c_pic(m.帐号,'帐号')then
				id = RndLetter(math.random(3,6))..math.random(0,999)
				input(id)
				c_pic(m.换行,'换行')
			end
			if c_pic(m.密码,'密码')then
				pd = RndLetter(math.random(3,6))..math.random(0,999)
				input(pd)
				c_pic(m.换行,'换行')
				if c_pic(m.密码,'密码')then
					input(pd)
					c_pic(m.换行,'换行')
				end
			end
			if c_pic(m.确认,'确认')then
				delay(5)
				if done(m.公告,'公告')then
					writeFile(id_path,os.date().."	"..id.."	"..pd)
				end
			end
		elseif done(m.公告,'公告')then
			click(m.公告[1][1],m.公告[1][2])		
		elseif done(m.开始游戏,'开始游戏')then
			click(m.开始游戏[1][1],m.开始游戏[1][2])		
		elseif done(m.下一步,'下一步')then
			click(m.下一步[1][1],m.下一步[1][2])			
		elseif done(m.下载更新,'下载更新')then
			click(m.下载更新[1][1],m.下载更新[1][2])		
		elseif done(m.开始,'开始')then
			click(m.开始[1][1],m.开始[1][2])
			click(m.开始[2][1],m.开始[2][2])
		elseif done(m.跳过剧情,'跳过剧情')then
			click(1064,31)
			delay(10)
			return true
		else
			log('other')
			other = other or 0
			other = other + 1
			if other > 20 then
				click(h/2,w/2)
				other = 0
			end
		end
		delay(1)
		if os.time() - outT > 240 then
			closeApp(frontAppBid())
			delay(2)
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
		until c_pic(m.awz好,'一键恢复')
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
				if safari(url)then
					reg()
				end
			end
		end
	end
end

