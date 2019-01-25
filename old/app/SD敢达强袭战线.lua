require 'tsp'
app_name = 'sd敢达'
id_path = '/User/Media/TouchSprite/lua/'..app_name..'.txt'
tast_file = '/User/Media/TouchSprite/lua/'..os.date("%Y-%B-%d-")..app_name..'tast.txt'
url = 'http://a.de0.cc/QZN3Ef'

app_bid = {
	['awz'] = 'AWZ',
	['safari'] = 'com.apple.mobilesafari',
	['007'] = 'com.007gaiji.007gaiji',
	['APP'] = 'com.nineyou.sdgdqx',
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
	awz红= { 0xff0000, "3|0|0xffffff", 90, 32, 644, 295, 683},
	-------------------------------------------------------game------------------------------
	搜索={ 0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xffffff, "0|3|0x007aff,7|7|0x007aff,5|9|0xffffff,-6|19|0x007aff,-8|21|0xffffff", 90, 546, 1062, 623, 1118},
	下载 = { 0x01f0ff, "32|0|0x01f0ff,43|-3|0x01f0ff,40|5|0x000107", 90, 231, 950, 404, 1006},
	APP ={{130,226,0xf9f8fe},{85,199,0xfffb71},{132,342,0xe71624},{179,208,0xf28700},}
	-------------------------AppStore---------------------------------------------------------
	
}
--游戏注册区域
m['sd敢达']={{769,207,0x002f95},{490,232,0xf0ed92},{526,270,0xa59b4e},{837,397,0xff0000},}
m.久游={ 0x00e98d, "5|-4|0xffffff", 90, 531, 556, 602, 595}
m['游戏公告'] = {{531,62,0x00ffff},{991,145,0x868b8a},{566,575,0xffffff},{561,579,0x00a059},{557,578,0xffffff},}
m['登录界面']={{451,19,0x000000},{678,19,0x000000},{634,32,0xf7f7f7},{637,32,0x000000},{1087,28,0xff3838},}
m['用户注册']={{95,18,0x992222},{468,19,0x000000},{1057,30,0x992222},{536,332,0x007aff},}


m['注册界面']= {{71,28,0xff3838},{94,32,0xff3838},{552,28,0xf6f6f7},{564,41,0x000000},{597,27,0xf6f6f7},}
m.用户名= { 0xd1d1d6, "28|0|0xfbfbfc,29|0|0xc7c7cd,61|10|0xfdfdfe,60|10|0xc7c7cd", 90, 259, 178, 365, 228}
m.next = {0x000000, "3|1|0xabb3be", 90, 975, 577, 1061, 617}
m.密码 = { 0xc7c7cd, "9|-2|0xc7c7cd,29|-7|0xcacad0,34|-10|0xffffff,42|-9|0xc7c7cd", 90, 163, 157, 313, 306}
m.done = { 0xffffff, "5|0|0x007aff", 90, 985, 590, 1061, 617}
m['注册成功'] = { 0x000000, "0|3|0xf7f7f7,0|7|0xf7f8f7,0|8|0x222222,-51|-1|0x000000", 90, 512, 228, 637, 325}
m['创建指挥官'] = {{490,103,0x00ffff},{634,205,0xffffff},{827,157,0xffffff},{760,292,0x54ffec},{567,518,0x00e584},}
m['OK'] = {{261,286,0xffcc98},{252,263,0xf9f2e9},{256,263,0x180f05},{391,345,0xc02e0b},{405,356,0xb44d3a},}

------------------------------------------------------------
m.seven = {{209,181,0x45cd23},{266,195,0x45cd23},{396,181,0x45cd23},{449,182,0x45cd23},}
m.红ip = { 0xff0000, 90, 200, 341, 441, 374}
m.黑ip = { 0x000000, 90, 200, 341, 441, 374}
m['新机']={{172,438,0x45cd23},{233,436,0x45cd23},{372,435,0x45cd23},{422,436,0x45cd23},}
m.红={ 0xff0000, 90, 205, 366, 442, 376}
m.黑={ 0x000000, 90, 205, 366, 442, 376}

function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m['sd敢达'],'sd敢达')then
			if c_pic(m.久游,'久游')then
			else
				click(587,507)
				delay(3)
			end
		elseif done(m['游戏公告'],'游戏公告')then
			click(561,574)
		elseif done(m['登录界面'],'登录界面')then
			click(1074,28)
		elseif done(m['用户注册'],'用户注册')then
			click(573,333)
		elseif done(m['注册界面'],'注册界面')then
			if c_pic(m.用户名,'用户名')then
				id = RndLetter(5)..math.random(10,9999)
				input(id)
				c_pic(m.next,'next')
			end
			if c_pic(m.密码,'密码')then
				pd = RndLetter(6)..math.random(10,9999)
				input(pd)
				c_pic(m.next,'next')
				if c_pic(m.密码,'密码')then
					input(pd)
					c_pic(m.done,'done')
					delay(3)
				end
			end
		elseif c_pic(m['注册成功'],'注册成功')then
			writeFile(id_path,'sd敢达强袭	'..id..'	'..pd)
			click(565,401)
		elseif done(m['创建指挥官'],'创建指挥官')then
			click(760,292)
			click(567,519)
		elseif done(m.OK,'OK')then
			click(925,364)
			delay(2)
			closeApp(app_bid.APP)
			delay(2)
			return true
		else
			logn = logn or 0
			logn = logn + 1
			if logn%5 == 0 then
				click(500,300)
			end
		end
		if os.time()-outT >= 500 then
			closeApp(app_bid.APP)
			return false
		end
		log(logn)
		delay(1)
	end
end

function awz()
	init('0',0);
	active(app_bid['awz'])
	delay(2)
	if c_pic(m.aswyj,'aswyj')then
		outT = os.time()
		while (true) do
			if f_pic(m.awz红,'OK')then
				return true
			end
			if os.time() - outT > 10 then
				return false 
			end
		end
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
			nLog(url)
			input(url)
			c_pic(m.前往,'前往')
		elseif c_pic(m.下载,'下载')then
		elseif done(m.APP,app_name)then
			delay(math.random(10,25))
			return true
		end
		if os.time()- outT > 60 then 
			return false 
		end
	end
end
--safari(url)
--lua_exit()
function close_VPN()
	setVPNEnable(false)
	delay(2)
end
function VPN()
	init(0,0);
	out_time = os.time()
	while (true) do
		setVPNEnable(true)
		delay(2)
		flag = getVPNStatus()
		if flag.active then
			log("VPN 打开状态"..flag.status)
			if flag.status == '已连接' then
				return true
			end
		else
			log("VPN 关闭状态"..flag.status)
		end
	end
	if os.time() - out_time > 120 then
		return false
	end
end

if file_exists(tast_file) then
	tast = tonumber(readFile(tast_file)[1])
	toast('已经完成~'..tast,2)
else
	tast = 0
end
tast_end = 100
while (true) do
	day_os = day_os or os.date("%Y-%B-%d-")
	if day_os ~= os.date("%Y-%B-%d-") then
		day_os = os.date("%Y-%B-%d-")
		tast = 0
	end
	work_time_h = tonumber(os.date("%H"))
	if tast <= tast_end then
		if work_time_h >= 0 and work_time_h <= 24 then
			close_VPN()
			if OO7() then
				if VPN()then
					if safari(url)then
						if reg()then
							tast = tast + 1
							writeFile(tast_file,tast,'w')
						end
					end
				end
			end
		else
			toast("非指定时间,暂不工作")
			delay(3)
		end
	else
		toast("今日完成:"..tast_end.."次",3)
		delay(3)
	end
end
