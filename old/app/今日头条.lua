require 'tsp'
id_path = '/User/Media/TouchSprite/lua/今日头条.txt'
tast_file = '/User/Media/TouchSprite/lua/'..os.date("%Y-%B-%d-")..'今日头条-tast.txt'
url = 'http://global.ymtracking.com/trace?offer_id=1103505&aff_id=100980&aff_sub8=1_1'

app_bid = {
	['awz'] = 'AWZ',
	['safari'] = 'com.apple.mobilesafari',
	APP='com.ss.iphone.article.News',
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
	awz红= { 0xff0000, "3|0|0xffffff", 90, 32, 644, 295, 683},
	-------------------------------------------------------game------------------------------
	搜索={ 0x8f8f90, "0|9|0xe6e6e8,0|20|0x8d8f90,15|24|0x8f8f90", 90, 132, 52, 181, 102 },
	前往={ 0xffffff, "0|3|0x007aff,7|7|0x007aff,5|9|0xffffff,-6|19|0x007aff,-8|21|0xffffff", 90, 546, 1062, 623, 1118},
	下载 = { 0xffffff, "-3|0|0x8bcb4b,10|-11|0x8bcb4b,25|7|0x8bcb4b,32|6|0xffffff", 90, 128, 792, 509, 879},
	APP ={{85,224,0xfe0000},{101,233,0xffffff},{127,227,0xfe0000},{172,228,0xfd0006},{167,242,0xffffff},}
	-------------------------AppStore---------------------------------------------------------
	
}
--游戏注册区域


------------------------------------------------------------
m.seven = {{209,181,0x45cd23},{266,195,0x45cd23},{396,181,0x45cd23},{449,182,0x45cd23},}
m.红ip = { 0xff0000, 90, 200, 341, 441, 374}
m.黑ip = { 0x000000, 90, 200, 341, 441, 374}
m['新机']={{172,438,0x45cd23},{233,436,0x45cd23},{372,435,0x45cd23},{422,436,0x45cd23},}
m.红={ 0xff0000, 90, 205, 366, 442, 376}
m.黑={ 0x000000, 90, 205, 366, 442, 376}

function reg()
	init('0',0)
	outT = os.time()
	timess = math.random(3,5)
	outtimes = math.random(60,180)
	xxx = 0
	while (true) do
		if active(app_bid.APP)then
			delay(3)
		end
		delay(1)
		if xxx == 0 and c_pic(m.x,'x')then
			xxx = 1
		end
		click_time = click_time or 0
		if os.time() - click_time >= timess then
			k = math.random(1,2)
			click(m.meun[k][1],m.meun[k][2])
			delay(3)
			movexy(329,873,327,558)
			delay(4)
			click(305,823)
			delay(4)
			click(45,84)
			click_time = os.time()
		end
		delay(2)
		if os.time()-outT >= outtimes then
			closeApp(frontAppBid())
			return true
		end
		log('今日头条')
		log(outtimes)
	end
end

function awz()
	init('0',0);
	active(app_bid['awz'])
	delay(2)
	if c_pic(m.aswyj,'aswyj')then
		outT = os.time()
		while (true) do
			if f_pic(m.awz红,'OK')then
				return true
			end
			if os.time() - outT > 10 then
				return false 
			end
		end
	end
end
function OO7()
	init('0',0);
	setp_07 = 0
	outTime = os.time()
	while (true) do
		active(app_bid['007'])
		if setp_07 == 0 and done(m.新机,'新机')then
			setp_07 = 1
		elseif setp_07 == 1 then
			if done(m.新机,'新机')then
				click(323,436)
				setp_07 = 2
			end
		elseif setp_07 == 2 then
			if f_p(m.黑,'黑')or f_p(m.红,'红')then
				return true
			end
		end
		delay(0.5)
		if os.time() - outTime > 10 then
			closeApp(frontAppBid())
			return false
		end
	end
end
function haoi23()
	init('0',1);
	ocrInfo("haoi23","ouwen000","ouwen000|3A16D996BA0C00B7")
	local text,tid = ocrScreen(645,255,790,310,3004,20,1)
	if text == nil then
		dialog('识别错误', 3)
		delay(1)
		click(720,283)
		delay(3)
		haoi23()
	else
		return text
	end
end

function safari(url)
	init('0',0)
	outT = os.time()
	active(app_bid.safari)
	while (true) do
		if c_pic(m.搜索,'top搜索')then
			nLog(url)
			input(url)
			c_pic(m.前往,'前往')
		elseif done(m.APP,'今日头条')then
			delay(math.random(8,15))
			return true
		end
		if os.time()- outT > 60 then 
			return false 
		end
	end
end
--safari(url)
--lua_exit()
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

if file_exists(tast_file) then
	tast = tonumber(readFile(tast_file)[1])
	toast('已经完成~'..tast,2)
else
	tast = 0
end
tast_end = 500
while (true) do
	day_os = day_os or os.date("%Y-%B-%d-")
	if day_os ~= os.date("%Y-%B-%d-") then
		day_os = os.date("%Y-%B-%d-")
		tast = 0
	end
	work_time_h = tonumber(os.date("%H"))
	if tast <= tast_end then
		if work_time_h >= 10 and work_time_h <= 19 then
			close_VPN()
			if awz() then
				if VPN()then
					if safari(url)then
						if reg()then
							tast = tast + 1
							writeFile(tast_file,tast,'w')
						end
					end
				end
			end
		else
			toast("非指定时间,暂不工作")
			delay(3)
		end
	else
		toast("今日完成:"..tast_end.."次",3)
		delay(3)
	end
end
