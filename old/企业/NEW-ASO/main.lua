
require("TSLib")
require("tsp")
require("Api")

-----加截完成----------------------------------------
init("0",0)
AppStore = 'com.apple.AppStore'
vpnkey = true
----------------------------------------系统参数---------------------------------
m = {}
--------------------------------全局参数-----------------------------------------------
m['灰']={{397,17,0x939394},{415,17,0x939394},}
--------------------------------登录判断区域-------------------------------------------------
m['iTunes与App']={{138,86,0x000000},{149,76,0xf6f6f8},{160,74,0x000000},{481,82,0xf6f6f7},{483,80,0x000000},{535,87,0x070707},{540,88,0xf6f6f8},}
m['iTunes与App_ios9_0']={{354,73,0x000000},{366,76,0xf6f6f8},{374,78,0x000000},{541,87,0x070707},{541,90,0xf6f6f8},}
m.正在登录 = { 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496}
m.登录灰={ 0x8f8f8f, "0|2|0xffffff,8|6|0xffffff,8|8|0x8f8f8f,12|15|0xffffff,14|17|0x8f8f8f", 90, 11, 205, 110, 275}
m.AppleID = { 0x007aff, "4|0|0xffffff,8|0|0x007aff", 90, 128, 237, 142, 245}
m.登录={ 0x007aff, "17|1|0x007aff", 90, 22, 219, 65, 265}
m.密码={ 0xc7c7cd, "16|-5|0xc7c7cd,29|-5|0xd0d0d6", 90, 86, 333, 151, 400}
m.登录按钮={ 0x007aff, "17|-7|0xf9f9fa,37|-2|0x007aff", 90, 407, 409, 505, 473}
m.正在登录={ 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496} --弹窗登录灰色
m.注销 = { 0x007aff, "13|4|0xf5f5f5,20|1|0x007aff,28|-4|0x007aff", 90, 272, 572, 367, 649}
---------------------------------APP搜索区域-------------------------------------------------
m['搜索']={ 0x929292, "2|2|0x929292", 90, 438, 1065, 477, 1105}
m.搜索blue= { 0x007aff, "0|4|0x007aff", 90, 423, 1107, 469, 1135}
m['top-搜索']={ 0x8e8e93, "5|-1|0xe3e4e6,18|-1|0x909096", 95, 259, 65, 307, 107}
m['空格']={ 0x000000, "8|10|0x000000", 90, 244, 1062, 366, 1119}
m['搜']={ 0xffffff, "2|0|0x007aff", 90, 515, 1065, 603, 1112}
m['热门搜索']={{322,225,0xffffff},{323,225,0x090909},{357,234,0x000000},{383,225,0xffffff},{385,227,0x000000},{400,220,0x000000},{400,229,0xffffff},}
m.有结果={ 0x0080fc, "-26|-21|0x0080fc,-31|28|0x0080fc", 90, 473, 155, 639, 1037}
m.结果云={ 0x0080fc, "0|-1|0xffffff,-5|14|0x808080,6|14|0x7f7f7f", 90, 528, 162, 630, 306}
m.在搜索界面 = { 0x8e8e93, "-7|9|0x8e8e93,8|9|0x8e8e93,1|10|0xe4e5e7,0|16|0x8e8e93", 90, 572, 63, 617, 107}
m.AppPage={ 0x007aff, "-17|16|0x007aff,0|15|0xf9f9f9,1|32|0x007aff", 90, 8, 52, 50, 113}
m.有应用={ 0x0080fc, 90, 469, 175, 630, 450}
m.有应用图版 = { 0x0080fc, "28|23|0x0080fc,-15|50|0x0080fc", 90, 509, 129, 615, 1019}
---------------------------------下载区域----------------------------------------------------
m.获取={ 0x0080fc, "-57|-1|0x0080fc,33|1|0x0080fc", 90, 497, 279, 623, 419}
m.安装={ 0x19ab20, "-22|-17|0x19ab20,-12|33|0x19ab20", 90, 498, 285, 622, 465}
m.打开={ 0x0080fc, "5|-3|0xffffff,27|-3|0x0080fc,-24|-1|0x0080fc,-35|0|0xffffff,-62|0|0x0080fc", 90, 490, 228, 630, 510}
m.正在下载={ 0x0080fc, "-1|0|0xffffff,15|15|0x0080fc,16|16|0xffffff,7|-18|0x0080fc,8|33|0x0080fc", 90, 511, 256, 632, 498}
m.正在转圈 = {  0x188dfd, 90, 509, 256, 633, 553}
m.云={ 0x0080fc, "0|27|0x0080fc,-5|14|0x808080,-1|14|0xffffff,6|14|0x7f7f7f", 90, 497, 279, 623, 519}
---------------------------------弹窗提示----------------------------------------------------
m.登录iTunes={ 0x070707, "-27|-9|0x000000,-27|8|0x000000,-58|-13|0x000000,-61|-7|0x000000,-80|-10|0x000000", 90, 368, 205, 461, 254}
m.十五分需要={ 0x040404, "0|1|0xf8f8f8,10|-8|0x000000,34|-1|0x000000,35|2|0xf8f8f8,31|4|0x000000", 90, 489, 440, 562, 485}
m.不再另外收费={ 0x000000, "-6|5|0x000000,0|29|0x000000,43|18|0x000000,53|4|0x000000,28|4|0x000000", 90, 436, 525, 513, 570}
m.无法连接到={ 0x000000, "3|1|0xf8f8f9,21|2|0x000000,76|12|0xf8f8f9,80|15|0x070707,131|8|0x000000,188|12|0xf9f9f9", 90, 303, 500, 512, 544}
m.验证失败={ 0x000000, "12|-4|0xf9f9f9,21|0|0x000000,24|7|0x010101,31|-6|0x000000,36|-3|0xf9f9f9,36|-1|0x000000", 90, 319, 475, 390, 519}
m.保存密码={ 0x000000, "27|0|0x000000,13|18|0x060606,43|9|0x000000,57|20|0x000000,46|20|0x000000", 90, 415, 460, 494, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m.购买过了={ 0x000000, "9|-4|0xf9f9f9,26|-4|0x000000,30|12|0x000000,35|16|0xf9f9f9,38|15|0x000000", 90, 436, 524, 508, 565}
m.无法下载项目={ 0x000000, "0|7|0xefefee,0|8|0x020202,-3|28|0x000000,17|23|0xefede9,18|28|0x010101", 80, 388, 481, 422, 519}
m.免费项目={ 0xf8f8f9, "3|-3|0x000000,8|-3|0xf8f8f9,9|-4|0x090909,49|18|0x000000,49|16|0xf7f7f9", 90, 411, 458, 515, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m['需要验证']={{385,470,0x000000},{380,473,0xf8f8f8},{486,674,0x007aff},{165,683,0x007aff},}
m.验证ID={0x000000, "36|0|0x000000,54|0|0x000000,53|26|0x000000,196|15|0x000000", 90, 205, 434, 433, 518}
m.帐户设置={{259,69,0x000000},{259,100,0xf6f6f8},{291,72,0x060606},{316,83,0xf6f6f7},{349,83,0x000000},{380,82,0x000000},}
m.帐户设置完成={ 0x007aff, "0|-3|0xf6f6f8,0|-5|0x067dff", 90, 562, 75, 612, 95}
m['unbale']={{91,444,0x0a0a0a},{371,444,0x000000},{546,460,0x000000},{326,697,0x007aff},{299,697,0x007aff},}
m['未过检']={{321,446,0x262626},{353,451,0x000000},{353,449,0xf9f9f9},{368,451,0x000000},{369,459,0x090909},}
m['超100m']={0x000000, "5|0|0xefefef,8|-6|0x191919,22|22|0x000000,267|-3|0x0b0b0b,266|-3|0xececec", 90, 161, 413, 477, 499}
m.蓝色提示={ 0x007aff, "0|7|0x007aff", 90, 138, 617, 477, 686}
m.蓝色提示2={ 0x007aff, "1|-3|0xf1f2f3", 90, 86, 400, 550, 751}
---------------------------------帐号处理区域------------------------------------------------
m.锁定={ 0x000000, "16|11|0x000000,50|10|0xf9f9f9,53|7|0x060606,84|17|0x000000,88|26|0x000000", 90, 333, 458, 452, 513}
m.禁用={ 0x000000, "-2|3|0xf9f9f9,15|0|0x000000,12|13|0x000000,12|15|0xf9f9f9,15|17|0x000000", 90, 368, 463, 410, 502}
m['停用']={{475,510,0x000000},{326,628,0x007aff},{315,512,0x0a0a0a},}
---------------------------------修改协议----------------------------------------------------
m.立即下载={ 0x000000, "17|-18|0xf3f3f4,28|-21|0x000000,52|-25|0x000000,54|3|0x000000,111|3|0x000000,131|-19|0x000000", 80, 239, 445, 390, 524}
m.协议更改={ 0x000000, "21|3|0xf9f9f9,23|1|0x000000,20|26|0x000000,59|5|0x000000,59|3|0xf9f9f9,61|1|0x000000", 90, 486, 441, 561, 486}
m['协议iTunesStore']={{224,84,0x000000},{235,76,0xf7f7f7},{237,75,0x000000},{356,78,0x000000},{417,87,0x070707},{417,88,0xf7f7f7},}
m.协议同意={ 0x007aff, "20|-2|0x007aff,29|0|0xf7f7f7,31|6|0x007aff", 90, 549, 1069, 626, 1113}
m.协议弹窗同意={ 0x007aff, "23|-5|0xf9f9f9,25|-7|0x007aff,9|6|0x007aff,9|7|0xf9f9f9,56|3|0x007aff", 90, 413, 625, 494, 671}
m.协议完成={ 0x007aff, "0|5|0x007aff,6|12|0x007aff,51|1|0x007aff", 90, 547, 60, 627, 109}
---------------------------------协议修改--END-----------------------------------------------
m.评论={ 0x848484, "13|0|0x848484,34|-2|0x848484,38|9|0x848484", 90, 237, 368, 398, 555}
m.评论激活={ 0x848484, "160|4|0x848484,64|-18|0x848484,72|27|0x848484", 90, 230, 351, 407, 535}
m.五星灰={ 0x848484, "21|0|0x848484,41|0|0x848484,61|0|0x848484,80|0|0x848484", 90, 10, 617, 133, 1031}
m.撰写评论={ 0x0080fc, "21|-1|0x0080fc,46|9|0x0080fc,81|10|0x0080fc,113|11|0x0080fc", 90, 87, 471, 231, 1037}
m['撰写评论界面']={{258,86,0x000000},{311,84,0x000000},{343,86,0x000000},{380,97,0x000000},}
m.评论发送={ 0x007aff, "4|-5|0x007aff", 90, 565, 77, 622, 100}
m.创建昵称={ 0xc7c7cd, "21|-1|0xc7c7cd", 100, 239, 236, 316, 283}
m.评论标题={ 0xc7c7cd, "22|4|0xc7c7cd,39|-6|0xffffff,41|-3|0xc7c7cd", 98, 44, 248, 98, 277}
m.评论标题2={ 0xc7c7cd, "-1|-8|0xc7c7cd", 100, 62, 339, 98, 364}
m.评论内容={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
m['评论完成'] = {{566,74,0x007aff},{573,72,0xf9f9f9},{574,72,0x007aff},{570,82,0xf9f9f9},{569,82,0x007aff},}

-------------------------------评论部分--------------------------------------------
function beforeUserExit()
	closeX()
    close_VPN()
end

function Comment(title,content,user_name)
	outTime = os.time()
	setp = 1
	while os.time()-outTime < 60 * 3 do
		if setp == 1 then
			if f_pic(m.评论激活,"评论激活")then
				if f_pic(m.撰写评论,'撰写评论') then
					setp = 2
				end
			elseif f_pic(m.五星灰,'五星灰')and f_pic(m.评论激活,"评论激活") then
				moveUp(314,841,318,746)
			elseif c_pic(m.评论,'点击评论')then
			end
		elseif setp == 2 then
			if f_pic(m.评论发送,'评论发送')then
				setp = 3
			elseif c_pic(m.撰写评论,'撰写评论') then
			end
			
			nikename_do = true
			title_do = true
			content_do = true
			send_do = true
			
		elseif setp == 3 then
			if f_pic(m.评论激活,"评论激活") and f_pic(m.撰写评论,'撰写评论')then
				nLog('评论发送成功')
				return true
			elseif isColor(459,159,0xb2b2b2)then  ---判断5星 为灰色则点击
				click(459,159)
			elseif nikename_do and c_pic(m.创建昵称,'创建昵称')then
				--toast(user_name,1)
				input(user_name)
				nikename_do = false
			elseif title_do and c_pic(m.评论标题,'标题')or c_pic(m.评论标题2,'标题') then
				--toast(title,1)
				input(title)
				title_do = false
			elseif content_do and c_pic(m.评论内容,'评论内容')then
				--toast(content,1)
				input(content)
				c_pic(m['空格'],'空格')
				content_do = false
			elseif send_do and c_pic(m.评论发送,'评论发送')then
				send_do = false
			end
		end
		mSleep(1000)
		other()
	end
	return false
end
--Comment("麻将游戏,我最喜欢了","闲来无事的事情打打,相当的有意思呢")

function moveUp(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(30)
	for i = 0, math.abs(y1 - y2), 15 do
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
	mSleep(100)
end

function Rond()
	if f_pic(m.获取,'获取') then
	
		getlun = getlun or 0
		getlun = getlun + 1
		
		if getlun > 60 then
			getApp = true
			installApp = true
			getlun = 0
		end
		
	elseif f_pic(m.安装,'安装')then
	elseif f_p(m.正在转圈,"检测是否转圈")then
		if f_p({0xffffff,90,x+25,y,x+26,y+1},'中心白')then
			Ring = 1
			if f_p({0xffffff,90,x+23,y-26,x+25,y-24},'上蓝')then
				Ring = Ring + 1
			end
			if f_p({0xffffff,90,x+49,y-1,x+51,y+1},'右蓝')then
				Ring = Ring + 1
			end
			if f_p({0xffffff,90,x+23,y+24,x+26,y+26},'下蓝')then
				Ring = Ring + 1
			end
			if Ring >= 3 then
				return true
			end
		end
	end
end
function close_VPN()
	setVPNEnable(false)
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

function other()
	if done(m.灰,'有弹窗-进入错误处理')then
		delay(0.5)
		if f_pic(m.登录iTunes,'需要密码')then             	--ok
			search_setp = search_setp or 1
			if search_setp == 4 or setp == 3 then
				input(password)
				click(457,505)
			else
				click(177,488)		--不在购买页面时和评论时 取消输入密码
			end
			waitTimes = os.time() -----------------输入密码
		elseif f_pic(m.十五分需要,'十五分需要')then       	--ok
			click(478,692)
		elseif f_pic(m.保存密码,'保存密码')then				--OK
			click(185,669)
		elseif f_pic(m.无法连接到,'无法连接到')then			--ok
			click(325,628)
			return true
		elseif f_pic(m.立即下载,'立即下载')then				--ok
			click(321,668)
		elseif f_pic(m.不再另外收费,'不再另外收费')then		--ok
			click(322,650)
		elseif done(m.未过检,"未过检")then					--未定
			click(198,685)
			errorAccount("未过检",0)
			return true
		elseif f_pic(m.验证失败,'验证失败')then      			--ok

				click(165,652)

		elseif f_pic(m.无法下载项目,'无法下载项目')then		--ok
			click(191,651)
		elseif f_pic(m.自动下载,'自动下载')then				--暂未设置
			click(178,684)
		elseif f_pic(m.协议更改,'协议更改')then				--ok
			click(461,691)
		elseif c_pic(m.协议弹窗同意,'协议弹窗同意')then		--ok
		elseif done(m['需要验证'],'需要验证')then				--ok
			click(446,665)
		elseif c_pic(m['超100m'],'超100m')then
			click(455,683)
		----------------------------------------帐号封号处理-------------------------------------
		elseif f_pic(m.锁定,'锁定')then						--ok
			click(450,667)
			errorAccount('锁定',3)
			return true
		elseif f_pic(m.禁用,'禁用')then						--ok
			click(180,663)
			errorAccount('禁用',2)
			return true
		elseif done(m.停用,'停用')then						--ok
			click(327,632)
			errorAccount('停用',4)
			return true
		elseif f_pic(m.验证ID,'验证ID')then
			click(450,667)
			errorAccount('锁定',3)
			return true
		elseif done(m.unbale,'unbale')then
			click(299,697)
		----------------------------------------帐号封号处理-------------------------------------
		elseif c_pic(m.蓝色提示,'蓝色提示')then				--待定
		elseif login_setp ~= 2 and c_pic(m.蓝色提示2,'蓝色提示2')then			--确定
------------------------------------帐号处理问题------------------------
		end
	else
		if done(m.协议iTunesStore,'协议iTunesStore')then
			c_pic(m.协议同意,'协议同意')
			c_pic(m.协议完成,'协议完成')
		elseif done(m.帐户设置,'帐户设置')then
			c_pic(m.帐户设置完成,'帐户设置完成')
		end
	end
end

function login()
	login_arr = {'启动设置','准备登录','查询网络','获取帐号','登录帐号'}
	login_setp = 1
	logout = 0
	out_time = os.time()
	open_one = true
	while (true) do
		if login_setp == 1 then
			if done(m.iTunes与App,'iTunes与App')or done(m['iTunes与App_ios9_0'],'iTunes与App')then
				login_setp = 2
			elseif open_one then
				openURL("prefs:root=STORE"); --打开登录界面
				toast('打开登录界面',1)
				delay(5)
				open_one = false
			--elseif frontAppBid() = 'com.apple.Preferences' then
			end
		elseif login_setp == 2 then
			if logout == 0 and c_pic(m.AppleID,'已经登录')then
				logout = 1
			elseif f_pic(m.AppleID,'已经登录')then
				login_arr[2]='待注销帐号'
				delay(3)
			elseif f_pic(m.登录,'找到登录')then
				login_setp = 3
			elseif done(m.灰,'注销弹窗')and c_pic(m.注销,'注销')then
				login_arr[2]='注销帐号'
				delay(5)
			end
			close_VPN()
		elseif login_setp == 3 then
			if vpnkey or VPN()then
				if getNetTime()> 0 then
					login_setp = 5
				else
					toast('NO internet')
					delay(3)
				end
			end
		elseif login_setp == 5 then
			if f_pic(m.AppleID,'登录成功')then
				toast('登录成功',1)
				return true

			elseif c_pic(m.登录,'登录')then
				delay(3)
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(account)
				click(597,1095) --点击换行
				input(password)
				click(597,1095) --点击登录
				if c_pic(m.登录按钮,'登录按钮')then
					mSleep(1000*5)	--给5秒反应时间
				end
			elseif f_pic(m.密码,'密码')then
				click(165,437) --点击取消,由输入错误
			elseif f_pic(m.登录灰,'登录灰')or f_pic(m.正在登录,'正在登录,弹窗灰')then
				toast('正在登录',1)
				delay(3)
			end			
		end
		sotp = sotp or 0
		if sotp ~= login_setp then
			sotp = login_setp
			waitTimes = os.time()
		elseif sotp == login_setp then
			if os.time() - waitTimes > 60 * 3 then
				closeX(frontAppBid())
				toast('登录超时,网络错误',1);
				mSleep(2000)
				waitTimes = os.time()
				return false
			end
		end
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function search(keywords,image,app_id)
	closeX(AppStore)
	delay(2)
	search_arr = {'打开STORE','输入关键词','下拉应用','购买页面'}
	search_setp = 1
	while (true) do
		if search_setp == 1 then

			if active(AppStore)then
				delay(2)
			elseif c_pic(m.搜索,'搜索')then
			elseif f_pic(m.搜索blue,'搜索-blue')then
				search_setp = 2
			end
		elseif search_setp == 2 then
			if f_pic(m.有结果,'有结果')or f_pic(m.结果云,'结果云')then
				search_setp = 3
				mSleep(1000)
			elseif c_pic(m['top-搜索'],'top-搜索')then
				input("\b\b\b\b\b\b\b\b\b\b\b\b")
				inputText(keywords)
			--	input(keywords)
				log(keywords)
				if c_pic(m['空格'],'空格')then
				--	input('\b')
				end
				c_pic(m['搜'],'搜')
				mSleep(3000)
			elseif c_pic(m['搜'],'搜')then
			end
			
		elseif search_setp == 3 then
			if c_tu(image)then
				mSleep(2000)
			elseif f_pic(m.AppPage,'应用详细页面')then
				search_setp = 4
			else
				moveUp(311,850,311,450) 
			end
		
			getApp = true
			installApp = true
		
		elseif search_setp == 4 then
			if f_pic(m.云,'云')then
				toast('已经拥有',1)
				mSleep(1000)
				return true
			elseif f_pic(m.打开,'打开')then
				mSleep(2000)
				ipaUninstall(app_id)
				toast("卸载完成",10)
				closeX(AppStore)
			elseif c_pic(m.正在下载,'正在下载')then
				toast('正在下载',1)
				mSleep(5000)
			elseif getApp and c_pic(m.获取,'获取')then
				toast('获取',1)
				getApp = false
			elseif installApp and c_pic(m.安装,'安装')then
				toast('安装',1)
				installApp = false
			elseif Rond() then
				toast('正在转圈',1)
				mSleep(1000)
			end
		end
		
		if AppStore ~= frontAppBid() then
			closeX(AppStore)
			search_setp = 1
		end
		
		---------------------------------超时验证-----------------------
		sotp = sotp or 0
		if sotp ~= search_setp then
			sotp = search_setp
			waitTimes = os.time() -----------------换一个步骤就重新计时
		elseif sotp == search_setp then
			if search_setp == 3 then
				wait_mun = 60 * 20
			else
				wait_mun = 60 * 5
			end
			if os.time() - waitTimes > wait_mun then
				if Rond()then
					if f_p(m.正在转圈,'正在转圈')then
						click(x+25,y)
						mSleep(5000)
					end
				end
				closeX(AppStore)
				toast('下载超时~网络错误',5);
				delay(2)
				waitTimes = os.time()
				search_setp = 1
			end
		end
		---------------------------------超时验证-----------------------
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function all()
while (true) do
	if GetTask()then



		re_start = 0
		if login()then
			for i,v in ipairs(data.tasks)do


				nLog('任务--'..i)
				keywords = v.keywords
				rank = v.rank
				image = v.image
				app_id = v.app_id
				open_comments = v.open_comments

				local_url = '/User/Media/TouchSpriteENT/res/'..image..'.png'
				if file_exists(local_url)then
					log(image..'已经存在')
				else
					web_url = 'http://luawarehouse.applinzi.com/asopic/'..image..'.png'
					if downFile(web_url,local_url) == -1 then
						toast('下载图片出错',60)
						return false
					end
				end
				
				if search(keywords,image,app_id)then
					if open_comments then
						user_name = nikename[math.random(1,#nikename)]..myRand(7,2)..myRand(7,2)
						if Comment(v.comment.title,v.comment.content,user_name)then
							successfull(v.app_name,v.task_id)
						else
							closeX(AppStore)
						end
					else
						successfull(v.app_name,v.task_id)
					end
				end
				closeX(AppStore)
				if re_start == 1 then
					re_start = 0
					return false
				end
			end
		end
	else
		close_VPN()
		mSleep(1000*10)
	end
end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 60)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end



















