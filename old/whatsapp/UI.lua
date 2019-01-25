local sz = require("sz")--写 showUI 前必须插入这一句
local json = sz.json--写 showUI 前必须插入这一句
w,h = getScreenSize();


MyTable = {
    ["style"]        =  "default",
    ["width"]        =  w,
    ["height"]       =  h,
    ["config"]       =  "whatsapp.dat",
    ["timer"]        =  60,
    ["orient"]       =  0,
    ["pagetype"]     =  "multi",
    ["title"]        =  "矩阵时代科技【WhatsApp】",
    ["cancelname"]   =  "取消",
    ["okname"]       =  "开始",
    pages            =
    {
		{
            {
                ["type"] = "Label",
                ["text"] = "第一句话填内容",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "content1",
                ["type"] = "Edit",
                ["prompt"] = "请输入第一句话的合集用 .|. 分开",
                ["text"] = "Hello| Hello,honey.| Hi, nice to meet you.| Hi,are you online?",
            },
            {
                ["type"] = "Label",
                ["text"] = "第二句话填内容",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "content2",
                ["type"] = "Edit",
                ["prompt"] = "请输入第一句话的合集用 .|. 分开",
                ["text"] = "This is our newest jersey, do you like it?| Here are the pictures of our newest jersey| Here are the newest jersey with top quality. Are you interested?",
            },
            {
                ["type"] = "Label",
                ["text"] = "第三句话填内容",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "content3",
                ["type"] = "Edit",
                ["prompt"] = "请输入第一句话的合集用 .|. 分开",
                ["text"] = "If you like our jersey, please feel free to contact us.| These are the newest jerseys with high quality and favourable price. We can give you the URL and discount code if you like.| We have many jerseys with top quality, please contact us if you are interested in and we can offer you a discount.",
            },
            {
                ["type"] = "Label",
                ["text"] = "句与句之前间隔",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "句time",
                ["type"] = "Edit",
                ["prompt"] = "请输入一个数字",
                ["text"] = "5",
				["kbtype"] = "number",
            },
            {
                ["type"] = "Label",
                ["text"] = "下一个对话开始间隔",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "人time",
                ["type"] = "Edit",
                ["prompt"] = "请输入一个数字",
                ["text"] = "15",
				["kbtype"] = "number",
            },
            {
                ["type"] = "Label",
                ["text"] = "选择发图模式",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "发图模式",
                ["type"] = "RadioGroup",
                ["list"] = "完全随机,不重复随机,按顺序发",
                ["select"] = "1",
            },
            {
                ["type"] = "Label",
                ["text"] = "下一个对话开始间隔",
                ["size"] = 15,
                ["align"] = "left",
                ["color"] = "200,0,100",
            },
            {
                ["id"] = "发送数量",
                ["type"] = "Edit",
                ["prompt"] = "请输入一个数字",
                ["text"] = "140",
				["kbtype"] = "number",
            },
		},

    }   
}
local MyJsonString = json.encode(MyTable);
UI = {showUI(MyJsonString)};
nLog("UI开始"..UI[1])
if UI[1] == 0 then
	lua_exit()
end

for i = 1,#UI do
	mSleep(20)
	nLog(i.."--"..UI[i])
end







