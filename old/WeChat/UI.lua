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
	["timer"]        = 99,
	["orient"]       = 0,
	["pagetype"]     = "multi",
	["title"]        = "微信阅读",
	["cancelname"]   = "取消",
	["okname"]       = "开始",
	pages            =
	{

		{
			{
				["type"] = "Label",
				["text"] = "归属者(填后台帐号)",
				["size"] = 16,
				["align"] = "center",
				["color"] = "0,0,0",
			},
			{
				["id"] = "whos",
				["type"] = "Edit",
				["prompt"] = "归属谁的",
				["text"] = "admin",
				["kbtype"] = "default",
				["width"] = 475,
			},
			{
				["type"] = "Label",
				["text"] = "APP选择",
				["size"] = 14,
				["align"] = "center",
				["color"] = "0,0,0",
			},
            {
                ["id"] = "setting",
                ["type"] = "CheckBoxGroup",
                ["list"] = "0微信,1东方头条,2唔喱头条,3悦头条",
                ["images"] = "",
                ["select"] = "0@1@2@3",
                ["scale"] = 0.4,
            },



		}
	}   
}

local MyJsonString = json.encode(MyTable);
UIret,UIvalues = showUI(MyJsonString)

if UIret == 1 then
	log("whos..->"..UIvalues.whos)
	UIvalues.setting = strSplit(UIvalues.setting,'@')
	setting = {}
	for i=0,50 do
		for k,j in pairs(UIvalues.setting)do
			if i == tonumber(j)then
				setting[i] = true
				break
			else
				setting[i] = false
			end
		end
	end
else
	lua_exit()
end



























