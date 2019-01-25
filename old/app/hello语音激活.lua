require '爱乐赞对接'
id = 20837
--ALZ()
--GET_Phone(id,token)
--getMessage(id,phone)
id_path = '/User/Media/TouchSprite/lua/hello语音.txt'
url = 'http://www.gevek.com/show/index/exhibition/id/8'
xin = {'赵','钱','孙','李','周','吴','郑','王','冯','陈','楮','卫','蒋','沈','韩','杨','朱','秦','尤',
'许','何','吕','施','张','孔','曹','严','华','金','魏','陶','姜','戚','谢','邹','喻','柏',
'水','窦','章','云','苏','潘','葛','奚','范','彭','郎','鲁','韦','昌','马','苗','凤','花',
'方','俞','任','袁','柳','酆','鲍','史','唐','滕','殷','罗','毕','郝','邬','安','常','乐',
'于','时','傅','皮','卞','齐','康','伍','余','元','卜','顾','孟','平','黄','和','穆','萧',
'尹','姚','邵','湛','汪','祁','毛','禹','狄','米','贝','明','臧','计','伏','成','戴','谈',
'宋','茅','庞','熊','纪','舒','屈','项','祝','董','梁','杜','阮','蓝','闽','席','季','麻',
'强','贾','路','娄','危','江','童','颜','郭','梅','盛','林','刁','锺','徐','丘','骆','高',
'夏','蔡','田','樊','胡','凌','霍','虞','万','支','柯','昝','管','卢','莫','经','房','裘',
'缪','干','解','应','宗','丁','宣','贲','邓','郁','单','杭','洪','包','诸','左','石','崔',
'吉','钮','龚','程','嵇','邢','滑','裴','陆','荣','翁','荀','羊','於','惠','甄','麹','家',
'封','芮','羿','储','靳','汲','邴','糜','松','井','段','富','巫','乌','焦','巴','弓','牧',
'隗','山','谷','车','侯','宓','蓬','全','郗','班','仰','秋','仲','伊','宫','宁','仇','栾',
'暴','甘','斜','厉','戎','祖','武','符','刘','景','詹','束','龙','叶','幸','司','韶','郜',
'黎','蓟','薄','印','宿','白','怀','蒲','邰','从','鄂','索','咸','籍','赖','卓','蔺','屠',
'蒙','池','乔','阴','郁','胥','能','苍','双','闻','莘','党','翟','谭','贡','劳','逄','姬',
'申','扶','堵','冉','宰','郦','雍','郤','璩','桑','桂','濮','牛','寿','通','边','扈','燕',
'冀','郏','浦','尚','农','温','别','庄','晏','柴','瞿','阎','充','慕','连','茹','习','宦',
'艾','鱼','容','向','古','易','慎','戈','廖','庾','终','暨','居','衡','步','都','耿','满',
'弘','匡','国','文','寇','广','禄','阙','东','欧','殳','沃','利','蔚','越','夔','隆','师',
'巩','厍','聂','晁','勾','敖','融','冷','訾','辛','阚','那','简','饶','空','曾','毋','沙',
'乜','养','鞠','须','丰','巢','关','蒯','相','查','后','荆','红','游','竺','权','逑','盖',
'益','桓','公','万俟','司马','上官','欧阳','夏侯','诸葛','闻人','东方'}
function name()
	math.randomseed(tostring(os.time()):reverse())
	local ming=function() 
		return string.char(math.random(0xe5,0xe8))..string.char(math.random(0x80,0xbf))..string.char(math.random(0x80,0xbf))
	end
	local ming1=function() 
		return string.char(math.random(0xe5,0xe8))..string.char(math.random(0x80,0xbf))..string.char(math.random(0x80,0xbf))
	end
	return ming()..ming1()
end

app_bid = {
	['VPN'] = "com.apple.Preferences",
	['IG'] = "com.unkn0wn.igvx",
	['007'] = "com.007gaiji.007gaiji",
	['NZT'] = "NZT",
	['awz'] = 'AWZ',
	['adsge'] = "mx-2205554765",
	['突击前线'] = "com.appspot.battlefront",
	['天涯悦读'] = "com.appspot.cabin006",
	['qq'] = "com.tencent.mqq",
	['sd'] = 'com.nineyou.sdec',
	['safari'] = 'com.apple.mobilesafari',
	APP='com.yy.hello',
}
m = {
	['设置']={	{307,83,0x000000},	{307,81,0xf7f7f7},	{307,70,0x000000},	{338,71,0x000000},},
	['正在连接']={ 0x000000, "8|0|0xffffff,11|0|0x000000,19|0|0xffffff", 90, 332, 600, 363, 607},
	['x'] ={0xffffff, "8|9|0xffffff,0|5|0x000000,-6|9|0xffffff", 90, 588, 29, 612, 51},
	开={0xffffff, "-26|1|0xc8c8c8,4|-29|0xe0e0e0,4|29|0xa1a1a1", 90, 447, 475, 630, 675},
	['关']={0xffffff, "27|0|0x40b754,0|-28|0x45c55b,-1|29|0x359846,-65|3|0x4cd964", 90, 447, 475, 630, 675},
	后退={0x007aff, "-15|16|0x007aff,1|36|0x007aff,-20|16|0x0a80ff", 90, 4, 46, 123, 126},
	好={0x007aff, "12|0|0xf7f7f7", 99, 267, 646, 379, 743},
	好2={ 0x007aff, "14|7|0x007aff", 90, 300, 669, 329, 702},
	['007']={	{83,277,0x4198ff},	{143,278,0x4198ff},	{209,278,0x4198ff},	{476,277,0x4198ff},},
		['aswyj'] = {0xffffff, "0|-2|0x6f7179,31|4|0xffffff,31|1|0x6f7179", 90, 99, 600, 151, 630},
	['awz好'] = {{229,525,0x4bd763},},
	-------------------------------------------------------game------------------------------
	一键新机={ 0xffffff, "1|6|0x45cd23", 90, 222, 403, 398, 463},
	一键恢复={ 0x4198ff, "11|1|0x4198ff", 90, 242, 502, 272, 520},
	搜索={  0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xf1f8ff, "5|5|0x007aff", 90, 549, 1065, 619, 1116},
	下载 = { 0xffffff, "-3|0|0x8bcb4b,10|-11|0x8bcb4b,25|7|0x8bcb4b,32|6|0xffffff", 90, 128, 792, 509, 879},
	APP={ 0x050c68, "2|1|0xfffffa,5|-5|0xe5effa,39|-7|0xe3f1fe,2|52|0xe3edfa", 90, 14, 142, 246, 365},
	-------------------------AppStore----------------------------------------------------------
}
m['第一屏']={{318,184,0xbdd594},{271,1076,0xffffff},}
m['第二屏']={{355,393,0xf6e35e},{303,1076,0xffffff},}
m['第三屏']={{386,304,0xffeda2},{335,1077,0xffffff},}
m['马上体验']={{369,101,0xb6c192},{368,1075,0xffffff},{345,991,0xffffff},}
m['登录界面']={{343,260,0x362470},{325,249,0xffffff},{309,246,0x33226d},{341,233,0x30216b},{400,78,0xffffff},}
m['注册一'] ={{448,294,0xffffff},{345,74,0x602d7b},{355,81,0xffffff},{62,83,0xda49ae},}
m.手机号码 = { 0xc7c7cd, "22|-5|0xc7c7cd,30|-1|0xc7c7cd,36|-6|0xffffff,70|2|0xc7c7cd", 90, 175, 500, 343, 544}
m.设置密码 = { 0xc7c7cd, "33|-1|0xcacad0,35|0|0xffffff,37|0|0xc7c7cd,100|0|0xc7c7cd", 90, 54, 590, 190, 633}
--324,586--空白
m.下一步 = { 0x00d552, "11|0|0x00d552,24|-1|0x00d552", 90, 270, 685, 373, 727}
m['验证码界面']={{61,83,0xda49ae},{276,83,0xffffff},{364,71,0x602d7b},{368,69,0xffffff},{412,69,0xffffff},}
m.发送 = {0x02cf53, "4|-5|0x47256b,6|-5|0x00d552,11|0|0x04ca53", 90, 432, 275, 511, 318}
------------------------注册完成---------------
m['个人资料']={{260,81,0xffffff},{262,81,0x5f2d7a},{300,71,0xffffff},{301,76,0x5f2d7b},{368,79,0xffffff},{368,77,0x5f2d7b},}
m['男女']={{116,262,0xe7e7e7},{524,264,0x4a266d},}
m['求真相']={{292,258,0x9d9d9d},{300,245,0x9d9d9d},{307,241,0xffffff},{352,216,0x9d9d9d},{359,214,0x828282},}
m.相册中选择 = { 0x017af5, "1|-4|0xf4f3f5,6|-6|0x017af5", 90, 212, 857, 431, 910}
--321,571 相册位置
m['电脑导入图片']={{102,78,0x007aff},{187,78,0x050505},{417,72,0x000000},{443,97,0x000000},}
m.昵称 = { 0xc7c7cd, "5|-3|0xffffff,7|-3|0xc7c7cd,35|1|0xc7c7cd", 90, 283, 413, 359, 455}
m.完成 = {0x007aff, "3|0|0xffffff", 90, 522, 1069, 599, 1112}
m.年龄 = { 0xc7c7cd, "1|2|0xffffff,23|1|0xc7c7cd,31|12|0xccccd2", 90, 281, 505, 356, 544}
m.完成注册 = { 0x00d552, "5|2|0x371f60,6|5|0x00d552", 90, 279, 591, 359, 637}
m.知道了 = { 0x007aff, "4|-2|0xe4e4e6,26|0|0x007aff,55|3|0x017bff", 90, 264, 637, 372, 685}
m['最新上线']={{259,66,0xffffff},{263,68,0x25123a},{309,78,0xf1eef4},{335,82,0x3f2170},{354,95,0xffffff},}
m.相册完成 = { 0x007aff, "-2|3|0x261a67,0|7|0x007aff", 90, 553, 63, 630, 106}
---------------------------------
m.备份记录 = { 0xffffff, "14|-4|0x6f7179,24|2|0x6f7179,30|1|0xffffff", 90, 94, 688, 231, 738}
m['下一条']={ 0x007aff, "-37|6|0x007aff,32|8|0x007aff", 90, 513, 56, 630, 111}
function reg()
	init('0',0)
	outT = os.time()
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		if done(m.个人资料,'个人资料')then
			closeApp(frontAppBid())
			return false
		elseif done(m.最新上线,'最新上线')then
			last_ok = last_ok or 0
			last_ok = last_ok + 1
			if last_ok >= 3 then
				last_ok =0
				closeApp(frontAppBid())
				return true
			end
			top={{106,164,0x212028},{317,161,0x212028},{532,165,0x212028},}
			ck = math.random(1,3)
			click(top[ck][1],top[ck][2])
			movexy(286,912,285,765)
			delay(15)
		else
			c_pic(m.知道了,'知道了')
		end
		delay(1)
		if os.time() - outT > 60 then
			closeApp(frontAppBid())
			delay(2)
			return true
		end
	end
end
function awz()
	init('0',0);
	active(app_bid['awz'])
	delay(2)
	if c_pic(m.下一条,'下一条')then
		delay(10)
		click(77,84)
		return true
	elseif c_pic(m.备份记录,'备份记录')then
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
function VPNclose()
	init(0,0);
	while (true) do
		active(app_bid['VPN'])
		setp = setp or 0
		if setp == 0 then
			if done(m.设置,95)then
				if c_pic(m.关,"关VPN")then
					delay(1)
				elseif f_pic(m.开,'开VPN')then
					return true
				end
			end
		end
	end
end
function OO7()
	init('0',0);
	active(app_bid['007'])
	delay(2)
	if c_pic(m.一键新机,'一键新机')then
		outT = os.time()
		repeat
			mSleep(300)
			if os.time() - outT > 10 then return false end
		until f_pic(m.一键恢复,'一键恢复')
		return true
	end
end
function seven_007()
	if active(app_bid['007'])then
		out_time = os.time()
		repeat
			log("等待PK188界面")
			delay(0.5)
			if os.time() - out_time > 5 then return false end
		until done(m['007'],95)
		if clickpic( 0xf9fafa, "-1|0|0x4198ff,101|-6|0x4198ff,96|-2|0xffffff,94|0|0x4198ff", 90, 65, 244, 598, 315)then
			log("一键新机")
			out_time = os.time()
			repeat
				log("等待一键新机")
				delay(0.5)
				if f_p({0xff0000,90, 192, 337,445, 374},"红色ip")then break end
				if os.time() - out_time > 8 then return false end
			until findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")
		end
		if f_p({0xff0000,90, 192, 337,445, 374},"红色ip") then
			return true
		elseif findpic( 0x000000, "3|0|0xffffff,-6|0|0xffffff", 90, 203, 343, 438, 368,"发现ip")then
			red_ip = 0
			return true
		end
	else
		closeApp(app_bid['007'])
	end
end

while (true) do
	close_VPN()
	if awz() then
		if VPN()then
			reg()
		end
	end
end