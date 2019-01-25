require("TSLib")
require("tsp")


function UI(name1,name2,clicks,oder,s)
	clicks = clicks or false
	oder = oder or 1
	s = s or 95
	for i,v in ipairs(aoc[name1][name2]) do
		if isColor(v[1],v[2],v[3],s) then
		else
			return false
		end
	end
	
	if  clicks then
		click(aoc[name1][name2][oder][1],aoc[name1][name2][oder][2])
	end
	nLog(name2)
	return true
end
--多点取色
function UI_pic(n,m,clicks)
	x,y = findMultiColorInRegionFuzzy(aoc[n][m][1],aoc[n][m][2],aoc[n][m][3],aoc[n][m][4],aoc[n][m][5],aoc[n][m][6],aoc[n][m][7])
	if x > 0 and y > 0 then
		clicks = clicks or false
		if clicks then
			click(x,y)
			nLog("点多色-->"..m)
		else
			nLog("找多色-->"..m)
		end
		return true
	end
end



init('0',1);--横屏
toast('剑与家园-希望之光全自动采矿脚本',1)
mSleep(1000*2)
app = 'com.lilithgame.sgame'


aoc={}
aoc['在地图中']={}
aoc['在地图中']['在地图界面']={{1221,36,0x984f00},{312,673,0x425ead},{223,698,0xdb0401},{68,685,0xdcff27},}
	aoc['在地图中']['发现矿点']={ 0x0deeff, "0|11|0x08c8ff,0|38|0x07abff", 90, 200, 20, 989, 647}
--1商城,2领地,3地图,4任务

aoc['返回']={}
aoc['返回']['返回图标']={{36,29,0xf0ef90},}
	aoc['返回']['任务界面']={{210,34,0x0c121c},{210,36,0xffffff},{160,23,0x161c24},{161,23,0xf6f6f6},}
		aoc['返回']['感叹号']={ 0x42ffce, "6|-23|0x39fbca,13|-64|0x00ffdb", 90, 113, 103, 195, 713}
	aoc['返回']['在世界地图上']={{1274,688,0xf4f394},{1279,694,0x103d46},}
		aoc['返回']['前往']={ 0x28681e, "-2|0|0x51d03d,-2|24|0x99f44a", 90, 197, 8, 1214, 741}
		aoc['返回']['在城堡中']={{124,15,0xf4f190},{124,21,0x102e3b},}
	

function find_kuang()
	local time_line = os.time()
	local time_out	= 1*60		--单位:秒
	local clickt = false
	while (os.time()-time_line<time_out) do
		if clickt and UI('在地图中','在地图界面')then
			return true
		elseif UI('在地图中','在地图界面',true,4)then
		elseif UI('返回','返回图标',false,1)then	
			if UI('返回','任务界面',false,1)then
				log('开始找矿',true,1,2)
				
				aoc['返回']['感叹号'][7] = 713
				aoc['返回']['感叹号'][5] = aoc['返回']['感叹号'][7] - 150
					
				for i=1,4 do
					if UI_pic('返回','感叹号')then
						log(x..","..y,false,2)
						aoc['返回']['感叹号'][7] = y - 150
						aoc['返回']['感叹号'][5] = aoc['返回']['感叹号'][7] - 150
						
						local cx,cy = x,y
						--设置区域
						f_x = 190
						f_y = -39
						f_x_x = 712
						f_x_y = 47
						aoc['资源']={}
						aoc['资源']['水']={ 0x5ae4f1, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['资源']['金']={ 0xe7e376, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['资源']['木']={ 0xc78b59, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['资源']['血钻']={ 0xd7121a, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['资源']['水晶']={ 0xe240d3, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['资源']['密银']={ 0xb1ffa4, "", 90, x+f_x, y+f_y, x+f_x_x,y+f_x_y}
						aoc['返回']['指向目标地']={ 0x9ea495, "1|29|0x999f82", 90, x+938, y-54, x+1045, y+29}
						zy_mun = 0
						for k,v in pairs(aoc['资源'])do
							if c_p(v,k,false)then
								zy_mun = zy_mun + 1
							end
						end
						if zy_mun == 1 then
							nLog(cx+979 ..",".. cy-25)
							if c_pic(aoc['返回']['指向目标地'],'指向目标地',true)then
								return true
							end
						end
					end
				end
				
				moveTo(h/2,650,h/2,w/2,5,20)
				mSleep(2000)
			end
		end
		mSleep(1000*1)
	end
end

function other()
	aoc['other']={}
	aoc['other']['运送矿点']={{844,497,0x8aef43},{472,492,0x39bebd},}
	aoc['other']['拦劫']={{869,501,0x99f347},{504,493,0x3fc6b6},}
	aoc['other']['成功抢车']={{647,676,0x65df3d},{666,663,0x256520},{567,667,0xe6e4ed},}
	aoc['other']['取消战斗']={{946,533,0x9c1852},{835,593,0xe7c539},{515,592,0x3dc2b8},}
	aoc['other']['被点确认']={{616,554,0x2dadc1},{628,555,0x3d4362},{631,555,0xffffff},{634,555,0x484e6b},}
	aoc['other']['误攻城堡']={{1274,101,0x0d9639},{1275,80,0xf0e077},{1272,80,0xfefcf2},}
	aoc['other']['公会信息']={{616,75,0xffe200},{652,69,0xffe200},{683,71,0xfde000},{705,70,0xffe200},}
	aoc['other']['误点水泉']={{662,507,0x9af34a},{652,477,0xffffff},}
	aoc['other']['顶号']={{656,464,0xffffff},{667,467,0x26a1bd},}
	aoc['other']['聊天退出']={{29,28,0xe4d38a},{46,10,0xe4d38a},{46,45,0xe4d38a},}
	aoc['other']['暂停界面']={{622,257,0x299dbd},{623,377,0x2aa2bf},{688,526,0x50d3a5},}
	
	if UI('other','运送矿点',true,1)then
	elseif UI('other','拦劫',true,1)then
	elseif UI('other','成功抢车',true,1)then
	elseif UI('other','取消战斗',true,3)then
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
	elseif UI('other','暂停界面',true,2)then
	else
		click(40,40)
	end
end

function auto_get()
	
	while (true) do
		if active(app,5)then
		elseif UI('在地图中','在地图界面')then
			if UI_pic('在地图中','发现矿点',false)then
				click(x,y+150)
			else
				find_kuang()
			end
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','在世界地图上',false,1)then
				UI_pic('返回','前往',true)
				delay(15)
			end
		else
			other()
			nLog('other')
		end
		mSleep(1000)
	end
end

--auto_get()

aoc['car'] = {}
aoc['car']['人物定位']={ 0xe7e4eb, "-11|0|0x373d5e,12|0|0x373d5e,18|0|0xffffff,-16|0|0xffffff", 90, 111, 4, 1223, 743}
aoc['car']['误点城堡']={{847,39,0xe8e0c7},{488,39,0xe9e1c8},}
aoc['car']['有车']={ 0xeb0000, "0|-4|0xfb0000", 90, 103, 21, 1221, 714}
	aoc['car']['前往']={ 0x52d23d, "2|0|0x28691e,-7|0|0xffffff", 90, 315, 44, 1183, 729}
	aoc['car']['点车子']={
		{ 0x63ddf5, "", 90, 449, 60, 890, 232},
		{ 0x63ddf5, "", 90, 759, 166, 1061, 610},
		{ 0x63ddf5, "", 90, 436, 313, 995, 605},
		{ 0x63ddf5, "", 90, 346, 121, 571, 562},
		}
aoc['car']['正在跑路']={ 0x9becf0, "26|-1|0x99f3fb,14|9|0x99f1f7", 90, 220, 111, 1118, 720}
aoc['car']['拦截']={{1176,511,0xffffff},{1316,486,0xef404d},{1071,515,0xf0edf3},}
aoc['car']['无体力劫车']={{1070,513,0xf2f1f2},{1070,507,0x333c4a},{1154,517,0x62778b},{1298,475,0x526474},}
	aoc['car']['展开']={ 0x21ae95, "-6|0|0x49d0b7", 90, 2, 354, 19, 388}
	aoc['car']['技能']={ 0x13130e, "3|-8|0xf3f38e", 90, 32, 392, 128, 433}
	aoc['car']['回城']={ 0xeefff3, "-35|-1|0xc3a155,72|-4|0xb7985f", 90, 212, 161, 391, 354}
	aoc['car']['使用']={ 0x114d5c, "-2|0|0x2193b1,3|0|0xffffff", 90, 930, 482, 1049, 544}
	

function 有车()
	--设置一个初始区域,分5次扩大
	aoc['car']['有车']={ 0xeb0000, "0|-4|0xfb0000", 90, 608,295,808,484}--95,44
	if UI_pic('car','人物定位',false)then
		aoc['car']['有车'][4]=x-30
		aoc['car']['有车'][5]=y-30
		aoc['car']['有车'][6]=x+30
		aoc['car']['有车'][7]=y+30
	end
	for i = 1,15 do
		if UI_pic('car','有车',true)then
			if UI_pic('car','前往',true)then
				return true
			end
		end
		aoc['car']['有车'][4] = aoc['car']['有车'][4] - 50
		aoc['car']['有车'][5] = aoc['car']['有车'][5] - 20
		aoc['car']['有车'][6] = aoc['car']['有车'][6] + 50
		aoc['car']['有车'][7] = aoc['car']['有车'][7] + 20
	end
	lun = lun or 0
	lun = lun + 1
	if lun%4 >= 2 then
		moveTo(1069,350,722,350,40,30)
		delay(1)
	else
		moveTo(722,350,1069,350,40,30)
		delay(1)
	end
end

function 缩小地图()
	if os.time()-地图计时 > 60 * 10 then
		for i = 1,5 do
			log('滑动一次')
			touchDown(1, 800,100)
			touchDown(2, 450,500)
			mSleep(100)
			touchMove(1, 760,120)
			touchMove(2, 480,480)
			mSleep(100)
			touchUp(1, 760,120)
			touchUp(2, 480,480)
			mSleep(200)
		end
			log('滑动一次')
			touchDown(1, 800,100)
			touchDown(2, 480,480)
			mSleep(100)
			touchMove(1, 800,100)
			touchMove(2, 450,500)
			mSleep(100)
			touchUp(1, 800,100)
			touchUp(2, 450,500)
			mSleep(200)
		地图计时 = os.time()
	end
end

function car()
	
	while (true) do
		if active(app,5)then
		elseif UI('在地图中','在地图界面',true,3)then
		elseif UI('返回','返回图标',false,1)then
			if UI('返回','在世界地图上',false,1)then
				缩小地图()
				if 有车()then
					delay(2)
					out_time = os.time()
					while os.time()-out_time < 30 do
						keepScreen(true)
						if UI_pic('car','正在跑路',false)then
							mSleep(1000)
						else
							keepScreen(false)
							for k,v in pairs(aoc['car']['点车子']) do
								if c_p(v,k..'方向车子拦截',false)then
									click(x+50,y+150)
									if UI('car','拦截',true,1)then
										return true
									elseif UI('car','无体力劫车',false,1)then
										UI_pic('car','展开',true)
										UI_pic('car','技能',true)
										UI_pic('car','回城',true)
										if UI_pic('car','使用',true)then
											delay(1*60*2)
										end
									end
								end
							end
							return false
						end
						keepScreen(false)
						if UI('返回','返回图标',true,1)then
							return false
						end
						mSleep(200)
					end
				else
					if UI('car','误点城堡')then
						UI('返回','返回图标',true,1)
					elseif UI('返回','在城堡中',false,1)then
						UI('返回','返回图标',true,1)
					end
				end
			else
				UI('返回','返回图标',true,1)
			end
		else
			other()
			nLog('other')
		end
		mSleep(100)
	end
end


function 劫车()
	地图计时 = 0
	while (true) do
		car()
	end
end
劫车()









































