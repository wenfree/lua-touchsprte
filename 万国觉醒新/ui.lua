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
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "选择国家",},
            {["type"] = "Edit",["color"] = "38,38,38",["prompt"] = "打野次数",["size"] = "15",["id"] = "country",["align"] = "left",["text"] = "2",["kbtype"] = "number",},
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








