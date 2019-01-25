require("tsp")


app = 'com.juzi.balls'
awz_bid = 'AWZ'

m={}
m['正在加载']={{443,297,0xf8f05a},{490,301,0xf8f15b},{578,290,0xf5fb69},{841,617,0x92bbd4},{687,288,0xf5fc5d},}
m['游戏通知']={{320,165,0xb2ec86},{543,391,0xed8b32},{830,371,0xf7f4c9},{795,168,0xeff5cb},{792,307,0xed171a},}
m['游戏公告']={{556,84,0x677d55},{963,91,0x677d55},{962,79,0xf8ffe0},{555,552,0x82cf78},{553,551,0xf3fddc},}
m['开始比赛']={{470,402,0x82cf78},{475,402,0x82cf78},{577,419,0xe7f6e5},{502,51,0xfbec21},{716,303,0xffffff},}
m['恢复比赛']={{502,413,0x82cf78},{507,413,0xf7fedf},{555,412,0x82cf78},{581,421,0x82cf78},{620,414,0xf8ffe0},{621,416,0x82cf78},}
m['主界面']={{1006,25,0xff0000},{985,52,0x677d55},{999,52,0x677d55},{1000,47,0xedffc9},{515,10,0xed1e79},}
m['找朋友界面']={{127,87,0x687e56},{129,86,0xfbffea},{175,67,0x697f57},{206,61,0x677d55},{206,87,0x687e56},{148,173,0x859c72},}
m.请输入={ 0xb1d097, "-7|0|0x859c72,-12|-2|0xb1d097", 90, 181, 165, 211, 181}
m.完成={ 0x000000, "3|-1|0xa6b3b4", 90, 983, 579, 1063, 622}
m.加关注={ 0xfefffe, "2|0|0x82cf79,4|0|0xf9fdf8,5|0|0x84d07a,31|-7|0x88d17e,68|-2|0xfdfefd", 90, 299, 477, 406, 516}
m.已关注={ 0xe9e9e9, "9|0|0xa3a3a3,14|-3|0xe8e8e8,18|-9|0xa3a3a3,22|-10|0xfefefe,40|-7|0xa3a3a3", 90, 297, 474, 409, 520}
--------------------------------------------------------------------------------------------------------------------------------
m['awzUI']={{222,175,0x4cd864},{550,170,0x4cd864},{551,527,0x4bd763},{220,530,0x4cd864},}
m.一键新机={ 0xffffff, "9|3|0x6f7179,75|3|0xffffff,101|-1|0x6f7179,105|-9|0xffffff", 90, 91, 592, 228, 638}
m.ip红={ 0xff0000, "5|0|0xffffff", 90, 32, 644, 295, 683}
m.ip黑={ 0x000000, "4|-1|0xffffff", 90, 31, 644, 295, 683}

function close_VPN()
	setVPNEnable(false)
	delay(2)
end
function VPN()
	init(0,0);
	out_time = os.time()
	while (true) do
		setVPNEnable(true)
		delay(2)
		flag = getVPNStatus()
		if flag.active then
			log("VPN 打开状态"..flag.status)
			if flag.status == '已连接' then
				return true
			end
		else
			log("VPN 关闭状态"..flag.status)
		end
	end
	if os.time() - out_time > 120 then
		return false
	end
end

function awz()
	init(app,0)
	out_time = os.time()
	while os.time() - out_time <= 20 do
		if active(awz_bid)then
			delay(1.5)
		elseif done(m['awzUI'],'awzUI')then
			if c_pic(m.一键新机,'一键新机')then
				delay(3)
				out_time2 = os.time()
				while (true) do
					if f_pic(m.ip红,'ip红') or f_pic(m.ip黑,'ip黑') then
						delay(1)
						return true
					end
					if os.time() - out_time2 >= 10 then
						return false
					end
				end
				
			end
		end
	end
end


function add()
	init(app,1)
	out_time = os.time()
	while true do
		if active(app)then
			delay(2)
		end
		if done(m['正在加载'],'正在加载')then
			delay(2)
		elseif done(m['游戏通知'],'游戏通知')or done(m.游戏公告,'游戏公告')then
			click(569,552) --我知道了
		elseif done(m['恢复比赛'],'恢复比赛')then
			click(1000,88)	--跳过比赛
		elseif done(m['主界面'],'主界面')then
			click(991,52)	--找朋友
		elseif done(m['找朋友界面'],'找朋友界面')then
			if c_pic(m.加关注,'加关注')then
			elseif c_pic(m.已关注,'已关注')then
				toast('关注一次',1)
				closeApp(app)
				delay(2)
				return true
			elseif c_pic(m.请输入,'请输入')then
				input('卖观战的小女孩')
				c_pic(m.完成,'完成')
			end
		elseif done(m['开始比赛'],'开始比赛')then
			click(548,412)
			click(1047,566 )
			click(1047,566 )
			click(1047,566 )
			closeApp(app)
			delay(2)
		else
	
		end
		if os.time() - out_time >= 120 then
			closeApp(frontAppBid())
			delay(1)
			return false
		end
		delay(1)
	end
end

while (true) do
	close_VPN()
	if awz()then
		if VPN()then
			add()
		end
	end
end
