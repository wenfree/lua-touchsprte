require("UI")
nLog('主线功能'..values.game_main)

require("tsp")
require("AWZ")
require("qq")
require("orc")

function done(tables,name,clicks,oder,s)
	oder = oder or 1
	clicks = clicks or false
	s = s or 95
	name = name or '未命名'
	for i,v in ipairs(tables) do
		if isColor(v[1],v[2],v[3],s) then
		else
			return false
		end
	end
	nLog(name..'--------true')
	if  clicks then
		click(tables[oder][1],tables[oder][2])
	end
	return true
end

function updateid()
	GetUrl = 'http://tb1.host.apijs.cc/Public/tlbb/?service=tlbb.updateid&ids='..id..'&usedmun='..usedmun
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(GetUrl);
	nLog(res)
	if code == 200 then
		return true
	end
end

function getid()
	GetUrl = 'http://tb1.host.apijs.cc/Public/tlbb/?service=tlbb.getid'
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(GetUrl);
	nLog(res)
	if code == 200 then
		local json = sz.json
		data = json.decode(res)
		nLog("取身份证成功")
		mSleep(200)
		id = tonumber(data['data']["id"])
		idname = data['data']["idname"]
		idmun = data['data']["idmun"]
		usedmun = data['data']["usedmun"]
		return true
	end
end


app_bid = 'com.tencent.cyoutstlty'
aoc={}

aoc['弹窗']={}
aoc['弹窗']['提示确定']={{656,419,0xe8bc66},{421,419,0xe7bc66},}	--更新
aoc['弹窗']['QQ登录']={{480,548,0xec0d01},{487,549,0xf3f9f9},{456,545,0x43749c},}
aoc['弹窗']['qq界面登录-qq授权界面']={{305,322,0xa9d3f6},{335,323,0xffffff},{175,68,0x1cbdfb},}
	aoc['弹窗']['qq授权界面-授权并登录']={ 0x00aced, "-3|0|0xffffff,-5|0|0x00aced", 90, 844, 5, 1128, 635}
	aoc['弹窗']['授权登录失败']={{679,299,0x101010},{646,314,0xffffff},{418,321,0x1eb9f2},}
aoc['弹窗']['实名注册界面']={{54,37,0x12b7f6},{546,46,0xffffff},{1097,45,0x12b7f6},}
	aoc['弹窗']['姓名']={ 0xc8c8ce, "0|-5|0xffffff,0|-10|0xc7c7cd", 90, 521, 436, 612, 488}
	aoc['弹窗']['选择有效证件']={ 0xc7c7cd, "1|-27|0xc7c7cd", 90, 418, 561, 717, 616}
		aoc['弹窗']['选择有效证件完成']={ 0x0078f9, "-1|-3|0xeff0f2,-1|-7|0x0078f9", 90, 1019, 153, 1126, 215}
	aoc['弹窗']['选择有效身份证']={ 0xd6d6d6, "-252|10|0xc7c7cd,-97|-1|0xffffff,-335|-15|0xc7c7cd", 90, 352, 149, 860, 423}
	aoc['弹窗']['同意勾']={ 0xf5f5f5, "-15|-2|0xb2b7c5,2|-17|0xb2b7c5,18|2|0xb2b7c5,1|16|0xb2b7c5", 90, 344, 203, 466, 633}
	aoc['弹窗']['提交注册']={ 0x3997ee, "0|29|0x3997ee,-4|-77|0x3997ee,-119|-27|0x3997ee", 90, 352, 95, 901, 638}
		aoc['弹窗']['弹窗-注册失败-错误身份证']={ 0x3898ee, "-56|-239|0x000000,-74|-358|0xc6c6c6,-61|-359|0xffffff", 90, 277, 66, 860, 576}
		aoc['弹窗']['弹窗-注册失败-错误身份证']={{642,534,0x3898ee},{586,295,0x000000},{568,176,0xc6c6c6},{581,175,0xffffff},}
	
aoc['弹窗']['登录游戏']={{486,533,0x3898ee},{563,186,0x10b31c},{563,154,0xffffff},}
aoc['弹窗']['主界面进入游戏']={{507,542,0xdea25b},{438,456,0xefedeb},{430,451,0xe70d00},}
aoc['弹窗']['想要打开QQ']={{444,391,0x007aff},{674,390,0x007aff},{755,241,0x000000},}
aoc['弹窗']['当前角色在线_取消']={{432,419,0x7c490c},{674,421,0xfff8d5},{505,542,0xdea35d},{568,188,0xf4ebda},}

aoc['提示']={}
aoc['提示']['系统公告确定']={{540,526,0xe5ab52},{595,526,0xe2a952},{734,70,0x8e3b29},}
aoc['提示']['提示确定']={{590,421,0xe4ac52},{582,195,0x703528},}
aoc['提示']['跳过']={{1089,47,0xd6bb7c},{1090,47,0x9d834e},}
aoc['提示']['游戏方式']={{759,543,0xe5ac52},{371,542,0xe5ac52},{608,71,0x703528},}


aoc['角色创建']={}
aoc['角色创建']['角色创建界面']={{948,589,0xdda05a},{43,41,0xecd592},{1083,500,0xc63535},}
	aoc['角色创建']['男女']={{509,577,0x8cd6ff},{622,578,0xa4b178},}
	aoc['角色创建']['人脸']={{932,84,0xae8e84},{1008,90,0xc4a198},{1080,92,0xd5aca2},{937,165,0xa28c8a},
		{1007,165,0xb69f99},{1086,165,0xfffac8},{935,237,0x212020},{1002,240,0x171110},}
	aoc['角色创建']['头像']={{926,364,0xe4dbd6},{1005,362,0xe9dcd4},{1086,359,0xd2c5c3},
		{929,439,0xe7d3d0},{1002,437,0xeee2dc},{1069,442,0xbb8583},}
aoc['角色创建']['角色选择界面']={{944,588,0xdea15a},{43,41,0xecd592},}
	aoc['角色创建']['角色创建按钮']={ 0xbcb2a8, "1|0|0x6c5b4a,13|-2|0x5b4c37,14|21|0xada992", 90, 98, 233, 140, 561}

aoc['新手过程']={}
aoc['新手过程']['新手界面']={{104,12,0xf5f600},{101,13,0x953006},}
	aoc['新手过程']['蓝色光圈']={{589,565,0x01fc00},{624,565,0xffffff},}
	aoc['新手过程']['攻击位置']={{1044,534,0x8ee7d7},{948,588,0xfcfcf5},{938,501,0xcdf4f9},{1007,437,0x010a0d},{1095,433,0xdaf5f3},}
	aoc['新手过程']['被动手脚']={{536,564,0x00ff00},{536,559,0x00ff00},{502,559,0xffffff},}
aoc['新手过程']['游戏主界面']={{98,17,0xfbd207},{110,16,0xac341e},{214,188,0xfcfbfb},}	
	

aoc['切号']={}
aoc['切号']['菜单']={ 0xfdde6d, "10|0|0xf9de6d,-2|-15|0xffeeaf", 90, 1076, 332, 1111, 365}
aoc['切号']['菜单激活']={{1086,341,0xffffff},{1086,356,0xffffff},{1101,356,0xffffff},}
	aoc['切号']['菜单设置']={ 0xe5ab37, "7|0|0xebad4e,3|-4|0xfbef96,2|7|0x9c5a00,-14|9|0xfad060,-5|-19|0xfff794",
								90, 825, 397, 1128, 628}
	aoc['切号']['更换帐号']={{853,312,0x3c4907},{846,312,0xf8f2cd},{845,313,0x485413},}
	aoc['切号']['切换帐号确定']={{660,421,0xe4ab52},{472,420,0xe7ad52},{583,187,0x703528},}
	aoc['切号']['强化']={ 0x420f0b, "-12|12|0xf6b43d,-8|15|0x8a3b2f,24|14|0xdb7322,23|18|0xfff9ae",
								90, 815, 375, 1132, 630}
	
aoc['游戏']={}
	aoc['游戏']['游戏主界面']={{116,12,0xfc713f},{206,186,0xf3d952},}
		aoc['游戏']['游戏主界面-邮件']={{349,586,0xffefaf},}
		aoc['游戏']['游戏主界面-活动']={{822,30,0xae1713},{825,27,0xf9f9ce},}
		aoc['游戏']['游戏主界面-背包满']={{979,340,0xb10400},{977,340,0xe7ce29},}
			
		--aoc['游戏']['游戏主界面-绝世神功']={{858,301,0xc7921a},{866,305,0xc48c15},{862,360,0xcc9413},}
		aoc['游戏']['游戏主界面-自动战斗中...']={ 0xfdde4a, "0|-9|0xf7dea5,2|-13|0xfbe5bf", 70, 448, 187, 472, 217}
		aoc['游戏']['游戏主界面-副本中']={{1054,218,0x465410},{1052,217,0xfff8d5},{1048,217,0x3d4a08},{1047,216,0xfdf6d3},}
			aoc['游戏']['游戏主界面-自动攻击']={ 0x6f4e39, "3|0|0x6f4e39", 90, 783, 528, 791, 532}
		
		aoc['游戏']['游戏主界面-装备']={ 0x794405, "0|-2|0xfff8d5,4|4|0xe2a74f,8|4|0xfff8d5", 90, 717, 416, 881, 495}
		aoc['游戏']['游戏主界面-装备']={ 0xe3aa50, "0|-23|0xffffd6,3|11|0xdd9842", 90, 714, 419, 867, 487}
		aoc['游戏']['游戏主界面-主线-支线优先']={ 0xffff00, "0|2|0xf3f402,0|4|0xffff00", 90, 17, 260, 36, 273}
			aoc['游戏']['游戏主界面-福利']={ 0xfff17d, "0|-1|0xf06933", 90, 747, 34, 764, 55}
			aoc['游戏']['游戏主界面-支线']={ 0x00ff00, "", 90, 36, 284, 155, 400}
		aoc['游戏']['游戏主界面-主线']={ 0x00ff00, "5|0|0x00ff00", 90, 22, 210, 155, 260}
		
-------------------背包按钮----------
		aoc['游戏']['游戏主界面-背包按钮']={ 0x6a2601, "2|0|0xc46e3c,-6|-6|0xd6c36c", 90, 990, 339, 1025, 365}
-------------------活动开关---------
		aoc['游戏']['游戏主界面-活动开关']={{823,31,0xa01010},{827,31,0xf3e2b5},}
			aoc['游戏']['游戏主界面-每日任务']={ 0x00ff00, "-19|-7|0x05e606,-19|6|0x0fc50f,-1|-6|0x08d909", 90, 5, 215, 27, 400}
		aoc['游戏']['游戏主界面-寻路中']={{458,193,0xeddec6},{458,194,0x271e1c},}
		aoc['游戏']['游戏主界面-正在传送']={{450,458,0xcd2e29},}
		
	aoc['游戏']['游戏弹窗-任务对话']={ 0x9d995f, "-34|0|0x9a945a,-11|0|0x9d9960", 90, 494, 214, 655, 219}
	aoc['游戏']['游戏弹窗-完成任务']={ 0x3c4907, "0|1|0xfaf3cf,2|-1|0xa6b35e", 90, 813, 437, 927, 471}
		aoc['游戏']['游戏弹窗-黑衣人']={{945,239,0xd5c2ac},{244,463,0x381e07},{257,463,0x381e07},}
		
	aoc['游戏']['游戏弹窗-再试一次']={ 0xfff8d5, "0|-2|0x4b5814,3|2|0x404e0b", 90, 430, 291, 623, 391}
	aoc['游戏']['游戏弹窗-物品按钮']={ 0x424f0c, "0|-19|0xf4ef9c,0|21|0x7b8c4a", 90, 467, 302, 612, 404}
	
	aoc['游戏']['游戏弹窗-提交道具']={ 0xfaf0cc, "0|-1|0x764103,4|-5|0xfcf3cf", 90, 520, 471, 612, 510}		--提交道具
	aoc['游戏']['游戏弹窗-擦信']={{646,32,0xffffff},{647,31,0x040404},{727,39,0xffffff},{727,42,0x040704},}
	aoc['游戏']['游戏弹窗-英雄谱-x-一键']={{1062,111,0xfffab3},{806,483,0x895513},{96,65,0x9c4a29},}
	

--------只出现一次的事件
	aoc['游戏']['游戏弹窗-领取宝宝']={{705,509,0xe7ad52},{386,509,0xe7ad52},{904,97,0x634831},}
	aoc['游戏']['游戏弹窗-领取坐骑']={{746,530,0xe5af53},{344,530,0xe6af54},{992,57,0x674a31},}
	aoc['游戏']['游戏弹窗-神器']={{1062,124,0xffffde},{1065,535,0x31a7a5},}
		aoc['游戏']['游戏弹窗-神器-奖励']={ 0xffffff, "-2|0|0xffe575", 90, 406, 450, 1000, 540}
	aoc['游戏']['游戏弹窗-王语嫣']={{404,40,0xffffff},{405,42,0x000000},{374,29,0xe45a1d},{366,38,0xac9762},}
	aoc['游戏']['游戏弹窗-完美找回-找回']={{661,534,0xe5ac52},{476,535,0xe2a952},{608,70,0xf1e9d8},}
	aoc['游戏']['游戏弹窗-数量']={{595,421,0xe4ab52},{581,184,0xf3edde},}
	aoc['游戏']['游戏事件-听雨轩']={{408,40,0x000000},{408,38,0xffffff},{715,38,0xffffff},}
	aoc['游戏']['游戏事件-名动江湖']={{570,542,0xdd9b46},{844,100,0x674a31},}
	

--------弹窗任务各种同一个广告牌  -----------背包弹窗合集
	aoc['游戏']['游戏弹窗-任务牌']={{1084,82,0xfffddc},{1100,25,0xdead63},{62,26,0xdcab61},}
		aoc['游戏']['游戏弹窗-任务牌-福利']={{603,29,0x703528},{602,32,0x9d7465},{601,33,0xf5efde},{599,34,0x703528},}
		
			aoc['游戏']['游戏弹窗-福利-七日']={ 0xb34415, "-65|18|0xf7cd35,70|18|0xf8cd40", 90, 111, 56, 310, 604}
				aoc['游戏']['游戏弹窗-福利-七日-领取']={ 0xe4ac52, "5|0|0xfef6d3,4|0|0x9a631c", 90, 764, 506, 848, 539}

			aoc['游戏']['游戏弹窗-福利-查找找回']={ 0xc3b295, "-2|0|0x381e07,0|-9|0x381e07", 90, 169, 540, 262, 616}
			aoc['游戏']['游戏弹窗-福利-查找找回2']={ 0x381e07, "20|0|0xcab998,31|0|0x381e07", 90, 170, 464, 267, 604}
			aoc['游戏']['游戏弹窗-福利-找回激活']={ 0xe0c8a9, "0|-3|0x70905e,1|-20|0x719262", 90, 338, 510, 354, 552}
				aoc['游戏']['游戏弹窗-福利-找回激活-完美找回']={ 0xfff8d5, "-2|0|0x88520f,-6|-15|0xf4d477", 90, 884, 71, 1034, 490}
				aoc['游戏']['游戏弹窗-福利-找回激活-已经找回']={ 0x1d7e07, "-5|1|0xc6b59a,-8|1|0x1d8007", 90, 894, 79, 938, 141}	
		aoc['游戏']['游戏弹窗-任务牌-活动']={{982,556,0x3c4907},{981,557,0xfff8d4},}
			aoc['游戏']['游戏弹窗-任务牌-活动-活跃']={ 0xffffc2, "0|3|0xffff5b", 90, 148, 486, 925, 591}
			aoc['游戏']['游戏弹窗-任务牌-活动-参加']={ 0xd69a42, "0|15|0x5e3500,0|27|0xf6ee90", 90, 293, 138, 704, 429}
			
		aoc['游戏']['游戏弹窗-任务牌-成就']={{167,83,0xf0c500},{164,79,0xf6d900},{165,77,0x693c09},}
		aoc['游戏']['游戏弹窗-任务牌-称号-属性']={{635,493,0x9aaf65},{459,104,0x914c03},}
		aoc['游戏']['游戏弹窗-任务牌-属性-说明']={{991,564,0x715131},{999,555,0x715231},{613,505,0x5b7952},}
		aoc['游戏']['游戏弹窗-任务牌-强化']={{902,577,0xe3ac51},{706,564,0xf0cc75},{666,35,0x883f25},{673,45,0xefd68d},}
			--click(76,300)
		aoc['游戏']['游戏弹窗-任务牌-熔炼']={{791,582,0xe3a951},{341,216,0x684f27},}
		-----------------------------背包合集
		aoc['游戏']['游戏弹窗-任务牌-好友']={0x4a392b, "113|0|0xb3a191,111|-9|0x4a392b,221|-4|0x4a392c", 90, 126, 545, 455, 605}
			aoc['游戏']['游戏弹窗-任务牌-好友-提示']={{793,199,0x664a31},{567,179,0xb59c82},{328,456,0x4c3921},{326,458,0xbba888},}
		aoc['游戏']['游戏弹窗-邮件界面']={{341,573,0xfff8d5},{741,574,0xfff8d5},{210,558,0xf8d47b},}
			aoc['游戏']['游戏弹窗-邮件提示']={ 0xe2d6b6, "18|-21|0xc30300,18|-14|0xf1ede7", 90, 48, 77, 109, 517}
			aoc['游戏']['游戏弹窗-邮件提示2']={ 0xdacdb0, "17|-10|0xeb1408", 90, 52, 166, 110, 543 }
			aoc['游戏']['游戏弹窗-有邮件']={ 0xfbee94, "8|89|0xfbf392,8|90|0xf0a704", 90, 121, 65, 228, 414}
			aoc['游戏']['游戏弹窗-一键领取']={ 0xfff8d5, "0|-2|0x895513,-6|-11|0xf3ce75", 90, 302, 546, 437, 603}
		aoc['游戏']['游戏弹窗-福利-历练界面']={{900,212,0xcb3410},{667,193,0x2ab6b5},{425,207,0xa9ca41},}
		aoc['游戏']['游戏弹窗-背包-材料激活']={{845,90,0xf7b858},}
			aoc['游戏']['游戏弹窗-背包-材料激活-元宝']={ 0xfaf69d, "0|6|0xf3c810,-3|-22|0xff9f1e,-35|6|0xf18911,34|7|0xf38c14", 
														90, 614, 123, 1019, 467}
			aoc['游戏']['游戏弹窗-背包-材料激活-元宝-使用']={0x495712, "-3|0|0x8a9c4a,-3|-20|0xebe794", 90, 441, 87, 568, 130}
			aoc['游戏']['游戏弹窗-背包-材料激活-元宝-稀世宝图定位']={ 0xc679f5, "-28|-34|0xf8dd5a,-70|-70|0xda98ff,-1|-70|0xdc9aff,-31|-37|0xf3f1b8", 90, 614, 123, 1019, 445}
			
		-----------------------------另一个界面
	aoc['游戏']['游戏弹窗-举牌']={{1081,66,0xfffdb5},{1083,28,0x341804},{1082,28,0xa2301c},{81,122,0xefefe9},}
		aoc['游戏']['游戏弹窗-科举界面']={{150,118,0xd4c2a0},{152,120,0x6b9560},}
		aoc['游戏']['游戏弹窗-商店']={0x6b5242, "-129|0|0xe1b961,-119|-6|0xd6a052", 90, 134, 565, 350, 605}
			aoc['游戏']['游戏弹窗-商店-需求']={ 0xae3221, 
				"25|-23|0xf4d96b,30|-30|0xaa2d1b,35|-35|0xa21e0b", 90, 129, 65, 734, 508}
		aoc['游戏']['游戏弹窗-英雄试炼']={{627,34,0xb6a591},{627,35,0x3f260f},{629,38,0x381e07},{631,38,0xbbab97},}	
	
	-----弹窗商城广告牌---------------
	aoc['游戏']['商城广告牌']={{1086,83,0xffffde},{1094,27,0xd09d63},{1094,28,0xa56731},{579,20,0xfbf4ea},}
	
	aoc['游戏']['弹窗-返回游戏']={{951,595,0xc8c8c8},{937,595,0x383838},{928,596,0xc8c8c8},}
	aoc['游戏']['弹窗-好感度']={{766,509,0xe3a850},{525,474,0x53b531},{241,129,0x91c24e},}
	aoc['游戏']['弹窗-事件-穴位']={{687,33,0xf8f8f8},{688,33,0x020201},{680,42,0x1c1c1c},{680,43,0xffffff},}
	aoc['游戏']['弹窗-商城-x']={{1087,83,0xfffdb5},{587,39,0xffd777},{1087,151,0xb92011},}
	aoc['游戏']['网络失败']={{547,425,0xe1a64d},{592,422,0xe2a952},{582,196,0x773e31},}
	aoc['游戏']['弹窗-熔炼']={{765,541,0xe0a54b},{314,537,0xe3ab52},{992,67,0x674a31},}		--一键放入-熔炼-x
	aoc['游戏']['弹窗-暂不设置']={{410,424,0xe3a54d},{581,193,0x703528},{683,432,0xdc9c47},}
	aoc['游戏']['弹窗-新手选择']={{845,422,0xe4ac54},{233,422,0xe5ad54},{1018,238,0xffef5b},}
	
	--------         其它弹窗事件                  ---------------
aoc['其它']={}
	aoc['其它']['钟灵-张若昀']={{761,431,0xde9f4a},{333,420,0xfff8d5},{333,434,0xdc9a46},}
	aoc['其它']['选择珍兽']={{766,500,0xe5ad51},{432,501,0xe5aa51},{904,96,0x654a31},}


--[[

delay(1)
init('0',1)
for k,v in pairs(aoc)do
	for j,c in pairs(v)do
		if #c < 7 then
			done(c,j)
		end
	end
end
lua_exit()
	
--]]


function play()
	local 时间线 = os.time()
	local 时长 = 5*60* tonumber(values.GameTime)
	init('0',1)
	no_mail = 0
	orcMun = true		--查询背包
	app_bid = 'com.tencent.cyoutstlty'
--	closeX(app_bid)
	gemeTime = os.time()
	UPlvl = true
	changeQQ = true		--是否登录过qq
	roleMun = 1			--初始角色
	角色_未进游戏 = true
	local 角色计时 = os.time()
	local 角色时长 = 60* tonumber(values.GameTime)
	创建完成 = false
	找回key = false
	找回设置 = true
	local 查等级 = true
	优先活动 = false
	角色等级基数 = 1
	熔炼次数 = 1
	找回一次 = true
	清理背包一次 = true
	postTlbb={}
	登录qq按钮卡死 = false
	
	while (os.time()-时间线<时长) do
		if 创建完成 then
			return true
		elseif roleMun > 4 then
			return true
		end
		
		--角色控制系统中
		if values.game_main ~= '0' and os.time() - 角色计时 > 角色时长 then
			roleMun = roleMun + 1
			角色计时 = os.time()
			角色_未进游戏 = true
			orcMun = true
			角色等级基数 = 1			--超时需要换角色 清0角色等级
			清理背包一次 = true
			postTlbb={}
		end
		
		if active(app_bid,5)then
		elseif done(aoc['游戏']['游戏主界面'],'游戏主界面')then
			delay(0.5)

			if 查等级 then
				log('查等级')
				postTlbb.lvl = orc(tlbblvl)
	
				if postTlbb.lvl > 100 then
					postTlbb.lvl = postTlbb.lvl - 100
				end

				log('lvl--'..postTlbb.lvl)
				boxshow('lvl='..postTlbb.lvl,400,0,542,22)
				if postTlbb.lvl >=9 and postTlbb.lvl <= 48 then
					if 找回设置 then
						找回key = true
						log('准备找回')
						找回设置 = false
						click(147,534)
					end
				end
			end
			
			if c_pic(aoc['游戏']['游戏主界面-装备'],'游戏主界面-装备',true)then
				local zbtime = os.time()
				while c_pic(aoc['游戏']['游戏主界面-装备'],'游戏主界面-装备',true) and os.time()-zbtime < 20 do
				end
				orcMun = true

			elseif values.game_main == '0' and 角色_未进游戏 then
				roleMun = roleMun + 1
				logout()
			elseif 角色_未进游戏 then
				log('没有选择角色过程,强制退出',true)
				logout()
				角色_未进游戏 = false
				找回设置 = true
			elseif values.game_main == '2' and done(aoc['游戏']['游戏主界面-邮件'],'游戏主界面-邮件') == false then
				click(336,591)
			elseif true and orcMun then
				UpOrc()
				orcMun = false
			elseif postTlbb.lvl >=40 and 清理背包一次 then
				log("清理一次背包")
				c_pic(aoc['切号']['菜单'],'切号-菜单',true,1)
				c_pic(aoc['切号']['强化'],'强化',true)

			elseif values.game_main == '1' then
				if done(aoc['游戏']['游戏主界面-邮件'],'游戏主界面-邮件') then
					no_mail = no_mail + 1
					if no_mail > 10 then
						roleMun = roleMun + 1
						toast('没有邮件切换角色',1)
						角色_未进游戏 = true
						no_mail = 0
					end
				else
					click(336,591)
				end

			elseif c_pic(aoc['游戏']['游戏主界面-自动战斗中...'],'游戏主界面-自动战斗中...',false)then
				技能位置={{1048,536,0x7fe0db},{947,591,0xffffff},{941,500,0x030405},
					{928,421,0xfcf8e0},{1007,434,0x05050e},{1092,437,0x0a262e},}
				for k,v in ipairs(技能位置)do
					click(v[1],v[2],0.2)
				end
				delay(1)
			elseif done(aoc['游戏']['游戏主界面-副本中'],'游戏主界面-副本中')then
				done(aoc['切号']['菜单激活'],'菜单激活',true,1)
				
				if c_pic(aoc['游戏']['游戏主界面-自动攻击'],'游戏主界面-自动攻击',true)then
				else
					click(788,520) 		--点击挂机
				end
			else
				if 找回key and c_pic(aoc['游戏']['游戏主界面-福利'],'游戏主界面-福利',true)then
					log('查询找回')
				elseif done(aoc['游戏']['游戏主界面-寻路中'],'游戏主界面-寻路中')then
					delay(2)
				elseif done(aoc['游戏']['游戏主界面-正在传送'],'正在传送')then
					delay(2)
				elseif postTlbb.lvl < 16 and c_pic(aoc['游戏']['游戏主界面-每日任务'],'游戏主界面-每日任务',true)then
--				elseif false and 优先活动 and done(aoc['游戏']['游戏主界面-活动开关'],'游戏主界面-活动开关',true,1)then
				elseif postTlbb.lvl < 16 and c_pic(aoc['游戏']['游戏主界面-主线-支线优先'],'游戏主界面-主线-支线优先',false)then
					任务位置={{75,241,0x6f791e},{79,308,0x4a505b},{76,365,0x0af1f1},}
					renwulun = renwulun or 0
					renwulun = renwulun + 1
					click(任务位置[renwulun%3+1][1],任务位置[renwulun%3+1][2],1)
				elseif postTlbb.lvl < 16 and c_pic(aoc['游戏']['游戏主界面-主线'],'游戏主界面-主线',true)then
					delay(2)
				else 
					if postTlbb.lvl < 16 then
						click(84,247)
					elseif postTlbb.lvl == 49 then
						boxshow(postTlbb.lvl..'>=49 休息',400,0,542,22)
						delay(3)
					else
						boxshow(postTlbb.lvl..'>=16 找回即可',400,0,542,22)
						move_line = math.random(1,20)*3.14/10
						offx = math.sin(move_line)*60
						offy = math.cos(move_line)*60
						moveX(144,548,144 + offx ,548 + offy ,math.random(2,3))		--前进
						delay(10)
					end
				end
			end
		else
			gameTip()
		end
		mSleep(1000*0.5)
	end
end

function gameTip()
	--没有主线流程查询
	if c_pic(aoc['游戏']['游戏弹窗-任务对话'],'游戏弹窗-任务对话') and c_pic(aoc['游戏']['游戏弹窗-完成任务'],'游戏弹窗-完成任务',true)then
	elseif done(aoc['游戏']['游戏弹窗-黑衣人'],'游戏弹窗-黑衣人',true,1)then
	else
		--多次出现的任务牌
		if done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌')then		---任务牌合集--好友-邮件
			log('准备找回任务')
			
			if c_pic(aoc['游戏']['游戏弹窗-任务牌-好友'],'游戏弹窗-任务牌-好友')then
				if c_pic(aoc['游戏']['游戏弹窗-邮件提示'],'游戏弹窗-邮件提示',true)then
				elseif c_pic(aoc['游戏']['游戏弹窗-邮件提示2'],'游戏弹窗-邮件提示',true)then
				else
					done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
				end
			elseif done(aoc['游戏']['游戏弹窗-邮件界面'],'游戏弹窗-邮件界面',true,1)then
				done(aoc['游戏']['游戏弹窗-邮件界面'],'游戏弹窗-邮件界面',true,3)
			elseif done(aoc['游戏']['游戏弹窗-科举界面'],'游戏弹窗-科举界面')then
				四个答案={{530,242,0xa3927f},{817,243,0xae9e89},{826,360,0xb3a38e},{537,360,0xa69681},}
				ask_key = math.random(1,4)
				click(四个答案[ask_key][1],四个答案[ask_key][2],2)

			elseif done(aoc['游戏']['游戏弹窗-英雄试炼'],'游戏弹窗-英雄试炼')then
				click(953,577)
			elseif done(aoc['游戏']['游戏弹窗-任务牌-福利'],'游戏弹窗-福利-界面')then
				delay(2)
				--[[
				if c_pic(aoc['游戏']['游戏弹窗-福利-七日'],'游戏弹窗-福利-七日',true,1)then
					local index = 0
					while (c_pic(aoc['游戏']['游戏弹窗-福利-七日-领取'],'七日-领取',true)) do
						index = index + 1
						if index > 7 then
							break
						end
					end
					done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-福利',true)
				--]]
				if c_pic(aoc['游戏']['游戏弹窗-福利-找回激活'],'游戏弹窗-福利-找回激活')then
					if c_pic(aoc['游戏']['游戏弹窗-福利-找回激活-完美找回'],'游戏弹窗-福利-找回激活-完美找回',true,1)then
					elseif c_pic(aoc['游戏']['游戏弹窗-福利-找回激活-已经找回'],'游戏弹窗-福利-找回激活-已经找回')then
						找回key = false
						done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
					else
						找回key = false
						done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
					end
				elseif done(aoc['游戏']['游戏弹窗-福利-历练界面'],'游戏弹窗-福利-历练界面')then
					local 领取三次={{441,513,0xf7f5f5},{677,509,0xe1dfdf},{919,515,0x484747},}
					for i,v in ipairs(领取三次)do
						click(v[1],v[2])
					end
					click(207,504)
				else
					moveTo(209,510,209,300,5)
					if 找回key then
						log('如需要找回 - 强制激活回找回')
						if c_pic(aoc['游戏']['游戏弹窗-福利-查找找回'],'游戏弹窗-福利-查找找回',true)then
						elseif c_pic(aoc['游戏']['游戏弹窗-福利-查找找回2'],'游戏弹窗-福利-查找找回',true)then
						end
					else
						done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
					end
				end
			elseif done(aoc['游戏']['游戏弹窗-任务牌-活动'],'游戏弹窗-任务牌-活动')then
				if c_pic(aoc['游戏']['游戏弹窗-任务牌-活动-活跃'],'游戏弹窗-任务牌-活动-活跃',true)then
				elseif c_pic(aoc['游戏']['游戏弹窗-任务牌-活动-参加'],'游戏弹窗-任务牌-活动-参加',true)then
					delay(2)
					任务位置={{75,241,0x6f791e},{79,308,0x4a505b},{76,365,0x0af1f1},}
					renwulun = renwulun or 0
					renwulun = renwulun + 1
					click(任务位置[renwulun%3+1][1],任务位置[renwulun%3+1][2],1)
				end
			elseif done(aoc['游戏']['游戏弹窗-任务牌-强化'],'游戏弹窗-任务牌-强化')then
				click(76,300)			
			elseif done(aoc['游戏']['游戏弹窗-任务牌-熔炼'],'游戏弹窗-任务牌-熔炼',true)then
				清理背包一次 = false
			elseif c_pic(aoc['游戏']['游戏弹窗-商店'],'游戏弹窗-商店',false)then
				if c_pic(aoc['游戏']['游戏弹窗-商店-需求'],'游戏弹窗-商店-需求',false)then
					click(x+320,y)
				else
					done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
				end
			else
				if done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)then
					moveX(146,546,130,483,3)		--前进
				end
			end
		
		elseif done(aoc['游戏']['游戏弹窗-完美找回-找回'],'游戏弹窗-完美找回-找回',true,1)then		--完美找回
			找回key = false
		elseif done(aoc['游戏']['游戏弹窗-神器'],'游戏弹窗-神器')then
			c_pic(aoc['游戏']['游戏弹窗-神器-奖励'],'游戏弹窗-神器-奖励',true)
			done(aoc['游戏']['游戏弹窗-神器'],'游戏弹窗-神器',true,1)
		elseif done(aoc['游戏']['弹窗-商城-x'],'弹窗-商城-x',true,1)then
		elseif done(aoc['游戏']['游戏弹窗-王语嫣'],'游戏弹窗-王语嫣')then
			moveTo(208,181,521,181,30)
			delay(1)
			moveTo(224,419,488,419,30)
			delay(1)
			moveTo(903,310,657,310,30)
		elseif c_pic(aoc['游戏']['游戏弹窗-再试一次'],'游戏弹窗-再试一次',true)then		--再试一次
		elseif c_pic(aoc['游戏']['游戏弹窗-物品按钮'],'游戏弹窗-物品按钮',true)then		--物品按钮
		elseif c_pic(aoc['游戏']['游戏弹窗-提交道具'],'游戏弹窗-提交道具',true)then		--提交道具
		elseif done(aoc['游戏']['游戏弹窗-英雄谱-x-一键'],'游戏弹窗-英雄谱-x-一键',true,2)then
			done(aoc['游戏']['游戏弹窗-英雄谱-x-一键'],'游戏弹窗-英雄谱-x-一键',true,1)
		elseif done(aoc['游戏']['游戏弹窗-领取宝宝'],'游戏弹窗-领取宝宝',true,1)then
		elseif done(aoc['游戏']['游戏弹窗-领取坐骑'],'游戏弹窗-领取坐骑',true,math.random(1,2))then 	--领宝宝
		elseif done(aoc['游戏']['游戏事件-听雨轩'],'游戏事件-听雨轩')then
			delay(5)
			听轩位置={{693,247,0xdd9200},{560,148,0x57565c},}
			雨的位置={{599,254,0x878884},{278,389,0x223114},}
			moveTo(听轩位置[1][1],听轩位置[1][2],听轩位置[2][1],听轩位置[2][2],3,30)
			moveTo(雨的位置[1][1],雨的位置[1][2],雨的位置[2][1],雨的位置[2][2],3,30)
			
		elseif done(aoc['游戏']['游戏弹窗-数量'],'游戏弹窗-数量')then
			shuliang = shuliang or 1
			shuliang = shuliang + 1
			if shuliang % 2 == 0 then
				done(aoc['游戏']['游戏弹窗-数量'],'游戏弹窗-数量',true,1)
			else
				click(507,375)
			end		
		elseif done(aoc['游戏']['游戏弹窗-擦信'],'游戏弹窗-擦信',false,1)then
			x1,y1,x2,y2 = 250,150,950,150
			for i=1,7 do
				moveTo(x1,y1,x2,y1,10)
				y1 = y1 + 75
			end
			
		elseif done(aoc['游戏']['弹窗-事件-穴位'],'弹窗-事件-穴位')then
			delay(6)
			xueweilun = xueweilun or 1
			xueweilun = xueweilun + 1
			if xueweilun%2 == 0 then
				血位={{641,67},{557,95,0x420e0d},{499,241,0x44110d},{610,225,0x4b1a0f},{550,356,0x420e0d},{562,544,0x4a190d},}
			elseif xueweilun%2 == 1 then
				血位={{387,196,0xd9cda5},{468,199,0x49180e},{547,125,0x4a190d},{644,216,0x420e0d},
				{538,255,0x49180e},{468,340,0x49180e},{558,363,0x4a190d},{682,548,0x49180e},}
			end
			
			for k,v in ipairs(血位)do
				if k == 1 then
					touchDown(1, v[1], v[2])
					mSleep(200)
				elseif k == #血位 then
					touchMove(1, v[1], v[2])
					mSleep(1500)
				else
					touchMove(1, v[1], v[2])
					mSleep(200)
				end
			end
			boxshow('解血位一次',400,0,542,22)
			delay(3)
		
		elseif done(aoc['游戏']['网络失败'],'网络失败',true,1)then
		elseif done(aoc['游戏']['游戏事件-名动江湖'],'名动江湖',true,math.random(1,2))then
		elseif done(aoc['游戏']['弹窗-熔炼'],'弹窗-熔炼',true,1) then
			done(aoc['游戏']['弹窗-熔炼'],'弹窗-熔炼',true,2)
			done(aoc['游戏']['弹窗-暂不设置'],'弹窗-暂不设置',true,1)
			done(aoc['游戏']['弹窗-熔炼'],'弹窗-熔炼',true,2)
			done(aoc['游戏']['弹窗-熔炼'],'弹窗-熔炼',true,3)
			------------------------------------------------------------------
			done(aoc['游戏']['游戏弹窗-任务牌'],'游戏弹窗-任务牌',true,1)
			
		elseif done(aoc['游戏']['游戏弹窗-任务牌-好友-提示'],'游戏弹窗-任务牌-好友-提示',true,1)then
		elseif done(aoc['游戏']['弹窗-返回游戏'],'弹窗-返回游戏',true,1)then
		elseif done(aoc['游戏']['弹窗-好感度'],'弹窗-好感度',true,1)then
			click(53,52)		
		elseif done(aoc['游戏']['商城广告牌'],'商城广告牌',true,1)then
			找回key = false
		elseif done(aoc['其它']['钟灵-张若昀'],'钟灵-张若昀',true,2)then		
		elseif done(aoc['其它']['选择珍兽'],'钟灵-张若昀',true,math.random(1,2))then
		else
			--登录过程
			if tip() then
				if event()then
					if study() then
						log('nothing')
						click(53,52)			--点击头像跳过部分不能过的弹窗
					end
				end
			end
		end
	end
end




function event()
	if done(aoc['弹窗']['当前角色在线_取消'],'当前角色在线_取消',true,1)then
	elseif done(aoc['弹窗']['提示确定'],'提示确定',true,1)then
	elseif 登录qq按钮卡死 and done(aoc['弹窗']['QQ登录'],'弹窗 - QQ登录',false,1)then
		closeApp(app_bid)
		delay(2)
	elseif done(aoc['弹窗']['QQ登录'],'弹窗 - QQ登录',true,1)then
--		登录qq按钮卡死 = true
		delay(8)
		--if done(aoc['弹窗']['qq界面登录-qq授权界面'],'qq界面登录-qq授权界面')then
		if c_pic(aoc['弹窗']['qq授权界面-授权并登录'],'qq授权界面-授权并登录',true)then
			toast('点击授权('..x..","..y..")",1)
			delay(8)
			changeQQ = false
		else
			toast('没有点击授权',1)
			done(aoc['弹窗']['授权登录失败'],'授权登录失败',true)
		end
		
	elseif done(aoc['弹窗']['实名注册界面'],'实名注册界面')then
		getid()
		if c_pic(aoc['弹窗']['姓名'],'姓名',true)then
			input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
			input(idname)
			click(1036,605)		--点击换行
		end
		
		if c_pic(aoc['弹窗']['选择有效证件'],'选择有效证件',true)then
			delay(2)
			c_pic(aoc['弹窗']['选择有效证件完成'],'选择有效证件完成',true)
			delay(2)
		end
		
		moveTo(1010,595,1010,115,5)
		
		if c_pic(aoc['弹窗']['选择有效身份证'],'选择有效身份证',true)then
			input('\b\b\b\b\b\b\b\b\b\b\b\b\b')
			input(idmun)
			click(1036,605)		--点击换行
		end
		
		c_pic(aoc['弹窗']['同意勾'],'同意勾',true)
		if c_pic(aoc['弹窗']['提交注册'],'提交注册',true)then
			delay(5)
		end
	elseif done(aoc['弹窗']['弹窗-注册失败-错误身份证'],'弹窗-注册失败-错误身份证',true,1)then
		closeX(app_bid)
		usedmun = usedmun + 999
		updateid()
	elseif done(aoc['弹窗']['登录游戏'],'登录游戏',true,1)then
		usedmun = usedmun + 1
		updateid()
	elseif done(aoc['弹窗']['想要打开QQ'],'想要打开QQ',true,1)then
	elseif done(aoc['弹窗']['主界面进入游戏'],'主界面进入游戏')then
		if changeQQ then
			click(43,49,2)
		else
			log('准备进入游戏')
			done(aoc['弹窗']['主界面进入游戏'],'主界面进入游戏',true,1)
		end
		
	elseif done(aoc['角色创建']['角色创建界面'],'角色创建界面')then
		setUp()
	elseif done(aoc['角色创建']['角色选择界面'],'角色选择界面')then
		delay(1)
		if roleMun > 4 then
			return true
		elseif c_pic(aoc['角色创建']['角色创建按钮'],'角色创建按钮',true)then
			delay(8)
			角色_未进游戏 = false
			roleMun = roleMun - 1
		else
			if values.game_main ~= '0' then
				--没有创建过帐号, 准备练一下级
				选择角色位置={{116,164,0xe5dbdb},{117,290,0xf3e3d9},{117,407,0x9c907f},{117,530,0x9c9176},}
				log(roleMun)
				click(选择角色位置[roleMun][1],选择角色位置[roleMun][2])
				click(997,587)
				角色_未进游戏 = false
			else
				--创建过帐号,返回完成
				创建完成 = true
				return "创号完成"
			end
		end
	else
		return true
	end
end

function logout()
	nLog('准备退出--------')
	timeLine = os.time()
	logout_time = 45
	while (os.time()-timeLine < logout_time) do
		if c_pic(aoc['切号']['菜单'],'切号-菜单',true,1)then
		elseif done(aoc['切号']['菜单激活'],'菜单激活',false)then
			if not c_pic(aoc['切号']['菜单设置'],'菜单设置',true)then
				done(aoc['切号']['菜单激活'],'菜单激活',true,1)
			end
		elseif done(aoc['切号']['更换帐号'],'更换帐号',true,1)then
		elseif done(aoc['切号']['切换帐号确定'],'切换帐号确定',true,1)then
			delay(14)
			return true
		else
			gameTip()
		end
	end
	closeX(app_bid)
end

function moveX(x,y,x1,y1,n)
	touchDown(1, x, y)
	touchMove(1, x1, y1)
	touchDown(1, x1, y1)
	mSleep(n*1000)
	touchUp(1, x1, y1)
end

function study()
	if done(aoc['新手过程']['新手界面'],'新手界面')then
		if done(aoc['新手过程']['蓝色光圈'],'蓝色光圈')then
			moveX(146,546,149,483,2)		--前进
		elseif done(aoc['新手过程']['被动手脚'],'被动手脚')then
			moveX(146,546,130,483,3)		--前进
		end
		for i,v in ipairs(aoc['新手过程']['攻击位置'])do
			click(v[1],v[2],0.3)
		end
	else
		return true
	end
end

function setUp()
	if done(aoc['角色创建']['角色创建界面'],'角色创建界面')then
		rndKey = math.random(1,2)
		click(aoc['角色创建']['男女'][rndKey][1],aoc['角色创建']['男女'][rndKey][2])
		delay(10)
		rndKey = math.random(1,8)
		click(aoc['角色创建']['人脸'][rndKey][1],aoc['角色创建']['人脸'][rndKey][2])
		rndKey = math.random(1,6)
		click(aoc['角色创建']['头像'][rndKey][1],aoc['角色创建']['头像'][rndKey][2])
		done(aoc['角色创建']['角色创建界面'],'角色创建界面',true,3)
		if done(aoc['角色创建']['角色创建界面'],'角色创建界面',true,1)then
			delay(2)
			if done(aoc['提示']['提示确定'],'提示确定',true,1)then
				click(976,515)
				input(myRand(7,2))
				click(1036,605)		--点击换行
				done(aoc['角色创建']['角色创建界面'],'角色创建界面',true,1)
			end
		end
	end
end

function tip()
	if done(aoc['提示']['系统公告确定'],'系统公告确定',true,1)then
	elseif done(aoc['提示']['提示确定'],'提示确定',true,1)then
	elseif done(aoc['提示']['跳过'],'跳过',true,1)then
	elseif done(aoc['提示']['游戏方式'],'游戏方式',true,1)then
	elseif done(aoc['游戏']['弹窗-新手选择'],'新手选择',true,1)then
	
	else
		return true
	end
end


--[[    
init(0,1)
play()
找回key = false
gameTip()
lua_exit()
--]]

main_path = '/var/mobile/awzdata/com.tencent.cyoutstlty/'
--遍历文件
function getList(path)
    local a = io.popen("ls "..path);
    local f = {};
    for l in a:lines() do
        table.insert(f,l)
    end
    a:close()
    return f
end
list = getList(main_path)	--文件夹例表
son2 = '/Documents/Axp/'
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

function dellTlbb()
	for i,v in pairs(list)do
		all = main_path..v..son2
		nLog(all)
		delFile(all)
	end
end

function main()
	while (true) do
		if qqloging() then
			play()
		end
		awz_next()
		mSleep(1000)
		if values.GameTime == '0' then
			setAirplaneMode(true);    --打开飞行模式
			mSleep(2000)
			setAirplaneMode(false);    --关闭飞行模式
			mSleep(30*1000)
		end
	end
end

---
local ret,errMessage = pcall(main)
if ret then
else
	dialog(errMessage, 0)
	lua_exit()
end








