require("TSLib")
require("tsp")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
	["style"]        = "default",
	["rettype"]      = "table",
	["width"]        = w,
	["height"]       = h,
	["config"]       = "nike2.dat",
	["timer"]        = 99,
	["orient"]       = 0,
	["pagetype"]     = "multi",
	["title"]        = "Nike",
	["cancelname"]   = "取消",
	["okname"]       = "开始",
	pages            =
	{

		{
			{
				["type"] = "Label",
				["text"] = "功能选择",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
                ["id"] = "work",
                ["type"] = "RadioGroup",
                ["list"] = "0_注册帐号,1_登录帐号,2_强制登录",
                ["select"] = "0",
            },
			{
				["type"] = "Label",
				["text"] = "提取N天前的帐号",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "day",
				["type"] = "Edit",
				["prompt"] = "1",
				["text"] = "1",
				["kbtype"] = "number",
				["width"] = 200,
			},			{
				["type"] = "Label",
				["text"] = "提取N复登次数的帐号",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "again",
				["type"] = "Edit",
				["prompt"] = "1",
				["text"] = "0",
				["kbtype"] = "number",
				["width"] = 200,
			},
			{
				["type"] = "Label",
				["text"] = "清理模式",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
                ["id"] = "clearMode",
                ["type"] = "RadioGroup",
                ["list"] = "0_自清理,1_AWZ,2_AWZ破解版",
                ["select"] = "0",
            },
			{
				["type"] = "Label",
				["text"] = "网络模式",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
                ["id"] = "netMode",
                ["type"] = "RadioGroup",
                ["list"] = "0_VPN,1_4G,2_不断网",
                ["select"] = "0",
            },
			{
				["type"] = "Label",
				["text"] = "飞行模式时间",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "wifitime",
				["type"] = "Edit",
				["prompt"] = "飞行模式时间",
				["text"] = "30",
				["kbtype"] = "number",
				["width"] = 475,
			},
			{
				["type"] = "Label",
				["text"] = "邮箱例表",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
				["type"] =  "TextArea",         -- 必填，控件类型，输入框
				["id"] = "mail",                  
				-- 选填，无，控件ID 以 table格式返回返回值时必填,否则无法获取返回值
				["text"] =  "@shuaisports.com",
				["prompt"] =  "填入邮箱,一行一个",       -- 选填，无，提示文字
				["size"] =  12,                 -- 选填，15，字体大小
				["align"] =  "left",          -- 选填，居左，对齐方式
				["width"] = 475,
				["height"] =  100,              -- 选填，75，空间高度(仅支持 iOS)
				["color"] =  "255,0,0",         -- 选填，黑色，字体颜色
				["kbtype"] = "ascii",          -- 选填，标准键盘，键盘类型
			},
			{
				["type"] = "Label",
				["text"] = "随机密码",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
                ["id"] = "password_key",
                ["type"] = "RadioGroup",
                ["list"] = "0_随机密码,1_固定密码",
                ["select"] = "0",
            },
			{
				["type"] = "Label",
				["text"] = "输入密码",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "password",
				["type"] = "Edit",
				["prompt"] = "这里是密码",
				["text"] = "Shuai2019tk",
				["kbtype"] = "ascii",
				["width"] = 475,
			},
			{
				["type"] = "Label",
				["text"] = "短信平台",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
                ["id"] = "smsPT",
                ["type"] = "RadioGroup",
                ["list"] = "0_爱尚,1_来信,2_165",
                ["select"] = "0",
            },
			{
				["type"] = "Label",
				["text"] = "活跃最短时间(秒)",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "look_min_time",
				["type"] = "Edit",
				["prompt"] = "活跃最短时间(秒)",
				["text"] = "30",
				["kbtype"] = "number",
				["width"] = 475,
			},
						{
				["type"] = "Label",
				["text"] = "活跃最长时间(秒)",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "look_max_time",
				["type"] = "Edit",
				["prompt"] = "活跃最长时间(秒)",
				["text"] = "500",
				["kbtype"] = "number",
				["width"] = 475,
			},
			{
				["type"] = "Label",
				["text"] = "支付平台",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "pay",
				["type"] = "RadioGroup",
				["list"] = "0_微信,1_支付宝,2_随机",
				["select"] = "0",
            },
		}
	}   
}

local MyJsonString = json.encode(MyTable);
UIret,UIvalues = showUI(MyJsonString)

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
--			local mailheader={"@qq.com","@hotmail.com","@sohu.com","@163.com","@foxmail.com","@gmail.com"} --自行增减
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

if UIret == 1 then
	nLog(UIvalues.mail)
	mailheader = strSplit(UIvalues.mail,"\n")
	log(mailheader)
else
	lua_exit()
end
























