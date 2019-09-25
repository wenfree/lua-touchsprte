

function new_other()
	上兵统计 = 上兵统计 or 0

	if UI('新手','战斗界面中_新手',false,1)  or UI('新手','战斗界面中',false,1) then
		if UI_pic('新手','战斗准备',false,1)then
			
			预设位置={
				{1045,162,0x0a0c04},
				{1220,166,0x0d0e08},
				{1041,257,0x060c07},
				{1220,252,0xffffff},
				{1048,350,0xdbdbdb},
				{1227,348,0x090c08},
				{1044,442,0x0d0f05},
				{1222,443,0x111609},
				{1044,536,0x0d0f05},
				{1222,536,0x0d0f05},
			}
			--values.yiji_arm 预设编号(0,1,2,3)设置1,设置2,设置3,全上
			log(UIdata.arm_setting)
			if tonumber(UIdata.arm_setting) then
				if c_p(aoc['新手']['超出队伍'],'超出队伍',false)then
					click(178,31)		--撤回
					click(1238,673)		--攻击
					delay(2)
				else
					上兵统计 = 上兵统计 + 1
					if 上兵统计 >= 18 then
						if UI_pic('战斗','可以出战',true,1)then
							delay(2)
						else
							return '战斗失败'
						end
					else
						if UI_pic('新手','战斗_选择2级兵',false)then
							click( 810,  614) 	--点兵
							delay(2)
							click( 810,  614) 	--点兵
							delay(2)
							click( 810,  614) 	--点兵
							delay(2)
							click( 810,  614) 	--点兵
							delay(2)
							click( 810,  614) 	--点兵
							delay(2)
							click(1086,663) 	--点英雄
							delay(2)
							click(1086,663) 	--点英雄
							delay(2)
							click(1086,663) 	--点英雄
						else
							click(1086,663,0.2) 	--点英雄
							log('点英雄')
						end
					end
				end
			else
				if UI('other','预设未展开',true,1)then
				elseif UI('other','预设展开',false,1)then
					click(预设位置[tonumber(UIdata.arm_setting)][1],预设位置[tonumber(UIdata.arm_setting)][2])
					delay(2)
					if UI('other','可以战斗',true,1)then
						delay(2)
					elseif UI('战斗','不能战斗',false,1)then
						return '战斗失败'
					end
				end
			end
			
		elseif UI_pic('新手','寻找英雄',false)then
			if x <= 800 and y >= 150 then
				log(x..","..y)
				log('英雄位置正常')
				if UI_pic('战斗','英勇跳跃',true) or UI_pic('战斗','箭雨',true) then
					if UI_pic('战斗','攻击目标',false)then
						click(x-50,y+20)
					else
						click(1080,183)
					end
					UI_pic('战斗','取消',true)
				end
			elseif x > 800 then
				moveTo(450,300,300,300,20,10)
			elseif y < 150 then
				moveTo(300,300,300,450,20,10)
			end

		else
			moveTo(500,600,450,700,20,20)
			delay(2)
		end
		
	elseif UI('other','取消战斗',true,1)then		--战斗
		上兵统计 = 0
		delay(5)
	elseif UI('新手','招到英雄',true,1)then
	elseif UI('新手','招英雄确定',true,1)then
	elseif UI('新手','英雄升级',true,1)then
	elseif UI('新手','英雄结算画面',true,1)then
	elseif UI('新手','战斗胜利',true,1)then
	elseif UI('新手','招兵确定',true,1)then
	elseif UI_pic('新手','攻击按钮',true,1)then
		上兵统计 = 0
	elseif UI('other','运送矿点',true,1)then
	elseif UI('other','拦劫',true,1)then
	elseif UI('other','成功抢车',true,1)then
	elseif UI('other','取消战斗',true,1)then
		delay(3)
	elseif UI('other','被点确认',true,1)then
		delay(60*math.random(1,2))
	elseif UI('other','误点水泉',true,1)then
	elseif UI('other','误攻城堡',false,1)then
		click(40,40)
	elseif UI('other','公会信息',false,1)then
		click(40,40)
	elseif UI('other','顶号',false,1)then
		delay(60*5)
		UI('other','顶号',true,1)
	elseif UI('other','聊天退出',true,1)then
	elseif UI('other','暂停界面',true,1)then
	elseif UI('other','选择国家界面')then
		if d('龙牙大陆选国界面') then
			龙牙国家选择 = tonumber(UIdata.world)
			click(t['龙牙国家位置'][龙牙国家选择][1],t['龙牙国家位置'][龙牙国家选择][2])
			d('龙牙大陆选国界面_进入',true)
			delay(4)
			click(903,488) ---不在原公会国家点确认 
		elseif UIdata.new then	
			国家选择 = tonumber(UIdata.world)
			click(aoc['国家位置'][国家选择][1],aoc['国家位置'][国家选择][2])
			UI('other','选国界面',true,1)
		end
	elseif UI('other','开始旅程',false,2)then
		英雄选择 = tonumber(UIdata.hero)
		click(aoc['英雄位置'][英雄选择][1],aoc['英雄位置'][英雄选择][2])
		UI('other','开始旅程',true,1)
		delay(10)
	else
		return true
	end
	
end

function 地图()
	if UI_pic('新手','地图',true)then
		if UI('返回','返回图标',false,1)then
			if UI_pic('新手','世界地图')then
				if UI_pic('新手','黄色感叹号',true)then
					if UI_pic('新手','前往',true)then
						delay(3)
						return true
					end
				else
					UI('返回','返回图标',true,1)
				end
			end
		end
	end
end

function 任务()
	if UI('返回','返回图标',false,1)then
		if UI_pic('返回','任务界面',false,1)then
			if UI_pic('新手','领取奖励',true)then
			elseif UI_pic('新手','找到目标',true)then
			elseif UI_pic('新手','任务激活',true)then
			elseif UI_pic('新手','任务未激活ios9',true)then
			else
				UI('返回','返回图标',true,1)
			end
			if UI_pic('新手','前往',true)then
				delay(2)
			end
		elseif UI_pic('新手','世界地图',false,1)then
			if UI_pic('新手','前往',true)then
				delay(2)
			else
				UI('返回','返回图标',true,1)
			end
		else
			UI('返回','返回图标',true,1)
		end
	else
		return false
	end
	return true
end

function 兵()
	keepScreen(true)
	aoc['新手']['兵绿色']={ 0x71c516, "", 80, 668, 375, 668, 375}
	
	for i = 1,4 do
		aoc['新手']['兵绿色']={ 0x71c516, "", 80, 668-60*i, 375 -37*i, 668+60*i, 375+37*i}
		while (aoc['新手']['兵绿色'][4] < aoc['新手']['兵绿色'][6]) do
			if c_p(aoc['新手']['兵绿色'],'兵绿色',false)then
				aoc['新手']['兵绿色'][4] = x
				log('frist-->('..x..','..y)
				统计 = 1
				x轴定位点 = x
				y轴定位点 = y
				for iq = x轴定位点 , x轴定位点+66 do
					aoc['新手']['兵绿色确定']={ 0x71c516, "", 80, iq, y-30, iq+1, y+35}
					if c_p(aoc['新手']['兵绿色确定'],'兵绿色确定',false)then
						统计 = 统计 + 1
						--log('新手确定---->('..x..','..y)
					end
					if 统计 > 15 then
						log('找到兵')
						click(x,y)
						keepScreen(false)
						return true
					end
				end
			else
				aoc['新手']['兵绿色'][4] = aoc['新手']['兵绿色'][6]
			end
			aoc['新手']['兵绿色'][4] = aoc['新手']['兵绿色'][4] + 1
		end
		log(i..'---->')
	end
	keepScreen(false)
end



function 怪()
	keepScreen(true)
	aoc['新手']['怪红色']={ 0xfc592c, "", 80, 668, 375, 668, 375}
	aoc['新手']['兵绿色']={ 0x8db953, "", 90, 668, 375, 668, 375}
	
	for i = 1,5 do
		aoc['新手']['怪红色']={ 0xfc592c, "", 75, 668-60*i, 375 -37*i, 668+60*i, 375+37*i}
		aoc['新手']['兵绿色']={ 0x8db953, "", 90, 668-60*i, 375 -37*i, 668+60*i, 375+37*i}
		while (aoc['新手']['怪红色'][4] < aoc['新手']['怪红色'][6]) do
			if c_p(aoc['新手']['怪红色'],'怪红色',false)then
				aoc['新手']['怪红色'][4] = x
				log('frist-->('..x..','..y)
				统计 = 1
				x轴定位点 = x
				y轴定位点 = y
				for iq = x轴定位点 , x轴定位点+66 do
					aoc['新手']['怪红色确定']={ 0xfc592c, "", 75, iq, y-30, iq+1, y+35}
					if c_p(aoc['新手']['怪红色确定'],'怪红色确定',false)then
						统计 = 统计 + 1
						--log('新手确定---->('..x..','..y)
					end
					if 统计 > 25 then
						log('找到怪')
						click(x,y)
						keepScreen(false)
						return true
					end
				end
			else
				aoc['新手']['怪红色'][4] = aoc['新手']['怪红色'][6]
			end
			aoc['新手']['怪红色'][4] = aoc['新手']['怪红色'][4] + 1
		end
		log(i..'---->')
	end
	keepScreen(false)
end

newP={}
newP['怪']={ 0xfc592c, "6|-1|0xfd582c", 90, 588, 218, 885, 560}
newP['怪2']={ 0xfd582c, "1|3|0xfd582c", 90, 617, 213, 885, 506}
newP['怪3']={ 0xfd582c, "2|1|0xf8572d", 90, 466, 223, 824, 557}
newP['兵']={ 0x7fc91c, "4|-1|0x78c318", 90, 573, 221, 915, 508}
newP['兵2']={ 0x5aa724, "67|-1|0x58a622", 90, 543, 232, 808, 477}
newP['兵3']={ 0x74cf4f, "66|0|0x68d256", 90, 480, 166, 808, 556}

function bing()
	return (c_pic(newP['兵'],'兵',true) or c_pic(newP['兵2'],'兵2',true) or c_pic(newP['兵3'],'兵3',true))
end
function guai()
	return (c_pic(newP['怪'],'怪',true) or c_pic(newP['怪2'],'怪2',true) or c_pic(newP['怪3'],'怪3',true))
end


function newplay()
	if not(UIdata.new)then
		return false
	end
	
	local 计时 = os.time()
	local 超时 = 60*20
	local other_mun = 0
	local new_lun = 0
	while (os.time()-计时<超时) do
		if active(app,5)then
		elseif UI('新手','战斗界面中_新手',false,1)  or UI('新手','战斗界面中',false,1) then
			new_other()
		elseif 在地图界面(clicks,clickMun,stayTime)then
			toast('有领地',1)
			return true
		elseif UI_pic('换服','在地图上')then
			上兵统计 = 0
			other_mun = 0
			local 新手四个方向={{666,254,0xc6d1d7}, {750,286,0xddeffa}, {764,360,0xe4e4e6}, {742,418,0xc8d1d8}, 
					{668,458,0xc6cfd9}, {583,389,0x787f89}, {560,340,0x8d7c87}, {594,278,0x9ca6b2}, }
			
			new_lun = new_lun + 1
			new_lun_key = new_lun %(#新手四个方向)+1
			click(新手四个方向[new_lun_key][1],新手四个方向[new_lun_key][2])
			
			if bing()then
			elseif guai()then
			elseif 地图()then
			elseif UI_pic('新手','城堡色',false)then
				log('城堡色-->('..x..','..y)
				click(x,y+100)
			else
				log('准备点任务')
				UI_pic('新手','任务绿',true)
			end
		elseif 任务()then
			other_mun = 0
		else
			log('other')
			if new_other() then
				other_mun = other_mun + 1
				if other_mun > 2 then
					other_mun = 0
					other()
				end
			end
		end
		delay(0.2)
	end
end