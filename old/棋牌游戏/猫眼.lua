local sz = require("sz")
require("玉米对接")
require("AWZ")
require("yzm")
require("tsp")
id = 9176
log('id='..id)

PhoneKey={
	{132,947,0x000000},{373,945,0x040404},{634,941,0x000000},
	{133,1059,0x000000},{364,1048,0x000000},{619,1051,0x000000},
	{129,1159,0x000000},{374,1157,0x000000},{630,1160,0x000000},
	[0]={377,1281,0xffffff},}

function input_phone(txt)
	for i =1,string.len(txt) do
		nLog(string.sub(txt,i,i))
		phone_mun_input = tonumber(string.sub(txt,i,i))
		click(PhoneKey[phone_mun_input][1],PhoneKey[phone_mun_input][2],1)
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
	up.fristname = '猫眼电影'
	up.map = text
	up.mail = phone
	up.phone = phone
	up.phonename = sz.system.mgcopyanswer("UserAssignedDeviceName")
	up.password = SMS
	upFacebook(up)
end


aoc={}
aoc['猫眼选择城市']={{47,84,0xffffff},{47,71,0xf34d41},{59,84,0xf34d41},{414,81,0xffffff},}

aoc['猫眼-城市']={129,533,0xffffff}
city_x = 230
city_h = 98

aoc['猫眼-首页-我的']={{675,1287,0x696969},{233,1275,0x696969},{94,1272,0xf03d37},}	--1我的
aoc['猫眼-首页-我的界面-立即登录']={ 0xff6036, "184|-14|0x3bccc5,370|-9|0xffb500,551|-12|0x27b5ff", 90, 22, 261, 726, 372}
	aoc['猫眼-首页-我的界面-青铜会员']={ 0xffffff, "0|-10|0xdd403b,0|-13|0xeea09d,0|25|0xee9f9d", 90, 168, 142, 352, 200}
aoc['弹窗-同意']={{504,1040,0xf34d41},{230,1040,0x999999},{545,62,0x661c1a},}


aoc['登录界面']={{398,74,0xffffff},{398,73,0xdf504c},{400,73,0xffffff},{44,82,0xffffff},}
	aoc['手机号登录']={{330,641,0x999999},{115,408,0x51c332},{279,417,0xffffff},{602,412,0x51c332},}
	aoc['请输入手机号']={ 0xf34d41, "-2|4|0xffffff,-2|10|0xf34d41,-19|4|0xf34d41", 90, 574, 270, 679, 321}
	aoc['登录界面-下一步']={ 0xffffff, "0|-4|0xf34d41", 90, 295, 506, 441, 580}
	aoc['登录界面-使用短信登录']={ 0xf34d41, "0|-13|0xf34d41,504|5|0xf35a4f", 90, 65, 575, 690, 643}
	aoc['登录界面-输入验证码']={{95,410,0xcbcbcb},{654,418,0xcbcbcb},{653,418,0xffffff},{620,518,0xf34d41},}
aoc['右滑动']={{137,548,0xf2f2f2},{615,545,0xb8b8b8},{619,92,0x661c1a},{144,76,0x661c1a},}

滑动位置={{170,705,0x6cbd03},{625,705,0xf2f2f2},}
aoc['验证码界面']={{165,705,0xffffff},{175,705,0x6cbd03},{549,710,0xd5d5d5},{567,711,0xffffff},}
aoc['验证码识别界面']={{616,500,0xb8b8b8},{400,818,0xf34d41},{400,810,0xf34d41},}

aoc['搜索界面']={{682,73,0xf03d37},{682,75,0xfafafa},{682,79,0xf03d37},}
	aoc['想看按钮']={ 0xfaaf00, "-2|-29|0xffffff,-1|-40|0xfaaf00", 90, 562, 215, 742, 466}
	aoc['已想看按钮']={ 0x666666, "0|-7|0xffffff,0|-11|0x666666,0|-19|0x6c6c6c", 90, 562, 215, 742, 466}
	
aoc['知道了']={ 0x007aff, "0|-9|0x007aff", 90, 295, 724, 433, 783}
	
	
function reg()
	local timeLine = os.time()
	local timeUsed = 60*3
	local 取号 = true
	local 短信 = false
	local 提交 = false
	local 识别 = true
	
	nLog('---注册流程---')
	while (os.time() - timeLine < timeUsed ) do
		if active(app_bid['猫眼'],5)then
			
		elseif done(aoc['登录界面-输入验证码'],'登录界面-输入验证码')then
			if 短信 then
				if getMessage(id,phone,token)then
					delay(2)
					input_phone(SMS)
					up_my_self('验证码:'..SMS)
					mSleep(2*1000)
					短信 = false
				else
					nLog('取短信失败')
					delay(2)
				end
			end
		elseif done(aoc['验证码识别界面'],'验证码识别界面')then
			if 识别 then
				delay(2)
				imgfile = lzScreen(296,596,455,676,1)
				delay(1)
				
				if lz_yzm()then
					click(168,726)
					input(apple_yzm)
					click(568,184)
					click(375,822)
				end
				delay(5)
				识别 = false
			end
		
		elseif done(aoc['验证码界面'],'验证码界面')then
			moveTo(滑动位置[1][1],滑动位置[1][2],滑动位置[1][2],滑动位置[1][2],5)
			delay(2)
		elseif done(aoc['手机号登录'],'手机号登录',true,1)then
		elseif done(aoc['登录界面'],'登录界面')then	
			
			if c_pic(aoc['请输入手机号'],'请输入手机号')then
				if 取号 then
					if GET_Phone(id,token)then
						input(phone)
						取号 = false
						短信 = true
						delay(1)
					end
				end
				if c_pic(aoc['登录界面-下一步'],'登录界面-下一步',true)then
					up_my_self('提交注册')
				end
			elseif c_pic(aoc['登录界面-使用短信登录'],'登录界面-使用短信登录',true)then
			end
		
		elseif done(aoc['弹窗-同意'],'弹窗-同意',true)then
		elseif c_pic(aoc['猫眼-首页-我的界面-立即登录'],'猫眼-首页-我的界面-立即登录')then
			if c_pic(aoc['猫眼-首页-我的界面-青铜会员'],'猫眼-首页-我的界面-青铜会员')then
				return true
			else
				click(243,143)
			end
			
		elseif done(aoc['猫眼-首页-我的'],'猫眼-首页-我的',true,1)then
		elseif done(aoc['猫眼选择城市'],'猫眼选择城市')then
			click(aoc['猫眼-城市'][1]+city_x*math.random(0,2),aoc['猫眼-城市'][2]+city_x*math.random(0,3),5)
			
		else
			c_pic(aoc['知道了'],'知道了',true)
			log('---')
		end
		mSleep(1000)
	end
	toast('注册超时',1)
end
	
	

	
	
function vote(voteTable)
	local timeLine = os.time()
	local timeUsed = 60*3
	local nameTimes = 1
	
	
	while (os.time()-timeLine < timeUsed ) do
		if active(app_bid['猫眼'],5)then
		elseif done(aoc['搜索界面'],'搜索界面')then
			input('\b\b\b\b\b\b\b\b\b\b')
			input(voteTable[nameTimes])
			delay(5)
			if c_pic(aoc['想看按钮'],'想看按钮',true)then
				
			elseif c_pic(aoc['已想看按钮'],'已想看按钮',false)then
				nameTimes = nameTimes + 1
				if nameTimes > #voteTable then
					return true
				end
			end
			
		elseif done(aoc['猫眼-首页-我的'],'猫眼-首页-我的')then
			click(203,83,2)
		elseif c_pic(aoc['猫眼-首页-我的界面-立即登录'],'猫眼-首页-我的界面-立即登录',false)then
			if c_pic(aoc['猫眼-首页-我的界面-青铜会员'],'猫眼-首页-我的界面-青铜会员',false)then
				click(74,1279)
			end
		end
	end
	toast('投票超时',1)
end



app_bid= {}
app_bid.猫眼 = 'com.meituan.imovie'

voteTable={
	'欧洲攻略',
	'生存家族',
	'怪癖英雄',
	}


while (true) do
	if VPN() then

		if awzNew() then
			if reg()then
				reName(phone)
				if vote(voteTable)then
					up_my_self('投票成功')
				end
			end
		end
		VPNX()
		mSleep(2*1000)
		
	end
end
































