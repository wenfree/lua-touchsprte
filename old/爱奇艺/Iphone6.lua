require("tsp")
function moveUp(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(20)
	for i = 0, math.abs(y1 - y2), 8 do
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
end
--滑动
function newPhone()
	openURL("IGG://cmd/newrecord");
	mSleep(1000)
	logTxt = '/var/mobile/iggresult.txt'
	local new
	out_time = os.time()
	while os.time()-out_time <= 10 do
		local new = readFile(logTxt)[1]
		if new == "1" then
			return true
		elseif new == "3" then
			toast('IP-->重复请注意',1)
			return true
		elseif new == '2' then
			nLog('指令正在执行过程中，还未完成')
		end
		mSleep(500)
	end
	return nLog('一键新机超时')
end


m = {}
m['爱奇艺logo']={{22,82,0x0cbe07},{31,82,0x0cbe07},{40,82,0x0cbe07},{49,82,0x0cbe07},}
	m.爱奇艺搜索按钮 = { 0xffffff, "0|-9|0x0bbe06,0|-18|0xf9fdf9,0|-31|0x0bbe06", 90, 626, 140, 712, 197}
	m.点击搜索框 ={ 0x666666, 90, 202, 145, 443, 196}
m['爱奇艺搜索界面']={ 0x0cbe08, "4|46|0x0cbe08,278|21|0x0cbd08,-324|22|0x0cbe08", 90, 8, 43, 653, 126}
m.结果_立即播放={ 0xffffff, "-97|-32|0x0bbe06,87|35|0x0bbe06", 90, 260, 463, 473, 766}
m['爱奇艺集全']={0xffffff, "35|0|0x666666,-1|9|0x6b6b6b,19|9|0x6b6b6b,9|-9|0xffffff", 90, 630, 479, 745, 1325}
m.播放间距_横 = 144
m.播放间距_竖 = 117
m['正在播放绿色']={{81,739,0x0bbe06},}
m['爱奇艺左上角播放']={{40,84,0xffffff},{55,69,0xffffff},{55,98,0xfefefe},{79,0,0x000000},}
m['爱奇艺选集界面']={ 0x666666, "14|-13|0x666666,14|14|0x666666,-4|0|0xffffff", 90, 681, 483, 742, 548}
m.爱奇艺会员跳广告={ 0xffffff, "-18|-7|0xffffff,-61|-9|0xfefefe,-81|-9|0xfefefe", 90, 573, 63, 716, 102}


init('0',0) --竖
app = 'com.qiyi.iphone'
NewPPS = true
STATE = STATE or '其它状态'
moive_setp = 1		--记录播放集数


function PPS()
	All_OutTime = os.time()
	while os.time()-All_OutTime < 60*20 do
		if active(app)then
			delay(2)
		elseif moive_setp > 28 then
			return true
		elseif done(m['爱奇艺logo'],'爱奇艺logo')then
			NewPPS = false
			if f_pic(m.爱奇艺搜索按钮,'爱奇艺搜索按钮')and c_p(m.点击搜索框,'点击搜索框')then
				STATE = '即将搜索'
			end
		elseif f_pic(m['爱奇艺搜索界面'],'爱奇艺搜索界面')then
			toast('即将搜索影片',1)
			moive = '月明三更'
			if c_pic(m.结果_立即播放,'结果_立即播放')then
				delay(5)
			else
				input(moive..'#ENTER#')
			end
			
		elseif done(m['爱奇艺左上角播放'],'爱奇艺左上角播放')then
			if f_tu('全集展开界面',683, 485,740, 542)then
				m['视频初始位置']={{81,622,0x0bbe06},}
				l_h = 0		--竖向位置
				l_x = 0		--横向位置
				if moive_setp <= 5 then
					l_h = 0
					l_x = moive_setp - 1
				elseif moive_setp <= 10 then
					l_h = 1
					l_x = moive_setp - 6
				elseif moive_setp <= 15 then	
					l_h = 2
					l_x = moive_setp - 11
				elseif moive_setp <= 20 then
					l_h = 3
					l_x = moive_setp - 16
				elseif moive_setp <= 25 then
					l_h = 4
					l_x = moive_setp - 21
				elseif moive_setp <= 30 then
					l_h = 5
					l_x = moive_setp - 26
				end
				nLog('横:'..l_x.." 竖:"..l_h)
				
				
				m['视频初始位置'][1][1]=81+l_x*m.播放间距_横
				m['视频初始位置'][1][2]=622+l_h*m.播放间距_竖
				if done(m['视频初始位置'],'播放正确')then
					toast('正确的播放',1)
					TruePlayTime = TruePlayTime or os.time()
					if os.time() - TruePlayTime > 15 then
						moive_setp = moive_setp + 1
						TruePlayTime = os.time()
					end
				else
					toast('修正视频播放集数',1)
					click(m['视频初始位置'][1][1],m['视频初始位置'][1][2])
				end
				
				nextTime = nextTime or os.time()
				if os.time() - nextTime > math.random(3,4) then
					moive_setp = moive_setp + 1
					nextTime = os.time()
					TruePlayTime = os.time()
				else
					if f_pic(m.爱奇艺会员跳广告,'会员跳广告')then
						
					else
						nextTime = os.time()
					end
				end
				
			else
				if c_tu('全集箭头',713, 789,739, 1297)then
					mSleep(2000)
				else
					moveUp(366,999,362,703)
				end
			end
		else
			if NewPPS then
				moveTo(527,742,231,742)
				log('滑动开屏')
			else
				log('其它状态')
			end
		end
		mSleep(1000)
	end
end


function main()
	NewPPS = true
	moive_setp = 1		--记录播放集数
	if VPN() then
		if newPhone()then
			delay(1)
			if PPS()then
				close_VPN()
				return true
			end
		end
	else
		toast('VPN未连接',1)
		mSleep(1000)
	end
	mSleep(1000)
end

while (true) do
	main()
end

























