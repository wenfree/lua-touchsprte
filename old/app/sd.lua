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
require 'tsp'
id_path = '/User/Media/TouchSprite/lua/mzsg_account.txt'

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
	['mzsg'] = 'com.sg2.intl',
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
	更新={ 0xf5d247, "2|16|0xe0d596,-3|19|0x502202", 90, 632, 382, 711, 434},
	['注册']={{1056,21,0xff4242},{1057,33,0xff3838},{1063,40,0xf6f6f8},{1063,42,0xff3838},{1083,28,0xff3838},},
	用户注册={ 0x007aff, "9|-5|0x007aff,10|0|0xf9f9f9,14|6|0x007aff,20|0|0x007aff", 90, 474, 305, 656, 349},
	['注册界面']={{553,21,0x000000},{550,23,0xf6f6f7},{554,23,0x000000},{579,27,0xf6f6f7},{580,29,0x000000},},
	用户名={ 0x000000, "-2|1|0xffffff,-17|-2|0xffffff,-17|-4|0x000000,-54|-6|0x000000", 90, 64, 191, 162, 239},
	下一页={0x000000, "3|3|0xabb3be", 90, 970, 582, 1074, 621},
	Done={ 0x007aff, "6|0|0xffffff", 90, 978, 581, 1063, 614},
	time_out={ 0x000000, "7|0|0xf9f9f9,8|-1|0x141414,13|-1|0xf9f9f9,15|-1|0x000000", 90, 620, 275, 678, 313},
	登录={ 0xf44040, "0|1|0xffffff,5|4|0xeb4c4c", 90, 236, 457, 327, 507},
	注册成功={ 0x0b0b0b, "1|-4|0xf9f9f9,4|-6|0x181818,14|-2|0xf6f6f6,15|-3|0x000000", 90, 576, 279, 632, 316},
	['确认']={  0x532200, "1|-1|0x341f06,5|-2|0xc6b47b", 90, 536, 536, 597, 563 },
	['点击开始游戏']= {{87,93,0xfcfc00},{226,116,0x24e8ff},{304,125,0xe5ffff},{490,264,0x030000},{1073,62,0xd82822},},
	['设定司令官名称']={{502,238,0xd5d5dd},{502,240,0x040631},{523,238,0xfafafb},{525,238,0x0a0b3c},{762,232,0x0d61a3},},
	确认2 = {0x3c2608, "-4|3|0xcfc085,-9|7|0x542200", 90, 537, 586, 592, 616},
	一键新机={ 0xffffff, "1|6|0x45cd23", 90, 222, 403, 398, 463},
	一键恢复={ 0x4198ff, "1|-8|0xffffff", 90, 234, 502, 393, 555},
	you9={ 0xdc3d39, "13|1|0xd82a25,28|-3|0xf07920,15|14|0xffd3af", 90, 1009, 6, 1116, 105},
	切换帐号={ 0x22b48f, "23|-15|0x22b490,34|2|0x17b08a,17|15|0x17b08a,18|0|0xffffff", 90, 87, 299, 160, 350},
	-------------------------------------明珠三国--------------------------------
	['公告']={{538,48,0xefd384},{557,71,0xce3008},{558,83,0xf7be5a},{591,77,0xf7cf73},{598,77,0xbd2408},},
	['进入游戏']={{322,134,0xffff39},{439,183,0xfff3b5},{594,154,0xffefa5},{701,63,0xf7df63},{813,198,0xffffef},},
	['快速注册']={{447,105,0xf8b500},{478,135,0x0078b7},{430,140,0xba1126},{447,148,0xb5d132},{443,146,0xf8fbec},},
	['快速注册_手机']={{308,165,0xf08a24},{355,165,0xf08a24},{547,164,0xf08a24},{515,205,0xf08a24},{208,211,0xf08a24},},
	手机注册={ 0x000000, "4|0|0xeeeeee,7|0|0x000000,10|-4|0x000000,-73|76|0xf08a24", 90, 448, 53, 700, 202},
	['快速注册_用户名']={{590,187,0xdc750f},{630,184,0xdc750f},{693,159,0xdc750f},{761,212,0xdc750f},{925,162,0xdc750f},},
	注册用户名={ 0x000000, "4|-3|0xeeeeee,7|-3|0x000000,10|2|0xeaeaea,8|8|0x000000,-9|88|0xf08a24", 80, 448, 53, 700, 202},
	用户名={ 0xf1f1f1, "0|12|0xffffff,-15|19|0xf1f1f1,-16|19|0xffffff,-32|18|0xcccccc", 90, 166, 284, 243, 378},
	Done={ 0x007aff, "6|0|0x007aff,3|0|0xefeff1", 90, 1017, 169, 1133, 328},
	密码={ 0xf1f1f1, "4|0|0xffffff,11|2|0xffffff,19|3|0xf1f1f1,-5|18|0xffffff,-25|16|0xcccccc", 90, 177, 393, 251, 476},
	注册={ 0xf08a24, "-4|1|0xffffff,-5|-6|0xffffff", 90, 526, 567, 597, 598},
	['创建角色']={{1090,41,0xffdb7b},{1081,64,0xf7cf39},{995,579,0xe7be6b},{1005,582,0x9c1400},{1084,604,0xde8a31},},
	['点击继续']={{1045,615,0xf7fbff},{1049,618,0x100800},{1057,618,0xffffff},{1093,622,0xf7efef},{1091,619,0x080808},},
	['开始']={{989,562,0xce4108},{995,570,0xf7d37b},{1029,583,0x941408},{1037,592,0xe7a64a},{1103,581,0xefbe63},},
	P={ 0xff1a1d, "8|0|0xff0123,3|4|0xff0121,4|6|0x626565", 90, 10, 0, 65, 34},
	['用户中心']={{512,74,0x000000},{514,76,0xeeeeee},{520,80,0x000000},{560,84,0xeeeeee},{562,86,0x000000},{611,86,0x000000},},
	切换帐号={ 0x040404, "1|1|0xffffff,13|6|0x000000,14|5|0xfcfcfc,8|16|0x000000,8|22|0xffffff", 90, 166, 471, 387, 556},
	['tips']={{721,66,0x1d1d1d},{753,65,0x1d1d1d},{796,66,0x1d1d1d},{852,70,0x1d1d1d},{806,258,0xd6d4d3},},
	网络不好={ 0x083c08, "3|-6|0xadf310,5|0|0x083c00,10|-4|0xa5e310,18|-2|0x083c08", 90, 499, 368, 633, 430},

}
function event()
	if c_pic(m.更新,'更新')then
		
	elseif done(m.注册)then
		log('注册')
		click(1078,28)
	elseif c_pic(m.用户注册,'用户注册')then
	elseif c_pic(m.确认,'确认')then
	elseif c_pic(m.you9,'you9')then
	elseif c_pic(m.切换帐号,'切换帐号')then
	elseif done(m.注册界面)then
		log('注册界面')
		if f_pic(m.用户名,'用户名')then
			click(x+200,y)
			account = RndLetter(4).. math.random(1000,9999)
			input(account)
			c_pic(m.下一页,'下一页')
			password = RndLetter(3).. math.random(1000,9999)
			input(password)
			c_pic(m.下一页,'下一页')
			input(password)
			c_pic(m.Done,'Done')
			delay(3)
		end
	elseif f_pic(m.注册成功,'注册成功')then
		click(565,397)
		c_pic(m.登录,'登录')
		writeFile(SD_account,account..'|'..password,'a')
		delay(3)
		return true
	else
		f_pic(m.time_out,'time_out')
		click(563,397)
	end
end
function login()
	init('0',1);
	while (true) do
		if c_pic(m.确认,'确认')then
		elseif done(m.设定司令官名称)then
			click(750,306)
			click(567,370)
		elseif done(m.点击开始游戏)then
			click(569,468)
		elseif c_pic(m.确认2,'确认2')then
			log('签到')
			return true
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
				else
					click(319,33)
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
function reg()
	init('0',1);
	while (true) do
		if active(app_bid.sd)then
			delay(2)
		end
		if event()then
			--return true
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
function mzsg()
	init('0',1)
	outT = os.time()
	while (true) do
		active(app_bid.mzsg)
		if done(m.公告)then
			log('公告')
			click(570,559)
		elseif done(m.进入游戏)then
			log('进入游戏')
			click(569,521)
		elseif done(m.快速注册)then
			log('快速注册')
			click(776,463)
		elseif done(m.快速注册_手机,80)then
			log('快速注册_手机')
			click(754,187)
		elseif done(m.快速注册_用户名,80)then
			log('快速注册_用户名')
			account = 'MZSG'..RndLetter(2).. math.random(100,9999)
			password = RndLetter(4).. math.random(100,9999)
			if c_pic(m.用户名,'用户名')then
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(account)
				c_pic(m.Done,'Done')
			end			
			if c_pic(m.密码,'密码')then
				input(password)
				c_pic(m.Done,'Done')
			end
			if c_pic(m.注册,'注册')then
				click(561,572)
--				writeFile(id_path,account.."|"..password..'---------')
				delay(5)
				if done(m.创建角色)then
					writeFile(id_path,account.."|"..password)
				end
			end
		elseif done(m.创建角色)then
			click(734,586)			
			click(1019,588)
		elseif done(m.点击继续)then
			closeApp(frontAppBid())
			return true
		elseif done(m.用户中心)then
			moveUp(527,544,526,268)
			delay(2)
			c_pic(m.切换帐号,'切换帐号')
		elseif c_pic(m.P,'P')then
			click(47,46)
		elseif done(m.tips)then
			click(571,398)
		elseif c_pic(m.网络不好,'网络不好')then
			closeApp(frontAppBid())
			return false
		end
		delay(1)
		if os.time()- outT > 300 then
			closeApp(frontAppBid())
			return false
		end
	end
end

while (true) do
	if true or OO7() then
		if VPN()then
			mzsg()
		end
	end
end