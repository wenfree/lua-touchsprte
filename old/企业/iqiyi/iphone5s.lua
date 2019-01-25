require("TSLib")
require("Api")
require("tsp")


function moveUp(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(20)
	for i = 0, math.abs(y1 - y2), 5 do
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
end
--滑动
function awz()
	openURL("IGG://cmd/newrecord");
	mSleep(1000)
	logTxt = '/var/mobile/iggresult.txt'
	out_time = os.time()
	while os.time()-out_time <= 10 do
		if file_exists(logTxt)then
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
		else
			toast('一键新机',3)
			mSleep(1000* 3)
			return true
		end
	end
	return true
end

function awz2()
	--openURL("IGG://cmd/newrecord");
	active('AWZ')
	mSleep(1000*3)
	click(163,615)
	mSleep(1000*8)
	return true
end

function boxshow(txt)
	box = box or 0
	if box == 0 then
		box = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",0,0,0,h-80,150,h-3,0)
end

m = {}
m['爱奇艺logo']={{22,82,0x0cbe07},{31,82,0x0cbe07},{40,82,0x0cbe07},{49,82,0x0cbe07},}
	m.爱奇艺搜索按钮 = { 0x0bbe06, "0|-8|0xfefffe,-8|0|0xffffff,9|0|0xffffff", 90, 524, 132, 639, 198}
	m.点击搜索框 ={ 0x666666, "", 90, 204, 143, 353, 185}
m['爱奇艺搜索界面']={ 0x0cbe08, "47|21|0x0bbe06,90|45|0x0cbe08", 90, 11, 47, 561, 121}
	m.搜索按钮={ 0x007aff, "-6|-13|0x007aff", 90, 553, 1080, 622, 1117}
	m.结果_立即播放={ 0x0bbe06, "-88|-29|0x0bbe06,71|28|0x0bbe06", 90, 220, 336, 462, 687}
	

m['爱奇艺左上角播放']={{40,84,0xffffff},{55,69,0xffffff},{55,98,0xfefefe},{79,0,0x000000},}
	m.去打榜 = {  0xff8122, "", 90, 521, 499, 639, 1135}
	m['爱奇艺集全']={0xffffff, "35|0|0x666666,-1|9|0x6b6b6b,19|9|0x6b6b6b,9|-9|0xffffff", 90, 630, 479, 745, 1325}
	m['爱奇艺选集界面']={ 0x666666, "14|-13|0x666666,14|14|0x666666,-4|0|0xffffff", 90, 681, 483, 742, 548}
		m.播放间距_横 = 122
		m.播放间距_竖 = 102
		m['正在播放绿色']={{69,552,0x0bbe06},}
		
	m.全集展开界面 = {'5s全集展开界面',569, 422,637, 487}	
		m['正在加载']={{261,331,0x0bbe06},}
		m['广告加载']={{235,219,0x0bbe06},}
		m['广告展示']={{574,340,0xffffff},{605,371,0xffffff},{593,91,0xd5d5d7},}


function inputT(txt)
	writePasteboard(txt,0)
	mSleep(200)
	keyDown("RightGUI") 
	keyDown("v")
	keyUp("v")
	keyUp("RightGUI")
	mSleep(500)
end

function iqiyi()
	init('0',0) --竖
	log('爱奇艺')
	app_iqiyi = 'com.qiyi.iphone'
	计时 = os.time()
	超时 = 60 * 20
	输入关键词 = true
	
	while os.time()-计时 < 超时 do
		if active(app_iqiyi)then
			输入关键词 = true
		elseif moive_setp > all_moive_setp then
			closeX(app_iqiyi)
			return true
		elseif done(m['爱奇艺logo'],'爱奇艺logo')then
			NewIQIYI = false
			if c_pic(m.爱奇艺搜索按钮,'爱奇艺搜索按钮')and c_p(m.点击搜索框,'点击搜索框',true)then
				toast('点击搜索',1)
			else
				moveTo(150,h/2,499,h/2)
			end
		elseif c_pic(m['爱奇艺搜索界面'],'爱奇艺搜索界面',false)then
			
			
			if c_pic(m.结果_立即播放,'结果_立即播放',true)then
				delay(1) --立即进入播放界面
			else
				if 输入关键词 then
					toast('即将搜索影片',1)
					click(435,84)
					输入关键词 = false
					inputStr(moive)
					toast('输入影片名<<'..moive..'>>',1)
					--input(moive)
				end
				if c_pic(m.搜索按钮,'搜索',true)then
					delay(math.random(2,6))
				end
			end
			
		elseif done(m['爱奇艺左上角播放'],'爱奇艺左上角播放')then
			
			if c_tu('5s全集展开界面',569, 422,637, 487)then
				
				m['视频初始位置']={{81,622,0x0bbe06},}
				m['视频初始位置试看']={{436,554,0xcfb385},}
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
				
				
				m['视频初始位置'][1][1]=69+l_x*m.播放间距_横
				m['视频初始位置'][1][2]=552+l_h*m.播放间距_竖
				m['视频初始位置试看'][1][1]=69+l_x*m.播放间距_横
				m['视频初始位置试看'][1][2]=552+l_h*m.播放间距_竖
				
				if done(m['视频初始位置'],'播放正确')or done(m['视频初始位置试看'],'播放正确')then

				else
					toast('下一集',1)
					click(m['视频初始位置'][1][1],m['视频初始位置'][1][2])
					loading,loadingAd,AD,other = 0,0,0,0
				end
				
				loading = loading or 0
				loadingAd = loadingAd or 0
				AD = AD or 0
				other = other or 0
				
				if done(m['正在加载'],'正在加载')then
					loading = loading + 1
					boxshow('播放'..moive_setp.."/"..all_moive_setp..'\n正在加载')
				elseif done(m.广告加载,'广告正在加载不计时')then
					loadingAd = loadingAd + 1
					boxshow('播放'..moive_setp.."/"..all_moive_setp..'\nAD-加载')
				elseif done(m['广告展示'],'广告展示') then
					AD = AD + 1
					boxshow('播放'..moive_setp.."/"..all_moive_setp..'\n广告计时-'..AD)
					if AD > 4 then
						moive_setp = moive_setp + 1
					end
				else
					other = other + 1
					boxshow('播放'..moive_setp.."/"..all_moive_setp..'\n正片播放'..other)
				end
				
				if other > 10 or loading > 15 or loadingAd > 15 then
					moive_setp = moive_setp + 1
				end
				
				
				mSleep( 1000* 0.4 )
			else
				if c_tu('5s全集箭头',w-65,0.35*h,w, h,true)or c_tu('全集箭头pp',w-65,0.35*h,w, h,true)then
					mSleep(2000)
				else
					if c_p(m.去打榜,'去打榜')then
						moveUp(366,999,362,703)
						mSleep(2000)
					else
						moveTo(w/2,h/2,w/2,h/2+100,2)
						mSleep(1000)
					end
				end
			end
		else
			if NewIQIYI then
				moveTo(499,h/2,150,h/2)
				log('滑动开屏')
			else
				log('其它状态')
			end
		end
		mSleep(1000 * 0.5)
	end
end

function beforeUserExit()
	--closeX(app_iqiyi)
	close_VPN()
end

function main()
	VPN_key = false --// false
	new_key = false --// false
	
	if VPN_key or VPN()then	--设置新机
		if new_key or awz2() then	--设置VPN
			if get_task()then
				for i,v in pairs(taskData.tasks)do
					
					if v.type == '爱奇艺' then
						task_id = v.task_id
						moive = v.search_word
						video_name = v.video_name
						all_moive_setp = tonumber(v.video_num)
						watch_time = tonumber(v.watch_time)
						moive_setp = 1
						NewIQIYI = true
						
						if iqiyi()then
							upload_task(task_id)
							return true
						end
						closeX(app_iqiyi)
					end
				end
			else
				toast('等待任务',30)
				mSleep(1000* 30)
			end
		end
		close_VPN()
	else
		toast('VPN未连接',1)
		mSleep(1000 * 3)
	end
	mSleep(1000)
end

while (true) do
	main()
end

























