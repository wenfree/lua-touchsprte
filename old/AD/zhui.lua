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
localversvion = 3
url = "http://luawarehouse.applinzi.com/AD/verson.php"
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
		web_url = "http://luawarehouse.applinzi.com/AD/zhui.lua";
		local_url = "/User/Media/TouchSprite/lua/zhui.lua";
		downFile(web_url,local_url)
		dialog('脚本更新重新启动', 5)
		lua_exit();
	end
end



init("0",0)
--ios8.0+
require "tsp"
adsge = "/User/Media/TouchSprite/lua/adsge.txt";
battlefront = "/User/Media/TouchSprite/lua/battlefrot.txt";
cabin006 = "/User/Media/TouchSprite/lua/cabin006.txt";
ip_txt = "/User/Media/TouchSprite/lua/"..os.date("%Y-%B-%d-").."ip.txt";

--字符串写入
if file_exists(ip_txt) then
	log("文件已经存在")
else
	log("文件不存在,创建一个")
	local file = io.open(ip_txt,"a")
	file:close()
	delay(2)
end

app_bid = {
	['VPN'] = "com.apple.Preferences",
	['IG'] = "com.unkn0wn.igvx",
	['007'] = "com.007gaiji.007gaiji",
	['NZT'] = "NZT",
	['adsge'] = "mx-2205554765",
	['突击前线'] = "com.appspot.battlefront",
	['天涯悦读'] = "com.appspot.cabin006",
	['qq'] = "com.tencent.mqq",
	['zhui'] = "com.zhui.zimin",
}
-----------------------读取数据-------------------------------
dialog("脚本启动~广告包为\n"..app_bid['zhui'], 2)
closeApp(app_bid['zhui'])
--------------设置-----------------
function wirteIp()
	if getNetTime()> 0 then
		ip_address = ip()
		if ip_address ~= nil then
			writeFile(ip_txt,ip_address)
			return true
		end
	end	
end

---------------VPN--数组-------------------
SET = {
	['设置']={	{307,83,0x000000},	{307,81,0xf7f7f7},	{307,70,0x000000},	{338,71,0x000000},},
	['正在连接']={ 0x000000, "8|0|0xffffff,11|0|0x000000,19|0|0xffffff", 90, 332, 600, 363, 607},
}
S = {
	['007']={	{83,277,0x4198ff},	{143,278,0x4198ff},	{209,278,0x4198ff},	{476,277,0x4198ff},},
	['IG8']={	{434,794,0xaaaaaa},	{486,792,0xaaaaaa},	{576,798,0xaaaaaa},	{583,837,0xaaaaaa},},
	['nzt8']={	{432,815,0xcccccc},{438,821,0x000000},{479,813,0x060606},{517,830, 0x1f1f1f},}
}
IGv8 = {	{488,812,0x000000},	{486,812,0xaaaaaa},	{489,812,0x9e9e9e},	{510,811,0x1b1b1b},}
NZT = { 	{432,815,0xcccccc}, {438,821,0x000000},	{479,813,0x060606},	{517,830,0x1f1f1f},}


m = {
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
	['admob']={{46,1121,0x00aecd},{14,1120,0x00aecd},},
}
---------------数组 END ----------------

---------------Event-事件---------------
function vpn()
	if active(app_bid['VPN'])then
		out_time = os.time()
		repeat
			log("等待Setting界面")
			delay(0.5)
			clickpic( 0x007aff, "-15|16|0x007aff,1|36|0x007aff,-20|16|0x0a80ff", 90, 4, 46, 123, 126) --后退
			clickpic( 0x007aff, "12|0|0xf7f7f7", 99, 267, 646, 379, 743) --点击好
			if os.time() - out_time > 5 then return false end
		until done(SET['设置'],95) 
		if clickpic(0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675)then--关闭VPN
			delay(2)
		end
		if clickpic( 0xffffff, "-26|1|0xc8c8c8,4|-29|0xe0e0e0,4|29|0xa1a1a1", 90, 447, 475, 630, 675)then
			log("启动VPN")
			out_time = os.time()
			repeat
				delay(0.5)
				if clickpic( 0x007aff, "11|0|0x007aff,27|-5|0x1383fe,10|20|0xf4f4f4,0|22|0x1081fe", 90, 256, 398, 415, 778) then
					return false
				end
				if os.time()-out_time > 100 then return false end 
			until findpic( 0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675,"VPN-OK")
			if findpic( 0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675,"VPN-OK")then
				----VPN---连接成功-----查询IP地址是否重复----------
				if wirteIp()then
					return true
				else
					log('vpn质量不行')
					return false
				end
			end
		elseif f_pic(SET['正在连接'],'正在连接')then
			delay(5)
		end
	else
		closeApp(app_bid['VPN'])
	end
end
function VPN()
	active(app_bid['VPN'])
	setp = setp or 0
	if setp == 0 then
		if done(SET.设置,95)then
			if c_pic(m.关,"关VPN")then
				delay(1)
			elseif c_pic(m.开,'开VPN')then
				setp = 1
			end
		end
	elseif setp == 1 then
		if f_pic(SET['正在连接'],'正在连接') then
			delay(1)
			return false
		elseif c_pic(m.开,'开VPN')then
			setp = 1
		elseif f_pic(m.关,"VPN-OK")then
			setp = 0
			return true
		end
	end
	c_pic(m.后退,"back")
	c_pic(m.好,'错误-好')
	c_pic(m.好2,'错误-好')
	log(setp)
	sotp = sotp or 0
	if sotp ~= setp98 then
		sotp = setp
		waitTimes = 0
		delay(0.5)
	elseif sotp == setp then
		waitTimes = waitTimes or 0
		waitTimes = waitTimes + 1
		if waitTimes > 30 then
			closeApp(frontAppBid())
			log("网络错误")
			delay(3)
			setp = 0
		end
		delay(0.5)
	end
end
------007---
function IG()
	if active(app_bid['IG'])then
		closed_n = closed_n or 0
		closed_n = closed_n + 1
		out_time = os.time()
		repeat
			log("等待IgV8界面")
			delay(0.5)
			clickpic( 0x007aff, "10|6|0xf3f3f3", 99, 272, 631, 368, 678) --获取参数失败--点击关闭
			if os.time() - out_time > 15 then return false end
		until done(S['IG8'],95)
		if clickpic( 0x101010, "12|0|0x050505,63|10|0x000000", 90, 445, 795, 566, 834)then --点击【一键新机】
			out_time = os.time()
			repeat
				findpic( 0x333333, "9|1|0x333333", 90, 385, 511, 417, 534,"还在读取数据")
				clickpic( 0x007aff, "10|6|0xf3f3f3,22|4|0x017aff,45|9|0x077cff", 90, 272, 631, 368, 678)
				delay(0.5)
			until clickpic( 0xffffff, "14|1|0xffffff", 90, 362, 511, 421, 542) or os.time() - out_time > 20
			----------------this one-----------------
			if done(S['IG8'],95) then
				if findpic( 0x000000, "3|0|0xffffff", 90, 393, 340, 572, 373,"刷机成功")then
					red_ip = 0
					return true
				elseif findpic( 0xff0000, "8|-2|0xffffff", 90, 391, 335, 575, 375,"刷机成功-IP重复")then
					red_ip = red_ip or 0
					red_ip = red_ip + 1
					if red_ip >= 3 then
						return false
					else
						return true
					end
				end
			end
		end
	else
		closeApp(app_bid['IG'])
	end
end
function seven_007()
	if active(app_bid['007'])then
		out_time = os.time()
		repeat
			log("等待PK188界面")
			delay(0.5)
			if os.time() - out_time > 5 then return false end
		until done(S['007'],95)
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
			red_ip = red_ip or 0
			red_ip = red_ip + 1 
			if red_ip >= 3 then
				return false
			else
				return true
			end
		elseif findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")then
			red_ip = 0
			return true
		end
	else
		closeApp(app_bid['007'])
	end
end
function NZT()
	if active(app_bid['NZT'])then
		out_time = os.time()
		repeat
			log("等待PK188界面")
			delay(0.5)
		until done(S['nzt8'],95) or os.time() - out_time > 5
		if clickpic( 0x000000, "12|6|0x000000,83|2|0x000000,122|2|0x000000", 90, 397, 667, 577, 710)then
			delay(1)
			if clickpic( 0xcccccc, "6|6|0x000000,47|-2|0x060606,85|15|0x1f1f1f", 90, 382, 796, 595, 852)then
				return true
			end
		end
	else
		closeApp(app_bid['NZT'])
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
--------------OYE-------------------------
function AD()
	if active(app_bid['zhui'])then
		log('zhui')
		delay(5)
	end
	out_time = os.time()
	ad_show = {}
	ad_show['admob'] = 0
	ad_mun = ad_mun or 1
	c_ad = c_ad or 1
	log(c_ad.."/"..ad_mun.."="..c_ad/ad_mun)
	while (true) do
		if done(m.admob) and ad_show.admob == 0 then
			log("google广告已经展示")
			ad_show.admob = 1
			ad_mun = ad_mun + 1
			movexy(314,665,317,183)
			delay(5)
		end
		if c_ad/ad_mun*1000 <= math.random(15,20) then
			click(255,1090)
			c_ad = c_ad + 1
			delay(20)
		end
		if os.time() - out_time >= math.random(50,60)then
			closeApp(app_bid['zhui'])
			return true
		end
		delay(1)
	end	
end

---------------Event-事件--END-------------
work_time_h = tonumber(os.date("%H"))
work_time_m = tonumber(os.date("%M"))
work_time_s = tonumber(os.date("%S"))
timeline = os.time() - work_time_h*60*60 - work_time_m*60 - work_time_s   ---把时间归为零时
while (true) do
	if os.time() - timeline >= 24*60*60-1 then
		ip_txt = "/User/Media/TouchSprite/lua/"..os.date("%Y-%B-%d-").."ip.txt";
		writeFiles(ip_txt,os.date())
		work_time_h = tonumber(os.date("%H"))
		work_time_m = tonumber(os.date("%M"))
		work_time_s = tonumber(os.date("%S"))
		delay(5)
		timeline = os.time() - work_time_h*60*60 - work_time_m*60 - work_time_s
	end
	work_time_h = tonumber(os.date("%H"))
	if work_time_h <= 2 or work_time_h >= 6 then
		if VPN()then
			if seven_007()then
				AD()
			end
		end
	else
		delay(10)
		dialog("睡觉时间", 10)
		delay(10)
	end
end


