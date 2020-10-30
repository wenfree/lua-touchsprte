require("TSLib")
require("tsp")
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

--读文件
function readFile_(path)
	local path = path or '/var/mobile/Media/TouchSprite/lua/account.txt'
    local file = io.open(path,"r");
    if file then
        local _list = '';
        for l in file:lines() do
            _list = _list..l
        end
        file:close();
        return _list
    end
end


function decodeURI(s)
    s = string.gsub(s, '%%(%x%x)', function(h) return string.char(tonumber(h, 16)) end)
    return s
end
function encodeURI(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end

function local_token_()
	local appbid = 'com.nike.onenikecommerce'
	local localPath = appDataPath(appbid).."/Documents/ifkc.plist" --设置 plist 路径
	local toketext = readFile_(localPath)
	return encodeURI(toketext)
end

function update_token()
    local url = 'http://nikeapi.honghongdesign.cn'
    local arr ={}
    arr['s']='App.NikeToken.Token'
    arr['email'] = var.account.login
    arr['token'] = local_token_()
    arr['id'] = var.account.id
    post(url,arr);
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
    log(workstate);
    return '';
-- 	local sz = require("sz")
-- 	local url = 'http://zzaha.com/phalapi/public/'
-- 	local Arr={}
-- 	Arr.s = 'Nikesave.Save'
-- 	Arr.address_mail = var.account.login
-- 	Arr.workstate = workstate
-- 	post(url,Arr)
end

function backId()
	local postUrl = 'http://nikeapi.honghongdesign.cn/'
	local postArr = {}
	postArr.s = 'NikeBack.back'
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
t['开屏登录']={ 0xffffff, "276|-9|0x111111,288|2|0x111111,280|-61|0xffffff,336|56|0xffffff", 90, 28, 1052, 572, 1213 } --登录_加入
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

	local loginKey = true
	local pwdKey = true
	local lookPwd = false
	local 是否输入过密码 = false
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
					是否输入过密码 = true
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
			elseif d('look-首页-菜单') then
			    if 是否输入过密码 then
			        update_token();
			    end
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
	
	
	
	
t['look-首页-菜单']={0x111111, "0|0|0x111111,16|-9|0xffffff,18|-10|0x111111,164|-7|0xcccccc",90,9,1231,328,1321}
    摘要热卖={{60, 82, 0xffffff},{174, 81, 0xe2e2e2}}
t['look-首页-按尺码筛选']={0x111111, "0|0|0x111111,7|-1|0xfcfcfc,9|-1|0x111111,91|-20|0x757575,-5|-18|0x111111,-6|-18|0xfcfcfc",90,19,47,258,207}
    t['look-首页-喜欢心']={0xf6f6f6, "0|0|0xf6f6f6,2|-10|0x111111,-14|-6|0x111111,15|-4|0xf6f6f6,18|-4|0x111111,2|11|0xf6f6f6,2|16|0x111111",90,86,160,148,1332}
t['look-鞋幻灯x']={0xffffff, "0|0|0xffffff,-6|-12|0x4e4e4e,-10|-9|0xffffff,-112|11|0x4d4d4d,-106|6|0xffffff",90,507,115,720,191}
t['look-鞋详情x']={0xffffff, "0|0|0xffffff,9|-9|0xffffff,-11|-9|0xffffff,31|-1|0x4e4840,0|33|0x4e4a43",70,626,63,715,148}
t['look-鞋详情-底黑']={0xffffff, "0|0|0xffffff,-252|-61|0x111111,303|-61|0x111111,276|56|0x111111,-246|56|0x111111",90,24,1168,722,1304}
t['look-购物偏好设置']={0x111111, "0|0|0x111111,183|1110|0x111111,181|1103|0xffffff,22|-9|0x111111,6|-10|0xfafafa",90,322,82,614,1270}
t['look-首页未激活']={0xcccccc, "0|0|0xcccccc,-17|-8|0xffffff,-21|-8|0xcccccc,0|-26|0xcccccc,17|3|0xffffff,17|12|0xcccccc",90,36,1235,136,1315}
t['look-首页-x']={0xffffff, "0|0|0xffffff,0|-10|0x414141,-6|-6|0xfbfbfb,-13|1|0x414141,1|14|0x414141",90,661,56,712,104}

function snkrslook()
	if UIvalues == nil then
		UIvalues = {}
		UIvalues.look_min_time = 90
		UIvalues.look_max_time = 150
	end
	
	local timeline = os.time()
	local outTimes = math.random(UIvalues.look_min_time+0,UIvalues.look_max_time+0)
	
	local 看鞋向下滑动计数 = 0
	local 鞋详情下滑计数 = 0
	local setp_ = ''
	local setp__ = ""
	local setp___ = 0

	updateNikeLog('浏览「'..outTimes..'」')

	while (os.time()-timeline < outTimes) do
		if active(var.bid,3) then
		    if (  d('look-首页-菜单')  ) then
		        setp_ = 'look-首页-菜单'
		        
		        看鞋向下滑动计数 = 0
		        click(摘要热卖[rd(1,2)][1],摘要热卖[1][2],2)
		        moveTo(300,800,300,800-rd(200,400),rd(20,30))	--向上滑动
		    elseif d('look-首页-按尺码筛选') then
		        setp_ = 'look-首页-按尺码筛选'
                看鞋向下滑动计数 = 看鞋向下滑动计数 + 1
                if ( 看鞋向下滑动计数 > rd(6,10) ) then
                    moveTo(300,500,300,500+rd(200,400),rd(20,30))	--向下滑动
                else
                    moveTo(300,800,300,800-rd(200,400),rd(20,30))	--向上滑动
                    if rd(1,100)>50 then
                        d('look-首页-喜欢心',true,1,'喜欢',2)
                    end
    		        if rd(1,100) > 40 then
    		            log('准备看详情')
    		            click(rd(88,651),rd(187,946),2)
    		            鞋详情下滑计数 = 0
    		        end
                end
		    elseif d('look-鞋详情x') or d('look-鞋详情-底黑')then
		        setp_ = 'look-鞋详情x'
		        
                鞋详情下滑计数 = 鞋详情下滑计数 + 1
                moveTo(300,800,300,800-rd(200,400),rd(20,30))	--向上滑动
                if rd(1,100) > 90 then
                    d('look-鞋详情x',true)
                elseif 鞋详情下滑计数 > rd(5,8) then
                    d('look-鞋详情x',true)
                end
		    elseif d('look-购物偏好设置',true)then
		        setp_ = 'look-购物偏好设置'
		    elseif d('look-首页未激活',true)then
                setp_ = 'look-首页未激活'
		    elseif d('look-首页-x',true)then
		        setp_ = 'look-首页-x'
            else
                setp_ = '其它'
		    end
		    
		    if setp_ == setp__ then
		        setp___ = setp___ + 1
		    else
		        setp__ = setp_
		    end
		    if setp___ >= 15 then
		        click(672, 106)
		        setp___ = 0
		    end
		    log({setp_,setp__,setp___})
		    if setp_ == '其它' then
		        delay(0.5)
		    else
			    delay(rd(1,3))
			end
			log('look->'..os.time()-timeline)
		end
	end
	-- body
	return true
end








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





function ip()
    local url = 'http://nikeapi.honghongdesign.cn/?s=App.IndexIp.Ip'
    local ip___ = get(url)
    if ip___ then
        return ip___['data']
    end
end

function whiteip()
   local url = 'http://www.jinglingdaili.com/Users-whiteIpAddNew.html?appid=2420&appkey=ef2f43ef02109467a23c34f5b1e0982c&type=dt&index=&whiteip='..ip()
   return get(url)
end

function getNetIPproxy()
    local url = 'http://t.ipjldl.com/index.php/api/entry?method=proxyServer.generate_api_url&packid=0&fa=0&fetch_key=&groupid=0&qty=1&time=102&pro=&city=&port=1&format=json&ss=5&css=&dt=1&specialTxt=3&specialJson=&usertype=2'
    local ip___ = get(url)
    if ip___ then
        log(ip___['data'][1])
        return ip___['data'][1]
    end
end

if t == nil then
    t={}
end
t['vpn-首页-未激活']={0x000000, "0|0|0x000000,1|-2|0xf5f5f5,1|-4|0x222222,0|-19|0x808080",90,65,1243,124,1323}
t['vpn-首页-激活']={0x4587c2, "0|0|0x4587c2,1|-2|0xf5f5f5,1|-4|0x5d96c9,0|-19|0x4587c2",90,65,1243,124,1323}
    t['vpn-首页-编辑']={0x4587c2, "0|0|0x4587c2,-13|-1|0xffffff,-687|0|0xff9400",90,2,524,739,996}
    t['vpn-首页-开关开']={0xffffff, "0|0|0xffffff,67|-1|0xe5e5e5,-32|3|0xd9d9d9,16|-29|0xe3e3e3",90,601,192,729,296}
    t['vpn-首页-开关关']={0x4486c0, "0|0|0x4486c0,69|-1|0x407fb6,18|-29|0x4486c0",90,604,194,730,287}
    t['vpn-首页-连接成功']={0x000000, "0|0|0x000000,-2|-22|0xffffff,-3|38|0xffffff",90,259,186,453,293}
t['vpn-首页-编辑节点']={0xed402e, "0|0|0xed402e,1|-7|0xed402e,-14|-18|0xffffff",90,245,782,516,1175}
    t['vpn-首页-编辑节点-HTTP']={0x8e8e93, "0|0|0x8e8e93,8|-8|0x8e8e93,20|-8|0xffffff,23|8|0x8e8e93,117|0|0xc7c7cc,108|-10|0xc7c7cc",90,561,191,729,293}
    hpptwz = {301, 781}
    t['vpn-首页-编辑节点-完成']={0xffffff, "0|0|0xffffff,5|-3|0x4386c5,34|-7|0x4386c5,39|-12|0xffffff",90,622,53,727,113}
t['vpn-其它']={0xffffff, "0|0|0xffffff,22|-15|0x4386c5,399|-5|0xffffff,664|-10|0xffffff,656|3|0x4386c5",90,23,41,729,116}



function Shadowrockets_out()
    local arrowbid = "com.liguangming.Shadowrocket"
    
	local setp_ = ''
	local setp__ = ""
	local setp___ = 0
	
	local timeline = os.time()
	local outTimes = 60
	while (os.time()-timeline < outTimes) do
		if active(arrowbid,5) then
		    if d('vpn-首页-激活')  then
		        setp_ = 'vpn-首页-激活'
		        if d('vpn-首页-编辑') then
		            setp_ = 'vpn-首页-第一页'
		           
	                if d('vpn-首页-开关关',true)then
	                else 
	                    if d('vpn-首页-开关开')then
	                        return true
	                    end
	                end

		        elseif d('vpn-首页-编辑节点')then
		            setp_ = 'vpn-首页-编辑节点'
		            
		            if d("vpn-首页-编辑节点-HTTP") == nil then
		                click(649, 239)
		                click(301, 781)
		            end
		            log(whiteip())
		            local vpnList = getNetIPproxy()
		            local vpnlistWz = {{200, 398, 0xffffff},{200, 484, 0xffffff}}
		            click( vpnlistWz[1][1],vpnlistWz[1][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['IP'])
		            delay(1)
		            click( vpnlistWz[2][1],vpnlistWz[2][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['Port'])
		            delay(1)
		            if d('vpn-首页-编辑节点-完成',true)then
		                vpnInputKey = true
		            end
		        end
		    elseif d('vpn-首页-未激活',true)then
		        setp_ = 'vpn-首页-未激活'
		    elseif d('vpn-其它',true)then
		        setp_ = '其它UI'
            else
                setp_ = '其它'
		    end
		    
		    if setp_ == setp__ then
		        setp___ = setp___ + 1
		    else
		        setp__ = setp_
		    end
		    if setp___ >= 15 then
		        closeApp(arrowbid,1)
		        setp___ = 0
		    end
		    
		    log({setp_,setp___,'vpn->'..os.time()-timeline})
		    if setp_ == '其它' then
		        delay(0.5)
		    else
			    delay(rd(1,3))
			end
		end
	end
end


function Shadowrockets()
    local arrowbid = "com.liguangming.Shadowrocket"
    
	local setp_ = ''
	local setp__ = ""
	local setp___ = 0
	
	local vpnInputKey = false
	
	local timeline = os.time()
	local outTimes = 60
	while (os.time()-timeline < outTimes) do
		if active(arrowbid,5) then
		    if d('vpn-首页-激活')  then
		        setp_ = 'vpn-首页-激活'
		        if d('vpn-首页-编辑') then
		            setp_ = 'vpn-首页-第一页'
		            if vpnInputKey then
		                if d('vpn-首页-开关开',true)then
		                    
		                elseif d('vpn-首页-开关关') then
		                    if d('vpn-首页-连接成功') then
		                        return true
		                    end
		                end
		            else
		                if d('vpn-首页-开关关',true)then
		                else 
		                    d('vpn-首页-编辑',true)
		                end
		            end
		        elseif d('vpn-首页-编辑节点')then
		            setp_ = 'vpn-首页-编辑节点'
		            
		            if d("vpn-首页-编辑节点-HTTP") == nil then
		                click(649, 239)
		                click(301, 781)
		            end
		            log(whiteip())
		            local vpnList = getNetIPproxy()
		            local vpnlistWz = {{200, 398, 0xffffff},{200, 484, 0xffffff}}
		            click( vpnlistWz[1][1],vpnlistWz[1][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['IP'])
		            delay(1)
		            click( vpnlistWz[2][1],vpnlistWz[2][2],1)
		            keyDown("Clear")
                    keyUp("Clear")
                    delay(1)
		            inputText(vpnList['Port'])
		            delay(1)
		            if d('vpn-首页-编辑节点-完成',true)then
		                vpnInputKey = true
		            end
		        end
		    elseif d('vpn-首页-未激活',true)then
		        setp_ = 'vpn-首页-未激活'
		    elseif d('vpn-其它',true)then
		        setp_ = '其它UI'
            else
                setp_ = '其它'
		    end
		    
		    if setp_ == setp__ then
		        setp___ = setp___ + 1
		    else
		        setp__ = setp_
		    end
		    if setp___ >= 15 then
		        closeApp(arrowbid,1)
		        setp___ = 0
		    end
		    
		    log({setp_,setp___,'vpn->'..os.time()-timeline})
		    if setp_ == '其它' then
		        delay(0.5)
		    else
			    delay(rd(1,3))
			end
		end
	end
end

nLog('arrow 加截完成')

function get_account()
    getIdUrl = 'http://nikeapi.honghongdesign.cn/?s=App.NikeSelect.NikeFetch&re_login='..UIvalues.again
	local data 	= get(getIdUrl);
	if data ~= nil and data~= '' and data ~= 'timeout' then
		log(data)
		if type(data.data) == "table" then
			var.account.login = data.data.email
			var.account.pwd = data.data.password
			var.account.phone = data.data.data.verifiedPhone
			var.account.id = data.data.id
			var.account.first_name_ = data.data.data.firstName
			var.account.last_names_ = data.data.data.lastName
			var.account.address_country = data.data.data.address1
			var.account.token = data.data.token
    
            log('var.account.token')
            log(var.account.token)
            log('var.account.token-end')
            
            if var.account.token then
                if #var.account.token >10 then
                    AccountInfoBack()
                end
            end
            
			local account_txt = "执行至 "..var.account.id .."\n账号 = "..var.account.login.."\n密码 = "..var.account.pwd
			dialog(account_txt,2)
			log(account_txt)
		else
			dialog("暂无帐号", 60*3)
			return false
		end
	end
    delay(2)
end

--用http.get实现下载文件功能
local sz = require("sz")
local cjson = sz.json
local http = sz.i82.http
function downFile(url, path)
    status, headers, body = http.get(url)
    if status == 200 then
        file = io.open(path, "wb")
        if file then
            file:write(body)
            file:close()
            return true
        else
            return -1;
        end
    else
        return status;
    end
end
--还原帐号
function AccountInfoBack()
	local sz = require("sz")
	local json = sz.json
	local appbid = 'com.nike.onenikecommerce'
	local AccountInfo = appDataPath(appbid).."/Documents/ifkc.plist"
    log(AccountInfo);
	local url = 'http://nikeapi.honghongdesign.cn/' .. var.account.token
	downFile(url, AccountInfo)
	toast('下载完成',1)
	mSleep(2000)
end

function main()
    if UIvalues.netMode ~= '3' or Shadowrockets_out()  then
        get_account()
        if UIvalues.netMode == '3' then  
            Shadowrockets()
        end
            
    	if false or login()then
    	    get("http://127.0.0.1:8080/api/reportInfo");
    		if snkrslook() then
    			backId()
    			updateNikeLog('SNKRS复登完成')
    		end
    		closeX(var.bid)
    		delay(2)
    	end

    end
end




















