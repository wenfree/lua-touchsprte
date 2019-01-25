w,h=getScreenSize()

function lock()
	flag = deviceIsLock();
	if flag == 0 then
	--	log("未锁定");
	else
		unlockDevice(); --解锁屏幕
	end
end
function active(app,t)
	t = t or 0.5
	lock()
	bid = frontAppBid();
	if bid ~= app then
		log(app.."，准备启动")
		runApp(app)
		mSleep(t*1000)
		return true
	end
end
function closeX(app_bid)
	nLog("杀掉 "..app_bid.." 进程")
	closeApp(app_bid,1)
	mSleep(2000)
end

--深度打印一个表,可以单独调用
function print_r(t)
	local print_r_cache={}
	local function sub_print_r(t,indent)
		if (print_r_cache[tostring(t)]) then
			nLog(indent.."*"..tostring(t))
		else
			print_r_cache[tostring(t)]=true
			if (type(t)=="table") then
				for pos,val in pairs(t) do
					if type(pos) == "string" then
						pos = "'"..pos.."'"
					end
					if (type(val)=="table") then
						nLog(indent.."["..pos.."] = {   --"..tostring(t))
						sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
						nLog(indent..string.rep(" ",string.len(pos)+6).."},")
					elseif (type(val)=="string") then
						nLog(indent.."["..pos.."] = ".."'"..val.."',")
					else
						nLog(indent.."["..pos.."] = "..tostring(val)..",")
					end
				end
			else
				nLog(indent..tostring(t))
			end
		end
	end
	if (type(t)=="table") then
		nLog("{  --"..tostring(t))
		sub_print_r(t,"	")
		nLog("}")
	elseif (type(t)=="string") then
		nLog(t)
	end
end

--打印函数,日志函数
function log(txt,show,times)
    if txt == nil or txt == '' then txt = 'Null'end
	local times = 1;
	if type(txt) == 'table' then
		print_r(txt)
		if show then log('table',true) end
    else
        if show == 'all' then
            toast(show,times)
            nLog(txt)
        elseif show then
            toast(txt,times)
        else
            nLog(txt)
        end
	end
end

function click(x,y,times)
	times = times or 1
--	log("准备点击("..x..","..y..")")
	touchDown(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(50)
	touchUp(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(1000*times)
end
function delay(times)
	times = times or 1
	mSleep(times*1000)
end
function c_pic(t,name,clicks)
	x,y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
	if x > 0 and y > 0 then
		clicks = clicks or false
		if clicks then
			click(x,y)
			nLog("点图-->"..name)
		else
			nLog("找到-->"..name)
		end
		return true
	end
end
function f_pic(t,name)
	x,y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
	if x > 0 and y > 0 then
		nLog("找到-->"..name)
		return true
	end
end

function c_p(t,name,clicks)
	if t[2] == "" then
		x,y= findColorInRegionFuzzy(t[1],t[3],t[4],t[5],t[6],t[7])
	else
		x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	end
	if x >0 and y >0 then
		clicks = clicks or false
		if clicks then
			nLog("单点击-->"..name)
			click(x,y)
		else
			nLog("单点-->"..name)
		end
		return true
	end
end
function f_p(t,name)
	x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	if x >0 and y >0 then
		nLog("单点-->"..name)
		return true
	else
		nLog('没有-->'..name)
	end
end
---找图-----
function c_tu(t,clicks)
	clicks = clicks or false
	x, y = findImageInRegionFuzzy(t[1] ..".png", 80, t[2], t[3], t[4], t[5], 0xffffff);
	if x ~= -1 and y ~= -1 then
		if clicks then
			click(x,y)
			log('点击图片->'..t[1])
		else
			log('找到图片-->'..t[1])
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
function input(txt,times)
	local times = times or 0.2
	inputText(txt)
	mSleep(1000*times)
end
--多点验证比色
function done(tables,name,clicks,oder,s)
	oder = oder or 1
	clicks = clicks or false
	s = s or 95
	for i,v in ipairs(tables) do
		if isColor(v[1],v[2],v[3],s) then
		else
			return false
		end
	end
	nLog(name or '未命名')
	if  clicks then
		click(tables[oder][1],tables[oder][2])
	end
	return true
end
--多点验证比色-end
function moveTo(x1,y1,x2,y2,setp,times)
	setp = setp or 5
	times = times or 50
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
--//向上滑动
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
	local res, code = http.request("http://ip.chinaz.com/getip.aspx");
	nLog(res)
	if code == 200 then
		local i,j = string.find(res, "%d+%.%d+%.%d+%.%d+")
		local ipaddr =string.sub(res,i,j)
		return ipaddr
	else
		return false
	end
end
--文件按行写入--------------
function writeFile(file_name,string,way)
	way = way or 'a'   --w or a
	local f = assert(io.open(file_name, way))
	f:write(string)
	f:close()
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
--list = readFile("/User/Media/TouchSprite/lua/1.txt");
--参数说明：path为要读取文件的路径。
--返回值：返回一个table。

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

function boxshow(txt)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",10,0,h-150,w-200,h,w-120,0.5)
	--fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
end

function close_VPN()
	setVPNEnable(false)
	delay(1)
end
function VPN()
	计时 = os.time()
	超时 = 60 * 2
	while (os.time()-计时<=超时) do
		setVPNEnable(true)
		mSleep(2000)
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
end

function VPNisOK()
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

function beforeUserExit()
	close_VPN()
end
---------------VPN---------------
function inputword(key)
	for i = 1,string.len(key) do
		nLog(string.sub(key,i,i))
		inputkey = string.sub(key,i,i)
		inputkey = tonumber(inputkey)
		if type(inputkey) == 'number' then
			--nLog('munber->'..inputkey)
		else
			inputkey = string.sub(key,i,i)
			inputkey = string.lower(inputkey)
		end
		keyDown(inputkey)
		keyUp(inputkey)
		mSleep(100)
	end
end



function 多点找色(name,dj,order,logTxt,stayTime)
	local dj = dj or false
	local order = order or 1
	local arr = t[name]
	
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
		if logTxt then 	
			nLog(logTxt) 
		end
		return true
	end
end

--多点验证比色
function 多点比色(name,clicks,oder,logTxt,s,stayTime)
	local oder = oder or 1
	local clicks = clicks or false
	local s = s or 85
	local arr = t[name]
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

function post(url,arr)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http
	local safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	local headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = url
	headers_send = cjson.encode(headers)
	local post_send = cjson.encode(arr)
	nLog(post_send)
	local post_escaped = http.build_request(post_send)
	local status_resp, headers_resp, body_resp = http.post(url, 5, headers_send, post_escaped)
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
local sz = require("sz")
nLog('基础函数OK')










