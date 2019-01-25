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
tsver = getTSVer();
tsint = tonumber(string.sub(tsver, 1, 1)..string.sub(tsver, 3,3)..string.sub(tsver, 5,5));
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
	else
		nLog('没有-->'..name)
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
	mSleep(50)
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
	string = string or "0.0.0.0" 
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
-- 生成随机字母
function RndLetter(i)
	local ret=""
	local V="abcdefghyjklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local z
	math.randomseed(os.time())  
	----然后不断产生随机数
	math.random(52)
	for i=1,i do 
			--ret = math. ret..chr(math.random(26))
			z=math.random(52)
			ret = ret..string.sub(V,z,z)
	end 
	return(ret)
end
function RndWord(i)
	local ret=""
	local V="赵钱孙李周吴郑王冯陈楮卫蒋沈韩杨朱秦尤许何吕施张孔曹严华"
	local z
	math.randomseed(os.time())  
	----然后不断产生随机数
	math.random(26)
	for i=1,i do 
			--ret = math. ret..chr(math.random(26))
			z=math.random(26)
			ret = ret..string.sub(V,z,z)
	end 
	return(ret)
end
function RndRoad()
	local ret=""
	local V={
			"上海","北京","广州","深圳","成都","重庆","杭州",
			"南京","沈阳","苏州","天津","人民","西南","东南",
			"中央","中山","人民","解放",
		}
	local z
	math.randomseed(os.time())  
	----然后不断产生随机数
	math.random(18)
	ret = V[math.random(18)]
	return(ret)
end
function RndRoads()
	local ret=""
	local V={
			"上海","北京","广州","深圳","成都","重庆","杭州",
			"南京","沈阳","苏州","天津","人民","西南","东南",
			"中央","中山","人民","解放",
		}
	local z
	math.randomseed(os.time())  
	----然后不断产生随机数
	math.random(18)
	ret = V[math.random(18)].."路"
	return(ret)
end
--<生成文本内容>
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