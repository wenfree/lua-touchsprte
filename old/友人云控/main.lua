--微信养号
require("TSLib")
require("tsp")
require("Api")
require("UI4")

--[[
token = '/User/Media/TouchSprite/res/token.txt'
if isFileExist(token)then
	token_table = readFile(token)
	login = token_table[1]
	password = token_table[2]
	for i,v in pairs(token_table)do
		nLog(v)
	end
	if get_config()~=true then
		delFile(token)
	end
else
	require("UI")
	login = retTable[2]
	password = retTable[3]
	if get_config()then
		writeFile(token,login.."\n"..password,"w")
	else
		toast(datas.message,1)
		toast('名下'..login,10)
		delay(10)
		lua_exit()
	end
end
--]]

require("UI")
login = retTable[2]
password = retTable[3]
if get_config()then
	--writeFile(token,login.."\n"..password,"w")
else
	toast(datas.message,1)
	toast('名下'..login,10)
	delay(10)
	lua_exit()
end


----------------------------脚本开始-------------------------------
function click(x,y,times)
	times = times or 2
--	log("准备点击("..x..","..y..")")
	touchDown(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(50)
	touchUp(1, x+math.random(-3,3), y+math.random(-3,3))
	mSleep(1000*times)
end
--------------------------------------

--[[
设置几点开启 = 8
设置几点睡觉 = 23

腾讯新闻 = true
站街打招呼 = false
站街打招呼时间 = 6 * 60 * 60 * 1000 
接受朋友验证 = false
添加通讯录好友 = false

设置在线时间 = 30
设置休息时间 = 30
--]]

app = 'com.tencent.xin'
Tencent = '/User/Media/TouchSprite/res/腾讯新闻.txt'
Data = '/User/Media/TouchSprite/res/日期.txt'

if file_exists(Data)~=true then
	writeFile(Data,os.date('%Y-%m-%d'),'w')
	EeveyData = os.date('%Y-%m-%d')
else
	EeveyData = (readFile(Data))[1]
	log('Data-->'..EeveyData)
end
if file_exists(Tencent)~=true then
	writeFile(Tencent,0,'w')
	NewsState = 0
else
	NewsState = tonumber((readFile(Tencent))[1])
	log('NewsState-->'..NewsState)
end
-----------界面设置------------
m={}
m.back = { 0xffffff, "", 90, 11, 52, 66, 116}
m.chat = { 0x1aad19, "", 80, 58, 885, 104, 925}
m['mic']={{585,167,0xc5c5c5},{584,167,0xffffff},{598,167,0xffffff},}
m.腾讯新闻 = { 0xffd801, "38|-19|0x2fb046,25|0|0x00a4e3,25|28|0xe50a13", 90, 8, 215, 129, 861}
	m.腾讯新闻页面 = { 0xffffff, "", 90, 591, 66, 605, 81}
	m.腾讯新闻标题 = { 0x000000, "", 90, 94, 522, 454, 904}
	m['腾讯新闻内容']={ 0xffffff, "8|0|0x0c0c0c,17|0|0xffffff,25|0|0x0c0c0c,33|0|0xffffff", 90, 561, 72, 620, 94}
	m.腾讯新闻详情页右上角三点 = { 0xffffff, "14|0|0x232327,23|0|0xffffff,39|0|0xffffff", 90, 567, 78, 613, 89}--4s
	m.腾讯新闻分享 = { 0xfa5452, "5|33|0x00b1fe,-8|41|0x66d020,-28|14|0xffc817", 90, 185, 407, 284, 745}
	m.腾讯新闻发送 = { 0x20d81f, "", 90, 567, 71, 618, 95}
	m.腾讯新闻发送完成 = { 0xf5cc20, "20|-11|0x3eab4a,14|2|0x1890c0,18|16|0xdd2626", 90, 12, 133, 81, 199}
	m.腾讯影视logo = { 0xfbfef9, "-5|0|0x84d715,-13|0|0xff9503,33|1|0x2fa9fa", 90, 14, 145, 114, 237}
	
m.自动接受朋友验证 = { 0xff3b30, "", 90, 258, 871, 274, 899} 	--有验证提示
	m['通讯录页面']={{607,85,0xffffff},{602,99,0xffffff},{607,99,0x403f44},}
	m['通讯录页面4']={{365,69,0xffffff},{367,69,0x111112},{615,85,0xf4f4f4},}
	m.通讯录好友点 = { 0xf43530, "", 90, 523, 270, 622, 372}
	m.通讯录新的朋友 = { 0xfa9d3b, "", 90, 32, 246, 85, 296}
	m['通讯录新的朋友页面']={{610,73,0xffffff},{610,75,0x38373d},{610,79,0xefeff0},{608,80,0x3a393e},}
	m.新朋友页面 = { 0x1aad19, "17|-17|0x1aad19,31|4|0x1aad19,20|36|0x1aad19", 90, 149, 175, 426, 346}
	m.通讯录接受 = { 0x1aad19, "", 90, 483, 143, 637, 953}

m.站街发现 = { 0x7a7e83, "4|-3|0xf8f8f8,6|-6|0x7a7e83", 90, 387, 890, 408, 907}
	m.站街发现激活 = { 0x1aad19, "3|6|0xf7f7f8,6|4|0x1aad19,11|9|0x1aad19", 90, 388, 889, 412, 912}
		m.站街提示_知道了 = { 0x49c146, "", 90, 284, 756, 362, 774}
		m.站街提示_有人加 = { 0x1aac19, "-75|-3|0x19ad1b,93|-41|0x1aaa15,308|1|0x1aac19", 90, 94, 719, 546, 835}
		m['附近的人有_有提示']={{620,147,0x999999},}
		m.站街被人加了提示 = { 0x1aac19, "-114|-328|0x0faeff", 90, 182, 348, 552, 846}
	m.站街附近的人 = { 0x10aeff, "-10|10|0x10aeff,31|10|0x10aeff,28|32|0x10aeff,10|7|0xffffff", 90, 12, 137, 99, 859}
	m['站街附近的人页面']={{374,68,0xffffff},{374,82,0x121212},{374,95,0x121213},{387,95,0xffffff},}
	m['站街详细资料'] = {{385,68,0xffffff},{384,75,0xffffff},{382,75,0x121212},{377,71,0xffffff},{579,84,0x121213},}
	m.站街打招呼 = { 0x1aad19, "0|-45|0x249f23,0|-46|0xefeff4,-51|-6|0x1aad19,-54|-6|0xefeff4", 90, 8, 390, 170, 939}
	m.打招呼发送界面={0x111112, "2|0|0xffffff,60|0|0x111112,64|-3|0xffffff,92|11|0xffffff", 90, 254, 60, 381, 113}
	m.站街输入了文字 = { 0x0c0c0c, "", 90, 50, 249, 91, 285}
	
	
m.回复置顶的人 = { 0xf43530, "-5|0|0xf3f3f7,20|21|0xf43530,20|25|0xf3f3f7", 98, 80, 211, 130, 300}
	m.回复置顶对话页面 = { 0x7f8389, "21|0|0x7f8389,21|12|0x7f8389,84|9|0x7f8389", 90, 493, 877, 634, 949}
	m.回复语音转文字 = { 0x7f8389, "20|0|0x7f8389,9|-1|0x7f8389,5|-17|0x7f8389", 90, 8, 896, 54, 928}
	m.回复置顶发送 = { 0x087dfe, "", 90, 508, 891, 606, 938}
	m.回复输入文字 = { 0x7f8389, "6|-1|0xf5f5f6,19|-1|0x7f8389,14|-14|0x7f8389,14|13|0x7f8389", 90, 6, 312, 79, 959}
	
m.添加通讯录绿色 = { 0x1aad19, "", 90, 212, 894, 258, 923}
	m.添加通讯录新的朋友按钮 = { 0xffffff, "-32|-25|0xfa9d3b,35|42|0xfa9d3b", 90, 8, 202, 107, 853}
	m.添加通讯录_右上角红点 = { 0xf43530, "-2|-31|0xf43530,15|-16|0xf43530", 90, 533, 276, 637, 383}
	m.添加通讯添加人页面 = { 0x1aad19, "4|-55|0x1aad19,20|-24|0xffffff,-8|-25|0x1aad19", 90, 277, 224, 363, 319}
	
	--直接进入通讯录加人
	m.添加通讯录好友_手机图标 = {0x1aad19, "8|1|0xffffff,22|1|0x1aad19,5|-51|0x1aad19", 90, 285, 228, 350, 320}
	m.添加通讯录手机联系人 = { 0x71d01d, "-15|9|0x71d01d", 90, 20, 256, 85, 316}
	m.添加通讯录朋友_添加 = { 0x1aad19, "0|-16|0x26a125", 95, 558, 178, 603, 959}
	m.添加通讯录_发送 = { 0x1ec91d, "", 90, 564, 74, 609, 93}

m.发朋友圈绿色 = {  0x1aad19, "", 90, 372, 874, 430, 927}
	m.朋友圈图标 = {  0x66d020, "10|-3|0x00b1fe,7|-28|0xfa5452,-13|-16|0xffc817", 90, 14, 143, 96, 251}
	m.朋友圈左发现 = { 0xffffff, "", 90, 11, 62, 46, 104}
	m.未选择相册 = { 0xc7c7cc, "11|10|0xc7c7cc,0|21|0xc7c7cc,0|10|0xffffff", 90, 592, 171, 609, 198}
	m.朋友圈相机图标 = { 0xffffff, "-17|-13|0xffffff,-12|-13|0xffffff", 90, 570, 69, 598, 86}
		m.朋友圈纯文字提示 = { 0x238e2b, "-4|0|0xffffff", 90, 290, 847, 344, 870}
		m.第一次发图文提示 = { 0x1aad19, "", 90, 271, 655, 298, 678}
		m.允许访问相册 = { 0x007aff, "1|-3|0xf4f4f4,5|-4|0x007aff", 90, 450, 572, 467, 585}
		m.朋友圈视频编辑 = { 0x16a425, "", 80, 558, 861, 601, 884}
		m.朋友圈视频完成 = { 0x18a317, "", 90, 561, 894, 594, 911}
		m.朋友圈视频完成2 = { 0x13ae24, "", 80, 557, 906, 607, 926}
		m.朋友圈这一刻想法 = { 0xaaaaaa, "", 90, 47, 160, 112, 181}
	m.朋友圈之发送 = { 0x20d81f, "", 90, 556, 66, 622, 101}
	
m.公众号扫一扫 ={ 0x10aeff, "-7|-9|0xffffff,-16|-23|0x10aeff", 90, 22, 305, 102, 365}
	m['公众号扫一扫界面']={{101,181,0x1aad19},{538,183,0x1aad19},{537,619,0x1aad19},{101,619,0x1aad19},}
	m['公众号照片']={{333,81,0x121213},{331,79,0xffffff},{342,69,0xffffff},}
	m.公众号完成 = { 0x1aad19, "", 90, 551, 52, 603, 76}
	m.公众号有结果={{57,73,0xffffff},{57,76,0x121112},{57,92,0xffffff},{77,92,0xffffff},{80,92,0x121213},}
	m.公众号关注 = { 0xffffff, "0|-4|0x1aad19,0|-9|0xf1faf1", 90, 208, 362, 423, 948}

--------------------------------------------------------------------
function Follow()
	setp = 1
	outTime = os.time()
	
	clearAllPhotos()	--请空相册
	mSleep(500)
	local_pic = '/User/Media/TouchSprite/res/follow.png'
	downFile(tasks.task.pic,local_pic)
	saveImageToAlbum(local_pic)
	mSleep(2000)
	
	while os.time() - outTime < 5 * 60 do
		if setp == 1 then
			if f_p(m.发朋友圈绿色,"发现激活")then
				setp = 2
			else
				click(408,913)
			end
		elseif setp == 2 then
			if done(m['公众号扫一扫界面'],'公众号扫一扫界面')then
				setp = 3
			elseif c_pic(m.公众号扫一扫,'公众号扫一扫')then
			end
		elseif setp == 3 then
			if f_tu('关注公众号成功',541, 49,636, 122)then
				toast('已经关注过的公众号',10)
				mSleep(1000* 10)
				return true
			elseif done(m.公众号有结果,'公众号有结果')then
				setp = 4
			elseif done(m['公众号扫一扫界面'],'公众号扫一扫界面')then
				c_pic({ 0xfbfbfb, "0|-9|0xffffff", 90, 567, 68, 614, 91},'相册')
			elseif done(m.公众号照片,'公众号照片')then
				if c_pic({ 0xc7c7cc, "0|-10|0xffffff,9|-10|0xc7c7cc", 90, 579, 164, 615, 209},'相机胶卷')then
					click(72,186)
				end
			elseif c_p(m.公众号完成,'公众号完成')then
				toast('查询公众号二维码',8)
				delay(10)
			end
		elseif setp == 4 then
			if f_tu('关注公众号成功',541, 49,636, 122)then
				return true
			elseif c_pic(m.公众号关注,'公众号关注')then

			else
				moveUp(319,781,285,462)
			end
			
		end
		mSleep(1000 * 1)
		log(setp)
	end
	closeX(app)
end

function PoFriend()
	mSleep(200)
	outTime = os.time()
	setp = 1
	down_file = true
	while os.time()-outTime < 120 do
		if setp == 1 then
			if f_p(m.发朋友圈绿色,"发现激活")then
				setp = 2
			else
				click(408,913)
			end
		elseif setp == 2 then
			if f_p(m.朋友圈左发现,"朋友圈左-->发现按钮")and f_pic(m.朋友圈相机图标,"相机图标")then
				setp = 3
			elseif c_pic(m.朋友圈图标,"朋友圈图标")then
			end
		elseif setp == 3 then
			Po_type = tasks.task.type
			
			if f_p(m.朋友圈之发送,"朋友圈之发送")then
				setp = 4
			elseif Po_type == "发朋友圈---纯文字" then

				if f_pic(m.朋友圈纯文字提示,'朋友圈纯文字提示')then
					click(323,863)
				else
					touchDown(1,589,85)
					mSleep(3000)
					touchDown(1,589,85)
					mSleep(3000)
					if f_pic(m.朋友圈纯文字提示,'朋友圈纯文字提示')then
						delay(2)
						click(323,863)
					end
				end
				input(tasks.task.content)
				
			elseif Po_type == "发朋友圈---图文" then
				clearAllPhotos()	--请空相册
				delay(0.5)
				if down_file then
					for i,v in ipairs(tasks.task.pic_urls)do
						pic_name_table = split(v,'.')
						pic_tye = pic_name_table[#pic_name_table]
						new_pic = i..'.'..pic_tye
						nLog(new_pic)
						local_pic = '/User/Media/TouchSprite/res/'..new_pic
						downFile(v,local_pic)
						saveImageToAlbum(new_pic)
						mSleep(2000)
					end
					down_file = false
				end
				------------------------------------------------------
				if c_pic(m.朋友圈相机图标,'朋友圈相机图标')then
					c_p(m.第一次发图文提示,'第一次发图文提示')
					mSleep(1000)
					click(322,803)	--从手机相册取
					mSleep(2000)
					if c_pic(m.允许访问相册,'允许访问相册')then
						mSleep(2000)
					end
					c_pic(m.未选择相册,"未选择相册")	--从手机相册取
					
					相册位置={{127,169,0xffffff},{285,169,0xffffff},{443,169,0xffffff},{601,169,0xffffff},
						{127,327,0xffffff},{285,327,0xffffff},{443,327,0xffffff},{601,327,0xffffff},{127,485,0xffffff},}
					for i,v in ipairs(相册位置)do
						click(v[1],v[2])
						if i == #tasks.task.pic_urls then
							break
						end
					end
					click(578,915) -- 完成
					mSleep(5000)
					if c_p(m.朋友圈这一刻想法,'朋友圈这一刻想法')then
						input(tasks.task.content)
					end
					
				end			
			elseif Po_type == "发朋友圈---视频" then
				clearAllPhotos()	--请空相册
				delay(0.5)
				if down_file then
					local_pic = '/User/Media/TouchSprite/res/'.. 1 ..'.mp4'
					downFile(tasks.task.video_url,local_pic)
					saveVideoToAlbum("1.mp4")
					mSleep(2000)
					down_file = false
				end
				------------------------------------------------------
				if c_pic(m.朋友圈相机图标,'朋友圈相机图标')then
					delay(1)
					c_p(m.第一次发图文提示,'第一次发图文提示')
					mSleep(1000)
					click(322,803)	--从手机相册取
					mSleep(2000)
					if c_pic(m.允许访问相册,'允许访问相册')then
						mSleep(2000)
					end
					c_pic(m.未选择相册,"未选择相册")	--从手机相册取
					
					视频位置={{127,169,0xffffff},}
					click(视频位置[1][1],视频位置[1][2])
					delay(3)
					
					if c_p(m.朋友圈视频编辑,'朋友圈视频编辑')then
						mSleep(3000)
						c_p(m.朋友圈视频完成,'朋友圈视频完成')--完成
						toast('等待视频压缩',10)
						mSleep(10000)
					elseif c_p(m.朋友圈视频完成2,'完成')then
						delay(3)
						c_p(m.朋友圈视频完成2,'完成')
						toast('等待视频压缩',10)
						delay(10)
					end
					
					if c_p(m.朋友圈这一刻想法,'朋友圈这一刻想法')then
						input(tasks.task.content)
						log('输入完成')
					end
					
				end
			end
		elseif setp == 4 then
			if f_pic(m.朋友圈相机图标,"朋友圈相机图标")then
				toast('发朋友圈成功',1)
				return true
			else
				c_pic(m.朋友圈之发送,"朋友圈之发送")
				mSleep(5*1000)
			end
		end
		mSleep(500)
		nLog(setp)
		mSleep(500)
	end
	closeX(app)
end

function AddBook()
	upNtimes = 1
	setp = 1
	outTime = os.time()
	while os.time() -outTime < 20 * 60 do
		if setp == 1 then
			if f_p(m.添加通讯录绿色,"通讯录激活")then
				setp = 2
			else
				click(235,915)
			end
		elseif setp == 2 then
			if c_pic(m.添加通讯录好友_手机图标,"手机图标")or c_pic(m.添加通讯录手机联系人,'添加通讯录手机联系人')then
				setp = 3
			elseif c_pic(m.添加通讯录新的朋友按钮,"新的朋友按钮")or c_p(m.添加通讯录_右上角红点,'右上角红点')then
			end
			add_n = 1
		elseif setp == 3 then
			if add_n >= tonumber(tasks.task.num) then
				toast('通讯录加人成功',3)
				return true
			end
			
			if c_pic(m.添加通讯录朋友_添加,"添加按钮")then
				upNtimes = 1
			elseif f_p(m.添加通讯录_发送,"发送")then
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(tasks.task.words[math.random(1,#tasks.task.words)])
				if c_p(m.添加通讯录_发送,"发送")then
					add_n = add_n + 1
					delay(5)
				end
			else
				upNtimes = upNtimes + 1
				moveUp(319,781,285,462)
				if upNtimes >= 5 then
					toast("人加完了",5)
					return true
				end
			end
		end
		nLog(setp)
		mSleep(1000)
	end
	closeX(app)
end	

function ReplyTop()
	if f_pic(m.回复置顶的人,"置顶的新消息")~=true then
		return false
	end
	setp = 1
	outTime = os.time()
	while os.time()-outTime <= 60 do
		if setp == 1 then
			if f_pic(m.回复置顶对话页面,'回复置顶对话页面')then
				setp = 2
			elseif c_pic(m.回复置顶的人,"置顶的新消息") then
			end
		elseif setp == 2 then
			if c_pic(m.回复置顶发送,'回复置顶发送')then
				mSleep(1000)
				return true
			elseif c_pic(m.回复语音转文字,'回复语音转文字')then
				input(myRand(7,math.random(10,50),1))
				mSleep(2000)
				click(320,917)
			elseif f_pic(m.回复输入文字,'回复输入文字')then
				click(x+50,y)
				input(datas.config.chat_words[math.random(1,#datas.config.chat_words)]..'#ENTER#')
				
				mSleep(2000)
				click(320,917)
			end
		end
	end
	closeX(app)
end

function SendTop()
	setp = 1
	outTime = os.time()
	while os.time()-outTime <= 60 do
		if setp == 1 then
			if f_pic(m.回复置顶对话页面,'回复置顶对话页面')then
				setp = 2
			else
				if c_tu(page['首页']['电脑已经登录'],false)then
					click(309,374)
				else
					click(257,277)  --点击回复
				end
			end
		elseif setp == 2 then
			if c_pic(m.回复置顶发送,'回复置顶发送')then
				mSleep(1000)
				return true
			elseif c_pic(m.回复语音转文字,'回复语音转文字')then
				input(myRand(7,math.random(10,50),1))
				mSleep(2000)
				click(320,917)
			elseif f_pic(m.回复输入文字,'回复输入文字')then
				click(x+50,y)
				input(datas.config.chat_words[math.random(1,#datas.config.chat_words)]..'#ENTER#')
				
				mSleep(2000)
				click(320,917)
			end
		end
	end
	closeX(app)
end
	

function AllowFriend()
	setp = 1
	outTime = os.time()
	
	if f_p(m.自动接受朋友验证,'自动接受朋友验证')~=true then		--有新加好友信息
		return false
	end
	
	while os.time() - outTime <= 60 do
		if setp == 1 then
			if done(m['通讯录页面'],'通讯录页面')or done(m['通讯录页面4'],'通讯录页面4')then
				setp = 2
			elseif c_p(m.自动接受朋友验证,'自动接受朋友验证')then		--有新加好友信息
			end
		elseif setp == 2 then
			if done(m.通讯录新的朋友页面,'通讯录新的朋友页面')or f_pic(m.新朋友页面,"新朋友页面4")then
				setp = 3
			elseif c_p(m.通讯录好友点,'通讯录好友点') or c_p(m.通讯录新的朋友,'新的朋友')then
			end
		elseif setp == 3 then
			if f_p(m.通讯录接受,'通讯录接受')then
				click(x+15,y+15)
				log('接受一次')
				mSleep(5000)
				c_p(m.back,"back")
			else
				return true
			end
		end
		mSleep(1000)
	end
	closeX(app)
end

function News()
	setp = 1
	outTime = os.time()
	while (true) do
		if setp == 1 then
			if f_p(m.腾讯新闻页面,'腾讯新闻页面')then
				setp = 2
			elseif c_pic(m.腾讯新闻,'腾讯新闻')then		--点击图标
			end
		elseif setp == 2 then
			if f_pic(m['腾讯新闻内容'],'腾讯新闻内容')or f_pic(m.腾讯新闻详情页右上角三点,"详情页面")then
				setp = 3
			elseif c_pic(m.腾讯新闻标题,'腾讯新闻标题')then		--点击标题
				delay(10)
			end
		elseif setp == 3 then
			if f_p(m.腾讯新闻发送,'腾讯新闻发送')then
				setp = 4
			elseif c_pic(m.腾讯新闻分享,'腾讯新闻分享')then
				delay(3)
			else
				click(589,82)
			end
		elseif setp == 4 then
			if f_pic(m.腾讯新闻发送完成,'腾讯新闻发送完成')or f_pic(m.腾讯影视logo,"腾讯影视logo")then
				return true
			elseif c_p(m.腾讯新闻发送,'腾讯新闻发送')then
			end
		end
		if os.time() - outTime >= 60 then
			toast('腾讯新闻超时',5)
			return false
		end
		mSleep(1000)
	end
	closeX(app)
end


--------微信主循环---------------
function GPS(lx,ly)
	if lx == nil or ly == nil then
		return
	end
	tab = {}
	tab[app] = { lat = lx, lon = ly }
	fakeGPS(tab)
	return true
end

function all()
	setting = os.time()
	if get_config() then
		
		if datas.config.position ~= '' then
			position_list = split(datas.config.position,',')
			lx = tonumber(position_list[2]+math.random(-0.00009999,0.00009999))
			ly = tonumber(position_list[1]+math.random(-0.00009999,0.00009999))
		end
		if GPS(lx,ly) then	--微信定位
			while os.time() - setting <= 1 * 60 do
				
				work_time_h = tonumber(os.date("%H"))
				work_time_m = tonumber(os.date("%M"))
				work_time_s = tonumber(os.date("%S"))
				---计算时间
				Work = true
				WorkTime = WorkTime or os.time()
				
				NowTime = work_time_h * 60 + work_time_m
				start_time_t = split(datas.config.start_time,':')
				StatrTime = tonumber(start_time_t[1])*60 + tonumber(start_time_t[2])
				end_time_t = split(datas.config.end_time,':')
				EndTime = tonumber(end_time_t[1])*60 + tonumber(end_time_t[2])
				nLog(StatrTime..'-'..NowTime..'-'..EndTime)
				
				if NowTime >= StatrTime and NowTime <= EndTime then
					trueWorkTime = os.time() - WorkTime
					nLog('trueWorkTime-->'..trueWorkTime)
					if trueWorkTime <= tonumber(datas.config.work_minutes)*60 then
						Work = true
						RestTime = os.time()
					else
						Work = false
						trueRestTime = os.time() - RestTime
						nLog(trueRestTime)
						if Work == false and  trueRestTime > tonumber(datas.config.rest_minutes)*60 then
							Work = true
							WorkTime = os.time()
						end
					end
					if Work then	--工作时间
						nLog('工作时间')
						if EeveyData ~= os.date('%Y-%m-%d') then
							EeveyData = os.date('%Y-%m-%d')
							NewsState = 0
							writeFile(Data,os.date('%Y-%m-%d'),'w')
							writeFile(Tencent,0,'w')
						end
						
						if active(app)then
							delay(5)
						elseif OK()then
							if datas.config.repost_news and NewsState == 0 then  --转发 腾讯新闻
								if News()then
									NewsState = 1
									writeFile(Tencent,1,'w')
								end
							else
								nLog('今天已经发过了新闻')
							end
							taskTime = taskTime or os.time()
							if os.time() - taskTime > 5 then
								nLog('每60秒查一次任务')
								if get_task() then
									tasks_list = split(tasks.task.type,'---')
									nLog(tasks_list[1])
									task_type = tasks_list[1]
									
									if task_type == '发朋友圈' then
										if OK() and PoFriend() then	--发朋友圈
											up_Task('yes')
										else
											up_Task('no')
										end
									elseif task_type == '附近的人打招呼' then
										if OK() and getV1()then
											up_Task('yes')
										end
									elseif task_type == '添加好友' then
										if tasks.task.phones[1] == nil then
											return true
										end
										if string.len(tasks.task.phones[1]) > 11 then
											if OK and add_V1()then
												up_Task('yes')
											end
										else
											addbook1()
										end
										
									elseif task_type == '关注公众号' then
										if OK() and Follow()then
											up_Task('yes')
										end
									end
								else
									nLog('暂时没有任务')
								end
							end
							if OK()and datas.config.agree_friend then
								AllowFriend()
							end
							SendTime = SendTime or os.time()
							sentT = tonumber(datas.config.auto_chat_step)
							if OK() and datas.config.auto_chat_to_first and os.time() - SendTime > 60 * sentT then
								toast('主动给置顶好友发消息',1)
								SendTop()
								SendTime = os.time()
							end
							if datas.config.auto_reply_first_chat then
								ReplyTop()	--回复置顶好友
							end
						end
					else
						toast('休息时间',10)
						closeApp(app)
						mSleep(12* 1000)
					end
				else
					toast('睡眠时间(每60秒查询一次关闭微信)',58)
					closeApp(app)
					mSleep(60 * 1000)		--每120秒执行一次关闭微信
				end
				mSleep(2 * 1000)
			end
		else
			toast('请先设置定位',30)
			mSleep(30*1000)
		end
		
	else
		toast('正在养号',2)
		mSleep(3000)
		mSleep(5 * 1000)
	end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 60)
		mSleep(1000)
		closeApp(frontAppBid())
		closeX(app)
		mSleep(2000)
	end
end






















