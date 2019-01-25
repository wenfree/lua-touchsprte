---------------------------------------	制作说明	---------------------------------------
--[[

插件作者: 山海师
制作时间: 2016.03.04
联系方式: 1915025270 (QQ)
本插件之后会持续更新,如发现BUG或者有功能需求请联系插件作者

--]]

local SHvar = 2.1

--临时读取文件[内部函数]
function readfile(path,test)
	f = io.open(path,"r")
	if f == null then 
		return null 
	end 
	ret = f:read("*all")
	f:close()
	if test ==nil then
		os.remove(path)
	end 
	return ret
end 

--临时文件
function TempFile(filename)
	return  __MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__:match("(.+)/[^/]").."/"..filename ..".txt"
end 

--移动表[内部函数]
function MoveTable(oldarr)
	local newarr = {}
	local i=1
	for k,v in ipairs(oldarr) do
		newarr[k] = v
		print(i,v,newarr[i])
		i=i+1
	end 
	return newarr
end 

function print(str)
	LuaAuxLib.TracePrint(str)
end 

function QMPlugin.match(str,format)
	return str:match(format)
end
function QMPlugin.gsub(str,f,s)
	return str:gsub(f,s)
end
---------------------------------------	字符串\数组处理	---------------------------------------



function QMPlugin.ReadFileBase(path)
	f = io.open(path,"rb")
	if f == null then 
		return null 
	end 
	bytes = f:read("*all")
	f:close()
--charcodestr=''
--for i = 1, string.len(bytes) do
--   charcode = tonumber(string.byte(bytes, i, i))
--   charcodestr = tostring(charcodestr)..tostring(string.format("%02X", charcode))
--end

local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((bytes:gsub('.', function(x) 
		local r,key='',x:byte()
		for i=8,1,-1 do r=r..(key%2^i-key%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return key:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#bytes%3+1])

	--return charcodestr
end 

--过滤数组
function QMPlugin.Filter(arr,include,type)
	local tarr = {}
	for k,v in ipairs(arr) do
		if type == true or type == null then 
			if string.find(v, include) == nil then
				table.insert(tarr, v)
			end
		else 
			if string.find(v, include) ~= nil then
				table.insert(tarr, v)
			end
		end 
	end
	return tarr
end 

--数组排序
function QMPlugin.Sort(arr,comp)
	local t = {}
	local j = 1
	tarr = MoveTable(arr)
	table.sort(tarr)
	if comp == true or comp == null then
		return tarr
	else
		for i = #tarr ,1,-1 do 
			t[j] = tarr[i]
			j=j+1
		end 
		return t
	end
end 

--删除数组元素
function QMPlugin.Remove(arr,pos)
	tarr = MoveTable(arr)
	table.remove(tarr,pos+1)
	return tarr
end 

--插入数组元素
function QMPlugin.insert(arr,pos,value)
	tarr = MoveTable(arr)
	table.insert(tarr,pos+1,value)
	return tarr
end 

--过滤前导字符
local LTrimEx = function (str,filt)
	local retstr = ""
	for i=1, string.len(str) do 
		if string.find(filt,string.sub(str,i,i)) == null then
			retstr = string.sub(str,i,-1)
			break
		end 
	end 
	return retstr
end 
QMPlugin.LTrimEx = LTrimEx


--过滤后导字符
local RTrimEx = function (str,filt)
	local retstr = ""
	for i=string.len(str), 1, -1 do 
		if string.find(filt,string.sub(str,i,i)) == null then
			retstr = string.sub(str,1,i)
			break
		end 
	end 
	return retstr
end 
QMPlugin.RTrimEx = RTrimEx

--过滤前导与后导字符
function QMPlugin.TrimEx(str,filt)
	local tmpstr
	tmpstr = LTrimEx(str,filt)
	return RTrimEx(tmpstr,filt)
end 

--删除指定区间字符
function QMPlugin.DelPartStr(str,sval,eval)
	local LStr = string.sub(str,1,sval-1)
	local RStr = string.sub(str,eval+1,-1)
	local RetStr = LStr ..RStr
	return RetStr
end 

--删除指定字符
function QMPlugin.DelFilStr(str,filter)
	local RetStr,TmpLStr,TmpRStr
	RetStr = str
	while true do
		s,e = string.find(RetStr,filter,e)
		if s~= nil then
			TmpLStr = string.sub(RetStr,1,s-1)
			TmpRStr = string.sub(RetStr,e+1,-1)
			RetStr = TmpLStr ..TmpRStr
		else 
			break
		end 
	end
	return RetStr
end 

--数组去重 
function QMPlugin.RemoveDup(tbl)
	local a = {}
	local b = {}
	for _,v in ipairs(tbl) do
		a[v] = 0
	end
	for k,v in pairs(a) do
		table.insert(b, k)
	end
	return b
end 

--数组元素改变位置 
function QMPlugin.ChangePos(arr,a,b)
	local tmptbl = arr
	local tmpval = arr[a+1]
	table.remove(tmptbl,a+1)
	table.insert(tmptbl,b+1,tmpval)
	return tmptbl
end 

---------------------------------------	随机数处理	---------------------------------------

--范围随机数 
function QMPlugin.RndEx(min,max)
	return math.random(min,max)
end 

--随机取逻辑值
function QMPlugin.RndBool()
	local tmpnum = math.random(2)-1
	if tmpnum == 0 then
		return true
	else 
		return false
	end
end 

--随机取数组内容 
function QMPlugin.RandArray(arr)
	local index
	index = math.random(1,#arr)
	return arr[index]
end 

--随机生成不重复数字  [作者：小玮]
function QMPlugin.RanDiffarr(arr,num)
	if num == null or num > #arr then num = #arr end
	local Lines = {}
	for _ = 1,num do
		local n = math.random(#arr)
		Lines[#Lines + 1] = arr[n]
		table.remove(arr,n)
	end
	return Lines
end
---------------------------------------	文件处理	---------------------------------------

--提取路径中包含的文件后缀
function QMPlugin.GetFileType(path)
	s,e = string.find(path,"%.")
	return string.sub(path,s+1 ,-1)
end 

--提取路径中包含的文件名 
function QMPlugin.GetFileName(path)
	path = "/" .. path
	local ret
	for w in string.gmatch(path, "/([^/]+)") do
		ret = w
	end
	return ret
end 

--生成随机名称文件
function QMPlugin.GetTempFile(Path, Prefix, Postfix, Lenght)
	local RndText,RetText
	for i=1,Lenght do 
		if RndText == nil then
			RndText = math.random(Lenght)
		else 
			RndText = RndText .. math.random(Lenght)
		end 
	end 
	RetText = Path .. Prefix .. RndText .. Postfix
	local f = io.open(RetText,"a+")
	f:close()
end 

--遍历目录
function QMPlugin.ScanPath(path,filter)
	if string.sub(path,-1,-1) ~= "/"then
		path = path .. "/"
	end 
	local tpath = TempFile("scan")
	os.execute("ls -F "..path.." > " ..tpath)
	local f = io.open(tpath,"r")
	local file = {}
	local folder = {}
	for v in f:lines() do
		if string.find(v,"d ") then
			sPos = string.find(v," ")
			v = string.sub(v,sPos,-1)
			table.insert(folder,v)
		elseif string.find(v,"- ") then
			sPos = string.find(v," ")
			v = string.sub(v,sPos,-1)
			table.insert(file,v)
		end 
	end 
	f:close()
	if filter ~= nil then
		return folder
	else
		return file
	end 
end 
--[[遍历文件夹下所有文件  [作者：小玮]
function QMPlugin.Listall(path)
	local localpath = temppath().."listall"
	os.execute(string.format("ls -al %s > %s",path,localpath))
	local listall = readfile(localpath)
	return listall
end
--]]

--设置文件权限 
function QMPlugin.Chmod(path,per)
	if per == 0 then
		os.execute("chmod 666 " ..path) 
	elseif per == 1 then
		os.execute("chmod 444 " ..path)
	elseif per == 2 then
		os.execute("chmod 777 " ..path)	
	end 
end 
--[[修改权限，参数为权限、文件路径，无返回值  [作者：小玮]
function QMPlugin.ChangeFolder(per,dirname)
	pcall(
	function()
	    os.execute("chmod "..per.." ".. dirname)
	end)
end
--]]

--设置文件权限[增强]
function QMPlugin.ChmodEx(path,per)
	return os.execute("chmod " ..per.." "..path)
end 

--写内容到指定行 
function QMPlugin.WriteFileLine(path,line,str)
	local t={}
	f = io.open(path,"a+")
	local text = f:read("*all")
	for i in f:lines() do
		table.insert(t,i)
	end
	table.insert(t,line,str)
	f:close()
	f = io.open(path,"w")
	for _,v in ipairs(t) do 
		f:write(v.."\r\n")
	end 
	f:close()
end 

--删除指定目录下指定后缀的文件  [作者：小玮]
function QMPlugin.FindFileDelete(findpath,filename)
	os.execute(string.format("find %s -name '%s' | xargs rm -rf",findpath,filename))
end

---------------------------------------	设备相关命令	---------------------------------------

--获取MAC地址
function QMPlugin.GetMAC()
	local path = TempFile("MACRecord")
	os.execute("cat /sys/class/net/wlan0/address > " .. path )
	local r = readfile(path)
	return r
end

--设置输入法
function QMPlugin.SetIME(pattern)
	if pattern == 0 then		--百度小米版
		os.execute("ime set com.baidu.input_mi/.ImeService ")
	elseif pattern == 1 then  	--讯飞
		os.execute("ime set com.iflytek.inputmethod/.FlyIME")
	elseif pattern == 2 then	--谷歌
		os.execute("ime set com.google.android.inputmethod.pinyin")
	elseif pattern == 3 then	--手心
		os.execute("ime set com.xinshuru.inputmethod/.FTInputService")
	elseif pattern == 4 then	--GO输入法
		os.execute("ime set com.jb.gokeyboard/.GoKeyboard")
	elseif pattern == 5 then	--触宝输入法
		os.execute("ime set com.cootek.smartinputv5.tablet/com.cootek.smartinput5.TouchPalIME")
	elseif pattern == 6 then	--QQ拼音
		os.execute("ime set com.tencent.qqpinyin/.QQPYInputMethodService ")
	elseif pattern == 7 then	--百度输入法
		os.execute("ime set com.baidu.input/.ImeService")
	elseif pattern == 8 then	--章鱼输入法
		os.execute("ime set com.komoxo.octopusime/com.komoxo.chocolateime.LatinIME")
	elseif pattern ==9 then 	--设置按键精灵输入法
		os.execute("ime set com.cyjh.mobileanjian/.input.inputkb")
	elseif pattern == 10 then	--设置搜狗输入法
		os.execute("ime set com.sohu.inputmethod.sogou/.SogouIME")
	end 
end 	
--[[切换输入法  [作者：小玮]
--参数:输入法名字,如sogou、baidu...
function QMPlugin.Switchinput(name)
	name = name:lower()
	if name == "sogou" then
		os.execute("ime set com.sohu.inputmethod.sogou/.SogouIME")--搜狗输入法
	elseif name == "baidu" then
		os.execute("ime set com.baidu.input/.ImeService")--百度输入法
	elseif name == "baidu_miv6" then
		os.execute("ime set com.baidu.input_miv6/.ImeService")--小米v6百度输入法
	elseif name == "qq" then
		os.execute("ime set com.tencent.qqpinyin/.QQPYInputMethodService")--QQ拼音输入法
	elseif name == "chumo" then
		os.execute("ime set net.aisence.Touchelper/.IME")--触摸精灵输入法
	elseif name == "jiaoben" then
		os.execute("ime set com.scriptelf/.IME")--脚本精灵输入法
	elseif name == "anjian" then
		os.execute("ime set com.cyjh.mobileanjian/.input.inputkb")--按键精灵输入法
	elseif name == "xscript" then
		os.execute("ime set com.surcumference.xscript/.Xkbd")--xscript输入法
	elseif name == "tc" then
		os.execute("ime set com.xxf.tc.Activity/api.input.TC_IME")--TC输入法
	elseif name == "zhangyu" then
		os.execute("ime set com.tongmo.octopus.helper/com.tongmo.octopus.api.OctopusIME")--章鱼输入法
	elseif name == "chudong" then
		os.execute("ime set com.touchsprite.android/.core.TSInputMethod")--触动精灵输入法
	end
end
--]]

--安装app
function QMPlugin.Install(path)
	os.execute("pm install -r " .. string.format("%s",path) )
end 

--卸载app
function QMPlugin.Uninstall(PackageName)
	os.execute("pm uninstall  " .. string.format("%s",PackageName) )
end 
--[[静默安装apk  [作者：小玮]
function QMPlugin.Install(packagepath)
	os.execute(string.format("pm install %s",packagepath))
end
--静默卸载apk
function QMPlugin.Uninstall(packagename)
	os.execute(string.format("pm uninstall %s",packagename))
end
--]]

--获取通知栏信息
function QMPlugin.GetNotification(PackageName)
	local s,e
	local path = TempFile("Notification")
	os.execute("dumpsys notification > " ..path )
	local text = readfile(path)
	repeat
		s,e = string.find(text,"pkg=[^ ]+",e)
		pkgname = string.sub(text,s+4,e)
		if pkgname == PackageName then
			s,e = string.find(text,"tickerText=[^\r\n]+",e)
			tickertext = string.sub(text,s+11,e)
			return tickertext
		end 
	until s == null
end 
--[[获取通知栏信息  [作者：小玮]
function QMPlugin.Notification(pkgname)
		local localpath = temppath().."Notification"
		os.execute("dumpsys notification > "..localpath)
		xw = readfile(localpath)
		pkg = 1
		notifications = ""
		repeat
			_,pkg = xw:find("pkg="..pkgname,pkg)
			_,text = xw:find("tickerText=",pkg)
			content,_ = xw:find("contentView=",text)
			notification = xw:sub(text + 1,content - 8)
			if notification ~= "null" then
				notifications = notifications..notification.." \n"
			end
		until pkg == nil
		if #notifications == 0 then
			notifications= "null"
		end
		return notifications
end
--]]

--获取外网ip
function QMPlugin.GetIP()
	local path  = TempFile("ip")
	os.execute("curl --connect-timeout 8 www.1356789.com > "..path)
	local ret = readfile(path)
	return ret:match("%d+%.%d+%.%d+%.%d+")
end
--[[获取外网ip地址  [作者：小玮]
function QMPlugin.GetIP()
	return LuaAuxLib.URL_Operation("http://52xiaov.com/getipinfo.php"):match("ip:(.-)<br/>")
end
--]]

--获取当前应用包名与组件名
function QMPlugin.GetTopActivity()
	local path = TempFile ("app")
	os.execute("dumpsys activity top >" .. path)
	return string.match(readfile(path),"ACTIVITY ([^ ]+)")
end 
--[[获取前台应用包名、组件名  [作者：小玮]
function QMPlugin.TopActivityName() 
	local localpath = temppath().."TopActivityName"
	os.execute("dumpsys activity top | grep ACTIVITY > "..localpath)
	local TopActivity = readfile(localpath)
	return TopActivity:match("ACTIVITY (.-) ")
end
--]]

--获取设备中的应用
function QMPlugin.GetAppList(type)
	local path = TempFile ("applist")
	if type == 0 then 
		type = " -3 >"
	elseif type == 1 then
		type = " -s >"
	end 
	os.execute("pm list packages "..type..path)
	local ret ={}
	for k in string.gmatch(readfile(path),"[^\r\n]+") do 
		table.insert(ret,k)
	end 
	return ret
end 
--[[获取已安装包名  [作者：小玮]
function QMPlugin.ListPackage(issystem)
	local localpath = temppath().."ListPackage"
	os.execute("pm list package -f > "..localpath)
	local ReadContent = readfile(localpath)
	local systempackage={}
	local userpackage={}
	for i in ReadContent:gmatch("(.-)\n(.-)") do
		local _,_,savepath,packagename = i:find("package:/(.-)/.-=(.+)")
		if savepath == "system" then
			systempackage[#systempackage+1]=packagename
		elseif savepath == "data" then
			userpackage[#userpackage+1]=packagename
		end
	end
	issystem = tostring(issystem)
	if issystem == "true" then
		return systempackage
	elseif issystem == "false" then
		return userpackage
	else
		for _,i in pairs(userpackage) do
			table.insert(systempackage,i)
		end
		return systempackage
	end
end
--]]

--关闭\开启wifi
function QMPlugin.ControlWifi(mode)
	if mode == true then
		os.execute("svc wifi enable")
	else 
		os.execute("svc wifi disable")
	end 
end 

--关闭\开启数据流量
function QMPlugin.ControlData(mode)
	if mode == true then
		os.execute("svc data enable")
	else 
		os.execute("svc data disable")
	end 
end 

--检测wifi是否开启
function QMPlugin.IsConnectWifi()
	local path = TempFile ("wifi")
	os.execute("dumpsys wifi > "..path)
	local f = io.open(path,"r")
	local ret = f:read("*line")
	f:close()
	if string.find(ret,"disabled") == null then
		return true
	else 
		return false
	end 
end 

--获取安卓系统版本号
function QMPlugin.GetAndroidVer()
	local localpath = TempFile ("AndroidVer")
	os.execute(string.format("getprop ro.build.version.release > %s",localpath))
	return readfile(localpath)
end 

--重启手机
function QMPlugin.Reboot()
	os.execute("reboot")
end 

--关机
function QMPlugin.ShutDown()
	os.execute("reboot -p")
end 

--判断设备是否是虚拟机
function QMPlugin.IsVM()
	local path = TempFile ("IsVM") 
	os.execute("cat /proc/cpuinfo > " .. path)
	retinfo = readfile(path)
	s = string.find(ret,"model name")
	if s == nil then
		ret = false
	else
		ret =true
	end 
	return ret
end 

--判断充电状态 
function QMPlugin.GetBatteryState()
	local state
	local path = TempFile("Battery")
	os.execute("dumpsys battery > " ..path)
	local ret = readfile(path)
	if string.find(ret,"AC powered: true") then
		state = 1
	elseif string.find(ret,"USB powered: true") then
		state = 2
	elseif string.find(ret,"Wireless powered: true") then
		state = 3
	else 
		state = 0
	end 
	return state
end 

--判断蓝牙是否开启 
function QMPlugin.IsBluetooth()
	local path = TempFile("Bluetooth")
	os.execute("getprop > " ..path)
	local ret = readfile(path)
	if string.find(ret,"%[bluetooth.status%]: %[on%]") then
		return true
	else 
		return false
	end 
end 

--指定APP打开网址  [存在部分应用版本不兼容情况]
function QMPlugin.RunUrl(url,ID)
	local tmpact 
	if ID == 0 then		--360浏览器
		tmpact = "com.qihoo.browser/.BrowserActivity"
	elseif ID == 1 then	--QQ浏览器
		tmpact = "com.tencent.mtt.x86/.MainActivity"
	elseif ID == 2 then	--海豚浏览器
		tmpact = "com.dolphin.browser.xf/mobi.mgeek.TunnyBrowser.MainActivity"
	elseif ID == 3 then	--欧朋浏览器
		tmpact = "com.oupeng.browser/com.opera.android.OperaMainActivity"
	elseif ID == 4 then	--傲游浏览器
		tmpact = "com.mx.browser/.MxBrowserActivity"
	elseif ID == 5 then	--UC浏览器
		tmpact = "com.UCMobile/com.uc.browser.InnerUCMobile"
	end 
	os.execute(string.format("am start -n %s -d %s",tmpact,url))
end 

--判断设备中是否有安装指定app
function QMPlugin.ExistApp(pkgname)
	local path = TempFile("applist") 
	os.execute("pm list packages  > "..path)
	local ret = readfile(path)
	s = string.find(ret,pkgname)
	if s == nil then
		return false
	else 
		return true 
	end 
end 

--设置手机时间
function QMPlugin.SetTime(d,t)
	os.execute("date -s "..d.."."..t)
end 

--隐藏app
function QMPlugin.DisableApp(pkgname)
	os.execute("pm disable "..pkgname)
end 

--显示app
function QMPlugin.EnableApp(pkgname)
	os.execute("pm enable  "..pkgname)
end
--[[禁用应用  [作者：小玮]
function QMPlugin.AppDisable(packagename)
	os.execute("pm disable "..packagename)
end
--解禁应用
function QMPlugin.AppEnable(packagename)
	os.execute("pm enable "..packagename)
end
--]]

--检测虚拟键高度 
function QMPlugin.GetNavigationBar()
	local path = TempFile("bar")
	os.execute("dumpsys window windows > "..path)
	local text = readfile(path)
	s = string.find(text,"NavigationBar")
	s = string.find(text,"mFrame",s)
	_,_,h,h1 = string.find(text,"mFrame=%[%d+,(%d+)%]%[%d+,(%d+)%]",s)
	return h1-h
end 

--获取屏幕分辨率 
function QMPlugin.GetScreen()
	local path = TempFile("screen")
	os.execute("dumpsys window displays > "..path)
	local text = readfile(path)
	local ret = {}
	_,_,ret[1],ret[2],ret[3] = string.find(text,"init=(%d+)x(%d+) (%d+)dpi")
	return ret
end 

--获取剩余内存百分比 
function QMPlugin.GetRAM()
	local Total,Free
	local path = TempFile("RAM")
	os.execute("dumpsys meminfo > "..path)
	local text = readfile(path)
	_,_,Total = string.find(text,"Total RAM: (%d+)")
	_,_,Free = string.find(text,"Free RAM: (%d+)")
	return string.format("%d",(Free/Total)*100)
end 

--获取已安装应用的版本号  [作者：小玮]
function QMPlugin.AppVersion(packagename)
	local localpath = temppath().."AppVersion"
	os.execute(string.format("dumpsys package %s > %s",packagename,localpath))
	return readfile(localpath):match("versionName=(.-)\n")
end
--获取已安装应用首次安装的时间  [作者：小玮]
function QMPlugin.AppFirstInstallTime(packagename)
	local localpath = temppath().."AppVersion"
	os.execute(string.format("dumpsys package %s > %s",packagename,localpath))
	return readfile(localpath):match("firstInstallTime=(.-)\n")
end
--获取已安装应用升级安装的时间  [作者：小玮]
function QMPlugin.AppLastUpdateTime(packagename)
	local localpath = temppath().."AppVersion"
	os.execute(string.format("dumpsys package %s > %s",packagename,localpath))
	return readfile(localpath):match("lastUpdateTime=(.-)\n")
end
--发送广播强制刷新指定目录下的图片到图库展示  [作者：小玮]
function QMPlugin.UpdatePicture(picturepath)
	os.execute("am broadcast -a android.intent.action.MEDIA_MOUNTED -d file://"..picturepath)
end

--是否亮屏(原理是检测光感是否开启)  [作者：小玮]
function QMPlugin.IsScreenOn()
	local localpath = temppath().."IsScreenOn"
	os.execute("dumpsys power > "..localpath)
	return readfile(localpath):match("mLightSensorEnabled=(.-) ")
end

--开启飞行模式  [作者：小玮]
function QMPlugin.OpenAirplane()
	os.execute("settings put global airplane_mode_on 1")
	os.execute("am broadcast -a android.intent.action.AIRPLANE_MODE --ez state true")
end
--关闭飞行模式  [作者：小玮]
function QMPlugin.CloseAirplane()
	os.execute("settings put global airplane_mode_on 0")
	os.execute("am broadcast -a android.intent.action.AIRPLANE_MODE --ez state false")
end

---------------------------------------		HTTP请求	---------------------------------------

--GetHttp [可自定义头信息]
function QMPlugin.GetHttp(url, t,header)
	local path = TempFile("GET") 
	if t == null then t = 8 end 
	if header == nil then
		os.execute(string.format("curl --connect-timeout %s  -o %s '%s' ",t,path,url))
	else
		os.execute(string.format("curl --connect-timeout %s -H %s -o %s '%s'",t,header,path,url))
	end 
	result = readfile(path)
	return result
end

--GetHttp 下载文件
function QMPlugin.GetHttpFile(url, filepath, header)
	if header == null then
		os.execute(string.format("curl -o %s '%s' ",filepath, url))
	else
		os.execute(string.format("curl -o %s -H %s '%s' ",filepath, header,url))
	end
end

--PostHttp [可自定义头信息]
function QMPlugin.PostHttp(url,post, t,header)
	local path = TempFile("POST") 
	if t == null then t = 8 end 
	if header == null then
		os.execute(string.format("curl -o %s -d '%s' --connect-timeout %s '%s'",path,post,t,url))
	else 
		os.execute(string.format("curl -o %s -d '%s' --connect-timeout %s -H % '%s'",path,post,t,header,url))
	end 
	result = readfile(path)
	return result
end 

--Post提交信息，可附带cookie信息
function QMPlugin.PostHttpC(url,post,cookie_path ,t,header)
	local path = TempFile("POST")
	if t == null then t = 8 end 
	if header == null then
		os.execute(string.format("curl -o %s -d '%s' -b '%s' --connect-timeout %s '%s'",path,post,cookie_path,t,url))
	else 
		os.execute(string.format("curl -o %s -d '%s' -b '%s' --connect-timeout %s -H % '%s'",path,post,cookie_path,t,header,url))
	end 
	result = readfile(path)
	return result
end 

--GET提交信息，可附带cookie信息
function QMPlugin.GetHttpC(url,cookie_path ,t,header)
	local path = TempFile("GET") 
	if t == null then t = 8 end 
	if header == null then
		os.execute(string.format("curl -o %s -b '%s' --connect-timeout %s '%s'",path,cookie_path,t,url))
	else 
		os.execute(string.format("curl -o %s -b '%s' --connect-timeout %s -H % '%s'",path,cookie_path,t,header,url))
	end 
	result = readfile(path)
	return result
end 

---------------------------------------	LUA正则模式匹配	---------------------------------------

--全局正则匹配[包含单子串]
function QMPlugin.RegexFind(str,pattern)
	local ret ={}
	for v in string.gmatch(str,pattern) do 
		table.insert(ret,v)
	end 
	return ret
end 

--全局正则匹配多子串 
function QMPlugin.RegexFindEx(str,pattern)
	local t1 = {}
	local i=1
	local ePos
	repeat
		local ta = {string.find(str, pattern, ePos)}
		ePos = ta[2]
		if ta[1] ~= nil then
			t1[i] = ta
			table.remove(t1[i],1)
			table.remove(t1[i],1)
			i=i+1
		end 
	until ta[1]==nil
	return t1
end 

---------------------------------------	其他命令	---------------------------------------
--判断变量类型
function QMPlugin.type(varname)
	return type(varname)
end 

--返回当前插件版本号
function QMPlugin.RetVar()
	return SHvar
end 

--区域颜色一定时间是否变化
function QMPlugin.IsDisplayChange(x,y,x1,y1,t,delay)
	local PicPath,t1,intx,inty
	PicPath = __MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__ .."TmpPic.png"
	t1 = LuaAuxLib.GetTickCount()
	--截取指定范围图片并保存
	LuaAuxLib.SnapShot(PicPath,x,y,x1,y1)
	--在指定的时间内循环找图
	while (LuaAuxLib.GetTickCount() - t1) < t*1000 do 
		LuaAuxLib.KeepReleaseScreenSnapshot(true)
		intx = LuaAuxLib.FindPicture(x-10,y-10,x1+10,y1+10,PicPath,"101010",0,0.8)
		if intx == -1 then 
			LuaAuxLib.KeepReleaseScreenSnapshot(false)
			return true 
		end 
		LuaAuxLib.Sleep(delay*1000)
	end 
	LuaAuxLib.KeepReleaseScreenSnapshot(false)
	return false 
end 

--iif判断
function QMPlugin.iif(exp,rtrue,rfalse)
	if exp == false or exp == 0 then
		return rfalse
	else 
		return rtrue 
	end 
end 

--逻辑等价运算[位运算]
function QMPlugin.Eqv(t1, t2)
	if type(t1) == "boolean" and type(t2) == "boolean" then
		if t1 == t2 then
			return true
		else
			return false
		end
	else
		local i1, i2, ir
		i1 = tonumber(t1)
		i2 = tonumber(t2)
		ir = 0
		for i=0, 31 do
			local b1 = bit32.band(2^i, i1)
			local b2 = bit32.band(2^i, i2)
			if b1 == b2 then
				ir = bit32.bor(ir, 2^i)
			end
		end
		return ir
	end
end

--逻辑异或运算
function QMPlugin.Xor(t1,t2)
	local i1, i2
	i1 = tonumber(t1)
	i2 = tonumber(t2)
	return bit32.bxor(i1, i2)
end 


--设置日志文件路径 
local log = {}
function QMPlugin.LogPath(path)
	log.path = path
end 
--日志记录 
function QMPlugin.OutLog(msg)
	local t = os.date("%H:%M:%S")
	local f = io.open(log.path,"a+")
	f:write(t.. "-\t"..msg.."\r\n")
    f:close()
end 

--挂载系统权限
function QMPlugin.Mount(path)
	local localpath, text, tmppath,tmpret
	local a = function()
		localpath = TempFile("mount")
		os.execute("mount > "..localpath)
		text = readfile(localpath)
		tmppath,tmpret = string.match(text,"\n([^ ]+ "..path..")([^,]+)") 
	end 	
	a()
	os.execute("mount -o rw,remount "..tmppath)
	a()
	if string.find(tmpret,"rw") then
		return true
	else 
		return false
	end 
end 
--[[挂载/system目录为读写，无参，返回挂载点  [作者：小玮]
function QMPlugin.mount()
	os.remove("/data/system.txt")
	os.execute("mount|grep system > /data/system.txt")
	f = io.open("/data/system.txt", "r") 
	xw = f:read("*all") 
	f:close()
	xw = string.sub(xw,1,string.find(xw," "))
	os.execute("su -c 'mount -o rw "..xw.." /system'")
	return xw
end
--]]

--获取XML文件 
function QMPlugin.GetUIXml()
	os.execute("uiautomator dump ")
	local ret = readfile("/sdscard/window_dump.xml")
	return ret
end 

--定时器 
local t={} 
function QMPlugin.TimeSign(id)
	t[id] = os.time()
end 
function QMPlugin.Timer(id,diff)
	local t1 =os.time()
	if t1-t[id] >= diff then
		t[id] = os.time()
		return true
	else 
		return false
	end 
end 

--清理后台,参数:白名单(不清理应用)，table类型  [作者：小玮]
function QMPlugin.KillClean(pgknamearr)
	local localpath = temppath().."list"
	local localpath1 = temppath().."ps"
	os.execute("ls /data/app/ > "..localpath)
	os.execute("ps > "..localpath1)
	local f
	ReadContent = readfile(localpath)
	ReadContent,_ = ReadContent:gsub("-[12]%.apk","")
	f = io.open(localpath,"w")
	f:write(ReadContent)
	f:close()
	ReadContent = readfile(localpath1)
	for l in io.lines(localpath) do
		n=0
		if string.find(ReadContent,l) then
			for i, v in ipairs(pgknamearr) do
				if v == l then
					n=1
				break
				end
			end
			if n==0 then
				os.execute("am force-stop "..l)
			end
		end
	end
end

--清理应用缓存  [作者：小玮]
function QMPlugin.AppClean(packagename)
	os.execute(string.format("pm clear %s",packagename))
end

--Base64加密Encoding  [作者：小玮]
function QMPlugin.Base64En(data)
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((data:gsub('.', function(x) 
		local r,key='',x:byte()
		for i=8,1,-1 do r=r..(key%2^i-key%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return key:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data%3+1])
end
--Base64解密Decoding  [作者：小玮]
function QMPlugin.Base64De(data)
	local key='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	data = string.gsub(data, '[^'..key..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(key:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end

--获取用户点击屏幕坐标
--参数为横向分辨率,纵向分辨率,扫描周期
--返回值为一个数组，第一个是x坐标，第二个是y坐标  [作者：小玮]
function QMPlugin.Coordinate(ScreenX,ScreenY,Time)
	local localpath = temppath().."Coordinate"
	os.execute("getevent -pl>"..localpath)
	file=io.open(localpath, "r+")
	data=file:read("*l")
	while data~=nil do
		data=file:read("*l")
		if data~=nil then
			find=nil
			_,_,find=data:find("ABS_MT_POSITION_X.*max%s+(%d*)")
				if find~=nil then
					maxx=find
				end
			find=nil
			_,_,find=data:find("ABS_MT_POSITION_Y.*max%s+(%d*)")
			if find~=nil then
				maxy=find
			end
		end
	end
	times=tostring(times)
	os.execute("getevent -l -c "..Time..">"..localpath)
	file=io.open(localpath, "r+");
	data=file:read("*l")
	while data~=nil do
		data=file:read("*l")
		if data~=nil then
			if data:find("ABS_MT_POSITION_X")~=nil then
				x= math.floor(tonumber(data:sub(59,62),16)*ScreenX/maxx)
			elseif data:find("ABS_MT_POSITION_Y")~=nil then
				y= math.floor(tonumber(data:sub(59,62),16)*ScreenY/maxy)
			end
		end
	end
	os.remove(localpath)
local C = {}
C[1] = x
C[2] = y
return C
end

local function digit_to(n,s)
	assert(type(n)=="number", "arg #1 error: need a number value.")
	assert(type(s)=="string", "arg #2 error: need a string value.")
	assert((#s)>1, "arg #2 error: too short.")
	local fl = math.floor
	local i = 0
	while 1 do
		if n>(#s)^i then
			i = i + 1
		else
			break
		end
	end
	local ret = ""
	while i>=0 do
		if n>=(#s)^i then
			local tmp = fl(n/(#s)^i)
			n = n - tmp*(#s)^i
			ret = ret..s:sub(tmp+1, tmp+1)
		else
			if ret~="" then
				ret = ret..s:sub(1, 1)
			end
		end
		i = i - 1
	end
	return ret
end
local function to_digit(ns,s)
	assert(type(ns)=="string", "arg #1 error: need a string value.")
	assert(type(s)=="string", "arg #2 error: need a string value.")
	assert((#s)>1, "arg #2 error: too short.")
	local ret = 0
	for i=1,#ns do
		local fd = s:find(ns:sub(i,i))
		if not fd then
			return nil
		end
		fd = fd - 1
		ret = ret + fd*((#s)^((#ns)-i))
	end
	return ret
end
local function s2h(str,spacer)return (string.gsub(str,"(.)",function (c)return string.format("%02x%s",string.byte(c), spacer or"")end))end
local function h2s(h)return(h:gsub("(%x%x)[ ]?",function(w)return string.char(tonumber(w,16))end))end
--unicode转utf8  [作者：小玮]
function QMPlugin.Unicode2Utf8(us)
	local u16p = {
		0xdc00,
		0xd800,
	}
	local u16b = 0x3ff
	local u16fx = ""
	local padl = {
		["0"] = 7,
		["1"] = 11,
		["11"] = 16,
		["111"] = 21,
	}
	local padm = {}
	for k,v in pairs(padl) do
		padm[v] = k
	end
	local map = {7,11,16,21}
	return (string.gsub(us, "\\[Uu](%x%x%x%x)", function(uc)
		local ud = tonumber(uc,16)
		for i,v in ipairs(u16p) do
			if ud>=v and ud<(v+u16b) then
				ud = ud - v + (i-1) * 0x40
				if (i-1)>0 then
					u16fx = digit_to(ud, "01")
					return ""
				end
				local bi = digit_to(ud, "01")
				uc = string.format("%x", to_digit(u16fx..string.rep("0",10-#bi)..bi,"01"))
				u16fx = ""
				ud = tonumber(uc,16)
				break
			end
		end
		local bins = digit_to(ud,"01")
		local pads = ""
		for _,i in ipairs(map) do
			if #bins<=i then
				pads = padm[i]
				break
			end
		end
		while #bins<padl[pads] do
			bins = "0"..bins
		end
		local tmp = ""
		if pads~="0" then
			tmp = bins
			bins = ""
		end
		while #tmp>0 do
			bins = "10"..string.sub(tmp, -6, -1)..bins
			tmp = string.sub(tmp, 1, -7)
		end
		return (string.gsub(string.format("%x", to_digit(pads..bins, "01")), "(%x%x)", function(w)
			return string.char(tonumber(w,16))
		end))
	end))
end
--utf8转unicode  [作者：小玮]
function QMPlugin.Utf82Unicode(s, upper)
	local uec = 0
	if upper then
		upper = "\\U"
	else
		upper = "\\u"
	end
	local loop1 = string.gsub(s2h(s), "(%x%x)", function(w)
		local wc = tonumber(w,16)
		if wc>0x7F then
			if uec>0 then
				uec = uec - 1
				if uec==0 then
					return w.."/"
				end
				return w
			end
			local bi = digit_to(wc, "01")
			bi = string.sub(bi, 2, -1)
			while string.sub(bi, 1, 1)=="1" do
				bi = string.sub(bi, 2, -1)
				uec = uec + 1
			end
			return "u/"..w
		else
			if uec>0 then
				uec = 0
				return w.."/"
			end
		end
		return w
	end)
	local u16p = {
		0xdc00,
		0xd800,
	}
	local u16id = 0x10000
	local loop2 = string.gsub(loop1, "u/(%x%x*)/", function(w)
		local wc = tonumber(w,16)
		local tmp
		local bi = digit_to(wc, "01")
		tmp = ""
		while #bi>8 do
			tmp = string.sub(bi, -6, -1)..tmp
			bi = string.sub(bi, 1, -9)
		end
		bi = bi..tmp
		while string.sub(bi, 1, 1)=="1" do
			bi = string.sub(bi, 2, -1)
		end
		wc = to_digit(bi, "01")
		if (wc>=u16id) then
			wc = wc - u16id
			tmp = digit_to(wc, "01")
			tmp = string.rep("0", 20-#tmp)..tmp
			local low = to_digit(string.sub(tmp, -10, -1), "01") + u16p[1]
			local high = to_digit(string.sub(tmp, 1, -11), "01") + u16p[2]
			tmp = string.format("%4x", low)
			return s2h(upper..string.format("%4x", high)..upper..string.format("%4x", low))
		end
		local h = string.format("%x", wc)
		if (#h)%2~=0 then
			h = "0"..h
		end
		return s2h(upper..h)
	end)
	return h2s(loop2)
end

--日期转换成时间戳  [作者：小玮]
function QMPlugin.ToTime(Date,format)
local Year,Month,Day,Hour,Min,Sec
Time = {}
_,_,Year,Month,Day,Hour,Min,Sec = Date:find(format)
Time.year=Year
Time.month=Month
Time.day=Day
Time.hour=Hour
Time.min = Min
Time.sec=Sec
return os.time(Time)
end
--秒数转换为天数  [作者：小玮]
function QMPlugin.SecToDay(Sec)
local Day,Hour,Min = 0,0,0
Sec = tonumber(Sec)
for i =1,Sec/60 do
	Min = Min + 1
	if Min == 60 then Min = 0 Hour = Hour + 1 end
	if Hour == 24 then Hour = 0 Day = Day + 1 end
end
Sec=Sec%60
return Day.."天"..Hour.."小时"..Min.."分"..Sec.."秒"
end
--用微信浏览器打开网页  [作者：小玮]
function QMPlugin.WeiXinUrl(packagename,url)
	os.execute(string.format("am start -n %s/.plugin.webview.ui.tools.WebViewUI -d '%s'",packagename,url))
end
--用默认浏览器打开网页  [作者：小玮]
function QMPlugin.OpenWeb(url)
	if url:find("http://") == nil then url = "http://"..url end
	os.execute(string.format("am start -a android.intent.action.VIEW -d "..url))
end

--两点经纬度之间的直线距离  [作者：小玮]
function QMPlugin.GetDistance(lat1,lng1,lat2,lng2)
	local rad = function(d) return d*math.pi/180 end
	local radLat1 = rad(lat1)
	local radLat2 = rad(lat2)
	return math.floor(2*math.asin(math.sqrt(math.pow(math.sin((radLat1-radLat2)/2),2)+math.cos(radLat1)*math.cos(radLat2)*math.pow(math.sin((rad(lng1) - rad(lng2))/2),2)))*6378.137*10000)/10000
--地球是一个近乎标准的椭球体,此处地球半径我们选择的是6378.137km
end

--对比是否到期,参数：到期时间的年、月、日、时、分、秒,返回值：到期返回-1,获取网络时间失败返回null,未到期返回距离到期剩余的时间(单位秒)  [作者：小玮]
function QMPlugin.CompareTime(Year,Month,Day,Hour,Min,Sec)
	local NowNetTime = LuaAuxLib.URL_Operation("http://52xiaov.com/getipinfo.php"):match("秒数%):(.-)</body>")
	if NowNetTime == nil then return null else NowNetTime = tonumber(NowNetTime) end
	local Time = {};Time.year=Year;Time.month=Month;Time.day=Day;Time.hour=Hour;Time.min = Min;Time.sec=Sec
	local ExpireTime = os.time(Time)
	if NowNetTime > ExpireTime then return -1 else return (ExpireTime - NowNetTime) end
end

--计算几天后的日期  [作者：小玮]
function QMPlugin.LateTime(late,Year,Month,Day)
	if Day ~= nil then
		local Time = {};Time.year=Year;Time.month=Month;Time.day=Day
		local starttime = os.time(Time)
	else
		local starttime = os.time()
	end
	return os.date("%Y-%m-%d",starttime + tonumber(late) * 24 * 60 * 60)
end

--获取通话状态，返回值为0，表示待机状态、1表示来电未接听状态、2表示电话占线状态  [作者：小玮]
function QMPlugin.CallState()
	local localpath = temppath().."CallState"
	os.execute("dumpsys telephony.registry > "..localpath)
	return readfile(localpath):match("mCallState=(.-)\n")
end
--获取来电号码  [作者：小玮]
function QMPlugin.CallIncomingNumber()
	local localpath = temppath().."CallIncomingNumber"
	os.execute("dumpsys telephony.registry > "..localpath)
	return readfile(localpath):match("mCallIncomingNumber=(.-)\n")
end



