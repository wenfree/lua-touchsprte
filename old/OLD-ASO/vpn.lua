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
function log(txt,show,times)
	local show = show or false
	local times = times or 1
	if show then
		toast(txt,times)
	end
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
	local res, code = http.request("http://ipof.in/json");
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		return data.ip
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
function close_VPN()
	setVPNEnable(false)
	delay(1)
end





init('0',0);	--设置方向
local sz = require("sz")
local phoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")
nLog(phoneName)

vpn={}
--第一页
vpn['vpn']={{350,72,0x0b0b0b},{350,71,0xf5f5f7},}
vpn['修改']={ 0x007aff, "-2|-10|0xffffff,-2|-15|0x007aff,-2|-25|0x017bff", 90, 534, 387, 634, 503}
vpn['编辑']={ 0x007aff, "22|3|0x007aff,33|0|0x007aff", 90, 541, 58, 631, 117}
vpn['删除']={ 0xff3b30, "-3|-4|0xffffff,-3|-7|0xff3b30", 90, 241, 558, 399, 618}
vpn['添加VPN配置']={ 0x007aff, "131|19|0xffffff,131|18|0x007aff,234|17|0x007aff", 90, 18, 164, 344, 966}


--第二页
vpn['添加配置']={{382,70,0x000000},{379,72,0xf5f5f7},{382,75,0x000000},{384,79,0x000000},}
vpn['IKEv2']={ 0xc7c7cc, "-4|0|0xffffff,-10|-9|0xc7c7cc,-10|11|0xc7c7cc", 90, 462, 215, 626, 279}
--vpn['IKEv2']={ 0x929297, "8|-11|0x929297,35|-11|0x8e8e93,73|8|0xffffff,81|11|0x8e8e93", 90, 462, 215, 626, 279}
vpn['l2tp']={{493,230,0x97979c},{539,233,0x8e8e93},{541,233,0xffffff},{552,230,0x97979c},}
vpn['IPSec']={ 0xc51230, "45|-1|0xc51230,103|0|0xc51230", 90, 223, 228, 408, 289}
vpn['必填']={ 0xc7c7cd, "11|0|0xfdfdfe,46|-2|0xc7c7cd,46|-20|0xfbfbfc", 90, 219, 464, 309, 709}
vpn['l2tp必填']={ 0xc7c7cd, "11|0|0xfdfdfe,46|-2|0xc7c7cd,46|-20|0xfbfbfc", 90, 211, 369, 321, 432}
vpn['完成']={ 0x007aff, "14|5|0x007aff", 90, 546, 61, 634, 116}

--类型--(587,329)(21,83)
vpn['类型']={{331,73,0xebebed},{332,73,0x000000},{345,83,0xf6f6f7},{346,84,0x0d0d0e},}


ios={}
for i=1,300 do
	ios[name]={}
	loc = '全国随机'
	ios[name][1]= loc
	service = '101.132.35.123'
	ios[name][2]= service
	account = 'jfq'..i
	ios[name][3] = account
	passwrod = 'Aa112211'
	ios[name][4] = passwrod
	ios[name][5] = 'ipsecgroup'
	ios[name][6] = 'ipseckey'
end

function vpn_set()
	计时 = os.time()
	超时 = 60
	ipsec = true
	修改 = false
	
	while os.time()-计时<超时 do
		if done(vpn['vpn'],'vpn')then
			if c_pic(vpn['修改'],'修改',true)then
				if c_pic(vpn['删除'],'删除',true)then
					click(189,629)
				end
			else
				c_pic(vpn['添加VPN配置'],'添加VPN配置',true)
				mSleep(1000* 3)
			end
		elseif done(vpn['添加配置'],'添加配置',false)then
			if c_pic(vpn['IPSec'],'IPSec',false)then
				ipsec = false
			end
			if ipsec then
				log('查找IKEv2')
				if c_pic(vpn['IKEv2'],'IKEv2',true)then
					mSleep(1000)
					click(587,329)
					click(21,83)
				end
			else
				--开始填次料
				log('开始填')
				if c_pic(vpn['必填'],'必填',true)then
					input(ios[phoneName][1])
					click(557,1094)	--换行
					for i = 2,6 do
						input(ios[phoneName][i])
						if i == 6 then
							if c_pic(vpn['完成'],'完成',true)then
								delay(3)
								return true
							end
						else
							click(557,1094)	--换行
						end
					end
				end
			end
		else
			openURL("prefs:root=General&path=VPN");
			mSleep(1000*3)
		end
		mSleep(1000*1)
	end
end
function vpn_set_l2tp()
	计时 = os.time()
	超时 = 60
	l2tp = true
	修改 = false
	
	while os.time()-计时<超时 do
		if done(vpn['vpn'],'vpn')then
			if c_pic(vpn['修改'],'修改',true)then
				if c_pic(vpn['删除'],'删除',true)then
					click(189,629)
				end
			else
				c_pic(vpn['添加VPN配置'],'添加VPN配置',true)
				mSleep(1000* 3)
			end
		elseif done(vpn['添加配置'],'添加配置')then
			if done(vpn['l2tp'],'l2tp',false,1)then
				l2tp = false
			end
			if l2tp then
				log('查找IKEv2')
				if c_pic(vpn['IKEv2'],'IKEv2',true)then
					mSleep(1000)
					click(577,423)
					click(21,83)
				end
			else
				--开始填次料
				log('开始填')
				if c_pic(vpn['l2tp必填'],'l2tp必填',true)then
					input(ios[phoneName][1])
					click(557,1094)	--换行
					for i = 2,6 do
						input(ios[phoneName][i])
						if i == 5 then
							if c_pic(vpn['完成'],'完成',true)then
								delay(3)
								return true
							end
						else
							click(557,1094)	--换行
						end
					end
				end
			end
		else
			openURL("prefs:root=General&path=VPN");
			mSleep(1000*3)
		end
		mSleep(1000*1)
	end
end
vpn_set()


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


hosts_Url = 'http://luawarehouse.applinzi.com/OLD-ASO/hosts'
local_path = '/etc/hosts'

downFile(hosts_Url, local_path)

setting_Url = 'http://luawarehouse.applinzi.com/OLD-ASO/asosetting.txt'
local_path = '/var/mobile/asosetting.txt'

downFile(setting_Url, local_path)
--ASO后台api
service_link = "http://muser.safoo.com.cn"

username = 'asobj'
pass = 'qwertyuiop'


function upPhone(t)
	local sz = require("sz")
	local cjson = sz.json
	local http = sz.i82.http

	safari = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36'
	service = service_link.."/api/upload_phone"

	headers = {}
	headers['User-Agent'] = safari
	headers['Referer'] = service
	headers_send = cjson.encode(headers)
	
	post_send = cjson.encode(t)
	nLog(post_send)
	post_escaped = http.build_request(post_send)
	status_resp, headers_resp, body_resp = http.post(service, 3, headers_send, post_escaped)
	
	nLog(body_resp)
	if status_resp == 200 then
		nLog('通讯成功')
		local json = sz.json
		loginData = json.decode(body_resp)
		
		if loginData.code == 0 then
			nLog("接口成功")
			mSleep(200)
			return true
		end
	end
end

local sz = require("sz")
iphoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")  --设备名
iphoneId = getDeviceID(); --帮你玩禁用此函数--触动精灵唯一函数

post = {}
post.name = iphoneName
post.uid = iphoneId
post.imei = sz.system.serialnumber()
post.username = username
post.os_version = getOSVer()
post.pass = pass

if upPhone(post)then
	toast('矩阵科技 ASO系统欢迎您',5)
else
	toast('帐号密码错误',5)
	lua_exit()
end
---------------------------------begin----------------------------------------
nLog("Api加截完成")













