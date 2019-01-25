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
	up.fristname = '猫眼电影'
	up.map = text
	up.mail = phone
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = SMS
	upFacebook(up)
end


aoc={}
aoc['弹窗-新手奖励']={{585,646,0xf19dff},{585,655,0xe858ff},{656,111,0xd2fffc},}
aoc['弹窗-注册送金']={{563,660,0xed5aff},{564,645,0xf79fff},{590,97,0xfff6d7},{1104,138,0xffffff},}
aoc['弹窗-注册界面-x-注册']={{615,649,0xffcb2f},{994,70,0xff710d},{834,62,0x55baff},}
	aoc['弹窗-注册界面-手机号']={ 0xc6ced2, "9|-9|0xc6c9d2,10|-7|0x7993ad", 90, 655, 194, 846, 251}
	aoc['弹窗-注册界面-获取短信']={ 0xdcebfd, "0|14|0x1c9af5,10|0|0xdfeefd", 90, 829, 276, 960, 358}
		aoc['弹窗-注册界面-已经发送']={ 0x060b0b, "7|1|0x9c9b9c,12|0|0x16191c", 90, 850, 289, 931, 344}
	aoc['弹窗-注册界面-密码']={ 0xb9c0cc, "4|-3|0x869cb2,6|-11|0xbbc3cd,6|-21|0x7390a7", 90, 902, 384, 957, 527}
	aoc['弹窗-注册界面-输入验证码']={ 0x7c97af, "4|0|0xc6cdd0,10|8|0xd0d0d4", 90, 594, 283, 763, 348}
	
aoc['弹窗-恭喜获得']={{668,534,0xfbc527},{629,404,0xffd40f},{635,404,0x311914},{929,181,0xff710e},}
aoc['弹窗-赠送3元']={{948,536,0xfffe92},{867,528,0xfffe94},{870,561,0xffff90},{916,559,0xffff94},{916,563,0xc45711},}
aoc['弹窗-赠送0.5元']={{877,561,0xffff94},{901,592,0xffff91},{1029,556,0xffff91},{1036,555,0xd17023},}


function reg()
	计时 = os.time()
	Time = 60*10
	
	手机号 = true
	发送 = false
	短信 = false
	gamePassword = 'Fwavx6688'   --myRand(4,math.random(9,11))
	注册 = false
	打一局 = false
	短信次数 = 0
	
	
	while (os.time()-计时<Time) do
		if active(game_bid['左右棋牌'],5)then
		elseif done(aoc['弹窗-新手奖励'],'弹窗-新手奖励')then
			closeApp(game_bid['左右棋牌'])
			delay(2)
		elseif done(aoc['弹窗-注册送金'],'弹窗-注册送金',false,1)then
			if done(aoc['弹窗-赠送3元'],'弹窗-赠送3元')then
				done(aoc['弹窗-注册送金'],'弹窗-注册送金',true,1)
			elseif done(aoc['弹窗-赠送0.5元'],'弹窗-赠送0.5元',false,1)then
				return false
			end
		elseif done(aoc['弹窗-注册界面-x-注册'],'弹窗-注册界面-x-注册')then
			if 手机号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['弹窗-注册界面-手机号'],'弹窗-注册界面-手机号',true)then
						delay(1)
						input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
						input(phone)
						click(1219,103)		--点取消
						手机号 = false
						发送 = true
					end
				end
			elseif 发送 then
				if c_pic(aoc['弹窗-注册界面-已经发送'],'弹窗-注册界面-已经发送',false)then
					发送 = false
					短信 = true
				elseif c_pic(aoc['弹窗-注册界面-获取短信'],'弹窗-注册界面-获取短信',true)then
					up_my_self('发送短信')
				end
			elseif 短信 then
				if c_pic(aoc['弹窗-注册界面-密码'],'弹窗-注册界面-密码',true)then
					delay(1)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(gamePassword)
					click(1219,103)
					delay(1)
				else
					if getMessage(id,phone,token)then
						delay(3)
						if c_pic(aoc['弹窗-注册界面-输入验证码'],'弹窗-注册界面-输入验证码',true)then
							delay(2)
							input(SMS)
							click(1219,103)
							短信 = false
						end
					else
						短信次数 = 短信次数 + 1
						if 短信次数 > 20 then
							toast('取短信失败',1)
							return false
						end
						delay(5)
					end
				end
			else
				if done(aoc['弹窗-注册界面-x-注册'],'弹窗-注册界面-x-注册',true,1)then
					注册 = true
					delay(3)
					up_my_self('注册成功')
				end
			end
		elseif done(aoc['弹窗-恭喜获得'],'弹窗-恭喜获得',true,1)then
			up_my_self('恭喜再得3元')
			return true
		else
			delay(1)
		end
		mSleep(500)
	end
	toast('超时轮回',1)
end





init('0',1)
id = 11035
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'
game_bid['火拼德州'] = 'www.shisvi.jqdz'
game_bid['左右棋牌'] = 'com.zyqp.xxb'




if xz(game_bid['左右棋牌'])then
	while (true) do
		if abl()then
			if get_idfa(game_bid['左右棋牌'])then
				if VPN()then
					if reg()then
					end
					closeApp(game_bid['左右棋牌'])
					delay(2)
				end
			end
		end
		close_VPN()
		delay(2)
	end
end



















