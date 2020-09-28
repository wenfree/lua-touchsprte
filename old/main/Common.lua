require "TSLib"
ts = require("ts")
plist = ts.plist

http = {   --http模块 
	tsget = function(url,sleep,header) 
		sleep = sleep or 10
		header  = header or {}
		ts.setHttpsTimeOut(sleep)
		header["typeget"] = "ios"
		if header['Content-Type']==nil then header['Content-Type'] = "application/json" end 
		if string.find(url,"https")~=nil then
			return ts.httpsGet(url, header)
		else
			
			return ts.httpGet(url, header)
		end 
	end,
	tspost = function(url,sleep,header,str) 
		sleep = sleep or 10
		header  = header or {}
		ts.setHttpsTimeOut(sleep)
		header["typeget"] = "ios"
		if header['Content-Type']==nil then header['Content-Type'] = "application/json" end 
		if string.find(url,"https")~=nil then 
			return ts.httpsPost(url, header,str)
		else
			return ts.httpPost(url, header,str)
		end 
	end,
	download = function(url,path)
		return ts.tsDownload(path,url) 
	end,
	
	curlGet = function(u,s,header,isProxy,isHead,isDirect)
		if  isProxy ==nil then isProxy = true end 
		if  isHead ==nil then isHead = false end 
		if  isDirect ==nil then isDirect = false end
		local headers = ""
		for k,v in pairs(header) do
			 headers = headers.. " -H '"..k..":"..v.."'"
		end
		if isProxy == true then headers = headers.." -H 'Proxy-Authorization:Basic cDFod2xFOTZJVk5Kc2R5ZTppRWZjdGU5S0pMTDhuUTR3'" end 
		local script = 'curl "'..u..'"'..headers..' -m '..s..' -w "curl_code=%{http_code}" -k'
		if isHead  == true then script = script.." -i" end
		if isProxy == true then script = script..' -x transfer.mogumiao.com:9001' end
		if isDirect == true then script = script.." -L" end
		local p = io.popen(script)
		local code,body =-1,nil 
		local res = ""
		for v in p:lines() do
			res = res ..v
		end
		code = tonumber( string.split(res,"curl_code=")[2])
		body = string.split(res,"curl_code=")[1]
		return code,{},body
	end,
	
	curlPost = function(u,s,header,postdata,isProxy,isHead,isDirect)
		if  isProxy ==nil then isProxy = true end 
		if  isHead ==nil then isHead = false end 
		if  isDirect ==nil then isDirect = false end
		local headers = ""
		for k,v in pairs(header) do
			headers = headers.. " -H '"..k..":"..v.."'"
		end
		if isProxy == true then headers = headers.." -H 'Proxy-Authorization:Basic cDFod2xFOTZJVk5Kc2R5ZTppRWZjdGU5S0pMTDhuUTR3'" end 
		local script = 'curl "'..u..'"'..headers..' -m '..s..' -w "curl_code=%{http_code}" -k -X POST -d "'..postdata..'"'
		if isHead  == true then script = script.." -i" end
		if isProxy == true then script = script..' -x transfer.mogumiao.com:9001' end 
		if isDirect == true then script = script.." -L" end
		--nLog(script)
		local p = io.popen(script)
		local code,body =-1,nil
		local res = ""
		for v in p:lines() do 
			res = res ..v
		end
		code = tonumber( string.split(res,"curl_code=")[2])
		body = string.split(res,"curl_code=")[1]
		return code,{},body
	end,
	
}


screen = { --屏幕处理
	image = function(left,top,right,bottom)
		return img.screen(left,top,right,bottom)
	end,
	
}

clear = {	--清理模块
	keychain = function(bid)
		clearKeyChain(bid);
	end,
	all_keychain = function()
		clearAllKeyChains()
	end,
	pasteboard = function()
		clearPasteboard();
	end,
	cookies = function()
		clearCookies()
	end,
	caches = function()
		os.execute("su mobile -c uicache");
	end,
	all_photos = function()
		clearAllPhotos()
	end,
	app_data = function(bid)
		cleanApp(bid)
	end,
	idfav = function()
		clearIDFAV()
		--if str == nil then  clearIDFAV() else return clearIDFAV(str) end
	end,
}	


device = {		--设备信息获取模块
	name = function() --获取设备名
		return getDeviceName()
	end,
	udid = function()  --获取设备UDID
		return ts.system.udid()
	end,
	serial_number = function()  --获取设备序列号
		return ts.system.serialnumber()
	end,
	wifi_mac = function()		--获取设备WIFI MAC地址
		return ts.system.wifimac()
	end,
	bt_mac = function()			--获取设备蓝牙 MAC地址	
		return ts.system.btmac()
	end,
	is_screen_locked = function()
		return deviceIsLock()~=0
	end ,
	lock_screen = function()	--锁定屏幕
		lockDevice()
	end,
	unlock_screen = function()	--解锁屏幕
		unlockDevice()
	end,
	
	
	turn_off_bluetooth = function()
		setBTEnable(false);    --关闭蓝牙
	end,
	turn_on_bluetooth = function()
		setBTEnable(true);    --打开蓝牙
	end,
	turn_off_data = function()
		setCellularDataEnable(false)  --关闭蜂窝网络
	end, 
	turn_on_data = function()
		setCellularDataEnable(true) --打开蜂窝网络 
	end,
	set_volume = function(num)
		setVolumeLevel(num)	--要设置的设备音量，范围 0 - 1
	end,
	set_brightness = function(num)
		setBacklightLevel(num);	--要设置的屏幕亮度值，范围 0 - 1
	end,
	set_autolock_time = function(time)
		setAutoLockTime(time) --0 到 5,0 是代表永不锁屏，1 ~ 5 为锁屏时间，单位为分
	end,
	turn_on_wifi = function()
		setWifiEnable(true);    --打开 WiFi
	end,
	turn_off_wifi = function()
		setWifiEnable(false);    --关闭 WiFi
	end,
	join_wifi = function(wifiname,password,types) --WiFi 加密类型：0 - 无密码，1 - WEP,2 - WPA,3 - WPA2,4 - WPA 企业版，5 - WPA2 企业版
		connectToWifi(wifiname,password,types)
	end,
}

app = {
	front_bid = function()
		return frontAppBid()
	end,
	data_path = function(bid)
		return appDataPath(bid)
	end,
	close = function(bid)
		closeApp(bid)
	end ,
	run   = function(bid)
		runApp(bid)
	end,
	open_url = function(url)
		openURL(url)
	end,    
	input_text = function(str)
		inputText(str)
	end,
	uninstall = function(bid)
		uninstallApp(bid)
	end ,
}

file = {    --文件处理模块
	exists = function(file_name)
		local f = io.open(file_name, "r")
		return f ~= nil and f:close()
	end,
	
	reads = function(file_name)
		local f = io.open(file_name,"r")
		if f then
			local c = f:read("*a")  
			f:close()  
			return c
		else
			return nil
		end
	end,
	writes = function(file_name,str,mode)
		mode =  mode or "w"
		local f = io.open(file_name, mode)
		if f == nil then return "" end 
		local ret = f:write(str)
		f:close()
		--[[
		mode =  mode or "w+"
		writeFileString(file_name,str,mode)
		--]]
	end,
}
 
sys = {  --系统模块
	msleep = function(sleep)
		mSleep(sleep)
	end,
	toast = function(str,sleep)
		sleep = sleep or 1
		toast(str,sleep)
	end,
	alert = function(str,sleep)
		sleep = sleep or 1
		dialog(str,sleep)
	end,
	
}	
json = {  --json 序列化
	encode = function(str)
		err,info = pcall(function() return ts.json.encode(str) end)
		if err then return info end 
	end,
	decode =  function(str)
		err,info = pcall(function() return ts.json.decode(str) end)
		if err then return info end 
	end,
} 
