

function yiji_other()
	上兵统计 =  上兵统计 or 0

	if UI('新手','战斗界面中',false,1)then
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
			if tonumber(UIdata.arm_setting) >= 11 then
				if c_p(aoc['新手']['超出队伍'],'超出队伍',false)then
					click(178,31) 		--撤回
					click(1238,673)		--攻击
					delay(2)
				else
					上兵统计 = 上兵统计 + 1
					log("上兵统计->"..上兵统计)
					if 上兵统计 >= 18 then
						if UI_pic('战斗','可以出战',true,1)then
							delay(2)
						end
					else
						clickhero_n = clickhero_n or 7
						clickhero_n = clickhero_n +1
						click(1086-clickhero_n%8*98,663,0.2) 	--点英雄
					end
				end
			else
				if d('战斗界面_预设未展开',true,1)then
				elseif d('战斗界面_预设已展开')then
					click(预设位置[tonumber(UIdata.arm_setting)][1],预设位置[tonumber(UIdata.arm_setting)][2])
					delay(3)
					d('战斗界面_可以开战',true,1)
				end
			end
			
		elseif UI_pic('新手','寻找英雄',false)then
			if x < 700 and y > 250 then
				log('英雄位置正常')
			elseif x > 700 then
				moveTo(450,300,300,300,20,20)
			elseif y < 250 then
				moveTo(300,300,300,450,20,20)
			end
		else
--			moveTo(500,600,400,700,20,20)
--			delay(3)
		end
	elseif d('弹窗_深渊_攻击和取消',true)then
		上兵统计 = 0
	elseif UI('other','取消战斗',true,1)then		--战斗
		上兵统计 = 0
		delay(5)	
	elseif UI('other','不能直接扫荡_打',true,1)then		--战斗
	elseif UI_pic('other','直接扫荡',true,1)then		--战斗
		上兵统计 = 0
		delay(5)
	elseif UI('other','误点水泉',true,1)then
	elseif UI('other','恢复药',true,1)then
	elseif UI('other','体力药',true,1)then
	elseif UI('新手','招英雄确定',true,1)then
	elseif UI('新手','英雄升级',true,1)then
	elseif UI('新手','英雄结算画面',true,1)then
	elseif UI('other','暂停界面',true,1)then		--误点暂停,继续开始
	elseif UI('other','死伤较重',true,1)then
	elseif UI('新手','战斗胜利',true,1)then
	elseif UI('新手','战斗胜利',false,1)then
		vibrator()
		delay(5)
	elseif UI('other','战斗失败',true,2)then
		delay(1)
		if UI('other','取消战斗',true,3)then --取消战斗
			return '战斗失败'
		end
	elseif UI('新手','招兵确定',true,1)then
	elseif UI('other','运送矿点',true,1)then
	elseif UI('other','成功抢车',true,1)then
	elseif UI('other','取消战斗',true,1)then
		delay(3)
	elseif UI('other','被点确认',true,1)then
	elseif UI_pic('other','蓝红按钮_',true,1)then
	elseif UI_pic('战斗','取消',true)then	--取消技能
	elseif UI('other','战争学院胜利',true,1)then	--取消技能	
	elseif UI('other','战力不足',true,1)then	--取消技能
		return '战斗失败'
	else
		return true
	end
	delay(0.2)
end


function touch_move_look()
	touchDown(1, h/2,w/2+160)
	mSleep(100)
	touchMove(1, h/2,w/2-155)
	mSleep(100)
	touchDown(1, h/2,w/2-155)
	mSleep(500)
	if c_p(aoc['返回']['任务蓝色'],'任务蓝色',false)then
		touchUp(1, h/2,w/2-155)
		return true
	end
	touchUp(1, h/2,w/2-155)
end

--[[]]
function find_kuang()
	
	t['任务菜单未激活']={ 0x4a8526, "-86|26|0x2c621b,-85|-28|0x2c611c,-65|4|0x16310e", 90, 1086, 107, 1308, 198 } --多点找色
	d('任务菜单未激活',true)
	
	if UI_pic('新手','领取奖励',true)then
		return false
	end
	
	aoc['返回']['感叹号'][7] = 670
	aoc['返回']['感叹号'][5] = 93

	for i=1,4 do
		if UI_pic('返回','感叹号')then
			keepScreen(true)
			log('第'..i..'个感叹号'..x..","..y,false,2)
			aoc['返回']['感叹号'][7] = y - 120
			aoc['返回']['感叹号'][5] = aoc['返回']['感叹号'][7] - 180
			local cx,cy = x,y
			--设置区域
			f_x = 180
			f_y = -39
			f_x_x = 712
			f_x_y = 47
			aoc['资源']={}
			aoc['资源']['水']={ 0x00cbe1, "-23|2|0xeceaee,-17|1|0xa5fefa", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['金']={ 0xe7e376, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['木']={ 0xc78b59, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['血钻']={ 0xd7121a, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['水晶']={ 0xe240d3, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['资源']['密银']={ 0x50f7ec, "14|-4|0xafffb0,19|8|0xb9ffa2", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
			aoc['返回']['指向目标地']={ 0x9ea495, "1|29|0x999f82", 90, x+686, y-54, x+841, y+29}
--			aoc['资源']['魔镜']={ 0xf7f9fa, "1|0|0x15425a,3|0|0xd9e0e4,-3|0|0xe3e8eb,-3|7|0xe3e8eb", 90, x+75, y-17, x+558, y+26}
			local zy_mun = 0
			for k,v in pairs(aoc['资源'])do
				if k == '水' or k == '密银' or k == '魔镜' then
					if c_pic(v,k,false)then
						if UIdata.resource.water and k == '水' then
							zy_mun = zy_mun + 1
						elseif UIdata.resource.silver and k == '密银' then
							zy_mun = zy_mun + 1
						end
						zy_mun = zy_mun + 1
					end			
				else
					if c_p(v,k,false)then
						if UIdata.resource.wood and k == "木" then
							zy_mun = zy_mun + 1
						elseif UIdata.resource.gold and k == "金" then
							zy_mun = zy_mun + 1
						elseif UIdata.resource.blood and k == "血钻" then
							zy_mun = zy_mun + 1
						elseif UIdata.resource.crystal and k == "水晶" then
							zy_mun = zy_mun + 1
						end
						zy_mun = zy_mun + 1
					end
				end
			end
			keepScreen(false)
			if UIdata.old and zy_mun >= 2 then
				log("准备找遗迹")
				nLog(cx+979 ..",".. cy-25)
				if c_pic(aoc['返回']['指向目标地'],'指向目标地',true)then
					delay(2)
					return true
				end
			elseif zy_mun == 1 then
				nLog(cx+979 ..",".. cy-25)
				if c_pic(aoc['返回']['指向目标地'],'指向目标地',true)then
					delay(2)
					return true
				end
			else
				log("没有矿")
			end
		end
	end
	
	log('上滑动一次')
	--moveTo(h/2,w/2+320-(math.random(1,100)),h/2,w/2-155,20)
	if touch_move_look() then
		log('还有任务')
	else
		return '没有任务'
	end
	delay(0.8)
end
--]]

--[[
function find_kuang()
	
	if UI_pic('新手','领取奖励',true) then
	
	elseif UIdata.resource.wood  and d('任务下_木',true) then
	elseif UIdata.resource.blood  and d('任务下_血钻',true) then
	elseif UIdata.resource.silver  and d('任务下_秘银',true) then
	elseif UIdata.resource.crystal  and d('任务下_水晶',true) then
	elseif UIdata.resource.gold and d('任务下_金',true) then
	elseif UIdata.resource.water  and d('任务下_水',true) then
	elseif UIdata.mj and d('任务下_魔镜',true) then
	else
		log('上滑动一次')
		if touch_move_look() then
			log('还有任务')
		else
			return '没有任务'
		end
		delay(0.8)
	end
	
end	
--]]

function auto_get()
	if not(UIdata.work)then
		return false
	end
	
	local 计时 = os.time()
	local 超时 = 60*15
	轮换 = 1
	点矿 = false
	采矿数量 = 0
	查找次数 = 0
	找图失败次数 = 0
	local 开一次地图 = true
	local 魔镜设置 = true
	local 公会领取_ = true
	
	while (os.time()-计时< 60 * 15 ) do
		if active(app,10)then
		elseif UIdata.maps and 开一次地图 and UI('在地图中','在地图界面',true,3)then
			delay(2)
			开一次地图 = false
		elseif UI('在地图中','在地图界面',false,3,80)then
			log('----采矿路上----')
			delay(1)
			if 公会领取_ and UI_pic('在地图中','城市奖励' ,true,1)then
			elseif d('在地图界面_声望奖励提示',true,1)then
				delay(2)
			elseif UI('在地图中','战争结束',true,2)then
			else
				map_time = os.time()
				while (点矿 and (os.time() - map_time < 40)) do
					keepScreen(true)
--					if UI_pic('地图','正在跑路',false)or UI_pic('地图','正在跑路小',false)then
					if UI_pic('地图','正在跑路',false) then
						delay(3)
					else
						keepScreen(false)
						break
					end
					keepScreen(false)
				end
				轮换 = 轮换 + 1
				function get_kuang()
					if UI_pic('在地图中','矿点顶部',false)then
						click(x,y+150)
						return true
					elseif UI_pic('在地图中','发现矿点',false)then
						click(x,y+150)
						if os.time() - 计时 > 10*60 then
							delay(5)
						end
						return true
					end
				end
				if 点矿 then
					if get_kuang() then
						--正常的找到了矿
					else
						四个方向位置={{643,221,0x968544},{777,242,0x8b7e33},{826,368,0x8e8142},{781,479,0x9f9657},
							{655,498,0x6a5332},{546,466,0x827631},{517,340,0x91863f},{534,233,0x938746},}
						click(四个方向位置[(轮换%(#四个方向位置)+1)][1],四个方向位置[(轮换%(#四个方向位置)+1)][2])
						get_kuang()
					end
					点矿 = false
				end
				UI_pic('地图','探索',true)
				UI('返回','返回图标',true,1)
				UI('在地图中','在地图界面',true,4,80)
			end
		elseif UI('返回','返回图标',false,1) and not(UI('新手','战斗界面中',false,1)) then
			if d('返回_任务界面')then
				if d('返回_任务界面_伙伴',true)then
				elseif d('返回_任务界面_活跃激活')then
					if UI_pic('返回','活跃点击',true,1)then
					elseif UI_pic('返回','活跃领取',true,1)or UI_pic('返回','活跃领取-银宝箱',true,1)then
					else
						moveTo(820,193,473,193,20)
						moveTo(820,193,473,193,20)
						delay(1)
						if UI_pic('返回','活跃领取',true,1) or UI_pic('返回','活跃领取-银宝箱',true,1)then
						else
							UI('返回','返回图标',true,1)
						end
					end
				elseif UI('返回','签到界面',false,1)then
					if c_pic(aoc['返回']['可以签到'],'可以签到',true)then
					elseif c_pic(aoc['返回']['可领龙币'],'可领龙币',true)then
					else
						UI('返回','返回图标',true,1)
					end
				elseif UI_pic('返回','有任务下的红点',true)then
				else
					if find_kuang() == '没有任务' then
						return false
					end
				end
			elseif UI_pic('声望','声望界面',false)then
				if UI_pic('返回','可领龙币_钱袋',true)then
				elseif UI_pic('声望','未开奖励',true)then
				else
					UI('返回','返回图标',true,1)
				end
			elseif UI('返回','魔镜中')then
				if UI('返回','自动前进')then
					if 魔镜设置 and UI('返回','自动前进',true,1)then
						魔镜设置 = false
						魔镜计时 = os.time()
					else
						if os.time()-魔镜计时 > 45 then
							click(40,40)		--点击进入下一层
						end
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('返回_世界地图界面')then
				log('准备采矿')
				if UI('car','误点城堡') == false then
					if UI('城堡','在城堡中',false,1) or UI('other','公会信息',false,1)then
						UI('返回','返回图标',true,1)
					elseif UIdata.maps and 找图失败次数 <= 4 and 找金币()then
						delay(1)
						if map_one()==false then
							找图失败次数 = 找图失败次数 + 1
						end
					elseif UI_pic('返回','前往',true)then
						delay(1)
						点矿 = true
					else
						UI('返回','返回图标',true,1)
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('返回_公会界面')then
				if UI_pic('返回','城市界面')then
					if UI_pic('返回','全部领取',true)then
					elseif not(UI_pic('返回','全部领取灰',false))then
						公会领取_ = false
						UI('返回','返回图标',true,1)
					else
						UI('返回','返回图标',true,1)
					end
				elseif UI_pic('返回','赠品领取',true)then
				elseif UI_pic('返回','公会奖励红点',true)then
					delay(2)
				else
					UI('返回','返回图标',true,1)
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','运送矿点',true,1)then
			采矿数量 = 采矿数量 + 1
			log('矿'.. 采矿数量)
			if 采矿数量 >= 30 then
				return true
			end
			点矿 = false
		else
			nLog('-other-')
			if UIdata.old then
				nLog('old-other-')
				if yiji_other()then
					other()
				end
			else
				other()
			end
		end
	end
end


function 战争学院()
	计时 = os.time()
	超时 = 60*25
	while ((os.time()-计时<超时 )) do
		if active(app,5)then
		elseif UI_pic('返回','战争学院界面_选择',true)then
		elseif UI_pic('返回','战争学院界面')then
			if UI('返回','战争打完')then
				if UI('返回','战争打完',false,1)then
					if UI_pic('返回','下一章',true,1)then
					else
						return true
					end
				end
			else
				click(1130,680)
			end
		elseif UI('在地图中','在地图界面',true,2)then
		elseif UI('返回','返回图标',false,1) and not(UI('新手','战斗界面中',false,1)) then
			if d('返回_城堡中')then
				click(933,186)
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','战斗失败',true,2)then
			return true
		else
			f_yiji = yiji_other()
			if f_yiji == '战斗失败' then
				return true
			elseif f_yiji then
				other()
				nLog('other')
			end
		end
		mSleep(600)
	end
end


if t == nil then
	t={}
end
t['返回_巨龙巢穴']={0x1c2329, "6|-4|0xffffff,6|17|0x0b141e,6|23|0xffffff,-134|-1|0x1b2028,-140|-5|0xffffff,-134|11|0x23282f,-134|13|0xffffff",90,3,0,310,58} --多点找色
t['返回_巨龙巢穴_孵化']={ 0x2aacc3, "-51|-18|0x2c92b7,40|15|0x3cc2ba", 90, 503, 467, 645, 519 } --多点找色
t['返回_巨龙巢穴_抚养']={ 0x29aabf, "48|17|0x3bc3ba,238|-2|0x26a5c0,321|-4|0x136ca3", 90, 339, 454, 823, 529 } --多点找色
t['返回_巨龙巢穴_喂养界面']={ 0x2c6117, "-3|-104|0x2c6217,6|61|0x2e611c,171|-87|0x246623", 90, 1007, 119, 1273, 578 } --多点找色
	t['返回_巨龙巢穴_喂养界面_喂养_']={ 0x259fbc, "223|0|0x249cbc", 90, 652, 633, 975, 665 } --多点找色
	t['返回_巨龙巢穴_喂养界面_喂养']={ 0xc50703, "1|10|0x269bbb", 90, 629, 607, 980, 658 } --多点找色
	t['返回_巨龙巢穴_喂养界面_进阶']={ 0x57db39, "-44|-18|0x42c046,-80|-32|0x25f8ff", 90, 853, 610, 1004, 692 } --多点找色
t['返回_巨龙巢穴_开赋界面']={ 0xb2e41b, "2|-106|0x2c6119,7|105|0x2f6218,7|202|0x2e6318", 90, 1030, 144, 1241, 552 } --多点找色	
	t['返回_巨龙巢穴_开赋界面_升级']={ 0xffffff, "0|-4|0x145360,6|0|0x29a6b9", 90, 761, 246, 1013, 685 }
	t['返回_巨龙巢穴_开赋界面_进阶']={0x370000, "-5|-7|0xfc231d,-2|-13|0xc40000,5|11|0xc20201,29|17|0x259cb9,48|49|0xffffff",90,804,242,1021,738} --多点找色
t['弹窗_巨龙升级']={ 0xeea40b, "8|25|0xfcd702,-57|-8|0xebebec,-34|-32|0xcd580d", 90, 825, 600, 1040, 674 } --多点找色
t['弹窗_英雄选择']={ 0xcbc899, "-57|-79|0xebbd92,58|-84|0xebbd92,0|-172|0xfefecc", 90, 31, 272, 1208, 486 } --多点找色
t['弹窗_天赋进阶']={ 0x29a7bf, "-202|-176|0xcc100c,-330|-2|0x27a5bd", 90, 329, 212, 1003, 524 } --多点找色
t['弹窗_深渊_攻击和取消']={ 0xda893c, "-334|-4|0x27a3bd,148|-3|0xb02134,-466|-34|0x2995be", 90, 335, 515, 993, 626 } --多点找色
t['返回_迷途之渊']={ 0xd7b83c, "-253|-189|0x23f6ff", 90, 42, 152, 373, 421 } --多点找色
t['返回_城堡中_深渊按钮']={ 0xbec1be, "-24|26|0x746a49,24|24|0x746a49,14|52|0xe5db77,-25|53|0x125b54", 90, 126, 621, 630, 748 } --多点找色
t['返回_城堡中_龙巢位置']={ 0xf94d22, "-4|-3|0x49414d,-7|-1|0x2a1520", 90, 1145, 356, 1332, 634 } --多点找色
t['返回_深渊界面_可选英雄']={ 0x25824d, "14|-14|0x202941", 75, 99, 106, 1211, 579 } --多点找色
t['返回_深渊界面_下一关']={ 0xf3af04, "7|-9|0xffffff,7|-20|0xd7680a", 90, 528, 642, 807, 743 } --多点找色
t['返回_深渊界面_龙巢位置']={ 0xf1f193, "-1|6|0x0b2527,-21|-4|0x154554", 90, 23, 644, 97, 727 } --多点找色

function dragon()
	local 计时 = os.time()
	local 超时 = 60*10
	优先天赋_ = true
	优先龙巢_ = true
	
	if UIdata.dragon then
		while ((os.time()-计时<超时 )) do
			if active(app,5)then
			elseif UI('在地图中','在地图界面',true,2)then
			elseif UI('返回','返回图标',false,1) and not(UI('新手','战斗界面中',false,1)) then
				if d('返回_城堡中')then
					if d('返回_城堡中_深渊按钮',true)then
						delay(math.random(3,5))
					else
						if d('返回_城堡中_龙巢位置',true)then
							click(x,y+80)
						end
					end
				elseif d('返回_深渊界面') then
					if 优先龙巢_ and d('返回_深渊界面_龙巢位置',true) then
						优先龙巢_ = false
					else
						local heroTime = os.time()
						local Nohero_ = true
						while os.time()-heroTime < 8 do
							if d('返回_深渊界面_可选英雄',true)then
								Nohero_ = false
								break
							end
						end
						d('返回_深渊界面_下一关',true)
							
					end
				elseif d('返回_巨龙巢穴')then
						if d('返回_巨龙巢穴_开赋界面')then
							if d('返回_巨龙巢穴_开赋界面_升级',true)then
							elseif d('返回_巨龙巢穴_开赋界面_进阶',true)then
							else
								click(1097,194)
							end
							优先天赋_ = false
						elseif d('返回_巨龙巢穴_喂养界面')then
							if 优先天赋_ then
								click(1178,299)
							else
								if d('返回_巨龙巢穴_喂养界面_喂养_',true)then
								elseif d('返回_巨龙巢穴_喂养界面_喂养',true)then
								elseif d('返回_巨龙巢穴_喂养界面_进阶',true)then
								else
									UI('返回','返回图标',true,1)
									UI('返回','返回图标',true,1)
								end
							end
						elseif d('返回_巨龙巢穴_孵化',true)then
						elseif d('返回_巨龙巢穴_抚养',true)then
						else
							click(256,603)
						end
				elseif d('返回_迷途之渊',true)then
				else
					UI('返回','返回图标',true,1)
				end
			elseif UI('other','战斗失败',true,2)then
				return true
			elseif d('弹窗_巨龙升级',true)then
				优先天赋_ = true
			elseif d('弹窗_天赋进阶',true)then
			elseif d('弹窗_英雄选择')then
				click(x,y-80)
			else
				f_yiji = yiji_other()
				if f_yiji == '战斗失败' then
					return true
				elseif f_yiji then
					other()
					nLog('other')
				end
			end
			mSleep(500)
		end
	end
end






