function rndPassWord() --随机数量个数 
		local capLetter = stringRandom("QWERTYUIOPASDFGHJKLZXCVBNM",math.random(2,4),1)
		local lowelLetter = stringRandom("qwertyuiopasdfghjklzxcvbnm",math.random(2,4),1)
		local number = stringRandom("123456789",math.random(4,6))
		local pas = {capLetter..lowelLetter..number,lowelLetter..capLetter..number,number..capLetter..lowelLetter}
		return 	pas[math.random(1,#pas)]
end 
function getUserInfo()
	
	local adrreses = {
		{"罗沙路兰亭国际&&阁##0#室"},
		{"沿河南路2007号&&小区##栋#0##号"},
		{"延芳路4038号&&小区##栋#0##号"},
		{"罗沙路4099号&&小区##栋#0##室"},
		{"延芳路600号&&小区##栋#0##室"},
		{"延芳路588号&&小区##栋#0##号"},
		{"罗湖广岭小区##栋#0##号"},
		{"罗沙路新世界四季御园###栋#0##号"},
		{"大澎花园##栋##0#室"},
		{"中震大厦&&阁##0#室"},
		{"通发花园##栋#0##号"},
		{"罗芳苑##栋##0#室"},
		{"银丰花园##栋#0##号"},
		{"龙泉花园##栋#0##号"},
		{"芳春花园##栋#0##号"},
		{"深港新村##栋#0##号"},
		{"锦绣新村##栋#0##号"},
		{"兴华苑##栋##0#室"},
		{"华兴花园##栋##0#室"},
		{"赤龙新村##栋#0##号"},
		{"经二路1号&&小区##栋#0#"},
		{"经二路3号&&小区##栋#0#"},
		{"罗芳路190号&&小区##栋#0#"},
		{"经二路19号名太轩##栋##0#室"},
		{"广陵家园##栋##0#室"},
		{"罗湖党校##栋#0#"},
		{"西岭花园##栋#0#"},
		{"安业花园##栋#0#"},
		{"罗芳南路南延线小城 &&阁##0#室"},
		{"延芳路交叉口龙门小区"},
		{"延芳路罗芳大厦#0##号"},
		{"罗芳申通小区"},
		{"延芳路证券交易所#0##室"},
		{"罗芳水产养殖有限公司#0##号"},
		{"罗芳路支行营业部#栋#0##号"},
		{"罗芳南路交叉口西南角广场###栋#0##号"},
		{"罗芳南路交叉口希布大厦##栋##0#室"},
		{"延芳路罗芳股份有限公司1118号&&小区##0#室"},
		{"通发花园##栋#0##号"},
		{"罗芳路广东办事处##栋##0#室"},
		{"延芳路易达商行 &&阁##0#室"},
		{"罗芳南路吴州村##栋#0##号"},
		{"延芳路罗芳大厦#0##号"},
		{"延芳路罗达花园##栋#0##室"},
		{"罗芳南路保莱大酒店#0##室"},
		{"罗芳南路龙暄大厦#0##号"},
		{"罗芳华华集团#栋#0##号"},
	}
	local  first_names = 	"赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许"..
							"何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章"..
							"云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳"..
							"酆鲍史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常"..
							"乐于时傅皮卞齐康伍余元卜顾孟平黄和穆萧尹"..
							"姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞"..
							"熊纪舒屈项祝董粱杜阮蓝闵席季麻强贾路娄危"..
							"江童颜郭梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍"..
							"虞万支柯昝管卢莫经房裘缪干解应宗丁宣贲邓"..
							"郁单杭洪包诸左石崔吉钮龚程嵇邢滑裴陆荣翁"..
							"荀羊於惠甄麴家封芮羿储靳汲邴糜松井段富巫"..
							"乌焦巴弓牧山谷车侯蓬全郗班仰秋仲伊宫"..
							"宁仇暴甘厉戎祖武符刘景詹束龙叶幸司韶"..
							"郜黎蓟薄印宿白怀蒲邰从鄂索咸籍赖卓蔺屠蒙"..
							"池乔阴胥能苍双闻莘党翟谭贡劳逄姬申扶堵"..
							"冉宰郦雍璩桑桂濮牛寿通边扈燕冀郏浦尚农"..
							"温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎"..
							"戈廖庾终暨居衡步都耿满弘匡国文寇广禄阙东"..
							"殴殳沃利蔚越隆师巩厍聂晁勾敖融冷訾辛阚"..
							"那简饶空曾毋沙养鞠须丰巢关蒯相查後荆红"
		local last_names =	"安彤含祖赩涤彰爵舞深群适渺辞莞延稷桦赐帅适亭濮存城稷澄添悟绢绢澹迪婕箫识悟舞添剑深禄延涤" ..
							"濮存罡禄瑛瑛嗣嫚朵寅添渟黎臻舞绢城骥彰渺禾教祖剑黎莞咸浓芦澹帅臻渟添禾亭添亭霖深策臻稷辞" ..
							"悟悟澄涉城鸥黎悟乔恒黎鲲涉莞霖甲深婕乔程澹男岳深涉益澹悟箫乔多职适芦瑛澄婕朵适祖霖瑛坤嫚" ..
							"涉男珂箫芦黎珹绢芦程识嗣珂瑰枝允黎庸嗣赐罡纵添禄霖男延甲彰咸稷箫岳悟职祖恒珂庸琅男莞庸浓" ..
							"多罡延瑛濮存爵添剑益骥澄延迪寅婕程霖识瑰识程群教朵悟舞岳浓箫城适程禾嫚罡咸职铃爵渺添辞嫚" ..
							"浓寅鲲嗣瑛鸥多教瑛迪坤铃珹群黎益澄程莞深坤澹禄职澹赩澄藉群箫骥定彰寅臻渟枝允珹深群黎甲鲲" ..
							"亭黎藏浓涤渟莞寅辞嗣坤迪嫚添策庸策藉瑰彰箫益莞渺乔彰延舞祖婕澹渺鸥纵嗣瑛藏濮存婕职程芦群" ..
							"禾嫚程辞祖黎职浓桦藏渟禾彰帅辞铃铃黎允绢濮存剑辞禾瑰添延添悟赐祖咸莞男绢策婕藉禾浓珹涤祖" ..
							"汉骥舞瑛多稷赐莞渟黎舞桦黎群藏渺黎坤桦咸迪澈舞允稷咸剑定亭澄濮存鲲臻全鸥多赐程添瑛亭帅悟" ..
							"甲男帅涤适纵渟鲲亭悟琅亭添允舞禾庸咸瑛教鲲允箫芦允瑛咸鸥帅悟延珂黎珹箫爵剑霖剑霖禄鸥悟涉" ..
							"彰群悟辞帅渺莞澄桦瑛适臻益霖珹亭澹辞坤程嗣铃箫策澈枝赐莞爵渟禄群枝添芦群浓赐职益城澄赩琅" ..
							"延群乔珹鲲祖群悟黎定庸澄芦延霖罡鲲咸渺纵亭禄鸥赩涤剑澹藏纵濮存澄芦剑延瑰稷黎益赩澄允悟澈" ..
							"甲嗣绢朵益甲悟涤婕群咸臻箫鲲寅鸥桦益珂舞允庸芦藉寅渺咸赐澄程剑瑰霖瑰铃帅男铃悟识瑰仕仕城" ..
							"允莞全朵涤铃剑渺稷剑珂铃箫全仕益纵芦桦珂濮存城朵朵咸程剑澄定澈爵寅庸定莞瑛教彰黎箫仕黎桦" ..
							"赩深赩爵迪悟珹涤琅添箫桦帅瑛黎黎策识寅嫚涉迪策汉舞定彰允男祖教澄群瑛濮存男禾教莞禾鸥澈濮" ..
							"存岳城嫚深舞教岳澄亭禾坤朵亭职莞稷寅瑰城庸亭舞禾瑛恒坤浓彰莞澄澈鸥臻稷教琅辞益剑藉黎添瑛" ..
							"延舞坤仕岳多婕骥迪帅黎悟全澄识益甲桦纵适罡彰澄禾婕程黎城涤浓枝箫咸渟岳渟澹臻珹识珹澄箫辞" ..
							"浓鲲识悟允悟禾识群祖迪渟鲲群庸莞珹悟澹瑰悟鸥汉群甲莞庸职琅莞桦鲲朵深乔辞允彰渺朵瑰亭瑰朵" ..
							"定深男识群职霖益男舞城允舞爵赩枝罡罡群澹芦藉爵悟渟澹禾多庸箫坤乔芦甲濮存多渟藉珹赐汉纵亭" ..
							"禾城枝剑露以玉春飞慧娜悠亦元晔曜霜宁桃彦仪雨琴青筠逸曼代菀孤昆秋蕊语莺丝红羲盛静南淑震晴" ..
							"彭祯山霞凝柔隽松翠高骊雅念皓双洛紫瑞英思歆蓉娟波芸荷笑云若宏夏妍嘉彩如鹏寄芝柳凌莹蝶舒恬" ..
							"虹清爽月巧乾勋翰芳罗刚鸿运枫阳葳杰怀悦凡哲瑶凯然尚丹奇弘顺依雪菡君畅白振馨寻涵问洁辉忆傲" ..
							"伟经润志华兰芹修晨木宛俊博韶天锐溪燕家沈放明光千永溶昊梅巍真尔馥莲怜惜佳广香宇槐珺芷帆秀" ..
							"理柏书沛琪仙之竹向卉欣旻晓冬幻和雁淳浩歌荣懿文幼岚昕牧绿轩工旭颜醉玑卓觅叶夜灵胜晗恨流佁" ..
							"乐火音采睿翎萱民画梦寒泽怡丽心石邵玮佑旺壮名一学谷韵宜冰赫新蕾美晖项琳平树又炳骏气海毅敬" ..
							"曦婉爰伯珊影鲸容晶婷林子昌梧芙澍诗星冉初映善越原茂国腾孟水烟半峯莉绮德慈敏才戈梓景智盼霁" ..
							"琇苗熙姝从谊风发钰玛忍婀菲昶可荌小倩妙涛姗方图迎惠晤宣康娅玟奕锦濯穆禧伶丰良祺珍曲喆扬拔" ..
							"驰绣烁叡长雯颖辰慕承远彬斯薇成聪爱朋萦田致世实愫进瀚朝强铭煦朗精艺熹建忻晏冷佩东古坚滨菱" ..
							"囡银咏正儿瑜宝蔓端蓓芬碧人开珠昂琬洋璠桐舟姣琛亮煊信今年庄淼沙黛烨楠桂斐胤骄兴尘河晋卿易" ..
							"愉蕴雄访湛蓝媛骞娴儒妮旋友娇泰基礼芮羽妞意翔岑苑暖玥尧璇阔燎偲靖行瑾资漪晟冠同齐复吉豆唱" ..
							"韫素盈密富其翮熠绍澎淡韦诚滢知鹍苒抒艳义婧闳琦壤杨芃洲阵璟茵驹涆来捷嫒圣吟恺璞西旎俨颂灿" ..
							"情玄利痴蕙力潍听磊宸笛中好任轶玲螺郁畴会暄峻略琼琰默池温炫季雰司杉觉维饮湉许宵茉贤昱蕤珑" ..
							"锋纬渊超萍嫔大霏楚通邈飙霓谧令厚本邃合宾沉昭峰业豪达彗纳飒壁施欢姮甫湘漾闲恩莎祥启煜鸣品" ..
							"希融野化钊仲蔚生攸能衍菁迈望起微鹤荫靓娥泓金琨筱赞典勇斌媚寿喜飇濡宕茜魁立裕弼翼央莘绚焱" ..
							"奥萝米衣森荃航璧为跃蒙庆琲倚穹武甜璐俏茹悌格穰皛璎龙材湃农福旷童亘苇范寰瓃忠虎颐蓄霈言禹" ..
							"章花健炎籁暮升葛贞侠专懋澜量纶布皎源耀鸾慨曾优栋妃游乃用路余珉藻耘军芊日赡勃卫载时三闵姿" ..
							"麦瑗泉郎怿惬萌照夫鑫樱琭钧掣芫侬丁育浦磬献苓翱雍婵阑女北未陶干自作伦珧溥桀州荏举杏茗洽焕" ..
							"吹甘硕赋漠颀妤诺展俐朔菊秉苍津空洮济尹周江荡简莱榆贝萧艾仁漫锟谨魄蔼豫纯翊堂嫣誉邦果暎珏" ..
							"临勤墨薄颉棠羡浚兆环铄" 
	local emailSuffix = {{"vvccb.com"},{"ssnms.com"},{"zzaha.com"}}
	local size = {"6","6.5","7","7.5","8","8.5","9","9.5","10"}
	local rnd1 = math.random(1,#first_names/3)
	local rnd2 = math.random(1,#last_names/3)
	local rnd3 = math.random(1,9)
	local rnd4 = math.random(10,30)
	local rnd5 = math.random(1,#last_names/3)
	local rnd6 = math.random(1,#last_names/3)
	local rnd7 = string.sub(last_names,(rnd1-1)*3+1,(rnd1-1)*3+3)
	local rnd8 = string.sub(last_names,(rnd1-1)*3+1,(rnd1-1)*3+3)
	local adrees = adrreses[math.random(1,#adrreses)][1]
	
	adrees = string.gsub(adrees,"#",rnd3)
	adrees = string.gsub(adrees,"##",rnd4)
	adrees = string.gsub(adrees,"&",rnd7)
	adrees = string.gsub(adrees,"&&",rnd7..rnd8)
	return {
		brithday = "19"..math.random(70,99).."-"..string.format("%02d",math.random(1,12)).."-"..string.format("%02d",math.random(1,30)),
		firstName = string.sub(first_names,(rnd1-1)*3+1,(rnd1-1)*3+3),
		lastName = string.sub(last_names,(rnd1-1)*3+1,(rnd1-1)*3+3),
		email = rndPassWord().."@"..emailSuffix[math.random(1,#emailSuffix)][1],
		password = rndPassWord(),
		avatar = "https://source.unsplash.com/random/20*20",
		nikeShoeSize = size[math.random(1,#size)],
		gender = tostring(math.random(1,2)),
		code = "",
		phone = "",
		adressInfo={
			["code"] = "518000",
			["country"] = "CN", 
			["label"] = "Shipping Address 1",
			["line1"] = adrees,
			["line2"] = adrees,
			["line3"] = "", 
			["locality"] = "深圳市",
			["email"] ="",
			["name"] = {
				["alternate"] ={
					["family"] = "",
					["given"] = "",
				},
				["primary"] ={
					["family"] = "",
					["given"] = "",
				},
			},
			["phone"] = {
				["primary"] ="",
			},
			["preferred"] = "0",
			["province"] = "CN-44",
			["region"]= "罗湖区",
			["type"] = "SHIPPING",
			["zone"] = "罗湖区",
			["email"] = "",
		},
	}
end 

function GetLocalInfo()				--读取本地任务进度
	local info ={}
	info = plist.read(_Path_OldTask)
	return info
end
function getDevInfo() --获取本机信息
	local dev = {}
	dev.name =device.name()
	dev.serial_number =device.serial_number()
	dev.udid =device.udid()
	dev.ip = GetlocalIP()
	return dev
end

function getAcc()
	local info = GetLocalInfo()		--首先查看是否存档任务 
	local dev = getDevInfo() 
	if info ~=nil then  
		if info.Status == '1'  then  
			Showlog("[getacc] is suncess")
		else
			if info.model=="reg" and string.find(device.name(),"reg")==nil then 
				Showlog("[getacc] device is no reg pass")
			else
				return info
			end 
		end
	end 
	os.execute("rm -rf ".._Path_OldTask)
	info = getUserInfo()
	info.Status = '0'  
	info.isReg = false 
	info.isModify = false
	info.isClear = false
	info.isReduction = true 
	info.drawTime = 0
	info.openTime = 0
	SaveInfo(info) 
	for i =1,10 do
		sys.msleep(500)
		if plist.read(_Path_OldTask)~=nil then return info end 
	end
	sys.alert("无法存储任务数据")  lua_exit()
	return info
end 
function PassAcc(info)	--跳过这个帐号
	info.Status = '1' SaveInfo(info)
end
function SaveInfo(info)	   		--保存本地任务进度
	plist.write(_Path_OldTask,info)
end
function _Init()
	--if device.is_screen_locked() == true then s_unlockScreen() end --解锁设备
	s_ClickTSAlertButton()		--点掉错误窗体
	initDevice() 				--初始化设备
	initWebView() 				--初始化浮动窗口
	--editHost() 					--劫持抖音播放数据
	closeApp(_appBid,1) 			--关闭App
	--checkDebIsInstall()
	--VPN_init()					--初始化VPN
	--if device.is_screen_locked() == true then s_unlockScreen() end --解锁设备
	showWebview("初始化完毕")
	------初始化全局变量------  
end
function doMain(info) 
	if info.isClear == false then clearFile() info.isClear = true SaveInfo(info) end 
	if info.isReduction == false then ReductionDataInfo(info) info.isReduction = true SaveInfo(info) end 
	local oldSession = "" 	--场景备份
	local repeatTime = 0	--重复场景计次
	while true do
		if app.front_bid() ~= _appBid then --打开APP 并成功进入界面判断
			showWebview("开启应用") info.openTime = info.openTime+1 SaveInfo(info)
			if info.openTime>=50 then Showlog("[Main] openTime is max",true,false,true) lua_exit() PassAcc(info) return false  end
			runApp(_appBid) sys.msleep(4000)   
		else
			info.openTime = 0 SaveInfo(info)
			local recursiveDescription =  s_viewsinfo() or ""
			if string.find(recursiveDescription,"SNKRS_inhouse.SplashLottieView")==nil then 
				sys.msleep(1000)   
				local vState = s_getVcState(info)
				local session = vState.session
				if session then 
					if session == "dismissView" then  
						showWebview("关闭广告","检查异常:"..repeatTime) sys.msleep(2000)   
					elseif  session == "waitPhone" then 
						showWebview("等待接收手机","检查异常:"..repeatTime) sys.msleep(500)   
						if info.phone == "" then info.phone = DMGetPhone() SaveInfo(info) end 
					elseif  session == "sendPhobe" then 
						showWebview("输入手机","检查异常:"..repeatTime) sys.msleep(500)   
					elseif  session == "clearPhone" then 
						showWebview("清除手机","检查异常:"..repeatTime) sys.msleep(500)   
					elseif  session == "waitMsg" then 
						showWebview("等待短信","检查异常:"..repeatTime) sys.msleep(500)   
						info.code = DMGetMsg(info.phone) SaveInfo(info)
						if repeatTime >= 12 then info.phone = "" SaveInfo(info) return false end 
					elseif  session == "sendMsg" then 
						showWebview("发送短信 ["..info.code.."]","检查异常:"..repeatTime) sys.msleep(500)   
						info.code = "" SaveInfo(info)
						if repeatTime >= 12 then info.phone = "" SaveInfo(info) return false end 
					elseif  session == "error" then 
						showWebview("注册错误") sys.msleep(500) return false 
					elseif  session == "page1" then 
						showWebview("点击注册","检查异常:"..repeatTime) sys.msleep(500)
					elseif  session == "page2" then 
						showWebview("填写个人资料","检查异常:"..repeatTime) sys.msleep(500)
					elseif  session == "page3" then 
						showWebview("电子邮件","检查异常:"..repeatTime) sys.msleep(500)
					elseif  session == "page4" then 
						showWebview("填写出生日期","检查异常:"..repeatTime) sys.msleep(500)
					elseif  session == "none" then 
						showWebview("未知状态","检查异常:"..repeatTime) sys.msleep(1500)
					elseif  session == "loadView" then 
						showWebview("等待加载","检查异常:"..repeatTime) sys.msleep(5000)
					elseif  session == "getProfile" then 
						showWebview("获取个人资料","检查异常:"..repeatTime) sys.msleep(1000)
						local gender = vState.nowinfo.gender or 0
						local addresses = vState.nowinfo.addresses or 0
						local lastName = vState.nowinfo.lastName or ""
						local firstName = vState.nowinfo.firstName or ""
						local nikeShoeSize = vState.nowinfo.nikeShoeSize or "0"
						local avatar = vState.nowinfo.avatar or ""
						local pdata = {}
						if tostring(gender)=="0" then pdata.gender = info.gender end
						if tostring(addresses)=="0" then pdata.adressInfo = info.adressInfo end
						if tostring(lastName)=="" then pdata.lastName = info.lastName end
						if tostring(firstName)=="" then pdata.firstName = info.firstName end
						if tonumber(nikeShoeSize)==0 then pdata.nikeShoeSize = info.nikeShoeSize end
						if tostring(avatar)=="" then pdata.avatar = info.avatar end
						if next(pdata) then
							local s_url = "http://127.0.0.1:9999/modifyinfo"
							local c,h,b = http.tspost(s_url,10,{},json.encode(pdata))
							showWebview("开始修改资料") sys.msleep(8000) 
						else
							info.isModify = true SaveInfo(info)
							showWebview("修改资料完毕","重启App") 
							return false 
						end 
					elseif  session == "clickView" then 
						showWebview("查看商品详情") sys.msleep(5000)
					elseif  session == "drawView" then 
						showWebview("滑动商品") sys.msleep(5000)
						info.drawTime = info.drawTime + 1 SaveInfo(info)
						if info.drawTime >=30 then SetAcc(info,1) return true end 
					elseif  session == "waitView" then 
						showWebview("等待App响应","检查异常:"..repeatTime) sys.msleep(5000)
					else
						showWebview(session) sys.msleep(1000)
					end
					if oldSession == session then repeatTime = repeatTime +1 else repeatTime =0 end 
					oldSession = session
					--[[
						这里是某个一个画面停顿超时的错误触发 没时间写了
					--]]
				end 
			else
				showWebview("等待进入主屏幕") sys.msleep(5000)
			end
		end
	end 
end 
function SetAcc(info,status)	--上传异常数据
	--状态 1/成功,2/禁用,3/异常,4/密码错误 5/有验证码  6/成号
	Showlog("[SetAcc] status = "..status)
	info.Status = '1' SaveInfo(info) 
	if status == 1 then reportAcc(info) end 
end
function reportAcc(info)
	Showlog("[rertMyInfo] postData")
	local pdata = {}
	local ugcPlist,cookies,keychain = backupInfo()
	pdata.username = info.phone
	pdata.password = info.password
	pdata.email = info.email
	pdata.nickname = info.firstName..info.lastName
	pdata.address = info.adressInfo.locality..info.adressInfo.region..info.adressInfo.line1
	pdata.cookies = cookies
	pdata.plist = ugcPlist
	pdata.keychain = keychain
	while true do
		local url = _Api["reportAcoountInfo"] 
		local ret = PostApi(url,pdata)  --更新数据
		if ret.code == 100 then break 
		else sys.alert("[postApi] setAccountInfo code = "..ret.code.." msg = "..ret.msg,4) end 
		sys.msleep(6000)
	end
end
function _TaskMain()
	_Sever = "http://192.168.6.254:6969/api/snkrs/"
	_Api 	={
		["reportAcoountInfo"] 			= _Sever.."reportAcoountInfo",        			--获取任务
	}
	_appBid = 'com.nike.onenikecommerce'  --appBID
	_appDataPath  = appDataPath(_appBid)
	_Path_OldTask		=	userPath().."/res/Nikebackup.txt"  					--任务备份路径
	_Path_Scp			=	userPath().."/lua/myluas/"  							--脚本路径
	if _appDataPath == nil then dialog("未安装Nike客户端") lua_exit() end 
	_Init()
	while true do 
		local _info = getAcc()  
		doMain(_info)
		closeApp(_appBid,1)
	end 
end 
require "Common"
require "Function"
require "Cycript"
_TaskMain()
--Dialog(rndPassWord())

--[[
authorization = [_TtC13SNKRS_inhouse13NikeAPIClient accessToken]

--]]

--[[
local accounts = {}
accounts.cookies  = "Y29vawAAAAMAAAHyAAAAhQAABe4AAAEAAQAAABAAAAAAAAAA4gEAAAAAAAABAAAAAAAAADgAAABFAAAASwAAAE0AAAAAAAAAAAAAAAAAgDwAesJBAACAfGaJwUEubmlrZWNkbi5jb20AX2FiY2sALwAxNjdGNkU4MTNGRjFFOTlEN0JCNUM3MTFERTM1RUM3N34tMX5ZQUFRZmRmU0Z3a1MyYjVzQVFBQThPRVh5UUt6Y3Ftc3MrOUNFbGNzUzJLTiswUkZwSUFCWmZ2bk9kU2gzcEhUdjNud2EzSmsxL281dS90WDh1bDE2TE9mS1U1TjdHWU9FOFZ6a1VzaWRJMVBrRER0MEJoWGloVzdreEg3V25aZFZPQlhGMyswaUo4WlJFZWVRTGpQSThqQ1hOZFBxYWF1azNkRzZCcExLb1NvYUJFVmRGb3pIZDNGSWNHWGhLSjJFcXdXMXlkcGpkT25ndDN5VzlSa3l0SFhiM0NtY2Y3ZVh5TWxEeFU0MHQra3BHcktVcGFOWjdFdk82NUVwd2dkNEJtb0kram5zRFVhL29IV2NnRGtSN2hwblhNeHh6Rm5qVWxNdlgxaFJCbmFHcTZ3UFNZbzdSWWdudGZHQjRYaGl6QVV4NHhYSWpnYk1rYXl5T3RYbVZ0WkhnWHc5ci9mLzgxRlF3PT1+MH4tMX4tMQAAAAEAAQAAABAAAAAAAAAAdQAAAAAAAAAAAAAAAAAAADgAAABGAAAASwAAAE0AAAAAAAAAAAAAAAAAgGuFesJBAACAq+uJwUEudW5zcGxhc2guY29tAHVnaWQALwA1OGEyNjIwYTIyMDc1MjRmZTg0YTU5NmQ0ZmM4OWMzODUyMjI2OTcAAAABAAUAAAAgAAAAigAAAEICAAC+AwAA6gQAAAAAAABqAAAAAAAAAAAAAAAAAAAAOAAAAEIAAABRAAAAUwAAAAAAAAAAAAAAAAAAGjB7wkEAAIBalorBQS5uaWtlLmNvbQBBbmFseXNpc1VzZXJJZAAvADdiNmQyOWJiLjU5MTE1YmU4YzgwNTIAuAEAAAAAAAABAAAAAAAAADgAAABCAAAASAAAAEoAAAAAAAAAAAAAAAAAgPgDesJBAACAOGqJwUEubmlrZS5jb20AX2FiY2sALwA4QkY2NTNCQUJEMkRCNTIwRTczMDhENjQ0QjhCMzE3M34tMX5ZQUFRQm5UQTBweUxDWWhzQVFBQWl3NDF5UUxpakJ6ZytWakFDcmxmcElFWEtHT1ppTXNZZ0s5YVMxc0h4cGF4NWZBSDRLdy9VbERQbXdNbDFFalpNMEJhM25HSTVvU0FoSk1UclhBZWh6d2VQSnNQcmE4T1NQY3ZVYnB4TjQzL2pKRHhHcXBGamprSmV5d0xtL1R4RUZoQWMxaWdidFkwNzBndXZLZEFBbWgrNjRydWZkT0dQTVZuODNYWTZmbW1ERUd6dlFtd1ZtU3c5M1V1UlMvNXlnWEp1ZDVIYjlZcjdBVm1BMkxubVdud1F1T1R2MDBwQ0F3VXA2WGJRQU9wY3pxMElYWUNVbitZSzI5S0RTV1ZkM2w0OWg5YVM4Qk5tMk5kWGZnREFjVEhpQ3VzQUZYeGtBcUdneVlvU2xRPX4tMX4tMX4tMQB8AQAAAAAAAAQAAAAAAAAAOAAAAEIAAABKAAAATAAAAAAAAAAAAAAAAAAA7duKwUEAAADdzYrBQS5uaWtlLmNvbQBha19ibXNjAC8AMURFRkM1OEIzMzJGRkMzNjlDNTU1M0FENTUwMEE4QjJEMkMwNzcxQ0E0MkYwMDAwM0E2NDY1NURFM0U4NzgyRn5wbEczWVgwVWFUU0VkK09OaGRLRSs4VDFQelJXNmk5VkphY0Y5cWZWME1sdCtNczV6SkI1Wk9tYkFuNUFjTEMxeklVdFo4dTlVNnlWYUVzU2t1L0ZxdUJXbm4zeWM0dW1IbTRNbjJ0Z0ZKWm9SZE5lb0NRVktzTHU0QmErVThmZkxYQVV1ZlFXRmovQXlMRU9QcTZ5bjN1N0JUZGFSNWpCMjZpL3dabmw5M2RmOTV6bnBDVWlrcnBVVmJ0cUVEZTJlUVZMOWJSNFpxcHZVcGdBeENXNlppQnhoc0tOaU16bGpWemRobmFWQ2NVOUE9ACwBAAAAAAAABAAAAAAAAAA4AAAAQgAAAEgAAABKAAAAAAAAAAAAAAAAAAD86YrBQQAAAN3NisFBLm5pa2UuY29tAGJtX3N6AC8AMjExODkxNDQwMzkxRjI1OTBCNUM2OEZDMkYyNzE3MEJ+WUFBUUhIZkEwdFR2Lzg5c0FRQUFMSU1QMUFTMisyeGdEZUdDTHBmT1gwektnZmVEZ3hrbTVNUUVtVTlncExjemZPZHYzUFc3VGRLWjFFYUpQUFV4N1JUYW5TTlFCek0ybm5MOGxIUVluMHZrMGNweFk1aFloVDN5V3ltWUZOdGFycDFpVXhzd1RzYjBaNFZib0M0SFdsSVNNVlZzSnpFMnFsdnZiMGxvU1N1TldxcC9Ga1dNbWVsZ2txeEtuZz09AAQBAAAAAAAABAAAAAAAAAA4AAAAQgAAAEgAAABKAAAAAAAAAAAAAAAAAADt24rBQQAAgN3NisFBLm5pa2UuY29tAGJtX3N2AC8ANUJBQzEyN0E0OUZFN0E1QzQyOTM5NTEzRjVENTUwOTh+bTdBaW1RejIyK1MzK3RPY3FyYlVOTTRtbE9LRkhvck83MjZCa1NISWdRYTluQ3I1RDZjQUJ3c0ppYStHb0ZkYSttWHVCT2Q5VmNnVk90ZGtpN0gxd3BvekxPTnk5RjdwR3RxeWtpSExQSUpSN3pmT0RiZDkwNE1nd1ljbndrU2RZNnZhLy9sbmg1WGZhazlnaU5Vc0NBPT0AAACbqwcXIAUAAABLYnBsaXN0MDDRAQJfEBhOU0hUVFBDb29raWVBY2NlcHRQb2xpY3kQAggLJgAAAAAAAAEBAAAAAAAAAAMAAAAAAAAAAAAAAAAAAAAo" 
accounts.plist  =  "YnBsaXN0MDDfED0BAgMEBQYHCAkKCwwNDg8QERITFBUWFxgZGhscHR4fICEiIyQlJicoKSorLC0uLzAxMjM0NTY3ODk6Ozw9Pl9gYWJjZImKjX+foKGio4iliIioqaqrrK2uiLCxdoays7S4iLqIiL2+v8CIwsPExcbHyMnKy3/M6uuIf18QImNvbS5uZXdyZWxpYy5jb25uZWN0aW9uSW5mb3JtYXRpb25fEDVjb20udXJiYW5haXJzaGlwLjlab2M1bTZQUWQ2UDFHYVZqS1lraFEuVUFEZXZpY2VUb2tlbl8QaGNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5jb20udXJiYW5haXJzaGlwLnRhZ19ncm91cHMucGVuZGluZ19jaGFubmVsX3RhZ19ncm91cHNfbXV0YXRpb25zXxA2Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlgtVUEtTWF4LUJhdGNoXxA3c3Rvcnlfa2l0X3Byb2dyZXNzX2JhOWE5NGVjLWFkMTgtMTFlOS1iNjA2LTEyMmQ5YWMyNTFkOV8QJmNvbS5ha2FtYWkuYm90bWFuLmRlZmF1bHRzLnNlbnNvcl9kYXRhXxAjY29tLm5ld3JlbGljLmhhcnZlc3RlckNvbmZpZ3VyYXRpb25VT01DSzFYZGF0YWZpbGVfEBR1c2VyLXByb2ZpbGUtc2VydmljZV8QN3N0b3J5X2tpdF9wcm9ncmVzc19mNTY0YzUzYy1hY2VkLTExZTktYjk4Yi1jZTQwYWE4YzliMjVbV0VJQk9TREtBSURVT01DSzVfEEdjb20udXJiYW5haXJzaGlwLjlab2M1bTZQUWQ2UDFHYVZqS1lraFEuVUFBcHBsaWNhdGlvbk1ldHJpY0xhc3RPcGVuRGF0ZV8QQ2NvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5VQU5hbWVkVXNlckxhc3RVcGRhdGVkVG9rZW5fECtXZWJLaXRMb2NhbFN0b3JhZ2VEYXRhYmFzZVBhdGhQcmVmZXJlbmNlS2V5XxA6Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBQW5hbHl0aWNzRW5hYmxlZF8QF0FEQk1PQklMRV9WSVNJVE9SSURfSURTXxA0Y29tLmZhY2Vib29rLnNkazpGQlNES1NldHRpbmdzTGltaXRFdmVudEFuZERhdGFVc2FnZV8QJ1dlYktpdE9mZmxpbmVXZWJBcHBsaWNhdGlvbkNhY2hlRW5hYmxlZF8QX2NvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5jb207dXJiYW5haXJzaGlwLnRhZ19ncm91cHMudHJhbnNhY3Rpb25fcmVjb3Jkcy5tYXhfYWdlXxA7Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlgtVUEtTGFzdC1TZW5kLVRpbWVfEEhjb20udXJiYW5haXJzaGlwLjlab2M1bTZQUWQ2UDFHYVZqS1lraFEuY29tLnVyYmFuYWlyc2hpcC5saWJyYXJ5X3ZlcnNpb25aQURNU19TVEFSVFVPTUNLMl8QIEFET0JFTU9CSUxFX1NUT1JFRERFRkFVTFRTX0FQUElEXxAcQURCTU9CSUxFX1BFUlNJU1RFRF9NSURfQkxPQl8QJEFET0JFTU9CSUxFX1NUT1JFRERFRkFVTFRTX0lHTk9SRUFJRF8QNmNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5YLVVBLU1heC1Ub3RhbF8QWmNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5VQUluQXBwUmVtb3RlRGF0YUNsaWVudC5TY2hlZHVsZWROZXdVc2VyQ3V0b2ZmVGltZVVPTUNLNl8QP2NvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5YLVVBLU1pbi1CYXRjaC1JbnRlcnZhbF8QMGNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5kZXZpY2VJZF8QFkFEQk1vYmlsZUxhc3RUaW1lc3RhbXBfEDJjb20udXJiYW5haXJzaGlwLjlab2M1bTZQUWQ2UDFHYVZqS1lraFEuVUFQdXNoVGFnc18QN2NvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5sYXN0LXVwZGF0ZS1rZXlfECJXZWJLaXRTaHJpbmtzU3RhbmRhbG9uZUltYWdlc1RvRml0XxAwV0JTREtTdGF0aXN0aWNzTWFuYWdlckxhc3RVcGxvYWRTdWNjZXNzVGltZXN0YW1wXxBJY29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBUHVzaENoYW5uZWxDcmVhdGlvbk9uRm9yZWdyb3VuZF8QRWNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5VQVB1c2hFbmFibGVkU2V0dGluZ3NNaWdyYXRlZF8QSmNvbS51cmJhbmFpcnNoaXAuOVpvYzVtNlBRZDZQMUdhVmpLWWtoUS5VQUFwcGxpY2F0aW9uTWV0cmljc0xhc3RBcHBWZXJzaW9uXxBDY29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLnJlbW90ZWRhdGEuUkVGUkVTSF9JTlRFUlZBTF8QHUFET0JFTU9CSUxFX1NUT1JFRERFRkFVTFRTX09TXxAzY29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLnBheWxvYWQta2V5VU9NQ0s3XxAcQURCTU9CSUxFX1ZJU0lUT1JJRF9TWU5DVElNRVpBRE1TX1BBVVNFXxA+Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBTmFtZWRVc2VyQ2hhbmdlVG9rZW5fEEZjb20udXJiYW5haXJzaGlwLjlab2M1bTZQUWQ2UDFHYVZqS1lraFEuVUFVc2VyUHVzaE5vdGlmaWNhdGlvbnNFbmFibGVkXxAzY29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBQ2hhbm5lbElEXxA1Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBTmFtZWRVc2VySURfEBxBREJNT0JJTEVfUEVSU0lTVEVEX01JRF9ISU5UXxAXQURCTU9CSUxFX1ZJU0lUT1JJRF9UVExfECJjb20ubmV3cmVsaWMuYXBwbGljYXRpb25JZGVudGlmaWVyXxAXQURCTU9CSUxFX1BFUlNJU1RFRF9NSURfEDdzdG9yeV9raXRfcHJvZ3Jlc3NfOGZiMGJiMzItYjc0OC0xMWU5LTk3N2UtMjYxMmM4MTY4Y2E0XxASQURNU19MaWZlY3ljbGVEYXRhXxA5Y29tLnVyYmFuYWlyc2hpcC45Wm9jNW02UFFkNlAxR2FWaktZa2hRLlVBQ2hhbm5lbExvY2F0aW9uXxAUV2ViRGF0YWJhc2VEaXJlY3RvcnlfEBtDQU1Vc2VyUHJlZmVyZW5jZURpZE1pZ3JhdGVfEDdzdG9yeV9raXRfcHJvZ3Jlc3NfN2MwOWFmNjYtYjI4Zi0xMWU5LThhNTAtNGVhN2Q3MWQ4YWYy0j9AQVhfEC1jb20ubmV3cmVsaWMuY29ubmVjdGlvbmluZm9ybWF0aW9uLmRldmljZWluZm9fEDJjb20ubmV3cmVsaWMuY29ubmVjdGlvbmluZm9ybWF0aW9uLmFwcGxpY2F0aW9uaW5mb9pCQ0RFRkdISUpLTE1OT1BMVVZXVF8QImNvbS5uZXdyZWxpYy5kZXZpY2VpbmZvLnJlZ2lvbmNvZGVfEB5jb20ubmV3cmVsaWMuZGV2aWNlaW5mby5vc25hbWVfECFjb20ubmV3cmVsaWMuZGV2aWNlaW5mby5hZ2VudE5hbWVfEB1jb20ubmV3cmVsaWMuZGV2aWNlaW5mby5tb2RlbF8QHGNvbS5uZXdyZWxpYy5kZXZpY2VpbmZvLm1pc2NfECNjb20ubmV3cmVsaWMuZGV2aWNlaW5mby5jb3VudHJ5Q29kZV8QJGNvbS5uZXdyZWxpYy5kZXZpY2VpbmZvLm1hbnVmYWN0dXJlcl8QIWNvbS5uZXdyZWxpYy5kZXZpY2VpbmZvLm9zdmVyc2lvbl8QIGNvbS5uZXdyZWxpYy5kZXZpY2VpbmZvLmRldmljZWlkXxAkY29tLm5ld3JlbGljLmRldmljZWluZm8uYWdlbnRWZXJzaW9uUFNpT1NYaU9TQWdlbnRZaVBob25lNywy0lFSU1RYcGxhdGZvcm1fEA9wbGF0Zm9ybVZlcnNpb25WTmF0aXZlVTYuNC4xWkFwcGxlIEluYy5UMTIuNF8QJDcyRDk2OUY1LTcyMUMtNDRCRi04NjRBLTM4QUZCQTRBOTA4MNNZWltcXV5fEBxjb20ubmV3cmVsaWMuQXBwSW5mby5hcHBOYW1lXxAfY29tLm5ld3JlbGljLkFwcEluZm8uYXBwVmVyc2lvbl8QHWNvbS5uZXdyZWxpYy5BcHBJbmZvLmJ1bmRsZUlkXVNOS1JTLWluaG91c2VWMy4xMy4zXxAYY29tLm5pa2Uub25lbmlrZWNvbW1lcmNlXxBAMjU4YWM2NTI2NzM5YTQzMTdiNWE2OThhMzNiZDIwNWU5NTI2NGFjOTVhMDE3NmQxMzExYjZiMjY5NmQxNzMyYk8Q7GJwbGlzdDAw1AECAwQFBhQVWCR2ZXJzaW9uWCRvYmplY3RzWSRhcmNoaXZlclQkdG9wEgABhqCjBwgNVSRudWxs0gkKCwxaTlMub2JqZWN0c1YkY2xhc3OggALSDg8QEVokY2xhc3NuYW1lWCRjbGFzc2VzXk5TTXV0YWJsZUFycmF5oxASE1dOU0FycmF5WE5TT2JqZWN0XxAPTlNLZXllZEFyY2hpdmVy0RYXVHJvb3SAAQgRGiMtMjc7QUZRWFlbYGt0g4ePmKqtsgAAAAAAAAEBAAAAAAAAABgAAAAAAAAAAAAAAAAAAAC0EgAH0AAQAl8RC/8xLGkscXlnc2tLbUZLRE1TZU95UjMrdkNtUUVGV2lXRklpazNxN0xjdVNTWHFLWGFxNEtJbWtEeFNPTklySjZaUTdiOEV6cVlDSUdjOEVYVm1TL1AxSmRSOFNzWUltWEVXZE9IVzNISWprTzBDeXBPbEUyOHkzK0dtc3kxS2M5RlBLbkx3aHpwYTNubVNQWks4U3cxSnRWRHZDeTlTcTllNzc5OEpmTUU2T1JieEdVPSxlTzY3bnVMRFNUMVdsR0pabnU1RlQrbExYbGlSWFErdXBRRWlOQkEvaHNwYWJjNkpjaE9STmxPQVBwRWpGalhmS0l5TVFINnRLeGwycGY4TG1WbW1NK1VOcjhHUER3WXR0YnF3Z1lWeFNnL2RxZnNvT0hDTWdScUxPaTd0RXptcmREUTF5N3l2M010QTFKcytvb1psNHdlWmRIMkJZdVZLSWpUb3ZVZXBWck09JEtOSm03RStPcjNSWWlxWVpYV3RCbVYyN3lwWktlUm1idG5JUW1aQjhtdGtqMERyR2NpenZDbHdjVHZOaVd2SFNZNXE2OER1dHdKbzdqaU1aWHFVNTZrSzY0ekdFditOR3R5QkRwbXM0WEZjR2FwTnNRK2JqMjJHRTFpaUNvU1JxYlU1M3ppTXZHeTJuVTJJY3VCS1ptUXV5a3h2UWFJZmRwbFY1K3RFeGJ0VzBwRE96QWkyOEFBSFczNEJuQ3hFeHBSTUZCYUh1YWhSZXlmNXlhWCtPNWpxaVhDc1c2Z2tCb05ZTEVGTThway9pcFRlMExJVnMvc2NYQ0J6dWlubHJudloxR0JNTGFFeDZPMnoyZHpjQmxmMDZwNGRnSFNYMjliUzVSUDZUZUxRZjJaMllES2R4MHJWQ1lSUUlTb3RrUkptMStRZ3J6RXRTTHlrcnNrdmhJbDFVdEpQZTBDVW16ZmdHSjlSSGVjT3laWkplRVpvZEpLY1cvbkFTSnNTK05YWkpNbEF3YTEzQldIaSt0VHR4dHFlREE0OWEySTM3dytwS0JPZnVSY2MrQUxXak0xaHFKcHJ6aEp6OWQ5M2tnaElhQ2c4Mm1kTWJqYTU4RlhkdlEyNElvUGtOa1lId1ZxbnZFV2lmQlZkb1d2UWVzRXcydUxzZlZqOHBvZXZndWpvTE0vTG93MTc1c0Qra3RwUDgvVTZ4MjZENWx5aWlBaHF6NjBYQ2F3TDR4a3UyQlYvbk13KzdQQWFPTzNqWDRXd0dmTmJQdUxlb3VCOTk5RnY5enFzYTRRZEd6RlVreFkwbHppR2NWdStWNHpKNThYWDB0aERNN0hQSFNMQ0FiMFIveUNCTlNvSzdKYktoY2xMVUJoZld2djliNmpnS0RlaFdMRkVxMklPK1luV3NaMW9XYkxNTnE1WmV3NjhWK3JtazEyOXlNU2s3Z0FMY1pOc1ZZdmhpU2xHcHgwZi9vQTRWMGxCQ29OV09HNlVQWmFGejRlWnpvZ3psb1k1c1VySjdOeW5Wcm9LNkkwdnNNeWZSQXVzd3lyMnhkODkrYiszVW9rWVd4RU5sdGRldmlyd0JRNVNqUFB2alRHK3JOUWZIL0RWZkhCS0tkWHVPYVlZQnY5aVBrMzdLOHhkTmZoSjhNSlhnb0lkYUc3NXJEZ0g3amc1ZkkyVUNDdFZmenBtSzltaVNRVmtVN1kxeTJQYzk4YzhpRzMxMEw0OEV1bnlTcXphKzViQk43YW5nQlFqL3pjTk1DK0FSU0tuVXdqa2NrVkk0dzdsVVpVdEhYVHhKVEpXTTd3M1VWa3diQ1IzazUzR3MxZXRSb2h0Vm9QcEZBT0NFNUEwU0FmbWtBbDQ5NGJBMGdxdFNpeGwvRmlGOEs5SisvdmxmMWcvSzVXUWVXS1hsZEV2aGt0TzgraVh0Kys4enZLd0kvang1eHNTWHFnM21HREhnNHdjaDVYYVNUWXdvUFkySitSTjBBZzlqeTdVM2FIbDFOWkZoZC9LbzNLaWh0dnA3N3FadCtRQTdKRjRFc2pmQWR4Snl1WFVncDZmb3A3Sk5sV00yeUpzbGg4d1hrZHV4eFFaOTI4MUN3N0hXNEpFMDRYL2pMejdGdyt3aVJuWEdRb3RjNVRVRHYwd2tEdkllU1U2c3IxcUFXWTNsb2hwc1VvaXNHc2duRTlJaTNhdUNoWVR2TWd3ZU0wTUZSL2RKZXMxbXozQzlFYVIwNGhBUzVPblJzL2tQekg2bC9RaEg5NXNTZWxEZm53Zk5wRlc3UEo4T2hrQ3kxanc4b0ZrNWFDRDNPRjRCQWFraHoza3MwUTVRWm1iQXhJZXpZcjlmQ3dlQ05sUzlDYnllRkdlU2ZWTTZyVERIVzBsR0tta3FyZXQxZ2N3Q2ZxUmJaQ0hWemw4OWQ3M1FBRHA2UVdodnNKNTlpNnVzN3hiTkE1OFZnT2VQQ1g2Z0p1OHpFSks0ZU56NUJQRU16MmZFdEw4TnNtc21PVzdNSHNkOXVaeVdwMkQydDBJNDdYTnVEdHA4clRWK0F3blZ1MnpiL3hDV091RUorNlE5Q01SK1lkL3NSM1I0R2hLUFBXYnhWcEFhUEU1THJZdUhybktEY3BMemRseVF5SGFYdCtPR1Jqa1ZSUWFLa3J4VWo3eGNmQzcvK1N4dlBxWDBiS2tLRk5vUGhKZG9JZ1E0b0dRc3FnSkV5elBCR3RQT3N1MUxRNXUweHdGU2dLbm5DdW1ZUmppUXFzQXNWai9CSU4wdm9PcDJyL2MzYXVMdmZUOFhkR0wya1UxWE9zdEh5ZkNidDh1dGw1dlV1Tk02SEEzRGpnT2F4VlJKa0Q3dWp1WmF3TzYyMFFJVmtEczZBSGJ1eXNpd2dvN1lMNlYzV2dWdUx1Qnp3bm9qQkdzN1ljYUh2Q2ZiTXBrK2pTN2NLUTAzUGdzOVkvUVlmV2VPQlZhWWgzVGFFbUE0QmhWOVo0dElTVDFOSVNQM25GT3lZK2dneDc1ek45bmp5eE44SWVvRkIrMnBDQkxSYnRRd21QKzU0RVNRZ2FFRWEvcWtBVzdVaGxmU1pyck5QRkJnczA0ZlU1QjVDMGtIVTFYYU9WRjJOb2xUWnB0MGJXazVPeFdrVTZXQUM0RloySUgycXEvK2hYOTRWUUQ4cGdxaTRGcE4wYjdSZ0M2U0NPdmNrZWFIQnQybmg5a0d2VGU4cDcwcUR0NWZ2UDZoelhHcVZKUjdWdnA5WlJFRDZFZ0tOd1RpMHQwVms1SHovUyt2V1o2WmhMOWl1QjkyOXhySG93eW9tSHk3M3VuWDFHcW9tQU5aNjZpbmk1UlFvaDM0bGtYd0QwemE2TTNXNDFINDdsZDNoR3VCQVpFTnJQUk83UkdrTEtGOWIxR093NTNpUllrVGlrbk4yMmtYY3FidnNTa3JpQUJpRFp2VW1manlNMFEzUldkQXZuTnR1VGE0bEJvMWVqWWIyYUY0NVFXZGttOG0vNFZNbkt4eHQ5dXljK2E0R1F0eHJ4Q3dtWURhU0p1TmhZQkc0T25JUC9QU0RXMDI2YW1qOEFKZzc4YWFaV0Jodm5IVEp6WjNGMnBPamMyNjV5aEhhUVJiTEhCK2tBVWgrUmhJWkl0QVBDUDIvM2NUZGpRcGg0SFpwaXhJamhsYzdLejRCUFloNFZ5V1luWWlsSENEOXBCM1VXdWp1cENkTmNON2Qzc0xOT083RWhGQXR3d0s4aGttWTNzeHJBcktsTHVESExmR09vckRUZVRGSkFMSjFZdEZvZ3NkUHZ2ZmV2ZjlnWUh2L2syMkJ6eU45OXpORTJIeU03UjNHbXFSUUJCMlhjdC9aOU56QVdrNGZPKzdqdWI2YnVKcFdGTlQ5MlIyMnNZdTI1V1RoZ2w4VXNWWUFYN29TS0dibDNmN0VacENoYmZEN0gxZjZHcVlabmVIWDZhR0JEV2hnZHBIVWVMMklWS2NzdElwT2MydktQVGFLVXpjMXErVVByWnlHem5VUThva1YvZDFaWHM2cm9NYjk3eHNKaWhEQ3FqM0dFaEQ4bUFLYVUvV2w1REViYTRYVVdvNnMzdmYzc2pxME5pU0JOMEttUFQrdmc9PSQ0NCwxNiw1ON8QEWVmZ2hpamtsbW5vcHFyc3R1dnd4eXp7fH1+gYKEhYZih4hbZXJyb3JfbGltaXRfEBBzZXJ2ZXJfdGltZXN0YW1wXmFwcGxpY2F0aW9uX2lkXxAeYWN0aXZpdHlfdHJhY2VfbWluX3V0aWxpemF0aW9uXxAQY3Jvc3NfcHJvY2Vzc19pZF8QF2FjdGl2aXR5X3RyYWNlX21heF9zaXplXxATcmVzcG9uc2VfYm9keV9saW1pdFxlbmNvZGluZ19rZXlaYXRfY2FwdHVyZV8QHHJlcG9ydF9tYXhfdHJhbnNhY3Rpb25fY291bnRaZGF0YV90b2tlbl8QGnJlcG9ydF9tYXhfdHJhbnNhY3Rpb25fYWdlXxARc3RhY2tfdHJhY2VfbGltaXRfEBJkYXRhX3JlcG9ydF9wZXJpb2RfECBhY3Rpdml0eV90cmFjZV9tYXhfc2VuZF9hdHRlbXB0c1phY2NvdW50X2lkXxAWY29sbGVjdF9uZXR3b3JrX2Vycm9ycxAyEl1hX2ASAhgO5iM/0zMzMzMzM18QGFZRWUdWRjVTQ0JBRFVWQlJCZ0FHVmc9PRH//xEIAF8QKGQ2N2FmYzgzMGRhYjcxN2ZkMTYzYmZjYjBiOGI4ODQyM2U5YTFhM2Kif4AQAaARA+iieIMSD/rC9xECWBBkEDwSAA+AAgkzQcGIy3GXRvbRi4xfEBZRRG45YWV3QmZhWVUxUEhyM3hTZ3RBXxAdV2VkLCAzMSBKdWwgMjAxOSAxNDo1ODoyOCBHTVTSjo+QmF8QIGEwYWM3OWIzNDM5NzRhNWFiYTIzMmQyMjNmZDllZTAzXxAkQzcxNTAxMTYtNjM3RC00Q0U5LThDMjEtRjQ0NjFDMkE5QjdE0pGSjpNXdXNlcl9pZF8QFWV4cGVyaW1lbnRfYnVja2V0X21hcNGUlVsxNDM3OTA0MDA3NtGWl1x2YXJpYXRpb25faWRbMTQzNzI5NjA1ODbSkZmPml8QFWV4cGVyaW1lbnRfYnVja2V0X21hcNGbnFsxNDM3OTA0MDA3NtGdnlx2YXJpYXRpb25faWRbMTQzNzI5NjA1ODZfEDIwMUE4RmpBSEljMnJma3hrbkppZEZiM2JfT1UybWVkS05wMEF3LUhkMGNRVE9pUE5nLjNBwYqNqyCKnDNBwYsNx7xXGV8QJEFBNkJBMjNDLTZENTItNDY0My04MEMwLUVENEQzMTExODdFQV8QWy92YXIvbW9iaWxlL0NvbnRhaW5lcnMvRGF0YS9BcHBsaWNhdGlvbi82NEI0QjQ0NS1FM0JDLTQ5NDUtOTM3Qi1DMjVGNUU2Q0VENUMvTGlicmFyeS9DYWNoZXMJXxA/JmRfY2lkX2ljPURTSURfMjA5MTUlMDFCODVGMkZDRi1FODEwLTRFQ0EtOTE5Qi05QjI0QTBEMzNBQTIlMDExCQkjQLBoAAAAAAAzQcGLDc9u/ahWMTAuMC4wM0HBio2tn3U7VTYxMTEwXxAcU05LUlMtaW5ob3VzZSAzLjEzLjMgKDYxMTEwKV8QNDZHMXluWWNMUHVpUXhZWnJzel9wa3FmTEc5eU1YQnBiMnpYNWR2SmRZUUp6UFhJbWRqMHkJEgBQAAAzQcGIy3FkEkBfECRFNUNGN0JERi05QjE5LTQwMDYtODRCNC0xOTU2NEFDQ0JEMzISXWUO8qO1trdfEBBTTktSU19aSF9IQU5TX0NOWWxvZ2dlZF9pbllpbnN0YWxsZWQzQcGKib2w0AMJI0HXWXkDxtMgCQlWMy4xMy4zEABYaU9TIDEyLjRPEQFneyJjaGFubmVsIjp7Im9wdF9pbiI6ZmFsc2UsImxvY2FsZV9jb3VudHJ5IjoiQ04iLCJzZXRfdGFncyI6dHJ1ZSwibG9jYWxlX2xhbmd1YWdlIjoiemgiLCJ0aW1lem9uZSI6IkFzaWFcL1NoYW5naGFpIiwiYmFja2dyb3VuZCI6dHJ1ZSwicHVzaF9hZGRyZXNzIjoiMjU4YWM2NTI2NzM5YTQzMTdiNWE2OThhMzNiZDIwNWU5NTI2NGFjOTVhMDE3NmQxMzExYjZiMjY5NmQxNzMyYiIsInRhZ3MiOlsiU05LUlNfWkhfSEFOU19DTiIsImxvZ2dlZF9pbiIsImluc3RhbGxlZCJdLCJkZXZpY2VfdHlwZSI6ImlvcyJ9LCJpZGVudGl0eV9oaW50cyI6eyJkZXZpY2VfaWQiOiJFNUNGN0JERi05QjE5LTQwMDYtODRCNC0xOTU2NEFDQ0JEMzIifX0JIk66ysgzQcGKozkz4JNfECRBQTZCQTIzQy02RDUyLTQ2NDMtODBDMC1FRDREMzExMTg3RUEIXxAkZTJhNTQwNjktMTNkMS00ZjRhLWJiODItY2MwNGFkMzUzZWMyXxAgYTBhYzc5YjM0Mzk3NGE1YWJhMjMyZDIyM2ZkOWVlMDNSMTEiSROoAF8Qf1NOS1JTLWluaG91c2UsMy4xMy4zLGNvbS5uaWtlLm9uZW5pa2Vjb21tZXJjZSxpT1MsMTIuNCxBcHBsZSBJbmMuLGlQaG9uZTcsMixpT1NBZ2VudCw2LjQuMSw3MkQ5NjlGNS03MjFDLTQ0QkYtODY0QS0zOEFGQkE0QTkwODBfECYxNTkzNzYzMDE3OTIxMjk0NjgzMjY1ODQyOTUyNTYyMTg4MzExNd8QD83Oz9DR0tPU1dbX2Nna29zd3t/g4eLj5OXmT+fo6VthLk9TVmVyc2lvbl8QE2EuRGF5c1NpbmNlRmlyc3RVc2VcYS5DcmFzaEV2ZW50XWEuQ2Fycmllck5hbWVcYS5SZXNvbHV0aW9uXGEubHR2LmFtb3VudFZhLmFkaWRbYS5Ib3VyT2ZEYXlXYS5BcHBJRFthLkRheU9mV2Vla11hLkxhdW5jaEV2ZW50XGEuRGV2aWNlTmFtZVphLkxhdW5jaGVzXxASYS5EYXlzU2luY2VMYXN0VXNlWGEubG9jYWxlWGlPUyAxMi40UTJaQ3Jhc2hFdmVudFYobnVsbClYNzUweDEzMzQjAAAAAAAAAABfECRCODVGMkZDRi1FODEwLTRFQ0EtOTE5Qi05QjI0QTBEMzNBQTJSMTZfEBxTTktSUy1pbmhvdXNlIDMuMTMuMyAoNjExMTApUTNbTGF1bmNoRXZlbnRSNTBRMFV6aC1DTl8QVWh0dHBzOi8vZGV2aWNlLWFwaS51cmJhbmFpcnNoaXAuY29tL2FwaS9jaGFubmVscy9lMmE1NDA2OS0xM2QxLTRmNGEtYmI4Mi1jYzA0YWQzNTNlYzJfEFsvdmFyL21vYmlsZS9Db250YWluZXJzL0RhdGEvQXBwbGljYXRpb24vNjRCNEI0NDUtRTNCQy00OTQ1LTkzN0ItQzI1RjVFNkNFRDVDL0xpYnJhcnkvQ2FjaGVzCQAIAIUAqgDiAU0BhgHAAekCDwIVAh4CNQJvAnsCgQLLAxEDPwN8A5YDzQP3BFkElwTiBO0E8wUWBTUFXAWVBfIF+AY6Bm0Ghga7BvUHGgdNB5kH4QguCHQIlAjKCNAI7wj6CTsJhAm6CfIKEQorClAKagqkCrkK9QsMCyoLZAtpC5kLzgvjDAgMKQxNDG0MjAyyDNkM/Q0gDUcNSA1MDVUNXw1kDW0Nfw2GDYwNlw2cDcMNyg3pDgsOKw45DkAOWw6eD40Pkg+UG5cbvBvIG9sb6hwLHB4cOBxOHFscZhyFHJAcrRzBHNYc+R0EHR0dHx0kHSkdMh1NHVAdUx1+HYEdgx2EHYcdih2PHZIdlB2WHZsdnB2lHagdwR3hHeYeCR4wHjUePR5VHlgeZB5nHnQegB6FHp0eoB6sHq8evB7IHv0fBh8PHzYflB+VH9cf2B/ZH+If6x/yH/sgASAgIFcgWCBdIGYgjSCSIJYgqSCzIL0gxiDHINAg0SDSINkg2yDkIk8iUCJVIl4ihSKGIq0i0CLTItgjWiODI6QjsCPGI9Mj4SPuI/skAiQOJBYkIiQwJD0kSCRdJGYkbyRxJHwkgySMJJUkvCS/JN4k4CTsJO8k8ST3JU8lrQAAAAAAAAIBAAAAAAAAAO0AAAAAAAAAAAAAAAAAACWu" 
accounts.keychain = file.reads("/var/mobile/Media/keychain.txt")
ReductionDataInfo(accounts) --还原数据 
dialog("end")
--]]
--info = getUserInfo()
--reportAcc(info)
--[[
local infos = {
	["adressInfo"] = info.adressInfo
}
local s_url = "http://127.0.0.1:9999/modifyinfo"
pdata = json.encode(infos)
local c,h,b = http.tspost(s_url,10,{},pdata)
dialog(c)
if c == 200 then dialog(b) end 
--]]
