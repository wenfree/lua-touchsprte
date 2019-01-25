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

localversvion = 7
url = "http://luawarehouse.applinzi.com/AD/verson.php"
local sz = require("sz")
local http = require("szocket.http")
local res, code = http.request(url);
if code == 200 then
	versvion = tonumber(res)
	if localversvion >= versvion then
		nLog('版本相同无需更新')
	else
		nLog('下载新版本')
		web_url = "http://luawarehouse.applinzi.com/AD/AD.lua";
		local_url = "/User/Media/TouchSprite/lua/AD.lua";
		downFile(web_url,local_url)
		dialog('脚本更新重新启动', 5)
		lua_exit();
	end
end

init("0",0)
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
		if k == nil or l == nil then
			return '0.0.0.0'
		end
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
-------------------------------------以上为基本封装------------------
show = {}
show[1] = "/User/Media/TouchSprite/lua/奇怪君.txt"
show[2] = "/User/Media/TouchSprite/lua/大橙子.txt"
show[3] = "/User/Media/TouchSprite/lua/仔岷解说.txt"
show[4] = "/User/Media/TouchSprite/lua/小智解说.txt"
ip_path = "/User/Media/TouchSprite/lua/"..os.date("%Y-%B-%d-").."ip.txt";
--字符串写入

zero = {
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
	'1|1',
}
show_mun = {}
ad_mun = {}
for k,v in pairs(show)do
	if file_exists(v)~=true then
		text = table.concat(zero, "|")
		writeFile(v,text)
	end
	show_mun[k] = readFile(v)
end
for i,v in ipairs(show_mun) do
	log(v[1])
	ad_mun[i]=str_cut(v[1],"|")
end

setting = "com.apple.Preferences"

app_bid = {}
app_bid['奇怪君'] = "com.zui.qiguaijun"
app_bid['大橙子'] = "com.zui.dachengzi"
app_bid['籽岷解说'] = "com.zhui.zimin"
app_bid['超级小智'] = "com.zui.xiaozhi"

wz = {}
wz['007'] = 'com.007gaiji.007gaiji'
wz['191'] = 'com.191gaiji.191gaiji'
wz['192'] = 'com.192gaiji.192gaiji'
wz['193'] = 'com.193gaiji.193gaiji'

empty = {}
empty[1]={{57,66,0xff0000},{574,61,0xff0000},{570,114,0xff0000},{56,114,0xff0000},}
empty[2]={{74,169,0xff8000},{564,164,0xff8000},{563,215,0xff8000},{78,213,0xff8000},}
empty[3]={{94,265,0xffff00},{514,261,0xffff00},{519,317,0xffff00},{123,314,0xffff00},}
empty[4]={{148,364,0x00ff00},{484,363,0x00ff00},{478,413,0x00ff00},{120,408,0x00ff00},}
empty[5]={{109,464,0x00ffff},{503,461,0x00ffff},{493,507,0x00ffff},{103,509,0x00ffff},}
empty[6]={{147,563,0x0000ff},{506,565,0x0000ff},{501,608,0x0000ff},{97,610,0x0000ff},}
empty[7]={{109,661,0x800080},{511,660,0x800080},{516,715,0x800080},{39,712,0x800080},}
empty[8]={{92,758,0xff0000},{538,758,0xff0000},{524,820,0xff0000},{68,820,0xff0000},}
empty[9]={{98,859,0xff8000},{527,858,0xff8000},{527,920,0xff8000},{120,913,0xff8000},}
empty[10]={{104,967,0xffff00},{493,967,0xffff00},{489,1017,0xffff00},{151,1016,0xffff00},}
empty[11]={{89,1061,0x00ff00},{505,1058,0x00ff00},{496,1122,0x00ff00},{114,1115,0x00ff00},}
---------------VPN--数组-------------------
m = {
	['x'] ={0xffffff, "8|9|0xffffff,0|5|0x000000,-6|9|0xffffff", 90, 588, 29, 612, 51},
	开={0xffffff, "-26|1|0xc8c8c8,4|-29|0xe0e0e0,4|29|0xa1a1a1", 90, 447, 475, 630, 675},
	['关']={0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675},
	后退={0x007aff, "-15|16|0x007aff,1|36|0x007aff,-20|16|0x0a80ff", 90, 4, 46, 123, 126},
	好={0x007aff, "12|0|0xf7f7f7", 99, 267, 646, 379, 743},
	好2={ 0x007aff, "14|7|0x007aff", 90, 300, 669, 329, 702},
	未安装sim卡 = { 0x017aff, "1|4|0xf6f7f6,4|0|0x007aff", 90, 287, 599, 345, 651},
	['设置']={	{307,83,0x000000},	{307,81,0xf7f7f7},	{307,70,0x000000},	{338,71,0x000000},},
	['正在连接']={ 0x000000, "8|0|0xffffff,11|0|0x000000,19|0|0xffffff", 90, 332, 600, 363, 607},
}
---------------数组 END ----------------
m['一键新机']={{164,431,0x45cd23},{193,433,0x45cd23},{422,435,0x45cd23},}
m.改机黑 = { 0x000000, 90, 200, 366, 458, 371}
m.改机红 = { 0xff0000, 90, 200, 366, 458, 371}
m['App正常']={{283,2,0xefeff4},{296,2,0xefeff4},{315,2,0xefeff4},{350,1,0xefeff4},{362,1,0xefeff4},}
---------------Event-事件---------------

function AD()
	for k,v in pairs(app_bid)do
		active(v,5)
	end
	delay(5)
	n = 1
	for k,v in pairs(app_bid)do
		active(v,5)
		if done(m.App正常,'App正常')then
			True_show = {0,0,0,0,0,0,0,0,0,0,0,0,}  --设置一个空的表
			---查询广告数量-------------------
			check_Time = os.time()
			local ad_show_mun = 0
			while os.time() - check_Time <= 3 do
				if v == frontAppBid() then
					for i,j in ipairs(empty) do
						if done(j,'empty')then
							
						else
							if True_show[i] == 0 then
								log("AD"..i.."~Show-one")
								ad_show_mun = ad_show_mun + 1
								ad_mun[n][i*2] = ad_mun[n][i*2] + 1
								True_show[i] = 1
							end
						end
						delay(0.1)
					end
				else
					break;
				end
				delay(0.5)
				log("广告统计数量为->"..ad_show_mun)
			end
			---查询END--------------
		end
		for l=1,11 do
			if ad_mun[n][(l-1)*2+1]/ad_mun[n][l*2] <= math.random(40,50)/1000 then
				ad_mun[n][(l-1)*2+1] = ad_mun[n][(l-1)*2+1] + 1
				click(empty[l][1][1],empty[l][1][2])
				delay(math.random(15,30))
				break;
			end
		end
		text = table.concat(ad_mun[n], "|")
		writeFiles(show[n],text)
		n = n + 1
		if c_pic(m.好,'好')or c_pic(m.好2,'好2') then
			break
		end
	end
	for ii,gg in pairs(app_bid)do
		closeApp(gg)
		delay(0.1)
	end
end

function WZ()
	for k,v in pairs(wz)do
		outTime = os.time()
		wz_step = 0
		while (true) do
			active(v)
			if wz_step == 0 then
				if done(m.一键新机,'一键新机')then
					click(316,433)
					wz_step = wz_step + 1
				end
			elseif wz_step == 1 then
				if f_p(m.改机黑,'改机黑') or f_p(m.改机红,'改机红')then
					wz_step = 0
					closeApp(v)
					break
				end
			end
			if os.time() - outTime > 10 then 
				return false
			end
			delay(1)
		end
	end
	return true
end
function wirteIp()
	if getNetTime()> 0 then
		ip_net = ip()
		if ip_net ~= nil and ip_net ~= false then
			writeFile(ip_path,ip_net)
			return true
		end
	end	
end
function VPN()
	setp = 0
	while (true) do
		active(setting)
		setp = setp or 0
		if setp == 0 then
			if done(m.设置,'设置')then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif c_pic(m.开,'开VPN')then
					setp = 1
				else
					click(327,21)
				end
			end
		elseif setp == 1 then
			if f_pic(m['正在连接'],'正在连接') then
				delay(1)
			elseif c_pic(m.开,'开VPN')then
				setp = 1
			elseif f_pic(m.关,"VPN-OK")then
				wirteIp()
				closeApp(setting)
				setp = 0
				return true
			end
		end
		c_pic(m.后退,"back")
		c_pic(m.好,'错误-好')
		c_pic(m.好2,'错误-好2')
		sotp = sotp or 0
		if sotp ~= setp98 then
			sotp = setp
			waitTimes = os.time()
			delay(0.5)
		elseif sotp == setp then
			waitTimes = waitTimes or os.time()
			if os.time() - waitTimes >= 120 then
				closeApp(frontAppBid())
				log("网络错误")
				delay(3)
				setp = 0
				return false
			end
			delay(0.5)
		end
	end
end
function VPNclose()
	init(0,0);
	outTime = os.time()
	setp = 0
	while (true) do
		active(setting)
		setp = setp or 0
		if setp == 0 then
			if done(m.设置,'设置-关',95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif f_pic(m.开,'开VPN')then
					return true
				else
					click(327,21)
				end
			end
		end
		delay(0.5)
		if os.time() - outTime >= 60 then
			closeApp(frontAppBid())
			delay(1)
		end
		c_pic(m.后退,"back")
		c_pic(m.好,'错误-好')
		c_pic(m.好2,'错误-好2')
		c_pic(m.未安装sim卡,'未安装sim卡')
	end
end
---------------Event-事件--END-------------
work_time_h = tonumber(os.date("%H"))
work_time_m = tonumber(os.date("%M"))
work_time_s = tonumber(os.date("%S"))
timeline = os.time() - work_time_h*60*60 - work_time_m*60 - work_time_s   ---把时间归为零时
while (true) do
	if os.time() - timeline >= 24*60*60-1 then
		ip_path = "/User/Media/TouchSprite/lua/"..os.date("%Y-%B-%d-").."ip.txt";
		work_time_h = tonumber(os.date("%H"))
		work_time_m = tonumber(os.date("%M"))
		work_time_s = tonumber(os.date("%S"))
		delay(5)
		timeline = os.time() - work_time_h*60*60 - work_time_m*60 - work_time_s
	end
	work_time_h = tonumber(os.date("%H"))
	if work_time_h <= 2 or work_time_h >= 6 then
		if VPNclose()then
			if WZ()then
				if VPN()then
					AD()
				end
			end
		end
	else
		delay(5)
		dialog("休息时间", 10)
	end
end















