require("TSLib")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "aoc.dat",
    ["timer"]        = 60,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "剑与家园",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "功能选择",
                ["size"] = 16,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
			{
                ["id"] = "main",
                ["type"] = "RadioGroup",
                ["list"] = "本地帐号,服务器帐号",
                ["select"] = "0",
			},
			{
                ["type"] = "Label",
                ["text"] = "所有者:",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
            {
                ["id"] = "whos",
                ["type"] = "Edit",
                ["width"] = 400,
                ["prompt"] = "后台显示帐号",
                ["text"] = "admin",
            },   
			{
                ["type"] = "Label",
                ["text"] = "原来的脚本设置功能全部改为服务器台后控制\n http://news.wenfree.cn",
                ["size"] = 16,
                ["align"] = "center",
                ["color"] = "0,0,0",
            },
		}
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,UI_v = showUI(MyJsonString)
if UIret == 1 then
	nLog('功能选择:'..UI_v.main)
	nLog('所有者:'..UI_v.whos)
else
	lua_exit()
end





