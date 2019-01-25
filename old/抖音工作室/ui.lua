require("TSLib")
local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
    ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "dy.dat",
    ["timer"]        = 99,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "抖音工作室",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
    pages            =
    {

		{
            {
                ["type"] = "Label",
                ["text"] = "网络选择",
                ["size"] = 16,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
            {
                ["id"] = "net",
                ["type"] = "RadioGroup",
                ["list"] = "vpn,4g,保持原始",
                ["select"] = "0",
            },            
			{
                ["type"] = "Label",
                ["text"] = "功能选择",
                ["size"] = 16,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
            {
                ["id"] = "login",
                ["type"] = "RadioGroup",
                ["list"] = "关注,清理沙盒,全自动,纯登录,新版本纯关注",
                ["select"] = "0",
            },			
			{
                ["type"] = "Label",
                ["text"] = "性别选择",
                ["size"] = 16,
                ["align"] = "left",
                ["color"] = "0,0,0",
            },
            {
                ["id"] = "sex",
                ["type"] = "RadioGroup",
                ["list"] = "无,男,女",
                ["select"] = "0",
            },
        },
    }   
}

local MyJsonString = json.encode(MyTable);
UIret,UIv = showUI(MyJsonString)
if UIret == 1 then
	
else
	lua_exit()
end