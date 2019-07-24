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

t['update_设置界面']={ 0x989eb4, "18|-6|0x989eb4,19|10|0xffffff,33|10|0xffffff,140|-6|0x989eb4,134|25|0x989eb4,134|11|0xffffff", 90, 38, 1210, 211, 1255 } --多点找色
t['update_编辑资料界面']={ 0x757575, "-5|29|0x6e6e6e,123|31|0x999999,123|0|0x4a4a4a,127|19|0x919191", 90, 300, 58, 446, 107 } --多点找色
t['update_选择出生日期界面']={ 0x000000, "1|12|0x000000,79|13|0x000000,84|13|0xffffff,114|20|0x000000,117|20|0xffffff,154|18|0xfdfdfd,155|18|0x000000", 90, 267, 62, 482, 105 } --多点找色

t['tips_编辑资料']={ 0x00cafc, "-174|-48|0x00cafc,103|8|0x00cafc,-516|-1|0xebedf5,-252|-50|0xebedf5", 90, 26, 1222, 723, 1326 } --多点找色---tips
t['tips_绑定手机号关闭']={ 0x000000, "-34|4|0x040404,-360|-2|0x000000,-366|-2|0xfefefe,-323|-2|0xffffff", 90, 128, 748, 570, 816 } --多点找色
t['tips_勋章']={ 0xd1bb7a, "-30|-28|0xd1bb7a,58|-123|0xd8bc73,-40|-200|0xd8bc73", 90, 262, 980, 514, 1253 } --多点找色
t['tips_返回']={ 0x252525, "15|-17|0x838383,16|17|0x232323", 90, 32, 60, 61, 105 } --多点找色
t['tips_从相册选择照片']={ 0x000000, "-2|7|0xffffff,10|-91|0x000000,50|104|0xffffff,43|195|0x000000,40|202|0x000000,48|315|0x000000", 90, 232, 819, 523, 1317 } --多点找色
t['tips_从相册选择照片完成']={ 0xffffff, "-30|-1|0xffffff,-58|-12|0x00cafc,23|21|0x00cafc", 90, 590, 1225, 730, 1306 } --多点找色
function tips()
	if d('tips_编辑资料',true) then
	elseif d('tips_绑定手机号关闭',true) then
	elseif d('tips_勋章',true) then
	elseif d('tips_返回',true) then
	elseif d('tips_从相册选择照片完成',true) then
		头像key = false
		dialog('脚本结束')
		lua_exit()
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
		click(62,79)
		if d('update_设置界面',false) then
			click(402,233)
		end
	elseif d('update_选择出生日期界面',false) then	
		
		for i = 1 , math.random(3,12) do
			click(228,1180)
		end
		for i = 1 , math.random(1,11) do
			click(366,1180)
		end
		for i = 1 , math.random(1,3) do
--			click(517,1179)
			moveTo(517,1022,518,math.random(1100,1252))
		end
		delay(2)
		年龄key = false
		d('tips_返回',true)
	elseif d('update_编辑资料界面',false) then	
		if 年龄key then
			click(336,828)
		elseif namekey then
			click(307,652)
			for i = 1, 8 do
				click(707,1192)
			end
			delay(3)
			input(qq_name)
			namekey = false
		elseif 头像key then
			click(570,340)
			
		end
	else
		tips()
	end
end

function login()
	local account = '3145643256'
	local password = 'ws8vhm23'
		  qq_name = '非诚勿扰'
		  年龄key = true
		  namekey = true
		  头像key = true
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
				moveTo(146,709,554,700)
									
				
			else
				if update() then
				end	
			end
		end
		delay(2)
	end
	
end





login()


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



