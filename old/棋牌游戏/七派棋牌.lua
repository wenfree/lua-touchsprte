require("tsp")
require("阿波罗")
require("玉米对接")
local sz = require("sz")




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
	up.fristname = '七派棋牌'
	up.map = text
	up.mail = idfa
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = gamePassword
	upFacebook(up)
end


aoc={}
aoc['弹窗-去绑定']={{793,631,0xf5ab41},{1114,214,0xfec778},{972,194,0x372131},}
aoc['弹窗-绑定帐号界面']={{746,59,0x3c315a},{746,54,0xf4e498},{1133,124,0xf6f1fc},{810,60,0x49466c},}
	aoc['弹窗-绑定帐号界面-请输入手机号']={ 0xa9a9a9, "12|-10|0xa7a7a8,16|9|0xa7a7a8,18|9|0x262346", 90, 618, 206, 743, 270}
	aoc['弹窗-绑定帐号界面-获取验证码']={ 0xffffff, "-5|0|0x8c4aac,-1|-13|0xffffff", 90, 600, 273, 734, 341}
		aoc['弹窗-绑定帐号界面-使用过']={ 0x2f2e3a, "0|-2|0xffffff,0|-4|0x191826", 90, 867, 386, 906, 429}
		aoc['弹窗-绑定帐号界面-成功获取']={ 0x8d99db, "-4|-5|0x372a5d,-4|-10|0x8b96d8", 90, 889, 282, 985, 333}
	aoc['弹窗-绑定帐号界面-请输入验证码']={ 0xa4a4a5, "0|-2|0x262446,0|-6|0xa2a2a4", 90, 714, 358, 802, 399}
	aoc['弹窗-绑定帐号界面-输入密码']={ 0xa2a2a3, "0|-3|0x262446,-1|-15|0x2c294a,0|-18|0xa9a9a9", 90, 689, 438, 824, 553}
	aoc['弹窗-绑定帐号界面-确定-取消-x']={{914,668,0xb447c9},{413,645,0x6b76cf},{1132,124,0xf6f1fc},}

aoc['游戏主界面-绑定']={{1152,48,0xc9130e},{687,38,0x3a0e03},{682,33,0xffe68a},}
	aoc['游戏主界面-已注册']={{724,43,0xe5993c},{687,44,0x3a0e03},{681,37,0xf4be58},}
aoc['游戏主界面-后退-斗地主-快速开始']={{43,23,0xf6d02f},{1185,59,0xfffee8},{670,581,0x6571cf},}
aoc['游戏大厅-菜单']={{55,29,0xf0e5fb},{55,37,0xb020af},{56,54,0xeddbf7},}
	aoc['游戏大厅-开始']={ 0xffffff, "-6|-7|0x4ba927,0|-1|0xffffff", 90, 783, 420, 957, 474}
aoc['角色信息']={{642,59,0x423e62},{652,53,0xf5e59a},{1138,124,0xf6f1fc},{811,60,0x49456c},}



function reg()
	计时 = os.time()
	Time = 60*10
	
	手机号 = true
	发送 = false
	短信 = false
	gamePassword = myRand(4,math.random(9,11))
	注册 = false
	打一局 = false
	短信次数 = 0
	
	while (os.time()-计时<Time) do
		if active(game_bid['火拼德州'],10)then
		elseif done(aoc['角色信息'],'角色信息')then
			delay(2)
			current_time = os.date("%Y-%m-%d", os.time())
			snapshot(current_time..'-'..os.time().."-七派棋牌.png", 0, 0, 1334, 750); --以时间戳命名进行截图
			toast('保存帐号',1)
			return true
		elseif done(aoc['游戏大厅-菜单'],'游戏大厅-菜单')then
			if c_pic(aoc['游戏大厅-开始'],'游戏大厅-开始',true)then
			end
		elseif 打一局 and done(aoc['游戏主界面-后退-斗地主-快速开始'],'游戏主界面-后退-斗地主-快速开始')then
			click(122,44)
		elseif done(aoc['游戏主界面-后退-斗地主-快速开始'],'游戏主界面-后退-斗地主-快速开始',true,3)then
			打一局 = true
		elseif done(aoc['游戏主界面-已注册'],'游戏主界面-已注册')then
--		elseif 注册 and done(aoc['游戏主界面-绑定'],'游戏主界面-绑定')then
			click(841,258)
		elseif done(aoc['游戏主界面-绑定'],'游戏主界面-绑定',true,1)then
		elseif done(aoc['弹窗-去绑定'],'弹窗-去绑定',true,1)then
		elseif done(aoc['弹窗-绑定帐号界面'],'弹窗-绑定帐号界面')then
			if 手机号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['弹窗-绑定帐号界面-请输入手机号'],'弹窗-绑定帐号界面-请输入手机号',true)then
						delay(1)
						input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
						input(phone)
						click(1261,714)
						手机号 = false
						发送 = true
					end
				end
			elseif 发送 then
				if c_pic(aoc['弹窗-绑定帐号界面-成功获取'],'弹窗-绑定帐号界面-成功获取',false)then
					发送 = false
					短信 = true
				elseif c_pic(aoc['弹窗-绑定帐号界面-获取验证码'],'弹窗-绑定帐号界面-获取验证码',true)then
					if c_pic(aoc['弹窗-绑定帐号界面-使用过'],'弹窗-绑定帐号界面-使用过',false)then
						return false
					else
						up_my_self('发送短信')
					end
				end
			elseif 短信 then
				if c_pic(aoc['弹窗-绑定帐号界面-输入密码'],'弹窗-绑定帐号界面-输入密码',true)then
					delay(1)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(gamePassword)
					click(1261,714)
					delay(1)
				else
					if getMessage(id,phone,token)then
						delay(3)
						if c_pic(aoc['弹窗-绑定帐号界面-请输入验证码'],'弹窗-绑定帐号界面-请输入验证码',true)then
							delay(2)
							click(727,381)
							input(SMS)
							click(1261,714)
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
				if done(aoc['弹窗-绑定帐号界面-确定-取消-x'],'绑定帐号界面-确定',true,1)then
					注册 = true
					delay(3)
					up_my_self('注册成功')
				end
			end
		else
			delay(1)
		end
		mSleep(500)
	end
	toast('超时轮回',1)
end





init('0',1)
id = 10929
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'
game_bid['火拼德州'] = 'www.shisvi.jqdz'


work = 0


if xz(game_bid['火拼德州'])then
	while (true) do
		if abl()then
			if get_idfa(game_bid['火拼德州'])then
				if true or VPN()then

					if reg()then
						work = work + 1
						if work >= 15 then
							dialog('完成', 0)
							return true
						end
					end
					closeApp(game_bid['趣玩百佬汇'])
					delay(2)
				end
			end
		end
		close_VPN()
	end
end



















