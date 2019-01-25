require("TSLib")
require("tsp")
require("name")
require("api")
require("UI")
require("ocr")
--log(frontAppBid())

init('0',0)
arr={}
arr.bid="com.tencent.xin"

arr.newsbid={}
arr.newsbid['快头条']="com.ifeng.ifengnews1"
arr.newsbid['东方头条']="com.gaoxin.EastNewsAppstore"
arr.newsbid['悦头条']="com.cgap.yueduxiaobao"
arr.newsbid['唔哩头条']="com.caishi.app.Cronus"

arr.qtt={}
arr.dftt={}
arr.qutt={}
arr.ddqw={}
arr.yuett={}


t={}
require("快头条")
require("东方头条")
require("悦头条")
require("唔哩头条")


function wechat_send_time()
	sendTime = sendTime or (os.time())
--	sendTime = sendTime or (os.time()-60*60)
	if os.time() - sendTime >= 60*60 then
		send_key = true
		return true
	else
		send_key = false
	end
end
----------------首页------------------
t['微信菜单']={{60,1086,0x7e8287}, {247,1096,0x7a7e83}, {398,1097,0x7a7e83}, {559,1096,0x7a7e83}, {559,1092,0x1aad19}, }
t['微信菜单_搜索icon']={ 0x8f8f94, "-8|-18|0x919196,-8|-19|0xffffff,-8|-41|0xefeff4,-8|-57|0xefeff4", 90, 242, 116, 310, 237}
t['微信菜单_聊天位置']={{261,305,0xf4f4f8}, {247,448,0xf4f4f8}, {247,578,0xffffff}, {228,692,0xffffff}, }

----------------replay----------------
t['微信菜单_信息红点']={ 0xf4f4f8, "0|-14|0xf43530,11|-29|0xf43530,-4|-44|0xf43530,13|-29|0xf4f4f8", 90, 89, 239, 161, 1037}
t['微信聊天界面']={ 0x7f8389, "-1|-1|0xf5f5f7,-88|4|0x7f8389,-88|3|0xf5f5f7,-83|-8|0x7f8389", 90, 476, 387, 637, 1134}
t['微信聊天界面_空格']={ 0x000000, "-1|-14|0x010101", 90, 258, 1066, 445, 1123}
t['微信聊天界面_发送']={ 0xffffff, "-13|-23|0x007aff", 90, 501, 1058, 622, 1123}


t['微信_back']={ 0xffffff, "14|-15|0xffffff,14|15|0xffffff", 90, 11, 50, 90, 115}

function wechat_send()
	local TimeLs = os.time()
	while (os.time() - TimeLs < 30 ) do
		if d('微信菜单_信息红点',true)then
		elseif d('微信聊天界面')then
			log("x,y("..x..","..y)
			click(x-200,y,1)
			input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			local retext = replay_txt[rd(1,#replay_txt)]
			input(retext..zfc[rd(1,#zfc)]..zfc[rd(1,#zfc)])
			if d('微信聊天界面_空格',true)then
				input("\b")
				if d('微信聊天界面_发送',true)then
					delay(rd(3,10))
					sendTime = os.time()
					return true
				end
			end
		else
			log("onthing")
			d("微信_back",true)
		end
		log("send---")
		delay(rd(100,200)/100)
	end
end

function wechat_replay()
	local TimeL = os.time()
	while (os.time() - TimeL < 30 ) do
		if d('微信菜单_信息红点',true)then
		elseif d('微信聊天界面')then
			log("x,y("..x..","..y)
			click(x-200,y,1)
			input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			local retext = replay_txt[rd(1,#replay_txt)]
			input(retext..zfc[rd(1,#zfc)]..zfc[rd(1,#zfc)])
			if d('微信聊天界面_空格',true)then
				input("\b")
				if d('微信聊天界面_发送',true)then
					delay(rd(3,10))
					return true
				end
			end
		else
			d("微信_back",true)
		end
		log("relpay---")
		delay(rd(100,200)/100)
	end
end


function wechat_play()
	if active(arr.bid,5)then
		if d("微信_back",true)then
		elseif tab('微信菜单',true,1)then
			if d('微信菜单_搜索icon')then
				wechat_send_time()
				if send_key then
					local rd_key = rd(1,2)
					click(t['微信菜单_聊天位置'][rd_key][1],t['微信菜单_聊天位置'][rd_key][2])
					wechat_send()
				elseif d('微信菜单_信息红点',false)then
					wechat_replay()
				end
			else
				click(width/2,20)
			end
		end
	end
	delay(rd(100,200)/100)
end

--path = appDataPath(arr.newsbid['快头条']); 
--dialog(path)		

api.wechat()
----kuaitoutiao()


--dongfangtoutiao()
----wulitoutiao()
--yue_toutiao()
--lua_exit()

arr.workTime = 60*3
arr.work_key = true
arr.work_Time_line = os.time()
arr.rest_time = 60*5
arr.rest_key = false
arr.rest_time_line = os.time()


function main()
while (true) do

	if os.time() - arr.work_Time_line <= arr.workTime then
		arr.work_key = true
		arr.rest_time_line = os.time()
--		arr.rest_time = rd(500,800)
		log("微信工作时间")
		log('-------------- ' .. os.time() - arr.work_Time_line)
		log(arr.work_Time_line)
	else
		if os.time()- arr.rest_time_line <= arr.rest_time then
			arr.work_key = false
			log("微信休息时间")
		else
			arr.workTime = rd(1,5)*60
			arr.work_Time_line = os.time()
			arr.work_key = true
		end
	end

	local H = tonumber(os.date("%H"))
	if H >= 0 and H <= 23 then
		if setting[0] and arr.work_key then
			log("微信聊天时间",true)
			if setting[0] then 
				wechat_play()
			else
				arr.workTime = 0
			end
		else
			log("微信休息,执行其它任务",true)
			
--			kuaitoutiao()	快头条注销
			if setting[1] then dongfangtoutiao() end
			if setting[2] then wulitoutiao() end
			if setting[3] then yue_toutiao() end
			
			for k,v in ipairs(arr.newsbid)do
				closeApp(v)
				log("例行休息",true)
				delay(rd(3,5))
			end
		end
	else
		if frontAppBid() == arr.bid then
			closeApp(arr.bid)
			log("例行休息",true)
		end
		delay(15)
	end
	delay(1)
end
end

while (true) do
	local ret,errMessage = pcall(main)
	if ret then
	else
		dialog(errMessage, 15)
		mSleep(2000)
	end
end



























