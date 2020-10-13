-- 万国觉醒
-- ui.lua  

-- Create By TouchSpriteStudio on 20:40:56   
-- Copyright © TouchSpriteStudio . All rights reserved.
require('tsp')	
	
-- local sz = require("sz")
-- local json = sz.json
-- local w,h = getScreenSize();
-- MyTable = {
--     ["style"] = "default",
-- 	["rettype"]      = "table",
--     ["width"] = w,
--     ["height"] = h,
--     ["config"] = "wgjx.dat",
--     ["timer"] = 60,
--     views = {
		
-- 		{["type"] = "Label", ["text"] = "万国觉醒挂机脚本",["size"] = 25,["align"] = "center",["color"] = "0,100,100", },
-- 		{["type"] = "Label", ["text"] = "功能设置",["size"] = 14,["align"] = "left",["color"] = "0,0,0", },
-- 		{["type"] = "Label", ["text"] = "国家选择",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "ComboBox",["list"] = "1贞德,2孙武,3海尔曼,4贝利撒留,5布狄卡,6西庇阿,7楠木正成", ["select"] = "0", ['id'] = '国家', ['width'] = '200' },
-- 		{["type"] = "Label", ["text"] = "建筑升级",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '升级',  },
-- 		{["type"] = "Label", ["text"] = "奖励",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '奖励',  },
-- 		{["type"] = "Label", ["text"] = "造兵key",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '造兵key',  },
-- 		{["type"] = "Label", ["text"] = "步兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '步兵',  },
-- 		{["type"] = "Label", ["text"] = "骑兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '骑兵',  },
-- 		{["type"] = "Label", ["text"] = "弓兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '弓兵',  },
-- 		{["type"] = "Label", ["text"] = "车兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '车兵',  },
-- 		{["type"] = "Label", ["text"] = "建造",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '建造',  },
-- 		{["type"] = "Label", ["text"] = "英雄",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '英雄',  },
-- 		{["type"] = "Label", ["text"] = "采集key",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '采集key',  },
-- 		{["type"] = "Label", ["text"] = "种类",["size"] = 14,["align"] = "right", ['width'] = '45', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "RadioGroup",["list"] = "野,粮,木,石,金,轮",["select"] = "0", ['id'] = '采集种类',  },
-- 		{["type"] = "Label", ["text"] = "斥候",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '斥候',  },		
-- 		{["type"] = "Label", ["text"] = "任务",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
-- 		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "off", ['id'] = '任务',  },
--     }
-- }
-- local MyJsonString = json.encode(MyTable);	
-- UIret,UIv = showUI(MyJsonString)

-- if UIret == 1 then
-- 	log(UIv)
-- else
-- 	lua_exit()
-- end

local sz = require("sz")
local cjson = sz.json

-- local ts = require("ts")
-- local cjson = ts.json
w,h = getScreenSize();
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
                              
                                      {
                                      ["type"] = "ComboBox",
                                      ["id"] = "国家",
                                      ["list"] = "1贞德,2孙武,3海尔曼,4贝利撒留,5布狄卡,6西庇阿,7楠木正成",
                                      ["select"] = "0",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "建筑升级",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "升级",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "奖励领取",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "1",
                                      ["id"] = "奖励",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "建造新建筑",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "建造",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "任务开关",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "任务",
                                      ["list"] = "开,关",
                                      },
                                                    {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "英雄召唤",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "英雄",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "造兵设置",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "造兵key",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "兵种选择",
                                      },
                                      {
                                      ["type"] = "CheckBoxGroup",
                                      ["select"] = "0",
                                      ["id"] = "兵种选择",
                                      ["list"] = "步兵,骑兵,弓手,车兵",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "采集关开",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "采集key",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "种类选择",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "5",
                                      ["id"] = "采集种类",
                                      ["list"] = "野,粮,木,石,金,轮",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "斥候迷雾",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "斥候",
                                      ["list"] = "开,关",
                                      },
                                  
                                },
                                {
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "手机名设置",
                                      },
                                      {
                                      ["type"] = "Edit",
                                      ["color"] = "38,38,38",
                                      ["prompt"] = "设置手机名",
                                      ["size"] = "15",
                                      ["id"] = "note",
                                      ["align"] = "left",
                                      ["text"] = "",
                                      ["kbtype"] = "default",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "打野开关",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "打野",
                                      ["list"] = "开,关",
                                      },
                                      {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "打野次数",
                                      },
                                      {
                                      ["type"] = "Edit",
                                      ["color"] = "38,38,38",
                                      ["prompt"] = "打野次数",
                                      ["size"] = "15",
                                      ["id"] = "打野次数",
                                      ["align"] = "left",
                                      ["text"] = "10",
                                      ["kbtype"] = "number",
                                      },
                                    {
                                      ["type"] = "Label",
                                      ["color"] = "255,30,2",
                                      ["size"] = "12",
                                      ["align"] = "left",
                                      ["text"] = "联盟捐献",
                                      },
                                      {
                                      ["type"] = "RadioGroup",
                                      ["select"] = "0",
                                      ["id"] = "联盟",
                                      ["list"] = "开,关",
                                      },
                                }
                  },
           
                  
} 
local MyJsonString = cjson.encode(MyTable);
UIret,UIv = showUI(MyJsonString)
__UI = {}

if UIret == 1 then
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
	        end
	    end
	end
	log(__UI)
else
	lua_exit()
end





