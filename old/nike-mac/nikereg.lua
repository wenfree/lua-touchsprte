-- 提取codes
-- nikereg

-- Create By TouchSpriteStudio on 02:31:56   
-- Copyright © TouchSpriteStudio . All rights reserved.
	
	
	
	
require("TSLib")
require("tsp")
require("AWZ")


local sz = require("sz")
local json = sz.json


require("other")

var={}
var.bid='com.nike.omega'
var.account={}
var.account.login = ''
var.account.pwd = nil
var.account.address_country = 'CN'
var.account.phone = nil


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
	local getIdUrl = 'http://zzaha.com/phalapi/public/?s=Nikeagain.Again&again='..again..'&name='..'iPhone'..rd(1,50);
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
	Arr.address_xin = var.account.xin
	Arr.address_ming = var.account.ming
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
	Arr.sms = UIvalues.sms
	log(Arr)
	if post(url,Arr)then
		return true
	end
end

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


t={}

local degree = 90
t['登录界面_加入'] = { 0,"92|-55|0xffffff,-78|36|0xffffff,439|-11|0xfefefe,-122|-12|0xffffff,-17|-18|0,-111|-426|0xffffff",degree,14,635,731,1276}
t['创建NIKE帐户_继续按钮'] = { 0xffffff,"-291|-37|0,307|160|0xb80c,-297|182|0xb80c,323|-34|0",degree,16,18,729,1163}
t['创建NIKE帐户_手机帐号'] = { 0xa9a9a9,"-1|13|0xffffff,-1|22|0xa9a9a9,-142|16|0x111111,-184|15|0x111111",degree,10,118,735,778}
t['创建NIKE帐户_发送验证码'] = { 0x111111,"-56|-35|0xe5e5e5,96|37|0xe5e5e5,-55|36|0xe5e5e5",degree,486,251,743,677}
t['创建NIKE帐户_输入验证码'] = { 0xa9a9a9,"-1|21|0xa9a9a9,-100|2|0xadadad,-82|22|0xa9a9a9,-89|19|0xffffff,-191|-52|0xffffff,555|93|0xffffff",degree,1,260,748,954}

t['创建NIKE帐户_注册——填资料'] = { 0xffffff,"-299|-40|0,311|36|0,-291|59|0x8d8d8d,295|137|0x8d8d8d,-239|-237|0x111111",degree,9,340,741,1216}
t['创建NIKE帐户_您已登录——填资料'] = { 0xffffff,"-1|-1|0,-299|-40|0,324|39|0,-291|128|0x8d8d8d,307|51|0x8d8d8d,-14|78|0",degree,21,406,720,1191}
	t['创建NIKE帐户_您已登录——电子邮件地址'] = { 0x8d8d8d,"-152|4|0x919191,-193|-21|0xe5e5e5,443|-15|0xe5e5e5,407|-38|0xe5e5e5",degree,23,546,728,870}

t['步骤——立即开始'] = { 0x111111,"-284|-52|0xffffff,375|-48|0xffffff,373|57|0xffffff,-278|57|0xffffff",degree,21,1147,730,1319}
t['步骤——男女选择'] = { 0xffffff,"-7|2|0,-150|-53|0xffffff,159|213|0xfcfcfc,159|212|0",degree,145,488,620,989}
t['步骤——保存您的鞋码'] = { 0x80808,"1|-1|0xffffff,-677|-2|0xffffff,-672|-2|0",degree,10,44,731,329}
t['步骤——选择感觉兴趣的内容'] = { 0xffffff,"-405|14|0xffffff,-109|13|0",degree,102,107,624,294}

t['NIKE登录成功'] = { 0x111111,"0|5|0xffffff,0|10|0x111111,0|16|0xffffff,0|20|0x111111,30|22|0x111111",degree,163,1242,268,1324}
t['NIKE-首页'] = { 0x111111,"0|6|0xffffff,17|11|0x111111,15|9|0xffffff,-16|-9|0xffffff,-18|-9|0x111111",degree,21,1244,124,1323}

t['弹窗_输入的完成']={ 0x007aff, "-43|-20|0x007aff", degree, 646, 594, 742, 956 } --多点找色


function reg()
	local timeline = os.time()
	local outTimes = 3*60;
	
	var.account.login = mail_rand(rd(2,3))
	if true or UIvalues.password_key == '0' then
		var.account.pwd = myRand(3,1,1)..myRand(3,2,2)..myRand(3,2,2)..myRand(1,3)
		log(var.account.pwd)
	else
		var.account.pwd = UIvalues.password
	end
	
	boxshow('准备注册');

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('登录界面_加入',true)then
			elseif d('创建NIKE帐户_继续按钮')then
				if d('创建NIKE帐户_手机帐号',true,1,3)then
					boxshow('填手机号');
					var.account.phone =  vCode.getPhone()
					if var.account.phone then
						inputword(var.account.phone)
					end
				elseif d('创建NIKE帐户_发送验证码',true,1,2)then
					boxshow('发送验证码');
				elseif d('创建NIKE帐户_输入验证码',true,1,2)then
					log(x..','..y)
					boxshow('输入验证码');
					if d('弹窗_输入的完成')then
						sms = vCode.getMessage()
						if sms then
							log(sms,true);
							inputword(sms);
							delay(2)
							d('弹窗_输入的完成',true)
						else
							return false
						end
					end
				elseif d('创建NIKE帐户_继续按钮',true,1,5)then
					boxshow('继续按钮');
				end
			elseif d('创建NIKE帐户_注册——填资料')then
				boxshow('注册——填资料');	
				local info = {{200,263,0xffffff},{491,400,0xffffff},
								{390,508,0xffffff},
								{371,582,0xffffff},}

				for i,v in ipairs(info)do
					click(v[1],v[2]);
					if i == 1 then
						local str_len = utf8.len(first_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						var.account.xin = utf8.char(utf8.codepoint(first_names,str_rnd + 1,str_rnd + 2))
						clearTxt();
						delay(1);
						input(var.account.xin);
						d('弹窗_输入的完成',true)
					elseif i == 2 then
						local str_len = utf8.len(last_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						var.account.ming = utf8.char(utf8.codepoint(last_names,str_rnd + 1,str_rnd + 2))
						clearTxt();
						input(var.account.ming);
						d('弹窗_输入的完成',true)
					elseif i == 3 then
						clearTxt()
						input(var.account.pwd)
						d('弹窗_输入的完成',true)
					elseif i == 4 then
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
						var.birthday = var.year ..'/'.. var.moon ..'/'.. var.day
						d('弹窗_输入的完成',true)
					end
				end
				d('创建NIKE帐户_注册——填资料',true,1,6);
			elseif d('创建NIKE帐户_您已登录——填资料')then
				boxshow('填资料邮箱');	
				moveTo(360,1046,360,1263,15);
				delay(2);
				if d('创建NIKE帐户_您已登录——电子邮件地址',true,1,2)then
					input(var.account.login);
					d('创建NIKE帐户_您已登录——填资料',true,1,5);
				end
			elseif d('步骤——立即开始',true)then
				boxshow('步骤——立即开始');	
			elseif d('步骤——男女选择')then
				local sex_ = rd(1,2);
				local sex__ = {{374,666,0},{377,818,0},};
				click(sex__[sex_][1],sex__[sex_][2]);
				boxshow('步骤——男女选择');				
			elseif d('步骤——保存您的鞋码')then
				boxshow('步骤——保存您的鞋码');
				local shoes = {{644,479,0},{105,587,0},{210,588,0},{320,587,0},{428,587,0},{528,585,0},{643,585,0},}
				local rd_ = rd(1,7)
				click(shoes[rd_][1],shoes[rd_][2])
			elseif d('步骤——选择感觉兴趣的内容')then
				local choice = {{204,521,0x5b5754},{565,529,0x505721},{185,964,0x92867e},{543,967,0xf0423b},}
				for i,v in ipairs(choice) do
					if rd(1,100)> 20 then
						click(v[1],v[2],2);
					end
				end
				d('步骤——立即开始',true);
			elseif d('NIKE登录成功') or d('NIKE-首页')then
				updateNike();
				return true
			else
				if d('弹窗_输入的完成',true,1)then
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

t['设置界面'] = { 0x1a1a1a,"-3|-7|0xe8e8e8,-1|-9|0x111111,-369|0|0x111111,-358|0|0xffffff,-13|-7|0xf9f9f9",degree,9,43,731,137}
t['设置界面_配送信息'] = { 0xc7c7cc,"-595|-60|0xe5e5e5,-671|-9|0,-671|-8|0xf7f7f7,-611|7|0xffffff,-609|9|0",degree,1,570,745,1190}
t['设置界面_头像相机'] = { 0xffffff,"-37|-21|0xd8d8d8,-35|-25|0xffffff,15|-3|0xd8d8d8,71|-2|0xd8d8d8,-92|-1|0xd8d8d8,-9|80|0xd8d8d8,-12|-84|0xd8d8d8",degree,258,283,489,499}
t['设置界面_头像人头'] = { 0xf7f7f7,"-1|-50|0xf7f7f7,0|-57|0xd8d8d8,1|-76|0xd8d8d8,-81|3|0xd8d8d8,81|5|0xd8d8d8,-2|82|0xf7f7f7,50|51|0xf7f7f7",degree,248,279,500,487}

t['配送信息界面'] = { 0xffffff,"3|-2|0x111111,-13|0|0xffffff,-15|0|0x111111,-396|5|0x111111,313|30|0xffffff",degree,2,38,748,133}
t['配送信息界面_新地址'] = { 0xffffff,"-389|-47|0x121212,132|65|0x121212",degree,12,1044,731,1228}
t['配送信息界面_地址完成'] = { 0xffffff,"4|-23|0x1d1d1d,5|12|0x1d1d1d,624|-1|0x121212,624|-2|0xffffff",degree,11,135,735,440}
t['添加地址界面'] = { 0x111111,"-3|24|0xffffff,7|27|0x111111,-428|10|0x111111,-125|9|0xffffff,261|16|0xffffff",degree,6,39,749,175}
	t['添加地址界面_红色'] = { 0xff0015,"-7|98|0xff0015,-57|45|0xff0015",degree,9,132,736,671}
t['添加地址界面_正确添加'] = { 0xffffff,"-261|-52|0x121212,267|63|0x121212,-309|10|0x121212",degree,13,1000,735,1190}


t['弹窗——验证帐户'] = { 0xc7c7cc,"7|-21|0xc7c7cc,46|-57|0xcccccc,264|39|0xffffff,264|40|0xcccccc",degree,149,437,605,902}
t['弹窗——验证帐户_输密码'] = { 0xffffff,"-138|-45|0x111111,154|0|0x111111,35|51|0x111111,-241|-1|0xffffff,-243|-1|0x111111",degree,144,241,607,691}
t['弹窗_输入地址的完成'] = { 0x111111,"-5|3|0xffffff,-42|3|0x111111",degree,614,648,740,913}

t['弹窗_选择照片'] = { 0,"1|-4|0xefefef,1|-123|0,41|130|0,39|132|0xffffff",degree,231,963,472,1328}
t['弹窗_选择时刻'] = { 0xc7c7cc,"-370|-140|0x111111,-367|-142|0xffffff,-54|-137|0x111111,-56|-144|0xffffff",degree,46,50,743,371}
t['弹窗_选择时刻照片'] = { 0x111111,"-1|3|0xf7f7f7,36|-6|0x111111,328|2|0x111111,331|4|0xffffff,-334|4|0x111111,-329|4|0xffffff",degree,9,49,743,123}
t['弹窗_照片选取'] = { 0xffffff,"3|-5|0x141414,38|-6|0x141414,39|-9|0xffffff,-648|-13|0x141414,-647|-12|0xf3f3f3",degree,12,1219,746,1325}

function readBirthday()
	local timeline = os.time()
	local outTimes = 5*60
	
	local msgbox = 0
	updateNikeLog('准备修正生日');
	local readBirthday = true
	local address = true
	local 设置ok = 0
	local header = true

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('NIKE登录成功') or d('NIKE-首页')then
				d('点击我',true,1,2);
			elseif d('我的界面-设置',false,1)then
				if address or readBirthday then
					d('我的界面-设置',true,1)
				elseif header and d('设置界面_头像相机',true,1,2)then
				elseif header and d('设置界面_头像人头',true,1,2)then
				else
					设置ok = 设置ok + 1
					if 设置ok > 5 then
						updateNikeLog('完成注册');
						return true
					end
				end
			elseif d("设置界面")then
				if readBirthday and d('设置界面——生日')then
					var.birthday = ocr(566,379,744,475);
					var.birthday = string.gsub(var.birthday, "%s+", "")
					var.birthday = string.gsub(var.birthday, "|", "/")
					local moonArr = split(var.birthday,"/")
					var.moon = moonArr[2]
					boxshow(var.birthday);
					updateNike();
					updateNikeLog('修正生日')
					readBirthday = false
				elseif address and d('设置界面_配送信息',true,1,2)then
				else
					click(34,76,2)
				end
			elseif d("配送信息界面")then
				if d("配送信息界面_地址完成")then
					click(40,80,1)
					address = false
				elseif d('配送信息界面_新地址',true)then
				end
			elseif d('添加地址界面')then
				local fix =	{
						{299,211,0xffffff},	--姓
						{658,211,0xffffff},	--名
						{620,332,0xffffff},	--电话
						{420,587,0xffffff},	--省市区
						{426,719,0xffffff},	--街道
						{405,933,0xffffff},	--邮编
					}
				for i,v in ipairs(fix)do
					if d('添加地址界面_红色')then
						break;
					end
					click(v[1],v[2]);
					clearTxt();
					if i == 1 then
						inputStr(var.account.xin or myRand(7,1))
					elseif i == 2 then
						inputStr(var.account.ming or myRand(7,rd(1,2)))
					elseif i == 3 then
						inputword(var.account.phone or myRand(2))
					elseif i == 4 then
						delay(1)
						click_N(121,1181,8)
						click_N(370,1181,5)
						click_N(621,1181,6)
					elseif i == 5 then
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
						inputStr(var.account.address_area)
					elseif i == 6 then
						inputStr('518000')
					end
					delay(1)
					d('弹窗_输入地址的完成',true)
				end
				if d('添加地址界面_正确添加',true,1,5)then
					address = false
				else
					click(40,80)
				end
			else
				if d('弹窗——验证帐户',true,1,3)then
				elseif d("弹窗——验证帐户_输密码",true,1,2)then
					boxshow('密码:'..var.account.pwd);			
					input(var.account.pwd);
					click(493,647,2);
				elseif d('弹窗_选择照片',true)then
					updateNikeLog('设置头像');
					header = false
				elseif d('弹窗_选择时刻',true)then
				elseif d('弹窗_选择时刻照片')then
					moveTo(300,200,300,800-rd(200,600),rd(20,30))	--下滑
					delay(5)
					click(rd(31,723),rd(235,1119))
					click(696, 1265)
				elseif d("弹窗_照片选取",true,1,8)then
				end
			end
		end
		delay(1)
		log('readCode->'..os.time()-timeline)
	end
	
end


t['选购未激活'] = { 0xcccccc,"0|-6|0xffffff,0|-10|0xcccccc,0|10|0xcccccc,36|-3|0xcccccc,22|-3|0xffffff,8|-3|0xcccccc",degree,14,1244,740,1327}


function look()
	local timeline = os.time()
	local outTimes = rd(300,500)
	local 点击次数 = 0
	
	updateNikeLog('注册活跃');

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('选购未激活',true,1,2)then
			elseif d('NIKE登录成功')then
				点击次数 = 点击次数 + 1
				if rd(1,100)>50 then
					moveTo(300,rd(800,900),300,rd(400,500),rd(5,20))
				else
					click(rd(40,600),rd(300,900),rd(2,20))
				end
			else
				click(40,80)
			end
		end
		if 点击次数 > rd(2,10) then
			updateNikeLog('浏览结束');
			return true
		end
		delay(1)
		log('readCode->'..os.time()-timeline)
	end
end


function main()
	if reg()then
		if readBirthday()then
			look()
		end
	end
end













