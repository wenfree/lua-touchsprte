

if t == nil then
	t={}
end

t['悦头条_首页_视频_任务_我的']={ 0xfe7800, "163|-2|0xa2a2a2,325|-1|0xa2a2a2,486|7|0xa2a2a2", 90, 15, 1044, 625, 1132}
	t['悦头条_首页_领金币']={ 0xffffff, "22|-19|0xff9800,25|19|0xff9800,27|21|0xfff54f,44|-1|0xff9800", 90, 84, 44, 174, 116}
	t['悦头条_首页_文章横线']={ 0xffffff, "-242|47|0xe8e8e8,-104|47|0xe8e8e8,29|47|0xe8e8e8,110|47|0xe8e8e8,-79|52|0xffffff", 90, 39, 250, 588, 1026}
	
t['悦头条_任务界面']={ 0xffffff, "3|4|0xfe7800,3|-3|0xfe7800,3|-7|0xffffff", 90, 376, 1070, 420, 1090}
	t['悦头条_任务_签到']={ 0xfd8500, "0|3|0xffffff,12|-4|0xffffff,7|-25|0xfd8f00", 90, 213, 376, 435, 455}
	t['悦头条_任务_已经签到']={ 0x999999, "-5|-5|0xffffff,-1|-9|0x999999,-1|-12|0xffffff", 90, 236, 390, 399, 439}
	
t['悦头条_我的_首页_视频_任务']={ 0xfe7800, "-483|11|0xa2a2a2,-321|13|0xa2a2a2,-159|5|0xa2a2a2,-1|2|0xffffff", 80, 15, 1037, 616, 1135 } --多点找色
-------------------------------------------------
t['悦头条_文章面页']={ 0x666666, "96|0|0x666666,477|1|0x666666,556|-13|0x666666,557|-6|0xffffff,557|7|0xffffff,557|14|0x666666", 
			90, 18, 49, 614, 116 }
	t['悦头条_文章面页_没有金币']={ 0xfefc85, "0|-4|0xed3126", 90, 106, 961, 114, 974}
--------------提示----------------
t['悦头条_弹窗_x']={ 0xffffff, "-547|661|0xff7800,-282|619|0xff7800,-286|703|0xff7800,-12|661|0xff7800", 90, 5, 13, 627, 877}
t['悦头条_弹窗_签到成功']={ 0x999999, "-304|48|0xff5340,-332|42|0xffdf58", 90, 70, 98, 566, 266 } --多点找色


function 悦头条tips()
	if d('悦头条_弹窗_x',true) then
	elseif d('悦头条_弹窗_签到成功',true) then
	else
		return true
	end
end

					

function yue_toutiao()
	local TimeLine_qtt = os.time()
	local outTime_qtt = rd(10,20)*60
	local 签到 = true
	local 签到成功 = false
	local 领取金币 = true
	local other_tips = 0
--	closeX(arr.newsbid['悦头条'])
	delay(2)
	local 文章_key = 1
	local 阅读时间 = os.time()
	
	while (os.time()-TimeLine_qtt < outTime_qtt ) do
		if active(arr.newsbid['悦头条'],8)then
			if 签到 and d('悦头条_文章面页',true)then
			elseif d('悦头条_文章面页')then
				if os.time()-阅读时间 >= rd(50,60) then
					d('悦头条_文章面页',true,1)
				elseif not(d('悦头条_文章面页_没有金币'))then
					d('悦头条_文章面页',true,1)
				else
					moveTo(300,900,300,500,rd(10,20))
					delay(rd(3,5))
				end
			elseif 签到 and d('悦头条_首页_视频_任务_我的',true,3)then
					log('准备签到')
			elseif d('悦头条_首页_视频_任务_我的')then
				if d('悦头条_首页_领金币',true,1)then
					
				else
					moveTo(300,900,300,500,rd(10,20))
					moveTo(300,900,300,500,rd(10,20))
					delay(3)
					if d('悦头条_首页_文章横线',true,1)then
						delay(3)
						阅读时间 = os.time()
					end
				end
			elseif d('悦头条_任务界面')then
				if d('悦头条_任务_已经签到')then
					click(557,1094)
					签到 = false
					arr.yuett={}
					arr.yuett.money = ocr(67, 256,203, 311)
					arr.yuett.golds = ocr(480, 258,599, 313)
					api.yuett()
					
				elseif d('悦头条_任务_签到',true)then
				end
			elseif d('悦头条_我的_首页_视频_任务',true,2)then
			else
				if 悦头条tips()then
					log('other')
					click(28,88)
				end
			end
		end
		delay(2)
	end

end










































