

if t==nil then
	t={}
end
t['宝箱_宝库木头']={ 0xca9355, "-45|49|0x8c4811,-48|56|0xc59255,-56|99|0x875717,27|-49|0xb77b2b", 90, 91, 172, 1236, 570 } --多点找色
----------------------------------------------------开宝箱---------------------------
function box()
	local time_line = os.time()
	local out_time = 60*2
	
	while (os.time()-time_line < out_time) do
		if active(app,10)then
		elseif 在地图界面(false,clickMun,stayTime)then
			UI_pic('宝箱','未展开',true)
		elseif UI_pic('宝箱','展开',false)then
			UI_pic('宝箱','宝库',true)
		elseif UI('返回','返回图标',false,1)then
			if d('返回_宝库界面',false,1)then
				if d('宝箱_宝库木头',true)then
					local mt = os.time()
					while (UI_pic('宝箱','开启10次',true) or UI_pic('宝箱','开启1次',true)) do
						if os.time()-mt > 15 then break	end
					end
				elseif (d('返回_宝库界面_宝箱激活')) then
					if not(UI_pic('宝箱','宝库_无物品'))then
						return true
					end
					if UI_pic('宝箱','开启10次',true) or UI_pic('宝箱','开启1次',true)then 
					else
						click(167,252)
					end
				else
					click(771,91)
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif d('弹窗_宝箱领取',true,1)then
		else
			click(20,20)
		end
		mSleep(1000)
	end
end

function 商店购买()
	if UIdata.shop then
		if UI_pic('返回','金币可以购买1',false) or UI_pic('返回','金币可以购买2',false) then
			金币不足 = {0xff4b4b,"",90,x+29,y-3,x+136,y+35}
			if c_p(金币不足,'金币不足',false) then
				return false
			else
				if UI_pic('返回','金币可以购买1',true) then
				elseif UI_pic('返回','金币可以购买2',true) then
				end
			end
		end
	end
end

function city()
	if not(UIdata.city)then
		return false
	end
	
	local 计时 = os.time()
	local 超时 = 60*5
	local 优先主城 = true
	local 不造仓库的轮回 = 0
	local 开箱一次 = true
	local 活动星星打开一次 = true
	local 采集信息 = true
	local 上传信息 = true
	show = {}
	local 城市中的爵位 = true
	local 修墙一次 = true
	local 商店滑动key = 0
	local 活动计时 = os.time()
	
	while (os.time()-计时<超时) do
		if active(app,5)then
		elseif d('返回') then
			if d('返回_深渊界面')then
				if d('返回_深渊界面_上阵英雄')then
					x,y = findMultiColorInRegionFuzzy( 0x202841, "2|27|0x20223a,-12|-23|0x6b4d76,44|51|0x3d3551,15|53|0x814c6b", 90, 86, 96, 1275, 618)
					click((x+10),(y+10))
					delay(2)
					click(631,392)
				elseif UI_pic('返回','返回_深渊界面_英雄宝箱',true)then
					delay(2)
				else
					local right_left ={{1196,171,0xe7b646}, {1231,376,0xe1ad3c}, {1088,560,0xf0bf4b}, 
						{896,640,0x7db9fe}, {427,648,0x5360a3}, {230,583,0xa36233}, {108,430,0x755729}, {99,173,0x9e6f20}, 
						{208,253,0xf3c94f}, {202,421,0x16171f}, {314,553,0xe5bb4a}, {472,583,0xa07021}, {784,583,0xaf822f}, 
						{964,542,0xe4975c}, {1108,400,0xbe6759}, {1102,233,0x575769}, }
					touchDown(1, right_left[1][1], right_left[1][2])
					for i,v in ipairs(right_left)do
						touchMove(1, v[1], v[2])
						delay(0.2)
					end
					touchUp(1, right_left[#right_left][1], right_left[#right_left][2])
					delay(5)
					UI('返回','返回图标',true,1)
				end
			elseif os.time() - 活动计时 < 45 and  (UI('返回','挑战赛界面') or UI_pic('返回','活动中心界面')) and not(d('返回_城堡中'))  then
				if not(UI_pic('返回','跨服公会战')) and UI_pic('返回','可以领奖',true)then
					click(892,541)
					mSleep(1000)
				elseif d('返回_活动中心_报名活动',true)then
				elseif UI('返回','活动中心可以抽奖',true)then
				elseif UI_pic('返回','活动右侧例表',true)then
					right_red_tips = right_red_tips or 1
					right_red_tips = right_red_tips + 1
					if right_red_tips % 5 == 0 then
						click(1185,225)
					end
				else
					moveTo(1181,500,1181,300,20)
					moveTo(1181,500,1181,300,20)
					moveTo(1181,500,1181,300,20)
					click(1185,225)
					if not UI_pic('返回','活动右侧例表',true) then
						UI('返回','返回图标',true,1)
					end
				end
			elseif UIdata.citySetting.mail and d('返回_邮件界面')then
				if UI_pic('返回','邮件界面_一键',true)then
				else
					UI('返回','返回图标',true,1)
				end
			elseif UIdata.citySetting.box and d('返回_商城界面')then
				if d('返回_商城界面_宝箱翻页',true,1)then
				elseif UI_pic('返回','免费宝箱',false)and d('返回_商城界面_宝箱页面',true,1)then
					click(40,40,1.5)
					click(40,40,1.5)
					click(40,40,1.5)
					click(40,40,1.5)
				elseif UI_pic('返回','宝箱红点',true)then
				elseif d('返回_商城界面_商城')then
					if 商店购买() then
--					elseif UI_pic('返回','最右端',false)then
					elseif 商店滑动key > 9 then
						toast('购买完成',1)
						UI('返回','返回图标',true,1)
					else
						moveTo(600,375,400,375,10)
						商店滑动key = 商店滑动key + 1
					end
				elseif d('返回_商城界面_会员翻页',true)then
				elseif d('返回_商城界面_补给红点',true)then
				else
					UI('返回','返回图标',true,1)
				end
			elseif UIdata.citySetting.jw and 城市中的爵位 and UI('城堡','技能提示',true)then
			elseif 城市中的爵位 and UI_pic('城堡','技能提示_爵位展开',false,1)then
				if UI_pic('城堡','英雄技能',true) then
					
				else
					城市中的爵位 = false
					UI_pic('城堡','技能提示_爵位展开',true)
				end
			
			elseif UI_pic('返回','爵位界面')then
				if UI_pic('返回','晋升',true)then
				else
					UI('返回','返回图标',true,1)
					click(250,371)
				end
				--点击城堡-----------------------------------------
			elseif d('返回_城堡中') and d('返回_城堡中_右下角对话按钮')then				
				if 上传信息 then
					get_info(aoc_zy['city'])
					click(622,75,2)
					if d('弹窗_城堡内_资源列表')then
						keepScreen(true)
						get_info(aoc_zy['资源'])
						show['iphonename'] = iphonename
						show['imei']=imei
						show['idfa']=idfa
						show['awz']= awz_mun
						show['token']= llsGameToken()
						show['account']= AccountInfo()
						
						for k,v in pairs(show) do
							log(k..":"..v)
						end
						keepScreen(false)
						upAoc_yzlilith(show)
--						upAoc_wenfree(show)
						click(622,75,1)
						上传信息 = false
					end
				else
					delay(1.5)
					UI_pic('城堡','木材',true)
					UI_pic('城堡','金币',true)
					UI_pic('城堡','泉水',true)
					
					if UI_pic('返回','城堡中_深渊',true)then
					else
						if UI_pic('城堡','主城升级中',false)or UI_pic('城堡','主城等待中',false)then
							return true
						else
							if UI_pic('城堡','点击城堡',true)then
							elseif UI_pic('城堡','点击城堡2',true)then
							else
								log('无_随机点击城堡')
								city_left = city_left or 0
								city_left = city_left + 1
								city_left__ = city_left % 3 *80
								click(788 - city_left__ ,165,2)
								
								d('弹窗_城堡内_科技完成',true,1)
							end
						end
						---------------------------------------------------
						if UI_pic('城堡','进入主城',false)then		--主城正在建造
							click(642,123)
							return true
						else
							log('主城无状态')
						end
					end
					
				end
				
			elseif d('返回_城堡中') and UI('城堡','建筑展开',false,1)then

				if UI('城堡','主城升级提示')or UI_pic('城堡','主城升提示',false) then
					if c_p(aoc['城堡']['繁荣不足'],'繁荣不足',false)then
						click(498,543)
						优先主城 = false
					elseif c_p(aoc['城堡']['木材不足'],'木材不足',false)then	--直接结束攒木头
						click(498,543)
						return false
					else
						click(813,544)
						return true
					end
				elseif UI_pic('城堡','建筑提示',false)and UI_pic('城堡','建造',true)then
					click(689,165)
					优先主城 = true
				elseif UI_pic('城堡','建筑提示',false)and UI_pic('城堡','建造资源不足',false)then
					delay(1)
					return false
				else
					delay(1)
					t['城堡中_城墙']={ 0xb17642, "-52|-64|0xace8ca,33|-48|0xab7347,57|-36|0x718d81,46|-40|0xccf6d3,-66|80|0xa4c9c1,-42|85|0x73abc1", 90, 174, 548, 1267, 747 }
					t['城堡中_建筑展开_新建筑']={ 0xf4d765, "-33|-6|0x4ad434,40|-6|0x46d436,3|21|0x008c3d", 90, 165, 551, 1330, 591 }
					if d('城堡中_城墙',true)then
					elseif d('城堡中_建筑展开_新建筑',true)then
					elseif 优先主城 and UI_pic('城堡','主城建筑',true)then
					elseif UI_pic('城堡','非主城建筑',true)then		--非主城
					elseif UI_pic('城堡','主城建筑',true)then
					end
				end
				
			else
				if d('返回_城防内容tips',true) then
				else
					log('1------------------------')
					UI('返回','返回图标',true,1)
				end
			end

		elseif 在地图界面(false,clickMun,stayTime)then
			if 采集信息 then
				click(40,40,2.5)						---点击头像采集信息
				if  d('返回_设置界面') then
					keepScreen(true)
					country_table = {}
					country_table['绿']={{954,287,0x6bc611},}
					country_table['紫']={{954,288,0x692de0},}
					country_table['黄']={{954,287,0xfff81d},}
					country_table['青']={{954,288,0x27b9ff},}
					country_table['橙']={{954,287,0xff8d06},}
					country_table['蓝']={{955,288,0x5052ff},}
					
					for k,v in pairs(country_table)do
						if done(v,k)then
							show['country'] = k
						end
					end
					get_info(aoc_zy['set'])
					采集信息 = false
					keepScreen(false)
				end
			elseif os.time() - 活动计时 < 20  and UI_pic('在地图中','活动奖励',true)then					--活动中心
				活动计时 = os.time()
			elseif UIdata.citySetting.mail and UI_pic('城堡','邮件提醒',true,1)then		--邮件提示
			elseif UI('城堡','商城红点',true,1)then		--商城提示
			elseif 开箱一次 and UIdata.citySetting.bag then
				box()
				开箱一次 = false
			end
			在地图界面(true,2,stayTime)
		elseif UI_pic('城堡','成功为会员',false,2)then
			return true
		else
			log('tip')
			other()
		end
		delay(0.5)
	end
end
































































