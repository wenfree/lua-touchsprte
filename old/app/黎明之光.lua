require 'tsp'
id_path = '/User/Media/TouchSprite/lua/黎明之光.txt'
url = 'http://lmzg.8864.com/pc8?mid=11113'

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
	APP='com.linekong.dbm',
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
	下载 = { 0xe8effe, "0|-6|0x619af5,1|4|0x578df1", 90, 538, 163, 601, 205},
	APP ={{148,264,0xfce6d7},{224,235,0xfdeee7},{102,279,0xfbd2c1},{33,309,0x814620},}
	-------------------------AppStore----------------------------------------------------------
}
-----------------------
m['新机']={{172,438,0x45cd23},{233,436,0x45cd23},{372,435,0x45cd23},{422,436,0x45cd23},}
m.红={ 0xff0000, 90, 205, 366, 442, 376}
m.黑={ 0x000000, 90, 205, 366, 442, 376}
---------------------
m.官网 = { 0x5e94f6, "3|3|0xfcfdf5,6|4|0x588ef3", 90, 393, 167, 464, 209}
m.下载 = {0xc3eeff, "0|6|0xbfe4ff,4|5|0x4873e5", 90, 109, 961, 160, 1004}
--游戏注册区域---------------------------------
m.确定={0x007aff, "11|6|0x007aff,9|8|0xd7d9dc", 90, 527, 373, 608, 418}
m['进入游戏']={{1104,36,0x21b6f7},{768,370,0x00c7ff},{562,484,0xef9e21},}
m['登录注册']={{570,466,0xcc832c},{577,318,0x795046},{1113,36,0x21b2ef},}
m['登录界面']={{400,542,0x795046},{733,542,0xcc832c},{1113,35,0x21b2f7},{273,456,0x009d70},}
m['注册界面']={{740,537,0xcc832c},{398,537,0x795046},{1113,36,0x21b2ef},{837,365,0xffffff},}
m.id={ 0xb7b7b7, "0|-2|0xffffff,-23|44|0xadadad,21|44|0xababab", 90, 266, 219, 343, 289}
m.password = { 0xffffff, "0|-25|0xb0b0b0,12|-12|0xffffff,22|11|0xc2c2c2", 90, 275, 335, 341, 401}
m.注册 = { 0xffffff, "4|3|0xcc832c", 90, 680, 516, 794, 559}
m['职业选择']={{981,591,0x000000},{983,592,0x2182ce},{39,44,0xb5f7f7},{126,145,0xffffff},}
m['跳过']={{1078,28,0x009eff},{1088,28,0x009eff},{1081,17,0x009eff},{1082,17,0x000000},}
m['OK']={{786,206,0x424539},{774,195,0xdedbc6},{283,239,0x424142},{285,239,0xdedbc6},}

function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m.进入游戏,'进入游戏')then
			click(m.进入游戏[1][1],m.进入游戏[1][2])
		elseif c_pic(m.确定,'确定')then
		elseif done(m.登录注册,'登录注册')then
			click(m.登录注册[1][1],m.登录注册[1][2])		
		elseif done(m.登录界面,'登录界面')then
			click(m.登录界面[1][1],m.登录界面[1][2])
		elseif done(m.注册界面,'注册界面')then
			if c_pic(m.id,'id')then
				ID = RndLetter(6)..math.random(1,9999)
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(ID)
				click(1015,205)
			end
			if c_pic(m.password,'password')then
				Ps = RndLetter(6)..math.random(1,9999)
				input(Ps)
				click(1015,205)
			end
			delay(1)
			if c_pic(m.注册,'m.注册 ')then
				delay(8)
				if done(m.职业选择,'职业选择')then
					writeFile(id_path,'黎明之光'..'	'..ID..'	'..Ps)
				end
			end
		elseif done(m.职业选择,'职业选择')then
			click(981,591)--确定
		elseif done(m['跳过'],'跳过')then
			click(1078,28)
		elseif done(m.OK,'OK')then
			closeApp(frontAppBid())
			delay(2)
			return true
		end
		delay(1)
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
		elseif c_pic(m.下载,'下载')then		
		elseif c_pic(m.官网,'官网')then
			delay(3)
		elseif done(m.APP,'黎明之光')then
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
	if VPNclose()then
		if OO7() then
			if VPN()then
				if safari(url)then
					reg()
				end
			end
		end
	end
end

