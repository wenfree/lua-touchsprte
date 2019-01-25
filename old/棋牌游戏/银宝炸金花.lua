require("tsp")
require("阿波罗")
require("玉米对接")
local sz = require("sz")




function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	Facebook_url = 'http://onlyonelife.online/Public/facebook/?service=Facebook.add'
	
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = Facebook_url
	headers_send = cjson.encode(headers)

	post_send = cjson.encode(t)
	log(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(Facebook_url, 20, headers_send, post_escaped)
	
	log(body_resp)
	if status_resp == 200 then
		toast('上传成功')
		return true
	end
end

function up_my_self(text)
	up ={}
	up.fristname = '银宝炸金花'
	up.map = text
	up.mail = phone
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = SMS
	upFacebook(up)
end


aoc={}
aoc['注册帐号-试玩一下']={{926,460,0xf9c84d},{697,468,0x433369},{207,614,0xc23483},}
aoc['升级帐号-x']={{814,632,0xf29f3a},{1274,44,0xe7e0fb},{129,55,0xfef3a9},}
帐号位置={1065,198}
验证码位置={1047,299}
密码1={977,397}
密码2={972,495}
aoc['获取验证码'] = { 0xc2bfdd, "0|1|0x8580c0,0|2|0x3a3299", 90, 1197, 182, 1273, 220}
aoc['帐号登录-游客登录']={{801,554,0xf69652},{561,560,0x8c99f0},{640,225,0xd8f9f9},}
aoc['系统公告']={{1123,124,0xe6dffc},{1111,125,0x6224a6},{550,137,0xe0f8fa},{540,137,0x4c2176},}


function reg()
	计时 = os.time()
	Time = 60*3
	
	手机号 = true
	发送 = false
	短信 = false
	gamePassword = 'Fwavx6688'   --myRand(4,math.random(9,11))
	注册 = false
	VPNkey = false
	密码 = true
	短信次数 = 0
	失败次数 = 0
	
	
	while (os.time()-计时<Time) do
		if active(game_bid['银宝炸金花'],5)then
		elseif done(aoc['系统公告'],'系统公告',true,1)then
			up_my_self('注册成功')
			return true
		elseif done(aoc['升级帐号-x'],'升级帐号-x')then
			if 手机号 then
				if GET_Phone(id,token)then
					click(帐号位置[1],帐号位置[2])
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(phone)
					手机号 = false
					发送 = true
					click(499,52)
					up_my_self('领取号码')
				end
			elseif 发送 then
				if c_pic(aoc['获取验证码'],'获取验证码',true)then
				else
					发送 = false
					短信 = true
				end
			elseif 密码 then
				click(密码1[1],密码1[2])
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(gamePassword)
				click(499,52)
				click(密码2[1],密码2[2])
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(gamePassword)
				密码 = false
			elseif 短信 then
				if getMessage(id,phone,token)then
					click(验证码位置[1],验证码位置[2])
					input(SMS)
					click(499,52)
					短信 = false
					注册 = true
				else
					toast('短信失败',1)
					delay(3)
					失败次数 = 失败次数 + 1
					if 失败次数 > 20 then
						return false
					end
				end
			elseif 注册 then
				done(aoc['升级帐号-x'],'升级帐号-x',true,1)
			end
			
		elseif done(aoc['注册帐号-试玩一下'],'试玩一下') or done(aoc['帐号登录-游客登录'],'游客登录')then	
			if VPNkey then
				done(aoc['注册帐号-试玩一下'],'注册帐号-试玩一下',true,1)
			else
				if VPN()then
					closeApp(game_bid['银宝炸金花'])
					delay(2)
					VPNkey = true
				end
			end
		else
			click(499,52)
		end
		mSleep(500)
	end
	toast('超时轮回',1)
end





init('0',1)
id = 16571
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'
game_bid['火拼德州'] = 'www.shisvi.jqdz'
game_bid['左右棋牌'] = 'com.zyqp.xxb'
game_bid['银宝炸金花'] = 'com.bui873.8'



VPNX()
if xz(game_bid['银宝炸金花'])then
	
	while (true) do
		if abl()then
			if get_idfa(game_bid['银宝炸金花'])then

				if reg()then
				end
				closeApp(game_bid['银宝炸金花'])
				delay(2)

			end
		end
		close_VPN()
		delay(2)
	end
end



















