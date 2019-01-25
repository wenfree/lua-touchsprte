require("TSLib")
require("tsp")
require("AWZ")
--require("lz-api")
--require("yzm")
--require("ui")
require("ui")

require("iphone6")




appbid = "com.ss.iphone.ugc.Aweme"
init(appbid,0)
arrs ={}
arrs.show={477, 0, 665, 41}
arrs.commnet={645, 852, 733, 896}
arrs.send = 1
arrs.lady = false
arrs.man = false
arrs.kongbai = false


---------------------------------全局变量
function orc(t)
	local recognize = ocrText(t[1],t[2],t[3],t[4],0)
	if recognize ~= nil then
		nLog('识别结果--'..recognize)
		local i,j = string.find(recognize,"%d+")
		if i~= nil and j~= nil then
			recognize =string.sub(recognize,i,j)
			recognize = tonumber(recognize)
			recognize = recognize or 1
			nLog(recognize)
			return recognize
		end
	end
	return 0
end

zfb={
	"❤","❥","웃","유","♋","☮","✌","☏","☢","☠","✔",
	"☑","♚","▲","♪","✈","✞","÷","↑","↓","◆","◇","⊙",
	"■","□","△","▽","¿","─","│","♥","❣","♂","♀","☿ ",
	"Ⓐ","✍","✉","☣","☤ ","✘","☒","♛","▼","♫","⌘",
	"≈","←","→","◈","◎","☉","★","☆","⊿","※","¡","━ ",
	"┃ ","♡","ღ","ツ","☼","☁","❅","♒","✎","©","®","™",
	"Σ","✪","✯","☭","➳","卐","√","↖","↗","●","◐","Θ",
	"◤","◥",
}

dyName = {
	"薄凉","心疼","奢侈","无心","沙砾","浮生","若梦","千城","松手","解脱","洒脱","匆匆","原来",
	"骤变","迷失","从容","分心","争辩","宿命","漂流","敷衍","倘若","距离","奢侈","无果","安好",
	"炽热","征服","旧梦","往事","逃离","凌乱","依赖","缠绵","暴晒","苍白","曾经","淡忘","迷茫",
	"沉淀","沉沦","摆布","搁浅","梦碎","千世","路口","旧店","疯子","指望","浮夸","笔调","谅解",
	"体会","心疼","喧哗","吵闹","沦陷","唯一","残缺","莫爱","冷漠","释怀","忘记","流浪","琉璃",
	"烟火","色调","掺杂","丑态","灰烬","感性","回旋","誓言","流水","已逝","轻雾","花落","夏末",
	"淡色","直觉","牵强","妖媚","深浅","迁就","阴霾","余温","枷锁","往事","泛白","网名","记忆",
	"沉迷","惨白","声色","回忆","泛白","着迷","湛蓝","木槿","倘若","距离","空城","蓝天","青草",
	"白云","模糊","扯淡","夏时","逆夏","未知","浅暖","迷茫","情绪","溪涧","开心","阳光","成熟",
	"光年","宠物","彩色","星星","森林","契约","童真","时间","遗忘","碎花","格子","豹纹","软刺",
	"怅惘","迷乱","延续","难耐","凝眸","炙热","灼伤","画心","着迷","画心","着迷","微仰","阳光",
	"入眠","承诺","倾城","搁浅","福兮","祸兮","初礼","光线","逾越","掠过","柔情","旅途","旅行",
	"转身","离开","回味","折磨","未来","舍得","错过","牵手","伤口","心底","陌路","彩虹","夏日",
	"纸鸳","歪斜","字迹","半知","平淡","慰籍","牵绊","煽情","罂粟","洒脱","平庸","忆伤","过客",
	"执念","岑迷","斑驳","浮尘","依恋","执着","迷茫","现实","大海","蓝天","蔚蓝","梦魔","蓦然",
	"花留","残留","空梦","情场","操控","莫名","埋没","回忆","狼狈","妖娆","妩媚","娇艳","似非",
	"开颜","笑颜","心事","涟漪","藏心","心痛","残留","余地","空气","纯净","清新","剩余","难得",
	"欢心","沙砾","浮梦","千世","千城","松手","解脱","洒脱","匆匆","骤变","迷失","从容","分心",
	"争辩","宿命","漂流","敷衍","倘若","距离","奢侈","无果","安好","炽热","征服","冷瞳","亦难",
	"开岸","似我","忧深","风掠","萧兮","独醉","黎铁","擒拿","静候","一线","差池","段情","堪阳",
	"偏执","痴迷","断续","恍惚","时光","梦呓","遗失","躲藏","寻觅","奔赴","潮流","续写","随风",
	"夏末","臾凉","长色","致借","度半","黑魂","末世","蕾溪","栋倍","霖婆","眉瘸","沧偕","瓷筒",
	"堇年","半边","桃凌","陡变","亡屿","蔻丹","柔荑","网名","离一","氧气","执迷","雅泽","心淡",
	"落年","手札","如许","安德","愫暮","离癸","诺然","敷诋","失退","途往","怪珈","怪胎","安静",
	"安亿","纠结","缠绵","意犹","未尽","转身","离开","割腕","默然","凌迟","寡淡","优柔","痴男",
	"沙漏","暗号","背叛","破色","归隐","诬蔑","趋势","沮丧","淡写","缺心","嗜毒","潮音","刺眼",
	"画窗","最后","试探","凌乱","影像","沉世","晨曦","余辉","诉说","景色","泪人","埋葬","初见",
	"忘记","清楚","陌路","错误","淡然","时光","沧澜","血腥","苦口","玩味","红尘","空罐","冒险",
	"渲染","痛楚","挣脱","魅力","七年","简单","预见","诠释","樱花","夜眠","辗转","黑丝","昔忆",
	"妖娆","花谢","昔颜","深夜","明花","棱角","代替","哼唱","敷衍","放肆","习惯","未来","温习",
	"改变","萧然","世界","安然","昔梦","一些","昔瞳","天空","不见","蓝颜","昔年","不爱","借口",
	"没有","方向","翱翔","怡然","刺心","温瞳","魅眸","引魂","尘封","牵绊","黛眉","褐瞳","昔情",
	"漠然",
}

function box(txt)
	boxshow(txt,arrs.show[1],arrs.show[2],arrs.show[3],arrs.show[4])
end

function getTXT()
	url = "http://idfa888.com/Public/dyid/?service=dyid.readtext"
	return get(url)['data']
end

function Tip()
	if d('弹窗_允许',true,1,"是否允许发送通知")then
	elseif d('弹窗_位置允许',true,1,"是否允许访问你的位置允许")then

--	elseif d('弹窗_通讯录取消',true,1)then
--	elseif d('弹窗_取消回复',true,1,"误点操作")then
--		return '取消回复'
	else
		log('no Tip')
		return true
	end
end


function weiboyz()
	if d('微博_点击验证码')then
		log(x.."-"..y)
		touchDown(1, x, y)
		mSleep(rd(100,280))
		touchUp(1, x, y)
		mSleep(rd(1000,2000))
		return true
	elseif d('微博_请点击重试',true)then
		return true
	elseif d('微博_滑块')then
		movet__ = movet__  + 1
		local x_,y_ = move__()
		moveTo(x,y,x_+50,y_)
		delay(3)
	elseif d('微博_登录成功')then
		d('微博_关闭',true)
	end
end

function tips()
	if d('弹窗_微博登录',true)then
	elseif d('弹窗_相册选择',true)then
	elseif d('弹窗_微博登录_绑定跳过',true)then
	elseif d('弹窗_位置允许',true)then
	elseif d('弹窗_允许',true)then
	elseif d('弹窗_新版同意',true)then
	elseif d('弹窗_发现通信录好友_取消',true)then
	elseif d('弹窗_放弃保存',true)then
	elseif d('照片_时刻',true)then
	elseif d('选取_取消',true)then
		修改头像 = false
		delay(rd(3,5))
	elseif d('时刻_<照片_取消')then
		click(85,335)
	elseif d('微博_关闭')then
		if	not( weiboyz()) then
			moveTo(width/2,900,width/2,500)
		end
	else
		return true
	end
end

function login()
	local timeline = os.time()
	local utime = 60*5
	local 改资料 = true
	local 改过资料 = false
	accountdata = get('http://wenfree.cn/api/Public/aoc/?service=Dy.get')
	if not(accountdata) then
		return false
	else
		log(accountdata)
	end
	movet__ = movet__ or 0
	修改头像 = true
	
	while (os.time()-timeline < utime) do
		if active(appbid,5)then
			
			if movet__ >= 10 then		----提前结束掉整个循环
				movet__ = 0
				return false
			end
			
			if d('首页红绿') then
				if d('首页红绿_完善资料',true)then
					
				elseif 改过资料 then
					dialog("修改完成", 2)
					return true
				elseif 改资料 then
					if d('首页红绿_我的页面')then
						click(123,255)	
					else
						click(668,1286)
					end
				end
			elseif d('弹窗_微博登录_界面')then
				
				if d('弹窗_微博登录_界面_密码',true)then
					input(accountdata.data.pwd)
					d('弹窗_微博登录_界面_完成',true)
				end				
				
				if d('弹窗_微博登录_界面_帐号',true)then
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					input(accountdata.data.account)
					d('弹窗_微博登录_界面_完成',true)
				end
				
				d('弹窗_微博登录_界面_登录',true)
			elseif d('弹窗_微博登录_安全验证')then
				delay(3)
				imgfile = lzScreen(210, 670, 545, 991,1.0)
				if d('弹窗_微博登录_安全验证') and lz_yzm() then
--					apple_yzm = "260,270|67,266|68,69|258,62|264,253"
					jiegoulist = strSplit(apple_yzm,"|")
					for i,v in ipairs(jiegoulist) do
						jiegoulist[i]=strSplit(v,",")
						jiegoulist[i][1] = jiegoulist[i][1]+210
						jiegoulist[i][2] = jiegoulist[i][2]+670
						
					end
					print_r(jiegoulist)
					if apple_yzm ~= '' then
						delay(1)
						for i,v in ipairs(jiegoulist) do
							if i == 1 then
								touchDown(1, v[1], v[2])
							elseif i == 4 then
								moveTo_(jiegoulist[i-1][1],jiegoulist[i-1][2],v[1], v[2],5)
								touchUp(1, v[1], v[2])
								break
							else
								moveTo_(jiegoulist[i-1][1],jiegoulist[i-1][2],v[1], v[2],5)
								delay(0.1)
							end
						end
					end
				else
					click(603,431)
				end
				delay(5)
			elseif d('弹窗_微博登录_授权登录',true)then
			elseif d('个人资料_保存')then
				if 修改头像 then
					if d('个人资料_保存_点击更换头像',true)then
						clearAllPhotos()
						local localPath = userPath().."/res/head.jpg"
						local serviceParh = 'http://wenfree.cn/weibo/image/i ('..rd(1,1804)..').jpg'
						if downFile(serviceParh,localPath)then
							saveImageToAlbum("head.jpg")
						end
						delay(3)
					end
				else
					click(501,513)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					local dynames = dyName[rd(1,#dyName)]..dyName[rd(1,#dyName)]
					input(dynames)
					
					click(213,748,2)
					click(374,1125,2)
				
					click(509,1054)
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					
					inputtimes = os.time()
					while (os.time()-inputtimes < 10) do
						if d('个人资料_签名位置',true) then
							input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
						else
							break
						end
					end
				
					input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
					local dyurl = 'http://idfa888.com/Public/dyid/?service=dyid.readtext'
					dydata = get(dyurl)
					if dydata ~= nil then
						print_r(dydata)
					end
					input(dydata.data.text..zfb[rd(1,#zfb)]..zfb[rd(1,#zfb)])
					if d('个人资料_保存',true)then
						改资料 = false
						改过资料 = true
						return true
					end
				end
			else
				if tips()then
					moveTo(width/2,900,width/2,500)
				end
			end
		end
		delay(1)
	end

end

t['主页_红绿色']={ 0xff2c55, "0|-28|0xff2c55,-3|-23|0xffffff,-80|-17|0x17eee8", 90, 322, 1255, 429, 1317 } --多点找色
t['搜索界面']={ 0xe4bd16, "-3|-4|0x161823,-1|-9|0xface15,0|-95|0xa1a2a6", 90, 681, 59, 731, 210 } --多点找色
t['搜索界面_取消']={ 0xe4bd16, "-16|-92|0xfe2c55", 90, 674, 64, 732, 206 } --多点找色
t['搜索界面_结果页面']={ 0xface15, "-77|0|0xface15,-81|-2|0x161823,-74|-127|0xe8e8e9", 90, 10, 47, 131, 243 } --多点找色
	t['搜索界面_结果页面_关注']={ 0xfe2c55, "-45|-32|0xfe2c55,103|21|0xfe2c55,46|-5|0xffffff", 90, 493, 229, 737, 668 } --多点找色
	t['搜索界面_结果页面_已关注']={ 0xebeced, "-71|-24|0x393b44,-73|18|0x393b44,75|-17|0x393b44", 90, 532, 217, 737, 623 } --多点找色

t['弹窗_发现通信录好友_取消']={ 0x6a6b77, "277|-2|0x292b37,242|-531|0x3aa6ff,253|-539|0xf8ff25", 90, 134, 377, 594, 1020 } --多点找色




function follow()
	local timeline = os.time()
	local OutTime = 60*60*5
	dyurl = 'http://idfa888.com/Public/dyid/?service=dyid.readtext'
	dydata = get(dyurl)
	
	follow_success = 1
	搜索false = 0
	
	while (os.time()-timeline < OutTime) do
		if follow_success >= dydata.data.mun+0 then
			return true
		end
		
		if active(appbid,5)then
			if d('主页_红绿色')then
				click(67,1285)
				click(56,67)
			elseif d('搜索界面') then	
				click(626,92,0.2)
			elseif d('搜索界面_取消')then
				
--				local getdyid_url = 'http://idfa888.com/Public/dyid/?service=dyid.getdyid&sex='..UIv.sex
				local getdyid_url = 'http://api.okayapi.com/?s=Ouwen000.Dyid.Getdyid&&app_key=90BB9337D7B1ACC0CA642C5726D227CB&sex='..UIv.sex
				local dyid_data = get(getdyid_url)
--				input("1011723321")
				if dyid_data ~= nil then
					input(dyid_data.data.data.dyid)
					click(659,1290,1)
				else
					log("取id报错,休息5秒",true)
					delay(5)
				end
			elseif d('搜索界面_结果页面')then
				if d('搜索界面_结果页面_关注',true)then
				elseif d('搜索界面_结果页面_已关注')then
					follow_success = follow_success + 1
					click(39,85,0.1)
				else
					搜索false = 搜索false + 1
					if 搜索false > 10 then
						click(39,85,0.5)
						搜索false = 0
					end
				end
			else
				if tips()then
					click(39,85)
				end
			end
		end
		delay(0.5)
	end
end


function follow_()	--新版follow 3.8.1
	local timeline = os.time()
	local OutTime = 60*60*5
	dyurl = 'http://idfa888.com/Public/dyid/?service=dyid.readtext'
	dydata = get(dyurl)
	
	follow_success = 1
	搜索false = 0
	
	
	t['主页_红绿色']={ 0xfe2d56, "-1|0|0xffffff,-80|-4|0x25f4ee,-79|-4|0xffffff", 90, 320, 1253, 425, 1321 } --多点找色
	t['搜索界面']={ 0xa1a2a6, "-652|-1|0xa2a3a7,-641|-14|0x161823,-641|-15|0xa2a3a7", 90, 18, 47, 732, 125 } --多点找色
	t['搜索界面_取消']={ 0xfe2c55, "5|-12|0x161823,13|-13|0xfe2c55", 90, 624, 57, 741, 110 } --多点找色
	t['搜索界面_结果页面']={ 0xface15, "-34|-126|0x9b9ca1,55|-1|0xface15", 90, 6, 33, 742, 239 } --多点找色
	
	while (os.time()-timeline < OutTime) do
		if follow_success >= dydata.data.mun+0 then
			return true
		end
		
		if active(appbid,5)then
			if d('主页_红绿色')then
				click(67,1285)
				click(56,67)
			elseif d('搜索界面') then	
				click(626,92,0.2)
			elseif d('搜索界面_取消')then
				
--				local getdyid_url = 'http://idfa888.com/Public/dyid/?service=dyid.getdyid&sex='..UIv.sex
				local getdyid_url = 'http://api.okayapi.com/?s=Ouwen000.Dyid.Getdyid&&app_key=90BB9337D7B1ACC0CA642C5726D227CB&sex='..UIv.sex
				local dyid_data = get(getdyid_url)
--				input("1011723321")
				if dyid_data ~= nil then
					input(dyid_data.data.data.dyid)
					click(659,1290,1)
				else
					log("取id报错,休息5秒",true)
					delay(5)
				end
			elseif d('搜索界面_结果页面')then
				if d('搜索界面_结果页面_关注',true)then
				elseif d('搜索界面_结果页面_已关注')then
					follow_success = follow_success + 1
					click(39,85,0.1)
				else
					搜索false = 搜索false + 1
					if 搜索false > 10 then
						click(39,85,0.5)
						搜索false = 0
					end
				end
			else
				if tips()then
					click(39,85)
				end
			end
		end
		delay(0.5)
	end
end


function all()
	if UIv.net == "1" or vpn() then
		delay(1)
		if UIv.login ~= '0' then
			sys.clear_bid(appbid)
		end
		if UIv.login == "0" or login()then
			follow()
		end
	end
	vpnx()
	delay(2)
end


--]]
--[[
while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 15)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end
		
--]]

--[[]]
--sys.clear_bid(appbid)
--login()
delay(2)
left_top = {165,463}
left_bottom = {167,731}
right_left = { 273,520} --多点比色}
right_right = {634,520 }

function move__()
	keepScreen(true)
	function leftTop()
		for i=left_top[2],left_bottom[2] do
			local c={}
			c.r,c.g,c.b = getColorRGB(left_top[1], i-4)
			local c_={}
			c_.r,c_.g,c_.b = getColorRGB(left_top[1], i-2)
			local c__={}
			c__.r,c__.g,c__.b = getColorRGB(left_top[1], i)
			if c__.r - c.r > 150 and c_.r - c.r > 150 then
				log("top->"..i)
				return i
			end
		end
	end
	function rightRight(top_light)
		for i=right_left[1],right_right[1] do
			local c={}
			c.r,c.g,c.b = getColorRGB(i-4, top_light)
			local c_={}
			c_.r,c_.g,c_.b = getColorRGB(i-2, top_light)
			local c__={}
			c__.r,c__.g,c__.b = getColorRGB(i, top_light)
			if c.r - c__.r > 45 and c.r - c_.r > 45 then
				log("right->"..i)
				return i
			end
		end
	end

	local top_light = leftTop()
	local top_right = rightRight(top_light)
	keepScreen(false)
	if top_light and top_right then
		return top_light,top_right
	else
		return 0,0
	end
end



--[[]]
while (true) do
	
	log(UIv.net)
	
	if UIv.login == "0" then
		follow()
	elseif UIv.login == "2" then
		log("清理沙盒",true)
		sys.clear_bid(appbid)
		delay(2)
		log("清理沙盒结束",true)
		delay(2.8)
		if UIv.net == "1" or vpn()then
			if login()then
				follow()
			end
		end
	elseif UIv.login == '3' then
		log("清理沙盒",true)
		sys.clear_bid(appbid)
		delay(2)
		log("清理沙盒结束",true)
		delay(2.8)
		if UIv.net == "1" or vpn()then
			if login()then
				lua_exit()
			end
		end
	elseif UIv.login == '4' then
		follow_()
	else
		log("清理沙盒",true)
		sys.clear_bid(appbid)
		delay(2)
		log("清理沙盒结束",true)
		delay(2.8)
		return true
	end
	vpnx()
	delay(3)
end
--]]




























































































































