-- nike
-- Function.lua  

-- Create By TouchSpriteStudio on 18:09:27   
-- Copyright © TouchSpriteStudio . All rights reserved.

function stringRandom(str,num,offset)
	offset = offset or 1
	local len  = string.len(str)/offset
	local strRandom = ""
	for i = 1,num do
		local index = math.random(1,string.len(str)/offset)
		local char = string.sub(str, index, index+offset-1)
		strRandom = strRandom..char
	end 
	return strRandom
end 
function DMGetPhone()
	local url = "http://api.smskkk.com/api/do.php"
	local par = "?action=getPhone&sid=1018&token=ln7l0nmn7w7600vvwpwpqk557oov5lb5"
	while true do
		local code, header, body = http.tsget(url..par)
		if code == 200 then 
			local b = string.split(body,"|")
			local status = b[1]
			local msg = b[2] --pid
			local location = b[3]
			if status == "1" then 
				return msg,location
			else
				if msg then sleepLong(10,"[DMGetPhone] err:"..msg) end 
			end 
		else 
			Showlog("[DMGetPhone] err code:"..code)
		end 
		sys.msleep(2000)
	end 
end 

function DMGetMsg(phone)  --获取手机短信
	--sid=项目id&phone=取出来的手机号&token=登录时返回的令牌&author=软件作者 用户名(这里是传作者注册时的用户名)。
	local url = "http://api.smskkk.com/api/do.php"
	local par = "?action=getMessage&sid=1018&token=ln7l0nmn7w7600vvwpwpqk557oov5lb5&phone=" .. phone
	while true do
		local code, header, body = http.tsget(url..par)
		if code == 200 then 
			local b = string.split(body,"|")
			local status = b[1]
			local msg = b[2]
			if status == "1" then  
				if string.find(msg,"手机验证码是")~=nil then msg = string.match(msg,".-手机验证码是.-(%d+).-") end 
				return msg
			else 
				if msg then sleepLong(5,"[DMGetMsg] err:"..msg) end 
				return ""
			end 
		else 
			Showlog("[DMGetMsg] err code:"..code)
		end 
		sys.msleep(5000)
	end 
end 
function sleepLong(sleep,why) --长延迟 单位秒
	for i=1, sleep do
		Showlog("wait "..i.."/"..math.floor( sleep).." err:"..why)
		sys.msleep(1000)
	end 
end 

function Showlog(strs, is_msg,is_alert,is_err) -- 打印信息
	if strs ==nil then return end
	is_msg = is_msg or true; 
	is_alert = is_alert or false; 
	is_err = is_err or false;
	strs = mlog(strs)
	if is_msg == true then sys.toast(strs) end
	if is_alert == true then sys.alert(strs,2) end
	if is_err == true then 
		local errMsg = '+++【严重错误】+++ \r\n +++【严重错误】+++ \r\n +++【严重错误】+++ \r\n +++【严重错误】+++ \r\n +++【严重错误】+++ \r\n'
		dialog(errMsg..strs) lua_exit()
	end 
	local logPath = userPath().."/log/脚本日志.log"
	local logs = readFileString(logPath)
	if type(logs) == "string" then 
		if #logs>=5000 then writeFileString(logPath,"",'w',1) end 
	end 
	strs= '['..os.date("%H:%M:%S", os.time()).."]:"..strs
	writeFileString(logPath,strs,'a',1)
	log(strs)
end
--深度打印一个表
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = "..tostring(t).." {")
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent..'["'..pos..'"] = "'..val..'",')
					else
						nLog(indent..'["'..pos..'"] = "'..tostring(val)..'"')
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog(tostring(t).." {")
		sub_print_r(t,"  ")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end
------打印----
function PrintTable(table , level,key)
	level = level or 1
	key = key or ""
	local str = ""
	local function getindent(l)
		local indent = ""
		for i = 1, l do
			indent = indent.."\t"
		end
		return indent
	end
	if key ~= "" then
		str = str..getindent(level-1)..'['..key..']'.." ".."=".." ".."{  --table \n"
	else
		str = str..getindent(level-1) .. "{ --table \n"
	end
	for k,v in pairs(table) do
		if type(v) == "table" then
			key = k
			str = str..PrintTable(v, level + 1,key).."\n"
		else
			local sk = ""
			if type(k) == "string" then sk = '["'..k..'"]'  end 
			if type(k) == "number" then sk = '['..k..']'  end
			if type(v) == "string" then sv = '"'..v..'"' else sv = tostring(v)  end
			local content = string.format("%s%s = %s,", getindent(level),tostring(sk), tostring(sv))
			str = str..content.."\n"
		end
	end
	if level == 1 then  str = str..getindent(level-1) .. "}" else  str = str..getindent(level-1) .. "}," end
	return str
end
--log深度打印日志
function log(txt,show,times)
	local times = 1
	if txt == nil or txt == "" then
		nLog("nil")
		return
	end
	if type(txt) == 'table' then
		print_r(txt)
		return
	end
	if show == 'all' then
		toast(txt,times)
		nLog(txt)
	elseif show then
		toast(txt,times)
	else
		nLog(txt)
	end
end
function mlog(...)
	local args = {...}
	local ret = ""
	for i=1,#args do
		local logs = ""
		if type(args[i]) == "table" then
			logs= PrintTable(args[i])
		elseif type(args[i]) == "string" then 
			logs = tostring(args[i])
			if tostring(args[i]) == "nil" then logs = "nil" end 
			if tostring(args[i]) == "" then logs = "空" end 
		elseif type(args[i]) == "number" then 
			logs = tostring(args[i])
		elseif type(args[i]) == "boolean" then 
			logs = tostring(args[i])
		else
			logs = "不支持的打印类型 ".. tostring(type(args[i]))
		end  
		ret = ret == '' and logs or ret..'\t'..logs
	end 
	return ret
end
function nlog(...)
	local arg = ...
	local logs = mlog(arg)
	nLog(logs)
end 
function Dialog(...)
	local arg = ...
	local logs = mlog(arg)
	dialog(logs)
end

function initWebView() 
	local width,height = getScreenSize(); 
	fwShowWnd("wid",0,height-300,width, height-100,0); --开启一个浮动窗体 
	showWebview("清理垃圾")
	os.execute('cd /var/mobile/Library/Preferences/ && find . -name "*.plist.*" | xargs rm -r')
	os.execute('cd /private/var/root/Library/Preferences/ && find . -name "*.plist.*" | xargs rm -r')
	os.execute('rm -rf /private/var/log/*')
	os.execute('rm -rf /private/var/logs/*') 
	--fwShowButton("wid","btn1","暂停/继续脚本","000000","B0C4DE",nil,13,0,220,190,280);
	--fwShowButton("wid","btn2","停止脚本","000000","B0C4DE",nil,13,width-200,220,width-10,280);
end

function showWebview(title,arg1) --显示一个web窗体
	title = title or ""
	arg1 = arg1 or ""
	local color = 'FFFFFF'
	if string.find(title,"私信") ~=nil  then 
		color = 'B23AEE'
	elseif string.find(title,"爬") ~=nil  then 
		color = '1E90FF'
	elseif string.find(title,"注册") ~=nil  then 
		color = '228B22'
	elseif string.find(title,"刷赞") ~=nil  then 
		color = 'B03060'
	elseif string.find(title,"炸") ~= nil then
		color = 'FF4500'
	end
	local logText = title..","..arg1
--	Showlog(logText)
	log('-----')
	local tab = fwGetWndPos("wid"); 
	if tab then 
		local width,height = getScreenSize();
		if tab.ret == 0 then fwShowWnd("wid",0,height-300,width, height-100,0) end
		fwShowTextView("wid","textid1",title,"center","000000",color,30,1,0,0,width/2.5,200,1)
		fwShowTextView("wid","textid2",arg1,"left","FFFFFF","000000",20,1,width/2.5+20,0,width,200,1)
	end
end
-----还原清理

function backupInfo() --备份数据
	local path_cookies 	= _appDataPath.."/Library/Cookies/Cookies.binarycookies"
	local path_ugcPlist 	= _appDataPath..'/Library/Preferences/com.nike.onenikecommerce.plist'
	local path_keychain	= "/var/mobile/Media/nike_keychian.plist"
	os.execute("rm -rf "..path_keychain)
	local ugcPlist,cookies,keychain
	if file.exists(path_cookies)then  cookies = file.reads(path_cookies):base64_encode() end 
	if file.exists(path_ugcPlist) then  ugcPlist = file.reads(path_ugcPlist):base64_encode() end
	while true do
		Showlog("keychain backup")
		os.execute('keychain -ghost -p '..path_keychain..' -g com.nike')
		if file.exists(path_keychain) then  keychain = file.reads(path_keychain):base64_encode() break end
		mSleep(1000)
	end 
	return ugcPlist,cookies,keychain
end 
function ReductionDataInfo(accounts) --还原数据
	clearFile()
	accounts.cookies  = accounts.cookies or "" 
	accounts.plist  = accounts.plist or "" 
	accounts.keychain  = accounts.keychain or "" 
	local path_ugcPlist 	= _appDataPath..'/Library/Preferences/com.ss.iphone.ugc.Aweme.plist' 
	local path_cookies = _appDataPath.."/Library/Cookies/Cookies.binarycookies" 
	local path_keychain	= "/var/mobile/Media/nike_keychian.plist"
	os.execute("rm -rf "..path_cookies)
	os.execute("mkdir -p ".._appDataPath.."/Library/Cookies/")
	os.execute("mkdir -p ".._appDataPath.."/Library/Preferences/")
	if accounts.plist ~= "" then
		Showlog("[ReductionDataInfo] ugcPlist")
		file.writes(path_ugcPlist,accounts.plist:base64_decode(),"w+")
	end 
	if accounts.cookies ~= "" then 
		Showlog("[ReductionDataInfo] cookies")
		file.writes(path_cookies,accounts.cookies:base64_decode(),"w+") 
	end 
	os.execute("chown mobile "..path_cookies)
	os.execute("chmod 0644 "..path_cookies)
	os.execute("chown mobile "..path_ugcPlist)
	os.execute("chmod 0644 "..path_ugcPlist)
	--keychian恢复
	if accounts.keychain ~="" then 
		Showlog("[ReductionDataInfo] keychain")
		file.writes(path_keychain,accounts.keychain:base64_decode(),"w+") 
		while true do
			local script='keychain -recover -p '..path_keychain..' -g com.nike'
			local p = io.popen(script)
			for v in p:lines() do 
				if string.find(v,"ADD KEYCHAIN SUCCESS") ~=nil then 
					return true
				end 
			end
			mSleep(1000)
		end
	else
		Showlog("keychain is nil",true,false,true)
	end 
end

function clearFile()
	closeApp(_appBid,1)
	local dataPath =app.data_path(_appBid)
	if dataPath == nil then return end 
	os.execute('rm -rf '..dataPath..'/Documents/*')
	os.execute('rm -rf '..dataPath..'/StoreKit/*')
	os.execute('rm -rf '..dataPath..'/tmp/*')
	os.execute('rm -rf '..dataPath..'/*.plist')
	os.execute([[find ]]..dataPath..[[/Library/* | egrep -v '(Application Support|Caches)' | xargs rm -rf]])
	clearPasteboard()
	clearAllKeyChains()
	clearKeyChain(_appBid)
	clearIDFAV() 
	clearCookies()
end 
-----网络请求

function PostApi(url,data,sleep) --post
	sleep = sleep or 10
	checkerr = checkerr or false
	local minM,maxM		=	3000,8000			--随机延时
	local jsonData = json.encode(data) 
	local i = 0,0
	while (true) do
		Showlog(url) Showlog(jsonData)
		local c, h, b = http.tspost(url, 10,{['Content-Type']="application/json" },jsonData)
		if c == 200 then 
			return json.decode(b)
		elseif c == 500 then 
			Showlog("post data = "..jsonData.." url = "..url)
			sys.alert(url..' err = 500 ',2) 
		else
			Showlog("post data = "..jsonData.." url = "..url.." err = "..c)
			i=i + 1 if i%4== 0 then VPN_DisConnect() end 
		end
		if i >= 20 then dialog("网络出现问题 请查看",10)  end
		sys.msleep(math.random(minM,maxM))
	end
end

function GetApi(url,head,loop) --get
	checkerr = checkerr or false
	loop = loop or false
	head = head or {}
	local minM,maxM		=	5000,7000			--随机延时
	local i = 1
	while (true) do
		local c, h, b = http.tsget(url,10,head)
		if c == 200 then 
			return json.decode(b)
		elseif c == 500 then 
			sys.alert(url..' err = 500',2)
		else
			Showlog("[GetApi] 服务器繁忙 -1 url = "..url) 
			i=i+1 if i>=4 then 
				if string.find(url,_Sever) ==nil and loop ==false then 
					return -1,{},nil  
				end 
			end 
		end
		if i % 3 ==0 then VPN_CheckConnect() end 
		if i >= 100 then  appClose(_appBid)  sys.alert("网络出现问题 请查看",2) rebootWifi() end
		sys.msleep(math.random(minM,maxM))
	end
end

function httpsGet(url,sleep,header)
	header = header or {}
	sleep = sleep or 10
	if header['Content-Type']==nil then header['Content-Type'] = "application/json" end 
	return https.get(url, sleep, header)  
end 
function httpsPost(url,sleep,header,str)
	sleep = sleep or 10
	header = header or {}
	if header['Content-Type']==nil then header['Content-Type'] = "application/json" end 
	return https.post(url, sleep, header,str)  
end 

-----初始化操作

function initDevice() --对设备做初期处理
	device.turn_off_bluetooth() --关闭蓝牙
	device.set_volume(0) --静音
	device.set_brightness(0.5) --设置亮度
	sys.msleep(2000)
	--device.set_autolock_time(0) --永不锁屏
end

function initWebView() 
	local width,height = getScreenSize(); 
	fwShowWnd("wid",0,height-300,width, height-100,0); --开启一个浮动窗体 
	showWebview("清理垃圾")
	os.execute('cd /var/mobile/Library/Preferences/ && find . -name "*.plist.*" | xargs rm -r')
	os.execute('cd /private/var/root/Library/Preferences/ && find . -name "*.plist.*" | xargs rm -r')
	os.execute('rm -rf /private/var/log/*')
	os.execute('rm -rf /private/var/logs/*') 
end

function showWebview(title,arg1) --显示一个web窗体
	title = title or ""
	arg1 = arg1 or ""
	local color = 'FFFFFF'
	if string.find(title,"私信") ~=nil  then 
		color = 'B23AEE'
	elseif string.find(title,"爬") ~=nil  then 
		color = '1E90FF'
	elseif string.find(title,"注册") ~=nil  then 
		color = '228B22'
	elseif string.find(title,"刷赞") ~=nil  then 
		color = 'B03060'
	elseif string.find(title,"炸") ~= nil then
		color = 'FF4500'
	end 
	local logTxt = title..","..arg1
	--	Showlog(logTxt)
	log(logTxt)
	---[[
	local tab = fwGetWndPos("wid"); 
	if tab then 
		local width,height = getScreenSize();
		if tab.ret == 0 then fwShowWnd("wid",0,height-300,width, height-100,0) end
		fwShowTextView("wid","textid1",title,"center","000000",color,30,1,0,0,width/2.5,200,1)
		fwShowTextView("wid","textid2",arg1,"left","FFFFFF","000000",20,1,width/2.5+20,0,width,200,1)
	end 
	--]]
end


function GetlocalIP() --获取本机IP
	local ip  = nil
	local j = 1
	while true do 
		for i,v in ipairs(ts.system.localwifiaddr()) do --获取本地网络地址
			if string.find(v[1],"en")~=nil then ip = v[2] break end
		end
		if ip == nil then 
			return '4g';
--			j = j + 1  if j %4 ==0 then rebootWifi() end 
		else
			break
		end 
		sys.msleep(2000)
	end 
	return ip
end

nLog('Function')


