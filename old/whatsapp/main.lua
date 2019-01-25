require("tsp")
require("UI")




page={}
page['首页']={}
page['首页']['对话灰']={{452,1087,0x929292},{458,1085,0xf7f7f7},{458,1081,0x929292},}
page['对话']={}
page['对话']['对话激活']={{433,1077,0x007cff},{462,1079,0xf7f7f7},{470,1077,0x007cff},}
page['对话']['编写按钮']={ 0x007cff, "14|0|0xf7f7f7,18|-2|0x007cff", 90, 540, 46, 615, 118}
page['对话']['新建对话']={{366,78,0x000000},{363,80,0xf8f8f8},{361,80,0x000000},}
page['对话']['搜索']={ 0x8e8e93, "0|-18|0x929297,0|-8|0xffffff", 90, 265, 151, 306, 193}
page['对话']['搜索按钮']={ 0xffffff, "-14|0|0x007aff,-30|0|0x007aff", 90, 496, 1064, 625, 1121}
page['对话']['结果界面']={{503,83,0xffffff},{503,71,0x8e8e93},{542,67,0xc9c9ce},}
page['对话']['点击人员']={ 0x000000, "3|0|0x000000", 90, 108, 212, 455, 292}
page['对话']['对话界面']={{22,81,0x007cff},{492,81,0x007cff},{494,81,0xf7f7f7},}
--page['对话']['对话界面']={{574,73,0x007cff},{20,84,0x007cff},}							--适应ios7.0.1
page['对话']['已经发过']={ 0xdcf8c6, "43|-67|0xdcf8c6,235|-62|0xdcf8c6", 90, 132, 144, 631, 530}
page['对话']['已经发过图片']={ 0xc2b7a9, "2|18|0xf3f1ee,2|38|0xf3f0ed,2|60|0xc2b6a8,44|25|0xdcf8c6", 90, 6, 136, 631, 535}
page['对话']['发送飞机']={ 0xffffff, "0|-28|0x007cff,0|32|0x007cff,29|2|0x007cff", 90, 532, 469, 636, 700}
page['对话']['无结果']={{370,446,0xcccccc},{362,449,0xfdfdfd},{361,449,0xcccccc},{327,449,0xcccccc},}


page['相册']={}
page['相册']['+号']={ 0x007cff, "0|-17|0x007cff,0|17|0x007cff,17|-1|0x007cff", 90, 5, 443, 110, 1131}
page['相册']['弹窗灰']={{207,0,0x949494},{416,0,0x949494},}
page['相册']['照片和视频资料库']={ 0x007cff, "49|3|0x007cff", 90, 138, 673, 499, 748}
page['相册']['所有照片']={{22,83,0x007cff},{374,71,0x191919},{612,84,0x007cff},}
page['相册']['相机胶卷']={ 0x007cff, "86|1007|0x007cff,28|1017|0x007cff", 90, 5, 35, 149, 1134}
page['相册']['7个位置']={{70,206,0xe4731d},{237,204,0x655c59},{407,205,0xf0d09f},
	{556,207,0x161813},{84,379,0x2a292f},{238,373,0xf9c677},{385,367,0x94201b},}
page['相册']['发送']={ 0xffffff, "21|0|0x007cff,-7|-36|0x007cff,-8|34|0x007cff", 90, 533, 988, 625, 1088}


function send_pic_football(i)
	计时 = os.time()
	超时 = 60
	发送 = false
	
	
	while (true) do
		if 发送 and c_pic(page['相册']['+号'],'+号')then
			return true
		elseif c_pic(page['相册']['+号'],'+号',true)then
		elseif done(page['相册']['弹窗灰'],'弹窗灰') and c_pic(page['相册']['照片和视频资料库'],'照片',true) then
		elseif c_pic(page['相册']['相机胶卷'],'相机胶卷',false)then
		
			if 发图模式 == "0" then
				random_pic_mun = math.random(1,8)
				click(page['相册']['7个位置'][random_pic_mun][1],page['相册']['7个位置'][random_pic_mun][2])
			elseif 发图模式 == "1" then
				click(page['相册']['7个位置'][i][1],page['相册']['7个位置'][i][2])
			elseif 发图模式 == "2" then
				random_pic_mun = pic_lun%7 + 1
				click(page['相册']['7个位置'][random_pic_mun][1],page['相册']['7个位置'][random_pic_mun][2])
				pic_lun = pic_lun + 1
			end
		elseif c_pic(page['相册']['发送'],'发送',true)then
			delay(math.random(5,10))
			if c_pic(page['相册']['+号'],'+号')then
				click(x+100,y)
			end
			发送 = true
		end
		if os.time()-计时 > 超时 then
			return
		end
	end
end

function send_message(phone_mun)
	计时 = os.time()
	超时 = 60
	发内容 = true
	可以发内容 = true
	发图位置 = math.random(1,5)

	while os.time()-计时 < 超时 do
		if active(app,3)then
		elseif done(page['首页']['对话灰'],'对话灰',1,true) then
		elseif done(page['对话']['对话激活'],'对话激活')then
			if c_pic(page['对话']['编写按钮'],'编写按钮',true)then
				log('新建对话',true,3)
			end
		elseif done(page['对话']['新建对话'],'新建对话')then
			if c_pic(page['对话']['搜索'],'搜索',true)then
				input(phone_mun)
				c_pic(page['对话']['搜索按钮'],'搜索按钮',true)
			end
		elseif done(page['对话']['结果界面'],'结果界面')then
			if c_pic(page['对话']['点击人员'],'点击人员',true)then
				delay(5)
				可以发内容 = false
			elseif done(page['对话']['无结果'],'无结果')then
				click(570,76)
				return false
			end
		elseif done(page['对话']['对话界面'],'对话界面')then

			if 可以发内容 then
				click(24,84)
			else
				if 发内容 and (c_pic(page['对话']['已经发过'],'已经发过',false)or c_pic(page['对话']['已经发过图片'],'发过图片'))then
					click(24,84)
					toast("已经发过返回",2)
					return false
				end

				for i = 1,3 do
					input('\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b')
					input(text[i][math.random(1,#text[i])])
					delay(1)
					c_pic(page['对话']['发送飞机'],'发送飞机',true)
					delay(3)
					send_pic_football(发图位置)
					发图位置 = 发图位置 + 1
					delay(5)
					
					delay(oneTime)
				end

				return true
			end
		else
			log('other~~')
		end
		delay(1)
	end
	closeX(app)
end


app='net.whatsapp.WhatsApp'
phone_path = '/var/mobile/Media/TouchSprite/lua/phone.txt'
day = '/var/mobile/Media/TouchSprite/lua/whatApp' ..os.date("%Y-%B-%d-").. '.txt'
if file_exists(day) then
	OK = tonumber(readFile(day)[1])
	toast("已经发送了".. OK,3)
else
	writeFile(day,1,"w")
	OK = tonumber(readFile(day)[1])
	toast("已经发送了".. OK,3)
end
delay(2)
phone_list = readFile(phone_path)
toast("预计"..#phone_list.."人次\n-----3秒后开始",3)
delay(3)

text ={}
text[1] = split(UI[2],'|')
text[2] = split(UI[3],'|')
text[3] = split(UI[4],'|')
oneTime = UI[5]
allTime = UI[6]
发图模式 = UI[7]
发送数量 = tonumber(UI[8])
nLog("发图模式"..发图模式)
pic_lun = 7

if OK == 0 then
	OK = 1
	writeFile(day,OK,"w")
end

for i= OK,#phone_list do
	nLog(phone_list[i])
	if send_message(phone_list[i])then
		delay(allTime)
		OK = OK + 1
		writeFile(day,OK,"w")
	end
	if OK > 发送数量 then
		toast("任务完成",30)
		return
	end
end

dialog("发送完成", 0)
















































