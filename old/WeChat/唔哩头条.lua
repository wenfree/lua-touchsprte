
if t == nil then
	t={}
end
t['唔哩头条首页界面'] = { 0xfad42c, "24|10|0xfccc19,171|24|0xb7bed1,338|32|0xcfd3e0,488|21|0xbcc2d4", 90, 33, 1039, 624, 1133}
	t['唔哩头条首页界面_找到文章'] = { 0x181818, "69|-1|0x181818,169|-4|0x1b1b1b", 90, 12, 488, 285, 1029}
t['唔哩头条任务界面'] = {  0xfbcc19, "-159|-11|0xc5cada,-306|9|0xc1c6d7,166|14|0xbdc3d5", 90, 22, 1051, 604, 1130}
	t['唔哩头条任务界面_开宝箱'] = { 0xf8dd03, "-21|0|0x482804,-49|0|0xffe403,-71|1|0x381709", 90, 251, 213, 403, 273}
	t['唔哩头条任务界面_签到'] = {0xffed00, "34|19|0xa76e01,124|2|0xf3db00,279|8|0xffed00", 90, 97, 403, 545, 927}
	t['唔哩头条任务界面_任务做完'] = { 0x999999, "-9|-20|0xededed,-14|-280|0xb5b5b5,96|-278|0x767676,106|-251|0x8d8d8d", 90, 192, 153, 469, 491}

t['唔哩头条阅读界面'] = { 0xb9bcc5, "-9|13|0xadb1bb,32|14|0xa9adb8,522|7|0x5d6479,528|9|0xffffff", 90, 23, 72, 606, 93}
	t['唔哩头条阅读界面_阅读全文']={ 0xffd614, "-136|-4|0xffe202,-5|-39|0xfed712,100|37|0xffce1f", 90, 197, 150, 437, 974 } --多点找色
	t['唔哩头条阅读界面_视频播放']={ 0xafafaf, "-2|0|0xf9f9f9,-39|-153|0xffd441", 90, 1, 463, 64, 657 } --多点找色

t['唔哩头条tips_去做任务'] = { 0xffffff, "73|-138|0xfb3d4a,73|-182|0xfffb96,-11|-531|0xfae220", 90, 69, 173, 567, 861}
t['唔哩头条tips_随机抽取卡片'] = { 0xdb3533, "405|3|0xdb3533,172|875|0xf8e71c,184|883|0x000000", 90, 41, 118, 610, 1113}
t['唔哩头条tips_关闭随机抽取卡片'] = {0x5a540a, "11|-3|0x2c2804,2|-13|0xf8e71c,-93|34|0xf8e71c", 90, 188, 1038, 455, 1128}
t['唔哩头条tips_去看看'] = { 0x000000, "-11|-1|0xffffff,-31|-2|0x000000,-270|-10|0x909090,-398|-58|0xffcc33", 90, 87, 587, 550, 726}
t['唔哩头条tips_其他页面'] = { 0x0a7efd, "1|6|0x007aff,8|26|0x007aff,52|21|0x007aff", 90, 17, 42, 96, 105}


function tips()
	if d('唔哩头条tips_去做任务',true) then
	elseif d('唔哩头条tips_随机抽取卡片',true) then
	elseif d('唔哩头条tips_关闭随机抽取卡片',true) then
	elseif d('唔哩头条tips_去看看',true) then
	elseif d('唔哩头条tips_其他页面',true) then
	end	
end


function wulitoutiao()
	local TimeLine_qtt = os.time()
	local outTime_qtt = rd(10,20)*60
	local 签到 = true
	local 签到成功 = false
	local 领取金币 = true
	local 开宝箱一次 = true
	local other_tips = 0
	local 文章_key = 1
	local 返回首页 = false
	
	while os.time() - TimeLine_qtt < outTime_qtt do
		if active(arr.newsbid['唔哩头条'],8) then
			if d('唔哩头条首页界面') then	
				if 签到 then
					click(395,1092)
				elseif 返回首页 then
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(rd(3,5))
					返回首页 = false
				elseif d('唔哩头条首页界面_找到文章',true) then
					文章_key = 1
				else
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(rd(3,5))
				end
			elseif 签到 and d('唔哩头条阅读界面',true) then
			elseif d('唔哩头条阅读界面') then
				if d('唔哩头条阅读界面_视频播放')then
					d('唔哩头条阅读界面',true) 
					返回首页 = true
				else
					d('唔哩头条阅读界面_阅读全文',true)
					文章_key = 文章_key + 1
					if 文章_key < 10 then
						moveTo(width/2,900,width/2,500,rd(15,30))
						delay(rd(3,5))
					elseif 文章_key < 20 then
						moveTo(width/2,300,width/2,600,rd(15,30))		
						delay(rd(1,3))
					else
						d('唔哩头条阅读界面',true) 
						返回首页 = true
					end
				end
			elseif d('唔哩头条任务界面') then	
				if 开宝箱一次 and d('唔哩头条任务界面_开宝箱',true) then
					开宝箱一次 = false
				elseif d('唔哩头条任务界面_签到',true) then
				elseif d('唔哩头条任务界面_任务做完',true) then
					签到 = false
					arr.wulitt={}
					arr.wulitt.money = ocr(72, 98,126, 130)
					arr.wulitt.golds = ocr(555, 90,635, 141)
					api.wulitt()
					click(77,1084)
				end	
			else
				if tips() then
				else
					click(77,1084)
				end
			end
		end
		delay(2)
	end
end



























