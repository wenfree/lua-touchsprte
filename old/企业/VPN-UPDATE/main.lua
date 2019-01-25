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
function log(txt)
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
		log("找到-->"..name)
		return true
	end
end
function f_p(t,name)
	x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	if x >0 and y >0 then
		log("单点-->"..name)
		return true
	end
end
function c_p(t,name)
	local x,y= findColorInRegionFuzzy(t[1],t[2],t[3],t[4],t[5],t[6])
	if x >0 and y >0 then
		log("单点-->"..name)
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
	log(name or '未命名')
	return true
end
--多点验证比色-end
function moveUp_one(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(50)
	for i = 0, math.abs(y1 - y2), 300 do    
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
	math.randomseed(rns..tostring(os.time()):reverse():sub(1, 6))
	if rnType==1 then --生成数字
		myrandS=math.random(9)
		for r1=1,rnLen-1 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==2 then --生成手机号,rnLen,rn11无需设置
		local mheader={"13","15","18","19"}
		myrandS=mheader[math.random(#mheader)]
		for r1=1,9 do
			myrandS=myrandS..math.random(0,9)
		end
	elseif rnType==3 then --生成字母
		for r1=1,rnLen do
			myrandS=myrandS..zmRan[math.random(52)]
		end
	elseif rnType==4 or rnType==5 then --生成数字/字母组合或邮箱
		local rn3=math.random(2,rnLen)
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
			english=readFile("/User/Media/TouchSprite/res/英文字库.txt","r")
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
log('tsp加截完成')





m = {}
m.默认 = {0x007aff, "-3|6|0x007aff,0|6|0x007aff,-3|22|0x007aff,1|22|0x007aff,4|22|0x007aff", 90, 0, 400, 639, 498}
m.编辑 = {0x007aff, "-5|11|0x007aff,1|11|0x007aff,-5|19|0x087eff,3|19|0x99c6fb,-5|27|0x057dff,2|24|0x007aff", 90, 550, 60, 627, 110}
m.描述 = {0x303030, "0|7|0x000000,0|16|0x000000,-5|18|0x000000,4|15|0x000000,0|29|0x050505,-4|29|0x000000", 90, 25, 360, 100, 447}
m.服务器 = {0x000000, "9|0|0x181818,8|8|0x000000,1|8|0x000000,1|16|0x000000,5|16|0x000000,9|16|0x181818,8|27|0x000000,4|27|0x292929,-2|27|0x0a0a0a", 90, 30, 447, 135, 537}
m.账号 = {0x565656, "0|14|0x000000,0|28|0x030303,0|30|0x616161,5|28|0x989898,10|1|0x808080,3|10|0x000000,12|14|0x353535,4|26|0x737373", 90, 0, 0, 639, 1135}
m.密码 = {0x353535, "-13|3|0x020202,-13|9|0x0d0d0d,0|3|0x000000,14|3|0x020202,14|9|0x0d0d0d", 90, 0, 0, 639, 1135}
m.完成 = {0x007aff, "-12|4|0x007aff,-12|9|0x007aff,0|3|0x007aff,14|3|0x007aff,14|9|0x007aff", 90, 550, 60, 627, 110}
m.添加VPN = { 0x007aff, 90, 31, 234, 255, 262}
m.pptp = {  0x8e8e93, 90, 534, 230, 548, 231}
m.必填 = { 0xc7c7cd, "20|3|0xc7c7cd,56|-16|0xc7c7cd,51|5|0xc8c8ce", 90, 230, 160, 298, 717}
m.errore = { 0x007aff,90, 312, 679, 329, 695}

mSleep(2000)
c_p(m.errore,"error")

local sz = require("sz")
local phoneName = sz.system.mgcopyanswer("UserAssignedDeviceName")

function all()
do
    openURL("prefs:root=General&path=VPN");
	
	all = {}
	all['iPhone1']={'北京','111.231.66.116','cap1','cap1'}
	all['iPhone2']={'北京','111.231.66.116','cap2','cap2'}
	all['iPhone3']={'北京','111.231.66.116','cap3','cap3'}
	all['iPhone4']={'北京','111.231.66.116','cap4','cap4'}
	all['iPhone5']={'北京','111.231.66.116','cap5','cap5'}
	all['iPhone6']={'北京','111.231.66.116','cap6','cap6'}
	all['iPhone7']={'北京','111.231.66.116','cap7','cap7'}
	all['iPhone8']={'北京','111.231.66.116','cap8','cap8'}
	all['iPhone9']={'北京','111.231.66.116','cap9','cap9'}
	all['iPhone10']={'北京','111.231.66.116','cap10','cap10'}
	all['iPhone11']={'北京','111.231.66.116','cap11','cap11'}
	all['iPhone12']={'北京','111.231.66.116','cap12','cap12'}
	all['iPhone13']={'北京','111.231.66.116','cap13','cap13'}
	all['iPhone14']={'北京','111.231.66.116','cap14','cap14'}
	all['iPhone15']={'北京','111.231.66.116','cap15','cap15'}
	all['iPhone16']={'北京','111.231.66.116','cap16','cap16'}
	all['iPhone17']={'北京','111.231.66.116','cap17','cap17'}
	all['iPhone18']={'北京','111.231.66.116','cap18','cap18'}
	all['iPhone19']={'北京','111.231.66.116','cap19','cap19'}
	all['iPhone20']={'北京','111.231.66.116','cap20','cap20'}
	all['iPhone21']={'北京','111.231.66.116','cap21','cap21'}
	all['iPhone22']={'北京','111.231.66.116','cap22','cap22'}
	all['iPhone23']={'北京','111.231.66.116','cap23','cap23'}
	all['iPhone24']={'北京','111.231.66.116','cap24','cap24'}
	all['iPhone25']={'北京','111.231.66.116','cap25','cap25'}
	all['iPhone26']={'北京','111.231.66.116','cap26','cap26'}
	all['iPhone27']={'北京','111.231.66.116','cap27','cap27'}
	all['iPhone28']={'北京','111.231.66.116','cap28','cap28'}
	all['iPhone29']={'北京','111.231.66.116','cap29','cap29'}
	all['iPhone30']={'北京','111.231.66.116','cap30','cap30'}
	all['iPhone31']={'北京','111.231.66.116','cap31','cap31'}
	all['iPhone32']={'北京','111.231.66.116','cap32','cap32'}
	all['iPhone33']={'北京','111.231.66.116','cap33','cap33'}
	all['iPhone34']={'北京','111.231.66.116','cap34','cap34'}
	all['iPhone35']={'北京','111.231.66.116','cap35','cap35'}
	all['iPhone36']={'北京','111.231.66.116','cap36','cap36'}
	all['iPhone37']={'北京','111.231.66.116','cap37','cap37'}
	all['iPhone38']={'北京','111.231.66.116','cap38','cap38'}
	all['iPhone39']={'北京','111.231.66.116','cap39','cap39'}
	all['iPhone40']={'北京','111.231.66.116','cap40','cap40'}
	all['iPhone41']={'北京','111.231.66.116','cap41','cap41'}
	all['iPhone42']={'北京','111.231.66.116','cap42','cap42'}
	all['iPhone43']={'北京','111.231.66.116','cap43','cap43'}
	all['iPhone44']={'北京','111.231.66.116','cap44','cap44'}
	all['iPhone45']={'北京','111.231.66.116','cap45','cap45'}
	all['iPhone46']={'北京','111.231.66.116','cap46','cap46'}
	all['iPhone47']={'北京','111.231.66.116','cap47','cap47'}
	all['iPhone48']={'北京','111.231.66.116','cap48','cap48'}
	all['iPhone49']={'北京','111.231.66.116','cap49','cap49'}
	all['iPhone50']={'北京','111.231.66.116','cap50','cap50'}
	all['iPhone51']={'北京','111.231.66.116','cap51','cap51'}
	all['iPhone52']={'北京','111.231.66.116','cap52','cap52'}
	all['iPhone53']={'北京','111.231.66.116','cap53','cap53'}
	all['iPhone54']={'北京','111.231.66.116','cap54','cap54'}
	all['iPhone55']={'北京','111.231.66.116','cap55','cap55'}
	all['iPhone56']={'北京','111.231.66.116','cap56','cap56'}
	all['iPhone57']={'北京','111.231.66.116','cap57','cap57'}
	all['iPhone58']={'北京','111.231.66.116','cap58','cap58'}
	all['iPhone59']={'北京','111.231.66.116','cap59','cap59'}
	all['iPhone60']={'北京','111.231.66.116','cap60','cap60'}
	all['iPhone61']={'北京','111.231.66.116','cap61','cap61'}
	all['iPhone62']={'北京','111.231.66.116','cap62','cap62'}
	all['iPhone63']={'北京','111.231.66.116','cap63','cap63'}
	all['iPhone64']={'北京','111.231.66.116','cap64','cap64'}
	all['iPhone65']={'北京','111.231.66.116','cap65','cap65'}
	all['iPhone66']={'北京','111.231.66.116','cap66','cap66'}
	all['iPhone67']={'北京','111.231.66.116','cap67','cap67'}
	all['iPhone68']={'北京','111.231.66.116','cap68','cap68'}
	all['iPhone69']={'北京','111.231.66.116','cap69','cap69'}
	all['iPhone70']={'北京','111.231.66.116','cap70','cap70'}
	all['iPhone71']={'北京','111.231.66.116','cap71','cap71'}
	all['iPhone72']={'北京','111.231.66.116','cap72','cap72'}
	all['iPhone73']={'北京','111.231.66.116','cap73','cap73'}
	all['iPhone74']={'北京','111.231.66.116','cap74','cap74'}
	all['iPhone75']={'北京','111.231.66.116','cap75','cap75'}
	all['iPhone76']={'北京','111.231.66.116','cap76','cap76'}
	all['iPhone77']={'北京','111.231.66.116','cap77','cap77'}
	all['iPhone78']={'北京','111.231.66.116','cap78','cap78'}
	all['iPhone79']={'北京','111.231.66.116','cap79','cap79'}
	all['iPhone80']={'北京','111.231.66.116','cap80','cap80'}
	all['iPhone81']={'北京','111.231.66.116','cap81','cap81'}
	all['iPhone82']={'北京','111.231.66.116','cap82','cap82'}
	all['iPhone83']={'北京','111.231.66.116','cap83','cap83'}
	all['iPhone84']={'北京','111.231.66.116','cap84','cap84'}
	all['iPhone85']={'北京','111.231.66.116','cap85','cap85'}
	all['iPhone86']={'北京','111.231.66.116','cap86','cap86'}
	all['iPhone87']={'北京','111.231.66.116','cap87','cap87'}
	all['iPhone88']={'北京','111.231.66.116','cap88','cap88'}
	all['iPhone89']={'北京','111.231.66.116','cap89','cap89'}
	all['iPhone90']={'北京','111.231.66.116','cap90','cap90'}
	all['iPhone91']={'北京','111.231.66.116','cap91','cap91'}
	all['iPhone92']={'北京','111.231.66.116','cap92','cap92'}
	all['iPhone93']={'北京','111.231.66.116','cap93','cap93'}
	all['iPhone94']={'北京','111.231.66.116','cap94','cap94'}
	all['iPhone95']={'北京','111.231.66.116','cap95','cap95'}
	all['iPhone96']={'北京','111.231.66.116','cap96','cap96'}
	all['iPhone97']={'北京','111.231.66.116','cap97','cap97'}
	all['iPhone98']={'北京','111.231.66.116','cap98','cap98'}
	all['iPhone99']={'北京','111.231.66.116','cap99','cap99'}
	all['iPhone100']={'北京','111.231.66.116','cap100','cap100'}


	delay(2)
	

        while(true) do
			if c_p(m.添加VPN,'m.添加VPN ')then
				toast('第一次添加',1)
				mSleep(2000)
				setp = 1
				outTime = os.time()
				while os.time() - outTime < 60 do
					if setp == 1 then
						if f_p(m.pptp,'pptp')then
							setp = 2
						else
							click(607,242)
							click(441,520)
							click(26,84)
						end
					elseif setp == 2 then
						l = l or 1
						if f_pic(m.完成, "完成") then
							setp = 3
						elseif c_pic(m.必填,'必填')then
							input(all[phoneName][l])
							l = l + 1
						end
					elseif setp == 3 then
						click(567,1095)
						input(all[phoneName][l])
						if c_pic(m.完成, "完成") then
							delay(2)
							click(430, 680)
							return true
						end
					end
				end
            elseif c_pic(m.默认, "默认") then
				--return true
				
			elseif c_pic(m.编辑, "编辑") then
				if c_pic(m.描述,'描述')then
					toast('描述',2)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][1])
					delay(2)
				end
				if c_pic(m.服务器, "服务器") then
					toast('服务器',2)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][2])
					delay(2)
				end
				if c_pic(m.账号, "账号") then
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(all[phoneName][3])
					toast('账号',2)
					delay(2)
					click(567,1095)
				end
				if c_pic(m.密码, "密码") then
					input(all[phoneName][4])
					toast('密码',2)
					delay(2)
				end
				if c_pic(m.完成, "完成") then
					delay(2)
					click(430, 680)
					return true
				end
				delay(2)
			end
        end
    end
end


	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 60)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end

--[[
	all[120]={"北京","118.89.63.130","art10","art10"}


all['iPhone1']={'北京','111.231.66.116','cap1','cap1'}
all['iPhone2']={'北京','111.231.66.116','cap2','cap2'}
all['iPhone3']={'北京','111.231.66.116','cap3','cap3'}
all['iPhone4']={'北京','111.231.66.116','cap4','cap4'}
all['iPhone5']={'北京','111.231.66.116','cap5','cap5'}
all['iPhone6']={'北京','111.231.66.116','cap6','cap6'}
all['iPhone7']={'北京','111.231.66.116','cap7','cap7'}
all['iPhone8']={'北京','111.231.66.116','cap8','cap8'}
all['iPhone9']={'北京','111.231.66.116','cap9','cap9'}
all['iPhone10']={'北京','111.231.66.116','cap10','cap10'}
all['iPhone11']={'北京','111.231.66.116','cap11','cap11'}
all['iPhone12']={'北京','111.231.66.116','cap12','cap12'}
all['iPhone13']={'北京','111.231.66.116','cap13','cap13'}
all['iPhone14']={'北京','111.231.66.116','cap14','cap14'}
all['iPhone15']={'北京','111.231.66.116','cap15','cap15'}
all['iPhone16']={'北京','111.231.66.116','cap16','cap16'}
all['iPhone17']={'北京','111.231.66.116','cap17','cap17'}
all['iPhone18']={'北京','111.231.66.116','cap18','cap18'}
all['iPhone19']={'北京','111.231.66.116','cap19','cap19'}
all['iPhone20']={'北京','111.231.66.116','cap20','cap20'}
all['iPhone21']={'北京','111.231.66.116','cap21','cap21'}
all['iPhone22']={'北京','111.231.66.116','cap22','cap22'}
all['iPhone23']={'北京','111.231.66.116','cap23','cap23'}
all['iPhone24']={'北京','111.231.66.116','cap24','cap24'}
all['iPhone25']={'北京','111.231.66.116','cap25','cap25'}
all['iPhone26']={'北京','111.231.66.116','cap26','cap26'}
all['iPhone27']={'北京','111.231.66.116','cap27','cap27'}
all['iPhone28']={'北京','111.231.66.116','cap28','cap28'}
all['iPhone29']={'北京','111.231.66.116','cap29','cap29'}
all['iPhone30']={'北京','111.231.66.116','cap30','cap30'}
all['iPhone31']={'北京','111.231.66.116','cap31','cap31'}
all['iPhone32']={'北京','111.231.66.116','cap32','cap32'}
all['iPhone33']={'北京','111.231.66.116','cap33','cap33'}
all['iPhone34']={'北京','111.231.66.116','cap34','cap34'}
all['iPhone35']={'北京','111.231.66.116','cap35','cap35'}
all['iPhone36']={'北京','111.231.66.116','cap36','cap36'}
all['iPhone37']={'北京','111.231.66.116','cap37','cap37'}
all['iPhone38']={'北京','111.231.66.116','cap38','cap38'}
all['iPhone39']={'北京','111.231.66.116','cap39','cap39'}
all['iPhone40']={'北京','111.231.66.116','cap40','cap40'}
all['iPhone41']={'北京','111.231.66.116','cap41','cap41'}
all['iPhone42']={'北京','111.231.66.116','cap42','cap42'}
all['iPhone43']={'北京','111.231.66.116','cap43','cap43'}
all['iPhone44']={'北京','111.231.66.116','cap44','cap44'}
all['iPhone45']={'北京','111.231.66.116','cap45','cap45'}
all['iPhone46']={'北京','111.231.66.116','cap46','cap46'}
all['iPhone47']={'北京','111.231.66.116','cap47','cap47'}
all['iPhone48']={'北京','111.231.66.116','cap48','cap48'}
all['iPhone49']={'北京','111.231.66.116','cap49','cap49'}
all['iPhone50']={'北京','111.231.66.116','cap50','cap50'}
all['iPhone51']={'北京','111.231.66.116','cap51','cap51'}
all['iPhone52']={'北京','111.231.66.116','cap52','cap52'}
all['iPhone53']={'北京','111.231.66.116','cap53','cap53'}
all['iPhone54']={'北京','111.231.66.116','cap54','cap54'}
all['iPhone55']={'北京','111.231.66.116','cap55','cap55'}
all['iPhone56']={'北京','111.231.66.116','cap56','cap56'}
all['iPhone57']={'北京','111.231.66.116','cap57','cap57'}
all['iPhone58']={'北京','111.231.66.116','cap58','cap58'}
all['iPhone59']={'北京','111.231.66.116','cap59','cap59'}
all['iPhone60']={'北京','111.231.66.116','cap60','cap60'}
all['iPhone61']={'北京','111.231.66.116','cap61','cap61'}
all['iPhone62']={'北京','111.231.66.116','cap62','cap62'}
all['iPhone63']={'北京','111.231.66.116','cap63','cap63'}
all['iPhone64']={'北京','111.231.66.116','cap64','cap64'}
all['iPhone65']={'北京','111.231.66.116','cap65','cap65'}
all['iPhone66']={'北京','111.231.66.116','cap66','cap66'}
all['iPhone67']={'北京','111.231.66.116','cap67','cap67'}
all['iPhone68']={'北京','111.231.66.116','cap68','cap68'}
all['iPhone69']={'北京','111.231.66.116','cap69','cap69'}
all['iPhone70']={'北京','111.231.66.116','cap70','cap70'}
all['iPhone71']={'北京','111.231.66.116','cap71','cap71'}
all['iPhone72']={'北京','111.231.66.116','cap72','cap72'}
all['iPhone73']={'北京','111.231.66.116','cap73','cap73'}
all['iPhone74']={'北京','111.231.66.116','cap74','cap74'}
all['iPhone75']={'北京','111.231.66.116','cap75','cap75'}
all['iPhone76']={'北京','111.231.66.116','cap76','cap76'}
all['iPhone77']={'北京','111.231.66.116','cap77','cap77'}
all['iPhone78']={'北京','111.231.66.116','cap78','cap78'}
all['iPhone79']={'北京','111.231.66.116','cap79','cap79'}
all['iPhone80']={'北京','111.231.66.116','cap80','cap80'}
all['iPhone81']={'北京','111.231.66.116','cap81','cap81'}
all['iPhone82']={'北京','111.231.66.116','cap82','cap82'}
all['iPhone83']={'北京','111.231.66.116','cap83','cap83'}
all['iPhone84']={'北京','111.231.66.116','cap84','cap84'}
all['iPhone85']={'北京','111.231.66.116','cap85','cap85'}
all['iPhone86']={'北京','111.231.66.116','cap86','cap86'}
all['iPhone87']={'北京','111.231.66.116','cap87','cap87'}
all['iPhone88']={'北京','111.231.66.116','cap88','cap88'}
all['iPhone89']={'北京','111.231.66.116','cap89','cap89'}
all['iPhone90']={'北京','111.231.66.116','cap90','cap90'}
all['iPhone91']={'北京','111.231.66.116','cap91','cap91'}
all['iPhone92']={'北京','111.231.66.116','cap92','cap92'}
all['iPhone93']={'北京','111.231.66.116','cap93','cap93'}
all['iPhone94']={'北京','111.231.66.116','cap94','cap94'}
all['iPhone95']={'北京','111.231.66.116','cap95','cap95'}
all['iPhone96']={'北京','111.231.66.116','cap96','cap96'}
all['iPhone97']={'北京','111.231.66.116','cap97','cap97'}
all['iPhone98']={'北京','111.231.66.116','cap98','cap98'}
all['iPhone99']={'北京','111.231.66.116','cap99','cap99'}
all['iPhone100']={'北京','111.231.66.116','cap100','cap100'}



	--]]


