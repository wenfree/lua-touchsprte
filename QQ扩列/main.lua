require("TSLib")
require("tsp")

init(0,0)
var = ""
appbid = "com.tencent.mqq"


t = {}

t['login_登录']={ 0x00cafc, "-197|-22|0x00cafc,-349|2|0xf3fdff,-430|-9|0x00cafc", 90, 31, 1130, 727, 1255 } --多点找色
t['login_登录界面']={ 0xf9ae08, "-42|2|0xf9ae08,-13|-9|0xffffff,-40|-29|0xea1c27,-58|-25|0x000000,-23|-59|0xf9ae08,16|-22|0x000000", 90, 257, 87, 357, 326 } --多点找色
t['login_登录箭头']={ 0xffffff, "43|0|0x40a0ff,33|26|0x40a0ff", 90, 244, 555, 493, 777 } --多点找色
t['login_验证码界面']={ 0x03081a, "2|3|0xffffff,13|23|0xffffff,15|26|0x03081a,95|1|0x03081a,96|27|0x9b9da4", 90, 321, 64, 429, 104 } --多点找色
t['login_主界面']={ 0x02c8fc, "6|37|0x02c7fc,443|-4|0x1ca8ff,443|56|0x1ca7ff", 90, 130, 38, 642, 139 } --多点找色
	t['login_主界面_点动态']={ 0xb0b3bf, "-14|-9|0xb0b3bf,-15|8|0xfdfdfe,-27|9|0xb0b3bf", 90, 620, 1237, 672, 1296 } --多点找色
	t['login_主界面_动态界面']={ 0x5fcefe, "-21|-8|0x8fe5fe,-23|18|0x3fbefe", 90, 619, 1240, 677, 1296 } --多点找色
		t['login_主界面_动态界面_点扩列']={ 0x06cafa, "-5|-6|0xffffff,-16|-13|0x12d5fa,-23|-20|0x19dcfb,-26|-26|0xffffff,-31|-26|0x20e2fc,-3|-28|0x15d8fb", 90, 22, 482, 263, 794 } --多点找色


t['update_设置界面']={ 0x989eb4, "18|-6|0x989eb4,19|10|0xffffff,33|10|0xffffff,140|-6|0x989eb4,134|25|0x989eb4,134|11|0xffffff", 90, 38, 1210, 211, 1255 } --多点找色
t['update_编辑资料界面']={ 0x757575, "-5|29|0x6e6e6e,123|31|0x999999,123|0|0x4a4a4a,127|19|0x919191", 90, 300, 58, 446, 107 } --多点找色
	t['update_编辑资料界面_选择生日']={ 0xffffff, "-620|-17|0x454856,-570|10|0x03081a,-570|-17|0x242838,-625|10|0xe6e6e8,-625|9|0x1e2333", 90, 21, 547, 707, 909 } --多点找色	
	t['update_编辑资料界面_选择昵称']={ 0xffffff, "-620|-14|0xc1c2c7,-620|10|0xbcbec2,-573|-16|0xabacb2,-561|-12|0x8b8d95,-560|8|0x81838c", 90, 21, 547, 707, 909 } --多点找色	
	t['update_编辑资料界面_选择头像']={ 0xffffff, "-635|-16|0xd3d4d7,-641|-2|0x373b49,-641|10|0x71747e,-586|-15|0xa8a9af,-582|10|0x90929a", 90, 19, 267, 727, 431 } --多点找色	
t['update_选择出生日期界面']={ 0x000000, "1|12|0x000000,79|13|0x000000,84|13|0xffffff,114|20|0x000000,117|20|0xffffff,154|18|0xfdfdfd,155|18|0x000000", 90, 267, 62, 482, 105 } --多点找色

	
t['tips_编辑资料']={ 0x00cafc, "-174|-48|0x00cafc,103|8|0x00cafc,-516|-1|0xebedf5,-252|-50|0xebedf5", 90, 26, 1222, 723, 1326 } --多点找色---tips
t['tips_绑定手机号关闭']={ 0x000000, "-34|4|0x040404,-360|-2|0x000000,-366|-2|0xfefefe,-323|-2|0xffffff", 90, 128, 748, 570, 816 } --多点找色
--t['tips_勋章']={ 0xd1bb7a, "-30|-28|0xd1bb7a,58|-123|0xd8bc73,-40|-200|0xd8bc73", 90, 262, 980, 514, 1253 } --多点找色
t['tips_勋章']={ 0xcea57d, "-9|-9|0xcea57d,11|-10|0xcea57d", 90, 356, 1177, 395, 1225 } --多点找色
t['tips_返回']={ 0x252525, "15|-17|0x838383,16|17|0x232323", 90, 32, 60, 61, 105 } --多点找色
t['tips_从相册选择照片']={ 0x000000, "-2|7|0xffffff,10|-91|0x000000,50|104|0xffffff,43|195|0x000000,40|202|0x000000,48|315|0x000000", 90, 232, 819, 523, 1317 } --多点找色
t['tips_从相册选择照片完成']={ 0xffffff, "-30|-1|0xffffff,-58|-12|0x00cafc,23|21|0x00cafc", 90, 590, 1225, 730, 1306 } --多点找色
t['tips_我知道了']={ 0xffffff, "-232|-28|0x12b7f5,116|19|0x12b7f5,-64|-2|0x12b7f5", 90, 150, 336, 636, 496 } --多点找色
t['tips_扩列返回确定']={ 0x000000, "-51|-30|0xffffff,-47|7|0xffffff,266|8|0x000000", 90, 168, 698, 573, 776 } --多点找色

t['work_扩列界面']={ 0x4082ff, "367|-1|0x4082ff,362|52|0x4082ff,195|17|0xffffff,64|57|0xffffff", 90, 170, 48, 567, 125 } --多点找色
	t['work_扩列界面_没有任务次数']={ 0x4082ff, "-34|-4|0x4082ff,-30|6|0x4082ff,-30|7|0xffffff,-17|17|0xffffff", 90, 324, 235, 405, 271 } --多点找色
	t['work_扩列界面_有任务']={ 0x4c82ff, "-24|3|0x4c82ff,-147|4|0x4c82ff,-161|4|0x4c82ff", 90, 266, 372, 497, 428 } --多点找色
t['work_匹配中']={ 0x002455, "-43|-12|0x002455,34|3|0x274875,28|-1|0xc9e0ff", 90, 298, 1127, 444, 1186 } --多点找色
t['work_扩列聊天界面']={ 0xdeeeff, "1|5|0x03081a,1|14|0xdeeeff,2|18|0x03081a,4|21|0xdfeeff", 90, 663, 56, 722, 111 } --多点找色



function tips()
	if d('tips_绑定手机号关闭',true) then
	elseif d('tips_勋章',true) then
	elseif d('tips_返回',true) then
	elseif d('tips_我知道了',true) then
	elseif d('tips_扩列返回确定',true) then
	elseif d('tips_从相册选择照片',true) then
		delay(3)
		click(79,220)
	else
		click(44,75)
		log('返回')
	end
end

function update()
	
	if d('login_主界面',false) then
		if 等待手机号弹窗key then
			等待手机号弹窗key = false
			delay(10)
		end
		click(62,79)
		
		if d('update_设置界面',false) then
			click(402,233)
		end
	elseif d('update_选择出生日期界面',false) then	
		
		for i = 1 , math.random(3,12) do
			click(244,1057)
		end
		for i = 1 , math.random(1,11) do
			click(366,1180)
		end
		for i = 1 , math.random(1,3) do
--			click(517,1179)
			moveTo(517,1022,518,math.random(1100,1252))
			delay(2)
		end
		delay(2)
		年龄key = false
		d('tips_返回',true)
	elseif d('tips_编辑资料',true) then	
	elseif d('update_编辑资料界面',false) then		
		if 年龄key then
			d('update_编辑资料界面_选择生日',true)
		elseif namekey < 2 then
			d('update_编辑资料界面_选择昵称',true)
			for i = 1, 10 do
				click(707,1192)
			end
			click(465,1295)
			click(707,1192)
			delay(3)
			input(qq_name)
			delay(3)
			namekey = namekey + 1
		elseif 头像key then
			d('update_编辑资料界面_选择头像',true)
			
		end
	else
		tips()
	end
end

function login()
	local account = '3412295874'
	local password = 'z00r4202'
		  qq_name = '非诚勿扰'
		  年龄key = true
		  namekey = 0
		  头像key = true
		  等待手机号弹窗key = true	
	local timeout = os.time()
	local timeline = 60*3
	
	while os.time() - timeout < timeline do
		if active(appbid,5) then
			if d('login_登录',true) then
			elseif d('login_登录界面',false) then
				if d('login_登录箭头',true) then
				else
					click(425,440)
					inputword(account)
					delay(2)
					click(422,460)
					inputword(password)	
					delay(2)
					click(387,638)
				end
			elseif d('login_验证码界面',false) then						
				moveTo(146,709,580,700)			
			elseif d('tips_从相册选择照片完成',true) then
				头像key = false
				return true	
			else
				if update() then
				end	
			end
		end
		delay(1)
	end
	
end

话述 = {'嗨','你好','在吗'}

function work()
	local timeout = os.time()
	local timeline = 60*3
	local 聊天key = true
		  等待扩列加载key = true	
	while os.time() - timeout < timeline do	
		if active(appbid,5) then
			if d('login_主界面',false) then
				if d('login_主界面_点动态',true) then
				elseif d('login_主界面_动态界面',false) then
					delay(3)
					if d('login_主界面_动态界面_点扩列',true) then
					else
						toast('没有扩列权限',3)
						return true
					end
				end
			elseif d('work_匹配中',false) then
			elseif d('work_扩列界面',false) then
				if 等待扩列加载key then
					delay(20)
					等待扩列加载key = false
				end	
				delay(3)
				if d('work_扩列界面_有任务',true) then
--					click(524,357)
					聊天key = true
				else
					return true
				end
			elseif 聊天key and d('work_扩列聊天界面',false) then
				click(158,1186)
				delay(2)
				click(146,678)
				input(话述[1])
				click(683,1292)
				input(话述[2])
				click(683,1292)
				input(话述[3])
				click(683,1292)
				delay(3)
				聊天key = false
			else
				tips()
			end
		end
		delay(1)
	end
end


if login() then
	work()
end



----测试图片下载功能未完成
--[[
local ts = require("ts")
	url = "http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87%E4%B8%8B%E8%BD%BD&step_word=&hs=0&pn=5&spn=0&di=9900&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=2958967064%2C2714608608&os=532015192%2C232240618&simid=3368240978%2C270353512&adpicid=0&lpn=0&ln=391&fr=&fmq=1563954004980_R&fm=&ic=undefined&s=undefined&hd=undefined&latest=undefined&copyright=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fpic37.nipic.com%2F20140103%2F10616010_215644481373_2.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bgtrtv_z%26e3Bv54AzdH3Ffi5oAzdH3Flccnc0d_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0&islist=&querylist=&force=undefined"
	code,msg = ts.tsDownload(userPath().."/res/110.jpg",url)

dialog(code,0)
dialog(msg,0)


saveImageToAlbum("/var/mobile/Media/TouchSprite//res/110.jpg");

--dialog(ts.hlfs.getFileEncoding("/var/mobile/Media/TouchSprite/res/008id.png"))
--dialog("/var/mobile/Media/TouchSprite/res/200.png")

--]]



