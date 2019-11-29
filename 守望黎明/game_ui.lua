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
    ["title"]        = "守望黎明",
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
                ["type"] = "Label",
                ["align"] = "left",
                ["text"] = "升级",
                ["size"] = 14,
            },
			{
                ["id"] = "city_key",
                ["type"] = "RadioGroup",
                ["list"] = "不升,升级城堡",
                ["select"] = "1",
			},
			{
                ["type"] = "Label",
                ["align"] = "left",
                ["text"] = "转服开关",
                ["size"] = 14,
            },
			{
                ["id"] = "service_key",
                ["type"] = "RadioGroup",
                ["list"] = "不转,转服",
                ["select"] = "0",
			},
			{
                ["type"] = "Label",
                ["text"] = "转服迁城",
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["id"] = "service",
                ["type"] = "Edit",
                ["width"] = 400,
                ["prompt"] = "666",
                ["text"] = "666",
            },
			{
                ["type"] = "Label",
                ["text"] = "-------------------------------",
				["align"] = "center",
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
                ["text"] = "脚本设置功能全部改为服务器台后控制\n http://news.wenfree.cn",
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
	
	for k,v in pairs(UI_v) do
		nLog(k .. '->' .. v)
	end
	
else
	lua_exit()
end




















