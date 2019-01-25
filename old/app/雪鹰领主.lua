local sz = require("sz")
local cjson = sz.json
local http = sz.i82.http
function downFile(url, path)
	status, headers, body = http.get(url)
	if status == 200 then
		file = io.open(path, "wb")
		if file then
			file:write(body)
			file:close()
			return status;
		else
			return -1;
		end
	else
		return status;
	end
end
localversvion = 4
url = "http://luawarehouse.applinzi.com/app/verson.php"
local sz = require("sz")
local http = require("szocket.http")
local res, code = http.request(url);
if code == 200 then
	versvion = tonumber(res)
	nLog(versvion)
	if localversvion >= versvion then
		nLog('版本相同无需更新')
	else
		nLog('下载新版本')
		web_url = "http://luawarehouse.applinzi.com/app/app.lua";
		local_url = "/User/Media/TouchSprite/lua/app.lua";
		downFile(web_url,local_url)
		dialog('脚本更新重新启动', 5)
		lua_exit();
	end
end
require "TSLib"
require "tsp"
id_path = '/User/Media/TouchSprite/lua/xylz_ID.txt'
url = 'https://lnk0.com/U5M1wl'

app_bid = {
	['VPN'] = "com.apple.Preferences",
	['IG'] = "com.unkn0wn.igvx",
	['007'] = "com.007gaiji.007gaiji",
	['NZT'] = "NZT",
	['adsge'] = "mx-2205554765",
	['突击前线'] = "com.appspot.battlefront",
	['天涯悦读'] = "com.appspot.cabin006",
	['qq'] = "com.tencent.mqq",
	['sd'] = 'com.nineyou.sdec',
	['safari'] = 'com.apple.mobilesafari',
	APP='com.lthd.xylz.dybby',
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
	-------------------------------------------------------game------------------------------
	一键新机={ 0xffffff, "1|6|0x45cd23", 90, 222, 403, 398, 463},
	一键恢复={ 0x4198ff, "11|1|0x4198ff", 90, 242, 502, 272, 520},
	搜索={  0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xf1f8ff, "5|5|0x007aff", 90, 549, 1065, 619, 1116},
	APP={0xf0fcff, "28|21|0x205aaf,56|8|0xacdbf0,71|15|0xa1d9f7", 90, 16, 144, 243, 379},
	-------------------------AppStore----------------------------------------------------------
['第一波网络']={{1016,20,0x607477},{1018,26,0x253668},{1089,36,0x53626d},{675,85,0x7aad48},{673,89,0xffffff},},
['注册帐号']={{620,77,0x7fb14f},{626,79,0xfcfdfb},{626,94,0x7caf4b},{587,88,0x79ad47},{585,90,0xffffff},},
请输入帐号={ 0x848484, "3|2|0xffffff,7|4|0x808080,21|4|0x808080,142|2|0x888888", 90, 221, 135, 387, 191},
请输入密码={0x838383, "7|1|0x808080,9|1|0xf5f5f5,21|1|0x808080,123|-1|0xffffff,125|-3|0x808080", 90, 225, 242, 392, 396},
注册={ 0xf2faed, "0|-4|0x74c73d,0|-10|0x74c73d,-4|-26|0x74c73d", 90, 712, 441, 786, 485},
Done={ 0x007aff, "12|1|0xf5f5f5,16|1|0x007aff,23|2|0x007aff", 90, 862, 172, 968, 303},
登录={ 0xfefffd, "5|-3|0x74c73d,10|1|0xffffff,13|4|0x74c73d", 90, 478, 380, 643, 434},
['公告']={{540,65,0x3c4e7d},{540,63,0xcfd9f1},{551,56,0x3e4f81},{551,62,0xd7dff7},{610,63,0xd4dcf4},},
['开始游戏']={{1020,47,0x6a81b2},{1017,19,0xd1f8ff},{1088,20,0xcef7ff},{1092,37,0xbcd6ec},{852,556,0xdef1ff},{854,563,0x1b233f},},
['正在加载']={{154,559,0x45b5ff},{152,558,0x17171f},{198,562,0x35a7f2},{193,557,0x3eacf4},{248,557,0x3cabf2},},
['初始化']={{438,5,0xf52f2f},{445,14,0xbc2524},{478,11,0xda2b2b},{377,28,0xf3ea9d},{370,29,0xede09a},},
['跳过动画']={{927,60,0xc0821e},{933,65,0xfdf6db},{969,66,0xf8ebca},{977,69,0xb27a12},{994,66,0xf8ebca},{999,70,0xb47711},},
['创建角色']={{495,110,0xfffae1},{637,112,0xfffae1},{788,144,0x71729b},{781,140,0x202222},{596,352,0xe1cb51},},
['完成']={{217,13,0x231b32},{222,13,0x979288},{221,18,0x97732c},{273,32,0x939076},{123,83,0x959253},},

}
function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		active(app_bid.APP)
		if done(m.第一波网络)then
			log('第一波网络')
			click(580,562)
		elseif done(m.注册帐号)then
			log('第一波网络')
			if c_pic(m.请输入帐号,'请输入帐号')then
				id = RndLetter(math.random(5,7))..math.random(0,999)
				input(id)
				c_pic(m.Done,'Done')
			end
			if c_pic(m.请输入密码,'请输入密码')then
				password = RndLetter(6)..math.random(0,999)
				input(password)
				c_pic(m.Done,'Done')
				if c_pic(m.请输入密码,'请输入密码')then
					input(password)
					c_pic(m.Done,'Done')
				end
			end
			if c_pic(m.注册,'注册')then
				delay(5)
				click(378,467)
				if c_pic(m.登录,'登录')then
					delay(5)
					if done(m.公告)then
						writeFile(id_path,id.."|"..password)
					end
				end
			end
		elseif done(m.公告)then
			click(923,65)
		elseif done(m.开始游戏)then
			click(864,562)
		elseif done(m.正在加载)then
			log('正在加载')
			delay(2)
		elseif done(m.初始化)then
			log('初始')
			touchDown(1, 139,533)
			mSleep(200)
			touchMove(1, 138,418)
			mSleep(3000)
			touchUp(1, 138,418)
			
			click(1081,456)
			click(976,478)
			click(935,576)
		elseif done(m.跳过动画)then
			click(995,67)
		elseif done(m.创建角色)then
			log("创建角色")
			click(689,276)
			click(569,375)
		elseif done(m.完成)then
			log('完成')
			click(1082,99)
			delay(4)
			closeApp(frontAppBid())
			return true
		end
		if os.time() - outT > 300 then
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
		if c_pic(m.搜索,'搜索')then
			input(url)
			c_pic(m.前往,'前往')
		elseif f_pic(m.APP,'雪鹰领主')then
			delay(10)
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
				closeApp(frontAppBid());
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
		if OO7() then
			if VPN()then
				if safari(url)then
					reg()
				end
			end
		end
	end
end
