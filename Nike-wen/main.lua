require("TSLib")
require("tsp")
require("AWZ")
require("nameStr")
require("alz")
require("UI")

local sz = require("sz")
local json = sz.json
local ts = require("ts")



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

function _vCode_zs(User,Pass,PID) --众享平台
    local token,uid,number = "",""
    return {
        login=(function() 
            local RetStr=""
            repeat
                RetStr = httpGet('http://api.jyzszp.com/Api/index/userlogin?uid='..User..'&pwd='..Pass)
			until(string.match(RetStr,"%d+|.+|%w+"))
            token = string.match(RetStr,"|(%w+)$")
         end),
	    getPhone=(function()
            local RetStr=""
            repeat
                RetStr = httpGet("http://api.jyzszp.com/Api/index/getMobilenum?pid="..PID.."&uid="..User.."&token="..token.."&mobile=&size=1")
				if RetStr ~= "" then  RetStr = string.match(RetStr,"^(%d+)|") end
			until(string.len(RetStr) == 11 and RetStr:sub(1,1) == '1')
            number = RetStr
            return number
        end),
	    getMessage=(function()
			local Msg
			mSleep(3000)
			RetStr = httpGet("http://api.jyzszp.com/Api/index/getVcodeAndReleaseMobile?uid="..User.."&token="..token.."&mobile="..number.."&pid="..PID)
			if RetStr then
				local arr = strSplit(RetStr,"|") 
				if #arr >= 3 then Msg = arr[2] end
				if Msg then return Msg end
			end
			toast(tostring(RetStr))
        end),
        addBlack=(function()
            return httpGet("http://api.jyzszp.com/Api/index/addIgnoreList?uid="..User.."&token="..token.."&mobiles="..number.."&pid="..PID)
        end),
    }
end



var={}
var.bid='com.nike.onenikecommerce'
var.account={}
var.account.login = 'bcuvpqbc@hotmail.com'
var.account.pwd = 'Shuai888'

if UIvalues.password_key == '0' then
	var.account.pwd = myRand(4,1,1)..myRand(4,3,2)..myRand(4,5,2)
else
	var.account.pwd = UIvalues.password
end

var.account.phone = '18124522139'
var.looktime = 5
var.wifitime = 30

file_name = '/var/mobile/Media/TouchSprite/lua/back_account.txt'
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
	local url = 'http://39.108.184.74/api/Public/tjj/?service=Nike.address'
	local Arr={}
	Arr.address_mail = var.account.login
	Arr.address_pwd = var.account.pwd
	Arr.address_phone = var.account.phone
--	Arr.address_xin = first_name_
--	Arr.address_ming = last_names_
--	Arr.address_sheng = '广东省'
--	Arr.address_shi = '深圳市'
--	Arr.address_qu = '罗湖区'
--	Arr.address_area = var.account.address_area
	Arr.note = getDeviceName()
	Arr.token = local_token()
	log(Arr)
	if post(url,Arr)then
		return true
	else
		backWirteFile(file_name,var.account.login.."|"..var.account.pwd.."|"..var.account.phone.."\n",'a')
	end
end

function UpFtp()
	local localPath = appDataPath(var.bid).."/Documents/ifkc.plist" --设置 plist 路径
	local NewPath = appDataPath(var.bid).."/Documents/"..var.account.login..".plist" --设置 plist 路径
	copyfile(localPath,NewPath);
	local ftp = sz.ftp--使用 FTP 模块前一定要插入这一句
	_, err = ftp.upload(NewPath, "ftp://admin:AaDd112211@wenfree.cn/token/")--文件名不可使用中文字符
	if err then
		dialog(err, 1)
	else
		dialog("token 文件已上传成功", 1)
		return true
	end
end


function DownFtp()
	local NewPath = "ftp://admin:AaDd112211@39.108.184.74/token/"..var.account.token --设置 plist 路径
	local localPath = appDataPath(var.bid).."/Documents/ifkc.plist"
	local ftp = sz.ftp--使用 FTP 模块前一定要插入这一句
	_, err = ftp.download(NewPath, localPath)--文件名不可使用中文字符
	if err then
		dialog(err, 1)
	else
		dialog("token 文件已下载成功", 1)
	end
end

function backId(state)
	local postUrl = 'http://39.108.184.74/api/Public/tjj/?service=Nike.backId'
	local postArr = {}
	postArr.id = var.account.id
	postArr.state = state
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
	
t['个人页面_照片']={ 0xc7c7cc, "-54|-136|0x007aff,-366|-146|0x000000,-367|-139|0xf9f9f9", 90, 24, 45, 737, 278}	
t['个人页面_时刻']={ 0x1b86fb, "-284|-11|0x000000,-318|7|0x000000,-636|-3|0x007aff", 90, 1, 33, 737, 117}
	
	
t['弹窗_出错了']={ 0xffffff, "3|4|0x000000,-299|48|0x000000,355|-39|0x000000,339|-311|0x363636", 90, 2, 63, 742, 495 } --多点找色	
t['弹窗_出错了_']={ 0x000000, "-238|-16|0xffffff,362|41|0x5c5c5c,360|-263|0x5c5c5c", 90, 95, 498, 743, 839 } --多点找色
t['弹窗_出错了__']={ 0x000000, "-232|-70|0xaaaaaa,200|-70|0xaaaaaa", 90, 100, 402, 654, 1069 } --多点找色
t['登录_出错了']={ 0x363636, "-5|-12|0xffffff,11|14|0x363636,8|230|0xfe0000", 90, 567, 33, 732, 556 } --多点找色


t['弹窗_选择照片']={ 0x007aff, "-87|-5|0x007aff,-128|-6|0x007aff,-124|-7|0xf9f9f9", 90, 233, 976, 491, 1051}
t['弹窗_照片确认选取']={  0xffffff, "-2|2|0x141414", 90, 680, 1253, 699, 1267}
t['弹窗_密码无效']={  0x000000, "40|6|0x000000,121|334|0x000000,121|336|0xffffff,123|338|0x000000,34|203|0x000000,35|203|0xffffff", 
								90, 110, 457, 641, 868}

function errors()
	if d('弹窗_选择照片',true)then
	elseif d('弹窗_照片确认选取',true)then
	elseif d('弹窗_出错了',true)then
	elseif d('错误_未中签',true)then
	elseif d('登录_出错了',true)then
	elseif d('弹窗_出错了',true)then
	elseif d('弹窗_出错了__',true)then
		click(29,80)
		moveTo(300,200,300,733,rd(5,20))
		delay(2)
		click(29,80)
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
	local mail_suffix = mailheader[math.random(#mailheader)]
	if(mail_suffix == "@qq.com") then
		char = string.sub(char,1,10)
	end
	for var = 1,length do
		rnd = math.random(1,string.len(char))
		s = string.sub(char,rnd,rnd+1)
		string = string..s
	end
	return string..os.date("%S")..mail_suffix;
end

function reg()
	local timeline = os.time()
	local outTimes = 10*60
	local 取号 = true
	local 验证码 = false
	local sms = nil
	local 登录 = false

	firstUp = true
	local sendsms = 0
	
	var.account.login = mail_rand(rd(7,10))
	if UIvalues.password_key == '0' then
		var.account.pwd = myRand(4,1,1)..myRand(4,3,2)..myRand(4,5,2)..myRand(1,2)
	else
		var.account.pwd = UIvalues.password
	end

	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('开屏登录',true,2)then
			elseif d('登录Nike+帐号') or d('登录Nike+帐号_红框') then
				if 取号 then
					var.account.phone =  vCode.getPhone()
					if var.account.phone then
						if d('登录Nike+帐号_手机号码',true)then
							inputword(var.account.phone)
							取号 = false
							验证码 = true
						end
					end
				elseif 验证码 then
					if d('登录Nike+帐号_发送验证码')then
						sendsms = sendsms + 1
						if sendsms >= 2 then
							return false
						else
							if d('登录Nike+帐号_发送验证码',true)then
								
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
					end
				elseif 登录 then
					d('登录Nike+帐号_继续',true)
				end
			elseif d('注册返回界面')then
				local NameAndPwd ={{191,420,0xffffff},{554,427,0xffffff},{320,523,0xffffff},}
				for i,v in ipairs(NameAndPwd) do
					click(v[1],v[2])
					if i == 1 then
						local str_len = utf8.len(first_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						first_name_ = utf8.char(utf8.codepoint(first_names,str_rnd + 1,str_rnd + 2))
						input('\b\b\b\b\b\b\b\b\b\b')
						input(first_name_)
						d('弹窗_输入的完成',true)
					elseif i == 2 then
						local str_len = utf8.len(last_names)
						local str_rnd = (math.random(1,str_len) -1) * 3
						last_names_ = utf8.char(utf8.codepoint(last_names,str_rnd + 1,str_rnd + 2 + rd(0,1)*3 ))
						input('\b\b\b\b\b\b\b\b\b\b')
						input(last_names_)
						d('弹窗_输入的完成',true)
					elseif i == 3 then
						input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
						input(var.account.pwd)
						d('弹窗_输入的完成',true)
					end
					delay(1)
				end
				local sex ={{220,760,0x8d8d8d},{510,760,0x131313},} --男,女
				click(sex[rd(1,2)][1],sex[1][2])
				click(126,867)
				d('注册返回界面',true)
			elseif d('输入您的生日')then
				click(182,404,2)
				if d('弹窗_输入的完成')then
					for i=1,rd(9,13) do
						click(228,1001,0.3)
					end
					for i=1,rd(2,5)do
						click(366,1002,0.2)
					end
					for i=1,rd(2,5)do
						click(515,1004,0.2)
					end
				end
				if d('弹窗_输入的完成',true)then
					click(  373,  562)
					d('输入您的生日',true)
				end

			elseif d('输入您的电子邮件')then
				click(639,408)
				input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
				input(var.account.login)
				delay(1)
				d('输入您的电子邮件',true)
				backWirteFile(file_name,var.account.login.."|"..var.account.pwd.."|"..var.account.phone.."\n",'a')
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
				elseif d('个人页面_通知开启')then
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
					
					elseif d('个人页面_鞋码选择',true)then
						if d('个人页面_鞋码滑表')then
							for i=1,rd(1,6) do
								click(374,1116,0.5)
							end
						end
						if d('个人页面_鞋码滑表',true)then
							delay(2)
							moveTo(300,900,300,300,20)
							delay(3)
						end
					end
					d('个人页面_通知设置',true)
					delay(1)
					d('个人页面_启动通知',true)
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
					errors()
				end
			end
		end
		delay(1)
	end
end



t['错误_登录失败']={ 0xfe2020, "249|-7|0xfe0000,324|-2|0xfe0000", 90, 20, 140, 723, 703 } --多点找色
t['错误_选对国家']={ 0x000000, "-72|-5|0xffffff,-339|1|0x000000,340|49|0xb2b2b2", 90, 8, 48, 733, 165 } --多点找色
t['错误_未中签']={ 0xffffff, "8|-9|0xffffff,-1|-22|0x545455,-23|0|0x545454,22|0|0x545454,-1|22|0x535354", 90, 564, 16, 744, 131 } --多点找色
t['错误_验证手机号']={ 0xefefef, "537|-6|0xe5e5e5,-22|329|0x000000,604|252|0x000000", 90, 36, 448, 714, 827 } --多点找色

function login()
	local timeline = os.time()
	local outTimes = 3*60
--	log(UIvalues.day)
--	getIdUrl = 'http://wenfree.cn/api/Public/tjj/?service=Nike.getbydi'
	getIdUrl = 'http://39.108.184.74/api/Public/tjj/?service=Nike.getId&day='..UIvalues.day.."&again="..UIvalues.again
	
	local data 	= get(getIdUrl);
	if data ~= nil then
		log(data)
		if type(data.data) == "table" then
			var.account.login = data.data.address_mail
			var.account.pwd = data.data.address_pwd
			var.account.phone = data.data.address_phone
			var.account.id = data.data.id
--			log('data.data.token'..data.data.token )
	

			if type(data.data.token) == 'string' and UIvalues.work == "1" then 
				var.account.token = data.data.token
				local localPath = appDataPath(var.bid).."/Documents/ifkc.plist"
				downFile(var.account.token, localPath)
			else
				var.account.token = ''
			end
			dialog("执行至 "..var.account.id .."\n账号 = "..var.account.login.."\n密码 = "..var.account.pwd,2)
		else
			dialog("暂无帐号", 60*3)
			return false
		end
	end
	
	local loginKey = true
	local pwdKey = true
	
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('开屏登录',true)then
				delay(5)
			elseif d('错误_验证手机号')then
--				backId('封号')
				var.account.phone =  vCode.getPhone()
				if var.account.phone then
					
					t['验证你的手机号_手机号码']={ 0xadadad, "11|-9|0xffffff,24|-10|0xa9a9a9", 90, 155, 481, 327, 527}
					
					if d('验证你的手机号_手机号码',true)then
						inputword(var.account.phone)
						delay(3)
					end
				end
				
				t['验证你的手机号_发送验证码']={ 0x111111, "3|2|0xe5e5e5,7|6|0x111111", 90, 535, 376, 686, 435}
				
				if d('验证你的手机号_发送验证码')then
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
				if d('验证你的手机号_继续',true)then
					delay(rd(8,10))
				end

				
			elseif d('登录Nike+帐号')then
				if d('登录Nike+帐号_使用电子邮件登录',true)then
				elseif loginKey and d('登录Nike+帐号_电子邮件',true)then
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(var.account.login)
					loginKey = false
				elseif pwdKey and d('登录Nike+帐号_密码',true)then
					input(var.account.pwd)
					pwdKey = false
				else
					if d('登录Nike+帐号',true)then
						delay(rd(8,10))
					end
				end
			elseif d('主菜单_首页') then
--				if string.len(var.account.token) < 5 then
--					updateNike()
--					delay(rd(2,5))
--				end
				return true
			elseif d('错误_登录失败')or d('错误_选对国家') then
--				backId('封号')
				return false
			else
				log('tips')
				if d('弹窗_输入的完成',true)then
				else
					if errors()then
						click(705,41)
					end
				end
			end
		end
		delay(1)
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


function buy()
	local timeline = os.time()
	local outTimes = 10*60
	
	local stateKey = '精选'
	local showmode = '小图'
	local lookPage = false
	local liksreds = false
	local frisdown = true
	local hotSalls = 0
	local 精选times = 0
	local but_other_tips = 0
	local share_key = true
	
	
	while os.time()-timeline < outTimes do
		if active(var.bid,3) then
			if d('主菜单_首页') then
				if d('精选激活中')then
					stateKey = '精选'
					if 精选times == 0 then
						moveTo(300,300,300,300+rd(300,500),rd(5,20))
						精选times = 1
					end
					delay(rd(5,8))
					click(366,90)
				elseif d('热卖激活中',true)then
					stateKey = '热卖'

					hotSalls = hotSalls + 1
					if hotSalls > 10 then
						closeApp(var.bid)
						delay(1)
						hotSalls = 0
					end

					if d('热卖激活中_切换模式',true)then
					elseif showmode == '大图' then
						for i=1,rd(3,20) do
							moveTo(300,900,300,900-rd(300,500),rd(5,20))
							delay(rd(10,20)/100)
							log('向下滑动',true)
						end
						delay(2)
						if not(d('热卖激活中_没有第二个商品'))then
							d('热卖激活中_大图模式',true)
						end
					elseif d('热卖激活中_大图模式') then
						showmode = '大图'
					end
				elseif liksreds and d('鞋子详情页面')then
					log('liksreds')
					if d('鞋子详情页面_下单按钮')then
						click(82,1187)
					else
						click(82,1187)
					end
				elseif lookPage then
					log('lookPage')
					if liksreds then
						if d('鞋子详情页面_下单按钮',true)then
						else
							moveTo(300,300,300,300+rd(500,600),rd(10,30))
						end
					elseif d('鞋子详情页面_心',true)then
					elseif d('鞋子详情页面_心_点亮')then
						if share_key then
							if d("分享按钮",true)then
								delay(3)
								t["微信朋友圈"]={ 0x9fce16, "-212|-35|0x3bbb07,223|45|0xf9cb1e", 90, 18, 935, 733, 1319}
								if d('微信朋友圈',true)then
									delay(8)
									t["发表按钮"]={ 0x07c160, "1|-9|0xffffff,-5|-21|0x07c160", 90, 542, 42, 744, 139}
									if d("发表按钮",true)then
										delay(5)
									end
									share_key = false
								end
							end
						else
							for i=1,rd(2,3) do
								moveTo(300,300,300,600+rd(300,500),rd(15,20))
								delay(1)
							end
							liksreds = true
						end
					else
						if d('未收藏的鞋子',true)then
							showmode = '小图'
						else
							moveTo(300,900,300,900-rd(200,300),rd(5,10))
							delay(2)
						end
					end
				elseif d('鞋子详情页面')then
					lookPage = true
				elseif showmode == '大图' then
					for i=1,rd(2,5) do
						moveTo(300,900,300,900-rd(300,500),rd(5,20))
						delay(2)
					end
					log('准备找鞋子')
					if d('未收藏的鞋子',true)then
						showmode = '小图'
					end
				elseif showmode == '小图' then
					moveTo(300,500,300,500+rd(300,500),rd(5,20))
					delay(2)
				end
			elseif d('搜索页面_取消',true)then
			elseif d('为你的订单付款_x',true) or d("为你的订单付款_x_wechat",true) then
--				updateNike()
				return true
			else
				log('tips-buy')
				if d('弹窗_右上角的x',true)then
				elseif d('弹窗_普通达',true)then
				elseif d('弹窗_删除错误地址',false)  and d('弹窗_删除错误地址_红色框')then
					
					for i = 4,6 do
						delay(2)
						if i == 4 then
							click(  139,  650,2)
							clici__i = rd(1,30)
						elseif i == 5 then  
							click(  354,  650,2)
							clici__i = rd(1,6)
						elseif i == 6 then
							click(    608,  653,2)
							clici__i = rd(1,6)
						end
						for i_=1,clici__i do
							click(382,1181,0.5)
						end
						d('弹窗_输入地址的完成',true)
					end
					
					t['修改地址_完成']={ 0xffffff, "0|-2|0x1a1a1a,-329|-48|0x1a1a1a,353|45|0x1a1a1a", 90, 13, 1122, 720, 1326}
					d('修改地址_完成',true)
					delay(3)
				
				elseif d('弹窗_立即购买弹窗',false)then
					t["支付宝"]={ 0x00aaef, "8|-13|0xffffff,13|-15|0x00aaef", 90, 509, 710, 734, 799}
					t["支付宝微信"]={ 0x00c800, "-1|-131|0x01aaef,-2|-136|0xffffff", 90, 22, 782, 364, 999}
					local playKey = math.random(1,100)
					if d('支付宝',true)then
						delay(2)
						if playKey >= 30 then
							d('支付宝微信',true)
						end
						d('弹窗_立即购买弹窗',true)
					end
					d('弹窗_立即购买弹窗',true)
				elseif d('弹窗_添加配送地址',true)then
				elseif d('弹窗_继续选择码_继续黑') and d('弹窗_添加配送地址_上部分')then
					local inputf = function(txt)
									input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
--									inputText(txt)
									inputStr(txt)
									d('弹窗_输入地址的完成',true)
									end
					local loc ={{323,440,0xffffff},{694,444,0xffffff},{673,574,0xffffff},
								{139,703,0xffffff},{402,705,0xf7f7f7},{651,703,0xf7f7f7},
								{629,837,0xffffff},{624,1097,0xffffff},} 
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
							input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
							inputword(var.account.phone or myRand(2))
							d('弹窗_输入地址的完成',true)
						elseif i == 4 or i == 5 or i == 6 then
							delay(2)
							if i == 4 then
								clici__i = rd(1,30)
							elseif i == 5 then
								clici__i = rd(1,6)
							elseif i == 6 then
								clici__i = rd(1,6)
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
					d('弹窗_继续选择码_继续黑',true)		
				elseif d('弹窗_继续选择码') and d('弹窗_继续选择码_上部分')then
					if d('弹窗_继续选择码_随机可选',true)then
					else
						click(29,80)
						moveTo(300,200,300,733,rd(5,20))
						delay(2)
						click(29,80)
					end
				elseif d('弹窗_继续选择码_继续黑') and d('弹窗_继续选择码_继续黑_编辑',true)then
				elseif d('弹窗_继续选择码_继续黑',true)then					
				elseif d('弹窗_输入地址后上拉一下')then
					moveTo(300,1215,300,733,rd(5,20))
				elseif d('弹窗_请输入密码')then
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
--					inputStr(var.account.pwd)
					inputword(var.account.pwd)
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(var.account.pwd)
					delay(1)
					d('弹窗_请输入密码',true)
				elseif d('弹窗_输入地址的完成',true)then
				elseif d('弹窗_密码无效')then
					backId('封号')
					return false
				else
					if d('弹窗_填地址_上滑了',true)then
					elseif d('弹窗_卖光了',true)then
						click(29,80)
						moveTo(300,200,300,733,rd(5,20))
						delay(2)
						click(29,80)
					else
						if errors()then
						but_other_tips = but_other_tips + 1
							if but_other_tips % 10 == 0 then
								moveTo(300,200,300,900-rd(200,300),rd(5,10))
								click(29,80)
							end
							log('~')
						end
					end
				end
				
			end
		end
		delay(1.5)
	end
end

--d('弹窗_现在不用',true)
--input('s8r60593ue3p@icloud.com')
----sys.clear_bid(var.bid)
----login()
--buy()
--lua_exit()
--dataPath = appDataPath(var.bid)
--log(dataPath)
--d('弹窗_输入的完成')
--d('登录Nike+帐号')

--delay(2)
--inputword('Shuai888')
--input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b')

--input('Shuai888')

--lua_exit()

if UIvalues.smsPT == "0" then
	vCode = _vCode_hy()
else
	vCode  = _vCode_gx('s-o7u5ut4x','Shuai888','10395')
end
vCode.login()

function main()
	while (true) do
		if UIvalues.clearMode == '0' then
			sys.clear_bid(var.bid)
		elseif UIvalues.clearMode == '1' then
			awzNew()
		elseif UIvalues.clearMode == '2' then
			awz_()
		end

		if UIvalues.work == "0" then
			if reg()then
				buy()
				closeX(var.bid)
				delay(2)
			end
		elseif UIvalues.work == "1" or UIvalues.work == "2" then
			if login()then
				if buy()then
					backId()
				end
				closeX(var.bid)
				delay(2)
			end
		end
		
		if UIvalues.netMode == '1' then
			setAirplaneMode(true)
			delay(tonumber(UIvalues.wifitime))
			setAirplaneMode(false)
			delay(30)
		elseif UIvalues.netMode == '0' then
			vpn()
		end
	end
end

while (true) do
	local ret,errMessage = pcall(main)
	if ret then
	else
		dialog(errMessage, 15)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end





















