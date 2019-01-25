require("tsp")
game = 'm.Sgame.yzr2.hero'
ok_path = '/User/Media/TouchSprite/lua/影之刃2-OK帐号.txt'

function getID()
	local a = io.popen("find "..appDataPath("m.Sgame.yzr2.hero") .. "/Documents/* -prune")
	local f = {}
	for l in a:lines() do
		l = l:match(".+%/(%d+)")
		if l then
			return l
		end
	end
end

m={}
m['登录']={{473,580,0x462874},{661,577,0x9c6413},{1041,584,0x87729c},{313,73,0xffffff},}
m['免费注册']={{809,208,0x5fc389},{799,460,0xea4e65},{1044,585,0x6c5c7e},}
m['用户名注册']={{809,264,0x4bbd7c},{814,459,0xea4e65},{1038,585,0x6e5e7f},}
m['用户名注册2']={{529,93,0xe83c46},{186,104,0xcccccc},{320,437,0xea4e65},}
m['注册帐号界面']={{813,445,0xea4e65},{1036,585,0x726182},{134,97,0xcccccc},{654,99,0xececed},}
m['帐号x']={ 0xbcbbbd, "12|0|0xebeaeb,21|0|0xbcbbbc", 90, 767, 44, 814, 85}
m['请输入帐号']={ 0xc0c0c5, "6|0|0xebebeb,40|3|0xcacacf,39|-7|0xbab9bf", 90, 396, 205, 561, 249}
m['请输入密码']={ 0xb8b8c0, "11|13|0xb8b8bf,42|11|0xb9b8c1,44|8|0xececee", 90, 387, 324, 584, 385}
m['确认']={ 0xeeeeee, "4|0|0xea4e65,9|0|0xea4e65", 90, 515, 456, 623, 517}
m['进入游戏']={{53,11,0xf5f5f5},{566,585,0x956314},{298,53,0xffffff},}
m['创建角色']={{53,12,0xffffff},{765,177,0x0c0c0c},{565,584,0x966315},{772,171,0xffffff},}
m.角色完成={ 0xffffff, "6|-3|0x007aff", 90, 983, 579, 1070, 619}
m['头像位置']={{377,325,0xfaf3ab},{454,319,0x847d73},{529,319,0xf8f8f8},
	{600,319,0xfef9fc},{681,318,0xfffcfc},{757,318,0x881266},
	{376,393,0xacd6e7},{458,392,0xffe482},{524,396,0xfed535},}
-----------------------------tips--------------------------------------------
m['跳过对话']={{1045,31,0xcdbfd4},{1076,35,0xcfc0d6},{1113,38,0xbfb2c6},}
m['跳过剧情']={{1007,51,0xd0c1d7},{1031,51,0xd2c3d9},{1117,55,0xc2b4c8},{1098,55,0xa699aa},}
m['战斗画面']={{435,17,0xe3d3b3},{592,17,0xe39c38},{599,36,0xd77f1f},}
m['公告知道了']={{307,52,0x4b4b4b},{548,130,0xc8a7e7},{581,556,0xf1e76a},}
m['换人']={ 0xffffff, 90, 540, 532, 622, 610}
m['点击继续']={{475,540,0xfbb600},{581,524,0xffb900},{625,522,0xfdb800},{664,530,0xfeb800},}
m['下一关']={ 0x996314, "4|0|0xf2ebdc,19|0|0xf2ecde", 90, 851, 507, 974, 559}
m['合成英雄']={ 0xcbbbd4, "0|-3|0x482977,0|-13|0x412079", 90, 821, 249, 903, 290}
m['请喝一杯']={{53,12,0xffffff},{254,14,0xf5f1eb},{460,18,0xc76435},{458,549,0x986517},}
m['关外白酒']={{511,316,0xf8dc95},{744,299,0xf2d892},{970,320,0xf9dd96},{267,100,0xffe3ce},}
-------------------------------------------------------------------------------------
m['查询ID']={{52,11,0xf5f5f5},{460,18,0xc76435},{580,95,0xc7a6e6},{587,97,0x2f2930},}


function input(name)
	writePasteboard(name,0)
	delay(0.5)
	keyDown("RightGUI") 
	keyDown("v")
	keyUp("v")
	keyUp("RightGUI")
	delay(1)
end

function left()
	leftn = leftn or 0
	leftn = leftn + 1
	if leftn%5==0 then
		touchDown(1, 75,572)
		mSleep(1000)
	else
		touchDown(1, 350,572)
		mSleep(500)
		touchUp(1, 350,572)
		mSleep(200)
	end
end

function right()
	right_arr={{971,549,0x74706f},{1051,421,0xe6b0af},
		{946,409,0xab3333},{864,478,0xfffeff},{845,575,0x160303},{1088,549,0xe19184}}
	for i,v in ipairs(right_arr) do
		touchDown(2, v[1],v[2])
		mSleep(100)
		touchUp(2, v[1],v[2])
		mSleep(100)
	end
end

function fight()
	if done(m['战斗画面'],'战斗画面')then
		left()
		for i=1,3 do
			right()
		end
		c_p(m['换人'],'换人')
		return true
	end
end

function tips()
	if done(m['查询ID'],'查询ID')then
		writeFile(ok_path,getID())
		click(52,15)
		return true
	end
	if done(m['跳过对话'],'跳过对话')or done(m['跳过剧情'],'跳过剧情')then
		click(1045,31)
	elseif done(m['点击继续'],'点击继续')then
		click(m['点击继续'][1][1],m['点击继续'][1][2])
	elseif c_pic(m['下一关'],'下一关')then
	elseif c_pic(m['合成英雄'],'合成英雄')then
	elseif done(m['请喝一杯'],'请喝一杯')then
		click(m['请喝一杯'][1][1],m['请喝一杯'][1][2])
		click(462,545)
	elseif done(m['关外白酒'],'关外白酒')then
		click(515,518)
	else
		return true
	end
end

function event()
	if done(m['登录'],'登录')then
		click(m['登录'][2][1],m['登录'][2][2])	
	elseif done(m['免费注册'],'免费注册')then
		click(568,358)
	elseif done(m['用户名注册'],'用户名注册')or done(m['用户名注册2'],'用户名注册')then
		click(755,567)
	elseif done(m['注册帐号界面'],'注册帐号界面')then
		delay(2)
		if c_pic(m['请输入帐号'],'请输入帐号')then
			c_pic(m['帐号x'],'帐号x')
			account = RndLetter(8)
			input(account)
			nLog(account)
--				writePasteboard(account,0)
--				delay(1)
--				keyDown("RightGUI") 
--				keyDown("v")
--				keyUp("v")
--				keyUp("RightGUI")
			click(1022,127)
		end
		if c_pic(m['请输入密码'],'请输入密码')then
			password = RndLetter(8)
			input(password)
			click(1022,127)
		end
		if c_pic(m['确认'],'确认')then
			delay(3)
			if done(m['进入游戏'],'进入游戏')then
				writeFile(ok_path,account..'	'..password.."	")
			end
		end
	elseif done(m['进入游戏'],'进入游戏')then
		click(564,584)
	elseif done(m['创建角色'],'创建角色')then
		click(569,187)
		delay(2)
		for i=1,10 do
			touchDown(1, 1064,519)
			mSleep(20)
			touchUp(1, 1064,519)
		end
		name = '影之刃'..RndLetter(5)
		input(name)
		if c_pic(m.角色完成,'角色完成')then
			imeg = math.random(1,9)
			click(m['头像位置'][imeg][1],m['头像位置'][imeg][2])
			click(561,583)
			delay(5)
			writeFile(ok_path,name.."	"..account or "".."	"..password or "".."	"..getID())
		end
	elseif done(m['公告知道了'],'公告知道了')then
		click(563,584)
	else
		return true
	end
end



init(0,1)
while (true) do
	if active(game)then
		delay(10)
	end
	if fight()then
		other = 0
	else
		if tips()then
			if event()then
				other = other or 0
				other = other + 1
				if other>3 and other%3==0 then
					nLog("other")
					click(520,320)
				end	
			end
		end
	end
	mSleep(500)
end










