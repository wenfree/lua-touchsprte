if not(t)then
    t = {}
end


--打野全军出击
t['全军出击-体力超过30']={0x8cff00, "0|0|0x8cff00,14|8|0x8cff00",90,11,59,40,86}
t['全军出击-体力超过50']={0x8cff00, "0|0|0x8cff00,-20|-11|0x8cff00",90,6,54,59,93}
    t['全军出击-军事面板按钮']={0x2ac7ef, "0|0|0x2ac7ef,-8|-8|0x0d68ab,8|8|0x106bad",90,1207,159,1305,200}
        t['全军出击-军事面板-返回']={0xe4aa1d, "0|0|0xe4aa1d,3|16|0xe9eae6,9|-11|0xecece8",90,1091,139,1165,679}
        t['全军出击-军事面板-关闭']={0xd4d2ca, "0|0|0xd4d2ca,21|41|0x04445f,-15|1|0xbab7ab,13|2|0xb7b4a8",90,1060,50,1179,184}
        t['全军出击-军事面板-正在回兵']={0xffffff, "0|0|0xffffff,-4|6|0xb45d00",90,446,133,509,678}
        
    t['全军出击-军事面板-25级野']={0x000000, "0|0|0x000000,4|0|0x000000,-1|-11|0xd5d7d9,14|-11|0xd4d6d7",90,389,156,957,623}
    t['头衔-城堡']={0x000000, "0|0|0x000000,4|-7|0x000000",90,426,305,918,686}

function _all_arm()
    if 全军出击撤回Key and not(d("全军出击-体力超过50")) then
        _UI.主线功能.全军出击 = false
        return
    end
    --先查询有不有例队
	local i,armKey = 0,false
	
    while 
    全军出击撤回Key
    and i < 600
    and d('采集-已经有队伍') 
    and d('采集-已经有队伍-正确')
    and _UI.主线功能.全军出击
    do
        d("全军出击-军事面板按钮",true,1,3)
        local TimesArm = 0
        while (  TimesArm < 10 and  d("全军出击-军事面板-关闭")  ) do
            local arm = d("全军出击-军事面板-返回",true) or d("全军出击-军事面板-返回",true) or d("全军出击-军事面板-返回",true)
            moveTo(677,587,665,360,20)
            local arm = d("全军出击-军事面板-返回",true) or d("全军出击-军事面板-关闭",true,1,2)
            TimesArm= TimesArm+ 1
        end
        delay(1)
        i=i+1
    end
    
    全军出击撤回Key = false
    d("游戏主界面-城内",true,1,2)
    d('采矿-放大镜',true,1,2)
    
    --打野调格记忆
    dayeweizi_M = dayeweizi_M or false;
    --打野调格记忆色彩
    dayeweizi_M_c = dayeweizi_M_c or '';
    if dayeweizi_M and dayeweizi_M_c == getColor(dayeweizi_M[1], dayeweizi_M[2]) then
        --不需要调整
        log('不需要调整')
    else
        log('点击打野位置')
        click( 269,665,2 )
        --设置好打野的位置
        d('采集-采集前调低',true,1,1)
        for i = 2,tonumber( _UI.monsterlevel ) do
            d('打野-增加开关',true,1,0.2)
        end
        
        if d('打野位置记忆位置')  or d('打野位置记忆位置-max') then
            dayeweizi_M = {x,y}
            dayeweizi_M_c = getColor(x, y)
        end
    end
    
    d("采矿-搜索",true,1,3)
    
    
    for i= 1, 5 do
        if not(d("头衔-城堡",true,1,2))  then
            click(663,367,2)--点屏中间
            log('点屏中间')
        end
            --点击攻击
        d("采矿-搜索-攻击",true,1,2)
            --准备创建部队
        if d("采矿-创建部队",false,1,2)  then
            if d('打野-创建部队-驻扎',true,1,2) then    --如果有 驻扎 就先弄出去打
                d('打野-创建部队-行军',true,1,3)
            end
        end
        
        if d("采矿-创建部队",true,1,2) then --如果创建了部队就不是多选
        elseif d('打野-创建部队-行军') then --如何有多个部队就一起攻击
            click(1227,710) --点击多选
            d("远征-战斗界面-有多个部队-行军",true,1,10)
	    end
		 
        if d("采矿-行军")  then
            if _UI.monsteDW ~= '默认' then
                local monsteDW_ = { ['位置1'] = 0 ,  ['位置2'] = 1 ,  ['位置3'] = 2 ,  ['位置4'] = 3 ,  ['位置5'] = 4 }
                click(1150,277 + monsteDW_[_UI.monsteDW] * 60 )
            end
            if tonumber(_UI.monsterlevel) > 1 and d("采矿-行军",true,1,3) then      --如果不是等级1 就直接攻击
            elseif d('打野-敌弱我强') and d("采矿-行军",true,1,3) then              --如果是自动增长, 就判断是否打的过
        	else
        	    打野增长key = false
        	    打野降低key = true
            end
           
        end
		
		--查看是否还有体力
		log('打野一次','all')
        if d('打野-体力不足') or d('打野-体力不足2',true,1,2) or d('打野-体力不足-iphone7')then
            if d("打野-体力不足-免费体力",true)then
            elseif _UI.打野吃体力 and d("打野-体力不足-吃体力",true,1,2) then
                d("打野-体力不足-吃体力*",true,1,2)
            else
                log('体力不足,结束打野','all')
                _UI.主线功能.全军出击 = false
                return
            end
	    end
		d('弹窗-设置面板x',true,2)
		
	end    
    
end













