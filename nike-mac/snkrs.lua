require("TSLib")
require("tsp")
require("AWZ")
require("nameStr")
require("alz")
--require("UI")

local sz = require("sz")
local json = sz.json
--local ts = require("ts")


sys = {
	clear_bid = (function(bid)
		closeApp(bid)
		delay(1)
		os.execute("rm -rf "..(appDataPath(bid)).."/Documents/*") --Documents
		os.execute("rm -rf "..(appDataPath(bid)).."/Library/*") --Library
		os.execute("rm -rf "..(appDataPath(bid)).."/tmp/*") --tmp
		clearPasteboard()
		--[[
		local path = _G.const.cur_resDir
		os.execute(
			table.concat(
				{
					string.format("mkdir -p %s/keychain", path),
					'killall -SIGSTOP SpringBoard',
					"cp -f -r /private/var/Keychains/keychain-2.db " .. path .. "/keychain/keychain-2.db",
					"cp -f -r /private/var/Keychains/keychain-2.db-shm " .. path .. "/keychain/keychain-2.db-shm",
					"cp -f -r /private/var/Keychains/keychain-2.db-wal " .. path .. "/keychain/keychain-2.db-wal",
					'killall -SIGCONT SpringBoard',
				},
				'\n'
			)
		)
		
		]]
		clearAllKeyChains()
		clearIDFAV() 
		--clearCookies()
	end)
}




var={}
var.bid='com.nike.onenikecommerce'
var.account={}
var.account.login = ''
var.account.pwd = ''
var.account.address_country = 'CN'
var.account.phone = ''
var.looktime = 5
var.wifitime = 30

file_name = '/var/mobile/Media/lua/back_account.txt'
function backWirteFile(file_name,string,way)
	way = way or 'a'   --w or a
	local f = assert(io.open(file_name, way))
	f:write(string)
	f:close()
end

function local_token()
	local appbid = 'com.nike.onenikecommerce'
	local localPath = appDataPath(appbid).."/Documents/ifkc.plist" --设置 plist 路径
	local toketext = readFileString(localPath)
	local toketext = string.gsub(toketext,'&','|')
	local toketext = string.gsub(toketext,'+','^')
	return toketext
end

function updateNike()
	local sz = require("sz")
	local url = 'http://zzaha.com/phalapi/public/'
	local Arr={}
	Arr.s = 'Nikesave.Save'
	Arr.address_mail = var.account.login
	Arr.address_pwd = var.account.pwd
	Arr.address_phone = var.account.phone
	Arr.address_xin = first_name_
	Arr.address_ming = last_names_
	Arr.address_sheng = '广东省'
	Arr.address_shi = '深圳市'
	Arr.address_qu = '罗湖区'
	Arr.address_area = var.account.address_area
	Arr.address_country = var.account.address_country
	Arr.iphone = getDeviceName()
	Arr.imei = sz.system.serialnumber()
	Arr.birthday = var.birthday
	Arr.moon = var.moon
	Arr.codes = var.codes
	log(Arr)
	if post(url,Arr)then
		return true
	end
end


--回传手机
function updatePhone()
	local sz = require("sz")
	local url = 'http://zzaha.com/phalapi/public/'
	local Arr={}
	Arr.s = 'Nikesave.Phone'
	Arr.imei = sz.system.serialnumber()
	Arr.name = getDeviceName()
	Arr.whos = 'whos'
	return post(url,Arr)
end
--updateLog
function updateNikeLog(workstate)
	local sz = require("sz")
	local url = 'http://zzaha.com/phalapi/public/'
	local Arr={}
	Arr.s = 'Nikesave.Save'
	Arr.address_mail = var.account.login
	Arr.workstate = workstate
	post(url,Arr)
end

function backId()
	local postUrl = 'http://zzaha.com/phalapi/public/'
	local postArr = {}
	postArr.s = 'Nikeback.Back'
	postArr.id = var.account.id
	log(post(postUrl,postArr))
end

function backphone()
	local sz = require("sz")
	local postUrl = 'http://zzaha.com/phalapi/public/'
	local postArr = {}
	postArr.s = 'Nikesave.phoneback'
	postArr.imei = sz.system.serialnumber()
	log(post(postUrl,postArr))
end

function disable()
	local postUrl = 'http://zzaha.com/phalapi/public/'
	local postArr = {}
	postArr.s = 'Nikeback.disable'
	postArr.id = var.account.id
	log(post(postUrl,postArr))
end


t={}
t['开屏登录']={ 0xffffff, "-375|2|0x111111,149|3|0x111111,-177|-1|0x111111,-536|-4|0xb8b8b8", 90, 16, 1066, 740, 1315 } --登录_加入
t['登录Nike+帐号']={ 0xffffff, "302|6|0x000000,-334|4|0x000000,-9|-38|0x000000,295|-705|0x363636", 90, 46, 24, 716, 860 } --登录_x
	t['登录Nike+帐号_使用电子邮件登录']={ 0x8d8d8d, "-13|-192|0x111111,-11|-194|0xefefef,1|-195|0x111111,2|-199|0xefefef", 
											90, 43, 240, 305, 533 } --多点找色
	t['登录Nike+帐号_电子邮件']={ 0x8d8d8d, "7|-13|0xffffff,9|-18|0x8d8d8d,98|4|0x8d8d8d,430|-9|0xffffff", 90, 72, 289, 660, 327}
	t['登录Nike+帐号_密码']={ 0x8d8d8d, "44|-22|0x8d8d8d", 90, 83, 385, 152, 449 } --多点找色
	----------------注册用-----------
	t['登录Nike+帐号_手机号码']={ 0xffffff, "-208|-17|0xa9a9a9,-300|-4|0xa9a9a9,-389|-2|0x111111", 90, 63, 425, 510, 493 } --多点找色
	t['登录Nike+帐号_输入验证码']={ 0xa9a9a9, "-121|17|0xa9a9a9", 90, 71, 539, 410, 598 } --多点找色
	t['登录Nike+帐号_发送验证码']={ 0xe5e5e5, "-65|2|0x111111,-1|-18|0xe5e5e5", 90, 536, 431, 687, 491 } --多点找色

	t['登录Nike+帐号_红框']={ 0xfe0000, "-635|3|0xfe0000,-604|-103|0x111111,-606|-102|0xededed,-599|-104|0x111111,-621|-68|0xe5e5e5", 90, 34, 395, 717, 656 } --
	t['登录Nike+帐号_继续']={ 0xffffff, "-14|-6|0x000000,-300|-16|0x000000,15|-48|0x000000,336|-5|0x000000,15|31|0x000000", 90, 14, 644, 735, 1177 } --多点找色

t['弹窗_输入的完成']={ 0x007aff, "-43|-20|0x007aff", 90, 646, 594, 742, 956 } --多点找色
t['弹窗_现在不用']={ 0x000000, "196|-56|0xaaaaaa,318|-4|0x000000,-56|-304|0xffffff,250|-243|0x000000", 90, 103, 480, 646, 856 } --多点找色

t['注册返回界面']={ 0xffffff, "9|-41|0x000000,-312|-5|0x000000,325|-9|0x000000,325|118|0x8d8d8d,-312|113|0x8d8d8d,-1|137|0x8d8d8d", 
		90, 25, 943, 729, 1321 } --注册
t['输入您的电子邮件']={ 0xffffff, "9|-40|0x000000,-307|-4|0x000000,327|-6|0x000000,4|37|0x000000,321|-490|0x363636", 
		90, 21, 25, 722, 690 } --多点找色
t['输入您的生日']={ 0xffffff, "9|-44|0x000000,-306|-8|0x000000,329|-10|0x000000,3|33|0x000000,-306|96|0x8d8d8d,330|96|0x8d8d8d", 
		90, 24, 531, 727, 810 } --多点找色
t['个人页面']={ 0x000000, "-188|5|0xb8b8b8,-375|-4|0xb8b8b8,-564|-3|0xb8b8b8,18|11|0xffffff", 90, 22, 1274, 728, 1306 } --多点找色
	t['个人页面_设置按钮']={ 0xffffff, "10|0|0xb8b8b8,-10|0|0xb8b8b8,-17|0|0xffffff", 90, 668, 55, 731, 108 } --多点找色
--	t['个人页面_鞋码选择']={ 0xffffff, "19|-588|0x000000,-15|-715|0xbcbcbc,23|-769|0xd8d8d8", 90, 15, 137, 737, 1174 } --多点找色
	t['个人页面_鞋码选择']={ 0xfdfdfd, "3|-3|0x000000,-51|16|0xffffff,-49|24|0x000000,-46|21|0xffffff", 90, 12, 934, 111, 1006} --多点找色
	t['个人页面_鞋码滑表']={ 0x000000, "3|161|0xffffff,-47|554|0x000000", 90, 639, 715, 742, 1319 } --多点找色
	t['个人页面_通知设置']={ 0x000000, "2|0|0xffffff,3|-53|0xc8c7cc,-3|48|0xc8c7cc,2|-98|0xf7f7f7,-8|88|0xf7f7f7", 90, 15, 190, 172, 761 } --多点找色
	t['个人页面_启动通知']={ 0xffffff, "-620|-59|0xf7f7f7,-623|153|0xf7f7f7,-626|582|0xf7f7f7,45|582|0xf7f7f7", 90, 19, 190, 717, 884 } --多点找色
	t['个人页面_通知开启']={ 0x4bd763, "-3|291|0x4cd864,-9|393|0x4cd964,-2|489|0x4cd864", 90, 567, 190, 739, 807 } --多点找色
	
	t['个人页面_未设头像']={ 0x000000, "0|7|0xffffff,0|17|0xe4e4e4,12|-98|0xbcbcbc,12|-111|0xd8d8d8", 90, 168, 155, 568, 450}
	
t['个人页面_照片']={0xc7c7cc, "-5|-1|0xffffff,-9|-11|0xc7c7cc,-62|-139|0x007aff,-358|-147|0x000000,-682|-132|0xf9f9f9",90,6,26,742,298} --多点找色
t['个人页面_时刻']={ 0x1b86fb, "-284|-11|0x000000,-318|7|0x000000,-636|-3|0x007aff", 90, 1, 33, 737, 117}
	
t['配送地址_新地址']={ 0x1a1a1a, "224|1082|0x000000,-337|1069|0xb8b8b8,-394|-47|0x1a1a1a", 90, 12, 53, 734, 1321}
t['配送地址_添加地址']={ 0x1a1a1a, "327|45|0x1a1a1a,-353|-50|0x1a1a1a,-30|0|0xffffff,-358|-943|0x000000", 90, 9, 42, 747, 1138}	
t['配送地址_添加成功']={ 0x000000, "10|219|0xffffff,12|212|0x000000,635|472|0x1a1a1a", 90, 13, 46, 734, 772}	
	
t['弹窗_出错了']={ 0xffffff, "3|4|0x000000,-299|48|0x000000,355|-39|0x000000,339|-311|0x363636", 90, 2, 63, 742, 495 } --多点找色	
t['弹窗_出错了_']={ 0x000000, "-238|-16|0xffffff,362|41|0x5c5c5c,360|-263|0x5c5c5c", 90, 95, 498, 743, 839 } --多点找色
t['弹窗_出错了__']={ 0x000000, "-232|-70|0xaaaaaa,200|-70|0xaaaaaa", 90, 100, 402, 654, 1069 } --多点找色

t['登录_出错了']={ 0x363636, "-5|-12|0xffffff,11|14|0x363636,8|230|0xfe0000", 90, 567, 33, 732, 556 } --多点找色
t['登录_出错了_国家/地区']={ 0x000000, "-12|0|0xffffff,-14|0|0x000000,-14|-13|0x000000,-14|13|0x000000,-14|14|0xebebeb,-121|-10|0xffffff,-124|-13|0x000000", 90, 285, 22, 467, 73 } --多点找色
t['登录_出错了_国家/地区_中国']={ 0xfcfcfc, "-2|-2|0x1d1d1d,7|-3|0xf6f6f6,8|-7|0x131313,8|64|0xc8c7cc,8|125|0x111111,38|132|0x111111,38|133|0xe8e8e8", 90, 33, 1121, 125, 1301 } --多点找色
t['登录_出错了_国家/地区_美国']={ 0x111111,"-69|476|0xffffff,-65|476|0x111111,578|489|0",90,9,505,735,1293 }

t['登录_出错了_语言']={ 0x1b1b1b, "8|-2|0xf6f6f6,-7|-235|0x000000,315|-234|0xffffff,318|-234|0x000000", 90, 6, 7, 510, 324 } --多点找色
t['登录_出错了_语言']={0,"-4|3|0xffffff,-4|6|0,-4|8|0xffffff,-4|11|0,-374|9|0",90,6,10,441,84}

t['全屏错误_购买未成功']={0xffffff, "-21|0|0x545454,21|0|0x545454,9|10|0xffffff,1|-17|0x545454",90,601,47,746,171} --多点找色

t['弹窗_选择照片']={ 0x007aff, "-87|-5|0x007aff,-128|-6|0x007aff,-124|-7|0xf9f9f9", 90, 233, 976, 491, 1051}
t['弹窗_照片确认选取']={  0xffffff, "-2|2|0x141414", 90, 680, 1253, 699, 1267}
t['弹窗_密码无效']={  0x000000, "40|6|0x000000,121|334|0x000000,121|336|0xffffff,123|338|0x000000,34|203|0x000000,35|203|0xffffff", 
								90, 110, 457, 641, 868}

t['我_付款信息_界面']={ 0x01aaef, "0|129|0x00c800,3|251|0x1a1a1a", 90, 94, 138, 198, 558}


function errors()
	if d('弹窗_选择照片',true)then
	elseif d('弹窗_照片确认选取',true)then
	elseif d('弹窗_出错了',true)then
	elseif d('错误_未中签',true)then
	elseif d('登录_出错了',true)then
	elseif d('全屏错误_购买未成功',true)then
	elseif d('弹窗_出错了',true)then
	elseif d('弹窗_出错了__',true)then
		click(29,80)
		moveTo(300,200,300,733,rd(5,20))
		delay(2)
		click(29,80)
	elseif d('登录_出错了_国家/地区')then
		updateNikeLog('修改地区')
		moveTo(300,800,300,800-rd(300,400),rd(20,30))	--上滑
		delay(rd(2,3))
		if d('登录_出错了_国家/地区_美国',true)then
		elseif d('登录_出错了_国家/地区_中国',true)then
		end
--	elseif d('登录_出错了_语言')then
--		click(636,274)
--		click(42,1174)
--		click(376,1269,2)
--		var.account.address_country = 'US'
--		updateNike()
	else
		return true
	end
end

local function mail_rand(length) --随机邮箱
	local char ='0123456789abcdefghijklmnopqrstuvwxyz'
	if length < 0 then
		return false;
	end
	local string = '';
	local rnd
	local s
	local mailheader={}
	mailheader[0] = '@shuaisports.com'
	mailheader[1] = '@ssnms.com'
	mailheader[2] = '@zzaha.com'
	mailheader[3] = '@vvccb.com'
	
	local mail_suffix = mailheader[math.random(#mailheader)]
	for var = 1,length do
		rnd = math.random(1,string.len(char))
		s = string.sub(char,rnd,rnd+1)
		string = string..s
	end
	return string..os.date("%S")..myRand(4,1,2)..mail_suffix;
end

function click_random(x,y,n)
	if n > 1 then
		for i=1,n do
			click(x,y,0.8)
		end
	else
		click(x,y,0.8)
	end
end

function reg()
	local timeline = os.time()
	local outTimes = 10*60
	local 取号 = true
	local 验证码 = false
	local sms = nil
	local 登录 = false
	local 填地址 = true
	local 付款信息 = true
	local error_times = 0
	var.account.address_country = "CN"
	
	firstUp = true
	local sendsms = 0
	
	var.account.login = mail_rand(rd(2,3))
	if UIvalues.password_key == '0' then
		var.account.pwd = myRand(3,1,1)..myRand(3,2,2)..myRand(3,2,2)..myRand(1,3)
		log(var.account.pwd)
--		lua_exit()
	else
		var.account.pwd = UIvalues.password
	end

	degree = 90
	t['登录Nike+帐号']={ 0x000000, "-185|94|0x111111,296|766|0x000000,218|90|0xffffff,213|85|0x111111", 90, 14, 14, 727, 1024}
	t['登录Nike+帐号_发送验证码']={ 0xe5e5e5, "13|-9|0xe5e5e5,4|-5|0x111111,19|-12|0x111111,-61|-28|0xe5e5e5", 90, 503, 323, 719, 724}
	t['输入您的电子邮件']={0x363636, "-124|92|0xf0f0f0,-123|91|0x111111,-124|108|0xffffff,-123|107|0x111111,-197|104|0xffffff,-198|102|0x111111",90,102,3,716,238} --多点找色
	t['输入您的电子邮件_保存']={0xffffff, "-3|-2|0x000000,-307|-33|0x000000,312|-33|0x000000,308|31|0x000000",90,25,487,719,716} --多点找色
	t['输入您的出生日期']={0x363636, "-119|89|0xffffff,-120|90|0x333333,-124|78|0x111111,-169|84|0xf6f6f6,-168|82|0x111111,-191|114|0xf8f8f8,-192|123|0x111111",90,148,24,725,246} --多点找色
	t['创建您的NIKE帐户_男子']={0x939393, "-1|-17|0x8d8d8d,-26|-49|0xe5e5e5,37|29|0xe5e5e5",90,47,724,373,1156} --多点找色
	t['创建您的NIKE帐户_男子_']={0x8d8d8d, "-144|-43|0xfe0000,121|34|0xfe0000",90,46,545,376,1225} --多点找色
	t['创建您的NIKE帐户_男子__']={0x939393, "0|-9|0x939393,-58|-49|0xe5e5e5,67|-49|0xe5e5e5,10|29|0xe5e5e5",90,39,400,366,1093} --多点找色
	t['创建您的NIKE帐户_注册']={0xffffff, "-293|-31|0x000000,-293|36|0x000000,327|-34|0x000000",90,30,1056,715,1333} --多点找色
	t['创建您的NIKE帐户_出生日期']={0x8d8d8d, "0|-6|0xffffff,0|-10|0x8d8d8d,0|-20|0x8d8d8d,0|-52|0xe5e5e5,0|25|0xe5e5e5",90,77,563,211,778} --多点找色
	t['继续——按钮'] = { 0xffffff,"-323|-38|0,275|29|0,291|-597|0x363636,291|-606|0xffffff",degree,27,22,727,847}
	t['填完资料，点注册'] = { 0xffffff,"0|-5|0,304|-32|0,-317|-34|0,286|39|0,259|140|0x8d8d8d,-260|-258|0xbcbcbc",degree,14,492,736,1168}
	t['填完资料，点注册2'] = { 0xffffff,"-298|-39|0,323|-39|0,310|36|0,15|99|0,313|129|0xffffff",degree,22,710,733,1328}
	
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('继续——按钮',true,1,5)then
			elseif d('填完资料，点注册',false,2)then
				click(384,922)
				d('填完资料，点注册',true,1,5)
			elseif d('开屏登录',true,2)then
			elseif d('登录Nike+帐号') then
				if 取号 then
					var.account.phone =  vCode.getPhone()
					if var.account.phone then
						if d('登录Nike+帐号_手机号码',true)then
							delay(2)
							inputword(var.account.phone)
						end
						取号 = false
						验证码 = true
					end
				elseif 验证码 then
					if d('登录Nike+帐号_发送验证码')then
						sendsms = sendsms + 1
						if sendsms >= 2 then
							return false
						else
							if d('登录Nike+帐号_发送验证码',true,1,2)then
								click(254,508,2)
								sms = vCode.getMessage()
								if sms ~= "" then
									log(sms,true)
									inputword(sms)
									delay(2)
									d('弹窗_输入的完成',true)
									验证码 = false
									登录 = true
								else
									return false
								end
							end
						end
					end
				elseif d('登录Nike+帐号_继续',true) then
				end
			elseif d('注册返回界面')then
				local NameAndPwd ={{191,420,0xffffff},{554,427,0xffffff},{320,523,0xffffff},}
				for i,v in ipairs(NameAndPwd) do
					click(v[1],v[2])
					if i == 1 then
						local str_len = utf8.len(first_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						first_name_ = utf8.char(utf8.codepoint(first_names,str_rnd + 1,str_rnd + 2))
						clearTxt()
						input(first_name_)
						d('弹窗_输入的完成',true)
					elseif i == 2 then
						local str_len = utf8.len(last_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						last_names_ = utf8.char(utf8.codepoint(last_names,str_rnd + 1,str_rnd + 2 + rd(0,1)*3 ))
						clearTxt()
						input(last_names_)
						d('弹窗_输入的完成',true)
					elseif i == 3 then
						clearTxt()
						input(var.account.pwd)
						d('弹窗_输入的完成',true)
						if d('创建您的NIKE帐户_出生日期',true,1,3)then
							var.birthday = ''
							var.year = os.date(os.date("%Y"))
							var.moon = os.date(os.date("%m"))
							var.day = os.date("%d")
							local rd__ = rd(9,14)
							click_random(228,1001,rd__)
							var.year = (var.year+1-rd__*2)
							local rd__ = rd(2,5)
							click_random(364,1053,rd__)
							var.moon = var.moon-rd__
							if var.moon <= 0 then
								var.moon = var.moon + 12
							end
							local rd__ = rd(2,5)
							click_random(508,1053,rd__)
							var.day = var.day-rd__
							if var.day <= 0 then
								var.day = var.day + 30
							end
							var.birthday = var.year ..'-'.. var.moon ..'-'.. var.day
							click(681,861);
						end
					end
					delay(1)
				end
				d('创建您的NIKE帐户_男子',true)
				d('创建您的NIKE帐户_男子_',true)
--				d('创建您的NIKE帐户_男子__',true)
				d('创建您的NIKE帐户_注册',true,1,4)
				d('填完资料，点注册2',true,1,5)
			elseif d('输入您的生日') or d('输入您的出生日期')then
				click(182,404,2)
				if d('弹窗_输入的完成')then
					var.birthday = ''
					var.year = os.date(os.date("%Y"))
					var.moon = os.date(os.date("%m"))
					var.day = os.date("%d")
					local rd__ = rd(9,14)
					click_random(228,1001,rd__)
					var.year = (var.year+1-rd__*2)
					local rd__ = rd(2,5)
					click_random(364,1053,rd__)
					var.moon = var.moon-rd__
					if var.moon <= 0 then
						var.moon = var.moon + 12
					end
					local rd__ = rd(2,5)
					click_random(508,1053,rd__)
					var.day = var.day-rd__
					if var.day <= 0 then
						var.day = var.day + 30
					end
					var.birthday = var.year ..'-'.. var.moon ..'-'.. var.day
				end
				if d('弹窗_输入的完成',true)then
					click(  373,  562)
					d('输入您的生日',true)
				end
				d('输入您的电子邮件_保存',true)
			elseif d('输入您的电子邮件')then
				click(639,408)
				clearTxt()
				input(var.account.login)
				delay(1)
				d('输入您的电子邮件_保存',true)
--				backWirteFile(file_name,var.account.login.."|"..var.account.pwd.."|"..var.account.phone.."\n",'a')
			elseif d('主菜单_首页')then
				if firstUp then
					if updateNike()then
						delay(rd(2,5))
						firstUp = false
						click(300,300)
					end
				elseif d('鞋子详情页面_心_点亮')then
					moveTo(300,200,300,800-rd(500,600),rd(20,30))	--下滑
					click(30,83)
					d('主菜单_首页',true,4)
				elseif d('未收藏的鞋子',true)then
				elseif d('鞋子详情页面_心',true)then
				else
					moveTo(300,800,300,800-rd(100,200),rd(5,8))	--上滑
				end
			elseif d('个人页面')then
				if d('个人页面_设置按钮',true)then
				elseif d('我_付款信息_界面')then
					--1,微信
					--2,支付宝
					--3,退出
					local paywhere = {
							{  143,  316, 0x00c800},
							{  142,  189, 0x00aaef},
							{   29,   82, 0x000000},
						}
					local payKeys__ = UIvalues.pay + 1
					if payKeys__ == 3 then
						payKeys__ = rd(1,2)
					end
					click(paywhere[payKeys__][1],paywhere[payKeys__][2])
					click(paywhere[3][1],paywhere[3][2])
					付款信息 = false
				
				elseif d('配送地址_新地址',true)then
				elseif d('配送地址_添加成功',true)then
					填地址 = false
				elseif d('配送地址_添加地址',false)then
					updateNikeLog('填地址');
					local inputf = function(txt)
--									clearTxt()
--									inputText(txt)
									inputStr(txt)
									d('弹窗_输入地址的完成',true)
									end
					local loc ={
									{  285,  214, 0xffffff},
									{  651,  212, 0xffffff},
									{  554,  349, 0xffffff},
									{  127,  476, 0xffffff},
									{  372,  476, 0xf7f7f7},
									{  584,  476, 0xf7f7f7},
									{  583,  605, 0xffffff},
									{  579,  877, 0xffffff},
								}
								
					for i,v in ipairs(loc)do
						click(v[1],v[2])
						if i == 1 then
							local str_len = utf8.len(first_names)
							local str_rnd = (math.random(1,str_len) -1) * 3
							first_name_ = utf8.char(utf8.codepoint(first_names,str_rnd + 1,str_rnd + 2))
							log('first_name_->'..first_name_)
							inputf(first_name_ or '张')
						elseif i == 2 then
							local str_len = utf8.len(first_names)
							local str_rnd = (math.random(1,str_len) -1) * 3
							last_names_ = utf8.char(utf8.codepoint(last_names,str_rnd + 1,str_rnd + 2 + rd(0,1)*3 ))
							inputf(last_names_ or '三')
						elseif i == 3 then
							clearTxt()
							inputword(var.account.phone or myRand(2))
							d('弹窗_输入地址的完成',true)
						elseif i == 4 or i == 5 or i == 6 then
							delay(2)
							if i == 4 then
								clici__i = rd(9,9)
							elseif i == 5 then
								clici__i = rd(6,6)
							elseif i == 6 then
								clici__i = rd(7,7)
							end
							for i_=1,clici__i do
								click(382,1181,0.5)
							end
							d('弹窗_输入地址的完成',true)
						elseif i == 7 then
							local addr_list = split(street_addrs,",")
							local addr = addr_list[math.random(1,#addr_list)]
							
							local where ={
								string.format("延芳路4038号 %s%s小区%d%d栋%d0%d%d号",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗沙路4099号 %s%s小区%d%d栋%d0%d%d室",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("延芳路600号 %s%s小区%d%d栋%d0%d%d室",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("延芳路588号 %s%s%s小区%d%d栋%d0%d%d号",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗湖广岭小区 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗沙路 新世界四季御园 %d%d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("大澎花园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("中震大厦 %s%s阁%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("通发花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗芳苑 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("银丰花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("龙泉花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("芳春花园 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("深港新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("锦绣新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("兴华苑 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("华兴花园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("赤龙新村 %d%d栋%d0%d%d号",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("经二路1号 %s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("经二路3号 %s%s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗芳路190号 %s%s%s小区%d%d栋%d0%d",	myRand(7,1),myRand(7,1),myRand(7,1),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("经二路19号名太轩 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("广陵家园 %d%d栋%d%d0%d室",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("罗湖党校 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("西岭花园 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
								string.format("安业花园 %d%d栋%d0%d",	rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9),rd(1,9) ),
							}
							var.account.address_area = where[rd(1,#where)]
							inputf(var.account.address_area)
						elseif i == 8 then
							inputf(tostring(rd(100000,999999)))
						end
						delay(1)
					end	
					d('配送地址_添加地址',true)
				
				elseif d('个人页面_通知开启')then
					updateNikeLog('通知开启');
					delay(3)
					click(30,83)
					d('个人页面',true,4)
					click(30,83)
					delay(rd(4,8))
					return true
				else
					t['个人页面_姓别']={
						0x000000, 
						"3|22|0xfcfcfc,3|23|0x000000,-41|23|0x222222,-43|23|0xffffff,-45|23|0x000000", 
						90, 14, 844, 100, 888
					}
					d('个人页面_姓别',true)
			
					if d('个人页面_未设头像',true)then
						updateNikeLog('设头像');
					elseif d('个人页面_鞋码选择',true)then
						if d('个人页面_鞋码滑表')then
							for i=1,rd(1,6) do
								click(374,1116,0.5)
							end
						end
						if d('个人页面_鞋码滑表',true)then
							delay(2)
--							moveTo(300,900,300,300,20)
							delay(3)
						end
					else
						t['我_付款信息']={ 0xffffff, "3|-3|0x000000,20|-2|0x000000,655|-2|0xc7c7cc", 90, 11, 846, 736, 913}
						if 付款信息 then
							if d('我_付款信息',true)then
								delay(rd(3,5))
							else
								moveTo(300,900,300,900-200,5)
							end
						else
							moveTo(300,900,300,900-300,20)
							delay(rd(2,3))
						end
					end
					if 填地址 then
						t["配送信息->"] = { 0xc7c7cc, "-587|10|0x000000,-54|1114|0x0b0b0b", 90, 15, 135, 716, 1312}
						d("配送信息->",true)
					else
						d('个人页面_通知设置',true)
						delay(1)
						d('个人页面_启动通知',true)
					end

				end
			elseif d('个人页面_照片',true,1)then
			elseif d('个人页面_时刻',false,1)then
				moveTo(300,200,300,800-rd(200,600),rd(20,30))	--下滑
				delay(5)
				click(rd(31,723),rd(235,1119))
				click(696, 1265)
			else
				log('tips')
				if d('弹窗_输入的完成',true)then
				elseif d('弹窗_现在不用',true)then
					moveTo(300,200,300,800-rd(500,600),rd(20,30))	--下滑
					delay(2)
				elseif 登录 then
					if d('登录Nike+帐号_继续',true)then
					else
						errors()
					end
				else
					if errors()then
						error_times = error_times + 1
						if error_times%5 == 0 then
							click(20,20)
						end
					end
				end
			end
		end
		delay(1)
	end
end


t["我_设置界面_"]={ 0xfbfbfb, "-4|-2|0x0c0c0c,-4|12|0x000000,19|12|0x000000,-356|-3|0x000000", 90, 10, 46, 543, 124}
t["我_退出登录_红"]={ 0xff3b30, "-4|128|0x007aff", 90, 244, 1073, 516, 1298}
t['我_未激活']={ 0xb8b8b8, "-26|-21|0xffffff,23|-27|0xffffff,4|6|0xb8b8b8", 90, 601, 1253, 709, 1315 } --多点找色

function logout()
	local timeline = os.time()
	local outTimes = 120
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('主菜单_首页') then
				click(  657, 1281,3)
			elseif d('个人页面')then
				if d('个人页面_设置按钮',true)then
				elseif d("我_设置界面_")then
				
					t["我_退出登录"]={ 0x000000, "4|3|0xffffff,125|184|0xb8b8b8,297|184|0x000000", 90, 218, 1034, 723, 1323}
				
					if d("我_退出登录",true)then
						
					else
						delay(2)
						moveTo(300,900,300,300,20)
						delay(3)
					end
				end
			elseif d("我_退出登录_红",true)then
			elseif d("我_未激活",true)then
			elseif d('开屏登录')then
				return true
			else
				errors()
			end
		end
		delay(1)
	end
end

local degree = 85

t['主界面_登录NIKE帐号']={0x363636,"-244|83|0xffffff,-239|78|0x111111,-246|86|0x111111,-459|78|0x111111,-453|83|0xffffff",90,106,16,730,255}

t['错误_登录失败']={ 0xfe2020, "249|-7|0xfe0000,324|-2|0xfe0000", 90, 20, 140, 723, 703 } --多点找色
t['错误_选对国家']={ 0x000000, "-72|-5|0xffffff,-339|1|0x000000,340|49|0xb2b2b2", 90, 8, 48, 733, 165 } --多点找色
t['错误_未中签']={ 0xffffff, "8|-9|0xffffff,-1|-22|0x545455,-23|0|0x545454,22|0|0x545454,-1|22|0x535354", 90, 564, 16, 744, 131 } --多点找色
t['错误_验证手机号']={ 0xefefef, "537|-6|0xe5e5e5,-22|329|0x000000,604|252|0x000000", 90, 36, 448, 714, 827 } --多点找色
t['错误_密码错误']={ 0xffffff, "-1|1|0xfe0a0a,312|-214|0x363636,300|552|0x000000", 90, 28, 62, 720, 910}
t['错误_未输入密码']={ 0x8d8d8d, "-30|40|0xfe0000,550|-2|0xfe0000,307|438|0x000000,27|88|0xfe0000,28|88|0xfff1f1", 90, 13, 355, 713, 928}

t['登录界面n_电子邮件'] = { 0x8f8f8f,"3|5|0xffffff,14|20|0x8d8d8d,155|-2|0x8d8d8d,155|19|0x8d8d8d,152|8|0xffffff,149|3|0x8d8d8d",degree,84,244,701,472}
t['登录界面n_密码'] = { 0x8d8d8d,"18|0|0x8d8d8d,1|-18|0xffffff,-2|-20|0x8d8d8d,43|-21|0x8d8d8d,42|-5|0x8d8d8d,42|-1|0xffffff,43|1|0x8d8d8d",degree,85,361,155,484}

t['错误的登录'] = { 0x8d8d8d,"390|-295|0xfe0000,-113|-197|0xfe0000,387|-120|0xfe0000,-60|-2|0x8d8d8d,264|-373|0xfe0000",degree,15,20,725,839}

function login()
	local timeline = os.time()
	local outTimes = 3*60

	getIdUrl = 'http://zzaha.com/phalapi/public/?s=Nikeagain.Again&again='..UIvalues.again..'&sms='..UIvalues.sms..'&name='..getDeviceName()
	
	local data 	= get(getIdUrl);
	if data ~= nil then
		log(data)
		if type(data.data) == "table" then
			var.account.login = data.data.address_mail
			var.account.pwd = data.data.address_pwd
			var.account.phone = data.data.address_phone
			var.account.id = data.data.id
			var.account.first_name_ = data.data.address_xin
			var.account.last_names_ = data.data.address_ming
			var.account.address_country = data.data.address_country
			
			local account_txt = "执行至 "..var.account.id .."\n账号 = "..var.account.login.."\n密码 = "..var.account.pwd
			dialog(account_txt,2)
			log(account_txt)
		else
			backphone();
			dialog("暂无帐号", 60*3)
			return false
		end
	end
	
	local loginKey = true
	local pwdKey = true
	local lookPwd = false
	updateNikeLog('正在登录')
	
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('开屏登录',true)then
				delay(5)
			elseif d('错误_验证手机号')then
				updateNikeLog('重新认证');
				var.account.phone =  vCode.getPhone()
				if var.account.phone then
					t['验证你的手机号_手机号码']={ 0xb3b3b3, 
						"8|-4|0xffffff,8|-6|0xa9a9a9,17|-22|0xa9a9a9,-83|-15|0xa9a9a9,-83|-12|0xffffff,-66|-9|0xa9a9a9,-49|-15|0xffffff,-45|-19|0xfafafa", 90, 155, 475, 514, 537}
					if d('验证你的手机号_手机号码',false)then
						click(  471,  503 ,rd(3,5))
						clearTxt()
						inputword(var.account.phone)
						delay(3)
					end
				end
				t['验证你的手机号_发送验证码']={ 0x111111, "3|2|0xe5e5e5,7|6|0x111111", 90, 535, 376, 686, 435}
				if var.account.phone and d('验证你的手机号_发送验证码')then
					if d('验证你的手机号_发送验证码',true)then
						sms = vCode.getMessage()
						if sms ~= "" then
							log(sms,true)
							inputword(sms)
							验证码 = false
							登录 = true
						else
							return false
						end
					end
				end
				t['验证你的手机号_继续']={ 0xffffff, "-2|-4|0x000000,-311|-44|0x000000,315|26|0x000000", 90, 33, 203, 733, 966}
				if var.account.phone and d('验证你的手机号_继续',true)then
					delay(rd(8,10))
				end
			elseif d('登录Nike+帐号') or d('主界面_登录NIKE帐号')then
				if d('登录Nike+帐号_使用电子邮件登录',true)then
					delay(3)
				elseif d('登录界面n_电子邮件',true)then
					updateNikeLog('输入帐号..');
					delay(rd(2,3))
					clearTxt()
					input(var.account.login)
				elseif d('登录界面n_密码',true)then
					updateNikeLog('输入密码..');
					delay(3)
					input(var.account.pwd)
					pwdKey = false
					lookPwd = true
				else
					if d('登录Nike+帐号_继续',true) or d('登录Nike+帐号',true)then
						delay(rd(8,10))
					end
				end
				d('错误的登录',true)
				d('弹窗_输入的完成',true)
			elseif d("错误_未输入密码",true)then
				input(var.account.pwd)
				updateNikeLog('登录遇到错误');
				delay(2)
				return false
			elseif d('错误的登录',true) then
			elseif d('首页页面') then
				return true
			elseif lookPwd and d('错误_密码错误')or d('错误_选对国家') then
				updateNikeLog('密码错误');
				disable();
				return false
			else
				log('tips')
				t['弹窗_输入的完成_black']={0x000000, "12|-7|0x000000,3|-4|0xffffff,-27|-5|0xffffff,-29|-7|0x000000,-18|6|0xffffff",90,623,696,735,1058} --多点找色
				if d('弹窗_输入的完成',true)then
				elseif d('弹窗_输入的完成_black',true)then
				else
					errors()
				end
			end
		end
		delay(1)
		log('login->'..os.time()-timeline)
	end
end


t['主菜单_首页']={ 0x000000, "187|-2|0xb8b8b8,374|9|0xb8b8b8,562|2|0xb8b8b8,-4|4|0xffffff", 90, 21, 1254, 707, 1312 } --首页,发现,收件箱,我
	t['精选激活中']={ 0x0f0f0f, "0|42|0x000000,2|45|0xb2b2b2", 90, 167, 40, 199, 145 } --多点找色
	t['热卖激活中']={ 0x000000, "0|48|0x000000,0|49|0xb2b2b2", 90, 360, 48, 375, 144 } --多点找色
		t['热卖激活中_切换模式']={ 0xb8b8b8, "-9|7|0xffffff,-9|8|0xb8b8b8,0|-9|0xb8b8b8", 90, 174, 133, 201, 210 } --多点找色
		t['热卖激活中_大图模式']={ 0xffffff, "1|-1|0xb8b8b8,10|-10|0xb8b8b8,-11|11|0xb8b8b8,-11|1|0xffffff", 90, 173, 129, 203, 221 } --多点找色
		t['热卖激活中_没有第二个商品']={ 0x000000, "3|2|0xf5f5f5", 90, 7, 1085, 735, 1223 } --多点找色
t['未收藏的鞋子']={ 0xf5f5f5, "-70|-15|0x000000,-71|-14|0xf5f5f5,-71|12|0xf5f5f5,-70|11|0x000000,69|12|0x000000,68|-15|0xf5f5f5", 90, 493, 7, 743, 1231 } --多点找色		
t['鞋子详情页面']={ 0x000000, "12|0|0xffffff,11|-10|0x000000,11|11|0x000000,698|-1|0xffffff", 90, 5, 34, 746, 115 } --多点找色
	t['鞋子详情页面_心']={ 0x111111, "0|-11|0xffffff,-16|-10|0x111111,9|-13|0x111111,0|15|0x111111,-12|8|0xffffff,-10|6|0x111111", 
						90, 443, 10, 495, 1300 }
	t['鞋子详情页面_心_点亮']={ 0xff0015, "0|-10|0xffffff,-16|-4|0xff0015,17|-4|0xff0015,1|15|0xff0015", 90,443, 10, 495, 1300 } 
	t['鞋子详情页面_下单按钮']={ 0x000000, "-4|2|0xf5f5f5,-28|-4|0x000000,-6|-37|0x000000,-7|28|0x000000,-6|69|0xffffff", 90, 13, 17, 87, 1250 } --多点找色
		
t['为你的订单付款_x']={ 0x000000, "-449|1215|0x00aaef,-674|1165|0x1a1a1a,5|1259|0x1a1a1a,11|1252|0x1a1a1a", 90, 10, 12, 738, 1320 } --多点找色
t['为你的订单付款_x_wechat']={ 0x000000, "-429|1196|0x00c800,-420|1218|0x00c800,-667|1249|0x1a1a1a", 90, 13, 8, 736, 1315 } --多点找色
t['搜索页面_取消']={ 0x000000, "-1|43|0xb2b2b2,-676|-5|0x111111,-663|-4|0xffffff,-659|-4|0x111111", 90, 10, 41, 742, 163 } --多点找色		
		
t['弹窗_右上角的x']={ 0xffffff, "-23|1|0x545454,-1|-22|0x545455,21|0|0x545454,0|22|0x535354", 90, 640, 42, 711, 101 } --多点找色
t['弹窗_立即购买弹窗']={ 0xffffff, "325|15|0x1a1a1a,-360|-3|0x1a1a1a,188|-497|0x00aaef", 90, 6, 314, 737, 1320 } --多点找色
t['弹窗_继续选择码']={ 0xb8b8b8, "678|8|0xb8b8b8,331|-40|0xb8b8b8,331|59|0xb8b8b8,321|9|0xffffff", 90, 6, 314, 737, 1320 } --多点找色
	t['弹窗_继续选择码_上部分']={ 0x000000, "3|0|0xffffff,-20|0|0xffffff,-670|-2|0x000000,-672|-6|0xffffff", 90, 7, 240, 741, 950 } --多点找色
	t['弹窗_继续选择码_随机可选']={ 0x000000, "5|0|0xffffff,0|-7|0x000000", 90, 46, 753, 697, 1136 } --多点找色
	t['弹窗_继续选择码_继续黑']={ 0xffffff, "-333|8|0x1a1a1a,346|2|0x1a1a1a,-3|-48|0x1a1a1a,-7|51|0x1a1a1a", 90, 17, 1168, 727, 1309 } --多点找色
		t['弹窗_继续选择码_继续黑_编辑']={ 0x000000, "-1|-10|0x0d0d0d,-514|128|0xff0000", 90, 25, 567, 737, 889}
t['弹窗_删除错误地址']={ 0x000000, "-2|-2|0xffffff,-326|-182|0x1a1a1a,349|-83|0x1a1a1a,17|-140|0xffffff", 90, 21, 224, 733, 1330}
t['弹窗_删除错误地址_红色框']={ 0xff0000, "0|15|0xff0000", 90, 14, 432, 741, 928}

t['弹窗_请输入密码']={ 0xffffff, "48|-144|0xdddddd,-2|-334|0x000000,174|-377|0xffffff,-352|30|0xffffff", 90, 98, 66, 654, 672 } --多点找色
t['弹窗_添加配送地址']={ 0xff0000, "-525|620|0xb8b8b8,-200|573|0xb8b8b8,42|119|0x00aaef,145|580|0xb8b8b8", 90, 19, 460, 740, 1321 } --多点找色
	t['弹窗_添加配送地址_填']={ 0xffffff, "-338|-6|0x1a1a1a,344|-55|0x1a1a1a,-324|-954|0x000000,320|-941|0x000000,319|-941|0xffffff", 
						90, 19, 460, 740, 1321 } --多点找色
	t['弹窗_添加配送地址_上部分']={ 0x000000, "2|0|0xffffff,1|-4|0xffffff,1|-3|0x000000,-665|-8|0x000000", 90, 14, 286, 727, 347 } --多点找色
	t['弹窗_输入地址的完成']={ 0x191919, "-16|-5|0x000000,-17|-7|0xffffff", 90, 641, 665, 740, 898 } --多点找色
t['弹窗_输入地址后上拉一下']={ 0x1a1a1a, "-677|0|0x1a1a1a,-682|8|0x1a1a1a,-683|8|0xffffff,4|8|0xffffff", 90, 19, 1310, 727, 1333 } --多点找色

t['弹窗_填地址_上滑了']={ 0xffffff, "-15|0|0x1a1a1a,-316|-51|0x1a1a1a,365|44|0x1a1a1a,393|-995|0xffffff,-336|-988|0xffffff", 90, 0, 70, 749, 1332 } --多点找色
t['弹窗_卖光了']={ 0x000000, "-137|-68|0xaaaaaa,107|-68|0xaaaaaa,4|-226|0x000000", 90, 114, 487, 633, 854 } --多点找色

t['弹窗_普通达']={ 0x1a1a1a, "0|3|0xffffff,-322|-153|0xffffff,-318|-150|0x000000,303|-151|0x000000", 90, 10, 1055, 743, 1327}
t['分享按钮']={ 0x000000, "-2|-8|0xffffff,-1|-8|0x000000,0|-13|0x000000,-2|9|0xffffff,0|10|0x000000,-24|10|0x000000,18|0|0x000000", 
				90, 247, 418, 312, 1221}




t['主菜单_首页未激活']={0xffffff,"2|-21|0xb8b8b8,-14|-4|0xb8b8b8,6|1|0xb8b8b8,5|2|0xffffff,12|14|0xffffff",90,56,1258,124,1310}


t['收件箱页面'] = { 0,"-18|-26|0xffffff,-21|-26|0,18|7|0,12|12|0xffffff,12|11|0",degree,420,1234,523,1322}
t['我的页面'] = { 0,"-1|-18|0xffffff,-1|-21|0,-16|16|0,12|16|0xffffff,15|16|0",degree,612,1237,702,1319}
t['浏览页面'] = { 0xffffff,"9|-7|0,-8|10|0,-3|-3|0,-15|-2|0xffffff,-19|-10|0,18|13|0",degree,227,1242,330,1322}
t['首页页面'] = { 0,"-13|2|0xffffff,-15|13|0,16|11|0,4|-11|0xffffff,13|-19|0",degree,38,1236,143,1323}
t['按尺码筛选'] = { 0x111111,"6|-1|0xffffff,7|-1|0x111111,28|-1|0x111111,199|-1|0x757575,199|18|0x757575,21|15|0x111111,20|15|0xffffff",degree,7,50,273,112}
t['购物偏好设置'] = { 0x111111,"0|-8|0xfafafa,-13|-13|0x111111,14|-13|0x111111,178|1109|0x111111,174|1106|0xffffff,174|1101|0xffffff",degree,260,75,720,1304}
t['鞋子详情页面'] = { 0xffffff,"-1|-23|0x3f3f3f,22|1|0x3f3f3f,-1|23|0x3f3f3f,9|11|0xffffff,-26|3|0x3f3f3f",degree,621,65,716,143}
	
function look()
	if UIvalues == nil then
		UIvalues = {}
		UIvalues.look_min_time = 60
		UIvalues.look_max_time = 150
	end
	
	local timeline = os.time()
	local outTimes = math.random(UIvalues.look_min_time+0,UIvalues.look_max_time+0)
	
	
--	updateNikeLog('浏览「'..outTimes..'」')

	while (os.time()-timeline < outTimes) do
		if active(var.bid,3) then
			if d('首页页面') then
				local homes = {
									{64,85,0xc1c1c1},
									{174,85,0x757575},
								}
				click(homes[rd(1,2)][1],homes[rd(1,2)][2],rd(1,4))
				moveTo(300,800,300,800-rd(100,500),rd(2,20))
			elseif d('按尺码筛选') then
				if rd(1,100)< 80 then
					moveTo(300,800,300,800-rd(100,500),rd(2,20))
				elseif rd(1,100) < 50 then
					moveTo(300,300,300,300+rd(100,500),rd(2,20))
					local change = {
										{281,1276,0xffffff},
										{466,1280,0xffffff},
										{653,1277,0xb8b8b8},
									}
					delay(rd(1,3))
					click(change[rd(1,3)][1],change[rd(1,3)][2])
				elseif rd(1,100) < 50 then
					d('按尺码筛选',true)
				else
					click(rd(66,694),rd(202,1225),rd(1,3))
				end
			elseif d('我的页面') then
				delay(rd(1,5))
				click(92,1277)
			elseif d('浏览页面') then
				delay(rd(1,5))
				click(92,1277)
			elseif d('收件箱页面')then
				delay(rd(1,5))
				click(92,1277)
			elseif d('购物偏好设置') then
				delay(1,5)
				d('购物偏好设置',true)
			elseif d('鞋子详情页面') then
				delay(1,2)
				if rd(1,100) < 60 then
					moveTo(300,300,300,300+rd(100,500),rd(2,20))
				else
					d('鞋子详情页面',true)
				end
			else
				others = others or 0
				others = others + 1
				if others > 10 then
					closeApp(var.bid, 1)
					others = 0
				end
			end
			delay(rd(1,3))
			log('look->'..os.time()-timeline)
		end
	end
	-- body
	return true
end





--logout()
--lua_exit()


function delay(times)
	local times = times or 1
	local timeLine = os.time()
	
	while os.time() - timeLine <= times do
		mSleep(1000)
		if (times-(os.time() - timeLine) > 3) then
			log("倒计时->「".. times-(os.time() - timeLine) .."」",true)
		end
	end
end


function main()
	if login()then
		if look()then
			backId()
			updateNikeLog('SNKRS复登完成')
		end
		closeX(var.bid)
		delay(2)
	end
end


--look()



















