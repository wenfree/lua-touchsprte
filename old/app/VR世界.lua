require '爱乐赞对接'
id = 18713
--ALZ()
--GET_Phone(id,token)
--getMessage(id,phone)
id_path = '/User/Media/TouchSprite/lua/VR世界_ID.txt'
url = 'http://www.gevek.com/show/index/exhibition/id/8'

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
	APP='com.Gevek.VRWorld',
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
	下载 = { 0xffffff, "-3|0|0x8bcb4b,10|-11|0x8bcb4b,25|7|0x8bcb4b,32|6|0xffffff", 90, 128, 792, 509, 879},
	APP={ 0x050c68, "2|1|0xfffffa,5|-5|0xe5effa,39|-7|0xe3f1fe,2|52|0xe3edfa", 90, 14, 142, 246, 365},
	-------------------------AppStore----------------------------------------------------------
	['闪屏1']={{730,590,0xbe673a},{819,589,0xbe673a},{854,589,0xbe673a},{1023,578,0x57cbd0},{1065,587,0x57cbd0},{1044,557,0x57cbd0},},
	['闪屏2']={{1049,564,0x57cbd0},{1055,573,0x57cbd0},{1097,583,0x57cbd0},{1104,607,0x6fd2d7},{1080,307,0xe9e9e9},},
	['闪屏3']={{671,372,0x19c4c3},{647,571,0x008aff},{424,560,0x008aff},{1099,498,0x1674b3},{446,73,0x4c67da},},
	['VR世界精品推荐']={{1064,40,0x333333},{695,38,0x333333},{695,36,0xf7f7f7},{60,23,0x627fe4},},
	['免费注册']={{1062,172,0xffffff},{1082,27,0x333333},{994,598,0x78aaeb},},
	['注册界面']={{1075,59,0xecf0f1},{547,79,0xffffff},{652,503,0xe77568},},
	输入手机={ 0xb9bfca, "2|2|0xe7eff5,3|22|0xb5bcc6,7|22|0xe7f0f5,80|16|0xbac0c8,92|12|0xb9bec7", 90, 423, 66, 719, 226},
	获取验证码={ 0xededed, "6|-1|0xaaaaaa,20|4|0xf1f1f1,24|-6|0xaaaaaa", 90, 653, 212, 784, 256},
	输入验证码={ 0x81aae5, "3|0|0xe4eff5,28|1|0xe4eff5,38|0|0x81aae5,29|18|0x81aae5", 90, 305, 159, 488, 258},
	密码={ 0xb6bcc5, "-22|2|0xe5edf1,-17|8|0xb4bac3,-11|21|0xbabfc7,-1|21|0xb6bcc4,14|18|0xe8eef1", 90, 434, 262, 617, 436},
	立即注册={ 0xe47367, "4|-12|0xfdf2f1,13|-5|0xfdf6f5,41|-25|0xe57366", 90, 481, 459, 651, 504},
	['登录界面']={{49,327,0xafc3d0},{650,368,0xe57264},{562,591,0x76a6f0},{574,590,0x76a6f0},{1050,329,0xbacacf},},
	登录={ 0xfae8e6, "5|-1|0xe37164", 90, 518, 392, 621, 429},
}
m['成功']={{479,333,0xaaaaaa},{482,336,0x000000},{490,334,0x000000},{500,333,0xaaaaaa},}
m['登录界面']={{1073,57,0xecf0f1},{53,59,0xecf0f1},{596,145,0xf9fbfc},{755,404,0xe77365},}
m.下载={  0x8bcb4b, "2|-7|0xffffff", 80, 271, 718, 436, 794}
m.手机={ 0xb8bec7, "26|4|0xb8bdc6,44|3|0xbac0c8,57|8|0xb6bbc4", 90, 436, 209, 631, 256}
m['用户信息']={{638,38,0x333333},{281,255,0x6492ec},{29,48,0x70a9ff},}
function reg()
	init('0',1)
	outT = os.time()
	while (true) do
		active(app_bid.APP)
		if done(m.VR世界精品推荐,'VR世界精品推荐')then
			click(947,618)
		elseif done(m.免费注册,'免费注册')then
			click(m.免费注册[1][1],m.免费注册[1][2])
		elseif done(m.注册界面,'注册界面')then
			if ALZ()then--登录爱乐赞
				if c_pic(m.输入手机,'输入手机')then
					if GET_Phone(id,token)then
						input(phone)
						click(974,145)
					else
						closeApp(app_bid.APP)
						return false
					end
				end
				if c_pic(m.获取验证码,'获取验证码')then
					click(974,145)
					outT_s = 0
					while true do
						outT_s = outT_s + 1
						if frontAppBid() ~= app_bid.APP then
							return false
						end
						if outT_s > 50 then
							closeApp(frontAppBid())
							addBlacklist(id,phone)
							delay(3)
							return false
						end
						if getMessage(id,phone)then
							delay(3)
							nLog('准备填验证码')
							if c_pic(m.输入验证码,'输入验证码')then
								input(yzm)
								click(974,145)
							end
							break
						end
					end
				end
				if c_pic(m.密码,'密码')then
					password = RndLetter(7)..math.random(0,999)
					input(password)
					click(974,145)
					if c_pic(m.密码,'密码')then
						input(password)
						click(974,145)
					end
				end
				if c_pic(m.立即注册,'立即注册')then
					delay(5)
					if done(m.成功,'成功')then
						click(h/2,w/2)
						writeFile(id_path,phone.."|"..password)
						click(682,576)
						delay(3)
						if done(m.注册界面,'注册界面')then
							click(682,576)
						end
					end
				end
			else
				return false
			end
		elseif done(m.登录界面)then
			log('登录界面')
			if c_pic(m.手机,'手机')then
				input(phone)
				click(974,145)
			end
			if c_pic(m.密码,'密码')then
				input(password)
				click(974,145)
			end
			if c_pic(m.登录,'登录')then
				delay(3)
				return true
			end
		elseif done(m.用户信息,'用户信息')then
			delay(3)
			closeApp(frontAppBid())
			return true
		end
		delay(1)
		if os.time() - outT > 240 then
			closeApp(frontAppBid())
			delay(2)
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
		elseif c_pic(m.下载,'下载')then
			delay(2)
		elseif f_pic(m.APP,'VR世界')then
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

