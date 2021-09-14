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
-- com.lilithgames.rok.ios.jp
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
    打码次数 = 0
    
    --广告部分
    删除旧广告key = true
    发广告次数 = 1
    
    --是否截图
    _app.upimg = true
    _app.allimg = true
    __新初始化 = true


	local timeline = os.time() + rd(1,5)*60
	while os.time()-timeline < 60 * 35  do
		if active(_app.bid,12)then
			if d('游戏主界面') or d('游戏主界面-夜')then
			    
			    tipsKey = 0
			    
		    	d('弹窗_绑定帐号',true,1)
				--每次都点帮助
				d('收集-帮助',true,2)
				
				-- if __新初始化 then
                --     初始化()
                --     __新初始化 = false
                -- end
                
				-- _init()
				    
                _Collect()
                -- 流森古卷()

                if _UI.神秘商人 and d("神秘商人来了",true,1,2) then
                    show_state("神秘商人")
                    _神秘商店()
                end
				
				if _UI.VIP奖励 and _SignIn() then
				elseif _UI.读邮件 and _mail() then
				elseif _UI.日历奖励 and _book() then
                elseif _UI.铁匠铺 then
                    show_state("铁匠铺")
                    todo = { _init(), _铁匠铺() }
                elseif _UI.医院 then
                    todo = { _init(), _Hospital() }
				elseif _UI.英雄升级加点 then
				    show_state("英雄升级加点")
				    todo = { _加天赋() }
				elseif _UI.远征 then
				    show_state("远征")
				    todo = { _远征() }
				elseif _UI.建造 then
				    show_state("新建筑")
				    todo = { _NewBuild() }
				elseif _UI.英雄 then
				    show_state("酒馆召唤")
				    todo = { _init(),_Hero() }
				elseif _UI.升级 then
				    show_state("升级主城")
				    todo = { _init(),_升级() }
				elseif _UI.搜索村庄 then
				    show_state("搜索村庄")
				    todo = { read_mail() }
				elseif _UI.奖励 then
				    show_state("奖励")
				    todo = { _Award() }
				elseif _UI.任务 then
				    show_state("任务")
				    todo = { _task() }
				elseif _UI.造兵.key  then
				    show_state("造兵")
				    todo = { _init(),_soldier() }
				elseif _UI.斥候 then
				    show_state("斥候")
					todo = { _init(),_Acouts() }
                elseif _UI.送物资 then
                    show_state("送物资")
                    todo = { _init(),_songwuzi()}
                elseif _UI.主线功能.全军出击 then
                    show_state("全军出击")
                    todo = { _all_arm() }
                elseif _UI.打野 then
                    show_state("打野")
                    todo = { _monster() }
                elseif _UI.联盟捐助 then
                    show_state("联盟捐助")
                    _lm()
                elseif _UI.采集.key then
				    show_state("采集")
					_Collection()
                elseif __UI.主线功能.广告开关 then
			        show_state("发广告")
                    if __UI.主线功能.广告方法 == "1" then
                        --王国喊话
                        if ad() then
                            __UI.主线功能.广告开关 = false
                        end
                    elseif __UI.主线功能.广告方法 == "2" then
                        if ads_() and 发广告次数 >= 3 then
                            __UI.主线功能.广告开关 = false
                        end
                    elseif __UI.主线功能.广告方法 == "3" then
                        choice = 2
                        show_state("广告-联盟"..top_key)
                        if 发邮件_联盟() and 发广告次数 > 4 then
                            __UI.主线功能.广告开关 = false
                        end
                    elseif __UI.主线功能.广告方法 == "4" then
                        choice = 1
                        show_state("广告-战力"..top_key)
                        if 发邮件_联盟() and 发广告次数 > 4 then
                            __UI.主线功能.广告开关 = false
                        end
                    end
                else
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
	


function main()
	
    while true do
        
        是否选过区 = false
        选区开关 = false
        require('new')
        拉图滑动次数 = 0
        
        --拉取帐号
        if AccountInfoBack() then
            
            if __game.is_vpn == 0 or vpn() then
                
                --读出token
                __game.token = llsGameToken()[1]
                if not(file_exists("/User/Media/TouchSprite/lua/" ..__game.token..".txt")) then
                    local sz = require("sz")
                    local json = sz.json
                    writeFile( {json.encode({['top_key'] = 1,['top_key_max'] = 20})} ,'w',"/User/Media/TouchSprite/lua/" ..__game.token..".txt")
                end
                
                now_key = (readFileString("/User/Media/TouchSprite/lua/" ..__game.token..".txt"))
                now_key = string.gsub(now_key, "1:","")
                now_key = json.decode(now_key)
                top_key = now_key['top_key']
                top_key_max = now_key['top_key_max']
                log( now_key  )
                --初始化UI设置
                __UI = __game.wei_ui
                --完全格式化
                _UI.国家 = 5
                --小功能
                _UI.除草 = __UI['小功能']['除草']
                _UI.VIP奖励 = __UI['小功能']['VIP奖励']
                _UI.收集资源 = __UI['小功能']['收集资源']
                _UI.读邮件 = __UI['小功能']['读邮件']
                _UI.日历奖励 = __UI['小功能']['日历奖励']
                
                --支线功能
                _UI.远征 = __UI['支线功能']['远征']
                _UI.英雄升级加点 = __UI['支线功能']['英雄升级加点']
                _UI.日落峡谷 = __UI['支线功能']['日落峡谷']
                _UI.神秘商人 = __UI['支线功能']['神秘商人']
                _UI.铁匠铺 = __UI['支线功能']['铁匠铺']
                _UI.只买第一排 = __UI.支线功能.只买第一排
                
                --主线功能
                _UI.修城墙 = __UI.主线功能.修城墙
                _UI.建造 = __UI.主线功能.建造
                _UI.英雄 = __UI.主线功能.酒馆召唤
                _UI.升级 = __UI.主线功能.升级
                _UI.吃加速 = __UI.主线功能.吃加速
                _UI.搜索村庄 = __UI.主线功能.搜索村庄
                _UI.奖励 = __UI.主线功能.奖励
                _UI.任务 = __UI.主线功能.任务
                _UI.升级车间 = __UI.主线功能.升级车间
                _UI.压堡 = __UI.主线功能.压堡
                _UI.联盟名称 = __UI.主线功能.联盟名称
                
                if __UI.主线功能.广告开关 then
                    if __UI.分享广告 then
                        __UI.分享广告 = split(__UI.分享广告,"|")
                    end
                    if __UI.邮件广告 then
                        __UI.邮件广告 = split(__UI.邮件广告,"|")
                    end
                end
                
                --造兵功能
                _UI.造兵 = {}
                _UI.造兵.key = __UI.主线功能.造兵key
                _UI.造兵.步兵 = __UI.主线功能.步兵
                _UI.造兵.骑兵 = __UI.主线功能.骑兵
                _UI.造兵.弓兵 = __UI.主线功能.弓兵
                _UI.造兵.车兵 = __UI.主线功能.车兵
                
                --其它功能
                _UI.斥候 = __UI.主线功能.斥候
                _UI.斥候次数 = tonumber(__UI.主线功能.斥候次数) or 5
                _UI.打野 = __UI.主线功能.打野
                _UI.打野次数 = tonumber(__UI.打野次数)
                _UI.打野吃体力 = __UI.主线功能.吃体力
                _UI.monsterlevel = __UI.monsterlevel or 1
                _UI.monsteDW = __UI.monsteDW or '默认'
                _UI.主线功能 = {}
                _UI.主线功能.全军出击 = __UI.主线功能.全军出击
                if _UI.主线功能.全军出击 then
                    _UI.打野 = false
                end
                
                --采集设置
                _UI.采集 = {}
                _UI.采集.key = __UI.主线功能.采集key
                _UI.采集.种类 = __UI.采集种类
                _UI.采集.联盟矿场 = __UI.主线功能.联盟矿场
                if __UI.主线功能.采矿等级 then
                    _UI.采集.采矿等级 = tonumber(__UI.主线功能.采矿等级)
                else
                    _UI.采集.采矿等级 = 1
                end
                --联盟科技捐助
                _UI.联盟捐助 = __UI.主线功能.联盟捐助
                _UI.建筑列队 = false
                
                --物资运送
                _UI.物资运送 = __UI.主线功能.物资运送
                if __UI.R位置 == '坐标' then
                    _UI.坐标 = split(__UI.坐标,',')
                end
                
                _UI.医院 = true
                
    
                log(__UI);
                game()
                --清理帐号
                clearOneAccount();
                delay(1)
                
            end
        else
            log('帐号休息中')
            delay(10);
            pressHomeKey(0)
            pressHomeKey(1)
    	end
    
	end
end

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















	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	