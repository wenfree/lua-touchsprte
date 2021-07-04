-- 万国觉醒
-- main.lua  

-- Create By TouchSpriteStudio on 13:31:43   
-- Copyright © TouchSpriteStudio . All rights reserved.
--unlockDevice()
-- require("TSLib")
--require("tsp")

update__ = true
update__ = false
update_account = true

function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile()
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "https://img.wenfree.cn/rok/new.lua"
	local res, code = http.request(url);
    if code == 200 then
        local file = io.open("/User/Media/TouchSprite/lua/new.lua", "w+")
        if file then
            file:write(res)
            file:close()
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end

if not(file_exists("/User/Media/TouchSprite/lua/new.lua")) then
    downFile()
end

__UI = {}
_UI = {}
require('tsp')
require('ZZBase64')
require("yzm")
require("function")
require('token')
require('api')

init(1)
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'
-- com.lilithgame.roc.ios.tw
_app.yzmid = 0;


t={}
degree = 80
--加截全军出击
require("UIs")
require('change_qu')
require('ad')



--临时增加的 temporary
t['临时-免费女王']={0xffffee, "0|0|0xffffee,27|-33|0xe20000,12|-24|0xfb57a1",90,912,82,1252,164}
    t['临时-免费女王-领取']={0x1274ba, "0|0|0x1274ba,-39|-18|0x00cffe",90,752,416,997,535}


function game()
    
    打野降低key = false;
    打野增长key = true;
    采矿调低一次 = true
    任务记数 = 0
    打野次数记数 = 0;
    收集次数 = 0
    读邮件次数 = 0
    日历奖励 = 0
    除草次数 = 0
    建造次数 = 0
    采矿次数 = 0
    升级次数 = 0
    斥候次数 = 0
    领邮件奖励 = 0
    修理城墙 = 0
    研究次数 = 0
    造兵次数 = 0
    联盟次数 = 0
    送物资次数 = 0
    远征次数 = 0
    英雄次数 = 0
    arrowKey = 0
    日落峡谷次数 = 0
    全军出击撤回Key = true
    tipsKey = 0
    升级车产次数 = 0
    静止画面 = 0
    流森古卷次数 = 0
    VIP次数 = 0
    医院次数 = 0
    
    --是否截图
    _app.upimg = true
    _app.allimg = true

	local timeline = os.time() + rd(1,5)*60
	while os.time()-timeline < 60 * 35  do
		if active(_app.bid,12)then
			if d('游戏主界面') or d('游戏主界面-夜')then
			    
			    tipsKey = 0
			    
		    	d('弹窗_绑定帐号',true,1)
				--每次都点帮助
				d('收集-帮助',true,2)

                        
				if _init() then
				    
                    
                        if __UI.主线功能.广告开关 and rd(1,100) > 40 then
                            ad()
                        end
						return 'next'

				end
			else
			    --这是记录是否出弹窗的参数值
				if _Evevnt() then
                    local tips_res = _Tips()
                    if tips_res == '封号'  or tips_res == '休息' then
                        return 
                    end
				end
				
				tipsKey = tipsKey + 1
				--长时间在不正常的状态下,查一下是否是在引导下
				if ( tipsKey > 10 ) then
				    _Arrow()
				end
				
			end
		end
	end
	show_state("--")
	return 'next'
end
	

function game()
    
    删除旧广告key = true
    tipsKey = 0
    发广告次数 = 1

	local timeline = os.time() + rd(1,5)*60
	while os.time()-timeline < 60 * 30  do
		if active(_app.bid,12)then
			if d('游戏主界面') or d('游戏主界面-夜')then
                tipsKey = 0
				if _init() then
                    if _UI.广告 then
                        
                        if ads_() and 发广告次数 >= 3 then
                            return 'next'
                        end
                    else
                        show_state("未设广告词")
                        delay(3)
                        return 'next'
                    end
				end
			else
			    --这是记录是否出弹窗的参数值
				if _Evevnt() then
                    local tips_res = _Tips()
                    if tips_res == '封号'  or tips_res == '休息' then
                        return 
                    end
				end
				
				tipsKey = tipsKey + 1
				--长时间在不正常的状态下,查一下是否是在引导下
				if ( tipsKey > 5 ) then
				    _Arrow()
				end
				
			end
		end
	end
    show_state("--")
	return 'next'
end

发邮件_联盟()
lua_exit()

function all()
    local sz=require('sz')
    __game = {}
    -- __game.imei = getDeviceID()
    __game.imei = getDeviceName()
    __game.phone_name = getDeviceName()
    
    main()
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
	    vpnx();
		log(errMessage)
		dialog(errMessage, 10)
		mSleep(2000)
	end
end















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	