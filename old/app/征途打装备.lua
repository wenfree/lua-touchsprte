require("tsp")
game = "com.tencent.zhengtuiphone"


m={}
m['在墓地']={{1115,25,0xc4a650},}
m['在皇城']={{1115,10,0xdbb64a},}
m['中立皇城']={{568,31,0xffd678},{565,31,0x822500},}
m.点开人物={ 0xbb974c, "-12|-10|0x442f03", 90, 54, 79, 93, 118}
m.古墓守护者={ 0xefbf00, 90, 111, 183, 137, 486}
m.地图x={ 0xd5b559, "0|-5|0x4a2f03", 90, 1049, 28, 1070, 48}
m['进入古墓']={{424,87,0xd5b559},{265,76,0xb94300},{132,81,0xb79f50},}
m['开启挂机']={{908,480,0x596470},{914,487,0xb1b6ce},}
m['自动战斗']={ 0xfff38d, 90, 517, 196, 624, 228}




init("0",1)
log('sss')

while (true) do
	if active(game)then
		delay(5)
	end
	if done(m['在墓地'],'在墓地')then
		ccc = ccc or 0
		if os.time()-ccc > 60 then
			click(1079,578)
			ccc = os.time()
		end
		if f_p(m['自动战斗'],'自动战斗')then
			delay(3)
		elseif done(m['开启挂机'],'开启挂机')then
			click(913,487)
		end
	else
		if done(m['中立皇城'],'中立皇城')then
			if c_pic(m.点开人物,'点开人物')then
				delay(2)
				movexy(181,455,177,232)
				delay(3)
				c_p(m.古墓守护者,'古墓守护者')
			end
			c_pic(m.地图x,'地图x')
		elseif done(m['在皇城'],'在皇城')then
			if f_p(m['自动战斗'],'自动战斗')then
			elseif done(m['进入古墓'],'进入古墓')then
				click(215,371)
			else
				click(1059,95)
			end
		end
	end
	mSleep(500)
end



