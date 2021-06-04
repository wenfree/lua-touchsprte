	



if t == nil then
	t={}
end

t['城堡_研究提示']={ 0x7aff81, "2|-21|0x7aff81,-22|2|0x03f04a,21|3|0x03f04a,1|24|0x03f04a", 90, 587, 157, 749, 287 } --多点找色
t['返回_科技选择界面']={ 0xf4d765, "-628|-5|0xf4d765", 90, 255, 474, 1101, 525 } --
	t['返回_科技选择界面_士兵科技']={ 0xf8e198, "9|-9|0xd02e20", 90, 535, 149, 578, 178 } --
	t['返回_科技选择界面_英雄科技']={ 0xffe49a, "10|-7|0xcc2923", 90, 1162, 146, 1203, 185 } --
t['返回_科技选择界面_科技展开']={ 0xdfffe5, "0|2|0x32a57d", 90, 1027, 160, 1105, 192 } --多点找色
t['返回_科技选择界面_第二队例']={ 0xfeffff, "9|0|0x213d4a", 90, 282, 697, 367, 740 } --多点找色

function keji()
	if not(UIdata.keji)then
		return false
	end

	local 计时 = os.time()
	local 超时 = 60*1.5
	local 研究方向 = ''

	while (os.time()-计时< 超时) do
		if active(app,5)then
		elseif UI('在地图中','在地图界面',true,2)then	
		elseif UI('返回','返回图标',false,1)then
			if d('返回_城堡中') and d('返回_城堡中_右下角对话按钮')then
				---研究开始
				keji_ok = 0
				while UI_pic('返回','研究完成',true) do
					click(656,506)
					delay(4)
					keji_ok = keji_ok + 1
					if keji_ok > 5 then break end
				end
			
				if d('城堡_研究提示',true)then
				else
					return "暂无研究"
				end
			elseif d('返回_科技选择界面')then
				if d('返回_科技选择界面_士兵科技',true)then
					研究方向 = 1
				elseif d('返回_科技选择界面_英雄科技',true)then
					研究方向 = 2
				else
					UI('返回','返回图标',true,1)
				end
			elseif UI_pic('返回','研究院界面')then
				if not(d('返回_科技选择界面_第二队例'))then
					if tonumber(UIdata.keji_setting) == 5 then  --研究车子
						moveTo(900,400,500,400,50)
						delay(2)
					end
					if not(d('返回_科技选择界面_科技展开'))then
						if 研究方向 == 1 then
							click(科技位置[tonumber(UIdata.keji_setting)][1],科技位置[tonumber(UIdata.keji_setting)][2])
						elseif 研究方向 == 2 then
							click(科技位置[tonumber(UIdata.hero_setting)][1],科技位置[tonumber(UIdata.hero_setting)][2])
						end
					end
					delay(1)
					if UI_pic('返回','研究空',true) or UI_pic('返回','研究蓝',true)then
						if UI_pic('返回','研究按钮_研究',true,1)then
						elseif UI('返回','加入研究院',true,1)then
						end
					else
						moveTo( 900,300,400,300,10)
						moveTo( 900,300,400,300,10)
						delay(1)
						if UI_pic('返回','研究空',true) or UI_pic('返回','研究蓝',true)then
							if UI_pic('返回','研究按钮_研究',true,1)then
							elseif UI('返回','加入研究院',true,1)then
							end
						end
					end
				else
					click(20,20)
				end
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI_pic('城堡','成功为会员',false,2)then
			return log('研究满')
		else
			other()
		end
		mSleep(1000)
	end

end



t['城堡中_矮人']={ 0xd6fdff, "1|9|0xffb455,-2|-13|0xffd79f", 90, 579, 642, 718, 749 } --公告栏
t['城堡中_巫妖']={ 0xd6fdff, "1|10|0xffbc64,-1|-10|0xfdd19a", 90, 14, 432, 108, 556 } --公告栏

t['返回_训练界面']={ 0xb4e61b, "98|4|0xc9ef10,93|102|0x448025", 90, 1020, 137, 1295, 377 } --
	t['返回_训练界面_队例已满']={ 0xff0000, "5|-7|0xff0000", 90, 352, 436, 556, 475 } --
	t['返回_训练界面_造兵提示']={ 0xffffff, "0|14|0xffffff", 90, 644, 309, 1031, 344 } --


function Armybuilding()
	local 计时 = os.time()
	local 超时 = 60*1.5
	local 种族 = ''


	while (os.time()-计时< 超时) do
		
		if active(app,5)then
		elseif UI('在地图中','在地图界面',true,2)then	
		elseif UI('返回','返回图标',false,1)then
			if d('返回_城堡中') and d('返回_城堡中_右下角对话按钮')then
				if d('城堡中_矮人')then
					种族 = '矮人'
				elseif d('城堡中_巫妖')then
					种族 = '巫妖'
				end
				
				local 兵营位置 = {
					['矮人']={606,553,0xbec1c1},
					['巫妖']={1213,423},}
				if 种族 ~= '' then
					click(兵营位置[种族][1],兵营位置[种族][2]-80)
					click(兵营位置[种族][1],兵营位置[种族][2])
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('返回_训练界面')then
				local creatTimeline = os.time()
				while (d('返回_训练界面')) and os.time()-creatTimeline < 15 do
					if d('返回_训练界面_队例已满')then
						click(20,20)
						return '满队例'
					elseif d('返回_训练界面_造兵提示')then
						click(x-100,y-100,0.2)
					end
				end

			else
				UI('返回','返回图标',true,1)
			end
		else
			other()
		end
		mSleep(1000)
	end
	return '造兵超时'

end









