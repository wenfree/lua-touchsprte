width,hight=getScreenSize()
nLog(width..'*'..hight)
--local 桌面 = frontAppBid()
--if type(桌面) == 'string' then nLog(桌面) else nLog("桌面") end


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
						nLog(indent.."["..pos.."] => "..tostring(t).." {")
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."}")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos..'] => "'..val..'"')
					else
						nLog(indent.."["..pos.."] => "..tostring(val))
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
--解锁
function lock()
	flag = deviceIsLock();
	if flag ~= 0 then
		unlockDevice(); --解锁屏幕
	end
end
--app在前端
function active(app,times)
	local times = times or 5
	lock()
	bid = frontAppBid();
	if bid ~= app then
		log(app.."，准备启动")
		runApp(app)
		mSleep(times*1000)
	elseif bid == app then
		log(bid.."-在前端")
		return true
	end
end
function closeX(app_bid,times,way)
	local times = times or 1
	nLog("kill "..app_bid)
	if way then
		closeApp(app_bid,1)
	else
		closeApp(app_bid)
	end
	mSleep(times*1000)
end
function log(txt,show,times)
	local times = 1
	if type(txt) == 'table' then
		print_r(txt)
		return
	end
	if show == 'all' then
		toast(show,times)
		nLog(txt)
	elseif show then
		toast(txt,times)
	else
		nLog(txt)
	end
end
function click(x,y,times,stayTime,logtxt)
	local times = times or 1
	local stayTime = stayTime or 0.05
	if logtxt then
--	if 1 then
		nLog("准备点击->"..logtxt.."("..x..","..y..")")
--		nLog("准备点击->("..x..","..y..")")
	end
	local offset_x = math.random(-3,3)
	local offset_y = math.random(-3,3)
	touchDown(1, x, y)
	mSleep(stayTime * 1000)
	touchUp(1, x, y)
	mSleep(times * 1000)
end
function delay(times)
	local times = times or 1
	mSleep(times*1000)
end
function 多点找色(name,dj,order,logTxt,stayTime)
local dj = dj or false
local order = order or 1
local arr = {}
if type(name) == 'table' then
	if #name == 2 then
		arr = t[name[1]][name[2]]
	elseif #name == 3 then
		arr = t[name[1]][name[2]][name[3]]
	end
else
	arr = t[name]
end
x,y = findMultiColorInRegionFuzzy(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7])
if x > 0 and y > 0 then
	if dj then
		local new_arr2 = split(arr[2],',')
		for i,v in pairs(new_arr2)do
		new_arr2[i]=split(v,'|')
	end
--			print_r(new_arr2)
	if order == 1 then
		click(x,y)
	else
		click(x+new_arr2[order-1][1],y+new_arr2[order-1][2])
	end
	if type(name) ~= 'table' then
		log("点击-->( "..order..' )->'..name)
	end
else
	if type(name) ~= 'table' then
		log("找到-->( "..order..' )->'..name)
	end
end
--		if logTxt then 	log(logTxt) end
return true
end
end
--单点找色
function c_p(name,dj)
	if t[2] == "" then
		x,y= findColorInRegionFuzzy(t[1],t[3],t[4],t[5],t[6],t[7])
	else
		x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	end
	if x >0 and y >0 then
		dj = dj or false
		if dj then
			nLog("点击色点-->"..name)
			click(x,y)
		else
			nLog("找到单色-->"..name)
		end
		return true
	end
end
---找图-----
function c_tu(name,x1,y1,x2,y2,clicks,c,s)
	s = s or 80
	c = c or 0xffffff
	clicks = clicks or false
	x, y = findImageInRegionFuzzy(name..".png", s, x1,y1,x2,y2, c)
	if x ~= -1 and y ~= -1 then
		if clicks then
			click(x,y)
			nLog('点击图片->'..name)
		else
			nLog('找到图片->'..name)
		end
		return true
	end
end
--单点模糊比色
function isColor(x,y,c,s)
	local fl,abs,s= math.floor,math.abs, s or 90
	s = fl(0xff*(100-s)*0.01)
	local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
	local rr,gg,bb = getColorRGB(x,y)
	if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
		return true
	end
end
--输入---
function input(txt,way,times)
	local times = times or 1
	if way then
		inputStr(txt)
	else
		inputText(txt)
	end
	delay(times)
end
--多点验证比色
function 多点比色(name,clicks,oder,logTxt,s,stayTime)
local oder = oder or 1
local clicks = clicks or false
local s = s or 85
local arr = {}
if type(name) == 'table' then
	if #name == 2 then
		arr = t[name[1]][name[2]]
	elseif #name == 3 then
		arr = t[name[1]][name[2]][name[3]]
	end
else
	arr = t[name]
end
for i,v in ipairs(arr) do
	if not(isColor(v[1],v[2],v[3],s)) then
		return false
	end
end
if logTxt then
	nLog(logTxt)
else
	if type(name) == 'table' then
		nLog(name[1]..'->'..name[2])
	else
		nLog('多点比色成功-->'..name)
	end
end
if clicks then
	click(arr[oder][1],arr[oder][2],1,stayTime)
end
return true
end
--多点验证比色-end
function d(name,clicks,oder,logTxt,s,stayTime)
--	print_r(t[name])
	if type(t[name][1]) == 'table' then
		return 多点比色(name,clicks,oder,logTxt,s,stayTime)
	else
		return 多点找色(name,clicks,oder,logTxt,stayTime)
	end
end
--tab
--多点验证比色
function tab(name,clicks,oder,logTxt,s,stayTime)
	local oder = oder or 1
	local clicks = clicks or false
	local s = s or 85
	local arr = {}
	if type(name) == 'table' then
		if #name == 2 then
			arr = t[name[1]][name[2]]
		elseif #name == 3 then
			arr = t[name[1]][name[2]][name[3]]
		end
	else
		arr = t[name]
	end
	local index = 0
	for var= 1, #arr-1 do
		if (isColor(arr[var][1],arr[var][2],arr[var][3],s)) then
			index = index + 1
		elseif (isColor(arr[var][1],arr[var][2],arr[#arr][3],s)) then
			index = index + 1
		else
			return false
		end
	end

	if index >= #arr-1 then
		if logTxt then
			nLog(logTxt)
		else
			if type(name) == 'table' then
				nLog(name[1]..'->'..name[2])
			else
				nLog('tab->成功-->'..name)
			end
		end
		if clicks then
			nLog("click->"..oder)
			nLog(arr[oder][1])
			nLog(arr[oder][2])

			click(arr[oder][1],arr[oder][2],1,stayTime)
		end
		return true
	end
end
--滑动
function moveTo_(x1,y1,x2,y2,setp,times)
	local setp = setp or 5
	local times = times or 50
	touchDown(1, x1, y1)
	mSleep(times)
	if x1==x2 then
		if y2 > y1 then
			for x = y1,y2,setp do
				touchMove(1, x1, x)
				mSleep(times)
			end
		elseif y2 < y1 then
			for x = y1,y2,setp*(-1)do
			touchMove(1, x1, x)
			mSleep(times)
		end
	end
elseif y1==y2 then
	if x2>x1 then
		for x = x1,x2,setp do
			touchMove(1, x, y1)
			mSleep(times)
		end
	elseif x2<x1 then
		for x = x1,x2,setp*(-1)do
		touchMove(1, x, y1)
		mSleep(times)
	end
end
else
local k = ((y2-y1)/(x2-x1))
if x1 < x2 then
	touchDown(1, x1,y1)
	for x = x1+1, x2, setp do
		touchMove(1, x, (k*(x-x1))+y1 )
		mSleep(times)
	end
else
	touchDown(1, x1,y1)
	for x = x1+1, x2, setp*(-1)do
	touchMove(1, x, (k*(x-x1))+y1 )
	mSleep(times)
end
end
end
touchUp(1, x2,y2)
end
--将指定文件中的内容按行读取
function readFile(path)
	local file = io.open(path,"r");
	if file then
		local _list = {};
		for l in file:lines() do
			table.insert(_list,l)
		end
		file:close();
		return _list
	end
end
--list = readFile("/User/Media/TouchSprite/lua/wechat-reply.txt");
--参数说明：path为要读取文件的路径。
--返回值：返回一个table。
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
			return status;
		else
			return -1;
		end
	else
		return status;
	end
end
--downFile("http://mu1234.applinzi.com/wechat-reply.txt","/User/Media/TouchSprite/lua/wechat-reply.txt")
--检测指定文件是否存在
function file_exists(file_name)
	local f = io.open(file_name, "r")
	return f ~= nil and f:close()
end
--参数说明：path为要查找文件的路径。
--返回值：返回 true、false。
function ip()
	local http = require("szocket.http")
	local res, code = http.request("http://ip.cn",30);
	if code ~= nil then
		local i,j = string.find(res, '%d+%.%d+%.%d+%.%d+')
		return string.sub(res,i,j)
	end
end
function rd(min,max)
	local min = min or 1
	local max = max or min
	return math.random(min,max)
end
--文件按行写入--------------
function writeFile(file_name,string,way)
	string = string or "0.0.0.0" 
	way = way or 'a'
	local f = assert(io.open(file_name, way))
	f:write(string.."\n")
	f:close()
end
--文件按行写入--------------
--将指定文件中的内容按行读取
function readFile(path)
	local file = io.open(path,"r");
	if file then
		local _list = {};
		for l in file:lines() do
			table.insert(_list,l)
		end
		file:close();
		return _list
	end
end
--list = readFile("/User/Media/TouchSprite/lua/1.txt");
--参数说明：path为要读取文件的路径。
--返回值：返回一个table。
function RandName(i)
	local ret=""
	local V={
		'赵','钱','孙','李','周','吴','郑','王','冯','陈','楮','卫',
		'蒋','沈','韩','杨','朱','秦','尤','许','何','吕','施','张',
		'孔','曹','严','华'
	}
	local z
	math.randomseed(os.time())  
	----然后不断产生随机数
	math.random(#V)
	for i=1,i do 
		ret = math. ret..chr(math.random(#V))
		z=math.random(28)
		ret = ret..V[z]
	end 
	return(ret)
end
--<生成文本内容>
--字符串分割
function split(str,delim)
	if type(delim) ~= "string" or string.len(delim) <= 0 then
		return
	end
	local start = 1
	local t = {}
	while true do
		local pos = string.find (str, delim, start, true) -- plain find
		if not pos then
			break
		end
		table.insert (t, string.sub (str, start, pos - 1))
		start = pos + string.len (delim)
	end
	table.insert (t, string.sub (str, start))
	return t
end
--[[
例子：
a = "12334|3444te|2344555"
b = str_cut(a,"|") 
将字符串a以"|"为标示风格，结果存入数组b
各位同学可以自行打印一下b的内容看看结果
--]]
--[[参数1. rnType 表示随机类型
                1为输入随机数字
                2为随机手机号
                3为随机字母
                4为随机字母/数字(先字母后数字)，一般用于输用户名和密码，所以字母在前
                5为随机邮箱
                6为随机16进制
                7为随机中文(常用中文字库到度娘下载吧)
       参数2. rnLen 表示随机的长度
       参数3. rnUL 表示字母的大小写。1为大写、2为小写、其他为不区分，默认为不区分
　　以上三个参数，用不到的参数就不用填，用不到的参数你设置了不会出错，但也不会生效。
　　比如手机号只要一个rnType参数就行，生成数字就只要rnType、rnLen参数
　　如果随机结果有字母，且不区分大小写的话，也不用rnUL参数
 
　　脚本最后有示例，直接调试下就看出来效果了
]]
function myRand(rnType,rnLen,rnUL)
	local zmRan,HexRan,myrandS,rns
	rnUL=rnUL or 3
	rns=rns or 0  --用于精确随机种子
	rns=rns+1
	zmRan={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
		"R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h",
		"i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	HexRan={"0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f",
		"A","B","C","D","E","F"}
	myrandS=""
	math.randomseed(rns..tostring(os.time()):reverse():sub(1, 6))
	if rnType==1 then --生成数字
		myrandS=math.random(9)
		for r1=1,rnLen-1 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==2 then --生成手机号,rnLen,rn11无需设置
		local mheader={"13","15","18","17"}
		myrandS=mheader[math.random(#mheader)]
		for r1=1,9 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==3 then --生成字母
		for r1=1,rnLen do
			myrandS=myrandS..zmRan[math.random(52)]
		end
	elseif rnType==4 or rnType==5 then --生成数字/字母组合或邮箱
		local rn3=math.random(2,5)
		for r1=1,rn3 do
			myrandS=myrandS..zmRan[math.random(52)]
		end
		for r1=1,rnLen-rn3 do
			myrandS=myrandS..math.random(0,9)
		end
		if rnType==5 then
			local mailheader={"@qq.com","@hotmail.com","@sohu.com"} --自行增减
			myrandS=myrandS..mailheader[math.random(#mailheader)]
		end
	elseif rnType==6 then --生成16进制
		myrandS=HexRan[math.random(2,22)]
		for r1=1,rnLen-1 do
			myrandS=myrandS..HexRan[math.random(22)]
		end
	elseif rnType==7 then --生成中文
		if ZW_txt==nil then
			file_zw=io.open("/User/Media/TouchSprite/res/中文字库.txt","r")
			ZW_txt=file_zw:read("*all")
		end
		ZW_txt=ZW_txt or ""
		if ZW_txt=="" then return "无字库" end
		for r1=1,rnLen do
			local aaa=math.random(1,#ZW_txt/3)
			myrandS=myrandS..string.sub(ZW_txt,aaa*3+1,aaa*3+3)
		end
		return myrandS
	end
	if rnUL==1 then
		return string.upper(myrandS) --返回大写
	elseif rnUL==2 then
		return string.lower(myrandS) --返回小写
	else
		return myrandS
	end
end
--nLog(myRand(1,9))
--nLog(myRand(2))
--nLog(myRand(3,9,1))
--nLog(myRand(4,9,2))
--nLog(myRand(5,9,""))
--nLog(myRand(6,9))
--nLog(myRand(7,3))
function vpnx()
	setVPNEnable(false)
	mSleep(1000)
end
function vpn()
	setVPNEnable(true)
	mSleep(1000)
	local LineTime = os.time()
	local OutTimes = 60
	while (os.time()-LineTime<OutTimes) do
		flag = getVPNStatus()
		if flag.active then
			nLog("VPN 打开状态"..flag.status)
			if flag.status == '已连接' then
				return true
			end
		else
			nLog("VPN 关闭状态"..flag.status)
		end
		mSleep(1000)
	end
end
function vpnIsOk()
	flag = getVPNStatus()
	if flag.active then
		nLog("VPN 打开状态"..flag.status)
		if flag.status == '已连接' then
			return true
		end
	else
		nLog("VPN 关闭状态"..flag.status)
	end
end
---------------VPN---------------
function boxshow(txt,x1,y1,x2,y2)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",10,0,x1,y1, x2,y2,0.5)
	--fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
end

function post(url,arr)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = url
	headers_send = cjson.encode(headers)
	post_send = cjson.encode(arr)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(url, 5, headers_send, post_escaped)
	if status_resp == 200 then
--		dialog(body_resp)
		local json = sz.json
		return json.decode(body_resp)
	end
end

function get(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		return json.decode(res)
	end
end

log('基础函数加载完成')









































