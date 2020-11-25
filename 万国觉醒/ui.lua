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
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "UI选择",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "ui选择",["list"] = "手机,帐号,全局",},
            {["type"] = "ComboBox",["id"] = "国家",["list"] = "1贞德,2孙武,3海尔曼,4贝利撒留,5布狄卡,6西庇阿,7楠木正成",["select"] = "0",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "建筑升级",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "升级",["list"] = "开,关,车厂升级",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "奖励领取",},
            {["type"] = "RadioGroup",["select"] = "1",["id"] = "奖励",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "建造新建筑",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "建造",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "任务开关",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "任务",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "英雄召唤",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "英雄",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "造兵设置",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "造兵key",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "兵种选择",},
            {["type"] = "CheckBoxGroup",["select"] = "3",["id"] = "兵种选择",["list"] = "步兵,骑兵,弓手,车兵",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "采集关开",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "采集key",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "种类选择",},
            {["type"] = "RadioGroup",["select"] = "5",["id"] = "采集种类",["list"] = "粮,木,石,金,随机",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "斥候迷雾",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "斥候",["list"] = "开,关",},
        },
        {
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "手机名设置",},
            {["type"] = "Edit",["color"] = "38,38,38",["prompt"] = "设置手机名",["size"] = "15",["id"] = "note",["align"] = "left",["text"] = "",["kbtype"] = "default",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "打野开关",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "打野",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "打野次数",},
            {["type"] = "Edit",["color"] = "38,38,38",["prompt"] = "打野次数",["size"] = "15",["id"] = "打野次数",["align"] = "left",["text"] = "2",["kbtype"] = "number",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "联盟捐献",},
            {["type"] = "RadioGroup",["select"] = "1",["id"] = "联盟",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "建筑列队",},
            {["type"] = "RadioGroup",["select"] = "1",["id"] = "建筑列队",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "读邮件",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "读邮件",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "研究",},
            {["type"] = "RadioGroup",["select"] = "1",["id"] = "研究",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "修城墙",},
            {["type"] = "RadioGroup",["select"] = "0",["id"] = "修城墙",["list"] = "开,关",},
            {["type"] = "Label",["color"] = "255,30,2",["size"] = "12",["align"] = "left",["text"] = "送物资",},
            {["type"] = "RadioGroup",["select"] = "1",["id"] = "送物资",["list"] = "开,关",},
        }
    },
} 
local MyJsonString = cjson.encode(MyTable);
UIret,UIv = showUI(MyJsonString)
__UI = {}

function getallwebUI()
    local url = "http://rok.honghongdesign.cn/public/"
    local arr = {}
    arr['s'] =  "Index.select"
    arr['table'] =  "rok_web_ui"
    arr['page'] = 1
    arr['size'] = 1
    local data = post(url,arr)
    local sz = require('sz')
 	local json = sz.json
    return json.decode(data.data.data[1]['web_ui'])
end

function chuangUI(ui_)
    __UI['小功能'] ={}
    __UI['支线功能'] = {}
	for k,v in pairs(ui_)do
	    if k == '造兵' then
	        __UI['步兵'] = false
	        __UI['骑兵'] = false
	        __UI['弓兵'] = false
	        __UI['车兵'] = false

	        for k,v in ipairs(v)do
	           __UI[v] = true
	        end
	    elseif k == '国家' or k == '采集种类' or k == 'note' or k == '打野次数' or k == "monsterlevel" then
	        __UI[k] = v
	    elseif k == '小功能' then
	        
	        for kk_,vv_ in ipairs(v) do
	            __UI['小功能'][vv_] = true
	        end
	    elseif k == '支线功能' then
	        for kk_,vv_ in ipairs(v) do
	            __UI['支线功能'][vv_] = true
	        end
	    else
	        if v == 0 then
	            __UI[k] = true
	        elseif v == 1 then
	            __UI[k] = false
	        else
	            __UI[k] = v
	        end
	    end
	end
	log(__UI)
end

if UIret == 1 then
    if UIv.ui选择 == '0' then
        for k,v in pairs(UIv)do
    	    if k == '兵种选择' then
    	        __UI['步兵'] = false
    	        __UI['骑兵'] = false
    	        __UI['弓兵'] = false
    	        __UI['车兵'] = false
    	        local 兵种选择arr = split(v,'@')
    	        log(兵种选择arr)
    	        for k,v in ipairs(兵种选择arr)do
    	            if v == '0' then
    	                __UI['步兵'] = true
    	            elseif v == '1' then
    	                __UI['骑兵'] = true
    	            elseif v == '2' then
    	                __UI['弓兵'] = true
    	            elseif v == '3' then
    	                __UI['车兵'] = true
    	            end
    	        end
    	    elseif k == '国家' or k == '采集种类' or k == 'note' or k == '打野次数' then
    	        __UI[k] = v
    	    else
    	        if v == '0' then
    	            __UI[k] = true
    	        elseif v == '1' then
    	            __UI[k] = false
    	        else
    	            __UI[k] = v
    	        end
    	    end
    	end
    	log(__UI)
    end
else
	lua_exit()
end








