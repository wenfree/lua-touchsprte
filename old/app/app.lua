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
account_path = '/User/Media/TouchSprite/lua/qsmoon.txt'
url = 'http://g.iqiyi.com/xljssy'

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
	APP='com.iqiyi.jiquyouxi.xljszcgx',
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
	下载={  0x581014, "-3|0|0xfbee86,0|6|0x5c101a", 90, 506, 153, 620, 205},
	APP={ 0x679c22, "3|1|0xffffff,6|1|0x6e9c2e,8|1|0xfdfcf5", 90, 149, 318, 226, 358},
	-------------------------AppStore----------------------------------------------------------
	['正在加载']={{374,541,0xfedd46},{438,526,0xfedd46},{745,547,0xfedf50},{812,542,0xfedd46},{688,539,0xb56c33},},
	['爱奇艺游戏']={{439,162,0x1cc418},{438,162,0xffffff},{459,162,0x0bbf06},{459,171,0xffffff},{507,162,0x15c111},{507,160,0xffffff},},
	['手机注册']={{522,64,0x454545},{521,64,0xffffff},{553,64,0x353535},{559,63,0xffffff},{561,60,0x333333},{562,68,0xfcfcfc},{565,80,0x353535},},
	['邮箱注册']={{511,50,0x383838},{516,50,0x363636},{520,48,0xffffff},{522,48,0x353535},{584,49,0xffffff},{586,49,0x353535},},
	请输入邮箱={0xc1c1c1, "4|2|0xffffff,6|2|0xc1c1c1,14|2|0xfcfcfc,16|2|0xc0c0c0,27|-2|0xc1c1c1", 90, 339, 27, 489, 154},
	密码={0xc0c0c0, "6|-2|0xffffff,12|-2|0xffffff,14|-2|0xc6c6c6,20|-2|0xc5c5c5,29|4|0xc2c2c2", 90, 346, 105, 551, 231},
	请输入验证码={0xc1c1c1, "4|0|0xffffff,4|-9|0xfefefe,5|-11|0xc5c5c5,22|-2|0xfdfdfd,24|-3|0xc0c0c0", 90, 499, 228, 567, 306},
	立即注册={0x0cbf07, "0|-5|0x0ec009", 90, 501, 364, 632, 409},
	['公告']={{309,101,0xfef9ed},{304,94,0xd4925d},{336,92,0xda9b65},{358,102,0xfdf8eb},{361,124,0x8a3c1a},},
	['进入游戏']={{556,159,0xfa9c71},{523,532,0xf5f0e5},{541,533,0xf09a47},{553,535,0xf5f0e5},{580,543,0xb3501e},},
	['角色选择']={{24,35,0xecd898},{453,46,0xffdbc3},{498,39,0xeb6b2c},{237,555,0xfb7970},{237,573,0xfcb276},},
	小书童丽华={0xfef4f2, "17|-9|0xfef8f8,-88|34|0x59d623,10|76|0x4dd9fc,33|154|0xc74445", 90, 0, 0, 1135, 639},
	['密码错误']={{537,295,0x502409},{565,288,0x4f2308},{580,271,0xdeccad},{579,292,0x4f2308},{601,294,0x4f2308},},

}
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


function reg()
	init('0',1)
	log('reg')
	while (true) do
		if active(app_bid.APP)then
			delay(2)
			click(500,500)
		end
		if done(m.正在加载)then
			log('正在加载')
		elseif done(m.爱奇艺游戏)then
			log('爱奇艺游戏')
			click(570,272)		
		elseif done(m.手机注册)then
			log('手机注册')
			click(677,409)
		elseif done(m.邮箱注册)then
			log('邮箱注册')
			account = RndLetter(8)..math.random(0,999)..'@qq.com'
			password = RndLetter(8)..math.random(0,99)
			if c_pic(m.请输入邮箱,'请输入邮箱')then
				input(account);
			end
			if c_pic(m.密码,'密码')then
				input(password)
			end
			if c_pic(m.请输入验证码,'请输入验证码')then
				input(haoi23())
				click(954,125)
			end
			if c_pic(m.立即注册,'立即注册')then
				writeFile(account_path,account.."|"..password)
			end
		elseif done(m.公告)then
			log('公告')
			click(925,124)
		elseif done(m.进入游戏)then
			log('进入游戏')
			click(565,540)
		elseif done(m.角色选择)then
			log('角色选择')
			weizi={{1002,103,0xf5f1ec},{912,271,0x685f59},{1005,429,0x99897f},}
			click(weizi[math.random(1,3)][1],weizi[math.random(1,3)][2])
			click(234,578)
			click(863,557)
		elseif c_pic(m.小书童丽华,'小书童丽华')then
			delay(3)
			return true
		else
			log('other')
			if done(m.密码错误)then
				click(567,403)
			end
		end
		delay(1)
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
		elseif c_pic(m.下载,'下载') then
			delay(8)
		elseif f_pic(m.APP,'秀丽江山')then
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
--			red_ip = red_ip or 0
--			red_ip = red_ip + 1 
--			if red_ip >= 3 then
--				return false
--			else
				return true
--			end
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
		if seven_007() then
			if VPN()then
				if safari(url)then
					reg()
				end
			end
		end
	end
end
