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
	["config"]       = "nikeapps.dat",
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
                ["list"] = "注册(nike),提取(nike),复登帐号(snkrs)",
                ["select"] = "0",
			},
			{
				["type"] = "Label",
				["text"] = "注册批次",
				["size"] = 16,
				["align"] = "left",
				["color"] = "0,0,0",
			},
			{
				["id"] = "sms",
				["type"] = "Edit",
				["prompt"] = "1",
				["text"] = "1",
				["kbtype"] = "",
				["width"] = 200,
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
			},
			{
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
                ["list"] = "爱伪装,爱新机,自清理",
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
                ["list"] = "4G,不断网",
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
				["text"] =  "@shuaisports.com\n@ssnms.com\n@zzaha.com\n@vvccb.com",
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
                ["list"] = "随机密码(8位),固定密码",
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
                ["list"] = "斑马,信鸽,无平台",
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
				["text"] = "240",
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
				["list"] = "微信,支付宝,随机",
				["select"] = "0",
            },
		}
	}   
}

local MyJsonString = json.encode(MyTable);
UIret,UIvalues = showUI(MyJsonString)


if UIret == 1 then
	nLog(UIvalues.mail)
	mailheader = strSplit(UIvalues.mail,"\n")
	log(mailheader)
else
	lua_exit()
end
























