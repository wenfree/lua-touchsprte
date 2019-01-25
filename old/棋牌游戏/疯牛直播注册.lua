require("TSLib")
require("tsp")
require("阿波罗")
require("ALZ")
local sz = require("sz")


function GetName()
	get_task_url = 'http://onlyonelife.online/Public/aso/?service=Aso.get_name'
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local json = sz.json
		NameTable = json.decode(res)
		return NameTable.data
	end
end

function img_url()
	local imgurl = 'http://image.baidu.com/channel/listjson?pn='..math.random(1,29999)..'&rn=1&tag1=%E7%BE%8E%E5%A5%B3'
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(get_task_url);
	nLog(res)
	if code == 200 then
		local json = sz.json
		imgtable = json.decode(res)
		return imgtable.data[1]['image_url']
	end
end


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
	up.fristname = '疯牛直播'
	up.map = text
	up.mail = phone
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = password
	upFacebook(up)
end

open_ok={{704,73,0x007aff},{704,83,0x007aff},{704,95,0x007aff},}

function open()
	local url = 'http://api.xingchen.im/ads/adsCount?adsChannel=474060096b354d729763642df316f41b'
	openURL(url)
	计时 = os.time()
	Time = 60*0.5
	while (os.time()-计时<Time) do
		if done(open_ok,'open_ok')then
			delay(30)
			return true
		end
		mSleep(1000*2)
	end
end



fl={}
fl['首页']={{674,1285,0xcdcdcd},{74,1272,0xff5038},{65,96,0xfe4501},}
fl['我的']={{675,1287,0xff5038},{39,506,0x4285f4},}	--(338,156)
fl['登录/注册']={{439,71,0xffffff},{437,71,0x000000},{33,83,0x2c2c2c},}
	fl['微信/qq']={{473,1144,0x2eaff0},{289,1162,0x60bb00},}	--(557,173)
	fl['注册界面']={{538,217,0xfe4502},{713,217,0xfe4502},}
		fl.发送={ 0xfe4502, "0|-14|0xfe4502", 90, 545, 231, 731, 312}
		fl.注册={ 0xffffff, "0|-6|0xfe4502", 90, 291, 779, 455, 848}
fl['注册成功']={{280,1282,0x2c2c2c},{261,147,0xff4f2e},}


function reg()
	计时 = os.time()
	Time = 60*3
	id = 10952
	
	手机号 = true
	发送 = false
	发送过 = false
	短信 = false
	其它 = false
	登录 = false

	取短信次数 = 0
	password = myRand(4,math.random(6,10))
	
	while (os.time()-计时<Time) do
		if active(game_bid['疯牛直播'],5)then
		elseif done(fl['首页'],'首页',true,1)then
		elseif done(fl['我的'],'我的')then
			click(338,156)
		elseif done(fl['登录/注册'],'登录/注册')then
			if done(fl['微信/qq'],'微信/qq')then
				click(557,173)
			elseif done(fl['注册界面'],'注册界面')then
				if 手机号 then
					if GET_Phone(id,token)then
						click(216,268)
						input(phone)
						手机号 = false
						发送 = true
						click(83,717)	--点完成
					end
				elseif 发送 then
					if c_pic(fl.发送,'fl.发送',true)then
						发送过 = true
					elseif 发送过 then
						发送 = false
						其它 = true
					end
				elseif 其它 then
					click(212,446) --昵称
					input(GetName())
					click(204,535)
					input(password)
					click(229,616)
					input('159717')
					click(83,717)	--点完成
					其它 = false
					短信 = true
				elseif 短信 then
					if getMessage(id,phone,token)then
						click(206,359)
						input(dxyzm)
						click(83,717)	--点完成
						短信 = false
						登录 = true
					else
						取短信次数 = 取短信次数 + 1
						if 取短信次数 > 20 then
							return false
						end
						delay(2)
					end
				elseif 登录 then
					if c_pic(fl.注册,'注册',true)then
						up_my_self('提交注册')
						delay(5)
					end
				end
			end
		elseif done(fl['注册成功'],'注册成功',true,1)then
			return true
		else
			moveTo(500,300,100,300,50)
			delay(2)
		end
	end
	toast('超时轮回',1)
end





init('0',0)
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'
game_bid['火拼德州'] = 'www.shisvi.jqdz'
game_bid['左右棋牌'] = 'com.zyqp.xxb'
game_bid['溜溜'] = 'com.starlink.liuliu'
game_bid['疯牛直播']='com.51qiniu.pay'

token = '668d1e2a-e0eb-4716-9d75-6aadacf51337'



if xz(game_bid['疯牛直播'])then
	while (true) do
		if abl()then
			if VPN()then

					if reg()then
						
					end
					
					closeApp(game_bid['疯牛直播'])
					delay(1)

			end
		end
		close_VPN()
		delay(2)
	end
end