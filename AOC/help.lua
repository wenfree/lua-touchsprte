
function backhome()
	if not(UIdata.home)then
		return true
	end
	
	local outTime = os.time()
	while (os.time()-outTime <= 60 ) do
		if active(app,10)then
		elseif UI('在地图中','在地图界面')then
			click(11,370)
		elseif UI_pic('回城','回城展开')then
			delay(2)
			UI_pic('回城','回城展开_技能',true)
		elseif UI_pic('回城','弹窗回城',true)then
			delay(1)
			click(983,499)
			delay(10)
			return true
		else
			click(20,20)
		end
		delay(1)
	end
end


function ad()
	if not(UIdata.ad)then
		return false
	end
	
	local out_time = os.time()
	local doing = 0
	local 发送ad = false

	while (os.time()-out_time < 60*3) do
		if active(app,10)then
		elseif UI('聊天','聊天界面')or UI('聊天','聊天界面2')then
			if UI_pic('聊天','聊天界面_世界频道',true)then
			elseif UI('聊天','聊天界面_世界频道_界面')then
				if UI_pic('聊天','聊天界面_世界频道_界面_发送',true)then
					delay(30)
					return true
				elseif UI_pic('聊天','聊天界面_世界频道_界面_发言位置')then
					click(x+200,y)
					input(UIdata.adTxt)
					click(675,712)
				end
			end
		elseif UI('在地图中','在地图界面')then
			log("准备发广告")
			UI_pic('换服','聊天按钮',true)
		else
			if  UI('返回','返回图标',true,1)then 
			else
				other()
			end
		end
		mSleep(1000)
	end

end


if t == nil then
	t = {}
end

t['主界面']={ 0x9a5300, "-903|639|0x3f5cae,-1033|643|0x917444,-1148|649|0xd8ff22", 90, 0, 0, 1333, 749}
t['主界面_对话框']={ 0xdcdc94, "18|27|0xb4bcb7,25|-15|0xbaba6f,-33|6|0x164850", 90, 126, 156, 230, 256}

t['消息界面_竖']={ 0xe4d38a, "-2|-677|0xe4d38a,1201|-700|0x14494d,1220|3|0x14494d", 90, 6, 1, 1329, 746 } --多点找色
t['消息详情界面_竖']={ 0xe4d38a, "-8|-675|0x14494d,-11|-684|0xe4d38a,1199|-677|0x14494d", 90, 38, 8, 1320, 744 } --多点找色
t['消息详情界面_竖_反击']={ 0x453941, "-4|-26|0xdf5c05,6|-33|0x810d0d,-46|1|0x810d0d", 90, 148, 98, 1210, 644 } --多点找色

t['消息界面']={ 0xe4d38a, "9|-1|0x14494d,-12|701|0x14494d,8|702|0x14494d", 90, 4, 5, 492, 743 } --多点找色
t['消息界面ios11']={ 0xe4d38a, "9|0|0x14494d,-16|700|0x14494d,-3|701|0x14494d", 90, 1, 8, 573, 742 } --多点找色
t['消息详情界面']={ 0xe4d38a, "10|-2|0x14494d,1245|-4|0x14494d,1245|-12|0xe4d38a", 90, 0, 2, 1326, 99 } --多点找色
t['消息详情界面_反击']={ 0x453941, "-6|-9|0xeae2e9,-29|4|0xdf5c05,25|-4|0xdf5c05", 90,0, 0, 1333, 749}

t['弹窗_前往']={ 0xe1993c, "-327|8|0x37bdbd,134|-450|0x861400", 90, 0, 0, 1333, 749 } --多点找色}
t['弹窗_开战']={0x52d13f, "-335|-7|0x25a1bd,19|-127|0xf35150", 90, 337, 206, 1003, 520}
t['弹窗_体力']={ 0x91f244, "-375|-24|0x29a9bd,-42|-27|0x49c744", 90, 344, 450, 995, 553 } --多点找色

t['返回箭头']={0xe6e189, "2|-11|0x326c7a,20|10|0xb1c8ca,3|20|0x389371", 90, 5, 1, 99, 69}
t['返回箭头_世界地图']={ 0x154a51, "12|-10|0xf4f492,14|0|0x11444c", 90, 1237, 667, 1319, 743}
t['返回箭头_世界地图_前往']={ 0x64de3d, "-7|17|0x97f346,-70|-20|0x45ad58,-3|-42|0x36a657,59|-16|0x28a942", 90, 276, 107, 1110, 689}
t['返回箭头_世界地图_城市内']={ 0xeee9d4, "7|6|0xa88d50,-341|-1|0xeee9d4,-340|5|0x95732b", 90, 414, 4, 905, 100}
t['返回箭头_世界地图_城市内_提示']={ 0xd9d8d1, "-21|-8|0xf9f3b9,16|-8|0xfbf4ba,0|10|0xd9d7d0", 90, 0, 0, 1333, 749 } --多点找色
t['返回箭头_世界地图_城市内_攻击']={ 0xf8f8f8, "33|-6|0x5d2320,-67|0|0x7e3f35,19|16|0xd48d2f", 90, 604, 397, 1026, 748}
t['攻城界面'] ={ 0xe6e58d, "-10|6|0x28756f,-18|8|0xf1ed93,-35|10|0x2b7b73", 90, 4, 2, 100, 66}

t['弹窗_公会_攻击']={ 0xdb7b40, "99|-32|0x9b1651,9|36|0xede03d,-78|-33|0xdc605e", 90, 0, 0, 1333, 749 } --多点找色
t['弹窗_公会_攻击_']={ 0xe7bf39, "-330|-1|0x39bfbd,-131|-400|0xc72906", 90, 241, 124, 1148, 690 } --多点找色

function attck()
	if not(UIdata.attck)then
		return false
	end
	local TimeLine = os.time()
	local usedTime = 60*3

	while (os.time()-TimeLine < usedTime) do
		if active(app,5)then
		elseif 在地图界面(false,clickMun,stayTime)then
			click(1170,699)	--点击对话框
		elseif d('消息界面_竖')then
			click(210,86)
		elseif d('消息详情界面_竖')then	
			d('消息详情界面_竖_反击',true)
		elseif d('消息界面') or d('消息界面ios11')then
			click(483,124)--置顶对话
		elseif d('消息详情界面')then	
			if d('消息详情界面_反击',true)then	--反击
				moveTo(500,500,500,200,10)
				delay(1)
			end
		elseif d('返回箭头')then
			if d('返回箭头_世界地图')then
				if d('返回箭头_世界地图_前往',true)then
					delay(5)
				elseif d('返回箭头_世界地图_城市内')then
					delay(1)
					if d('返回箭头_世界地图_城市内_提示')then
						click(x,y+80)
					elseif d('返回箭头_世界地图_城市内_攻击',true)then
						click(868,471) 		-- 攻击的确认按钮
						delay(3)
					else
						d('返回箭头',true)
					end
				end
			else
				d('返回箭头',true)
			end
		elseif d('攻城界面')then
			click(1142,66)	--展开
			预设位置={
				{1045,162,0x0a0c04},
				{1220,166,0x0d0e08},
				{1041,257,0x060c07},
				{1220,252,0xffffff},
				{1048,350,0xdbdbdb},
				{1227,348,0x090c08},
				{1044,442,0x0d0f05},
				{1222,443,0x111609},
				{1044,536,0x0d0f05},
				{1222,536,0x0d0f05},
			} --多点比色

			if UIdata.arm_setting == '11' then
				for i = 1,20 do
					click(1076-math.random(0,3)*117,662)
					d('弹窗_体力',true)
				end
			else
--				click(预设位置[tonumber(UIdata.arm_setting)+1][1],预设位置[tonumber(UIdata.arm_setting)+1][2])
				click(预设位置[tonumber(UIdata.arm_setting)][1],预设位置[tonumber(UIdata.arm_setting)][2])
				delay(3)
			end
			click(1212,661)	--开始 战斗力位置
		else
			if d('弹窗_前往',true,1)then
				delay(2)
			elseif d('弹窗_公会_攻击',true,1)then
			elseif d('弹窗_公会_攻击_',true,1)then
			elseif d('弹窗_开战',true,1)then
				delay(3)
				return awz_re_name("反击成功")
			else
				if other() then
					click(97,33)
				end
			end
		end
		delay(1)
	end
	awz_re_name("反击失败")
end

t['在地图_技能']={ 0x6c6a49, "14|-19|0xf6f694,207|-3|0x22a695", 90, 1, 110, 263, 658 } --多点找色
t['弹窗_技能选择框']={ 0xfaf9ed, "-97|-4|0x051419,-92|-4|0xffffff,-179|-1|0xeae2b9", 90, 249, 95, 1099, 170 } --多点找色
t['弹窗_技能选择框_城门修复']={ 0x85f3f1, "29|-30|0x68ccd1,-9|3|0xe9fffa,-41|-31|0x68c9ce,-35|27|0x66d6dd,-31|23|0x2297c8", 90, 216, 168, 1106, 588 } --多点找色
t['弹窗_技能选择框_使用']={ 0x124d5d, "-75|26|0x3095c0,69|4|0x1470a6", 90, 845, 362, 1113, 591 } --多点找色

function fixWall()
	if not(UIdata.wall)then
		return false
	end
	local TimeLine = os.time()
	local usedTime = 40*1
	while (os.time()-TimeLine < usedTime) do
		if active(app,5)then
		elseif 在地图界面(false,clickMun,stayTime)then
			click(12,371)	--点击左三角
		elseif d('在地图_技能',true)then
		elseif d('弹窗_技能选择框')then	
			if d('弹窗_技能选择框_使用',true)then
				delay(15)
				return awz_re_name("修复成功")
			elseif d('弹窗_技能选择框_城门修复',true)then
			else
				return '没有技能'
			end
		elseif d('返回箭头',true)then
		else
			click(20,20)
			other()
		end
	end
	return awz_re_name("修复超时or不要修复")
end



--[[
function change()
	out_time = os.time()
	doing = 0
	
	while (os.time()-out_time < 90) do
		if active(app,10)then
		elseif UI('换服','在地图上')then
			if UI_pic('地图','王国',true)then
			elseif UI('地图','侧边',true,1)then
			end
		elseif UI('返回','返回图标',false,1)then
			
			
	--		if UI('返回','纯白之帆利萨姆')then
			if UI('返回','银翼之国桑多瑞')then
				if UI_pic('地图','移民按钮',true)then
				else
					return true
				end
			elseif UI('返回','转国界面')then
				click(1236,39)
				--纯白之帆利萨姆 click(1174,115)
				click(1184,446)
			else
				UI('返回','返回图标',true,1)
			end
		elseif UI('other','移民按钮',true,1)then
			doing = doing + 1
			if doing == 2 then
				return true
			end
		else
			other()
		end
		mSleep(1000)
	end
	
end
--]]

t['宝箱_军队']={ 0xebe78d, "-17|0|0x859365,16|0|0x828d60,51|6|0xffffff", 90, 5, 191, 213, 256 } --多点找色
t['返回_军队界面']={ 0xf8d72f, "-245|-2|0x3e4162,-482|-10|0xb4925a", 90, 536, 9, 1311, 97 } --多点找色
t['返回_军队界面_清空']={ 0x102036, "77|-2|0x112136,36|39|0x112137,-1|84|0x102037", 90, 132, 163, 234, 269 } --多点找色
t['返回_兵种详情']={ 0x29abbd, "837|-585|0x34a47f,-243|-469|0x98bcbd", 90, 60, 68, 1284, 743 } --遣散
t['返回_兵种详情2']={ 0x29adbe, "-16|27|0x4ccdb4,233|0|0x57d63c,235|22|0x9ff54b", 90, 115, 607, 555, 713 } --多点找色

t['弹窗_确定遣散']={ 0x41c6b6, "-414|-24|0x299dbe,104|-61|0x0a6a9d", 90, 279, 163, 1079, 555 } --多点找色


function dismiss()
	local TimeLine = os.time()
	local usedTime = 60*5
	while (os.time()-TimeLine < usedTime) do
		if active(app,3)then
		elseif 在地图界面(false,clickMun,stayTime)then
			UI_pic('宝箱','未展开',true)
		elseif UI_pic('宝箱','展开',false)then
			d('宝箱_军队',true)
		elseif UI('返回','返回图标',false,1)then
			if d('返回_军队界面',false,1)then
				if d('返回_军队界面_清空')then
					return '清空军队'
				else
					click(180,275)
				end
			elseif d('返回_兵种详情',true)then
			elseif d('返回_兵种详情2',true)then
			else
				UI('返回','返回图标',true,1)
			end
		elseif d('弹窗_确定遣散')then
			moveTo(366,288,951,288,20)
			delay(0.5)
			d('弹窗_确定遣散',true)
		else
			if other()then
				click(20,20)
			end
		end
		mSleep(500)
	end
	return '解散超时'
end



t['城堡内_万神殿_指引']={ 0x7aff81, "-20|3|0x03f04a,13|14|0x204c57", 90, 473, 430, 558, 507 }
t['返回_万神殿界面']={ 0xece8d4, "355|1|0xece8d4,710|-1|0xffffff,783|-14|0xf2f294", 90, 391, 3, 1317, 89 }
	t['返回_万神殿界面_激活']={ 0x2e6425, "7|17|0xcbe52a,68|-6|0x229b67", 90, 136, 683, 1197, 743 } 
	t['返回_万神殿界面_向上']={ 0xffffff, "-3|25|0xf7f0bb,23|-31|0xd12f1e", 90, 1235, 265, 1331, 548 } --多点找色
	t['返回_万神殿界面_神象']={ 0xb27f0c, "55|-31|0xd2311c", 90, 91, 91, 1229, 206 } 
	t['返回_万神殿界面_向下']={ 0xffffff, "23|31|0xd3311d", 90, 1249, 444, 1330, 555 }
	
t['返回_万神象']={ 0xffffff, "-13|-1|0x889cd4,7|-81|0x3c9a72", 90, 1130, 3, 1331, 160 } --多点找色
	t['返回_万神象_可填']={ 0x239348, "-20|2|0x178957,-1|-23|0x9bcfcc,19|1|0x249448,3|22|0x82c437", 65, 234, 158, 1328, 545 }
	
t['激活神象_确定']={ 0x72e73e, "-3|8|0x8df043,-125|-14|0xe7e2eb,6|-47|0x2b9c52", 90, 734, 597, 1020, 676 } --多点找色
t['弹窗_神石宝库']={ 0xdfffe5, "-320|41|0xffffff,-505|0|0x82a8a7", 90, 166, 61, 1174, 164 } --多点找色
	t['弹窗_神石宝库_选择']={ 0x3bc2bb, "-76|11|0x299ece,74|-59|0x096ca4", 90, 205, 93, 1120, 645 } --多点找色

function Pantheon()
	local 计时 = os.time()
	local 超时 = 60*15
	if UIdata.citySetting.wsd then
		while (os.time()-计时< 超时) do

			if active(app,3)then
			elseif UI('在地图中','在地图界面',true,2)then	
			elseif UI('返回','返回图标',false,1)then
				if d('返回_城堡中') and d('返回_城堡中_右下角对话按钮')then
					if d('城堡内_万神殿_指引',true)then
					else
						return "神殿OK"
					end
				elseif d('返回_万神殿界面')then
					if d('返回_万神殿界面_激活',true)then
					elseif d('返回_万神殿界面_向上',true)then
					elseif d('返回_万神殿界面_神象',true)then
					elseif d('返回_万神殿界面_向下',true)then
					else
						UI('返回','返回图标',true,1)
					end
				elseif d('返回_万神象')then
					local LineTTTTime = os.time()
					local break_key = true
					while (os.time()-LineTTTTime<6) do
						if d('返回_万神象_可填',true)then 
							break_key = false
							break
						end
					end
					if break_key then
						UI('返回','返回图标',true,1)
					end
				else
					UI('返回','返回图标',true,1)
				end
			elseif d('激活神象_确定',true)then
			elseif d('弹窗_神石宝库')then
				if d('弹窗_神石宝库_选择',true)then
				else
					click(278,217)
				end
			else
				if other()then
					click(20,20)
				end
			end
			mSleep(500)
		end
		return "神殿超时"
	end
end





























































