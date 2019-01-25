local sz = require("sz")--写 showUI 前必须插入这一句
local json = sz.json--写 showUI 前必须插入这一句
w,h = getScreenSize();
MyTable = {
    ["style"]        =  "default",
    ["width"]        =  w,
    ["height"]       =  h,
    ["config"]       =  "AD.dat",
    ["timer"]        =  60,
    ["orient"]       =  0,
    ["pagetype"]     =  "multi",
    ["title"]        =  "矩阵时代科技【广告联盟】",
    ["cancelname"]   =  "取消",
    ["okname"]       =  "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "刷机软件选择",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
                ["id"] = "newPhone",
                ["type"] = "RadioGroup",
                ["list"] = "阿波罗,AWZ",
                ["select"] = "0",
            },
		}
    }   
}
local MyJsonString = json.encode(MyTable);
UI = {showUI(MyJsonString)};

for i = 1,#UI do
	mSleep(20)
	nLog(i.."--"..UI[i])
end

if UI[1] == 0 then
	lua_exit()
end








