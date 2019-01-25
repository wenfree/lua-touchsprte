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
	mSleep(1500)
end

function log(txt)
--	if tsint >= 235 then
--		toast(txt)
--	end
	nLog(txt)
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
function c_pic(t,name)
	x,y = findMultiColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6],t[7])
	if x > 0 and y > 0 then
		click(x,y)
		log("点图-->"..name)
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
function f_p(t,name)
	x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	if x >0 and y >0 then
		nLog("单点-->"..name)
		return true
	end
end
function c_p(t,name)
	local x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	if x >0 and y >0 then
		nLog("单点-->"..name)
		click(x,y)
		return true
	end
end
---找图-----
function c_tu(name)
	keepScreen(true)
	x, y = findImageInRegionFuzzy(name..".png", 80, 0, 120, 477, 1136, 0xffffff);
	if x ~= -1 and y ~= -1 then        
		click(x,y)
		log('找到图片->'..name)
		keepScreen(false)
		return true
	end
	keepScreen(false)
end
--单点模糊比色
function isColor(x,y,c,s)
	s = s or 90
    local fl,abs = math.floor,math.abs
    s = fl(0xff*(100-s)*0.01)
    local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
    local rr,gg,bb = getColorRGB(x,y)
    if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
        return true
    end
end
--输入---
function input(txt)
	inputText(txt)
	delay(2)
end
--多点验证比色
function done(tables,name,s)
	keepScreen(true)
	s = s or 95
	for i,v in ipairs(tables) do
		if isColor(v[1],v[2],v[3],s) then
		else
			keepScreen(false)
			return false
		end
	end
	keepScreen(false)
	nLog(name or '未命名')
	return true
end
--多点验证比色-end
function moveUp_one(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(50)
	for i = 0, math.abs(y1 - y2), 250 do
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
end
function moveto()
	touchDown(1, h/2, w/2); --在 (150, 550) 按下
	for i = 0, 50, 1 do   --使用for循环从起始点连续横向移动到终止点
		touchMove(1, h/2,w/2-i); 
		mSleep(20);        --延迟
	end
	touchUp(1, h/2, w/2-100); --在 (350, 550) 抬起
end
function moveXY(x1,y1,x2,y2)
	touchDown(1, x1, y1);  
	mSleep(math.random(20,50))
	touchMove(1, x1,y1-math.abs(y1 - y2)); 
	mSleep(50)
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
end
function movexy(x1,y1,x2,y2)
	touchDown(1, x1, y1);  
	mSleep(math.random(20,50))
	touchMove(1, x2, y2); 
	mSleep(math.random(20,50))
	touchUp(1, x2, y2); 
end
function moveUp(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(20)
	for i = 0, math.abs(y1 - y2), 2 do    
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
end
function movetoL(x,x1,y)
	log("左滑一下")
	touchDown(1, x, y); 
	mSleep(20)
	for i = 0,math.abs(x1 - x), 5 do   
		touchMove(1, x - i ,y); 
		mSleep(20);   
	end
	touchUp(1, x1, y); 
	delay(1)
end
function movetoR(x,x1,y)
	log("右滑一下")
	touchDown(1, x, y); --在 (150, 550) 按下
	mSleep(20)
	for i = 0,math.abs(x1 - x), 5 do   --使用for循环从起始点连续横向移动到终止点
		touchMove(1, x + i ,y); 
		mSleep(20);        --延迟
	end
	touchUp(1, x1, y); --在 (350, 550) 抬起
	delay(1)
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
	local res, code = http.request("http://www.ip.cn/");
	if code == 200 then
		local i,j = string.find(res, "%d+%.%d+%.%d+%.%d+")
		if i == nil or j == nil then
			return '0.0.0.0'
		end
		local ipaddr =string.sub(res,i,j)
		local k,l = string.find(res, "GeoIP:%s(.-)<")
		local ips = string.sub(res,k+6,l-1)
		ipstr = ipaddr..ips
		return ipstr
	end
end
--文件按行写入--------------
function writeFile(file_name,string,way)
	way = way or 'a'
	local f = assert(io.open(file_name, way))
	f:write(string.."\n")
	f:close()
end
--文件按行写入--------------
function writeFiles(file_name,string)
	local f = assert(io.open(file_name, 'w'))
	f:write(string.."\n")
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
function str_cut(str, split_char)
	local sub_str_tab = {};
	str_no = 1;
	for str_id in string.gmatch(str, "(%w+)"..split_char.."*") do
		sub_str_tab[str_no] = str_id
		str_no = str_no + 1;
	end
	return sub_str_tab
end
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
	--math.randomseed(rns..tostring(os.time()):reverse():sub(1, 6))
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
			file_zw=io.open("/User/Media/TouchSpriteENT/res/zhcn.txt","r")
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

nikename = readFile("/User/Media/TouchSpriteENT/res/nikename.txt")
pinglun = readFile("/User/Media/TouchSpriteENT/res/pinglun.txt")