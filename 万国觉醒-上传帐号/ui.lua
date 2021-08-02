-- 万国觉醒
-- ui.lua  

-- Create By TouchSpriteStudio on 20:40:56   
-- Copyright © TouchSpriteStudio . All rights reserved.
require('tsp')	
	
local sz = require("sz")
local cjson = sz.json

-- local ts = require("ts")
-- local cjson = ts.json
w,h = getScreenSize();
log({w,h})
MyTable = {
["style"]  = "default",
["rettype"] = "table",
["width"] = w,
["height"] = h,
["orient"] = "0",
["bgcolor"] = "255,255,255",
["btnbkcolor"] = "238,236,225",
["config"] = "rok",
["pagetype"] = "multi",
["selpage"] = "1",
["pagenumtype"] = "number",
["titles"] = "第1页",
["timer"] = "30",
["cancelname"] = "取消",
["okname"] = "确定",
pages=        
    {
        { 
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "设置帐号",},
            {["type"] = "Edit",["color"] = "38,38,38",["prompt"] = "设置帐号",["size"] = "15",["id"] = "user_id",["align"] = "left",["text"] = "",["kbtype"] = "default",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "服务器选择",},
            { ["type"] = "RadioGroup", ["select"] = "0", ["id"] = "locals", ["list"] = "国服,国际服,台服,日服", },
        }
    },
} 
local MyJsonString = cjson.encode(MyTable);
UIret,UIv = showUI(MyJsonString)

if UIret == 1 then
    log(UIv)
else
	lua_exit()
end








