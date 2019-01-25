require("TSLib")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();

MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "tlbb.dat",
    ["timer"]        = 66,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "天龙八部体验服",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {

		{
			{
                ["type"] = "Label",
                ["text"] = "功能选择:",
                ["width"] = 170,
            },
            {
                ["id"] = "game_main",
                ["type"] = "RadioGroup",
                ["list"] = "0创号,1领邮件,2练级",
                ["select"] = "2",
            },
			{
                ["type"] = "Label",
                ["text"] = "单号时长(单位【分】):",
                ["width"] = 500,
            },
            {
                ["id"] = "GameTime",
                ["type"] = "Edit",
                ["width"] = 170,
                ["prompt"] = "单号时间",
                ["text"] = "10",
                ["kbtype"] = "number",
                
            },
			{
                ["type"] = "Label",
                ["text"] = "切换wifi",
                ["width"] = 500,
            },
            {
                ["id"] = "wifi",
                ["type"] = "RadioGroup",
                ["list"] = "0飞行,1不换",
                ["select"] = "0",
            },
        },
		{
			{
                ["type"] = "Label",
                ["text"] = "第二页:",
                ["width"] = 170,
            },
        },
        {
			{
                ["type"] = "Label",
                ["text"] = "第三页:",
                ["width"] = 170,
            },
        },
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,values = showUI(MyJsonString)
if UIret == 1 then
	nLog('主线功能'..values.game_main)
	nLog('单号时间'..values.GameTime)
	nLog('wifi开关'..values.wifi)
else
	lua_exit()
end