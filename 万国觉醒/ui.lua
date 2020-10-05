-- 万国觉醒
-- ui.lua  

-- Create By TouchSpriteStudio on 20:40:56   
-- Copyright © TouchSpriteStudio . All rights reserved.
require('tsp')	
	
local sz = require("sz")
local json = sz.json
local w,h = getScreenSize();
MyTable = {
    ["style"] = "default",
	["rettype"]      = "table",
    ["width"] = w,
    ["height"] = h,
    ["config"] = "wgjx.dat",
    ["timer"] = 60,
    views = {
		
		{["type"] = "Label", ["text"] = "万国觉醒挂机脚本",["size"] = 25,["align"] = "center",["color"] = "0,100,100", },
		{["type"] = "Label", ["text"] = "功能设置",["size"] = 14,["align"] = "left",["color"] = "0,0,0", },
		{["type"] = "Label", ["text"] = "国家选择",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "ComboBox",["list"] = "1贞德,2孙武,3海尔曼,4贝利撒留,5布狄卡,6西庇阿,7楠木正成", ["select"] = "5", ['id'] = '国家', ['width'] = '200' },
		{["type"] = "Label", ["text"] = "建筑升级",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '升级',  },
		{["type"] = "Label", ["text"] = "奖励",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '奖励',  },
		{["type"] = "Label", ["text"] = "造兵key",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '造兵key',  },
		{["type"] = "Label", ["text"] = "步兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '步兵',  },
		{["type"] = "Label", ["text"] = "骑兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '骑兵',  },
		{["type"] = "Label", ["text"] = "弓兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '弓兵',  },
		{["type"] = "Label", ["text"] = "车兵",["size"] = 14,["align"] = "center", ['width'] = '220', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '车兵',  },
		{["type"] = "Label", ["text"] = "建造",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '建造',  },
		{["type"] = "Label", ["text"] = "英雄",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '英雄',  },
		{["type"] = "Label", ["text"] = "采集key",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '采集key',  },
		{["type"] = "Label", ["text"] = "种类",["size"] = 14,["align"] = "right", ['width'] = '45', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "RadioGroup",["list"] = "野,粮,木,石,金,轮",["select"] = "0", ['id'] = '采集种类',  },
		{["type"] = "Label", ["text"] = "斥候",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '斥候',  },		
		{["type"] = "Label", ["text"] = "任务",["size"] = 14,["align"] = "left", ['width'] = '150', ['nowrap'] = '1', ["color"] = "0,0,0",   },
		{["type"] = "Switch",["size"] = "s",["align"] = "left",["state"] = "on", ['id'] = '任务',  },
    }
}
local MyJsonString = json.encode(MyTable);	
UIret,UIv = showUI(MyJsonString)

if UIret == 1 then
	log(UIv)
else
	lua_exit()
end







