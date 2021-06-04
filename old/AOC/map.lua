


function 找金币()
	log('准备开图--find-gold')
	
	开图次数 = 开图次数 or 0
	开图次数 = 开图次数 + 1
	地图金币={}
	
	地图金币['金币图']={ 0xede470, "4|0|0xece471,3|12|0xb98533,12|19|0xb68735,12|20|0xdab23c", 90, 108, 560, 206, 711}
	--aoc['地图']['金币图']={ 0xeadf70, "-7|16|0xeae776,-1|11|0xc68f34,10|18|0xc19336", 90, 118, 19, 1214, 729}
	地图金币['金币图2']={ 0xeae676, "4|0|0xeeeb7a,10|11|0xcf9228,-5|16|0xe9ef84", 90,  118, 19, 1214, 729}
	地图金币['金币图3']={ 0xc1e99f, "-7|17|0xbfe69c,9|12|0xb5ac69,10|15|0xafba6a", 90,  118, 19, 1214, 729}	--中立
	地图金币['金币橙']={ 0xdfbd55, "3|1|0xe0be58,1|12|0xb56419,10|12|0xd1801f,14|12|0xe0b94b", 90, 118, 19, 1214, 729}
	地图金币['金币蓝']={ 0xb4c89b, "5|0|0xb6c99c,5|12|0x77655a,13|12|0xa58b63", 90, 0, 0, 1333, 749}
	地图金币['金币绿']={ 0xb9cf5c, "2|4|0x9a851c,4|5|0xb7c55f,11|15|0xa8a027,11|20|0xa8a428", 90, 0, 0, 1333, 749}
	地图金币['金币紫']={ 0xc5a980, "-3|0|0xc5af82,-9|17|0xc2a87d,7|15|0xb57d4c,8|12|0xb46e4a", 90, 180, 80, 1143, 695}
	
	if UI_pic('地图','跑路错误',false)then
		toast('线路错误,需要更换找图方法',1)
		delay(2)
	else
		if UI_pic('car','人物定位',false)then
			for j,k in pairs(地图金币) do
				k[4] = x-20
				k[5] = y-50
				k[6] = x+20
				k[7] = y+50
				
				if k[4] <= 80 then
					k[4] = 80
				end
				if k[7] >= 739 then
					k[7]=739
				end
			end
			keepScreen(true)
			for i = 1,30 do
				for jj,kk in pairs(地图金币)do
					if c_pic(kk,jj,true)then
						log('>('..x..','..y)
						keepScreen(false)
						delay(1)
						if UI_pic('地图','前往',true)then
							return true
						else
							log('没有找到前往')
							找图失败次数 = 找图失败次数 or 0
							找图失败次数 = 找图失败次数 + 1
							UI('返回','返回图标',true,1)
							return false
						end
					end
				end
				
				for j,k in pairs(地图金币) do
					k[4] = k[4]-50
					k[5] = k[5]-28
					k[6] = k[6]+50
					k[7] = k[7]+28
				end
			end
			keepScreen(false)
		end
		
	end
	
	--结果是 0,1,2,3
	keepScreen(true)
	if 开图次数 %2 == 0 then
		
		for map_x = 0,10 do

			aoc['地图']['金币图'][4] = 118+map_x*120
			aoc['地图']['金币图'][6] = 118+120+map_x*120
			
			aoc['地图']['金币图2'][4] = 118+map_x*120
			aoc['地图']['金币图2'][6] = 118+120+map_x*120
			
			aoc['地图']['金币图3'][4] = 118+map_x*120
			aoc['地图']['金币图3'][6] = 118+120+map_x*120
			
			for jj,kk in pairs(地图金币)do
				if c_pic(kk,jj,true)then
					log('>('..x..','..y)
					keepScreen(false)
					delay(1)
					if UI_pic('地图','前往',true)then
						return true
					else
						log('没有找到前往')
						找图失败次数 = 找图失败次数 or 0
						找图失败次数 = 找图失败次数 + 1
						UI('返回','返回图标',true,1)
						return false
					end
				end
			end
		end
		
	else
		
		for map_x = 10,0,-1 do

			aoc['地图']['金币图'][4] = 118+map_x*280
			aoc['地图']['金币图'][6] = 118+333+map_x*280
			
			aoc['地图']['金币图2'][4] = 118+map_x*280
			aoc['地图']['金币图2'][6] = 118+333+map_x*280
			
			aoc['地图']['金币图3'][4] = 118+map_x*280
			aoc['地图']['金币图3'][6] = 118+333+map_x*280
			
			for jj,kk in pairs(地图金币)do
				if c_pic(kk,jj,true)then
					log('>('..x..','..y)
					keepScreen(false)
					delay(1)
					if UI_pic('地图','前往',true)then
						return true
					else
						log('没有找到前往')
						找图失败次数 = 找图失败次数 or 0
						找图失败次数 = 找图失败次数 + 1
						UI('返回','返回图标',true,1)
						return false
					end
				end
			end
		end
		
	end
	keepScreen(false)
end




function map()
	计时 = os.time()
	超时 = 60*2
	way = 0
	ditu = 0
	开图 = 0
	地图数量 = tonumber(values.map_mun)
	while (os.time()-计时<超时) do
		if active(app,10)then
		elseif 开图 >= 地图数量 then
			return true
		elseif UI('在地图中','在地图界面',false,3,80)then
			delay(1)
			map_time = os.time()
			while (os.time()-map_time < 10) do
				keepScreen(true)
				if UI_pic('地图','正在跑路',false)or UI_pic('地图','正在跑路小',false)then
					delay(2)
				else
					keepScreen(false)
					break
				end
				keepScreen(false)
			end
			
			if UI_pic('地图','探索',true)then
				开图 = 开图 + 1
			else
				UI('在地图中','在地图界面',true,3)
			end
		elseif UI('返回','返回图标',false,1)then
			if UI('城堡','在城堡中',false,1)then
				UI('返回','返回图标',true,1)
			elseif UI('返回','在世界地图上',false,1)then
				
				if 找金币()then
					
				else
	
					way = way + 1
					ways = way%4
					log(ways)
					if  ways == 1 then
						moveTo(668,375,668 + way*20,375,5*way)			--右
						delay(1)
					elseif ways == 2 then
						moveTo(668,375,668,375 + way*20,5*way)			--下
						delay(1)
					elseif ways == 3 then
						moveTo(668,375,668 - way*20,375,5*way)			--左
						delay(1)
					elseif ways == 0 then
						moveTo(668,375,668,375 - way*20,5*way)			--上
						delay(1)
					end
					if way >= 12 then
						return false
					end
				end
			else
				UI('返回','返回图标',true,1)
			end
		else
			log('tip')
			other()
		end
		mSleep(1000)
	end
end



function map_one()
	计时 = os.time()
	local 超时 = 60*1
	地图跑路次数 = 地图跑路次数 or 0
	while (os.time()-计时<超时) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面',false,3,80)then
			log('开地图路上')
			delay(1)
			map_time = os.time()
			while (os.time()-map_time < 20) do
				keepScreen(true)
				if UI_pic('地图','正在跑路',false)or UI_pic('地图','正在跑路小',false)then
					delay(3)
				else
					keepScreen(false)
					break
				end
				keepScreen(false)
			end
			
			delay(2)
			
			if UI_pic('地图','探索',true)then
				UI('在地图中','在地图界面',true,3,80)
				return true
			else
				if UI_pic('地图','线路错误红色',false)then
					地图跑路次数 = 地图跑路次数 + 1
					return false
				else
					k = 地图跑路次数%4 + 1
					跑路4方向={{677,160,0x304c28},{1166,341,0xd8d8d8},{665,596,0x445835},{272,327,0x87493a},}
					click(跑路4方向[k][1],跑路4方向[k][2])
					if UI_pic('地图','探索',true)then
						UI('在地图中','在地图界面',true,3,80)
					else
						地图跑路次数 = 地图跑路次数 + 1
						UI('在地图中','在地图界面',true,3,80)
						return false
					end
				end
			end
		else
			other()
		end
		mSleep(1000)
	end
end

