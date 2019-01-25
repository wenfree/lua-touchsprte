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
		return NameTable.data[1]['image_url']
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
	up.fristname = '溜溜ll'
	up.map = text
	up.mail = phone
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = phone
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




ll={}
ll['头像']={{374,295,0x3897f0},{377,293,0xfafafa},{377,294,0x3897f0},}
ll['相机胶卷界面']={{363,72,0x424242},{363,70,0xffffff},}
ll['选图完成界面']={{698,1287,0x53b311},{63,56,0xffffff},{103,1290,0x181818},}
	ll['昵称']={ 0xdadada, "-4|-7|0xdadada,2|-7|0xdadada", 90, 288, 483, 300, 519}
		ll['昵称-完成']={ 0x000000, "0|-2|0xf7f7f7,0|-5|0x000000,0|19|0x000000", 90, 630, 736, 746, 898}
	ll['男-女']={{161,603,0xfafafa},{333,603,0xfafafa},}
	ll['生日']={ 0xcccdce, "-10|0|0xfafafa,-8|-9|0xcccdce", 90, 696, 682, 729, 727}
ll['弹窗确定']={{392,724,0x007aff},{455,4,0x969696},{493,2,0x969696},}
ll['下一步']={ 0xffffff, "0|3|0x46a4f6", 90, 310, 867, 450, 943}
ll['开启之旅']={{660,1268,0x3285ed},{36,83,0x333333},{40,83,0xfafafa},}
--99,340
ll['注册完成']={{718,69,0xffffff},{718,84,0xffffff},{377,1283,0x59b3fc},{624,1276,0xbcc2d3},}


function full()
	计时 = os.time()
	Time = 60*2
	下载 = true
	生日 = false
	昵称 = true
	提交 = false
	
	while (os.time()-计时<Time) do
		if active(game_bid['溜溜'],5)then
			
		elseif done(ll['溜溜-填资料界面'],'填资料界面')then
			if 下载 then
				pic_mun = math.random(1,1999)
				--downFile("http://onlyonelife.online/img/china_woman/"..pic_mun..".jpg", '/var/header.jpg')
				downFile(img_url(), '/var/header.jpg')
				delay(1)
				clearAllPhotos()
				saveImageToAlbum("/var/header.jpg");
				delay(3)
				下载 = false
			end	
			if done(ll['头像'],'头像',true,1)then
				click(351,1163)	--点相册
			elseif 昵称 and c_pic(ll['昵称'],'昵称',true)then
				nikename = GetName()
				input('\b\b\b\b\b\b\b\b\b\b\b')
				input(nikename)
				delay(2)
				c_pic(ll['昵称-完成'],'昵称-完成',true)
				click(ll['男-女'][math.random(1,2)][1],ll['男-女'][math.random(1,2)][2])
				生日 = true
				昵称 = false
			elseif 生日 and c_pic(ll['生日'],'生日',true)then
				delay(2)
				for i=1,math.random(2,5)do
					click(162,1031)
				end
				for i=1,math.random(2,8)do
					click(375,1200)
				end
				for i=1,math.random(2,8)do
					click(563,1209)
				end
				delay(3)
				click(665,879)
				生日 = false
				提交 = true
			elseif 提交 and c_pic(ll['下一步'],'下一步',true)then
				delay(3)
			end
			
		elseif done(ll['相机胶卷界面'],'相机胶卷界面')then
			click(102,225)		--第一张
		elseif done(ll['选图完成界面'],'选图完成界面',true,1)then
		elseif done(ll['开启之旅'],'开启之旅')then
			click(99+math.random(0,3)*180,340+math.random(0,2)*180)
			if done(ll['开启之旅'],'开启之旅',true,1)then
				up_my_self('提交注册')
			end
		elseif done(ll['注册完成'],'注册完成')then
			delay(2)
			moveTo(w/2,h-200,w/2,h-500,10)
			moveTo(w/2,h-200,w/2,h-500,10)
			moveTo(w/2,h-200,w/2,h-500,10)
			moveTo(w/2,h-200,w/2,h-500,10)
			click(w/2,300)
			delay(5)
			return true
		else
			if done(ll['弹窗确定'],'弹窗确定',true,1)then
				delay(1)
			end
		end
	end
	toast('超时轮回',1)
end






ll['溜溜-请选择游戏2']={{446,79,0xffffff},{302,83,0xfefeff},}
ll['溜溜-请选择游戏']={{342,367,0xfef24e},{315,530,0x3a94e3},{303,846,0xe37c52},{288,1117,0x5e948a},}
ll['溜溜-首页-帐号']={{625,1294,0xbcc2d3},{374,1284,0x5ab2fc},{123,1284,0xbcc2d3},{375,1303,0xfafafa},}
ll['溜溜-注册界面']={{505,1208,0x409fff},{304,1197,0x26e0a0},{472,1214,0xfafafa},}
	--(344,578)
	ll['溜溜-注册界面-获取']={ 0x3897f0, "-2|0|0xffffff,-5|-4|0x3897f0", 90, 541, 671, 695, 729}
	ll['溜溜-注册界面-登录']={ 0x46a4f6, "10|-2|0x46a4f6,10|-5|0xffffff", 90, 300, 822, 455, 907}
	--(212,680)
ll['溜溜-填资料界面']={{699,162,0xff8200},{737,195,0x4aabf8},{67,1267,0x49aaf7},{153,1283,0xff8a00},}



function reg()
	计时 = os.time()
	Time = 60*3
	
	手机号 = true
	发送 = false
	发送过 = false
	短信 = false
	登录 = false

	取短信次数 = 0
	
	while (os.time()-计时<Time) do
		if active(game_bid['溜溜'],5)then
		elseif done(ll['溜溜-注册界面'],'溜溜-注册界面')then
			if 手机号 then
				if GET_Phone(id,token)then
					click(344,578)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(phone)
					手机号 = false
					发送 = true
					click(678,859)	--点完成
				end
			end
			
			if 发送 then
				if c_pic(ll['溜溜-注册界面-获取'],'溜溜-注册界面-获取',true)then
					发送过 = true
				elseif 发送过 then
					发送 = false
					短信 = true
				end
			end
				
			if 短信 then
				if getMessage(id,phone,token)then
					click(212,680)
					input(dxyzm)
					click(678,859)	--点完成
					短信 = false
					登录 = true
				else
					取短信次数 = 取短信次数 + 1
					if 取短信次数 > 20 then
						return false
					end
					delay(2)
				end
			end
			
			if 登录 and c_pic(ll['溜溜-注册界面-登录'],'溜溜-注册界面-登录',true)then
				delay(3)
			end
			
		
		elseif done(ll['溜溜-首页-帐号'],'溜溜-首页-帐号',true,1)then
		elseif done(ll['溜溜-请选择游戏'],'溜溜-请选择游戏',true,1)then
		elseif done(ll['溜溜-填资料界面'],'填资料界面')then
			up_my_self('提交资料')
			return true
		else
			if done(ll['溜溜-请选择游戏2'],'溜溜-请选择游戏2')then
				click(319,261)
			end
		end
	end
	toast('超时轮回',1)
end





init('0',0)
id = 10285
game_bid={}
game_bid['趣玩百佬汇'] = 'com.PZMWPY7X22.qwblh'
game_bid['火拼德州'] = 'www.shisvi.jqdz'
game_bid['左右棋牌'] = 'com.zyqp.xxb'
game_bid['溜溜'] = 'com.starlink.liuliu'
token = '668d1e2a-e0eb-4716-9d75-6aadacf51337'



if xz(game_bid['溜溜'])then
	while (true) do
		if abl()then
			if VPN()then
				if open() then
					if reg()then
						full()
					end
					closeApp(game_bid['溜溜'])
					delay(2)
				end
			end
		end
		close_VPN()
		delay(2)
	end
end
