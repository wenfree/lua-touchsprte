-- 提取codes
-- main.lua  

-- Create By TouchSpriteStudio on 02:31:56   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
	
	
require("TSLib")
require("tsp")


local sz = require("sz")
local json = sz.json


require("other")



var={}
var.bid='com.nike.omega'
var.account={}
var.account.login = ''
var.account.pwd = ''
var.account.address_country = 'CN'
var.account.phone = ''

w,h = getScreenSize();

function boxshow(txt,x1,y1,x2,y2)
	local x1 = x1 or 0
	local y1 = y1 or 0
	local x2 = x2 or 300
	local y2 = y2 or 30
	adbox__ = adbox__ or 0
	if adbox__ == 0 then
		adbox__ = 1
		fwShowWnd("wid",w/2+50,0,w/2+300,50,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"left","FF0000","FFDAB9",10,0,x1,y1, x2,y2,0.5)
	--fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
end

function backId()
	local postUrl = 'http://zzaha.com/phalapi/public/'
	local postArr = {}
	postArr.s = 'Nikeback.Back'
	postArr.id = var.account.id
	log(post(postUrl,postArr))
end

function disable()
	local postUrl = 'http://zzaha.com/phalapi/public/'
	local postArr = {}
	postArr.s = 'Nikeback.disable'
	postArr.id = var.account.id
	log(post(postUrl,postArr))
end

function getLogin(again)
	local getIdUrl = 'http://zzaha.com/phalapi/public/?s=Nikeagain.Again&again='..again..'&sms=old&name='..'iPhone'..rd(1,50);
	local data 	= get(getIdUrl);
	if data then return data end;
end

function updateNikeLog(workstate)
	local sz = require("sz")
	local url = 'http://zzaha.com/phalapi/public/'
	local Arr={}
	Arr.s = 'Nikesave.Save'
	Arr.address_mail = var.account.login
	Arr.workstate = workstate
	post(url,Arr)
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
	Arr.iphone = 'iPhone'..rd(1,50)
	Arr.imei = sz.system.serialnumber()
	Arr.birthday = var.birthday
	Arr.moon = var.moon
	Arr.codes = var.codes
	log(Arr)
	if post(url,Arr)then
		return true
	end
end

t={}

local degree = 90

t['弹窗_输入的完成']={ 0x007aff, "-43|-20|0x007aff", 90, 646, 594, 742, 956 } --多点找色
t['弹窗_验证你的手机号'] = { 0x111111,"-400|1|0x111111,-175|31|0xffffff,-503|579|0,29|319|0xe5e5e5,114|651|0",degree,26,107,721,843}
t['弹窗_保存您的鞋码'] = { 0x80808,"1|-1|0xffffff,-677|-2|0xffffff,-672|-2|0",degree,10,44,731,329}
t['弹窗_选择语言-确定'] = { 0x121212,"237|-55|0xffffff,233|56|0xffffff,-276|-53|0xffffff,-282|55|0xffffff",degree,21,1100,730,1321}
t['弹窗_选择感觉兴趣的内容'] = { 0xffffff,"-405|14|0xffffff,-109|13|0",degree,102,107,624,294}
t['弹窗_验证你的手机号2'] = { 0xefefef,"324|7|0xffffff,458|-26|0xe5e5e5,553|247|0,-66|302|0",degree,36,358,734,912}

t['登录']={0xffffff,"-46|12|0xffffff,-341|0|0,-321|18|0",degree,128,1095,523,1150}
t['登录界面'] = { 0x171717,"-268|99|0xffffff,-293|72|0xb80c,318|137|0xb80c",degree,25,551,733,1089}
	t['登录界面——使用电子邮件登录'] = { 0x8d8d8d,"-42|-199|0x111111,-42|-194|0x111111,-44|-196|0xefefef,-42|-189|0x111111",degree,42,249,320,564}
	t['弹窗——红色'] = { 0xfe0000,"-43|-38|0xfe0000,-38|41|0xfe0000,-3|-4|0xffffff",degree,12,85,728,593}
--		452,308
--		457,415
t['立即开始'] = { 0x111111,"-284|-52|0xffffff,375|-48|0xffffff,373|57|0xffffff,-278|57|0xffffff",degree,21,1147,730,1319}
t['登录成功'] = { 0x111111,"0|5|0xffffff,0|10|0x111111,0|16|0xffffff,0|20|0x111111,30|22|0x111111",degree,163,1242,268,1324}


t['弹窗_密码错误'] = { 0xfe3131,"154|0|0xfe0000,152|0|0xffffff,328|-5|0xfe1414",degree,38,79,416,535}


function login()
	local timeline = os.time()
	local outTimes = 3*60
	
	local data 	= getLogin(0);
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
			dialog("暂无帐号", 60*3)
			return false
		end
	end
	
	updateNikeLog('正在登录');

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('登录界面')then
				if d('登录界面——使用电子邮件登录',true)then
				elseif d('弹窗_密码错误')then
					disable();
					updateNikeLog('密码错误');
					return false;
				else
					click(452,308,3);
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b');
					input(var.account.login);
					updateNikeLog('输入帐号');
					click(457,415,3);
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(var.account.pwd);
					updateNikeLog('输入密码');
					d('弹窗_输入的完成',true);
					d('登录界面',true,1,5);
					updateNikeLog('正在登录');
				end
			elseif d('登录',true)then
				updateNikeLog('进入登录');
			elseif d('弹窗_选择语言-确定',true)then
			elseif d('立即开始',true)then
				updateNikeLog('下一步')
			elseif d('弹窗_保存您的鞋码')then
				local shoes = {
					{644,479,0},
					{105,587,0},
					{210,588,0},
					{320,587,0},
					{428,587,0},
					{528,585,0},
					{643,585,0},
				}
				local rd_ = rd(1,7)
				click(shoes[rd_][1],shoes[rd_][2])
			elseif d('登录成功')then
				updateNikeLog('登录成功');
				return true
			elseif d('弹窗_验证你的手机号') or d('弹窗_验证你的手机号2') then
				updateNikeLog('验证你的手机号码');
				boxshow('验证手机',0,0,200,30);
				disable()
				return false
			elseif d('弹窗_选择感觉兴趣的内容')then
				click(212,498);
				d('立即开始',true);
			else
				if d('弹窗——红色')then
					click(686,82,2)
				elseif d('弹窗_密码错误')then
					disable();
					return false;
				end
			end
		end
		delay(1)
		log('login->'..os.time()-timeline)
	end
end


t['点击我'] = { 0xcccccc,"1|-10|0xffffff,0|-19|0xcccccc,2|15|0xffffff,18|7|0xcccccc",degree,642,1252,722,1324}
t['收件箱'] = { 0x111111,"-7|-1|0xffffff,-15|181|0x111111,-14|172|0xffffff,1|196|0x111111",degree,604,1056,725,1325}
t['收件箱_1'] = { 0xfa5401,"59|18|0x111111,1|43|0xfa5401",degree,530,951,731,1229}
t['收件箱界面'] = { 0x111111,"0|11|0xffffff,15|16|0x111111,-642|-1210|0x111111,-629|-1211|0xffffff",degree,12,44,734,1329}
	t['收件箱界面——生日快乐'] = { 0xc9b8ea,"8|26|0xd8ace0,-9|23|0xffffff",degree,15,138,217,1232}
t['会员生日专属福利'] = { 0,"-469|-12|0x7aff,-480|0|0x7aff,-468|13|0x7aff",degree,7,43,516,121}
	t['会员生日专属福利——code'] = { 0xffffff,"-23|-57|0xe5e5e5,-41|62|0xe5e5e5,479|62|0xe5e5e5,462|-57|0xe5e5e5,188|-7|0x111111",degree,17,138,720,1319}
	
t['我的界面-设置'] = { 0xcccccc,"-1|-11|0xffffff,-187|-21|0xcccccc,-189|-6|0xffffff,-570|-9|0xcccccc,-580|-19|0xffffff",degree,20,383,732,1109}
t['设置界面——生日'] = { 0xff841f,"-4|11|0xff8521",degree,553,361,741,515}
t['设置界面——没有生日'] = { 0x1d1d1d,"304|-357|0x111111,301|-355|0xffffff,-64|-348|0x111111,-54|-347|0xffffff",degree,8,40,740,617}

var.account.login = 'bcyzjkrstuuv9adelm57@vvccb.com'
var.account.pwd = 'ZOOTqmebbf6293'



function ocr(x1,y1,x2,y2)
	local ress = ocrText(x1,y1,x2,y2, 0) or 0
	if ress == '' then
		nLog('nil')
		return 0
	end
	return ress
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


t['设置界面'] = { 0x1a1a1a,"-3|-7|0xe8e8e8,-1|-9|0x111111,-369|0|0x111111,-358|0|0xffffff,-13|-7|0xf9f9f9",degree,9,43,731,137}
t['设置界面-有生日'] = { 0xff8522,"0|-1|0xff841f",degree,522,329,744,597}
t['设置界面-有生日上'] = { 0xff841f,"0|-1|0xff841f",degree,588,250,742,360}
t['设置界面-生日无'] = { 0x1d1d1d,"61|-16|0xf8f8f8,63|-17|0x1d1d1d",degree,12,260,159,345}

t['我的界面'] = { 0x111111,"-1|-11|0xffffff,-1|-20|0x111111,-17|16|0x111111,12|12|0xffffff,16|12|0x111111",degree,622,1244,727,1322}
t['我的界面_你的专属福利'] = { 0x111111,"-4|0|0xffffff,-459|-15|0x1d1d1d,-463|-15|0xffffff,-478|-15|0x1d1d1d,-642|-7|0x1d1d1d",degree,20,495,731,1194}
t['你的专属福利_生日快乐'] = { 0xcb62c2,"-207|-137|0xdadada,-183|-159|0xf9f9f9,268|20|0xd8d8d8",degree,71,259,691,1102}
t['会员生日专属福利2'] = { 0x111111,"332|1|0xffffff,334|3|0x111111,457|0|0x111111,466|0|0x111111",degree,6,48,740,122}

function readCode()
	local timeline = os.time()
	local outTimes = 2*60
	
	local msgbox = 0
	updateNikeLog('准备读码');
	local readBirthday = true
	var.codes =  '';

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('登录成功')then
				d('点击我',true,1,2);
			elseif readBirthday and d('我的界面-设置',true,1)then
--			elseif d('收件箱',true)then
--			elseif d('收件箱_1',true)then
			elseif d('设置界面')then
				if readBirthday and d('设置界面-有生日')then
					var.birthday = ocr(566,379,744,475);
					var.birthday = string.gsub(var.birthday, "%s+", "")
					var.birthday = string.gsub(var.birthday, "|", "/")
					local moonArr = split(var.birthday,"/")
					var.moon = moonArr[2]
					boxshow(var.birthday);
					updateNike();
					updateNikeLog('修正生日')
					backId();
					readBirthday = false
				elseif readBirthday and d('设置界面-有生日上')then
					var.birthday = ocr(555,254,746,361);
					var.birthday = string.gsub(var.birthday, "%s+", "")
					var.birthday = string.gsub(var.birthday, "|", "/")
					local moonArr = split(var.birthday,"/")
					var.moon = moonArr[2]
					boxshow(var.birthday);
					updateNike();
					updateNikeLog('修正生日')
					backId();
					readBirthday = false
				elseif readBirthday and d('设置界面-生日无',true,1,2)then
					click_random(227,1005,rd(8,12))
					click_random(367,1053,rd(2,3))
					click_random(521,1053,rd(2,3))
					click(678,859,5)
				else
					click(40,80,2)
				end
			elseif d('我的界面')then
				if d('我的界面_你的专属福利',true,1,2)then
				else
					moveTo(300,800,300,500,20)
					delay(1)
				end
			elseif d("会员生日专属福利") or d('会员生日专属福利2')then
				if d('会员生日专属福利——code',true,2)then
					var.codes = readPasteboard();
					updateNike()
					updateNikeLog('读码成功');
					return true
				else
					moveTo(300,800,400,500,10)
					delay(2)
				end
			elseif d('你的专属福利_生日快乐',true,1,2)then
			end
		end
		delay(1)
		log('readCode->'..os.time()-timeline)
	end
	
end

w,h = getScreenSize();
function delay(times)
	local times = times or 1
	local timeLine = os.time()
	
	while os.time() - timeLine <= times do
		mSleep(1000)
		if (times-(os.time() - timeLine) > 3) then
			local text = "倒计时->「".. times-(os.time() - timeLine) .."」"
--			log("倒计时->「".. times-(os.time() - timeLine) .."」",true)
			boxshow(text,0,0,200,30);
		end
	end
end



function all()
	
	setWifiEnable(false)
	setAirplaneMode(true)
	delay(10)
	setAirplaneMode(false)
	delay(30)
			
	if true or vpn()then
		sys.clear_bid(var.bid);
		if login()then
			readCode()
		end
	end

	delay(2)
end


while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		log(errMessage)
		dialog(errMessage, 15)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end





















