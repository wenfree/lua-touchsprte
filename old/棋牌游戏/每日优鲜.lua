id = 5251			---每日优鲜id
require("tsp")
require("玉米对接")

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
	up.fristname = '每日优鲜'
	up.map = text
	up.mail = 'idfa'
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = 'Aa112211'
	upFacebook(up)
end

aoc={}

aoc['web-潢59减30元']={ 0xff4891, "-325|-508|0xe89722,-6|-507|0xe89722,-354|-19|0xff4891", 90, 11, 145, 716, 1190}
	aoc['web-请输入手机号']={ 0xa9a9a9, "-4|12|0xa9a9a9,-4|0|0xf5f5f5,-4|-9|0xafafaf", 90, 61, 646, 321, 722}
	aoc['web-现在领取']={ 0xffffff, "-6|-37|0xff4891,-234|34|0xff4891", 90, 22, 384, 714, 772}
		aoc['web-已经领取和领取成功']={ 0xff4891, "-63|-23|0xff4891,-162|-159|0xe31c19,63|-349|0xfbf9f8", 90, 92, 384, 652, 991}
	

aoc['弹窗-新人专享优惠']={{98,108,0xfdfdfb},{223,857,0xfa0a8d},{283,645,0xfa28aa},{358,468,0xffffff},}
aoc['首页激活']={{93,1270,0xff65ae},{283,1280,0xa1a1a1},{469,1287,0xffffff},{656,1266,0xa2a2a2},}
	aoc['首页-全场满59立减30']={ 0xf11775, "6|-3|0xffe2de,7|-11|0xeb1b78", 90, 152, 1145, 530, 1232}
aoc['登录界面']={{388,82,0x262626},{388,80,0xfefefe},{388,77,0x262626},{23,82,0x262626},}
	aoc['登录界面-手机号']={ 0x969696, "2|-8|0xffffff,5|-17|0x969696,-5|-24|0x969696", 90, 151, 222, 340, 309}
	aoc['登录界面-获取验证码']={ 0xff4891, "-1|-12|0xffffff,3|-14|0xff4891", 90, 524, 211, 707, 317}
	aoc['登录界面-成功获取']={ 0x9b9b9b, "-2|2|0xfefefe,-5|-25|0x979797,4|34|0x979797", 90, 544, 210, 712, 318}
	aoc['登录界面-输入验证码']={ 0x969696, "-6|11|0xffffff,-11|14|0x969696,-11|-11|0x969696", 90, 92, 326, 279, 413}
	aoc['登录界面-登录按钮']={ 0xfff3f8, "-2|-3|0xff4891,-2|-6|0xffffff,-3|-10|0xff4891", 90, 250, 491, 484, 644}


function reg()
	local 计时 = os.time()
	local Time = 60*10
	
	手机号 = true
	发送 = false
	短信 = false
	注册 = false
	打一局 = false
	短信次数 = 0
	mryx = 'cn.missfresh.application'
	
	while (os.time()-计时< Time) do
		if active(mryx,5)then
		elseif done(aoc['首页激活'],'首页激活',false,1)then
			c_pic(aoc['首页-全场满59立减30'],'首页-全场满59立减30',true)
		elseif done(aoc['登录界面'],'登录界面')then
			if 手机号 then
				if c_pic(aoc['登录界面-手机号'],'登录界面-手机号',true)then
					input(phone)
					手机号 = false
					发送 = true
				end
			end
			if 发送 then
				if c_pic(aoc['登录界面-获取验证码'],'登录界面-获取验证码',true)then
				elseif c_pic(aoc['登录界面-成功获取'],'登录界面-成功获取',false)then
					发送 = false
					短信 = true
				end
			end
			if 短信 then
				if getMessage(id,phone,token)then
					if c_pic(aoc['登录界面-输入验证码'],'登录界面-输入验证码',true)then
						input(SMS)
						短信 = false
						注册 = true
					end
				end
			end
			if 注册 then
				if c_pic(aoc['登录界面-登录按钮'],'登录界面-登录按钮',true)then
					up_my_self('提交注册')
				end
			end
			
		elseif done(aoc['弹窗-新人专享优惠'],'弹窗-新人专享优惠',true,1)then
		end
		mSleep(1000)
	end
	toast('登录超时',1)
end


function getJ()
	getTime = os.time()
	getUesd = 60*2
	url = 'https://as-vip.missfresh.cn/ug/landing-page.html?fromSource=yc2'
	openURL(url)
	取号 = true
	领取 = false
	sarfar = 'com.apple.mobilesafari'
	
	while (os.time()-getTime < getUesd) do
		if c_pic(aoc['web-潢59减30元'],'web-潢59减30元',false)then
			if 取号 then
				if GET_Phone(id,token)then
					if c_pic(aoc['web-请输入手机号'],'web-请输入手机号',true)then
						input(phone)
					end
					取号 = true
					领取 = true
				end
			end
			
			if 领取 then
				c_pic(aoc['web-现在领取'],'web-现在领取',true)
			end
			
		elseif c_pic(aoc['web-已经领取和领取成功'],'web-已经领取和领取成功',true)then
			delay(2)
			closeX(sarfar)
			return true
		end
		mSleep(1000)
	end
	toast('领卷超时',1)
end

 --getJ()
 
----- 纬度	31.2885266762,		经度 121.2039184570
----- 纬度	31.1340768902,		经度 121.5781402588
  
function Fgps(w,j)
	local tab = {}
	tab["cn.missfresh.application"] = { lat=w,lon=j} --lat 纬度，lon 经度
	fakeGPS(tab)
	return true
end 
 
function wd()
	local min = 31.1340768902
	local max = 31.2885266762
	local newwd = min + math.random(1,1800000000)/10000000000
	if newwd > max then
		return max
	elseif newwd < min then
		return min
	else
		return newwd
	end
end
 
function jd()
	local min = 121.2039184570
	local max = 121.5781402588
	local newjd = min + math.random(1,1800000000)/10000000000
	if newjd > max then
		return max
	elseif newjd < min then
		return min
	else
		return newjd
	end
end
 


if getJ()then

	if Fgps(wd(),jd())then
		reg()
	end
	
end




























 
 
 
 