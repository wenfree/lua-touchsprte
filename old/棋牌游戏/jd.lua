require("TSLib")
require("tsp")
require("AWZ")
require("阿波罗")

local sz=require("sz")


urlPhone = 'https://pro.m.jd.com/mall/active/BoyBMGzBgb7rGVVfxUYiebEthQF/index.html'
urlPc = 'https://sale.jd.com/act/NKu27s5a8B4.html'
openURL(urlPhone)
lua_exit()


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
	up.fristname = '京东'
	up.map = text
	up.mail = myRand(5,math.random(9,15))
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = ip()
	upFacebook(up)
end

page={ 0x0079fe, "6|0|0x0079fe", 90, 216, 611, 395, 694}
打开={ 0x007aff, "-279|1|0x007aff", 90, 171, 695, 557, 762}
成功打开={ 0x343331, "-194|3|0xf3e0b0,-372|-1|0x343331,-561|-6|0x542919", 90, 17, 1237, 733, 1324}


function jd()
	timeline = os.time()
	outtime = math.random(35,40)
	openURL(urlPhone)
	delay(3)
	upload = true
	while (os.time()-timeline < outtime) do
		
		if c_pic(成功打开,'成功打开',false)then
			moveTo(314,835,314,393)
			delay(1)
			click(w/2,h/2)
			if upload then
				up_my_self('点击一次')
			end
		end
		c_pic(打开,'打开',true)
		mSleep(1000)
		
	end
end


while (true) do
	if awzNew()then
		if  VPN() then
			jd()
		end
	end
	VPNX()
end


























