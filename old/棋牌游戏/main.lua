require("tsp")
require("阿波罗")
require("玉米对接")
local sz = require("sz")
init('0',1)
id = 10926
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'





function upFacebook(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	Facebook_url = 'http://test1.oupag.com/Public/facebook/?service=Facebook.add'
	
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
	up.fristname = '欢乐游戏'
	up.map = text
	up.mail = idfa
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = gamePassword
	upFacebook(up)
end


aoc={}
aoc['游客-登录-首界面']={{809,604,0x3fe2d7},{528,596,0x6cfbdd},{919,245,0xfef084},}
aoc['兑换-关闭游戏']={{427,676,0x75d20e},{429,676,0x314328},{463,487,0xfffefb},}
aoc['弹窗-立即注册']={{616,525,0xfeec2a},{616,503,0xfff66b},{1027,161,0xbde0f9},}
aoc['立即注册-3元']={{631,503,0xfff668},{429,49,0x1d0531},{429,44,0x626262},}
aoc['注册界面-升级帐号']={{1196,108,0xbde0f9},{697,177,0x268fa3},}
	aoc['注册界面-手机号']={ 0x62516d, "0|-3|0x3e135e,0|-6|0x62516d", 90, 379, 236, 577, 283}
	aoc['注册界面-点击获取']={ 0xc772da, "4|-4|0x472566,7|5|0xc772da", 90, 1018, 232, 1144, 281}
		aoc['注册界面-已经注册']={ 0xffffff, "0|-4|0x703b98,-10|-11|0xffffff,-6|13|0xffffff,-5|11|0x75429b", 90, 833, 332, 865, 366}
		aoc['注册界面-禁止注册']={ 0xfbf9fc, "3|0|0x6c3695,8|-11|0xffffff,11|-7|0x6c3695,14|-3|0xffffff", 90, 681, 331, 712, 365}
		aoc['注册界面-成功发送']={ 0xbf6dd3, "-1|10|0x442363,-7|44|0xc772da", 90, 1046, 222, 1110, 291}
	aoc['注册界面-密码']={ 0x62516d, "1|-3|0x3a135b,2|-6|0x62516d", 90, 460, 361, 540, 522}
	aoc['注册界面-输入确定']={ 0x007aff, "-17|-3|0xd4cbe0,-22|-14|0x007aff", 90, 1072, 362, 1179, 416}
	aoc['注册界面-确定']={ 0x63ebcd, "-4|-1|0x422f61,-4|-3|0x7befde", 90, 736, 562, 850, 624}
aoc['游戏主界面']={{90,696,0xffffc7},{420,659,0xbfff63},{745,664,0xcafdfb},}
aoc['6元完成']={{435,41,0xffffff},{435,46,0x490d7f},{434,54,0x490c7e},{434,58,0xffffff},{428,53,0xffffff},}
aoc['弹窗x']={{1143,74,0xbde0f9},{854,109,0xffe66f},{1095,125,0x2b88a2},}	
aoc['复制链接x']={{1132,125,0xb7def9},{622,573,0xd96fff},{618,573,0x262044},}
aoc['弹窗-注册失败']={{704,346,0xfdfdfe},{706,346,0x6c3695},{712,343,0x6c3695},{718,343,0xffffff},{718,345,0x6c3695},}


close_VPN()
function reg()
	计时 = os.time()
	Time = 60*1.5
	
	手机号 = true
	发送 = false
	短信 = false
	登录次数 = true
	gamePassword = 'Fwavx6688' --myRand(4,math.random(9,11))
	while (os.time()-计时<Time) do
		if active(game_bid['趣玩百佬汇'],5)then
		elseif done(aoc['游客-登录-首界面'],'游客-登录-首界面',false,1)then
		
			if 登录次数 then
				done(aoc['游客-登录-首界面'],'游客-登录-首界面',true,1)
				登录次数 = false
			else
				closeApp(game_bid['趣玩百佬汇'])
				close_VPN()
				VPN()
			end
				
		elseif done(aoc['弹窗-立即注册'],'弹窗-立即注册',false,1)then
			if done(aoc['立即注册-3元'],'立即注册-3元',true,1)then
				toast('有3元可以注册',1)
			else
				toast('无3元,x掉换ip',1)
				closeApp(game_bid['趣玩百佬汇'])
				close_VPN()
				delay(2)
				VPN()
			end
		elseif done(aoc['兑换-关闭游戏'],'兑换-关闭游戏')then
			closeApp(game_bid['趣玩百佬汇'])
			delay(2)
		elseif done(aoc['注册界面-升级帐号'],'注册界面-升级帐号')then
			if 手机号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['注册界面-手机号'],'注册界面-手机号',true)then
						delay(1)
						input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
						input(phone)
						if c_pic(aoc['注册界面-输入确定'],'注册界面-输入确定',true)then
							toast('手机号输入完成',1)
							delay(2)
							手机号 = false
							发送 = true
						end
					end
				end
			elseif 发送 then
				if c_pic(aoc['注册界面-成功发送'],'注册界面-成功发送',true)then
					发送 = false
					短信 = true
				elseif c_pic(aoc['注册界面-点击获取'],'注册界面-点击获取',true)then
					up_my_self('发送短信')
				end
			elseif 短信 then
				if c_pic(aoc['注册界面-密码'],'注册界面-密码',true)then
					delay(1)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(gamePassword)
					c_pic(aoc['注册界面-输入确定'],'注册界面-输入确定',true)
				else
					if getMessage(id,phone,token)then
						click(868,258,2)
						input(SMS)
						c_pic(aoc['注册界面-输入确定'],'注册界面-输入确定',true)
						短信 = false
					else
						delay(5)
					end
				end
			else
				c_pic(aoc['注册界面-确定'],'注册界面-确定',true)
			end
		elseif done(aoc['游戏主界面'],'游戏主界面',true,1)then
		elseif done(aoc['6元完成'],'6元完成',true,1)then
			up_my_self('6元')
			return true
		elseif done(aoc['弹窗x'],'弹窗x',true,1)then
		elseif done(aoc['复制链接x'],'复制链接x',true,1)then
		else
			delay(1)
		end
	end
	toast('超时轮回',1)
end

function NewPhone()
	if abl()then
		if get_idfa(game_bid['趣玩百佬汇'])then
			newTime = os.time()
			newLine = 60
			while (os.time()-newTime<newLine) do
				if active(game_bid['趣玩百佬汇'],5)then
				elseif done(aoc['游客-登录-首界面'],'游客-登录-首界面',false,1)then
					return true
				else
					delay(3)
				end
			end
		end
	end
end

if xz(game_bid['趣玩百佬汇'])then
	while (true) do
		if NewPhone()then
			if VPN()then
				
				reg()
				closeApp(game_bid['趣玩百佬汇'])
				delay(2)
			
			end
		end
		close_VPN()
	end
end



















