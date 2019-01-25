

if t == nil then
	t={}
end
t['东方头条_首页']={ 0xf44b50, "142|-5|0x666666,250|26|0xff4f02,373|-7|0x666666,508|-15|0x666666", 90, 8, 1039, 632, 1133 }
	t['东方头条_首页_新闻_x']={ 0xffffff, "85|2|0xc3c3c3,79|-5|0xc3c3c3,87|-5|0xffffff,92|-5|0xc3c3c3,92|8|0xc3c3c3", 90, 285, 370, 618, 1014}

t['东方头条_文章页面']={{597,1092,0xf7514c}, {546,1086,0xf7524b}, {555,1086,0xffffff}, {200,1109,0xe8e8e8}, }
	t['东方头条_文章页面_生产金币']={ 0xfff159, "4|12|0xe63302", 90, 514, 898, 583, 962}
	t['东方头条_文章页面_点一点']={ 0xfddb00, "2|31|0xff4f41,7|15|0xffb200", 90, 448, 37, 630, 130 } --多点找色
	t['东方头条_文章页面_阅读全文']={ 0x349ce9, "10|14|0x349ce9,-31|-8|0x349ce9", 90, 199, 209, 292, 889}
	t['东方头条_文章页面_播放视频中']={ 0xf24b50, "", 90, 0, 356, 3, 360 } --多点找色
	
t['东方头条_任务界面']={{582,1087,0xf44b50}, {572,1071,0xf44b50}, {572,1064,0xffffff}, {559,1059,0xf44b50}, }
	t['东方头条_任务界面_立即签到']={ 0xf54b50, "-1|-19|0xf54b50,-3|-1|0xfff8f9,24|17|0xf54b50", 90, 442, 307, 565, 346}
	t['东方头条_任务界面_签到成功']={ 0xcccccc, "-57|390|0xfb5446,-359|394|0xfa5347,-289|52|0xfff17a", 90, 82, 289, 555, 787}
	t['东方头条_任务界面_放弃']={{239,615,0x999999}, {356,614,0xf54b50}, {436,447,0xffffff}, }
	t['东方头条_任务界面_金币成熟']={{553,226,0xf76b40}, {555,226,0xffde05}, {559,226,0xf54b50}, {565,224,0xfedb08}, {566,224,0xf54b50}, }
	t['东方头条_任务界面_金币已经领取']={{549,186,0xffffff}, {549,192,0xffd566}, {487,852,0xe7e7e7}, }
	t['东方头条_任务界面_继续赚金币']={ 0xff8f3d, "1|-24|0xff8f3d,-60|-22|0xff8f3d,-18|19|0xff8f3d", 90, 398, 287, 596, 369}
	t['东方头条_任务界面_我知道了']={ 0xf54b50, "129|-21|0xf54b50,-128|-21|0xf54b50,-3|-55|0xf54b50,1|-379|0xffd715", 90, 110, 272, 535, 809 } --多点找色
	t['东方头条_任务界面_金币已经成熟']={ 0xff8f3d, "-200|2|0xff8f3d,-31|-28|0xff8f3d,112|34|0xff8f3d,12|-669|0xffe177", 90, 44, 141, 604, 941 } --多点找色
	t['东方头条_任务界面_关闭金币邀请']={ 0xfffffe, "-228|728|0xf54b50,-415|694|0xf54b50,-39|696|0xf54b50,-236|672|0xf54b50", 90, 49, 128, 589, 946 } --多点找色
	t['东方头条_任务界面_去阅读']={ 0xf54b50, "207|-222|0xffffff,-187|-224|0xffffff,-115|-22|0xf54b50,69|-58|0xf54b50", 90, 101, 399, 539, 684 } --多点找色


t['东方头条_back']={ 0x444444, "-1|-13|0xffffff,-1|-26|0x444444,-14|-14|0x444444", 90, 15, 49, 75, 121}
t['东方头条_弹窗_x']={ 0xdcdcdc, "-146|-180|0xffb01d,154|-177|0xfe7c0c,-16|-351|0xfc4441,1|-259|0xffffff", 90, 94, 273, 550, 1012 } --多点找色
t['东方头条_弹窗_取消']={ 0x007aff, "300|-11|0x007aff,304|-31|0xf9f6f6", 90, 102, 613, 516, 679 } --多点找色
t['东方头条_弹窗_x2']={ 0xdcdcdc, "0|-15|0x4c4c4c,-17|-2|0x4c4c4c,15|-1|0x4c4c4c,1|12|0x4c4c4c", 90, 273, 925, 367, 996 } --多点找色
t['东方头条_弹窗_要闻推送']={ 0xffffff, "-9|-41|0xf44b50,1|-2|0xf44b50,-129|-11|0xffffff,-149|-3|0xf44b50,-156|-40|0xf44b50", 90, 115, 283, 308, 726 } --多点找色
	t['东方头条_弹窗_要闻推送_立即查看']={ 0xf54b50, "2|-1|0xfffafb,22|16|0xf54b50,-51|-7|0xf54b50", 90, 367, 305, 523, 871 } --多点找色

t['东方头条_任务钱包提现消息']={ 0xfe5b62, "144|-11|0xff7700,317|-14|0x03a9ff,476|-18|0xfebb0f", 90, 13, 57, 624, 594 } --多点找色


function 东方头条tips()
	if d('东方头条_back',true) then
		moveTo(width/2,900,width/2,500,rd(15,30))
	elseif d('东方头条_弹窗_x',true) then
	elseif d('东方头条_弹窗_x2',true) then
	elseif d('东方头条_弹窗_取消',true) then
	elseif d('东方头条_弹窗_要闻推送') then
		if d('东方头条_弹窗_要闻推送_立即查看',true)then
			delay(2)
		end
	elseif d('东方头条_任务钱包提现消息') then
		click(596,84)
	else
		return true
	end
end

function dongfangtoutiao()
	local TimeLine_qtt = os.time()
	local outTime_qtt = rd(10,20)*60
	local 签到 = true
	local 签到成功 = false
	local 领取金币 = true
	local other_tips = 0
--	closeX(arr.newsbid['东方头条'])
	delay(2)
	local 文章_key = 1
	dongfang_other = 0
	阅读一次 = false
	
	while (os.time()-TimeLine_qtt < outTime_qtt ) do
		if active(arr.newsbid['东方头条'],8)then
			if d('东方头条_首页')then
				moveTo(width/2,900,width/2,500,rd(15,30))
				delay(3)
				if 阅读一次 and 签到 then
					click(574,1079)
				else
					if 文章_key >= 10 then
						moveTo(width/2,900,width/2,500,rd(15,30))
						delay(rd(3,5))
						文章_key = 1
					elseif d('东方头条_首页_新闻_x',true)then
						文章_key = 1
						delay(3)
					end
				end
			elseif 阅读一次 and 签到 and d('东方头条_文章页面')then
				click( 40,60)
			elseif d('东方头条_文章页面')then
				if(d('东方头条_文章页面_播放视频中')) then
					click( 40,60)
				else
					if rd(1,100)>= 30 then d('东方头条_文章页面_阅读全文',true)	end
					
					文章_key = 文章_key + 1
					if 文章_key < rd(10,15) then
						moveTo(width/2,900,width/2,500,rd(15,30))
						delay(rd(3,5))
					elseif 文章_key >= 45 then
						click( 40,60)
						阅读一次 = true
					else
						moveTo(width/2,300,width/2,600,rd(15,30))
						delay(rd(1,3))
					end
				end

				
	
			elseif d('东方头条_任务界面')then
				if d('东方头条_任务界面_立即签到',true)then
				elseif d('东方头条_任务界面_签到成功',true)then
				elseif d('东方头条_任务界面_放弃',true,1)then
				elseif d('东方头条_任务界面_金币成熟',true,1)then
				elseif d('东方头条_任务界面_金币已经成熟',true,1)then
				elseif d('东方头条_任务界面_金币已经领取',true,1)then
				elseif d('东方头条_任务界面_关闭金币邀请',true,1)then
				elseif d('东方头条_任务界面_去阅读',true,1)then
					阅读一次 = false
				elseif d('东方头条_任务界面_我知道了',true,1)then
				elseif d('东方头条_任务界面_继续赚金币')then
					arr.dftt.golds = ocr(16, 184, 157, 244)
					arr.dftt.money = ocr(168, 136, 256, 164 )
					api.updftt()
					签到 = false
					click(64,1081,3)
				end
			else
				if 东方头条tips()then
					log('-')
					click( 40,60)
					moveTo(width/2,900,width/2,500,rd(15,30))
					文章_key = 1
					
					dongfang_other = dongfang_other + 1
					if dongfang_other%5 == 0 then
						click(319,974)
					end
				end
			end
		end
		delay(2)
	end

end










































