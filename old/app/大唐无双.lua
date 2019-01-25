require("TBackups")
require("tsp")
----------------------大唐无双----------
game = "com.netease.dtws"
safari_bid = "com.apple.mobilesafari"
mail = "/User/Media/TouchSprite/lua/大唐无双帐号.txt"
url = "http://gad.netease.com/mmad/click?s=c6ABwF4QS99UojMGS77ocKfhbJA%3D&project_id=12986038&monitor_type=4"
OK_path = "/User/Media/TouchSprite/lua/大唐无双帐号激活.txt"
awz_bid = 'AWZ'


account_list = readFile(mail)
do_n = 1
if file_exists(OK_path)then
	do_n = #(readFile(OK_path))
	if do_n > #account_list then
		dialog('任务完成', 0)
	end
end
function ID(do_n)
	aplist = split(account_list[do_n],"|")
	account = aplist[1]
	password = aplist[2]
end
--------------------------------------固定参数-------------------------
m={}
m.打开={ 0x0481fc, "-37|4|0x0080fc,10|-24|0x0080fc,53|6|0x0080fc", 90, 485, 260, 631, 598}
m['aswyj'] = {0xffffff, "0|-2|0x6f7179,31|4|0xffffff,31|1|0x6f7179", 90, 99, 600, 151, 630}
m['awz好'] = {{229,525,0x4bd763},}
---------------------------------------
m['登录界面']={{50,58,0xe57a48},{744,211,0xfeeeab},{565,513,0xe3b65a},}
m['网易帐号登录']={{808,356,0xd11f1e},{988,145,0x616161},}
m['输入界面']={{267,227,0xe60012},{202,169,0x616161},{988,145,0x616161},{50,60,0xdd6c3c},}
	m.邮箱帐号={ 0xc7c7c7, "10|6|0xffffff,12|14|0xc7c7c7,16|7|0xc7c7c7", 90, 446, 141, 689, 209}
	m.邮箱密码={ 0xc7c7c7, "11|17|0xc7c7c7,33|9|0xc7c7c7,46|11|0xcdcdcd", 90, 450, 232, 698, 303}
	m.登录={ 0x22b260, "22|-14|0xffffff", 90, 609, 327, 720, 381}
m['创建角色']={{1099,469,0xecd198},{1007,563,0xe3b65a},{36,583,0xc28339},}
m['结束条件']={{1055,9,0x6b5941},{507,490,0xe2cf87},{1126,15,0x746045},{1135,0,0x17131d},}
m['使用其它帐号登录']={{322,206,0xe60214},{463,311,0x22b260},{663,472,0x22b260},}
m['游戏中']={{159,43,0x1f9c2d},{1104,8,0xf2e3ce},{129,264,0xffe42d},}
m.切换帐号={ 0x00ac58, 90, 1002, 24, 1076, 47}

function reg()
	init("0",1)
	out_time = os.time()
	ID(do_n)
	while (true) do
		if active(game)then
			delay(30)
		end
		if done(m['登录界面'],'登录界面')then
			click(51,60)
			delay(2)
			c_p(m.切换帐号,'切换帐号')
			click(m['登录界面'][3][1],m['登录界面'][3][2])		
		elseif done(m['网易帐号登录'],'网易帐号登录')then
			click(m['网易帐号登录'][1][1],m['网易帐号登录'][1][2])
		elseif done(m['输入界面'],'输入界面')then
			if c_pic(m.邮箱帐号,'邮箱帐号')then
				input(account)
				delay(1)
				click(1052,171)
			end			
			if c_pic(m.邮箱密码,'邮箱密码')then
				input(password)
				input('\b')
				delay(1)
				click(1052,171)
			end
			c_pic(m.登录,'登录')
			delay(2)
			click(m['登录界面'][3][1],m['登录界面'][3][2])
		elseif done(m['创建角色'],'创建角色')then
			click(m['创建角色'][1][1],m['创建角色'][1][2])
			click(m['创建角色'][2][1],m['创建角色'][2][2])
		elseif done(m['结束条件'],'结束条件')or done(m['游戏中'],'游戏中')then
			writeFile(OK_path,"大唐无双	"..account..'	'..password)
			click(520,300)
			delay(10)
			closeApp(game)
			delay(2)
			do_n = do_n + 1
			return true
		elseif done(m['使用其它帐号登录'],'使用其它帐号登录')then
			click(m['使用其它帐号登录'][3][1],m['使用其它帐号登录'][3][2])
		end
		mSleep(500)
		if os.time()- out_time > 300 then
			return false
		end
	end
end


function jac(judgepage,clickicon,tags)
	tags = tags or 0 --内面内部部件，默认标签为1
	if tags ~= judgepage[clickicon].tag and judgepage[clickicon].tag ~= 0 then
		nLog("标签错误，请仔细核对")
		return false
	end
	for k,v in pairs(judgepage)do
		if v.tag ~= 0 then
		elseif isColor(v.Pixelpoint[1],v.Pixelpoint[2],v.Pixelpoint[3])~=true then
			return false
		end
	end

	if isColor(judgepage[clickicon].Pixelpoint[1],judgepage[clickicon].Pixelpoint[2],judgepage[clickicon].Pixelpoint[3])then
		nLog(clickicon)
		click(judgepage[clickicon].Pixelpoint[1],judgepage[clickicon].Pixelpoint[2])
		return true
	end
end


function awz()
	init('0',0);
	active(awz_bid)
	delay(2)
	if c_pic(m.aswyj,'aswyj')then
		outT = os.time()
		repeat
			mSleep(300)
			if os.time() - outT > 10 then 
				closeApp(frontAppBid())
				return false 
			end
		until done(m.awz好,'OK')
		return true
	end
end
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
function NewPhone()
	local appbk = appBackup({game,safari_bid},"/User/Media/TouchSprite/res/del.bak")
	local appdl = appDel({game,safari_bid})
	if appbk and appdl then
		dialog("一键新机成功", 3)
		return true
	else
		dialog("一键新机成功", 3)
	end
end
function safari(url)
	init('0',0)
	openURL(url)
	out_time = os.time()
	while os.time()-out_time <= 30 do
		if f_pic(m.打开,'打开')then
			delay(20+math.random(10,20))
			return true
		end
		mSleep(500)
	end
end








while (true) do
	close_VPN()
	if awz()then
		if VPN()then
			if safari(url)then
				reg()
			end
		end
	end
end
----------------------------循环主体---------------------------










	


