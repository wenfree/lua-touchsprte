require("TSLib")
require("Api")
require("tsp")



page={}
page['阿波罗']={}
page['阿波罗']['一键新机']={ 0x1abc9c, "0|-8|0xecf0f1,-20|-7|0x26bfa1", 90, 55, 612, 222, 661}
page['阿波罗']['确定']={ 0xf0f6f5, "0|-2|0x007aff,2|-2|0x007aff", 90, 280, 611, 358, 652}
page['阿波罗']['确定error']={ 0x007aff, "23|1|0x007aff", 90, 282, 648, 351, 680}


function abl()

	计时 = os.time()
	超时 = 60 * 1
	abl_bid = 'com.beibeijia.Apollon'
	
	while os.time() - 计时 <= 超时 do
		if active(abl_bid,3)then
		elseif c_pic(page['阿波罗']['一键新机'],'一键新机',true)then
		elseif c_pic(page['阿波罗']['确定'],'确定',true)then
			if c_pic(page['阿波罗']['一键新机'],'一键新机',false)then
				return true
			end
		elseif c_pic(page['阿波罗']['确定error'],'确定error',true)then
		end
	end
	
end



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
	mSleep(4000)
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
				toast('一键新机中',2)
			end
			mSleep(2000)
		end
		mSleep(1000* 3)
	end
end

function awz2()
	--openURL("IGG://cmd/newrecord");
	active('AWZ')
	click(163,615)
	mSleep(1000*6)
	return true
end

function boxshow(txt)
	adbox = adbox or 0
	if adbox == 0 then
		adbox = 1
		fwShowWnd("wid",0,0,0,0,1)
		mSleep(2000)
	end
	fwShowTextView("wid","textid",txt,"center","FF0000","FFDAB9",0,0,0,w-120,150,h-100,0)
end

m = {}
m['首页']={}
m['首页']['爱奇艺搜索按钮']={ 0xffffff, "-3|28|0x1ecc1a,2|-27|0x1ecc1a", 90, 6, 131, 461, 206}
m['首页']['点击搜索框']={ 0x666666, "", 90, 204, 143, 353, 185}
m['首页']['爱奇艺logo']={{22,82,0x0cbe07},{31,82,0x0cbe07},{40,82,0x0cbe07},{49,82,0x0cbe07},}


m['搜索界面']={}
m['搜索界面']['爱奇艺搜索界面']={ 0x0bbe06, "2|-30|0x171c16,0|-61|0x0bbe06,19|-32|0x0bbe06", 90, 16, 39, 131, 124}

m['搜索界面']['搜索按钮']={ 0x007aff, "-6|-13|0x007aff", 90, 553, 1080, 622, 1117}
m['搜索界面']['立即播放']={ 0x23d41e, "-23|-34|0x2cd628,-26|34|0x23d41e,133|3|0x23d41e", 90, 256, 439, 507, 621}

m['播放界面']={}
m['播放界面']['左上角播放']={{55,63,0xffffff},{42,77,0xffffff},{55,90,0xffffff},}
m['播放界面']['点击全集']={0x999999, "-537|7|0x333333,-536|7|0xf5f5f5,-587|-2|0x333333", 90, 0, 459, 635, 998}

m['播放界面']['选集界面']={{586,394,0x999999},{613,394,0x999999},{600,403,0xffffff},{600,407,0x999999},}
m.播放间距_横 = 122
m.播放间距_竖 = 102

m['正在加载']={{261,331,0x0bbe06},}
m['广告加载']={{235,219,0x0bbe06},}
m['广告展示']={{574,340,0xffffff},{605,371,0xffffff},{593,91,0xd5d5d7},}
m['会员跳广告']={0xf8f8f7, "33|1|0xffffff", 90, 534, 65, 612, 104}


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
	app = 'com.qiyi.iphone'
	计时 = os.time()
	超时 = 60 * 20
	输入关键词 = true
	向上 = true
	向上次数 = 0
	NewIQIYI = true
	
	while os.time()-计时 < 超时 do
		if active(app,5)then
			输入关键词 = true
		elseif moive_setp > all_moive_setp then
			closeX(app)
			boxshow('即将下一条')
			return true
		elseif done(m['首页']['爱奇艺logo'],'爱奇艺logo')then
			
			if c_pic(m['首页']['爱奇艺搜索按钮'],'爱奇艺搜索按钮') then
				if c_p(m['首页']['点击搜索框'],'点击搜索框',true)then
					NewIQIYI = false
					toast('点击搜索',1)
				end
			else
				moveTo(150,h/2,499,h/2,20)
			end
			
		elseif c_pic(m['搜索界面']['爱奇艺搜索界面'],'爱奇艺搜索界面',false)then
			
			if c_pic(m['搜索界面']['立即播放'],'立即播放',true)then
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
				if c_pic(m['搜索界面']['搜索按钮'],'搜索按钮',true)then
					delay(math.random(2,6))
				end
			end
			
		elseif NewIQIYI == false and done(m['播放界面']['左上角播放'],'正在播放')then
			
			if done(m['播放界面']['选集界面'],'选集界面')then
				
				m['视频位置初始位置']={{76,533,0x20bc22},}
				m['视频位置VIP']={{76,533,0xdab176},}
				
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
				nLog('第'..moive_setp..'集,横:'..l_x.." 竖:"..l_h)
				
				
				m['视频位置初始位置'][1][1]=76+l_x*122
				m['视频位置初始位置'][1][2]=533+l_h*102
				m['视频位置VIP'][1][1]=76+l_x*122
				m['视频位置VIP'][1][2]=533+l_h*102
				
				if done(m['视频位置初始位置'],'视频位置初始位置')or done(m['视频位置VIP'],'视频位置VIP')then

				else
					toast('下一集',1)
					click(m['视频位置初始位置'][1][1],m['视频位置初始位置'][1][2])
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
				elseif done(m['广告展示'],'广告展示')or c_pic(m['会员跳广告'],'会员跳广告')then
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
				if c_pic(m['播放界面']['点击全集'],'点击全集',true) then
					mSleep(1000)
				else
					
					if 向上次数 > 3 then
						moveTo(w/2,h/2,w/2,h/2+100,2)
						mSleep(1000)
					end
					
					if 向上 then
						moveUp(366,999,362,703)
						mSleep(1000)
						向上次数 = 向上次数 + 1
					end
					
				end
			end
		else
			log('其它状态')
			if NewIQIYI then
				moveTo(499,h/2,150,h/2,20)
				log('滑动开屏')
				delay(2)
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
	VPN_key = true --// false
	new_key = false--// false
	
	if VPN_key or VPN()then	--设置新机
		if new_key or abl() then	--设置VPN
			
			if get_task()then
				for i,v in pairs(taskData.tasks)do
					
					if  v.type == '爱奇艺' then
						
						task_id = v.task_id
						moive = v.search_word 
						video_name = v.video_name 
						all_moive_setp = tonumber(v.video_num) 
						watch_time = tonumber(v.watch_time) 
						moive_setp = 1
						NewIQIYI = true
						
						--[[

						moive = "一路向西再向西"
						video_name = "一路向西再向西"
						all_moive_setp = 5
						watch_time = 5
						moive_setp = 1
						NewIQIYI = true
						
						--]]
						
						if iqiyi()then
							--upload_task(task_id)
						end
						
					end
					
				end
			else
				toast('等待任务',10)
				mSleep(1000* 10)
			end
			
		end
		close_VPN()
		mSleep(1000* 2)
	else
		toast('VPN未连接',1)
		mSleep(1000 * 3)
	end
	mSleep(1000)
end

while (true) do
	main()
end

























