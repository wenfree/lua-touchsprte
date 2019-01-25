local sz = require("sz")--写 showUI 前必须插入这一句
local json = sz.json--写 showUI 前必须插入这一句
w,h = getScreenSize();
MyTable = {
    ["style"]        =  "default",
    ["width"]        =  w,
    ["height"]       =  h,
    ["config"]       =  "xin.dat",
    ["timer"]        =  60,
    ["orient"]       =  0,
    ["pagetype"]     =  "multi",
    ["title"]        =  "友人云控",
    ["cancelname"]   =  "取消",
    ["okname"]       =  "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "登录帐号",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "帐号",
				["text"] = "username",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "密码",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
			{
				["type"] = "Edit",
				["prompt"] = "密码",
				["text"] = "password",
				["size"] = 15,
				["align"] = "left",
				["color"] = "0,0,0",
			},
            {
                ["type"] = "Label",
                ["text"] = "\n请输入友人云控对应帐号密码",
                ["size"] = 15,
                ["align"] = "center",
                ["color"] = "150,150,150",
            },
		}
    }   
}
local MyJsonString = json.encode(MyTable);
retTable = {showUI(MyJsonString)};

for i = 1,#retTable do
	mSleep(20)
	nLog(i.."--"..retTable[i])
end

if retTable[1] == 0 then
	lua_exit()
end








