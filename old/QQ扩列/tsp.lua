require("TSLib")
--  wenfree lua tsp
--  lua 基础封装

--定义全局变量
versions = 1.0

G ={}       --定义全局变量G
G.w,G.h =  getScreenSize()

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
	local bid = frontAppBid();
	if bid ~= app then
		log(app.."，准备启动")
		runApp(app)
		mSleep(times*1000)
	elseif bid == app then
		log("在前端")
		return true
	end
end

--杀掉一个app
function closeX(app_bid,way,times)
	local times = times or 1
	log("kill "..app_bid)
	if way then
		closeApp(app_bid,1)
	else
		closeApp(app_bid)
	end
	mSleep(times*1000)
end

--点击函数,点击的x,y 留停时间,按压时间,日志文字
function click(x,y,times,stayTime,logtxt)
	local times = times or 1
	local stayTime = stayTime or 0.05
	if logtxt then
		nLog("准备点击->"..logtxt.."("..x..","..y..")")
	end
	local offset_x = math.random(-3,3)
	local offset_y = math.random(-3,3)
	x = x + offset_x
	y = y + offset_y
	touchDown(1, x, y)
	mSleep(stayTime * 1000)
	touchUp(1, x, y)
	mSleep(times * 1000)
end
--延迟函数
function delay(times)
	local times = times or 1
	mSleep(times*1000)
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

--区域单点找色
function c_p(name,dj)
	if t[2] == "" then
		x,y = findColorInRegionFuzzy(t[1],t[3],t[4],t[5],t[6],t[7])
	else
		x,y = findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
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

--多点找色,name,是否点击,位置(位置,可以是表),点击后停留,hd是否滑动,滑动位置和步长表格,拓展参数(表格 {orient=1})
function 多点找色(name,clicks,order,stayTime,hd,hdtable,orient)
	local clicks = clicks or false
	local order = order or 1
	local stayTime = stayTime or 1
	local hd = hd or false
	local arr = {}
	if t[name] then
	    arr = t[name]
	else
	    dialog(name.."-->报错", 60)
	    return false
	end
	keepScreen(true)
    if orient then
        x,y = findMultiColorInRegionFuzzy(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7],orient)
    else
	    x,y = findMultiColorInRegionFuzzy(arr[1],arr[2],arr[3],arr[4],arr[5],arr[6],arr[7])
	end
	keepScreen(false)
	if x > 0 and y > 0 then
	    if hd then
	        moveTo(hdtable[1],hdtable[2],hdtable[3],hdtable[4],hdtable[5])
	        delay(stayTime)
	    else
            if clicks then
                local new_arr2 = split(arr[2],',')
                for i,v in pairs(new_arr2)do
                    new_arr2[i]=split(v,'|')
                end
                if type(order) == 'table' then
                    click(order[1],order[2],stayTime)
                else
                    if order == 1 then
                        click(x,y)
                    else
                        click(x+new_arr2[order-1][1],y+new_arr2[order-1][2])
                    end
                end
                if type(order) ~= 'table' then
                    log("点击-->( "..name..' )->'..order)
                end
            else
                log("找到-->"..name)
            end
        end
		return true
	end
end

--多点验证比色
function 多点比色(name,clicks,order,stayTime,hd,hdtable,orient)
	local oder = oder or 1
	local clicks = clicks or false
	local hd = hd or false
	local stayTime = stayTime or 1
	local arr = {}
    if t[name] then
        arr = t[name]
    else
	    dialog(name.."-->报错", 60)
	    return false
    end
    keepScreen(true)
	for i,v in ipairs(arr) do
		if not(isColor(v[1],v[2],v[3],s)) then
		    keepScreen(false)
			return false
		end
	end
	log('多点比色成功-->'..name)
	if hd then
        moveTo(hdtable[1],hdtable[2],hdtable[3],hdtable[4],hdtable[5])
        delay(stayTime)
	else
        if clicks then
            if type(oder) == "table" then
                click(order[1],order[2],stayTime)
            else
                click(arr[oder][1],arr[oder][2],1,stayTime)
            end
        end
    end
	keepScreen(false)
	return true
end
--多点验证比色-end

--比色合集d
function d(name,clicks,order,stayTime,hd,hdtable,orient)
--	print_r(t[name])
	if type(t[name][1]) == 'table' then
		return 多点比色(name,clicks,order,stayTime,hd,hdtable,orient)
	else
		return 多点找色(name,clicks,order,stayTime,hd,hdtable,orient)
	end
end
--输入函数
function input(txt,times)
	local times = times or 0.2
	inputText(txt)
	mSleep(1000*times)
end
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

--用http.get实现下载文件功能
function downFile(url, path)
    local sz = require("sz")
    local cjson = sz.json
    local http = sz.i82.http
    local status, headers, body = http.get(url)
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

--文件按行写入--------------
function writeFile(file_name,string,way)
	local string = string or "0.0.0.0"
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
	local sz = require("sz")
	local socket = require ("szocket")
	math.randomseed(rns..tostring(socket.gettime()):reverse():sub(1, 6))
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
			local mailheader={"@qq.com","@hotmail.com","@sohu.com","@163.com","@gmail.com"} --自行增减
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

--vpn函数整合
vpn ={
	on = function()
			local 计时 = os.time()
			local 超时 = 60 * 2
			while (os.time()-计时<=超时) do
				setVPNEnable(true)
				mSleep(2000)
				flag = getVPNStatus()
				if flag.active then
					log("VPN 打开状态"..flag.status)
					if flag.status == '已连接' then
						mSleep(1000)
						return true
					end
				end
			end
		end,
	off = function()
			setVPNEnable(false)
			mSleep(2000)
		end,
	state = function()
			flag = getVPNStatus()
			if flag.active then
				nLog("VPN 打开状态"..flag.status)
				if flag.status == '已连接' then
					return true
				end
			else
				log("VPN 关闭状态"..flag.status)
			end
		end
	}
--获取ip地址函数
function ip()
	local http = require("szocket.http")
	local res, code = http.request("http://pv.sohu.com/cityjson?ie=utf-8",30);
	if code ~= nil then
		local i,j = string.find(res, '%d+%.%d+%.%d+%.%d+')
		if i ~= nil and j ~= nil then return string.sub(res,i,j) end
	end
end
---------------VPN---------------
--展示一个文本框函数
function boxshow(txt,x1,y1,x2,y2)
	adbox__ = adbox__ or 0
	if adbox__ == 0 then
		adbox__ = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",10,0,x1,y1, x2,y2,0.5)
	--fwShowTextView("wid","textid","这是一个文本视图","center","FF0000","FFDAB9",0,20,0,0,200,100,0.5)
end

--post函数
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
--	log(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(url, 5, headers_send, post_escaped)
	if status_resp == 200 then
--		log(body_resp)
		local json = sz.json
		return json.decode(body_resp)
	end
end

--get函数
function get(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		return json.decode(res)
	end
end

--小随机函数
rd = function(min,max)
    if max then
        if min >= max then
            return math.random(max,min)
        else
            return math.random(min,max)
        end
    else
        return math.random(min)
    end
end


log('基础函数加载完成')
local deskbid__ = frontAppBid();
if deskbid__ == nil or deskbid__ == '' then
	log('com.apple.springbord')
else
	log(deskbid__)
end
















































