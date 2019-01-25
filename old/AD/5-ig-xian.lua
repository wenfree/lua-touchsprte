localversvion = 2

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

local sz = require("sz")
local http = require("szocket.http")
local res, code = http.request("http://luawarehouse.applinzi.com/ver.php");
if code == 200 then
	versvion = tonumber(res)
	nLog(versvion)
	if localversvion == versvion then
		nLog('版本相同无需更新')
	else
		nLog('下载新版本')
		downUrl = 'http://luawarehouse.applinzi.com/AD/5-ig-xian.lua'
		localurl = "/User/Media/TouchSprite/lua/5-ig-xian.lua"
		if downFile(downUrl,localurl)then
			lua_restart();
		end
	end
end


--------------------------------------------------------


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
--字符串写入
if file_exists(adsge) ~= true then
	log("创建一个")
	writeFiles(adsge,"1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1");
end
if file_exists(battlefront) ~= true then
	log("创建一个")
	writeFiles(battlefront,"1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1");
end
if file_exists(cabin006) ~= true then
	log("创建一个")
	writeFiles(cabin006,"1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1");
end
function ad()
	clicklist = readFile(adsge)
	A = str_cut(clicklist[1],"|")
	blist = readFile(battlefront)
	B = str_cut(blist[1],"|")
	clist = readFile(cabin006)
	C = str_cut(clist[1],"|")
end
ad()
app_bid = {
	['VPN'] = "com.apple.Preferences",
	['IG'] = "com.unkn0wn.igvx",
	['007'] = "com.007gaiji.007gaiji",
	['NZT'] = "NZT",
	['adsge'] = "mx-365113102",
	['突击前线'] = "com.appspot.battlefront",
	['天涯悦读'] = "com.appspot.cabin006",
	['qq'] = "com.tencent.mqq",
}
-----------------------读取数据-------------------------------
dialog("脚本启动~广告包为\n"..app_bid['adsge'].."\n"..app_bid['突击前线'].."\n"..app_bid['天涯悦读'], 2)
closeApp(app_bid['突击前线'])
closeApp(app_bid['adsge'])
closeApp(app_bid['天涯悦读'])
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
}
IGv8 = {	{488,812,0x000000},	{486,812,0xaaaaaa},	{489,812,0x9e9e9e},	{510,811,0x1b1b1b},}
NZT = { 	{432,815,0xcccccc}, {438,821,0x000000},	{479,813,0x060606},	{517,830,0x1f1f1f},}

adsge_show = {
	{	{74,50,0xffffff},	{129,50,0xffffff},	{231,50,0xffffff},	{359, 50,0xffffff},},	--1
	{	{74,153,0xffffff},	{129,153,0xffffff},{231,153,0xffffff},{359, 153,0xffffff},},	--2
	{	{74,256,0xffffff},	{129,256,0xffffff},{231,256,0xffffff},{359, 256,0xffffff},},	--3
	{	{74,359,0xffffff},	{129,359,0xffffff},{231,359,0xffffff},{359, 359,0xffffff},},	--4
	{	{74,462,0xffffff},	{129,462,0xffffff},{231,462,0xffffff},{359, 462,0xffffff},},	--5
	{	{74,565,0xffffff},	{129,565,0xffffff},{231,565,0xffffff},{359, 565,0xffffff},},	--6
	{	{74,668,0xffffff},	{129,668,0xffffff},{231,668,0xffffff},{359, 668,0xffffff},},	--7
	{	{74,771,0xffffff},	{129,771,0xffffff},{231,771,0xffffff},{359, 771,0xffffff},},	--8
	{	{74,874,0xffffff},	{129,874,0xffffff},{231,874,0xffffff},{359, 874,0xffffff},},	--9
	{	{74,977,0xffffff},	{129,977,0xffffff},{231,977,0xffffff},{359, 977,0xffffff},},	--10
	{	{74,1080,0xffffff},	{129,1080,0xffffff},{231,1080,0xffffff},{359, 1080,0xffffff},},	--11
}
battlefront_show = {
	{	{94,82,0x800080},	{199,84,0x800080},	{325,86,0x800080},	{457,79,0x800080},},
	{	{93,186,0x000080},	{189,186,0x000080},	{317,187,0x000080},	{492,189,0x000080},},
	{	{70,284,0x008080},	{158,284,0x008080},	{317,279,0x008080},	{500,283,0x008080},},
	{	{78,387,0x808000},	{205,388,0x808000},	{355,386,0x808000},	{520,385,0x808000},},	
	{	{87,490,0x800000},	{215,485,0x800000},	{387,482,0x800000},	{564,485,0x800000},},
	{	{97,586,0xff00ff},	{243,586,0xff00ff},	{355,585,0xff00ff},	{531,584,0xff00ff},},
	{	{111,687,0x00ffff},	{227,687,0x00ffff},	{299,687,0x00ffff},	{481,686,0x00ffff},},
	{	{107,786,0x0000ff},	{203,788,0x0000ff},	{331,788,0x0000ff},	{544,791,0x0000ff},},
	{	{71,882,0x00ff00},	{186,885,0x00ff00},	{467,891,0x00ff00},	{558,889,0x00ff00},},
	{	{69,991,0xffff00},	{190,989,0xffff00},	{320,986,0xffff00},	{512,986,0xffff00},},
	{	{98,1090,0xff0000},	{183,1089,0xff0000},{312,1087,0xff0000},{485,1089,0xff0000},},
}
cabin006_show = {
	{	{94,82,0x800080},	{199,84,0x800080},	{325,86,0x800080},	{457,79,0x800080},},
	{	{93,186,0x000080},	{189,186,0x000080},	{317,187,0x000080},	{492,189,0x000080},},
	{	{70,284,0x008080},	{158,284,0x008080},	{317,279,0x008080},	{500,283,0x008080},},
	{	{78,387,0x808000},	{205,388,0x808000},	{355,386,0x808000},	{520,385,0x808000},},
	{	{87,490,0x800000},	{215,485,0x800000},	{387,482,0x800000},	{564,485,0x800000},},
	{	{68,589,0xffffff},	{197,586,0xffffff},	{340,590,0xffffff},	{495,586,0xffffff},},
	{	{99,684,0x00ffff},	{221,683,0x00ffff},	{378,681,0x00ffff},	{532,680,0x00ffff},},
	{	{96,782,0x0000ff},	{179,783,0x0000ff},	{332,782,0x0000ff},	{538,780,0x0000ff},},
	{	{90,884,0x00ff00},	{215,884,0x00ff00},	{310,881,0x00ff00},	{533,881,0x00ff00},},
	{	{81,987,0xffff00},	{211,984,0xffff00},	{325,984,0xffff00},	{474,984,0xffff00},},
	{	{78,1089,0xffffff},	{196,1089,0xffffff},{324,1090,0xffffff},{490,1090,0xffffff},},
}
m = {
	['x'] ={0xffffff, "8|9|0xffffff,0|5|0x000000,-6|9|0xffffff", 90, 588, 29, 612, 51},
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
				if f_p(0xff0000,90, 192, 337,445, 374,"红色ip")then break end
				if os.time() - out_time > 8 then return false end
			until findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")
		end
		if f_p(0xff0000,90, 192, 337,445, 374,"红色ip") then
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
		until done(NZT,95) or os.time() - out_time > 5
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
--------------OYE-------------------------
function AD()
	if active(app_bid['adsge'])then
		log('adsge-(5)')
		delay(5)
	end
	if active(app_bid['天涯悦读'])then
		log('天涯悦读-(5)')
		delay(5)
	end
	if active(app_bid['突击前线'])then
		delay(5)
	end
	log('展示25-30秒')
	out_time = os.time()
	repeat
		c_pic(m['x'],'x')
		delay(math.random(1,3))
	until os.time() - out_time > 15
	delay(math.random(0,5))
	True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --空table
	check_Time = os.time()
	local ad_mun ,ad_show_mun = true,0
	while os.time()-check_Time <= 6 do
		if app_bid['突击前线'] == frontAppBid() then
			for i,v in ipairs(battlefront_show) do
				if done(v)then
					--log("AD"..i.."~NO")
				else
					if True_AD[i] == 0 then
						log("AD"..i.."~YES")
						ad_show_mun = ad_show_mun + 1
						B[i*2] = B[i*2] + 1
						True_AD[i] = 1
					end
				end
				delay(0.1)
			end
		else
			return false
		end
		log("广告统计数量为->"..ad_show_mun)
		delay(0.5)
	end
	for i= 1,#battlefront_show do
		if B[(i-1)*2+1]/B[i*2] <= math.random(20,40)/1000 then
			B[(i-1)*2+1] = B[(i-1)*2+1] + 1
			click(battlefront_show[i][1][1],battlefront_show[i][1][2])
			delay(math.random(20,30))
			break;
		end
	end
	text = table.concat(B, "|")
	writeFiles(battlefront,text)
	closeApp(app_bid['突击前线'])
---------------------第一个计算结束-------------
	if active(app_bid['adsge'])then
		log("启动广告2秒")
		delay(2)
		True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空广告
		check_Time = os.time()
		local ad_mun ,ad_show_mun = true,0
		while os.time()-check_Time <= 3 do
			if app_bid['adsge'] == frontAppBid() then
				for i,v in ipairs(adsge_show) do
					if done(v)then
						--log("AD"..i.."~NO")
					else
						if True_AD[i] == 0 then
							log("AD"..i.."~YES")
							ad_show_mun = ad_show_mun + 1
							A[i*2] = A[i*2] + 1
							True_AD[i] = 1
						end
					end
					delay(0.1)
				end
			else
				break;
			end
			log("广告统计数量为->"..ad_show_mun)
			delay(0.5)
		end
		---查询END--------------
		for i= 1,#adsge_show do
			if A[(i-1)*2+1]/A[i*2] <= math.random(20,40)/1000 then
				A[(i-1)*2+1] = A[(i-1)*2+1] + 1
				click(adsge_show[i][1][1],adsge_show[i][1][2])
				delay(math.random(20,30))
				break;
			end
		end
		text = table.concat(A, "|")
		writeFiles(adsge,text)
		closeApp(app_bid['adsge'])
	end
	if active(app_bid['天涯悦读'])then
		log("启动广告2秒")
		True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空广告
		delay(2)
		---查询广告数量-------------------
		check_Time = os.time()
		local ad_mun ,ad_show_mun = true,0
		while os.time()-check_Time <= 2 do
			if app_bid['天涯悦读'] == frontAppBid() then
				for i,v in ipairs(cabin006_show) do
					if done(v)then
						--log("AD"..i.."~NO")
					else
						if True_AD[i] == 0 then
							log("AD"..i.."~YES")
							ad_show_mun = ad_show_mun + 1
							C[i*2] = C[i*2] + 1
							True_AD[i] = 1
						end
					end
					delay(0.1)
				end
			else
				break;
			end
			delay(0.2)
			log("广告统计数量为->"..ad_show_mun)
		end
		---查询END--------------
		for i= 1,#cabin006_show do
			if C[(i-1)*2+1]/C[i*2] <= math.random(20,40)/1000 then
				C[(i-1)*2+1] = C[(i-1)*2+1] + 1
				click(cabin006_show[i][1][1],cabin006_show[i][1][2])
				delay(math.random(20,30))
				break;
			end
		end
		text = table.concat(C, "|")
		writeFiles(cabin006,text)
		closeApp(app_bid['天涯悦读'])
	end
	closeApp(app_bid['突击前线'])
	closeApp(app_bid['adsge'])
	closeApp(app_bid['天涯悦读'])
end
function OYE()
	if active(app_bid['adsge'])then
		log("启动广告,随机10-20秒")
		True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空广告
		delay(math.random(5,10))
		---查询广告数量-------------------
		check_Time = os.time()
		local ad_mun ,ad_show_mun = true,0
		while os.time()-check_Time <= 10 and ad_mun  do
			if app_bid['adsge'] == frontAppBid() then
				for i,v in ipairs(adsge_show) do
					if done(v)then
						--log("AD"..i.."~NO")
					else
						if True_AD[i] == 0 then
							log("AD"..i.."~YES")
							ad_show_mun = ad_show_mun + 1
							A[i*2] = A[i*2] + 1
							True_AD[i] = 1
						end
					end
					delay(0.1)
				end
			else
				break;
			end
			if ad_show_mun > 10 then
				ad_mun = false
			end
			log("广告统计数量为->"..ad_show_mun)
			delay(0.5)
		end
		---查询END--------------
		for i= 1,#adsge_show do
			if A[(i-1)*2+1]/A[i*2] <= math.random(20,40)/1000 then
				A[(i-1)*2+1] = A[(i-1)*2+1] + 1
				click(adsge_show[i][1][1],adsge_show[i][1][2])
				delay(math.random(20,30))
				break;
			end
		end
		text = table.concat(A, "|")
		writeFiles(adsge,text)
		closeApp(app_bid['adsge'])
		--return true
	end
	if active(app_bid['突击前线'])then
		log("启动广告,随机10-20秒")
		True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空广告
		delay(math.random(5,7))
		---查询广告数量-------------------
		check_Time = os.time()
		local ad_mun ,ad_show_mun = true,0
		while os.time()-check_Time <= 13 and ad_mun  do
			if app_bid['突击前线'] == frontAppBid() then
				for i,v in ipairs(battlefront_show) do
					if done(v)then
						--log("AD"..i.."~NO")
					else
						if True_AD[i] == 0 then
							log("AD"..i.."~YES")
							ad_show_mun = ad_show_mun + 1
							B[i*2] = B[i*2] + 1
							True_AD[i] = 1
						end
					end
					delay(0.1)
				end
			else
				break;
			end
			if ad_show_mun > 5 then
				ad_mun = false
			end
			delay(0.5)
			log("广告统计数量为->"..ad_show_mun)
		end
		---查询END--------------
		for i= 1,#battlefront_show do
			if B[(i-1)*2+1]/B[i*2] <= math.random(20,40)/1000 then
				B[(i-1)*2+1] = B[(i-1)*2+1] + 1
				click(battlefront_show[i][1][1],battlefront_show[i][1][2])
				delay(math.random(20,30))
				break;
			end
		end
		text = table.concat(B, "|")
		writeFiles(battlefront,text)
		closeApp(app_bid['突击前线'])
		--return true
	end	
	if active(app_bid['天涯悦读'])then
		log("启动广告,随机10-20秒")
		True_AD = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空广告
		delay(math.random(8,9))
		---查询广告数量-------------------
		check_Time = os.time()
		local ad_mun ,ad_show_mun = true,0
		while os.time()-check_Time <= 8 and ad_mun  do
			if app_bid['天涯悦读'] == frontAppBid() then
				for i,v in ipairs(cabin006_show) do
					if done(v)then
						--log("AD"..i.."~NO")
					else
						if True_AD[i] == 0 then
							log("AD"..i.."~YES")
							ad_show_mun = ad_show_mun + 1
							C[i*2] = C[i*2] + 1
							True_AD[i] = 1
						end
					end
					delay(0.1)
				end
			else
				break;
			end
			if ad_show_mun > 2 then
				ad_mun = false
			end
			delay(0.5)
			log("广告统计数量为->"..ad_show_mun)
		end
		---查询END--------------
		for i= 1,#cabin006_show do
			if C[(i-1)*2+1]/C[i*2] <= math.random(20,40)/1000 then
				C[(i-1)*2+1] = C[(i-1)*2+1] + 1
				click(cabin006_show[i][1][1],cabin006_show[i][1][2])
				delay(math.random(20,30))
				break;
			end
		end
		text = table.concat(C, "|")
		writeFiles(cabin006,text)
		closeApp(app_bid['天涯悦读'])
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
		if vpn()then
			if IG()then
				AD()
			end
		end
	else
		delay(10)
		dialog("睡觉时间", 10)
		delay(10)
	end
end















