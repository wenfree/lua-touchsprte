--require '爱乐赞对接'
--id = 18713
--ALZ()
--GET_Phone(id,token)
--getMessage(id,phone)
require 'tsp'
id_path = '/User/Media/TouchSprite/lua/tianxia.txt'
url = 'http://gad.netease.com/mmad/click?s=PnBuOEoEOiZa61ukmnKIyvlvv%2B8%3D&project_id=12358391&monitor_type=4'
id = readFile(id_path)
n = 30

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
	APP='com.netease.tx',
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
	一键新机={ 0xffffff, "1|6|0x45cd23", 90, 222, 403, 398, 463},
	一键恢复={ 0x4198ff, "11|1|0x4198ff", 90, 242, 502, 272, 520},
	搜索={  0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xf1f8ff, "5|5|0x007aff", 90, 549, 1065, 619, 1116},
	下载 = {0x35447a, "3|0|0xfdf8fc,13|0|0x35447a,15|0|0xf7f2f8", 90, 415, 416, 461, 442},
	下载2 = { 0xffffff, "5|1|0x000000,14|0|0xffffff,18|1|0x000000", 90, 296, 963, 418, 1019},
	APP={ 0xc01503, "26|-1|0xf9e2d3,20|14|0xfffcfb", 90, 56, 324, 193, 460},
	APP2={ 0xd6d6d6, "0|2|0xf4f4f5,1|22|0xd6d6d6", 90, 85, 325, 142, 382},
	-------------------------AppStore----------------------------------------------------------
}
m.易 = {0xffffff, "-2|-6|0xd1201f,2|8|0xffffff,22|19|0xd1201f", 90, 781, 333, 838, 398}
m.登录界面 ={{1097,26,0xdec8aa},{1095,121,0xdba45c},{1096,243,0xddb888},{301,229,0xe60617},}
m.帐号 = { 0xc7c7cd, "3|0|0xffffff,4|0|0xc9c9cf,14|2|0xc7c7cd,32|4|0xc7c7cd", 90, 646, 141, 753, 207}
m.密码 = { 0xceced4, "4|-22|0xc7c7cd,6|-21|0xfcfcfd,24|-10|0xc7c7cd,32|-6|0xc7c7cd", 90, 592, 225, 680, 293}
m.登录 = { 0x92d9b0, "1|-3|0xffffff,4|11|0xffffff", 90, 597, 325, 715, 384}
m['点击登录']={{416,433,0xde3d1b},{1099,26,0xdec8aa},{1097,242,0xddba8c},}
m.登录成功 = {0x23b260, "5|5|0xffffff,11|7|0x23b260", 90, 681, 531, 790, 580}

function login()
	init('0',1)
	while (true) do
		if active(app_bid.APP)then
			delay(5)
		end
		if done(m.点击登录,'点击登录')then
			click(568,527)
		elseif c_pic(m.易,'m.易')then
		elseif done(m.登录界面,'登录界面')then
			idd = split(id[n],"|")
			if c_pic(m.帐号,'帐号')then
				input(idd[1])
				click(1099,27)
			end
			if c_pic(m.密码,'密码')then
				input(idd[2])
				click(1099,27)
			end
			if c_pic(m.登录,'m.登录')then
				out_time = os.time()
			end
		elseif c_pic(m.登录成功,'登录成功')then
			n = n + 1
			delay(30)
			return true
		else
			log('other')
		end
		delay(1)
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

function safari(url)
	init('0',0)
	outT = os.time()
	active(app_bid.safari)
	while (true) do
		if c_pic(m.搜索,'搜索')then
			input(url)
			c_pic(m.前往,'前往')
		elseif c_pic(m.下载,'下载')then
			delay(2)		
		elseif c_pic(m.下载2,'下载')then
			delay(3)
		elseif f_pic(m.APP,'m.APP')or f_pic(m.APP2,'m.APP')  then
			delay(3)
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
			if done(m.设置,95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif c_pic(m.开,'开VPN')then
					setp = 1
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
			if done(m.设置,95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif f_pic(m.开,'开VPN')then
					return true
				end
			end
		end
	end
end
function OO7()
	init('0',0);
	active(app_bid['007'])
	delay(2)
	if c_pic(m.一键新机,'一键新机')then
		outT = os.time()
		repeat
			mSleep(300)
			if os.time() - outT > 10 then return false end
		until f_pic(m.一键恢复,'一键恢复')
		return true
	end
end
function seven_007()
	if active(app_bid['007'])then
		out_time = os.time()
		repeat
			log("等待PK188界面")
			delay(0.5)
			if os.time() - out_time > 5 then return false end
		until done(m['007'],95)
		if clickpic( 0xf9fafa, "-1|0|0x4198ff,101|-6|0x4198ff,96|-2|0xffffff,94|0|0x4198ff", 90, 65, 244, 598, 315)then
			log("一键新机")
			out_time = os.time()
			repeat
				log("等待一键新机")
				delay(0.5)
				if f_p({0xff0000,90, 192, 337,445, 374},"红色ip")then break end
				if os.time() - out_time > 8 then return false end
			until findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")
		end
		if f_p({0xff0000,90, 192, 337,445, 374},"红色ip") then
			return true
		elseif findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")then
			red_ip = 0
			return true
		end
	else
		closeApp(app_bid['007'])
	end
end

while (true) do
	if VPNclose()then
		if awz() then
			if VPN()then
				if safari(url)then
					login()
					closeApp(frontAppBid())
				end
			end
		end
	end
end